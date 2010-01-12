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

#define STARTING_SIZE 0x400
#define ENDING_SIZE   0x10000

using namespace std;

void normalize_path( string& path, bool trailing )
{
   for( string::iterator it = path.begin(); it != path.end(); ++it )
   {
      if( *it == '\\' )
         *it = '/';
   }
   if( trailing )
   {
      if( *(path.end() - 1) != '/' )
         path += '/';
   }
}

void normalize_path( char* path )
{
   for( int ni = 0; ni < strlen( path ); ++ni )
   {
      if( path[ ni ] == '\\' )
         path[ ni ] = '/';
   }
}

wstring utf8_to_ucs2( const char* ptr )
{
   size_t len = MultiByteToWideChar( CP_UTF8, 0, ptr, -1, NULL, NULL );

   auto_ptr< wchar_t > buf( new wchar_t[ len + 1 ] );

   ::MultiByteToWideChar( CP_UTF8, 0, ptr, -1, buf.get(), (int)len );

   buf.get()[ len ] = L'\0';

   return wstring( buf.get() );
}

string utf8_to_ANSI( const char* ptr )
{
   size_t len = MultiByteToWideChar( CP_UTF8, 0, ptr, -1, NULL, NULL );

   auto_ptr< wchar_t > buf( new wchar_t[ len + 1 ] );

   ::MultiByteToWideChar( CP_UTF8, 0, ptr, -1, buf.get(), (int)len );

   buf.get()[ len ] = L'\0';

   len = ::WideCharToMultiByte( CP_ACP, 0, buf.get(), -1, NULL, NULL, NULL, NULL );

   auto_ptr< char > buf2( new char[ len + 1 ] );

   ::WideCharToMultiByte( CP_ACP, 0, buf.get(), -1, buf2.get(), (int)len, NULL, NULL );

   buf2.get()[ len ] = L'\0';

   return string( buf2.get() );
}

string utf8_to_OEM( const char* ptr )
{
   size_t len = MultiByteToWideChar( CP_UTF8, 0, ptr, -1, NULL, NULL );

   auto_ptr< wchar_t > buf( new wchar_t[ len + 1 ] );

   ::MultiByteToWideChar( CP_UTF8, 0, ptr, -1, buf.get(), (int)len );

   buf.get()[ len ] = L'\0';

   len = ::WideCharToMultiByte( CP_OEMCP, 0, buf.get(), -1, NULL, NULL, NULL, NULL );

   auto_ptr< char > buf2( new char[ len + 1 ] );

   ::WideCharToMultiByte( CP_OEMCP, 0, buf.get(), -1, buf2.get(), (int)len, NULL, NULL );

   buf2.get()[ len ] = L'\0';

   return string( buf2.get() );
}

void split( vector< string >& result, const char *str, const char *delim, bool combine_delimiters )
{
   result.clear();

   if( NULL == str  ||  '\0' == *str )
   {
      goto E_x_i_t;
   }

   if( NULL == delim  ||  '\0' == *delim )
   {
      result.push_back( str );
      goto E_x_i_t;
   }

   if( combine_delimiters )
   {
      size_t size = strlen( str ) + 1;
      boost::scoped_array< char > buffer( new char[ size ] );

      strcpy_s( buffer.get(), size, str );

      char *ctx;
      char *ptr = strtok_s( buffer.get(), delim, &ctx );

      while( NULL != ptr )
      {
         result.push_back( ptr );
         ptr = strtok_s( NULL, delim, &ctx );
      }
   }
   else
   {
      const char *ptr  = str,
                 *ptr1 = strpbrk( ptr, delim );

      while( NULL != ptr1 )
      {
         result.push_back( string( ptr, ptr1-ptr ) );
         ptr = ptr1 + 1;
         ptr1 = strpbrk( ptr, delim );
      }

      result.push_back( ptr );
   }

E_x_i_t:
   ;
}

tmp_str::tmp_str( const char *format, ... )
{
int     ni   = -1;
va_list marker;

   va_start( marker, format );
   for( int size = STARTING_SIZE; size <= ENDING_SIZE; size *= 2  )
   {
      auto_ptr< char > buf( new char[ size + 1 ] );
      ni = _vsnprintf( buf.get(), size, format, marker );
      if( -1 != ni  )
      {
         assign( buf.get(), ni );
         break;
      }
   }
   va_end( marker );
}

bool zip::m_func_set = false;
zlib_filefunc_def zip::m_ffunc;

bool unzip::m_func_set = false;
zlib_filefunc_def unzip::m_ffunc;

