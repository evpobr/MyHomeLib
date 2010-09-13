unit unit_SystemDatabase_SQLite;

interface

uses
  unit_SystemDatabase_Abstract,
  SQLiteWrap,
  unit_Interfaces,
  unit_Globals,
  unit_Consts;

type
  TSystemData_SQLite = class(TSystemData)
  strict private
  type
//    TBookIteratorImpl = class(TInterfacedObject, IBookIterator)
//    public
//      constructor Create(User: TSystemData_SQLite; const Filter: string);
//      destructor Destroy; override;
//
//    protected
//      //
//      // IBookIterator
//      //
//      function Next(out BookRecord: TBookRecord): Boolean;
//      function RecordCount: Integer;
//
//    private
//      FUser: TSystemData_SQLite;
//      FBooks: TSQLiteQuery;
//
//      procedure PrepareData(const Filter: string);
//    end;
//    // << TBookIteratorImpl

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
      FRecordCount: Integer;

      procedure PrepareData;
    end;
    // << TGroupIteratorImpl

    TCollectionInfoIteratorImpl = class(TInterfacedObject, ICollectionInfoIterator)
    public
      constructor Create(User: TSystemData_SQLite);
      destructor Destroy; override;

    protected
      //
      // IGroupIterator
      //
      function Next(out CollectionInfo: TCollectionInfo): Boolean;
      function RecordCount: Integer;

    private
      FUser: TSystemData_SQLite;
      FBases: TSQLiteQuery;
      FRecordCount: Integer;

      procedure PrepareData;
    end;
    // << TCollectionInfoIteratorImpl

  public
    constructor Create(const DBUserFile: string);
    destructor Destroy; override;

    function GetCollectionInfo(const CollectionID: Integer; out CollectionInfo: TCollectionInfo): Boolean; override;
//    procedure UpdateCollectionInfo(const CollectionInfo: TCollectionInfo); override;
//
    function ActivateCollection(CollectionID: Integer): Boolean; override;
    procedure RegisterCollection(
      const DisplayName: string;
      const RootFolder: string;
      const DBFileName: string;
      CollectionType: COLLECTION_TYPE;
      AllowDelete: Boolean;
      Version: Integer = UNVERSIONED_COLLECTION;
      const Notes: string = '';
      const URL: string = '';
      const Script: string = '';
      const User: string = '';
      const Password: string = ''
    ); override;
    function FindCollectionWithProp(
      PropID: TCollectionProp;
      const Value: string;
      IgnoreID: Integer = INVALID_COLLECTION_ID
    ): Boolean; override;
//    procedure DeleteCollection(CollectionID: Integer); override;
//
//    procedure GetBookLibID(const BookKey: TBookKey; out ARes: string); override; // deprecated;
//
//    function ActivateGroup(const ID: Integer): Boolean; override;
//
//    procedure GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord); override;
//    procedure DeleteBook(const BookKey: TBookKey); override;
//    procedure UpdateBook(const BookRecord: TBookRecord); override;
//
//    procedure SetExtra(const BookKey: TBookKey; extra: TBookExtra); override;
//    procedure SetRate(const BookKey: TBookKey; Rate: Integer); override;
//    procedure SetProgress(const BookKey: TBookKey; Progress: Integer); override;
//    function GetReview(const BookKey: TBookKey): string; override;
//    function SetReview(const BookKey: TBookKey; const Review: string): Integer; override;
//    procedure SetLocal(const BookKey: TBookKey; Value: Boolean); override;
//    procedure SetFileName(const BookKey: TBookKey; const FileName: string); override;
//    procedure SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer); override;
//    procedure SetFolder(const BookKey: TBookKey; const Folder: string); override;
//
//
//    //
//    // Работа с группами
//    //
    function AddGroup(const GroupName: string; const AllowDelete: Boolean = True): Boolean; override;
//    function RenameGroup(GroupID: Integer; const NewName: string): Boolean; override;
//    procedure DeleteGroup(GroupID: Integer); override;
//    procedure ClearGroup(GroupID: Integer); override;
    function GetGroup(const GroupID: Integer): TGroupData; override;
//
//    procedure AddBookToGroup(const BookKey: TBookKey; GroupID: Integer; const BookRecord: TBookRecord); override;
//    procedure DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer); override;
//    procedure RemoveUnusedBooks; override;
//    procedure CopyBookToGroup(
//      const BookKey: TBookKey;
//      SourceGroupID: Integer;
//      TargetGroupID: Integer;
//      MoveBook: Boolean
//    ); override;
//
//    //
//    // Пользовательские данные
//    //
//    procedure ImportUserData(data: TUserData); override;
//
//    // Batch update methods:
//    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer); override;
//
//    //Iterators:
//    function GetBookIterator(const Filter: string): IBookIterator; override;
    function GetGroupIterator: IGroupIterator; override;
    function GetCollectionInfoIterator: ICollectionInfoIterator; override;

  private
    FDatabase: TSQLiteDatabase;
  end;

procedure CreateSystemTables_SQLite(const DBUserFile: string);

implementation

uses
  Classes,
  SysUtils,
  unit_SQLiteUtils;

// Generate table structure and minimal system data
procedure CreateSystemTables_SQLite(const DBUserFile: string);
var
  ADatabase: TSQLiteDatabase;
  StringList: TStringList;
  StructureDDL: string;
  SystemData: TSystemData;
begin
  ADatabase := TSQLiteDatabase.Create(DBUserFile);
  try
    StringList := ReadResourceAsStringList('CreateSystemDB_SQLite');
    try
      for StructureDDL in StringList do
      begin
        if Trim(StructureDDL) <> '' then
          ADatabase.ExecSQL(StructureDDL);
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
  try
    SystemData.AddGroup(rstrFavoritesGroupName, False);
    SystemData.AddGroup(rstrToReadGroupName, False);
  finally
    FreeAndNil(SystemData);
  end;
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
  Result := FRecordCount;
end;

procedure TSystemData_SQLite.TGroupIteratorImpl.PrepareData;
const
  SQL_COUNT = 'SELECT COUNT(*) FROM Groups ';
  SQL_ROWS = 'SELECT g.GroupID, g.GroupName, g.AllowDelete FROM Groups g ';
begin
  FRecordCount := FUser.FDatabase.GetTableInt(SQL_COUNT);

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

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TSystemData_SQLite.TCollectionInfoIteratorImpl.Next(out CollectionInfo: TCollectionInfo): Boolean;
begin
  Result := not FBases.Eof;

  if Result then
  begin
    FUser.GetCollectionInfo(FBases.FieldAsInt(0), CollectionInfo);
    FBases.Next;
  end;
end;

function TSystemData_SQLite.TCollectionInfoIteratorImpl.RecordCount: Integer;
begin
  Result := FRecordCount;
end;

procedure TSystemData_SQLite.TCollectionInfoIteratorImpl.PrepareData;
const
  SQL_COUNT = 'SELECT COUNT(*) FROM Bases b ';
  SQL_ROWS = 'SELECT b.ID FROM Bases b ';
begin
  FRecordCount := FUser.FDatabase.GetTableInt(SQL_COUNT);

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

  collectionID := FindFirstExistingCollectionID(1);
  if collectionID > 0 then
    ActivateCollection(collectionID);
end;

destructor TSystemData_SQLite.Destroy;
begin
  inherited Destroy;

  FreeAndNil(FDatabase);
end;

function TSystemData_SQLite.GetCollectionInfo(const CollectionID: Integer; out CollectionInfo: TCollectionInfo): Boolean;
const
  SQL_SELECT = 'SELECT bs.BaseName, bs.RootFolder, bs.DBFileName, bs.Code, bs.CreationDate, ' +
    'bs.Version, bs.AllowDelete, bs.Notes, bs.LibUser, bs.LibPassword, bs.URL, bs.ConnectionScript, bs.Settings ' +
    'FROM Bases bs WHERE bs.ID = ?';
var
  query: TSQLiteQuery;
  stream: TStream;
begin
  query := FDatabase.NewQuery(SQL_SELECT);
  try
    query.SetParam(0, CollectionID);
    query.Open;
    Result := not query.Eof;
    if not query.Eof then
    begin
      CollectionInfo.ID := CollectionID;
      CollectionInfo.Name := query.FieldAsString(0);
      CollectionInfo.RootFolder := query.FieldAsString(1);
      CollectionInfo.DBFileName := query.FieldAsString(2);
      CollectionInfo.CollectionType := query.FieldAsInt(3); // code
      CollectionInfo.CreationDate := query.FieldAsDateTime(4);

      if query.FieldIsNull(5) then
        CollectionInfo.Version := UNVERSIONED_COLLECTION
      else
        CollectionInfo.Version := query.FieldAsInt(5);

      if query.FieldIsNull(6) then
        CollectionInfo.AllowDelete := True
      else
        CollectionInfo.AllowDelete := query.FieldAsBoolean(6);

      CollectionInfo.Notes := query.FieldAsString(7);
      CollectionInfo.User := query.FieldAsString(8);
      CollectionInfo.Password := query.FieldAsString(9);
      CollectionInfo.URL := query.FieldAsString(10);
      CollectionInfo.Script := query.FieldAsString(11);

      stream := query.FieldAsBlob(12);
      try
        Assert(Assigned(CollectionInfo.Settings));
        CollectionInfo.Settings.LoadFromStream(stream);
      finally
        FreeAndNil(stream);
      end;

    end
    else
    begin
      CollectionInfo.Clear;
    end;
  finally
    FreeAndNil(query);
  end;
end;

function TSystemData_SQLite.ActivateCollection(CollectionID: Integer): Boolean;
begin
  Assert(CollectionID > 0);
  Result := GetCollectionInfo(CollectionID, FActiveCollectionInfo);
end;

procedure TSystemData_SQLite.RegisterCollection(
  const DisplayName: string;
  const RootFolder: string;
  const DBFileName: string;
  CollectionType: COLLECTION_TYPE;
  AllowDelete: Boolean;
  Version: Integer;
  const Notes: string;
  const URL: string;
  const Script: string;
  const User: string;
  const Password: string
  );
const
  SQL_INSERT = 'INSERT INTO Bases ' +
    '(BaseName, RootFolder, DBFileName, Code, CreationDate, ' +
    'Version, AllowDelete, Notes, LibUser, LibPassword, URL, ConnectionScript) ' +
    'SELECT ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ';
var
  query: TSQLiteQuery;
  collectionID: Integer;
begin
  //
  // регистрируем коллекцию
  //
  query := FDatabase.NewQuery(SQL_INSERT);
  try
    query.SetParam(0, DisplayName);
    query.SetParam(1, RootFolder);
    query.SetParam(2, DBFileName);
    query.SetParam(3, CollectionType);
    query.SetParam(4, Now);
    query.SetParam(5, Version);
    query.SetParam(6, AllowDelete);
    query.SetParam(7, Notes);
    query.SetParam(8, User);
    query.SetParam(9,Password);
    query.SetParam(10,URL);
    if Script <> '' then
      query.SetBlobParam(11, Script)
    else
      query.SetNullParam(11);

    query.ExecSQL;
    collectionID := FDatabase.LastInsertRowID;
  finally
    FreeAndNil(query);
  end;

  // Switch to the newly added collection:
  ActivateCollection(collectionID);
end;


function TSystemData_SQLite.FindCollectionWithProp(PropID: TCollectionProp; const Value: string; IgnoreID: Integer): Boolean;
var
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: TCollectionInfo;
  Match: Boolean;
begin
  CollectionInfoIterator := GetCollectionInfoIterator;

  Result := False;
  if CollectionInfoIterator.RecordCount = 0 then
    Exit;

  CollectionInfo := TCollectionInfo.Create;
  try
    while (CollectionInfoIterator.Next(CollectionInfo)) do
    begin
      case PropID of
      cpDisplayName:
        Match := (CollectionInfo.Name = Value);
      cpFileName:
        Match := (CollectionInfo.DBFileName = Value);
      cpRootFolder:
        Match := (CollectionInfo.RootFolder = Value);
      else
        Assert(False);
      end;

      if Match and ((IgnoreID = INVALID_COLLECTION_ID) or (IgnoreID <> CollectionInfo.ID)) then
      begin
        Result := True;
        Exit;
      end;
    end;
  finally
    FreeAndNil(CollectionInfo);
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

function TSystemData_SQLite.GetGroupIterator: IGroupIterator;
begin
  Result := TGroupIteratorImpl.Create(Self);
end;

function TSystemData_SQLite.GetCollectionInfoIterator: ICollectionInfoIterator;
begin
  Result := TCollectionInfoIteratorImpl.Create(Self);
end;


end.
