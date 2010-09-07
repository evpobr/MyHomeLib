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
  unit_Interfaces,
  unit_Database_Abstract;

  function CreateBookCollection(const DBCollectionFile: string; ADefaultSession: Boolean = True): TBookCollection;
  function GetBookCollection(const DBCollectionFile: string): TBookCollection;
  function GetActiveBookCollection: TBookCollection;
  procedure FreeBookCollectionMap;

  function CreateBookCollectionEx(const DBCollectionFile: string; ADefaultSession: Boolean = True): IBookCollection;
  function GetBookCollectionEx(const DBCollectionFile: string): IBookCollection;
  function GetActiveBookCollectionEx: IBookCollection;

  procedure CreateSystemTables(const DBUserFile: string);
  procedure CreateCollectionTables(const DBCollectionFile: string; const GenresFileName: string);
  procedure DropCollectionDatabase(const DBCollectionFile: string);

implementation

uses
  Windows,
  Classes,
  Generics.Collections,
  SysUtils,
  dm_user,
  unit_Database_ABS,
  unit_Database_SQLite;

type
  TBookCollectionMap = TObjectDictionary<string, TBookCollection>;

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
  BookCollectionMap: TBookCollectionMap;
  g_CollectionCache: TCollectionCache;

function CreateBookCollection(const DBCollectionFile: string; ADefaultSession: Boolean = True): TBookCollection;
begin
{$IFDEF USE_SQLITE}
  Result := TBookCollection_SQLite.Create(DBCollectionFile);
{$ELSE}
  Result := TBookCollection_ABS.Create(DBCollectionFile, ADefaultSession);
{$ENDIF}
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

function GetActiveBookCollection: TBookCollection;
begin
  Result := GetBookCollection(DMUser.ActiveCollectionInfo.DBFileName);
end;

procedure FreeBookCollectionMap;
begin
  FreeAndNil(BookCollectionMap);
end;

function CreateBookCollectionEx(const DBCollectionFile: string; ADefaultSession: Boolean = True): IBookCollection;
begin
{$IFDEF USE_SQLITE}
  Result := TBookCollection_SQLite.Create(DBCollectionFile);
{$ELSE}
  Result := TBookCollection_ABS.Create(DBCollectionFile, ADefaultSession);
{$ENDIF}
end;

function GetBookCollectionEx(const DBCollectionFile: string): IBookCollection;
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
      Result := CreateBookCollectionEx(DBCollectionFile);
      g_CollectionCache.Add(DBCollectionFile, Result);
    end;
  finally
    g_CollectionCache.UnlockMap;
  end;
end;

function GetActiveBookCollectionEx: IBookCollection;
begin
  Result := GetBookCollectionEx(DMUser.ActiveCollectionInfo.DBFileName);
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
  // So far, there is only an ABS implementation for the system DB connection (DMUser)
  CreateSystemTables_ABS(DBUserFile);
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
  BookCollectionMap := nil;
  g_CollectionCache := TCollectionCache.Create;

finalization
  FreeAndNil(g_CollectionCache);

end.
