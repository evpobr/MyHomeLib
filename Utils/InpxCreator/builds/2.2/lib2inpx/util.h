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

#ifndef   __IMPORT_UTIL_H__
#define   __IMPORT_UTIL_H__

#include <string>

void normalize_path( std::string& path, bool trailing = true );
void normalize_path( char* path );

std::wstring utf8_to_ucs2( const char* ptr );
std::string  utf8_to_ANSI( const char* ptr );
std::string  utf8_to_OEM( const char* ptr );

class tmp_str : public std::string
{
   public:

      tmp_str( const char *format, ... );

      operator LPCSTR() const
         { return c_str(); }
};

class auto_ffn : boost::noncopyable
{
   public:
      auto_ffn( intptr_t handle ) : m_handle( handle )
         {}
      ~auto_ffn()
         { if( -1 != m_handle ) _findclose( m_handle ); }
      operator bool() const
         { return -1 != m_handle; }
      operator intptr_t() const
         { return m_handle; }
   private:
      intptr_t m_handle;
};

class timer
{
   public:
      timer() : m_start( boost::posix_time::second_clock::local_time() )
         {}
      ~timer()
         {}

      std::string passed()
      {
         return boost::posix_time::to_simple_string( boost::posix_time::time_duration( boost::posix_time::second_clock::local_time() - m_start ) );
      }

   private:
      boost::posix_time::ptime m_start;
};

class zip : boost::noncopyable
{
   friend class zip_writer;

   public:

      zip( const std::string& name, const std::string& comment = std::string() ) : m_comment( comment ), m_opened( false ), m_name( name ), m_zf( NULL )
      {
         if( ! m_func_set )
         {
            m_func_set = true;
            fill_win32_filefunc( &m_ffunc );
         }

         if( NULL == (m_zf = zipOpen2( m_name.c_str(), 0, NULL, &m_ffunc )) )
         {
            throw std::runtime_error( tmp_str( "Unable to create archive zipOpen2(\"%s\")", m_name.c_str() ) );
         }
         m_opened = true;
      }

      void close( bool do_not_throw = false )
      {
         if( m_opened )
         {
            m_opened = false;

            const char* pc = m_comment.empty() ? NULL : m_comment.c_str();

            if( ZIP_OK != zipClose( m_zf, pc ) )
            {
               if( ! do_not_throw )
                  throw std::runtime_error( tmp_str( "Unable to close archive zipClose(\"%s\")", m_name.c_str() ) );
           }
         }
      }

      ~zip()
         { close( true ); }

      static zlib_filefunc_def* ffunc()
         { return &m_ffunc; }

   private:

      bool         m_opened;
      std::string  m_name;
      std::string  m_comment;
      zipFile      m_zf;

      static bool              m_func_set;
      static zlib_filefunc_def m_ffunc;
};

class zip_writer : boost::noncopyable
{
   public:

      zip_writer( const zip& zip, const std::string& name, bool auto_open = true ) : m_opened( false  ),
                                                                                     m_ziperr( ZIP_OK ),
                                                                                     m_zip   ( zip    ),
                                                                                     m_name  ( name   )
      {
         m_zi.tmz_date.tm_sec = m_zi.tmz_date.tm_min = m_zi.tmz_date.tm_hour = m_zi.tmz_date.tm_mday = m_zi.tmz_date.tm_mon = m_zi.tmz_date.tm_year = 0;
         m_zi.dosDate         = 0;
         m_zi.internal_fa     = 0;
         m_zi.external_fa     = 0;

         filetime( &m_zi.dosDate );

         if( auto_open ) open();
      }

      void open()
      {
         if( ! m_opened )
         {
            if( ZIP_OK != (m_ziperr = zipOpenNewFileInZip3( m_zip.m_zf, m_name.c_str(), &m_zi, NULL, 0, NULL, 0, NULL, Z_DEFLATED,
                                                            9, 0, -MAX_WBITS, DEF_MEM_LEVEL, Z_DEFAULT_STRATEGY, NULL, 0 )) )
            {
               throw std::runtime_error( tmp_str("Error writing to INPX zipOpenNewFileInZip3(%d) \"%s\"", m_ziperr, m_name.c_str()) );
            }
            m_opened = true;
         }
      }

      void close( bool do_not_throw = false )
      {
         if( m_opened )
         {
            m_opened = false;

            if( ZIP_OK != (m_ziperr = zipCloseFileInZip( m_zip.m_zf )) )
            {
               if( ! do_not_throw )
                  throw std::runtime_error( tmp_str( "Error writing to INPX zipCloseFileInZip(%d) \"%s\"", m_ziperr, m_name.c_str() ) );
            }
         }
      }

      ~zip_writer()
         { close( true ); }

      bool is_open() const
         { return m_opened; }

      operator bool() const
         { return m_ziperr == ZIP_OK; }

      void operator()( const std::string& buf )
      {
         if( ZIP_OK != (m_ziperr = zipWriteInFileInZip( m_zip.m_zf, buf.c_str(), (int)buf.size() )) )
         {
            throw std::runtime_error(  tmp_str( "Error writing to INPX zipWriteInFileInZip(%d) \"%s\"", m_ziperr, m_name.c_str() ) );
         }
      }

   private:

      void filetime( DWORD* pdt )
      {
         SYSTEMTIME st;
         FILETIME   ft;

         GetSystemTime( &st );
         SystemTimeToFileTime( &st, &ft );
         FileTimeToDosDateTime( &ft, ((LPWORD)pdt)+1, ((LPWORD)pdt)+0 );
      }

      bool         m_opened;
      int          m_ziperr;
      std::string  m_name;
      const zip&   m_zip;
      zip_fileinfo m_zi;
};

class unzip : boost::noncopyable
{
   public:

      unzip( const std::string& name ) : m_opened( false), m_name( name ), m_uf( NULL )
      {
         if( ! m_func_set )
         {
            m_func_set = true;
            fill_win32_filefunc( &m_ffunc );
         }

         if( NULL == (m_uf = unzOpen2( m_name.c_str(), &m_ffunc )) )
            throw std::runtime_error( tmp_str( "Unable to open archive unzOpen2(\"%s\")", m_name.c_str() ) );

         int zip_err = unzGetGlobalInfo( m_uf, &m_gi );

         if( UNZ_OK != zip_err )
            throw std::runtime_error( tmp_str( "Problem processing archive unzGetGlobalInfo(%d) \"%s\"", zip_err, m_name.c_str() ) );

         m_opened = true;
      }

      void close()
      {
         if( m_opened )
         {
            m_opened = false;

            unzCloseCurrentFile( m_uf );
         }
      }

      ~unzip()
         { close(); }

      unsigned int count() const
         { return m_gi.number_entry; }

      std::string current()
      {
         char name_inzip[ MAX_PATH + 1 ];

         int zip_err = unzGetCurrentFileInfo( m_uf, &m_fi, name_inzip, sizeof( name_inzip ) - 1, NULL, 0, NULL, 0 );

         if( UNZ_OK != zip_err )
            throw std::runtime_error( tmp_str( "Problem processing archive unzGetCurrentFileInfo(%d) \"%s\"", zip_err, m_name.c_str() ) );

         return std::string( name_inzip );
      }

      void move_next()
      {
         int zip_err = unzGoToNextFile( m_uf );
         if( UNZ_OK != zip_err )
            throw std::runtime_error( tmp_str( "Problem processing archive unzGoToNextFile(%d) \"%s\"", zip_err, m_name.c_str() ) );
      }

      static zlib_filefunc_def* ffunc()
         { return &m_ffunc; }

      bool is_open() const
         { return m_opened; }

   private:

      bool            m_opened;
      std::string     m_name;
      unzFile         m_uf;
      unz_global_info m_gi;
      unz_file_info   m_fi;

      static bool              m_func_set;
      static zlib_filefunc_def m_ffunc;
};


#endif // __IMPORT_UTIL_H__
