(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           eg
  * Created             04.09.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_SystemDatabase_SQLite;

interface

uses
  Windows,
  SysUtils,
  Generics.Collections,
  unit_SystemDatabase_Abstract,
  SQLiteWrap,
  UserData,
  unit_Interfaces,
  unit_Globals,
  unit_Consts;

type
  TSystemData_SQLite = class(TSystemData)
  strict private
  type
    TBookIteratorImpl = class(TInterfacedObject, IBookIterator)
    public
      constructor Create(User: TSystemData_SQLite; const GroupID: Integer; const DatabaseID: Integer);
      destructor Destroy; override;

    protected
      //
      // IBookIterator
      //
      function Next(out BookRecord: TBookRecord): Boolean;
      function RecordCount: Integer;

    private
      FUser: TSystemData_SQLite;
      FBooks: TSQLiteQuery;
      FCount: TSQLiteQuery;

      procedure PrepareData(const GroupID: Integer; const DatabaseID: Integer);
    end;
    // << TBookIteratorImpl

    TGroupIteratorImpl = class(TInterfacedObject, IGroupIterator)
    public
      constructor Create(User: TSystemData_SQLite);
      destructor Destroy; override;

    protected
      //
      // IGroupIterator
      //
      function Next(out Group: TGroupData): Boolean;
      function RecordCount: Integer;

    private
      FUser: TSystemData_SQLite;
      FGroups: TSQLiteQuery;
      FCount: TSQLiteQuery;

      procedure PrepareData;
    end;
    // << TGroupIteratorImpl

    TCollectionInfoIteratorImpl = class(TInterfacedObject, ICollectionInfoIterator)
    public
      constructor Create(User: TSystemData_SQLite);
      destructor Destroy; override;

    protected
      //
      // ICollectionInfoIterator
      //
      function Next(out CollectionInfo: ICollectionInfo): Boolean;
      function RecordCount: Integer;

    private
      FUser: TSystemData_SQLite;
      FBases: TSQLiteQuery;
      FCount: TSQLiteQuery;

      procedure PrepareData;
    end;
    // << TCollectionInfoIteratorImpl

  protected
    function InternalCreateCollection(const DBCollectionFile: string): IBookCollection; override;
    procedure PrepareCollectionPath(var CollectionRoot: string; var CollectionFile: string);

  public
    constructor Create(const DBUserFile: string);
    destructor Destroy; override;

  public
    //
    // ISystemData
    //
    function CreateCollection(
      const DisplayName: string;
      const RootFolder: string;
      const DBFileName: string;
      CollectionType: COLLECTION_TYPE;
      const GenresFileName: string
    ): Integer; override;

    function RegisterCollection(
      const DBFileName: string;
      const DisplayName: string;
      const RootFolder: string
    ): Integer; override;

    procedure DeleteCollection(CollectionID: Integer; RemoveFromDisk: Boolean = True); override;

    // function HasCollections: Boolean; // use base implementation
    function HasCollectionWithProp(PropID: TPropertyID; const Value: string; IgnoreID: Integer = INVALID_COLLECTION_ID): Boolean; override;
    // function FindFirstExistingCollectionID(const PreferredID: Integer): Integer; // use base implementation

    procedure SetProperty(const CollectionID: Integer; const PropID: TPropertyID; const Value: Variant); override;
    function GetProperty(const CollectionID: Integer; const PropID: TPropertyID): Variant; override;

    function GetCollectionInfo(const CollectionID: Integer): ICollectionInfo; override;
    procedure UpdateCollectionInfo(const CollectionInfo: ICollectionInfo); override;

    // function GetCollection(const DBCollectionFile: string): IBookCollection; // use base implementation

    procedure ActivateCollection(CollectionID: Integer); override;
    // function GetActiveCollectionInfo: ICollectionInfo; // use base implementation
    // function GetActiveBookCollection: IBookCollection; // use base implementation
    function ActivateGroup(const ID: Integer): Boolean; override;

    procedure GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord); override;
    procedure DeleteBook(const BookKey: TBookKey); override;
    procedure UpdateBook(const BookRecord: TBookRecord); override;

    procedure SetExtra(const BookKey: TBookKey; extra: TBookExtra); override;
    procedure SetRate(const BookKey: TBookKey; Rate: Integer); override;
    procedure SetProgress(const BookKey: TBookKey; Progress: Integer); override;
    function GetReview(const BookKey: TBookKey): string; override;
    function SetReview(const BookKey: TBookKey; const Review: string): Integer; override;
    procedure SetLocal(const BookKey: TBookKey; Value: Boolean); override;
    procedure SetFileName(const BookKey: TBookKey; const FileName: string); override;
    procedure SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer); override;
    procedure SetFolder(const BookKey: TBookKey; const Folder: string); override;

    //
    // Работа с группами
    //
    function AddGroup(const GroupName: string; const AllowDelete: Boolean = True): Boolean; override;
    function GetGroup(const GroupID: Integer): TGroupData; override;
    function RenameGroup(GroupID: Integer; const NewName: string): Boolean; override;
    procedure ClearGroup(GroupID: Integer); override;
    procedure DeleteGroup(GroupID: Integer); override;

    procedure AddBookToGroup(const BookKey: TBookKey; GroupID: Integer; const BookRecord: TBookRecord); override;
    procedure CopyBookToGroup(const BookKey: TBookKey; SourceGroupID: Integer; TargetGroupID: Integer; MoveBook: Boolean); override;
    procedure DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer); override;

    //
    // Пользовательские данные
    //
    procedure ImportUserData(data: TUserData); override;
    // procedure ExportUserData(data: TUserData); // use base implementation

    // Batch update methods:
    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer); override;

    //Iterators:
    function GetBookIterator(const GroupID: Integer; const DatabaseID: Integer = INVALID_COLLECTION_ID): IBookIterator; override;
    function GetGroupIterator: IGroupIterator; override;
    function GetCollectionInfoIterator: ICollectionInfoIterator; override;

    //
    // Служебные методы
    //
    // procedure ClearCollectionCache; // use base implementation
    procedure RemoveUnusedBooks; override;

  private
    FDatabase: TSQLiteDatabase;
    FCollectionInfoCache: TCollectionInfoCache;

    procedure InternalClearGroup(GroupID: Integer; RemoveGroup: Boolean);
    function InternalFindGroup(const GroupName: string): Boolean; overload; inline;
    function InternalFindGroup(GroupID: Integer): Boolean; overload; inline;
  end;

procedure CreateSystemTables_SQLite(const DBUserFile: string);

implementation

uses
  Classes,
  IOUtils,
  SQLite3,
  unit_Logger,
  unit_SQLiteUtils,
  unit_Database_SQLite,
  unit_Settings,
  unit_Helpers;

resourcestring
  rstrInvalidCollection = 'Файл %s не является коллекцией.';

// Generate table structure and minimal system data
procedure CreateSystemTables_SQLite(const DBUserFile: string);
var
  ADatabase: TSQLiteDatabase;
  StringList: TStringList;
  StructureDDL: string;
  SystemData: ISystemData;
begin
  ADatabase := TSQLiteDatabase.Create(DBUserFile);
  try
    StringList := ReadResourceAsStringList('CreateSystemDB_SQLite');
    try
      ADatabase.Start;
      try
        for StructureDDL in StringList do
        begin
          if Trim(StructureDDL) <> '' then
            ADatabase.ExecSQL(StructureDDL);
        end;
        ADatabase.Commit;
      except
        ADatabase.Rollback;
        raise;
      end;
    finally
      FreeAndNil(StringList);
    end;
  finally
    FreeAndNil(ADatabase);
  end;

  //
  // Зададим дефлотные группы
  //
  SystemData := TSystemData_SQLite.Create(DBUserFile);
  SystemData.AddGroup(rstrFavoritesGroupName, False);
  SystemData.AddGroup(rstrToReadGroupName, False);
end;

{ TBookIteratorImpl }

constructor TSystemData_SQLite.TBookIteratorImpl.Create(User: TSystemData_SQLite; const GroupID: Integer; const DatabaseID: Integer);
begin
  inherited Create;

  Assert(Assigned(User));

  FUser := User;

  PrepareData(GroupID, DatabaseID);
end;

destructor TSystemData_SQLite.TBookIteratorImpl.Destroy;
begin
  FreeAndNil(FBooks);
  FreeAndNil(FCount);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TSystemData_SQLite.TBookIteratorImpl.Next(out BookRecord: TBookRecord): Boolean;
var
  bookID: Integer;
  databaseID: Integer;
begin
  Result := not FBooks.Eof;

  if Result then
  begin
    bookID := FBooks.FieldAsInt(0);
    databaseID := FBooks.FieldAsInt(1);

    FUser.GetBookRecord(CreateBookKey(bookID, databaseID), BookRecord);
    FBooks.Next;
  end;
end;

function TSystemData_SQLite.TBookIteratorImpl.RecordCount: Integer;
begin
  Assert(Assigned(FCount), 'Calling RecordCount more than once!');

  FCount.Open;
  Result := FCount.FieldAsInt(0);
  FreeAndNil(FCount);
end;

procedure TSystemData_SQLite.TBookIteratorImpl.PrepareData(const GroupID: Integer; const DatabaseID: Integer);
var
  sqlCount: string;
  sqlRows: string;
begin
  sqlCount := 'SELECT COUNT(*) FROM BookGroups bg INNER JOIN Books b ON bg.BookID = b.BookID AND bg.DatabaseID = b.DatabaseID ' +
    ' WHERE bg.GroupID = ? ';
  sqlRows := 'SELECT b.BookID, b.DatabaseID FROM BookGroups bg INNER JOIN Books b ON bg.BookID = b.BookID AND bg.DatabaseID = b.DatabaseID ' +
    ' WHERE bg.GroupID = ? ';
  if (DatabaseID <> INVALID_COLLECTION_ID) then
  begin
    sqlCount := sqlCount + ' AND bg.DatabaseID = ? ';
    sqlRows := sqlRows + ' AND bg.DatabaseID = ? ';
  end;

  FCount := FUser.FDatabase.NewQuery(sqlCount);
  FCount.SetParam(0, GroupID);
  if (DatabaseID <> INVALID_COLLECTION_ID) then
    FCount.SetParam(1, DatabaseID);

  FBooks := FUser.FDatabase.NewQuery(sqlRows);
  FBooks.SetParam(0, GroupID);
  if (DatabaseID <> INVALID_COLLECTION_ID) then
    FBooks.SetParam(1, DatabaseID);
  FBooks.Open;
end;

{ TGroupIteratorImpl }

constructor TSystemData_SQLite.TGroupIteratorImpl.Create(User: TSystemData_SQLite);
begin
  inherited Create;

  Assert(Assigned(User));

  FUser := User;

  PrepareData;
end;

destructor TSystemData_SQLite.TGroupIteratorImpl.Destroy;
begin
  FreeAndNil(FGroups);
  FreeAndNil(FCount);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TSystemData_SQLite.TGroupIteratorImpl.Next(out Group: TGroupData): Boolean;
begin
  Result := not FGroups.Eof;

  if Result then
  begin
    Group.GroupID := FGroups.FieldAsInt(0);
    Group.Text := FGroups.FieldAsString(1);
    Group.CanDelete := FGroups.FieldAsBoolean(2);
    FGroups.Next;
  end;
end;

function TSystemData_SQLite.TGroupIteratorImpl.RecordCount: Integer;
begin
  Assert(Assigned(FCount), 'Calling RecordCount more than once!');

  FCount.Open;
  Result := FCount.FieldAsInt(0);
  FreeAndNil(FCount);
end;

procedure TSystemData_SQLite.TGroupIteratorImpl.PrepareData;
const
  SQL_COUNT = 'SELECT COUNT(*) FROM Groups ';
  SQL_ROWS = 'SELECT g.GroupID, g.GroupName, g.AllowDelete FROM Groups g ';
begin
  FCount := FUser.FDatabase.NewQuery(SQL_COUNT);

  FGroups := FUser.FDatabase.NewQuery(SQL_ROWS);
  FGroups.Open;
end;

{ TCollectionInfoIteratorImpl }

constructor TSystemData_SQLite.TCollectionInfoIteratorImpl.Create(User: TSystemData_SQLite);
begin
  inherited Create;

  Assert(Assigned(User));

  FUser := User;

  PrepareData;
end;

destructor TSystemData_SQLite.TCollectionInfoIteratorImpl.Destroy;
begin
  FreeAndNil(FBases);
  FreeAndNil(FCount);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TSystemData_SQLite.TCollectionInfoIteratorImpl.Next(out CollectionInfo: ICollectionInfo): Boolean;
begin
  Result := not FBases.Eof;

  if Result then
  begin
    CollectionInfo := FUser.GetCollectionInfo(FBases.FieldAsInt(0));
    FBases.Next;
  end;
end;

function TSystemData_SQLite.TCollectionInfoIteratorImpl.RecordCount: Integer;
begin
  Assert(Assigned(FCount), 'Calling RecordCount more than once!');

  FCount.Open;
  Result := FCount.FieldAsInt(0);
  FreeAndNil(FCount);
end;

procedure TSystemData_SQLite.TCollectionInfoIteratorImpl.PrepareData;
const
  SQL_COUNT = 'SELECT COUNT(*) FROM Bases b ';
  SQL_ROWS = 'SELECT b.DatabaseID FROM Bases b ';
begin
  FCount := FUser.FDatabase.NewQuery(SQL_COUNT);

  FBases := FUser.FDatabase.NewQuery(SQL_ROWS);
  FBases.Open;
end;

{TSystemData_SQLite}

constructor TSystemData_SQLite.Create(const DBUserFile: string);
var
  collectionID: Integer;
begin
  inherited Create;

  Assert(FileExists(DBUserFile));
  FDatabase := TSQLiteDatabase.Create(DBUserFile);

  FCollectionInfoCache := TCollectionInfoCache.Create;

  collectionID := FindFirstExistingCollectionID(1);
  if collectionID > 0 then
    ActivateCollection(collectionID);
end;

destructor TSystemData_SQLite.Destroy;
begin
  FreeAndNil(FCollectionInfoCache);
  FreeAndNil(FDatabase);
  inherited Destroy;
end;

function TSystemData_SQLite.GetCollectionInfo(const CollectionID: Integer): ICollectionInfo;
const
  SQL_SELECT = 'SELECT ' +
    'bs.BaseName, bs.RootFolder, bs.DBFileName, bs.Code, bs.CreationDate, ' + // 0 .. 4
    'bs.DataVersion, bs.Notes, bs.LibUser, bs.LibPassword, '                + // 5 .. 8
    'bs.URL, bs.ConnectionScript ' +                                          // 9 .. 10
    'FROM Bases bs WHERE bs.DatabaseID = ?';
var
  query: TSQLiteQuery;
  tempCollectionInfo: ICollectionInfo;
begin
  Assert(CollectionID > 0);

  FCollectionInfoCache.LockMap;
  try
    if not FCollectionInfoCache.ContainsKey(CollectionID) then
    begin
      query := FDatabase.NewQuery(SQL_SELECT);
      try
        query.SetParam(0, CollectionID);
        query.Open;
        if not query.Eof then
        begin
          tempCollectionInfo := TCollectionInfo.Create;
          tempCollectionInfo.Clear;
          tempCollectionInfo.SetID(CollectionID);
          tempCollectionInfo.SetName(query.FieldAsString(0));

          //
          // восстановить абсолютные пути
          //
          tempCollectionInfo.SetRootFolder(TMHLSettings.ExpandCollectionRoot(query.FieldAsString(1)));
          tempCollectionInfo.SetDBFileName(TMHLSettings.ExpandCollectionFileName(query.FieldAsString(2)));

          tempCollectionInfo.SetCollectionType(query.FieldAsInt(3)); // code
          tempCollectionInfo.SetCreationDate(query.FieldAsDateTime(4));

          if query.FieldIsNull(5) then
            tempCollectionInfo.SetDataVersion(UNVERSIONED_COLLECTION)
          else
            tempCollectionInfo.SetDataVersion(query.FieldAsInt(5));

          tempCollectionInfo.SetNotes(query.FieldAsString(6));
          tempCollectionInfo.SetUser(query.FieldAsString(7));
          tempCollectionInfo.SetPassword(query.FieldAsString(8));
          tempCollectionInfo.SetURL(query.FieldAsString(9));
          tempCollectionInfo.SetScript(query.FieldAsBlobString(10));

          FCollectionInfoCache.Add(CollectionID, tempCollectionInfo);
        end;
      finally
        FreeAndNil(query);
      end;
    end;

    Result := FCollectionInfoCache.Get(CollectionID);
  finally
    FCollectionInfoCache.UnlockMap;
  end;
end;

procedure TSystemData_SQLite.UpdateCollectionInfo(const CollectionInfo: ICollectionInfo);
const
{$IFOPT D+}
  SQL_SELECT = 'SELECT DatabaseID FROM Bases WHERE DatabaseID = ? ';
{$ENDIF}
  SQL_UPDATE =
    'UPDATE Bases SET ' +
      'BaseName = ?, RootFolder = ?, DBFileName = ?, Notes = ?, CreationDate = ?, ' + // 0 .. 4
      'DataVersion = ?, Code = ?, URL = ?, ' +                                        // 5 .. 7
      'LibUser = ?, LibPassword = ?, ConnectionScript = ? ' +                         // 8 .. 10
    'WHERE DatabaseID = ? ';                                                          // 11
var
  query: TSQLiteQuery;
  storedRoot: string;
  storedFileName: string;
begin
  Assert(Assigned(CollectionInfo));
  Assert(CollectionInfo.ID > 0);

{$IFOPT D+}
  query := FDatabase.NewQuery(SQL_SELECT);
  try
    query.SetParam(0, CollectionInfo.ID);
    query.Open;
    Assert(not query.Eof);
  finally
    FreeAndNil(query);
  end;
{$ENDIF}

  storedRoot := CollectionInfo.RootFolder;
  storedFileName := CollectionInfo.DBFileName;
  PrepareCollectionPath(storedRoot, storedFileName);

  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(0, CollectionInfo.Name);
    query.SetParam(1, storedRoot);
    query.SetParam(2, storedFileName);
    query.SetParam(3, CollectionInfo.Notes);
    query.SetParam(4, CollectionInfo.CreationDate);
    query.SetParam(5, CollectionInfo.DataVersion);
    query.SetParam(6, CollectionInfo.CollectionType);
    query.SetParam(7, CollectionInfo.URL);
    query.SetParam(8, CollectionInfo.User);
    query.SetParam(9, CollectionInfo.Password);
    query.SetBlobParam(10, CollectionInfo.Script);
    query.SetParam(11, CollectionInfo.ID);

    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;

  FCollectionInfoCache.LockMap;
  try
    //
    // заменить на AddOrSet или Replace
    //
    FCollectionInfoCache.Remove(CollectionInfo.GetID);
    FCollectionInfoCache.Add(CollectionInfo.GetID, CollectionInfo);
  finally
    FCollectionInfoCache.UnlockMap;
  end;
end;

procedure TSystemData_SQLite.ActivateCollection(CollectionID: Integer);
begin
  Assert(CollectionID > 0);
  FActiveCollectionInfo := GetCollectionInfo(CollectionID);
end;

function TSystemData_SQLite.HasCollectionWithProp(PropID: TPropertyID; const Value: string; IgnoreID: Integer): Boolean;
var
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: ICollectionInfo;
  Match: Boolean;
  searchValue: string;
begin
  CollectionInfoIterator := GetCollectionInfoIterator;

  Result := False;

  //
  // Скорее всего это лишнее...
  //
  if CollectionInfoIterator.RecordCount = 0 then
    Exit;

  case PropID of
  PROP_ROOTFOLDER:
    searchValue := TMHLSettings.ExpandCollectionRoot(Value);

  PROP_DATAFILE:
    searchValue := TMHLSettings.ExpandCollectionFileName(Value);

  else
    searchValue := Value;
  end;

  while (CollectionInfoIterator.Next(CollectionInfo)) do
  begin
    case PropID of
    PROP_DISPLAYNAME:
      Match := (CollectionInfo.Name = searchValue);

    PROP_DATAFILE:
      Match := (CollectionInfo.DBFileName = searchValue);

    PROP_ROOTFOLDER:
      Match := (CollectionInfo.RootFolder = searchValue);

    else
      Match := False;
      Assert(False);
    end;

    if Match and ((IgnoreID = INVALID_COLLECTION_ID) or (IgnoreID <> CollectionInfo.ID)) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function FieldByPropID(const PropID: TPropertyID): string;
begin
  Assert(isSystemProp(PropID));

  case PropID of
    PROP_ID:               Result := 'DatabaseID';
    PROP_DATAFILE:         Result := 'DBFileName';
    PROP_CODE:             Result := 'Code';
    PROP_DISPLAYNAME:      Result := 'BaseName';
    PROP_ROOTFOLDER:       Result := 'RootFolder';
    PROP_LIBUSER:          Result := 'LibUser';
    PROP_LIBPASSWORD:      Result := 'LibPassword';
    PROP_URL:              Result := 'URL';
    PROP_CONNECTIONSCRIPT: Result := 'ConnectionScript';
    PROP_DATAVERSION:      Result := 'DataVersion';
  else
    Assert(False);
  end;
end;

procedure TSystemData_SQLite.SetProperty(const CollectionID: Integer; const PropID: TPropertyID; const Value: Variant);
const
  SQL_UPDATE = 'UPDATE Bases SET %s = ? WHERE DatabaseID = ?';
var
  FieldName: string;
  query: TSQLiteQuery;
begin
  Assert(CollectionID <> INVALID_COLLECTION_ID);
  Assert(isSystemProp(PropID));

  case PropID of
    PROP_ID:         Assert(False); // DatabaseID
    PROP_DATAFILE:   Assert(False); // DBFileName
    PROP_CODE:       Assert(False); // Code
    PROP_ROOTFOLDER: ;  // TODO привести путь к относительному
  end;

  FieldName := FieldByPropID(PropID);

  query := FDatabase.NewQuery(Format(SQL_UPDATE, [FieldName]));
  try
    case propertyType(PropID) of
      PROP_TYPE_INTEGER:  query.SetParam(0, Integer(Value));
      PROP_TYPE_DATETIME: query.SetParam(0, TDateTime(Value));
      PROP_TYPE_BOOLEAN:  query.SetParam(0, Boolean(Value));
      PROP_TYPE_STRING:   query.SetParam(0, string(Value));
    end;

    query.SetParam(1, CollectionID);

    query.ExecSQL;
  finally
    query.Free;
  end;
end;

function TSystemData_SQLite.GetProperty(const CollectionID: Integer; const PropID: TPropertyID): Variant;
const
  SQL = 'SELECT %s FROM Bases WHERE DatabaseID = ?';
var
  FieldName: string;
  query: TSQLiteQuery;
begin
  Assert(CollectionID <> INVALID_COLLECTION_ID);
  Assert(isSystemProp(PropID));

  FieldName := FieldByPropID(PropID);
  query := FDatabase.NewQuery(Format(SQL, [FieldName]));
  try
    query.SetParam(0, CollectionID);

    query.Open;
    if not query.Eof then
    begin
      case propertyType(PropID) of
        PROP_TYPE_INTEGER:  Result := query.FieldAsInt(0);
        PROP_TYPE_DATETIME: Result := query.FieldAsDateTime(0);
        PROP_TYPE_BOOLEAN:  Result := query.FieldAsBoolean(0);
        PROP_TYPE_STRING:   Result := query.FieldAsString(0);
      end;
    end;
  finally
    query.Free;
  end;
end;

procedure TSystemData_SQLite.DeleteCollection(CollectionID: Integer; RemoveFromDisk: Boolean = True);
const
  DELETE_BASES_QUERY = 'DELETE FROM Bases WHERE DatabaseID = ? ';
var
  info: ICollectionInfo;
  DBFileName: string;
begin
  //
  // Почистить кэши
  //
  info := GetCollectionInfo(CollectionID);
  DBFileName := info.DBFileName;

  FBookCollectionCache.Remove(DBFileName);
  FCollectionInfoCache.Remove(CollectionID);

  FDatabase.ExecSQL(DELETE_BASES_QUERY, [CollectionID]);

  if RemoveFromDisk then
    DeleteFile(DBFileName);

  // The first collection becomes the current one:
  collectionID := FindFirstExistingCollectionID(1);
  if collectionID > 0 then
    ActivateCollection(collectionID);
end;

function TSystemData_SQLite.CreateCollection(
  const DisplayName: string;
  const RootFolder: string;
  const DBFileName: string;
  CollectionType: COLLECTION_TYPE;
  const GenresFileName: string
  ): Integer;
const
  SQL_INSERT =
    'INSERT INTO Bases (BaseName, RootFolder, DBFileName, CreationDate, Code) ' +
    'VALUES(?, ?, ?, ?, ?)';
var
  absDBFileName: string;
  storedRoot: string;
  storedFileName: string;
  query: TSQLiteQuery;
begin
  absDBFileName := TMHLSettings.ExpandCollectionFileName(DBFileName);

  TBookCollection_SQLite.CreateCollection(Self, absDBFileName, CollectionType, GenresFileName);

  try
    storedFileName := DBFileName;
    storedRoot := RootFolder;
    PrepareCollectionPath(storedRoot, storedFileName);

    //
    // регистрируем коллекцию
    //
    query := FDatabase.NewQuery(SQL_INSERT);
    try
      query.SetParam(0, DisplayName);
      query.SetParam(1, storedRoot);
      query.SetParam(2, storedFileName);
      query.SetParam(3, Now);
      query.SetParam(4, CollectionType);

      query.ExecSQL;

      Result := FDatabase.LastInsertRowID;
    finally
      FreeAndNil(query);
    end;
  except
    //
    // в случае неудачной регистрации удалим файл коллекции
    //
    DeleteFile(absDBFileName);
    raise;
  end;
end;

function TSystemData_SQLite.RegisterCollection(
  const DBFileName: string;
  const DisplayName: string;
  const RootFolder: string
  ): Integer;
const
  SQL_INSERT =
    'INSERT INTO Bases (BaseName, RootFolder, DBFileName, CreationDate, Code) ' +
    'VALUES(?, ?, ?, ?, ?)';
var
  absFileName: string;
  storedRoot: string;
  storedFileName: string;
  CollectionType: COLLECTION_TYPE;
  query: TSQLiteQuery;
begin
  absFileName := TMHLSettings.ExpandCollectionFileName(DBFileName);

  if TBookCollection_SQLite.IsValidCollection(absFileName, CollectionType) then
  begin
    storedRoot := RootFolder;
    storedFileName := DBFileName;
    PrepareCollectionPath(storedRoot, storedFileName);

    //
    // регистрируем коллекцию
    //
    query := FDatabase.NewQuery(SQL_INSERT);
    try
      query.SetParam(0, DisplayName);
      query.SetParam(1, storedRoot);
      query.SetParam(2, storedFileName);
      query.SetParam(3, Now);
      query.SetParam(4, CollectionType);

      query.ExecSQL;

      Result := FDatabase.LastInsertRowID;

      //
      // TODO : принудительно обновить свойства коллекции
      //
      // Collection.UpdateProperies;
    finally
      FreeAndNil(query);
    end;
  end
  else
  begin
    raise Exception.CreateFmt(rstrInvalidCollection, [DBFileName]);
  end;
end;

function TSystemData_SQLite.InternalCreateCollection(const DBCollectionFile: string): IBookCollection;
var
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: ICollectionInfo;
  Match: Boolean;
  searchValue: string;
begin
  CollectionInfoIterator := GetCollectionInfoIterator;

  searchValue := TMHLSettings.ExpandCollectionFileName(DBCollectionFile);

  while (CollectionInfoIterator.Next(CollectionInfo)) do
  begin
    if CollectionInfo.DBFileName = searchValue then
    begin
      Result := TBookCollection_SQLite.Create(CollectionInfo, Self);
      Exit;
    end;
  end;

  Assert(False);
  Result := nil;
end;

function TSystemData_SQLite.ActivateGroup(const ID: Integer): Boolean;
const
  SQL_SELECT = 'SELECT GroupID FROM Groups WHERE GroupID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_SELECT);
  try
    query.SetParam(0, ID);
    query.Open;
    Result := not query.Eof;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord);
const
  SQL_SELECT = 'SELECT ' +
    'LibID, Title, SeriesID, SeqNumber, UpdateDate, ' + // 0 .. 4
    'LibRate, Lang, Folder, FileName, InsideNo, ' +     // 5 .. 9
    'Ext, BookSize, IsLocal, IsDeleted, ' +             // 10 .. 13
    'KeyWords, Rate, Progress, Annotation, Review, ' +  // 14 .. 18
    'ExtraInfo ' +                                      // 19
    'FROM Books WHERE BookID = ? AND DatabaseID = ? ';
var
  stream: TStream;
  reader: TReader;
  author: TAuthorData;
  genre: TGenreData;
  query: TSQLiteQuery;
  collectionInfo: ICollectionInfo;
begin
  query := FDatabase.NewQuery(SQL_SELECT);
  try
    query.SetParam(0, BookKey.BookID);
    query.SetParam(1, BookKey.DatabaseID);
    query.Open;
    Assert(not query.Eof);

    BookRecord.NodeType := ntBookInfo;
    BookRecord.BookKey := BookKey;
    BookRecord.LibID := query.FieldAsString(0);
    BookRecord.Title := query.FieldAsString(1);
    if query.FieldIsNull(2) then
    begin
      BookRecord.SeriesID := NO_SERIES_ID;
      BookRecord.SeqNumber := 0;
    end
    else
    begin
      BookRecord.SeriesID := query.FieldAsInt(2);
      BookRecord.SeqNumber := query.FieldAsInt(3);
    end;
    BookRecord.Date := query.FieldAsDateTime(4);
    BookRecord.Rate := query.FieldAsInt(5);
    BookRecord.Lang := query.FieldAsString(6);
    BookRecord.Folder := query.FieldAsString(7);
    BookRecord.FileName := query.FieldAsString(8);
    BookRecord.InsideNo := query.FieldAsInt(9);
    BookRecord.FileExt := query.FieldAsString(10);
    BookRecord.Size := query.FieldAsInt(11);
    if query.FieldAsBoolean(12) then
      Include(BookRecord.BookProps, bpIsLocal)
    else
      Exclude(BookRecord.BookProps, bpIsLocal);
    if query.FieldAsBoolean(13) then
      Include(BookRecord.BookProps, bpIsDeleted)
    else
      Exclude(BookRecord.BookProps, bpIsDeleted);
    BookRecord.KeyWords := query.FieldAsString(14);
    BookRecord.LibRate := query.FieldAsInt(15);
    BookRecord.Progress := query.FieldAsInt(16);
    BookRecord.Annotation := query.FieldAsBlobString(17);
    BookRecord.Review := query.FieldAsBlobString(18);
    if BookRecord.Review <> '' then
      Include(BookRecord.BookProps, bpHasReview)
    else
      Exclude(BookRecord.BookProps, bpHasReview);

    stream := query.FieldAsBlob(19);
    try
      reader := TReader.Create(stream, 4096);
      try
        BookRecord.Series := reader.ReadString;
        Assert((BookRecord.SeriesID = NO_SERIES_ID) = (BookRecord.Series = NO_SERIES_TITLE));

        reader.ReadListBegin;
        while not reader.EndOfList do
        begin
          //
          // не полагаемся на порядок вычисления аргументов, т к важен порядок чтения строк
          //
          Author.LastName := reader.ReadString;
          Author.FirstName := reader.ReadString;
          Author.MiddleName := reader.ReadString;
          Author.AuthorID := reader.ReadInteger;

          TAuthorsHelper.Add(
            BookRecord.Authors,
            Author.LastName,
            Author.FirstName,
            Author.MiddleName,
            Author.AuthorID
          );
        end;
        reader.ReadListEnd;

        reader.ReadListBegin;
        while not reader.EndOfList do
        begin
          Genre.GenreCode := reader.ReadString;
          Genre.FB2GenreCode := reader.ReadString;
          Genre.GenreAlias := reader.ReadString;

          TGenresHelper.Add(
            BookRecord.Genres,
            Genre.GenreCode,
            Genre.GenreAlias,
            Genre.FB2GenreCode
          );
        end;
        reader.ReadListEnd;
      finally
        reader.Free;
      end;
    finally
      Stream.Free;
    end;
  finally
    FreeAndNil(query);
  end;

  try
    collectionInfo := GetCollectionInfo(BookRecord.BookKey.DatabaseID);
    // Please notice that the collection for a book in a group might not match ActiveCollection
    // Need to use values from tblBases instead
    BookRecord.CollectionName := collectionInfo.Name;
    BookRecord.CollectionRoot := IncludeTrailingPathDelimiter(collectionInfo.RootFolder);
  except
    BookRecord.CollectionName := rstrUnknownCollection;
    BookRecord.CollectionRoot := '';
    Assert(False);
  end;
end;

procedure TSystemData_SQLite.DeleteBook(const BookKey: TBookKey);
const
  SQL_DELETE_FROM_BOOK_GROUPS: string = 'DELETE FROM BookGroups WHERE BookID = ? AND DatabaseID = ? ';
  SQL_DELETE_FROM_BOOKS: string = 'DELETE FROM Books WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_DELETE_FROM_BOOK_GROUPS);
  try
    query.SetParam(0, BookKey.BookID);
    query.SetParam(1, BookKey.DatabaseID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.UpdateBook(const BookRecord: TBookRecord);
const
  SQL_UPDATE = 'UPDATE Books ' +
    'SET LibID = ?, Title = ?, SeriesID = ?, SeqNumber = ?, UpdateDate = ?, ' + // 0 .. 4
    'LibRate = ?, Lang = ?, Folder = ?, FileName = ?, InsideNo = ?, ' +         // 5 .. 9
    'Ext = ?, BookSize = ?, IsLocal = ?, IsDeleted = ?, ' +                     // 10 .. 13
    'KeyWords = ?, Rate = ?, Progress = ?, Annotation = ?, Review = ?, ' +      // 14 .. 18
    'ExtraInfo = ? ' +                                                          // 19
    'WHERE BookID = ? DatabaseID = ? ';                                         // 20 .. 21
var
  stream: TStream;
  writer: TWriter;
  author: TAuthorData;
  genre: TGenreData;
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(0, BookRecord.LibID);
    query.SetParam(1, BookRecord.Title);
    query.SetParam(2, BookRecord.SeriesID);
    query.SetParam(3, BookRecord.SeqNumber);
    query.SetParam(4, BookRecord.Date);
    query.SetParam(5, BookRecord.LibRate);
    query.SetParam(6, BookRecord.Lang);
    query.SetParam(7, TPath.Combine(FActiveCollectionInfo.RootFolder, BookRecord.Folder));
    query.SetParam(8, BookRecord.FileName);
    query.SetParam(9, BookRecord.InsideNo);
    query.SetParam(10, BookRecord.FileExt);
    query.SetParam(11, BookRecord.Size);
    query.SetParam(12, bpIsLocal in BookRecord.BookProps);
    query.SetParam(13, bpIsDeleted in BookRecord.BookProps);
    query.SetParam(14, BookRecord.KeyWords);
    query.SetParam(15, BookRecord.Rate);
    query.SetParam(16, BookRecord.Progress);
    query.SetBlobParam(17, BookRecord.Annotation);
    query.SetBlobParam(18, BookRecord.Review);

    stream := TMemoryStream.Create;
    try
      writer := TWriter.Create(stream, 4096);
      try
        writer.WriteString(BookRecord.Series);

        writer.WriteListBegin;
        for Author in BookRecord.Authors do
        begin
          writer.WriteString(Author.LastName);
          writer.WriteString(Author.FirstName);
          writer.WriteString(Author.MiddleName);
          writer.WriteInteger(Author.AuthorID);
        end;
        writer.WriteListEnd;

        writer.WriteListBegin;
        for genre in BookRecord.Genres do
        begin
          writer.WriteString(genre.GenreCode);
          writer.WriteString(genre.FB2GenreCode);
          writer.WriteString(genre.GenreAlias);
        end;
        writer.WriteListEnd;
      finally
        FreeAndNil(writer);
      end;
      query.SetBlobParam(19, stream);
    finally
      stream.Free;
    end;

    query.SetParam(20, BookRecord.BookKey.BookID);
    query.SetParam(21, BookRecord.BookKey.DatabaseID);

    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.SetExtra(const BookKey: TBookKey; extra: TBookExtra);
const
  SQL_UPDATE = 'UPDATE Books Set LibRate = ?, Progress = ?, Review = ? WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(0, extra.Rating);
    query.SetParam(1, extra.Progress);
    query.SetBlobParam(2, extra.Review);
    query.SetParam(3, BookKey.BookID);
    query.SetParam(4, BookKey.DatabaseID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.SetRate(const BookKey: TBookKey; Rate: Integer);
const
  SQL_UPDATE = 'UPDATE Books Set LibRate = ? WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(0, Rate);
    query.SetParam(1, BookKey.BookID);
    query.SetParam(2, BookKey.DatabaseID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.SetProgress(const BookKey: TBookKey; Progress: Integer);
const
  SQL_UPDATE = 'UPDATE Books Set Progress = ? WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(0, Progress);
    query.SetParam(1, BookKey.BookID);
    query.SetParam(2, BookKey.DatabaseID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

function TSystemData_SQLite.GetReview(const BookKey: TBookKey): string;
const
  SQL_SELECT = 'SELECT Review WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_SELECT);
  try
    query.SetParam(0, BookKey.BookID);
    query.SetParam(1, BookKey.DatabaseID);
    query.Open;
    if not query.Eof  then
      Result := query.FieldAsBlobString(0)
    else
      Result := '';
  finally
    FreeAndNil(query);
  end;
end;

function TSystemData_SQLite.SetReview(const BookKey: TBookKey; const Review: string): Integer;
const
  SQL_UPDATE = 'UPDATE Books Set Review = ? WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetBlobParam(0, Review);
    query.SetParam(1, BookKey.BookID);
    query.SetParam(2, BookKey.DatabaseID);
    query.ExecSQL;

    if Review <> '' then
      Result := 1
    else
      Result := 0;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.SetLocal(const BookKey: TBookKey; Value: Boolean);
const
  SQL_UPDATE = 'UPDATE Books SET IsLocal = ? WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(0, Value);
    query.SetParam(1, BookKey.BookID);
    query.SetParam(2, BookKey.DatabaseID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.SetFileName(const BookKey: TBookKey; const FileName: string);
const
  SQL_UPDATE = 'UPDATE Books SET FileName = ? WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(0, FileName);
    query.SetParam(1, BookKey.BookID);
    query.SetParam(2, BookKey.DatabaseID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer);
const
  SQL_UPDATE = 'UPDATE Books SET SeriesID = ? WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    if NO_SERIES_ID = SeriesID then
      query.SetNullParam(0)
    else
      query.SetParam(0, SeriesID);
    query.SetParam(1, BookKey.BookID);
    query.SetParam(2, BookKey.DatabaseID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.SetFolder(const BookKey: TBookKey; const Folder: string);
const
  SQL_UPDATE = 'UPDATE Books SET Folder = ? WHERE BookID = ? AND DatabaseID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(0, Folder);
    query.SetParam(1, BookKey.BookID);
    query.SetParam(2, BookKey.DatabaseID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

// Result: true if added
function TSystemData_SQLite.AddGroup(const GroupName: string; const AllowDelete: Boolean = True): Boolean;
const
  SQL_SELECT = 'SELECT g.GroupID FROM Groups g WHERE g.GroupName = ? LIMIT 1 ';
  SQL_INSERT = 'INSERT INTO Groups (GroupName, AllowDelete) SELECT ?, ? ';
var
  Query: TSQLiteQuery;
begin
  Query := FDatabase.NewQuery(SQL_SELECT);
  try
    Query.SetParam(0, GroupName);
    Query.Open;
    Result := Query.Eof; // means doesn't exist yet
  finally
    FreeAndNil(Query);
  end;

  if Result then
  begin
    Query := FDatabase.NewQuery(SQL_INSERT);
    try
      Query.SetParam(0, GroupName);
      Query.SetParam(1, AllowDelete);
      Query.ExecSQL;
    finally
      FreeAndNil(Query);
    end;
  end;
end;

function TSystemData_SQLite.RenameGroup(GroupID: Integer; const NewName: string): Boolean;
const
  SQL = 'UPDATE Groups SET GroupName = ? WHERE GroupID = ? ';
var
  query: TSQLiteQuery;
begin
  Result := False;
  if InternalFindGroup(GroupID) then
  begin
    query := FDatabase.NewQuery(SQL);
    query.SetParam(0, NewName);
    query.SetParam(1, GroupID);
    query.ExecSQL;
    Result := True;
  end;
end;

//
// Удалить группу
//
procedure TSystemData_SQLite.DeleteGroup(GroupID: Integer);
begin
  InternalClearGroup(GroupID, True);
end;

//
// Очистить
//
procedure TSystemData_SQLite.ClearGroup(GroupID: Integer);
begin
  InternalClearGroup(GroupID, False);
end;

function TSystemData_SQLite.GetGroup(const GroupID: Integer): TGroupData;
const
  SQL = 'SELECT g.GroupName, g.AllowDelete FROM Groups g WHERE g.GroupID = ? ';
var
  query: TSQLiteQuery;
  groupData: TGroupData;
begin
  query := FDatabase.NewQuery(SQL);
  try
    query.SetParam(0, GroupID);
    query.Open;

    groupData.GroupID := GroupID;
    groupData.Text := query.FieldAsString(0);
    groupData.CanDelete := query.FieldAsBoolean(1);
  finally
    FreeAndNil(Query);
  end;
end;

procedure TSystemData_SQLite.AddBookToGroup(
  const BookKey: TBookKey;
  GroupID: Integer;
  const BookRecord: TBookRecord
);
const
  SQL_SELECT = 'SELECT BookID FROM Books WHERE BookID = ? AND DatabaseID = ? ';
  SQL_INSERT = 'INSERT INTO BOOKS (' +
    'LibID, Title, SeriesID, SeqNumber, UpdateDate, ' + // 0 .. 4
    'LibRate, Lang, Folder, FileName, InsideNo, ' +     // 5 .. 9
    'Ext, BookSize, IsLocal, IsDeleted, ' +             // 10 .. 13
    'KeyWords, Rate, Progress, Annotation, Review, ' +  // 14 .. 18
    'ExtraInfo, BookID, DatabaseID ) ' +                // 19 .. 21
    'SELECT ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ';

var
  stream: TStream;
  writer: TWriter;
  author: TAuthorData;
  genre: TGenreData;
  query: TSQLiteQuery;
  exists: Boolean;
begin
  query := FDatabase.NewQuery(SQL_SELECT);
  try
    query.SetParam(0, BookKey.BookID);
    query.SetParam(1, BookKey.DatabaseID);
    query.Open;
    exists := not query.Eof;
  finally
    FreeAndNil(query);
  end;

  if not exists then
  begin
    query := FDatabase.NewQuery(SQL_INSERT);
    try
      query.SetParam(0, BookRecord.LibID);
      query.SetParam(1, BookRecord.Title);
      query.SetParam(2, BookRecord.SeriesID);
      query.SetParam(3, BookRecord.SeqNumber);
      query.SetParam(4, BookRecord.Date);
      query.SetParam(5, BookRecord.LibRate);
      query.SetParam(6, BookRecord.Lang);
      query.SetParam(7, TPath.Combine(FActiveCollectionInfo.RootFolder, BookRecord.Folder));
      query.SetParam(8, BookRecord.FileName);
      query.SetParam(9, BookRecord.InsideNo);
      query.SetParam(10, BookRecord.FileExt);
      query.SetParam(11, BookRecord.Size);
      query.SetParam(12, bpIsLocal in BookRecord.BookProps);
      query.SetParam(13, bpIsDeleted in BookRecord.BookProps);
      query.SetParam(14, BookRecord.KeyWords);
      query.SetParam(15, BookRecord.Rate);
      query.SetParam(16, BookRecord.Progress);
      if BookRecord.Annotation = '' then
        query.SetNullParam(17)
      else
        query.SetParam(17, BookRecord.Annotation);
      if BookRecord.Review = '' then
        query.SetNullParam(18)
      else
        query.SetBlobParam(18, BookRecord.Review);

      stream := TMemoryStream.Create;
      try
        writer := TWriter.Create(stream, 4096);
        try
          writer.WriteString(BookRecord.Series);

          writer.WriteListBegin;
          for Author in BookRecord.Authors do
          begin
            writer.WriteString(Author.LastName);
            writer.WriteString(Author.FirstName);
            writer.WriteString(Author.MiddleName);
            writer.WriteInteger(Author.AuthorID);
          end;
          writer.WriteListEnd;

          writer.WriteListBegin;
          for genre in BookRecord.Genres do
          begin
            writer.WriteString(genre.GenreCode);
            writer.WriteString(genre.FB2GenreCode);
            writer.WriteString(genre.GenreAlias);
          end;
          writer.WriteListEnd;
        finally
          FreeAndNil(writer);
        end;
        query.SetBlobParam(19, stream);
      finally
        stream.Free;
      end;

      query.SetParam(20, BookKey.BookID);
      query.SetParam(21, BookKey.DatabaseID);

      query.ExecSQL;
    finally
      FreeAndNil(query);
    end;
  end;

  //
  // Поместить книгу в нужную группу
  //
  CopyBookToGroup(BookKey, 0, GroupID, False);
end;

//
// Удалить указанную книгу из указанной группы.
// NOTE: этот метод не удаляет неиспользуемые книги !!! После его вызова обязательно нужно вызвать RemoveUnusedBooks
//
procedure TSystemData_SQLite.DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer);
const
  SQL_DELETE_BOOKGROUPS = 'DELETE FROM BookGroups WHERE BookID = ? AND GroupID = ? ';
var
  query: TSQLiteQuery;
begin
  //
  // Удалить книги из группы
  //
  query := FDatabase.NewQuery(SQL_DELETE_BOOKGROUPS);
  try
    query.SetParam(0, BookKey.BookID);
    query.SetParam(1, GroupID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;
end;

//
// Удалить книги, не входящие в группы
//
procedure TSystemData_SQLite.RemoveUnusedBooks;
const
  SQL: string =
      'DELETE FROM Books WHERE NOT EXISTS( ' +
      ' SELECT 1 FROM BookGroups g ' +
      ' WHERE g.BookID = Books.BookID AND g.DatabaseID = Books.DatabaseID ' +
      ')';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL);
  try
    query.ExecSQL;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TSystemData_SQLite.CopyBookToGroup(
  const BookKey: TBookKey;
  SourceGroupID: Integer;
  TargetGroupID: Integer;
  MoveBook: Boolean
);
const
  SQL_SELECT = 'SELECT BookID FROM BookGroups WHERE GroupID = ? AND BookID = ? AND DatabaseID = ? ';
  SQL_MOVE = 'UPDATE BookGroups SET GroupID = ? WHERE GroupID = ? AND BookID = ? AND DatabaseID = ? ';
  SQL_ADD = 'INSERT INTO BookGroups (GroupID, BookID, DatabaseID) SELECT ?, ?, ? ';
var
  query: TSQLiteQuery;
  foundTarget: Boolean;
  foundSource: Boolean;
begin
  query := FDatabase.NewQuery(SQL_SELECT);
  try
    query.SetParam(0, TargetGroupID);
    query.SetParam(1, BookKey.BookID);
    query.SetParam(2, BookKey.DatabaseID);
    query.Open;
    foundTarget := not query.Eof;
  finally
    FreeAndNil(query);
  end;

  if foundTarget then
    Exit; // Skip, book already in the target group

  if MoveBook then
  begin
    query := FDatabase.NewQuery(SQL_SELECT);
    try
      query.SetParam(0, SourceGroupID);
      query.SetParam(1, BookKey.BookID);
      query.SetParam(2, BookKey.DatabaseID);
      query.Open;
      foundSource := not query.Eof;
    finally
      FreeAndNil(query);
    end;

    if foundSource then
    begin
      query := FDatabase.NewQuery(SQL_MOVE);
      try
        query.SetParam(0, TargetGroupID);
        query.SetParam(1, SourceGroupID);
        query.SetParam(2, BookKey.BookID);
        query.SetParam(3, BookKey.DatabaseID);
        query.ExecSQL;
      finally
        FreeAndnil(query);
      end;
    end;
  end
  else
  begin
    query := FDatabase.NewQuery(SQL_ADD);
    try
      query.SetParam(0, TargetGroupID);
      query.SetParam(1, BookKey.BookID);
      query.SetParam(2, BookKey.DatabaseID);
      query.ExecSQL;
    finally
      FreeAndnil(query);
    end;
  end;
end;

procedure TSystemData_SQLite.ImportUserData(data: TUserData);
const
  SQL_SELECT = 'SELECT GroupID FROM Groups WHERE GroupName = ? ';
  SQL_INSERT = 'INSERT INTO Groups (GroupName, AllowDelete) SELECT ?, ? ';
var
  group: TBookGroup;
  querySelect: TSQLiteQuery;
  queryInsert: TSQLiteQuery;

begin
  Assert(Assigned(data));

  querySelect := FDatabase.NewQuery(SQL_SELECT);
  try
    queryInsert := FDatabase.NewQuery(SQL_INSERT);
    try
      for group in data.Groups do
      begin
        querySelect.Reset;
        querySelect.SetParam(0, group.GroupName);
        querySelect.Open;
        if not querySelect.Eof then
          group.GroupID := querySelect.FieldAsInt(0)
        else
        begin
          queryInsert.Reset;
          queryInsert.SetParam(0, group.GroupName);
          queryInsert.SetParam(1, True);
          queryInsert.ExecSQL;
          group.GroupID := FDatabase.LastInsertRowID;
        end;
      end;

    finally
      FreeAndNil(queryInsert);
    end;
  finally
    FreeAndNil(querySelect);
  end;
end;

// Change SeriesID value for all books having DatabaseID and old SeriesID value
procedure TSystemData_SQLite.ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer);
const
  UPDATE_SQL = 'UPDATE Books SET SeriesID = ? WHERE DatabaseID = ? AND SeriesID = ? ';
var
  query: TSQLiteQuery;
begin
  if OldSeriesID <> NewSeriesID then
  begin
    query := FDatabase.NewQuery(UPDATE_SQL);
    try
      if NO_SERIES_ID = NewSeriesID then
        query.SetNullParam(0)
      else
        query.SetParam(0, NewSeriesID);

      query.SetParam(1, DatabaseID);

      if NO_SERIES_ID = OldSeriesID then
        query.SetNullParam(2)
      else
        query.SetParam(2, OldSeriesID);
      query.ExecSQL;
    finally
      FreeAndNil(query);
    end;
  end;
end;

function TSystemData_SQLite.GetBookIterator(const GroupID: Integer; const DatabaseID: Integer = INVALID_COLLECTION_ID): IBookIterator;
begin
  Result := TBookIteratorImpl.Create(Self, GroupID, DatabaseID);
end;

function TSystemData_SQLite.GetGroupIterator: IGroupIterator;
begin
  Result := TGroupIteratorImpl.Create(Self);
end;

function TSystemData_SQLite.GetCollectionInfoIterator: ICollectionInfoIterator;
begin
  Result := TCollectionInfoIteratorImpl.Create(Self);
end;

procedure TSystemData_SQLite.InternalClearGroup(GroupID: Integer; RemoveGroup: Boolean);
const
  SQL_DELETE_BOOKGROUPS = 'DELETE FROM BookGroups WHERE GroupID = ? ';
  SQL_DELETE_GROUPS = 'DELETE FROM Groups WHERE GroupID = ? AND AllowDelete = ? ';
var
  query: TSQLiteQuery;
begin
  //
  // Удалить книги из группы
  //
  query := FDatabase.NewQuery(SQL_DELETE_BOOKGROUPS);
  try
    query.SetParam(0, GroupID);
    query.ExecSQL;
  finally
    FreeAndNil(query);
  end;

  //
  // Удалить неиспользуемые книги
  //
  RemoveUnusedBooks;

  //
  // Удалить группу
  //
  if RemoveGroup then
  begin
    query := FDatabase.NewQuery(SQL_DELETE_GROUPS);
    try
      query.SetParam(0, GroupID);
      query.SetParam(1, True); // Delete only if AllowDelete is true
      query.ExecSQL;
    finally
      FreeAndNil(query);
    end;
  end;
end;

function TSystemData_SQLite.InternalFindGroup(const GroupName: string): Boolean;
const
  SQL = 'SELECT GroupID FROM Groups WHERE GroupName = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL);
  try
    query.SetParam(0, GroupName);
    query.Open;
    Result := not query.Eof;
  finally
    FreeAndNil(query);
  end;
end;

function TSystemData_SQLite.InternalFindGroup(GroupID: Integer): Boolean;
const
  SQL = 'SELECT GroupID FROM Groups WHERE GroupID = ? ';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL);
  try
    query.SetParam(0, GroupID);
    query.Open;
    Result := not query.Eof;
  finally
    FreeAndNil(query);
  end;
end;

procedure TSystemData_SQLite.PrepareCollectionPath(var CollectionRoot, CollectionFile: string);
var
  dataDirPath: string;
begin
  //
  // Получим полные пути. Если были указаны относительные пути, то в качестве базового используем DataPath.
  //
  CollectionRoot := TMHLSettings.ExpandCollectionRoot(CollectionRoot);
  CollectionFile := TMHLSettings.ExpandCollectionFileName(CollectionFile);

  //
  // Создадим необходимые каталоги
  //
  TDirectory.CreateDirectory(CollectionRoot);
  TDirectory.CreateDirectory(TPath.GetDirectoryName(CollectionFile));

  //
  // Получим относительные пути. В качестве базового используем DataPath.
  //
  dataDirPath := Settings.DataPath;
  CollectionRoot := ExtractRelativePath(dataDirPath, CollectionRoot);
  CollectionFile := ExtractRelativePath(dataDirPath, CollectionFile);
end;

end.
