(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors             eg
  * Created             12.09.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_SystemDatabase_ABS;

interface

uses
  Classes,
  DB,
  ABSMain,
  Controls,
  unit_Globals,
  unit_Consts,
  unit_Interfaces,
  UserData,
  unit_SystemDatabase_Abstract;

type
  TSystemData_ABS = class(TSystemData)
  private
    FDatabase: TABSDatabase;
    FDefaultSession: Boolean;
    FSession: TABSSession;

    tblBases: TABSTable;
    tblBasesID: TAutoIncField;
    tblBasesBaseName: TWideStringField;
    tblBasesRootFolder: TWideStringField;
    tblBasesDBFileName: TWideStringField;
    tblBasesNotes: TWideStringField;
    tblBasesDate: TDateField;
    tblBasesVersion: TIntegerField;
    tblBasesCode: TIntegerField;
    tblBasesAllowDelete: TBooleanField;
    tblBasesSettings: TWideMemoField;
    tblBasesIcon: TBlobField;
    tblBasesURL: TWideStringField;
    tblBasesUser: TWideStringField;
    tblBasesPass: TWideStringField;
    tblBasesConnection: TWideMemoField;

    Groups: TABSTable;
    GroupsGroupID: TAutoIncField;
    GroupsGroupName: TWideStringField;
    GroupsAllowDelete: TBooleanField;
    GroupsNotes: TMemoField;
    GroupsIcon: TBlobField;

    AllBooks: TABSTable;
    AllBooksBookID: TIntegerField;
    AllBooksDatabaseID: TIntegerField;
    AllBooksLibID: TIntegerField;
    AllBooksTitle: TWideStringField;
    AllBooksSeriesID: TIntegerField;
    AllBooksSeqNumber: TSmallintField;
    AllBooksDate: TDateField;
    AllBooksLibRate: TIntegerField;
    AllBooksLang: TWideStringField;
    AllBooksFolder: TWideStringField;
    AllBooksFileName: TWideStringField;
    AllBooksInsideNo: TIntegerField;
    AllBooksExt: TWideStringField;
    AllBooksSize: TIntegerField;
    AllBooksCode: TSmallintField;
    AllBooksIsLocal: TBooleanField;
    AllBooksIsDeleted: TBooleanField;
    AllBooksKeyWords: TWideStringField;
    AllBooksAnnotation: TWideMemoField;
    AllBooksReview: TWideMemoField;
    AllBooksRate: TIntegerField;
    AllBooksProgress: TSmallintField;
    AllBooksExtraInfo: TBlobField;

    AllBookGroups: TABSTable;
    AllBookGroupsBookID: TIntegerField;
    AllBookGroupsDatabaseID: TIntegerField;
    AllBookGroupsGroupID: TIntegerField;

  strict private
  type
    TBookIteratorImpl = class(TInterfacedObject, IBookIterator)
    public
      constructor Create(User: TSystemData_ABS; const Filter: string);
      destructor Destroy; override;

    protected
      //
      // IBookIterator
      //
      function Next(out BookRecord: TBookRecord): Boolean;
      function RecordCount: Integer;

    private
      FUser: TSystemData_ABS;
      FBooks: TABSQuery;
      FBookID: TIntegerField;
      FDatabaseID: TIntegerField;

      function CreateSQL(const Filter: string): string;
    end;
    // << TBookIteratorImpl


    TGroupIteratorImpl = class(TInterfacedObject, IGroupIterator)
    public
      constructor Create(User: TSystemData_ABS);
      destructor Destroy; override;

    protected
      //
      // IGroupIterator
      //
      function Next(out Group: TGroupData): Boolean;
      function RecordCount: Integer;

    private
      FUser: TSystemData_ABS;
      FGroups: TABSQuery;
      FGroupID: TIntegerField;
      FGroupName: TWideStringField;
      FAllowDelete: TBooleanField;

      function CreateSQL: string;
    end;
    // << TGroupIteratorImpl

    TCollectionInfoIteratorImpl = class(TInterfacedObject, ICollectionInfoIterator)
    public
      constructor Create(User: TSystemData_ABS);
      destructor Destroy; override;

    protected
      //
      // IGroupIterator
      //
      function Next(out CollectionInfo: TCollectionInfo): Boolean;
      function RecordCount: Integer;

    private
      FUser: TSystemData_ABS;
      FBases: TABSQuery;
      FBasesID: TIntegerField;

      function CreateSQL: string;
    end;
    // << TCollectionInfoIteratorImpl

  private
    function InternalFindGroup(const GroupName: string): Boolean; overload; inline;
    function InternalFindGroup(GroupID: Integer): Boolean; overload; inline;
    function InternalAddGroup(const GroupName: string; out GroupID: Integer; const AllowDelete: Boolean = True): Boolean;
    procedure InternalClearGroup(GroupID: Integer; RemoveGroup: Boolean);

  public
    constructor Create(const DBSystemFile: string; ADefaultSession: Boolean = True);
    destructor Destroy; override;

    function ActivateCollection(CollectionID: Integer): Boolean; override;
    function GetCollectionInfo(const CollectionID: Integer; out CollectionInfo: TCollectionInfo): Boolean; override;
    procedure UpdateCollectionInfo(const CollectionInfo: TCollectionInfo); override;

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

    procedure DeleteCollection(CollectionID: Integer); override;

//    procedure SetTableState(State: Boolean);

  public
    procedure GetBookLibID(const BookKey: TBookKey; out ARes: string); override;// deprecated;

    function ActivateGroup(const ID: Integer): Boolean; override;


    //
    //
    //
    procedure GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord); override;
    procedure DeleteBook(const BookKey: TBookKey); override;

    procedure SetExtra(const BookKey: TBookKey; extra: TBookExtra); override;
    procedure SetRate(const BookKey: TBookKey; Rate: Integer); override;
    procedure SetProgress(const BookKey: TBookKey; Progress: Integer); override;
    function GetReview(const BookKey: TBookKey): string; override;
    function SetReview(const BookKey: TBookKey; const Review: string): Integer; override;
    procedure SetLocal(const BookKey: TBookKey; Value: Boolean); override;
    procedure SetFileName(const BookKey: TBookKey; const FileName: string); override;
    procedure SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer); override;
    procedure SetFolder(const BookKey: TBookKey; const Folder: string); override;

    procedure UpdateBook(const BookRecord: TBookRecord); override;

    //
    // Работа с группами
    //
    function AddGroup(const GroupName: string; const AllowDelete: Boolean = True): Boolean; override;
    function RenameGroup(GroupID: Integer; const NewName: string): Boolean; override;
    procedure DeleteGroup(GroupID: Integer); override;
    procedure ClearGroup(GroupID: Integer); override;
    function GetGroup(const GroupID: Integer): TGroupData; override;

    procedure AddBookToGroup(const BookKey: TBookKey; GroupID: Integer; const BookRecord: TBookRecord); override;
    procedure DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer); override;
    procedure RemoveUnusedBooks; override;
    procedure CopyBookToGroup(
      const BookKey: TBookKey;
      SourceGroupID: Integer;
      TargetGroupID: Integer;
      MoveBook: Boolean
    ); override;

    //
    // Пользовательские данные
    //
    procedure ImportUserData(data: TUserData); override;

    // Batch update methods:
    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer); override;

    //Iterators:
    function GetBookIterator(const Filter: string): IBookIterator; override;
    function GetGroupIterator: IGroupIterator; override;
    function GetCollectionInfoIterator: ICollectionInfoIterator; override;

  strict private
    procedure MountTables(const Mounted: Boolean);
  end;

  procedure CreateSystemTables_ABS(const DBUserFile: string);


implementation

uses
  SysUtils,
  StrUtils,
  IOUtils,
  Variants,
  Windows,
  unit_SearchUtils,
  unit_Settings,
  unit_Logger,
  unit_ABSUtils;

resourcestring
  rstrNamelessColection = 'безымянная коллекция';
  rstrUnknownCollection = 'неизвестная коллекция';
  rstrFavoritesGroupName = 'Избранное';
  rstrToReadGroupName = 'К прочтению';

const
  USER_DATABASE = 'UserDB';

procedure CreateSystemTables_ABS(const DBUserFile: string);
var
  ADatabase: TABSDatabase;
  createScript: TStream;
  createQuery: TABSQuery;
  Groups: TABSTable;
begin
  ADatabase := TABSDatabase.Create(nil);
  try
    ADatabase.DatabaseName := USER_DATABASE;
    ADatabase.DatabaseFileName := DBUserFile;
    ADatabase.MaxConnections := 5;

    ADatabase.CreateDatabase;

    createScript := TResourceStream.Create(HInstance, 'CreateSystemDB_ABS', RT_RCDATA);
    try
      createQuery := TABSQueryEx.Create(ADatabase, '');
      try
        createQuery.SQL.LoadFromStream(createScript);
        createQuery.ExecSQL;
      finally
        FreeAndNil(createQuery);
      end;
    finally
      FreeAndNil(createScript);
    end;

    //
    // Зададим дефлотные группы
    //
    Groups := TABSTableEx.Create(ADatabase, 'Groups');
    try
      Groups.Active := True;

      Groups.AppendRecord([FAVORITES_GROUP_ID, rstrFavoritesGroupName, False]);
      Groups.AppendRecord([FAVORITES_GROUP_ID + 1, rstrToReadGroupName, False]);
    finally
      FreeAndNil(Groups);
    end;
  finally
    FreeAndNil(ADatabase);
  end;
end;

{ TBookIteratorImpl }

constructor TSystemData_ABS.TBookIteratorImpl.Create(User: TSystemData_ABS; const Filter: string);
var
  pLogger: IIntervalLogger;
begin
  inherited Create;

  Assert(Assigned(User));

  FUser := User;

  FBooks := TABSQueryEx.Create(FUser.FDatabase, CreateSQL(Filter));
  FBooks.ReadOnly := True;

  pLogger := GetIntervalLogger('TBookIteratorImpl.Create', FBooks.SQL.Text);
  FBooks.Active := True;
  pLogger := nil;

  FBookID := FBooks.FieldByName(BOOK_ID_FIELD) as TIntegerField;
  FDatabaseID := FBooks.FieldByName(DB_ID_FIELD) as TIntegerField;
end;

destructor TSystemData_ABS.TBookIteratorImpl.Destroy;
begin
  FreeAndNil(FBooks);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TSystemData_ABS.TBookIteratorImpl.Next(out BookRecord: TBookRecord): Boolean;
begin
  Result := not FBooks.Eof;

  if Result then
  begin
    FUser.GetBookRecord(CreateBookKey(FBookID.Value, FDatabaseID.Value), BookRecord);
    FBooks.Next;
  end;
end;

function TSystemData_ABS.TBookIteratorImpl.RecordCount: Integer;
begin
  Result := FBooks.RecordCount;
end;

function TSystemData_ABS.TBookIteratorImpl.CreateSQL(const Filter: string): string;
var
  Where: string;
begin
  Result := 'SELECT b.BookID, b.DatabaseID FROM BookGroups bg INNER JOIN Books b ON bg.BookID = b.BookID AND bg.DatabaseID = b.DatabaseID ';

  if Filter <> '' then
    Result := Result + ' WHERE ' + Filter + ' ';
end;

{ TGroupIteratorImpl }

constructor TSystemData_ABS.TGroupIteratorImpl.Create(User: TSystemData_ABS);
var
  pLogger: IIntervalLogger;
begin
  inherited Create;

  Assert(Assigned(User));

  FUser := User;

  FGroups := TABSQueryEx.Create(FUser.FDatabase, CreateSQL);
  FGroups.ReadOnly := True;

  pLogger := GetIntervalLogger('TGroupIteratorImpl.Create', FGroups.SQL.Text);
  FGroups.Active := True;
  pLogger := nil;

  FGroupID := FGroups.FieldByName(GROUP_ID_FIELD) as TIntegerField;
  FGroupName := FGroups.FieldByName(GROUP_NAME_FIELD) as TWideStringField;
  FAllowDelete := FGroups.FieldByName(GROUP_ALLOWDELETE_FIELD) as TBooleanField;
end;

destructor TSystemData_ABS.TGroupIteratorImpl.Destroy;
begin
  FreeAndNil(FGroups);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TSystemData_ABS.TGroupIteratorImpl.Next(out Group: TGroupData): Boolean;
begin
  Result := not FGroups.Eof;

  if Result then
  begin
    Group.GroupID := FGroupID.Value;
    Group.Text := FGroupName.Value;
    Group.CanDelete := FAllowDelete.Value;
    FGroups.Next;
  end;
end;

function TSystemData_ABS.TGroupIteratorImpl.RecordCount: Integer;
begin
  Result := FGroups.RecordCount;
end;

function TSystemData_ABS.TGroupIteratorImpl.CreateSQL: string;
begin
  Result := 'SELECT g.' + GROUP_ID_FIELD + ', g.' + GROUP_NAME_FIELD + ', g. ' + GROUP_ALLOWDELETE_FIELD + ' FROM Groups g ';
end;

{ TCollectionInfoIteratorImpl }

constructor TSystemData_ABS.TCollectionInfoIteratorImpl.Create(User: TSystemData_ABS);
var
  pLogger: IIntervalLogger;
begin
  inherited Create;

  Assert(Assigned(User));

  FUser := User;

  FBases := TABSQueryEx.Create(FUser.FDatabase, CreateSQL);
  FBases.ReadOnly := True;

  pLogger := GetIntervalLogger('TCollectionInfoIteratorImpl.Create', FBases.SQL.Text);
  FBases.Active := True;
  pLogger := nil;

  FBasesID := FBases.FieldByName(ID_FIELD) as TIntegerField;
end;

destructor TSystemData_ABS.TCollectionInfoIteratorImpl.Destroy;
begin
  FreeAndNil(FBases);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TSystemData_ABS.TCollectionInfoIteratorImpl.Next(out CollectionInfo: TCollectionInfo): Boolean;
begin
  Result := not FBases.Eof;

  if Result then
  begin
    FUser.GetCollectionInfo(FBasesID.Value, CollectionInfo);
    FBases.Next;
  end;
end;

function TSystemData_ABS.TCollectionInfoIteratorImpl.RecordCount: Integer;
begin
  Result := FBases.RecordCount;
end;

function TSystemData_ABS.TCollectionInfoIteratorImpl.CreateSQL: string;
begin
  Result := 'SELECT b.' + ID_FIELD + ' FROM Bases b ';
end;


{ TSystemData_ABS }

procedure TSystemData_ABS.GetBookLibID(const BookKey: TBookKey; out ARes: String);
begin
  Assert(AllBooks.Active);

  if not AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    Assert(False);
    Exit;
  end;

  ARes := AllBooksLibID.AsString;
end;

function TSystemData_ABS.ActivateGroup(const ID: Integer): Boolean;
begin
  Result := Groups.Locate(GROUP_ID_FIELD, ID, []);
end;

constructor TSystemData_ABS.Create(const DBSystemFile: string; ADefaultSession: Boolean = True);
begin
  inherited Create;

  FDefaultSession := ADefaultSession;
  if not FDefaultSession then
  begin
    FSession := TABSSession.Create(nil);
    FSession.AutoSessionName := True;
  end;

  FDatabase := TABSDatabase.Create(nil);
  FDatabase.DatabaseName := DBSystemFile + '_' + IntToStr(Integer(Pointer(Self)));
  FDatabase.DatabaseFileName := DBSystemFile;
  FDatabase.MultiUser := True;
  if not FDefaultSession then
    FDatabase.SessionName := FSession.SessionName;

  FDatabase.Connected := True;

  tblBases := TABSTableEx.Create(FDatabase, 'Bases');
  Groups := TABSTableEx.Create(FDatabase, 'Groups');
  AllBooks := TABSTableEx.Create(FDatabase, 'Books');
  AllBookGroups := TABSTableEx.Create(FDatabase, 'BookGroups');

  MountTables(True);
end;

destructor TSystemData_ABS.Destroy;
begin
  FreeAndNil(AllBookGroups);
  FreeAndNil(AllBooks);
  FreeAndNil(Groups);
  FreeAndNil(tblBases);

  FreeAndNil(FDatabase);

  inherited Destroy;
end;

procedure TSystemData_ABS.RegisterCollection(
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
begin
  //
  // регистрируем коллекцию
  //
  tblBases.Insert;
  try
    tblBasesBaseName.Value := DisplayName;
    tblBasesRootFolder.Value := RootFolder;
    tblBasesDBFileName.Value := DBFileName;
    tblBasesCode.Value := CollectionType;
    tblBasesDate.Value := Now;
    tblBasesVersion.Value := Version;
    tblBasesAllowDelete.Value := AllowDelete;
    tblBasesNotes.Value := Notes;
    tblBasesUser.Value := User;
    tblBasesPass.Value := Password;
    tblBasesURL.Value := URL;
    tblBasesConnection.Value := Script;
    tblBases.Post;
  except
    tblBases.Cancel;
    raise;
  end;

  // Switch to the newly added collection:
  ActivateCollection(tblBasesID.Value);
end;

function TSystemData_ABS.GetCollectionInfo(const CollectionID: Integer; out CollectionInfo: TCollectionInfo): Boolean;
var
  Stream: TABSBlobStream;
begin
  Assert(tblBases.Active);

  Result := tblBases.Locate(ID_FIELD, CollectionID, []);
  if Result then
  begin
    CollectionInfo.ID := CollectionID;
    CollectionInfo.Name := tblBasesBaseName.Value;
    CollectionInfo.RootFolder := tblBasesRootFolder.Value;
    CollectionInfo.DBFileName := tblBasesDBFileName.Value;
    CollectionInfo.Notes := tblBasesNotes.Value;
    CollectionInfo.User := tblBasesUser.Value;
    CollectionInfo.Password := tblBasesPass.Value;
    CollectionInfo.CreationDate := tblBasesDate.Value;
    if tblBasesVersion.IsNull then
      CollectionInfo.Version := UNVERSIONED_COLLECTION
    else
      CollectionInfo.Version := tblBasesVersion.Value;
    CollectionInfo.CollectionType := tblBasesCode.Value;
    if tblBasesAllowDelete.IsNull then
      CollectionInfo.AllowDelete := True
    else
      CollectionInfo.AllowDelete := tblBasesAllowDelete.Value;
    CollectionInfo.URL := tblBasesURL.Value;
    CollectionInfo.Script := tblBasesConnection.Value;

    Stream := TABSBlobStream.Create(tblBasesSettings, bmRead);
    try
      Assert(Assigned(CollectionInfo.Settings));
      CollectionInfo.Settings.LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
//    CollectionInfo.Settings.DelimitedText := tblBasesSettings.Value;
  end
  else
    CollectionInfo.Clear;
end;

procedure TSystemData_ABS.UpdateCollectionInfo(const CollectionInfo: TCollectionInfo);
var
  Stream: TABSBlobStream;
begin
  Assert(CollectionInfo.ID > 0);
  Assert(tblBases.Active);

  // TODO UpdateCollectionInfo
  if not tblBases.Locate(ID_FIELD, CollectionInfo.ID, []) then
    Assert(False);

  try
    tblBases.Edit;

    tblBasesBaseName.Value := CollectionInfo.Name;
    tblBasesRootFolder.Value := ExcludeTrailingPathDelimiter(CollectionInfo.RootFolder);
    tblBasesDBFileName.Value := CollectionInfo.DBFileName;
    tblBasesNotes.Value := CollectionInfo.Notes;
    tblBasesDate.Value := CollectionInfo.CreationDate;
    tblBasesVersion.Value := CollectionInfo.Version;
    tblBasesCode.Value := CollectionInfo.CollectionType;
    tblBasesAllowDelete.Value := CollectionInfo.AllowDelete;
    tblBasesUser.Value := CollectionInfo.User;
    tblBasesPass.Value := CollectionInfo.Password;
    tblBasesURL.Value := CollectionInfo.URL;
    tblBasesConnection.Value := CollectionInfo.Script;

    Stream := TABSBlobStream.Create(tblBasesSettings, bmWrite);
    try
      CollectionInfo.Settings.SaveToStream(Stream);
    finally
      Stream.Free;
    end;

    tblBases.Post;
  except
    tblBases.Cancel;
    raise
  end;

end;

function TSystemData_ABS.ActivateCollection(CollectionID: Integer): Boolean;
begin
  Assert(CollectionID > 0);
  Result := GetCollectionInfo(CollectionID, FActiveCollectionInfo);
end;

function TSystemData_ABS.FindCollectionWithProp(PropID: TCollectionProp; const Value: string; IgnoreID: Integer): Boolean;
const
  Fields: array [TCollectionProp] of string = (BASE_NAME_FIELD, 'DBFileName', 'RootFolder');
begin
  Result := False;
  if tblBases.IsEmpty then
    Exit;

  tblBases.First;
  while not tblBases.Eof do
  begin
    if tblBases.FieldByName(Fields[PropID]).AsString = Value then
    begin
      if (IgnoreID = INVALID_COLLECTION_ID) or (IgnoreID <> tblBasesID.Value) then
      begin
        Result := True;
        Exit;
      end;
    end;

    tblBases.Next;
  end;
end;

procedure TSystemData_ABS.DeleteCollection(CollectionID: Integer);
const
  DELETE_REL_QUERY = 'DELETE FROM BookGroups WHERE DatabaseID = %u';
  DELETE_BOOKS_QUERY = 'DELETE FROM Books WHERE DatabaseID = %u';
var
  Query: TABSQuery;
  pLogger: IIntervalLogger;
begin
  //
  // 1. Удалить все книги этой коллекции из групп
  // 2. Удалить коллекцию из списка коллекций
  //
  Assert(tblBases.Active);

  Query := TABSQueryEx.Create(FDatabase, '');
  try
    // Delete books from groups by DatabaseID:
    Query.SQL.Text := Format(DELETE_REL_QUERY, [CollectionID]);
    pLogger := GetIntervalLogger('TSystemData_ABS.DeleteCollection', Query.SQL.Text);
    Query.ExecSQL;
    pLogger := nil;

    Query.SQL.Text := Format(DELETE_BOOKS_QUERY, [CollectionID]);
    pLogger := GetIntervalLogger('TSystemData_ABS.DeleteCollection', Query.SQL.Text);
    Query.ExecSQL;
    pLogger := nil;
  finally
    FreeAndNil(Query);
  end;

  // Delete the collection:
  tblBases.Delete;

  // The first collection becomes the current one:
  tblBases.First;
end;

procedure TSystemData_ABS.GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord);
var
  Stream: TABSBlobStream;
  Reader: TReader;
  Author: TAuthorData;
  Genre: TGenreData;
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    BookRecord.Title := AllBooksTitle.Value;
    BookRecord.Folder := AllBooksFolder.Value;
    BookRecord.FileName := AllBooksFileName.Value;
    BookRecord.FileExt := AllBooksExt.Value;
    BookRecord.InsideNo := AllBooksInsideNo.Value;
    if AllBooksSeriesID.IsNull then
    begin
      BookRecord.SeriesID := NO_SERIES_ID;
      BookRecord.SeqNumber := 0;
    end
    else
    begin
      BookRecord.SeriesID := AllBooksSeriesID.Value;
      BookRecord.SeqNumber := AllBooksSeqNumber.Value;
    end;
    BookRecord.Code := AllBooksCode.Value;
    BookRecord.Size := AllBooksSize.Value;
    BookRecord.LibID := AllBooksLibID.Value;
    BookRecord.IsDeleted := AllBooksIsDeleted.Value;
    BookRecord.IsLocal := AllBooksIsLocal.Value;
    BookRecord.Date := AllBooksDate.Value;
    BookRecord.Lang := AllBooksLang.Value;
    BookRecord.LibRate := AllBooksLibRate.Value;
    BookRecord.KeyWords := AllBooksKeyWords.Value;

    BookRecord.Review := AllBooksReview.Value;
    BookRecord.Annotation := AllBooksAnnotation.Value;
    BookRecord.Rate := AllBooksRate.Value;
    BookRecord.Progress := AllBooksProgress.Value;
    BookRecord.NodeType := ntBookInfo;
    BookRecord.BookKey.BookID := AllBooksBookID.Value;
    BookRecord.BookKey.DatabaseID := AllBooksDatabaseID.Value;

    Stream := TABSBlobStream.Create(AllBooksExtraInfo, bmRead);
    try
      Reader := TReader.Create(Stream, 4096);
      try
        BookRecord.Series := Reader.ReadString;
        Assert((BookRecord.SeriesID = NO_SERIES_ID) = (BookRecord.Series = NO_SERIES_TITLE));

        Reader.ReadListBegin;
        while not Reader.EndOfList do
        begin
          Author.LastName := Reader.ReadString;
          Author.FirstName := Reader.ReadString;
          Author.MiddleName := Reader.ReadString;
          Author.AuthorID := Reader.ReadInteger;

          TAuthorsHelper.Add(
            BookRecord.Authors,
            Author.LastName,
            Author.FirstName,
            Author.MiddleName,
            Author.AuthorID
          );
        end;
        Reader.ReadListEnd;

        Reader.ReadListBegin;
        while not Reader.EndOfList do
        begin
          Genre.GenreCode := Reader.ReadString;
          Genre.FB2GenreCode := Reader.ReadString;
          Genre.GenreAlias := Reader.ReadString;

          TGenresHelper.Add(
            BookRecord.Genres,
            Genre.GenreCode,
            Genre.GenreAlias,
            Genre.FB2GenreCode
          );
        end;
        Reader.ReadListEnd;
      finally
        Reader.Free;
      end;
    finally
      Stream.Free;
    end;

    if tblBases.Locate(ID_FIELD, BookRecord.BookKey.DatabaseID, []) then
    begin
      // Please notice that the collection for a book in a group might not match ActiveCollection
      // Need to use values from tblBases instead
      BookRecord.CollectionName := tblBasesBaseName.Value;
      BookRecord.CollectionRoot := IncludeTrailingPathDelimiter(tblBasesRootFolder.Value);
    end
    else
    begin
      BookRecord.CollectionName := rstrUnknownCollection;
      BookRecord.CollectionRoot := '';
    end;
  end
  else
    Assert(False);
end;

procedure TSystemData_ABS.DeleteBook(const BookKey: TBookKey);
const
  SQL_DELETE_FROM_BOOK_GROUPS: string = 'DELETE FROM BookGroups WHERE BookID = %u AND DatabaseID = %u ';
  SQL_DELETE_FROM_BOOKS: string = 'DELETE FROM Books WHERE BookID = %u AND DatabaseID = %u ';
var
  Query: TABSQuery;
  pLogger: IIntervalLogger;
begin
  Query := TABSQueryEx.Create(FDatabase, '');
  try
    Query.SQL.Text := Format(SQL_DELETE_FROM_BOOK_GROUPS, [BookKey.BookID, BookKey.DatabaseID]);
    pLogger := GetIntervalLogger('TSystemData_ABS.DeleteBook', Query.SQL.Text);
    Query.ExecSQL;
    pLogger := nil;

    Query.SQL.Text := Format(SQL_DELETE_FROM_BOOKS, [BookKey.BookID, BookKey.DatabaseID]);
    pLogger := GetIntervalLogger('TSystemData_ABS.DeleteBook', Query.SQL.Text);
    Query.ExecSQL;
    pLogger := nil;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TSystemData_ABS.SetExtra(const BookKey: TBookKey; extra: TBookExtra);
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Edit;
    try
      if extra.Rating <> 0 then
        AllBooksRate.Value := extra.Rating;
      if extra.Progress <> 0 then
        AllBooksProgress.Value := extra.Progress;
      if extra.Review <> '' then
        AllBooksReview.Value := extra.Review;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise;
    end;
  end;
end;

procedure TSystemData_ABS.SetRate(const BookKey: TBookKey; Rate: Integer);
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Edit;
    try
      AllBooksRate.Value := Rate;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise;
    end;
  end;
end;

procedure TSystemData_ABS.SetProgress(const BookKey: TBookKey; Progress: Integer);
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Edit;
    try
      AllBooksProgress.Value := Progress;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise;
    end;
  end;
end;

function TSystemData_ABS.GetReview(const BookKey: TBookKey): string;
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
    Result := AllBooksReview.Value
  else
    Result := '';
end;

function TSystemData_ABS.SetReview(const BookKey: TBookKey; const Review: string): Integer;
begin
  Assert(AllBooks.Active);
  Result := 0;
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Edit;
    try
      if Review = '' then
      begin
        AllBooksReview.Clear;
        AllBooksCode.Value := 0;
      end
      else
      begin
        AllBooksReview.Value := Review;
        AllBooksCode.Value := 1;
        Result := 1;
      end;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise;
    end;
  end;
end;

procedure TSystemData_ABS.SetLocal(const BookKey: TBookKey; Value: Boolean);
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Edit;
    try
      AllBooksIsLocal.Value := Value;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise;
    end;
  end;
end;

procedure TSystemData_ABS.SetFileName(const BookKey: TBookKey; const FileName: string);
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Edit;
    try
      AllBooksFileName.Value := FileName;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise;
    end;
  end;
end;

procedure TSystemData_ABS.SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer);
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Edit;
    try
      if NO_SERIES_ID = SeriesID then
        AllBooksSeriesID.Clear
      else
        AllBooksSeriesID.Value := SeriesID;

      //
      // TODO: BUG необходимо обновить и название серии
      //

      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise;
    end;
  end;
end;

// Change SeriesID value for all books having provided DatabaseID and old SeriesID value
procedure TSystemData_ABS.ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer);
const
  UPDATE_SQL = 'UPDATE Books SET ' + SERIES_ID_FIELD + ' = %s WHERE ' + DB_ID_FIELD + ' = %u AND ' + SERIES_ID_FIELD + ' %s';
var
  newSerie: string;
  oldSerie: string;
  Query: TABSQuery;
  pLogger: IIntervalLogger;
begin
  if OldSeriesID <> NewSeriesID then
  begin
    if NO_SERIES_ID = NewSeriesID then
      newSerie := 'NULL'
    else
      newSerie := Format('%u', [NewSeriesID]);

    if NO_SERIES_ID = OldSeriesID then
      oldSerie := 'IS NULL'
    else
      oldSerie := Format('= %u', [OldSeriesID]);

    Query := TABSQueryEx.Create(FDatabase, Format(UPDATE_SQL, [newSerie, DatabaseID, oldSerie]));
    try
      pLogger := GetIntervalLogger('TSystemData_ABS.ChangeBookSeriesID', Query.SQL.Text);
      Query.ExecSQL;
      pLogger := nil;
    finally
      FreeAndNil(Query);
    end;
  end;
end;

// Return an iterator working on the User data Books dataset
// No need to free the iterator when done as it's a TInterfacedObject
// and knows to self destroy when no longer referenced.
function TSystemData_ABS.GetBookIterator(const Filter: string): IBookIterator;
begin
  Result := TBookIteratorImpl.Create(Self, Filter);
end;

function TSystemData_ABS.GetGroupIterator: IGroupIterator;
begin
  Result := TGroupIteratorImpl.Create(Self);
end;

function TSystemData_ABS.GetCollectionInfoIterator: ICollectionInfoIterator;
begin
  Result := TCollectionInfoIteratorImpl.Create(Self);
end;

procedure TSystemData_ABS.SetFolder(const BookKey: TBookKey; const Folder: string);
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf
      ([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Edit;
    try
      AllBooksFolder.Value := Folder;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise ;
    end;
  end;
end;

procedure TSystemData_ABS.UpdateBook(const BookRecord: TBookRecord);
begin

end;

//
// Создать группу
//
function TSystemData_ABS.AddGroup(const GroupName: string; const AllowDelete: Boolean = True): Boolean;
var
  GroupID: Integer;
begin
  Result := InternalAddGroup(GroupName, GroupID);
end;

function TSystemData_ABS.RenameGroup(GroupID: Integer; const NewName: string): Boolean;
begin
  Result := False;
  if InternalFindGroup(GroupID) then
  begin
    Groups.Edit;
    try
      GroupsGroupName.Value := NewName;
      Groups.Post;

      Result := True;
    except
      Groups.Cancel;
      raise;
    end;
  end;
end;

function TSystemData_ABS.InternalFindGroup(const GroupName: string): Boolean;
begin
  Result := Groups.Locate(GROUP_NAME_FIELD, GroupName, []);
end;

function TSystemData_ABS.InternalFindGroup(GroupID: Integer): Boolean;
begin
  Result := Groups.Locate(GROUP_ID_FIELD, GroupID, []);
end;

//
// Очищает текущую группу
//
function TSystemData_ABS.InternalAddGroup(const GroupName: string; out GroupID: Integer; const AllowDelete: Boolean = True): Boolean;
begin
  Result := not InternalFindGroup(GroupName);
  if Result then
  begin
    Groups.Append;
    try
      GroupsGroupName.Value := GroupName;
      GroupsAllowDelete.Value := AllowDelete;
      Groups.Post;
    except
      Groups.Cancel;
      raise;
    end;
  end;
  GroupID := GroupsGroupID.Value;
end;

procedure TSystemData_ABS.InternalClearGroup(GroupID: Integer; RemoveGroup: Boolean);
const
  SQL_DELETE_BOOKGROUPS = 'DELETE FROM BookGroups WHERE GroupID = %u ';
var
  query: TABSQuery;
  pLogger: IIntervalLogger;
begin
  //
  // Удалить книги из группы
  //
  query := TABSQueryEx.Create(FDatabase, Format(SQL_DELETE_BOOKGROUPS, [GroupID]));
  try
    pLogger := GetIntervalLogger('TSystemData_ABS.InternalClearGroup', Query.SQL.Text);
    query.ExecSQL;
    pLogger := nil;
  finally
    FreeAndNil(Query);
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
    Assert(GroupsAllowDelete.Value);
    Groups.Delete;
  end;
end;

//
// Удалить группу
//
procedure TSystemData_ABS.DeleteGroup(GroupID: Integer);
begin
  InternalClearGroup(GroupID, True);
end;

//
// Очистить
//
procedure TSystemData_ABS.ClearGroup(GroupID: Integer);
begin
  InternalClearGroup(GroupID, False);
end;

function TSystemData_ABS.GetGroup(const GroupID: Integer): TGroupData;
const
  SQL = 'SELECT g.GroupName, g.AllowDelete FROM Groups g WHERE g.GroupID = %u ';
var
  Query: TABSQuery;
  Logger: IIntervalLogger;
begin
  query := TABSQueryEx.Create(FDatabase, Format(SQL, [GroupID]));
  try
    Logger := GetIntervalLogger('TSystemData_ABS.GetGroup', Query.SQL.Text);
    query.ExecSQL;
    Logger := nil;

    // TODO: load TGroupData from the query
  finally
    FreeAndNil(Query);
  end;

end;

procedure TSystemData_ABS.AddBookToGroup(
  const BookKey: TBookKey;
  GroupID: Integer;
  const BookRecord: TBookRecord
  );
var
  Stream: TABSBlobStream;
  Writer: TWriter;
  Author: TAuthorData;
  Genre: TGenreData;
begin
  Assert(AllBooks.Active);
  if not AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Append;

    try
      AllBooksBookID.Value := BookKey.BookID;
      AllBooksDatabaseID.Value := BookKey.DatabaseID;

      AllBooksLibID.Value := BookRecord.LibID;
      AllBooksTitle.Value := BookRecord.Title;
      AllBooksSeriesID.Value := BookRecord.SeriesID;
      AllBooksSeqNumber.Value := BookRecord.SeqNumber;
      AllBooksDate.Value := BookRecord.Date;
      AllBooksLibRate.Value := BookRecord.LibRate;
      AllBooksLang.Value := BookRecord.Lang;
      AllBooksFolder.Value := TPath.Combine(ActiveCollectionInfo.RootFolder, BookRecord.Folder);
      AllBooksFileName.Value := BookRecord.FileName;
      AllBooksInsideNo.Value := BookRecord.InsideNo;
      AllBooksExt.Value := BookRecord.FileExt;
      AllBooksSize.Value := BookRecord.Size;
      AllBooksCode.Value := BookRecord.Code;
      AllBooksIsLocal.Value := BookRecord.IsLocal;
      AllBooksIsDeleted.Value := BookRecord.IsDeleted;
      AllBooksKeyWords.Value := BookRecord.KeyWords;

      AllBooksAnnotation.Value := BookRecord.Annotation;
      AllBooksReview.Value := BookRecord.Review;
      AllBooksRate.Value := BookRecord.Rate;
      AllBooksProgress.Value := BookRecord.Progress;

      Stream := TABSBlobStream.Create(AllBooksExtraInfo, bmWrite);
      try
        Writer := TWriter.Create(Stream, 4096);
        try
          Writer.WriteString(BookRecord.Series);

          Writer.WriteListBegin;
          for Author in BookRecord.Authors do
          begin
            Writer.WriteString(Author.LastName);
            Writer.WriteString(Author.FirstName);
            Writer.WriteString(Author.MiddleName);
            Writer.WriteInteger(Author.AuthorID);
          end;
          Writer.WriteListEnd;

          Writer.WriteListBegin;
          for Genre in BookRecord.Genres do
          begin
            Writer.WriteString(Genre.GenreCode);
            Writer.WriteString(Genre.FB2GenreCode);
            Writer.WriteString(Genre.GenreAlias);
          end;
          Writer.WriteListEnd;
        finally
          Writer.Free;
        end;
      finally
        Stream.Free;
      end;

      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise;
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
procedure TSystemData_ABS.DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer);
const
  SQL_DELETE_BOOKGROUPS = 'DELETE FROM BookGroups WHERE BookID = %0:u AND GroupID = %1:u ';
var
  query: TABSQuery;
  pLogger: IIntervalLogger;
begin
  //
  // Удалить книги из группы
  //
  query := TABSQueryEx.Create(FDatabase, Format(SQL_DELETE_BOOKGROUPS, [BookKey.BookID, GroupID]));
  try
    pLogger := GetIntervalLogger('TSystemData_ABS.DeleteFromGroup', Query.SQL.Text);
    query.ExecSQL;
    pLogger := nil;
  finally
    FreeAndNil(Query);
  end;
end;

//
// Удалить книги, не входящие в группы
//
procedure TSystemData_ABS.RemoveUnusedBooks;
const
  SQL: string =
      'DELETE FROM Books b WHERE NOT EXISTS( ' +
      ' SELECT 1 FROM BookGroups g ' +
      ' WHERE g.BookID = b.BookID AND g.DatabaseID = b.DatabaseID ' +
      ')';
var
  Query: TABSQuery;
  pLogger: IIntervalLogger;
begin
  Query := TABSQueryEx.Create(FDatabase, SQL);
  try
    pLogger := GetIntervalLogger('TSystemData_ABS.RemoveUnusedBooks', Query.SQL.Text);
    Query.ExecSQL;
    pLogger := nil;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TSystemData_ABS.CopyBookToGroup(
  const BookKey: TBookKey;
  SourceGroupID: Integer;
  TargetGroupID: Integer;
  MoveBook: Boolean
);
begin
  Assert(AllBookGroups.Active);
  if AllBookGroups.Locate(GROUP_ID_BOOK_ID_DB_ID_FIELDS, VarArrayOf([TargetGroupID, BookKey.BookID, BookKey.DatabaseID]), []) then
    Exit; // Skip, book already in the target group

  if MoveBook then
  begin
    if AllBookGroups.Locate(GROUP_ID_BOOK_ID_DB_ID_FIELDS, VarArrayOf([SourceGroupID, BookKey.BookID, BookKey.DatabaseID]), []) then
    begin
      AllBookGroups.Edit;
      try
        AllBookGroupsGroupID.Value := TargetGroupID;
        AllBookGroups.Post;
      except
        AllBookGroups.Cancel;
        raise;
      end;
    end;
  end
  else
  begin
    AllBookGroups.Append;
    try
      AllBookGroupsGroupID.Value := TargetGroupID;
      AllBookGroupsBookID.Value := BookKey.BookID;
      AllBookGroupsDatabaseID.Value := BookKey.DatabaseID;
      AllBookGroups.Post;
    except
      AllBookGroups.Cancel;
      raise;
    end;
  end;
end;

procedure TSystemData_ABS.ImportUserData(data: TUserData);
var
  group: TBookGroup;
  GroupID: Integer;
begin
  Assert(Assigned(data));

  for group in data.Groups do
  begin
    InternalAddGroup(group.GroupName, GroupID);
    group.GroupID := GroupID;
  end;
end;

procedure TSystemData_ABS.MountTables(const Mounted: Boolean);
begin
  tblBases.Active := Mounted;
  Groups.Active := Mounted;
  AllBooks.Active := Mounted;
  AllBookGroups.Active := Mounted;

  if Mounted then
  begin
    tblBasesID := tblBases.FieldByName('ID') as TAutoIncField;
    tblBasesBaseName := tblBases.FieldByName('BaseName') as TWideStringField;
    tblBasesRootFolder := tblBases.FieldByName('RootFolder') as TWideStringField;
    tblBasesDBFileName := tblBases.FieldByName('DBFileName') as TWideStringField;
    tblBasesNotes := tblBases.FieldByName('Notes') as TWideStringField;
    tblBasesDate := tblBases.FieldByName('CreationDate') as TDateField;
    tblBasesVersion := tblBases.FieldByName('Version') as TIntegerField;
    tblBasesCode := tblBases.FieldByName('Code') as TIntegerField;
    tblBasesAllowDelete := tblBases.FieldByName('AllowDelete') as TBooleanField;
    tblBasesSettings := tblBases.FieldByName('Settings') as TWideMemoField;
    tblBasesIcon := tblBases.FieldByName('Icon') as TBlobField;
    tblBasesURL := tblBases.FieldByName('URL') as TWideStringField;
    tblBasesUser := tblBases.FieldByName('LibUser') as TWideStringField;
    tblBasesPass := tblBases.FieldByName('LibPassword') as TWideStringField;
    tblBasesConnection := tblBases.FieldByName('ConnectionScript') as TWideMemoField;

    GroupsGroupID := Groups.FieldByName('GroupID') as TAutoIncField;
    GroupsGroupName := Groups.FieldByName('GroupName') as TWideStringField;
    GroupsAllowDelete := Groups.FieldByName('AllowDelete') as TBooleanField;
    GroupsNotes := Groups.FieldByName('Notes') as TMemoField;
    GroupsIcon := Groups.FieldByName('Icon') as TBlobField;

    AllBooksBookID := AllBooks.FieldByName('BookID') as TIntegerField;
    AllBooksDatabaseID := AllBooks.FieldByName('DatabaseID') as TIntegerField;
    AllBooksLibID := AllBooks.FieldByName('LibID') as TIntegerField;
    AllBooksTitle := AllBooks.FieldByName('Title') as TWideStringField;
    AllBooksSeriesID := AllBooks.FieldByName('SeriesID') as TIntegerField;
    AllBooksSeqNumber := AllBooks.FieldByName('SeqNumber') as TSmallintField;
    AllBooksDate := AllBooks.FieldByName('UpdateDate') as TDateField;
    AllBooksLibRate := AllBooks.FieldByName('LibRate') as TIntegerField;
    AllBooksLang := AllBooks.FieldByName('Lang') as TWideStringField;
    AllBooksFolder := AllBooks.FieldByName('Folder') as TWideStringField;
    AllBooksFileName := AllBooks.FieldByName('FileName') as TWideStringField;
    AllBooksInsideNo := AllBooks.FieldByName('InsideNo') as TIntegerField;
    AllBooksExt := AllBooks.FieldByName('Ext') as TWideStringField;
    AllBooksSize := AllBooks.FieldByName('BookSize') as TIntegerField;
    AllBooksCode := AllBooks.FieldByName('Code') as TSmallintField;
    AllBooksIsLocal := AllBooks.FieldByName('IsLocal') as TBooleanField;
    AllBooksIsDeleted := AllBooks.FieldByName('IsDeleted') as TBooleanField;
    AllBooksKeyWords := AllBooks.FieldByName('KeyWords') as TWideStringField;
    AllBooksAnnotation := AllBooks.FieldByName('Annotation') as TWideMemoField;
    AllBooksReview := AllBooks.FieldByName('Review') as TWideMemoField;
    AllBooksRate := AllBooks.FieldByName('Rate') as TIntegerField;
    AllBooksProgress := AllBooks.FieldByName('Progress') as TSmallintField;
    AllBooksExtraInfo := AllBooks.FieldByName('ExtraInfo') as TBlobField;

    AllBookGroupsBookID := AllBookGroups.FieldByName('BookID') as TIntegerField;
    AllBookGroupsDatabaseID := AllBookGroups.FieldByName('DatabaseID') as TIntegerField;
    AllBookGroupsGroupID := AllBookGroups.FieldByName('GroupID') as TIntegerField;
  end;
end;

end.
