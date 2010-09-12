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

{$DEFINE USE_SQLITE}

interface

uses
  unit_Interfaces;

  function CreateBookCollection(const DBCollectionFile: string; ADefaultSession: Boolean = True): IBookCollection;
  function GetBookCollection(const DBCollectionFile: string): IBookCollection;
  function GetActiveBookCollection: IBookCollection;

  procedure CreateCollectionTables(const DBCollectionFile: string; const GenresFileName: string);
  procedure DropCollectionDatabase(const DBCollectionFile: string);

implementation

uses
  Windows,
  Classes,
  Generics.Collections,
  SysUtils,
  dm_user,
  unit_Settings,
  unit_Database_ABS,
  unit_Database_SQLite,
  unit_SystemDatabase;

type
  TCollectionCache = class
  private type
    TInterfaceAdapter = class
    public
      constructor Create(const Value: IBookCollection);

    private
      FValue: IBookCollection;
    end;

  private
    FMap: TObjectDictionary<string, TInterfaceAdapter>;
    FLock: TRTLCriticalSection;

  public
    constructor Create;
    destructor Destroy; override;

    procedure LockMap; inline;
    procedure UnlockMap; inline;

    function ContainsKey(const key: string): Boolean;
    procedure Add(const key: string; const Value: IBookCollection);
    function Get(const key: string): IBookCollection;
    procedure Remove(const key: string);
  end;

var
  g_CollectionCache: TCollectionCache;

function CreateBookCollection(const DBCollectionFile: string; ADefaultSession: Boolean = True): IBookCollection;
begin
{$IFDEF USE_SQLITE}
  Result := TBookCollection_SQLite.Create(DBCollectionFile);
{$ELSE}
  Result := TBookCollection_ABS.Create(DBCollectionFile, ADefaultSession);
{$ENDIF}
end;

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
      Result := CreateBookCollection(DBCollectionFile);
      g_CollectionCache.Add(DBCollectionFile, Result);
    end;
  finally
    g_CollectionCache.UnlockMap;
  end;
end;

function GetActiveBookCollection: IBookCollection;
begin
  Result := GetBookCollection(GetSystemData.ActiveCollectionInfo.DBFileName);
end;

procedure DropCollectionDatabase(const DBCollectionFile: string);
begin
  Assert(DBCollectionFile <> '');
  Assert(Assigned(g_CollectionCache));

  g_CollectionCache.LockMap;
  try
    if g_CollectionCache.ContainsKey(DBCollectionFile) then
      g_CollectionCache.Remove(DBCollectionFile);
  finally
    g_CollectionCache.UnlockMap;
  end;

  DeleteFile(DBCollectionFile);
end;

procedure CreateCollectionTables(const DBCollectionFile: string; const GenresFileName: string);
begin
{$IFDEF USE_SQLITE}
  CreateCollectionTables_SQLite(DBCollectionFile, GenresFileName);
{$ELSE}
  CreateCollectionTables_ABS(DBCollectionFile, GenresFileName);
{$ENDIF}
end;

{ TCollectionCache<I>.TInterfaceAdapter }

constructor TCollectionCache.TInterfaceAdapter.Create(const Value: IBookCollection);
begin
  inherited Create;
  FValue := Value;
end;

{ TCollectionCache<I> }

constructor TCollectionCache.Create;
begin
  inherited;
  InitializeCriticalSection(FLock);
  FMap := TObjectDictionary<string, TInterfaceAdapter>.Create([doOwnsValues]);
end;

destructor TCollectionCache.Destroy;
begin
  LockMap;    // Make sure nobody else is inside the list.
  try
    FMap.Free;
    inherited Destroy;
  finally
    UnlockMap;
    DeleteCriticalSection(FLock);
  end;
end;

procedure TCollectionCache.LockMap;
begin
  EnterCriticalSection(FLock);
end;

procedure TCollectionCache.UnlockMap;
begin
  LeaveCriticalSection(FLock);
end;

function TCollectionCache.ContainsKey(const key: string): Boolean;
begin
  LockMap;
  try
    Result := FMap.ContainsKey(key);
  finally
    UnlockMap;
  end;
end;

procedure TCollectionCache.Add(const key: string; const Value: IBookCollection);
begin
  LockMap;
  try
    FMap.Add(key, TInterfaceAdapter.Create(Value));
  finally
    UnlockMap;
  end;
end;

function TCollectionCache.Get(const key: string): IBookCollection;
begin
  LockMap;
  try
    Result := FMap[key].FValue;
  finally
    UnlockMap;
  end;
end;

procedure TCollectionCache.Remove(const key: string);
begin
  LockMap;
  try
    FMap.Remove(key);
  finally
    UnlockMap;
  end;
end;

initialization
  g_CollectionCache := TCollectionCache.Create;

finalization
  FreeAndNil(g_CollectionCache);
end.

