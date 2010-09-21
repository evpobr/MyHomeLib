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
  unit_Interfaces;

  function GetBookCollection(const DBCollectionFile: string): IBookCollection;
  function GetActiveBookCollection: IBookCollection;

implementation

uses
  Windows,
  Classes,
  Generics.Collections,
  SysUtils,
  unit_Settings,
  unit_Database_SQLite,
  unit_SystemDatabase,
  unit_SystemDatabase_Abstract;

var
  g_CollectionCache: TBookCollectionCache;

function GetBookCollection(const DBCollectionFile: string): IBookCollection;
begin
  Assert(DBCollectionFile <> '');
  Assert(Assigned(g_CollectionCache));

  g_CollectionCache.LockMap;
  try
    if g_CollectionCache.ContainsKey(DBCollectionFile) then
    begin
      Result := g_CollectionCache.Get(DBCollectionFile);
    end
    else
    begin
      Result := GetSystemData.CreateBookCollection(DBCollectionFile);
      g_CollectionCache.Add(DBCollectionFile, Result);
    end;
  finally
    g_CollectionCache.UnlockMap;
  end;
end;

function GetActiveBookCollection: IBookCollection;
begin
  Result := GetBookCollection(GetSystemData.GetActiveCollectionInfo.DBFileName);
end;

initialization
  g_CollectionCache := TBookCollectionCache.Create;

finalization
  FreeAndNil(g_CollectionCache);
end.

