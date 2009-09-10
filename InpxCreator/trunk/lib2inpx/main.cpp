/* Copyright 2009 Michael Berganovsky

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; version 2 of the License.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA */

#include <precomp.h>

#include <util.h>

using namespace std;
using namespace std::tr1;
using namespace boost::posix_time;
using namespace boost::gregorian;

namespace po = boost::program_options;

#define MAIN_NAME "librusec"

static char* options_pattern[] = {  MAIN_NAME,
                                    "--defaults-file=%s/" MAIN_NAME ".ini",
                                    "--datadir=%s/data",
                                    "--language=%s/language",
                                    "--skip-innodb",
                                    "--key-buffer-size=64M",
                                    NULL };

static bool g_no_import        = false;
static bool g_ignore_dump_date = false;
static bool g_clean_when_done  = false;

enum checking_type
{
   eFileExt = 0,
   eFileType,
   eIgnore
};

static checking_type g_strict  = eFileExt;

enum processing_type
{
   eFB2 = 0,
   eUSR,
   eAll
};

static processing_type g_process = eFB2;

static string sep  = "\x04";

//                    AUTHOR     ;    GENRE     ;     TITLE           ; SERIES ; SERNO ; FILE ;    SIZE   ;  LIBID    ;    DEL   ;    EXT     ;       DATE        ;    LANG    ; LIBRATE  ; KEYWORDS ;
static char* dummy = "dummy:" "\x04" "other:" "\x04" "dummy record" "\x04"   "\x04"  "\x04" "\x04" "1" "\x04" "%d" "\x04" "1" "\x04" "EXT" "\x04" "2000-01-01" "\x04" "en" "\x04" "0" "\x04"     "\x04" "\r\n";

class mysql_connection : boost::noncopyable
{
   enum { num_options = sizeof( options_pattern ) / sizeof( char * ) };

   char* m_options[ num_options ];

   public:

      mysql_connection( const char* module_path ) : m_mysql( NULL )
      {
         if( 0 == m_initialized )
         {
            for( int ni = 0; ni < num_options; ++ni )
            {
               char* pattern = options_pattern[ ni ];
               if( NULL == pattern )
               {
                  m_options[ ni ] = NULL;
                  break;
               }
               char* mem = new char[ MAX_PATH * 2 ] ;
               sprintf( mem, pattern, module_path );
               m_options[ ni ] = mem;
            }
            if( mysql_library_init( num_options - 1, m_options, NULL ) )
               throw runtime_error( "Could not initialize MySQL library" );

            if( NULL == (m_mysql = mysql_init( NULL )) )
               throw runtime_error( "Not enough memory to initialize MySQL library" );

            mysql_options( m_mysql, MYSQL_READ_DEFAULT_GROUP, "embedded" );
            mysql_options( m_mysql, MYSQL_OPT_USE_EMBEDDED_CONNECTION, NULL );
         }
         ++m_initialized;

         if( NULL == mysql_real_connect( m_mysql, NULL, NULL, NULL, NULL, 0, NULL, 0 ) )
            throw runtime_error( tmp_str( "Unable to connect (%d)", mysql_error( m_mysql ) ) );
      }

      ~mysql_connection()
      {
         if( m_initialized > 0 )
         {
            m_initialized--;

            if( NULL != m_mysql )
               mysql_close( m_mysql );

            if( 0 == m_initialized )
            {
               for( int ni = 0; ni < num_options; ++ni )
               {
                  char* pattern = m_options[ ni ];
                  if( NULL == pattern )
                     break;
                  delete[] pattern;
               }
               mysql_library_end();
            }
         }
      }

      operator MYSQL*() const
         { return m_mysql; };

      operator bool() const
         { return NULL != m_mysql; }

      void query( const string& statement ) const
      {
         if( mysql_query( m_mysql, statement.c_str() ) )
            throw runtime_error( tmp_str( "Query error (%d) %s\n%s", mysql_errno( m_mysql ), mysql_error( m_mysql ), statement.c_str() ) );
      }

      void real_query( const char* statement, long length ) const
      {
         if( mysql_real_query( m_mysql, statement, length ) )
            throw runtime_error( tmp_str( "Real query error (%d) %s\n", mysql_errno( m_mysql ), mysql_error( m_mysql ) ) );
      }

   private:

      static
         int m_initialized;

      MYSQL* m_mysql;
};

int mysql_connection::m_initialized = 0;

class mysql_results : boost::noncopyable
{
   public:

      mysql_results( const mysql_connection& mysql ) : m_mysql( mysql ), m_results( NULL )
      {
         m_results = mysql_store_result( m_mysql );
      }

      ~mysql_results()
      {
         if( NULL != m_results )
            mysql_free_result( m_results );
      }

      MYSQL_ROW fetch_row() const
      {
         if( NULL != m_results )
            return mysql_fetch_row( m_results );
         else
            return NULL;
      }

   private:
      const      mysql_connection& m_mysql;
      MYSQL_RES* m_results;

};

const char *separate_file_name( char *buf )
{
char *ptr = buf + strlen( buf );

   while( ptr != buf )
   {
      if( (*ptr == '\\') || (*ptr == '/') )
      {
         *ptr = '\0';
         ptr++;
         break;
      }
      ptr--;
   }
   return ptr;
}

bool is_numeric( const string& str )
{
   for( string::const_iterator it = str.begin(); it != str.end(); ++it )
   {
      if( ! isdigit( *it ) )
         return false;
   }
   return true;
}

bool is_fictionbook( const string& file )
{
   string name = file, ext;
   size_t pos  = name.rfind( "." );

   if( string::npos != pos )
   {
      ext = name.substr( pos + 1 );
      name.erase( pos );
   }

   return ((0 == _stricmp( ext.c_str(), "fb2")) && is_numeric( name ) );
}

bool remove_crlf( string& str )
{
   bool   rc = false;
   size_t pos;

   while( string::npos != (pos = str.find( "\r\n" )) )
   {
      str.replace( pos, 2, string( " " ) );
      rc = true;
   }
   while( string::npos != (pos = str.find( "\n" )) )
   {
      str.erase( pos, 1 );
      rc = true;
   }
   return rc;
}

void clean_directory( const char* path )
{
   _finddata_t fd;
   string      spec( path );

   spec += "*.*";

   auto_ffn dir( _findfirst( spec.c_str(), &fd ) );

   if( ! dir )
      throw runtime_error( tmp_str( "Unable to clean database directory \"%s\"", spec.c_str() ) );

   do
   {
      if( (0 != strcmp( fd.name, ".." )) && (0 != strcmp( fd.name, "." )) )
      {
         string name( path );
         name += fd.name;

         if( 0 != _unlink( name.c_str() ) )
            throw runtime_error( tmp_str( "Unable to delete file \"%s\"", name.c_str() ) );
      }
   }
   while( 0 == _findnext( dir, &fd ) );

   if( 0 != _rmdir( path ) )
      throw runtime_error( tmp_str( "Unable to delete directory \"%s\"", path ) );
}

void prepare_mysql( const char* path )
{
   bool   rc = true;
   string config;

   config = string( path ) + "/librusec.ini";

   if( 0 != _access( config.c_str(), 6 ) )
   {
      ofstream out( config.c_str() );

      if( out )
      {
         out << "[server]"   << endl;
         out << "[embedded]" << endl;
         out << "console"    << endl;
      }
      else
         throw runtime_error( tmp_str( "Unable to open file \"%s\"", config.c_str() ) );
   }

   config = string( path ) + "/data";

   if( 0 != _access( config.c_str(), 6 ) )
   {
      if( 0 != _mkdir( config.c_str() ) )
         throw runtime_error( tmp_str( "Unable to create directory \"%s\"", config.c_str() ) );
   }
}

string get_dump_date( const string& file )
{
   size_t       length;
   string       res, buf;
   ifstream     in( file.c_str() );
   stringstream ss;

   regex dump_date( "^--\\s*Dump\\scompleted\\son\\s(\\d{4}-\\d{2}-\\d{2}).*$" );
   match_results<string::const_iterator> mr;

   if( !in )
      throw runtime_error( tmp_str( "Cannot open file \"%s\"", file.c_str() ) );

   in.seekg( 0, ios::end );
   length = in.tellg();
   in.seekg( max( 0, (int)(length - 300)), ios::beg );

   ss << in.rdbuf();

   if( !in && !in.eof() )
      throw runtime_error( tmp_str( "Problem reading file \"%s\"", file.c_str() ) );

   buf = ss.str();

   if( regex_search( buf, mr, dump_date ) )
      res = mr[ 1 ];

   return res;
}

void get_book_author( const mysql_connection& mysql, const string& book_id, string& author )
{
   MYSQL_ROW record;

   author.erase();

   mysql.query( string( "SELECT `AvtorId` FROM `libavtor` WHERE BookId=" ) + book_id + ";" );

   mysql_results avtor_ids( mysql );

   while( record = avtor_ids.fetch_row() )
   {
      string good_author_id( record[ 0 ] );

      mysql.query( string( "SELECT `GoodId`,`BadId` FROM libavtoraliase WHERE BadId=" ) + good_author_id + ";" );
      {
         mysql_results ids( mysql );

         if( record = ids.fetch_row() )
         {
            if( 0 != strlen( record[ 0 ] ) )
               good_author_id = record[ 0 ];
         }
      }

      mysql.query( string( "SELECT `FirstName`,`MiddleName`,`LastName` FROM libavtorname WHERE AvtorId=" ) + good_author_id + ";" );
      {
         mysql_results avtor_name( mysql );

         if( record = avtor_name.fetch_row() )
         {
            author += record[ 2 ]; author += ",";
            author += record[ 0 ]; author += ",";
            author += record[ 1 ]; author += ":";
         }
      }
   }
   if( author.size() < 4 )
      author = "неизвестный,автор,:";
   else
      remove_crlf( author );
}

void get_book_genres( const mysql_connection& mysql, const string& book_id, string& genres )
{
   MYSQL_ROW  record;

   genres.erase();

   mysql.query( string( "SELECT GenreID FROM libgenre WHERE BookId=" ) + book_id + ";" );

   mysql_results genre_ids( mysql );

   while( record = genre_ids.fetch_row() )
   {
      string genre_id( record[ 0 ] );

      mysql.query( string( "SELECT GenreCode FROM libgenrelist WHERE GenreId=" ) + genre_id + ";" );

      mysql_results genre_code( mysql );

      if( record = genre_code.fetch_row() )
      {
         genres += record[ 0 ];
         genres += ":";
      }
   }

   remove_crlf( genres );

   if( genres.empty() )
      genres = "other:";
}

void get_book_squence( const mysql_connection& mysql, const string& book_id, string& sequence, string& seq_numb )
{
   MYSQL_ROW record;

   sequence.erase();
   seq_numb.erase();

   mysql.query( string( "SELECT `SeqId`,`SeqNumb` FROM libseq WHERE BookId=" ) + book_id + ";" );

   mysql_results seq( mysql );

   if( record = seq.fetch_row() )
   {
      string seq_id( record[ 0] );

      seq_numb = record[ 1 ];

      mysql.query( string( "SELECT SeqName FROM libseqname WHERE SeqId=" ) + seq_id + ";" );

      mysql_results seq_name( mysql );

      if( record = seq_name.fetch_row() )
      {
         sequence += record[ 0 ];
      }
   }

   remove_crlf( sequence );
}

void process_book( const mysql_connection& mysql, MYSQL_ROW record, const string& file_name, const string& ext, string& inp )
{
   inp.erase();

   string book_id      ( record[ 0 ] ),
          book_title   ( record[ 1 ] ),
          book_filesize( record[ 2 ] ),
          book_type    ( record[ 3 ] ),
          book_deleted ( record[ 4 ] ),
          book_time    ( record[ 5 ] ),
          book_lang    ( record[ 6 ] ),
          book_rate    ( record[ 7 ] ),
          book_kwds    ( record[ 8 ] ),
          book_file    ( file_name   );

   string book_author,
          book_genres,
          book_sequence,
          book_sequence_num;

   if( eFileExt == g_strict )
      book_type = ext;

   get_book_author ( mysql, book_id, book_author );
   get_book_genres ( mysql, book_id, book_genres );
   get_book_squence( mysql, book_id, book_sequence, book_sequence_num );

   if( remove_crlf( book_file ) )
      book_file = "";

   remove_crlf( book_title );
   remove_crlf( book_kwds );

   book_time.erase( book_time.find( " " ) ); // Leave date only

   // AUTHOR;GENRE;TITLE;SERIES;SERNO;FILE;SIZE;LIBID;DEL;EXT;DATE;LANG;LIBRATE;KEYWORDS;

   inp  = book_author;
   inp += sep;
   inp += book_genres;
   inp += sep;
   inp += book_title;
   inp += sep;
   inp += book_sequence;
   inp += sep;
   inp += book_sequence_num;
   inp += sep;
   inp += ((eIgnore == g_strict) && (0 != _stricmp( ext.c_str(), book_type.c_str() ))) ? "" : book_file;
   inp += sep;
   inp += book_filesize;
   inp += sep;
   inp += book_id;
   inp += sep;
   inp += book_deleted;
   inp += sep;
   inp += book_type;
   inp += sep;
   inp += book_time;
   inp += sep;
   inp += book_lang;
   inp += sep;
   inp += book_rate;
   inp += sep;
   inp += book_kwds;
   inp += sep;
   inp += "\r\n";
}

void name_to_bookid( const string& file, string& book_id, string& ext )
{
   book_id = file;
   size_t pos = book_id.rfind( "." );
   if( string::npos != pos )
   {
      ext = book_id.substr( pos + 1 );
      book_id.erase( pos );
   }
}

void process_local_archives( const mysql_connection& mysql, const zip& zz, const string& archives_path )
{
   _finddata_t       fd;
   vector< string >  files;
   string            spec( archives_path + "*.zip" );

   auto_ffn archives( _findfirst( spec.c_str(), &fd ) );

   if( ! archives )
      throw runtime_error( tmp_str( "Unable to process archive path (%d) \"%s\"", errno, spec.c_str() ) );

   do
   {
      if( fd.size > 22 )
        files.push_back( fd.name );
   }
   while( 0 == _findnext( archives, &fd ) );

   if( 0 == files.size() )
      throw runtime_error( tmp_str( "No archives are available for processing \"%s\"", archives_path.c_str() ) );

   cout << endl << "Beginning archives processing - " << files.size() << " file(s)" << endl << endl;

   for( vector< string >::const_iterator it = files.begin(); it != files.end(); ++it )
   {
      string name = "\"" + *it  + "\"";
      name.append( max( 0, (int)(25 - name.length()) ), ' ' );

      string out_inp_name( *it );
      out_inp_name.replace( out_inp_name.end() - 3, out_inp_name.end(), string("inp") );

      long       records = 0, dummy_records = 0;
      zip_writer zw( zz, out_inp_name, false );

      cout << "Processing - " << name ;

      timer ftd;
      unzip uz( (archives_path + *it).c_str() );

      for( unsigned int ni = 0; ni < uz.count(); ++ni )
      {
         string inp, book_id, ext, stmt;
         bool fdummy = false;

         if( is_fictionbook( uz.current() ) )
         {
            if( (g_process == eAll) || ((g_process == eFB2)) )
            {
               name_to_bookid( uz.current(), book_id, ext );
               stmt = "SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`keywords` FROM libbook WHERE BookId=" + book_id + ";";
            }
            else
               fdummy = true;
         }
         else
         {
            if( (g_process == eAll) || ((g_process == eUSR)) )
            {
               name_to_bookid( uz.current(), book_id, ext );
               stmt = "SELECT B.BookId, B.Title, B.FileSize, B.FileType, B.Deleted, B.Time, B.Lang, B.N, B.KeyWords FROM libbook B, libfilename F WHERE B.BookId = F.BookID AND F.FileName = \"" + uz.current() + "\";";
            }
            else
               fdummy = true;
         }

         if( ! book_id.empty() )
         {
            MYSQL_ROW record;

            mysql.query( stmt );

            mysql_results book( mysql );

            if( record = book.fetch_row() )
            {
               process_book( mysql, record, book_id, ext, inp );
            }
         }

         if( 0 == inp.size() )
         {
            inp    = tmp_str( dummy, ni + 1 );
            fdummy = true;
         }

         if( fdummy )
            ++dummy_records;
         else
         {
            ++records;

            if( ! zw.is_open() )
               zw.open();

            for( ; dummy_records > 0; dummy_records-- )
               zw( tmp_str( dummy, ni - dummy_records + 1 ) );

            zw( inp );
         }

         if( ni < (uz.count() - 1) )
            uz.move_next();
      }

      zw.close();

      cout << " - done in " << ftd.passed() ;
      if( 0 == records )
         cout << " ==> Not in database!";
      cout << endl;
   }
}

void bookid_to_name( const mysql_connection& mysql, const string& book_id, string& name, string& ext )
{
   MYSQL_ROW record;

   name.erase();
   ext.erase();

   mysql.query( string( "SELECT `BookId`, `FileName` FROM libfilename WHERE BookId =" ) + book_id + ";" );

   mysql_results names( mysql );

   if( record = names.fetch_row() )
   {
      name_to_bookid( record[ 1 ], name, ext );
   }
}

void process_database( const mysql_connection& mysql, const zip& zz )
{
   MYSQL_ROW  record;
   string     sep( "\x04" );

   string stmt, out_inp_name( "online.inp" );

   if( g_process == eAll )
      stmt = "SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`keywords` FROM libbook ORDER BY BookId;";
   else if( g_process == eFB2 )
      stmt = "SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`keywords` FROM libbook WHERE FileType = 'fb2' ORDER BY BookId;";
   else if( g_process = eUSR )
      stmt = "SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`keywords` FROM libbook WHERE FileType != 'fb2' ORDER BY BookId;";

   long       current = 0;
   long       records = 0;
   zip_writer zw( zz, out_inp_name, false );

   cout << endl << "Database processing" << endl;

   timer ftd;

   mysql.query( stmt );

   mysql_results books( mysql );

   while( record = books.fetch_row() )
   {
      if( ++current % 3000 == 0 )
         cout << ".";

      string inp, file_name, ext( "fb2" );

      if( (0 == _stricmp( record[ 3 ], ext.c_str() )) && is_numeric( record[ 0 ] ) )
         file_name = record[ 0 ];
      else
         bookid_to_name( mysql, record[ 0 ], file_name, ext );

      process_book( mysql, record, file_name, ext, inp );

      if( 0 != inp.size() )
      {
         ++records;

         if( ! zw.is_open() )
            zw.open();

         zw( inp );
      }
   }

   cout << endl << current << " records ";

   zw.close();

   cout << "done in " << ftd.passed() << endl;
}

int main( int argc, char *argv[] )
{
   int               rc = 1;

   string            spec, path, inpx, comment, inp_path, archives_path,
                     inpx_name, dump_date, full_date, db_name( "librusec_" );

   _finddata_t       fd;

   const char*       file_name;
   char              module_path[ MAX_PATH + 1 ];

   try
   {
      vector< string > files;
      timer            td;

      ::GetModuleFileName( NULL, module_path, sizeof module_path );

      file_name = separate_file_name( module_path );

      po::options_description options( "options" );
      options.add_options()
         ( "help",                            "Print help message"  )
         ( "ignore-dump-date",                "Ignore date in the dump files, use current UTC date instead" )
         ( "clean-when-done",                 "Remove MYSQL database after processing" )
         ( "process",  po::value< string >(), "What to process - \"fb2\", \"usr\", \"all\" (default: fb2)" )
         ( "strict",   po::value< string >(), "What to put in INPX as file type - \"ext\", \"db\", \"ignore\" (default: ext). ext - use real file extension. db - use file type from database. ignore - ignore files with file extension not equal to file type" )
         ( "no-import",                       "Do not import dumps, just check dump time and use existing database" )
         ( "archives", po::value< string >(), "Path to off-line archives (if not present - entire database in converted for online LibRusEc usage)" )
         ( "inpx",     po::value< string >(), "Full name of output file (default: <dbname>.inpx)" )
         ;

      po::options_description hidden;
      hidden.add_options()
         ( "dump-dir",  po::value< string >() )
         ;

      po::positional_options_description p;
      p.add( "dump-dir", -1 );

      po::options_description cmdline_options;
      cmdline_options.add( options ).add( hidden );

      po::variables_map vm;
      po::store( po::command_line_parser( argc, argv ).options( cmdline_options ).positional( p ).run(), vm );
      po::notify( vm );

      if( vm.count( "help" ) || ! vm.count( "dump-dir" ) )
      {
         cout << endl;
         cout << "Import file (INPX) preparation tool for MyHomeLib 1.5" << endl;
         cout << "Version 2.3 (MYSQL " << MYSQL_SERVER_VERSION << ")" << endl;
         cout << endl;
         cout << "Usage: " << file_name << " [options] <path to SQL dump files>" << endl << endl;
         cout << options << endl;
         rc = 0; goto E_x_i_t;
      }

      if( vm.count( "process" ) )
      {
         string opt = vm[ "process" ].as< string >();
         if( 0 == _stricmp( opt.c_str(), "fb2" ) )
            g_process = eFB2;
         else if( 0 == _stricmp( opt.c_str(), "usr" ) )
            g_process = eUSR;
         else if( 0 == _stricmp( opt.c_str(), "all" ) )
            g_process = eAll;
         else
         {
            cout << endl << "Warning: unknown processing type, assuming FB2 only!" << endl;
            g_process = eFB2;
         }
      }

      if( vm.count( "strict" ) )
      {
         string opt = vm[ "strict" ].as< string >();
         if( 0 == _stricmp( opt.c_str(), "ext" ) )
            g_strict = eFileExt;
         else if( 0 == _stricmp( opt.c_str(), "db" ) )
            g_strict = eFileType;
         else if( 0 == _stricmp( opt.c_str(), "ignore" ) )
            g_strict = eIgnore;
         else
         {
            cout << endl << "Warning: unknown strictness, will use file extensions!" << endl;
            g_strict = eFileExt;
         }
      }

      if( vm.count( "ignore-dump-date" ) )
         g_ignore_dump_date = true;

      if( vm.count( "clean-when-done" ) )
         g_clean_when_done = true;

      if( vm.count( "no-import" ) )
         g_no_import = true;

      if( vm.count( "dump-dir" ) )
         path = vm[ "dump-dir" ].as< string >();

      if( vm.count( "archives" ) )
         archives_path = vm[ "archives" ].as< string >();

      if( ! archives_path.empty() )
      {
         if( 0 != _access( archives_path.c_str(), 6 ) )
            throw runtime_error( tmp_str( "Wrong path to archives \"%s\"", archives_path.c_str() ) );

         normalize_path( archives_path );
      }

      if( 0 != _access( path.c_str(), 6 ) )
            throw runtime_error( tmp_str( "Wrong source path \"%s\"", path.c_str() ) );

      normalize_path( path );

      spec  = path;
      spec += "*.sql";

      {
         auto_ffn dumps( _findfirst( spec.c_str(), &fd ) );

         if( ! dumps )
            throw runtime_error( tmp_str( "Unable to process source path (%d) \"%s\"", errno, spec.c_str() ) );

         do
         {
            files.push_back( fd.name );

            if( ! g_ignore_dump_date )
            {
               if( 0 == dump_date.size() )
               {
                  dump_date = get_dump_date( path + fd.name );
               }
               else
               {
                  string new_dump_date = get_dump_date( path + fd.name );

                  if( dump_date != new_dump_date )
                     throw runtime_error( tmp_str( "Source dump files do not have the same date (%s) \"%s\" (%s)", dump_date.c_str(), fd.name, new_dump_date.c_str() ) );
               }
            }
         }
         while( 0 == _findnext( dumps, &fd ) );
      }

      if( ! g_no_import && (0 == files.size()) )
         throw runtime_error( tmp_str( "No SQL dumps are available for importing \"%s\"", path.c_str() ) );

      full_date = (0 == dump_date.size()) ? to_iso_extended_string( date( day_clock::universal_day() ) ) : dump_date ;
      dump_date = full_date;

      dump_date.erase( 4, 1 );
      dump_date.erase( 6, 1 );

      inpx_name = db_name;
      db_name  += dump_date ;

      if( g_process == eUSR )
         inpx_name += "usr_" + dump_date;
      else if( g_process == eAll )
         inpx_name += "all_" + dump_date;
      else
         inpx_name += dump_date;

      normalize_path( module_path );
      prepare_mysql ( module_path );

      if( vm.count( "inpx" ) )
         inpx = vm[ "inpx" ].as< string >();
      else
      {
         inpx  = module_path;
         inpx += "/data/";
         inpx += inpx_name;
         inpx += ".inpx";
      }

      {
         mysql_connection mysql( module_path );

         if( ! g_no_import )
            cout << endl << "Creating MYSQL database \"" << db_name << "\"" << endl << endl;

         mysql.query( string( "CREATE DATABASE IF NOT EXISTS " + db_name + " CHARACTER SET=utf8;" ) );
         mysql.query( string( "USE " ) + db_name + ";" );
         mysql.query( string( "SET NAMES 'utf8';" ) );

         for( vector< string >::const_iterator it = files.begin(); (it != files.end()) && (! g_no_import) ; ++it )
         {
            string name = "\"" + *it  + "\"";
            name.append( max( 0, (int)(25 - name.length()) ), ' ' );

            cout << "Importing - " << name ;

            timer    ftd;

            string   buf, line;
            ifstream in( (path + *it).c_str() );
            regex    sl_comment( "^(--|#).*" );

            if( !in )
               throw runtime_error( tmp_str( "Cannot open file \"%s\"", (*it).c_str() ) );

            getline( in, buf );
            while( in )
            {
               if( 0 != buf.size() )
               {
                  size_t pos = buf.find_first_not_of( " \t" );
                  if( pos != 0 )
                     buf.erase( 0, pos );

                  if( ! regex_match( buf, sl_comment ) )
                  {
                     pos = buf.rfind( ';' );
                     if( pos == string::npos )
                     {
                        line += buf;
                        buf.erase();
                        goto C_o_n_t;
                     }
                     else
                     {
                        line += buf.substr( 0, pos + 1 );
                        buf.erase( 0, pos + 1 );
                     }

                     mysql.real_query( line.c_str(), (int)line.size() );

                     line = buf;
                  }
               }
      C_o_n_t: getline( in, buf );
            }

            cout << " - done in " << ftd.passed() << endl;
         }

         if( g_process == eFB2 )
            comment = utf8_to_ANSI( tmp_str( "lib.rus.ec FB2 - %s\r\n%s\r\n0\r\nАрхивы библиотеки lib.rus.ec (FB2) %s", full_date.c_str(), inpx_name.c_str(), full_date.c_str() ) );
         else if( g_process == eUSR )
            comment = utf8_to_ANSI( tmp_str( "lib.rus.ec USR - %s\r\n%s\r\n65537\r\nАрхивы библиотеки lib.rus.ec (не-FB2) %s", full_date.c_str(), inpx_name.c_str(), full_date.c_str() ) );
         else if( g_process == eAll )
            comment = utf8_to_ANSI( tmp_str( "lib.rus.ec ALL - %s\r\n%s\r\n1\r\nАрхивы библиотеки lib.rus.ec (все) %s", full_date.c_str(), inpx_name.c_str(), full_date.c_str() ) );

         zip zz( inpx, comment );

         if( ! archives_path.empty() ) process_local_archives( mysql, zz, archives_path );
         else                          process_database      ( mysql, zz                );

         {
            zip_writer zw( zz, "structure.info" );
            zw( "AUTHOR;GENRE;TITLE;SERIES;SERNO;FILE;SIZE;LIBID;DEL;EXT;DATE;LANG;LIBRATE;KEYWORDS;" );
            zw.close();
         }
         {
            zip_writer zw( zz, "version.info" );
            zw( dump_date + "\r\n" );
            zw.close();
         }

         zz.close();

         cout << endl << "Complete processing took " << td.passed() << endl;
      }

      if( g_clean_when_done )
      {
         string db_dir( module_path ); db_dir += "/data/"; db_dir += db_name; db_dir += "/";
         clean_directory( db_dir.c_str() );
      }

      rc = 0;
   }
   catch( exception& e )
   {
      cerr << endl << endl << "***ERROR: " << e.what() << endl;
   }

E_x_i_t:

   return rc;
}
