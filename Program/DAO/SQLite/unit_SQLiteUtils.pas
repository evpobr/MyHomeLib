(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           eg
  *                     Nick Rymanov    nrymanov@gmail.com
  * Created             04.09.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_SQLiteUtils;

interface

uses
  Classes;

  function ReadResourceAsStringList(const ResourceName: string): TStringList;

  function SQLiteErrorStr(SQLiteErrorCode: Integer): string;

implementation

uses
  Windows,
  unit_Consts,
  SysUtils,
  StrUtils,
  System.Sqlite;

const
  SQL_COMMENT = '--';
  SCRIPT_NEXT = SQL_COMMENT + '@@';

//
// Read provided resource file as a string list (split by '--@@')
// This is done as ExecSQL works with only one statement at a time
//
function ReadResourceAsStringList(const ResourceName: string): TStringList;
var
  rStream: TStream;
  rScript: TStringList;
  i: Integer;
  strStatement: string;
begin
  Result := TStringList.Create;
  try
    rStream := TResourceStream.Create(HInstance, ResourceName, RT_RCDATA);
    try
      rScript := TStringList.Create;
      try
        rScript.LoadFromStream(rStream);

        strStatement := '';
        for i := 0 to rScript.Count - 1 do
        begin
          //
          // Пропустим пустые строки
          //
          if Trim(rScript[i]) = '' then
            Continue;

          //
          // Нашли конец команды. Запомним и начнем следующий цикл.
          //
          if StartsText(SCRIPT_NEXT, rScript[i]) then
          begin
            if strStatement <> '' then
              Result.Add(strStatement);
            strStatement := '';
            Continue;
          end;

          //
          // Пропустим коментарии
          //
          if StartsText(SQL_COMMENT, TrimLeft(rScript[i])) then
            Continue;

          strStatement := strStatement + rScript[i] + CRLF;
        end;

        //
        // Последняя команда может не иметь маркера завершения.
        //
        if strStatement <> '' then
          Result.Add(strStatement);
      finally
        rScript.Free;
      end;
    finally
      rStream.Free;
    end;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function SQLiteErrorStr(SQLiteErrorCode: Integer): String;
begin
  case SQLiteErrorCode of
    SQLITE_OK: Result := 'Successful result';
    SQLITE_ERROR: Result := 'SQL error or missing database';
    SQLITE_INTERNAL: Result := 'An internal logic error in SQLite';
    SQLITE_PERM: Result := 'Access permission denied';
    SQLITE_ABORT: Result := 'Callback routine requested an abort';
    SQLITE_BUSY: Result := 'The database file is locked';
    SQLITE_LOCKED: Result := 'A table in the database is locked';
    SQLITE_NOMEM: Result := 'A malloc() failed';
    SQLITE_READONLY: Result := 'Attempt to write a readonly database';
    SQLITE_INTERRUPT: Result := 'Operation terminated by sqlite3_interrupt()';
    SQLITE_IOERR: Result := 'Some kind of disk I/O error occurred';
    SQLITE_CORRUPT: Result := 'The database disk image is malformed';
    SQLITE_NOTFOUND: Result := '(Internal Only) Table or record not found';
    SQLITE_FULL: Result := 'Insertion failed because database is full';
    SQLITE_CANTOPEN: Result := 'Unable to open the database file';
    SQLITE_PROTOCOL: Result := 'Database lock protocol error';
    SQLITE_EMPTY: Result := 'Database is empty';
    SQLITE_SCHEMA: Result := 'The database schema changed';
    SQLITE_TOOBIG: Result := 'Too much data for one row of a table';
    SQLITE_CONSTRAINT: Result := 'Abort due to contraint violation';
    SQLITE_MISMATCH: Result := 'Data type mismatch';
    SQLITE_MISUSE: Result := 'Library used incorrectly';
    SQLITE_NOLFS: Result := 'Uses OS features not supported on host';
    SQLITE_AUTH: Result := 'Authorization denied';
    SQLITE_FORMAT: Result := 'Auxiliary database format error';
    SQLITE_RANGE: Result := '2nd parameter to sqlite3_bind out of range';
    SQLITE_NOTADB: Result := 'File opened that is not a database file';
    SQLITE_ROW: Result := 'sqlite3_step() has another row ready';
    SQLITE_DONE: Result := 'sqlite3_step() has finished executing';
  else
    Result := 'Unknown SQLite Error Code "' + IntToStr(SQLiteErrorCode) + '"';
  end;
end;


end.
