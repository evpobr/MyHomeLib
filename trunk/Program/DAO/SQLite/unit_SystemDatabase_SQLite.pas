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
      // IGroupIterator
      //
      function Next(out CollectionInfo: TCollectionInfo): Boolean;
      function RecordCount: Integer;

    private
      FUser: TSystemData_SQLite;
      FBases: TSQLiteQuery;
      FCount: TSQLiteQuery;

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
    procedure GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord); override;
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

    procedure AddBookToGroup(const BookKey: TBookKey; GroupID: Integer; const BookRecord: TBookRecord); override;
//    procedure DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer); override;
//    procedure RemoveUnusedBooks; override;
    procedure CopyBookToGroup(
      const BookKey: TBookKey;
      SourceGroupID: Integer;
      TargetGroupID: Integer;
      MoveBook: Boolean
    ); override;
//
//    //
//    // Пользовательские данные
//    //
//    procedure ImportUserData(data: TUserData); override;
//
//    // Batch update methods:
//    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer); override;
//
    //Iterators:
    function GetBookIterator(const GroupID: Integer; const DatabaseID: Integer = INVALID_COLLECTION_ID): IBookIterator; override;
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
  IOUtils,
  unit_SQLiteUtils;

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
  SystemData.AddGroup(rstrFavoritesGroupName, False);
  SystemData.AddGroup(rstrToReadGroupName, False);
end;

{ TBookIteratorImpl }

constructor TSystemData_SQLite.TBookIteratorImpl.Create(User: TSystemData_SQLite; const GroupID: Integer; const DatabaseID: Integer);
var
  pLogger: IIntervalLogger;
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
  Assert(Assigned(FCount), 'Calling RecordCount more than once!');

  FCount.Open;
  Result := FCount.FieldAsInt(0);
  FreeAndNil(FCount);
end;

procedure TSystemData_SQLite.TCollectionInfoIteratorImpl.PrepareData;
const
  SQL_COUNT = 'SELECT COUNT(*) FROM Bases b ';
  SQL_ROWS = 'SELECT b.ID FROM Bases b ';
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

procedure TSystemData_SQLite.GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord);
const
  SQL_SELECT = 'SELECT ' +
    'LibID, Title, SeriesID, SeqNumber, UpdateDate, ' + // 0 .. 4
    'LibRate, Lang, Folder, FileName, InsideNo, ' +     // 5 .. 9
    'Ext, BookSize, Code, IsLocal, IsDeleted, ' +       // 10 .. 14
    'KeyWords, Rate, Progress, Annotation, Review, ' +  // 15 .. 19
    'ExtraInfo ' +                                      // 20
    'FROM Books WHERE BookID = ? AND DatabaseID = ? ';
var
  stream: TStream;
  reader: TReader;
  author: TAuthorData;
  genre: TGenreData;
  query: TSQLiteQuery;
  collectionInfo: TCollectionInfo;
begin
  query := FDatabase.NewQuery(SQL_SELECT);
  try
    query.SetParam(0, BookKey.BookID);
    query.SetParam(1, BookKey.DatabaseID);
    query.Open;
    Assert(not query.Eof);

    BookRecord.LibID := query.FieldAsInt(0);
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
    BookRecord.Code := query.FieldAsInt(12);
    BookRecord.IsLocal := query.FieldAsBoolean(13);
    BookRecord.IsDeleted := query.FieldAsBoolean(14);
    BookRecord.KeyWords := query.FieldAsString(15);
    BookRecord.LibRate := query.FieldAsInt(16);
    BookRecord.Progress := query.FieldAsInt(17);
    BookRecord.Annotation := query.FieldAsBlobString(18);
    BookRecord.Review := query.FieldAsBlobString(19);
    BookRecord.NodeType := ntBookInfo;
    BookRecord.BookKey := BookKey;

    stream := query.FieldAsBlob(20);
    try
      reader := TReader.Create(stream, 4096);
      try
        BookRecord.Series := reader.ReadString;
        Assert((BookRecord.SeriesID = NO_SERIES_ID) = (BookRecord.Series = NO_SERIES_TITLE));

        reader.ReadListBegin;
        while not reader.EndOfList do
        begin
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

  if GetCollectionInfo(BookRecord.BookKey.DatabaseID, collectionInfo) then
  begin
    // Please notice that the collection for a book in a group might not match ActiveCollection
    // Need to use values from tblBases instead
    BookRecord.CollectionName := collectionInfo.Name;
    BookRecord.CollectionRoot := IncludeTrailingPathDelimiter(collectionInfo.RootFolder);
  end
  else
  begin
    BookRecord.CollectionName := rstrUnknownCollection;
    BookRecord.CollectionRoot := '';
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
    'Ext, BookSize, Code, IsLocal, IsDeleted, ' +       // 10 .. 14
    'KeyWords, Rate, Progress, Annotation, Review, ' +  // 15 .. 19
    'ExtraInfo, BookID, DatabaseID ) ' +                // 20 .. 22
    'SELECT ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ';

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
      query.SetParam(12, BookRecord.Code);
      query.SetParam(13, BookRecord.IsLocal);
      query.SetParam(14, BookRecord.IsDeleted);
      query.SetParam(15, BookRecord.KeyWords);
      query.SetParam(16, BookRecord.Rate);
      query.SetParam(17, BookRecord.Progress);
      query.SetBlobParam(18, BookRecord.Annotation);
      query.SetBlobParam(19, BookRecord.Review);

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
        query.SetBlobParam(20, stream);
      finally
        stream.Free;
      end;

      query.SetParam(21, BookKey.BookID);
      query.SetParam(22, BookKey.DatabaseID);

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


end.
