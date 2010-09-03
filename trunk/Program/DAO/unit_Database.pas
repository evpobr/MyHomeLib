(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Aleksey Penkov  alex.penkov@gmail.com
  *                     Nick Rymanov (nrymanov@gmail.com)
  * Created             12.02.2010
  * Description
  *
  * $Id$
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_Database;

interface

uses
  unit_Database_Abstract,
  unit_Database_ABS;

  function CreateBookCollection(const DBCollectionFile: string; ADefaultSession: Boolean = True): TBookCollection;
  function GetBookCollection(const DBCollectionFile: string): TBookCollection;
  function GetActiveBookCollection: TBookCollection;
  procedure FreeBookCollectionMap;

  procedure CreateSystemTables(const DBUserFile: string);
  procedure CreateCollectionTables(const DBCollectionFile: string; const GenresFileName: string);
  procedure DropCollectionDatabase(const DBCollectionFile: string);

implementation

uses
  Generics.Collections,
  SysUtils,
  dm_user;

type
  TBookCollectionMap = TObjectDictionary<string, TBookCollection>;

var
  BookCollectionMap: TBookCollectionMap;

procedure FreeBookCollectionMap;
begin
  FreeAndNil(BookCollectionMap);
end;

function GetBookCollection(const DBCollectionFile: string): TBookCollection;
begin
  Assert(DBCollectionFile <> '');
  if not Assigned(BookCollectionMap) then
    BookCollectionMap := TBookCollectionMap.Create([doOwnsValues]);

  if not BookCollectionMap.TryGetValue(DBCollectionFile, Result) then
  begin
    Result := CreateBookCollection(DBCollectionFile);
    BookCollectionMap.Add(DBCollectionFile, Result);
  end;
end;

function CreateBookCollection(const DBCollectionFile: string; ADefaultSession: Boolean = True): TBookCollection;
begin
  Result := TBookCollection_ABS.Create(DBCollectionFile, ADefaultSession);
end;

function GetActiveBookCollection: TBookCollection;
begin
  Result := GetBookCollection(DMUser.ActiveCollectionInfo.DBFileName);
end;

procedure DropCollectionDatabase(const DBCollectionFile: string);
begin
  if Assigned(BookCollectionMap) then
  begin
    if BookCollectionMap.ContainsKey(DBCollectionFile) then
      BookCollectionMap.Remove(DBCollectionFile);
  end;
  DeleteFile(DBCollectionFile);
end;

procedure CreateSystemTables(const DBUserFile: string);
begin
  CreateSystemTables_ABS(DBUserFile);
end;

procedure CreateCollectionTables(const DBCollectionFile: string; const GenresFileName: string);
begin
  CreateCollectionTables_ABS(DBCollectionFile, GenresFileName);
end;

initialization
  BookCollectionMap := nil;

end.
