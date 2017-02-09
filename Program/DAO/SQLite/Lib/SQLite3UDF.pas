(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov    nrymanov@gmail.com
  * Created             07.09.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit SQLite3UDF;

interface

uses
  System.Sqlite;

function SystemCollate(Userdta: Pointer; Buf1Len: Integer; Buf1: Pointer; Buf2Len: Integer; Buf2: Pointer): Integer; cdecl;
function SystemCollateNoCase(Userdta: Pointer; Buf1Len: Integer; Buf1: Pointer; Buf2Len: Integer; Buf2: Pointer): Integer; cdecl;
procedure SystemUpperString(Context: sqlite3_context; Num: Integer; out Value: sqlite3_value); cdecl;
procedure SystemLowerString(Context: sqlite3_context; Num: Integer; out Value: sqlite3_value); cdecl;

implementation

uses
  Windows,
  Character;

function SystemCollate(Userdta: Pointer; Buf1Len: Integer; Buf1: Pointer; Buf2Len: Integer; Buf2: Pointer): Integer; cdecl;
begin
  Result := CompareStringW(
    LOCALE_USER_DEFAULT,
    0,
    PWideChar(Buf1), Buf1Len div SizeOf(WideChar),
    PWideChar(Buf2), Buf2Len div SizeOf(WideChar)
  ) - CSTR_EQUAL;
end;

function SystemCollateNoCase(Userdta: Pointer; Buf1Len: Integer; Buf1: Pointer; Buf2Len: Integer; Buf2: Pointer): Integer; cdecl;
begin
  Result := CompareStringW(
    LOCALE_USER_DEFAULT,
    NORM_IGNORECASE,
    PWideChar(Buf1), Buf1Len div SizeOf(WideChar),
    PWideChar(Buf2), Buf2Len div SizeOf(WideChar)
  ) - CSTR_EQUAL;
end;

procedure SystemUpperString(Context: sqlite3_context; Num: Integer; out Value: sqlite3_value); cdecl;
var
  s: string;
begin
  s := SQLite3_Value_text16(Value);
  SQLite3_Result_Text16(Context, PWideChar(TCharacter.ToUpper(s)), -1, TResultDestructor(SQLITE_TRANSIENT));
end;

procedure SystemLowerString(Context: sqlite3_context; Num: Integer; out Value: sqlite3_value); cdecl;
var
  s: string;
begin
  s := SQLite3_Value_text16(Value);
  SQLite3_Result_Text16(Context, PWideChar(TCharacter.ToLower(s)), -1, TResultDestructor(SQLITE_TRANSIENT));
end;

end.
