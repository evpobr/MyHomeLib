(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors             Aleksey Penkov   alex.penkov@gmail.com
  *                     Nick Rymanov     nrymanov@gmail.com
  * Created
  * Description
  *
  * $Id$
  *
  * History
  * NickR 02.03.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit dm_user;

interface

uses
  Classes,
  DB,
  ABSMain,
  ImgList,
  Controls,
  unit_Globals,
  unit_Consts,
  unit_Interfaces,
  UserData;

type
  TCollectionProp = (cpDisplayName, cpFileName, cpRootFolder);

  TDMUser = class(TDataModule)
    DBUser: TABSDatabase;

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
    dsGroups: TDataSource;

    GroupBooks: TABSTable;
    GroupBooksGroupID: TIntegerField;
    GroupBooksBookID: TIntegerField;
    GroupBooksDatabaseID: TIntegerField;
    dsBookGroups: TDataSource;

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

    AllBookGroups: TABSTable;
    AllBookGroupsBookID: TIntegerField;
    AllBookGroupsDatabaseID: TIntegerField;
    AllBookGroupsGroupID: TIntegerField;
    AllBooksExtraInfo: TBlobField;

    SeverityImages: TImageList;
    SeverityImagesBig: TImageList;

  strict private
  type
    TBookIteratorImpl = class(TInterfacedObject, IBookIterator)
    public
      constructor Create(User: TDMUser; const Filter: string);
      destructor Destroy; override;

    protected
      //
      // IBookIterator
      //
      function Next(out BookRecord: TBookRecord): Boolean;
      function RecordCount: Integer;

    private
      FUser: TDMUser;
      FBooks: TABSQuery;
      FBookID: TIntegerField;
      FDatabaseID: TIntegerField;

      function CreateSQL(const Filter: string): string;
    end;
    // << TBookIteratorImpl


    TGroupIteratorImpl = class(TInterfacedObject, IGroupIterator)
    public
      constructor Create(User: TDMUser);
      destructor Destroy; override;

    protected
      //
      // IGroupIterator
      //
      function Next(out Group: TGroupData): Boolean;
      function RecordCount: Integer;

    private
      FUser: TDMUser;
      FGroups: TABSQuery;
      FGroupID: TIntegerField;
      FGroupName: TWideStringField;
      FAllowDelete: TBooleanField;

      function CreateSQL: string;
    end;
    // << TGroupIteratorImpl

    TCollectionInfoIteratorImpl = class(TInterfacedObject, ICollectionInfoIterator)
    public
      constructor Create(User: TDMUser);
      destructor Destroy; override;

    protected
      //
      // IGroupIterator
      //
      function Next(out CollectionInfo: TCollectionInfo): Boolean;
      function RecordCount: Integer;

    private
      FUser: TDMUser;
      FBases: TABSQuery;
      FBasesID: TIntegerField;

      function CreateSQL: string;
    end;
    // << TCollectionInfoIteratorImpl

  private
    FActiveCollectionInfo: TCollectionInfo;
//    FCollectionInfo: TOldCollectionInfo;

  private
    function InternalFindGroup(const GroupName: string): Boolean; overload; inline;
    function InternalFindGroup(GroupID: Integer): Boolean; overload; inline;
    function InternalAddGroup(const GroupName: string; out GroupID: Integer): Boolean;
    procedure InternalClearGroup(GroupID: Integer; RemoveGroup: Boolean);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ActivateCollection(CollectionID: Integer): Boolean;
    function GetCollectionInfo(const CollectionID: Integer; out CollectionInfo: TCollectionInfo): Boolean;
    procedure UpdateCollectionInfo(const CollectionInfo: TCollectionInfo);

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
    );

    function FindCollectionWithProp(
      PropID: TCollectionProp;
      const Value: string;
      IgnoreID: Integer = INVALID_COLLECTION_ID
    ): Boolean;

    procedure DeleteCollection(CollectionID: Integer);

    procedure SetTableState(State: Boolean);

  public
    procedure GetBookLibID(const BookKey: TBookKey; out ARes: string); deprecated;

    //
    // Active Collection
    //
    function HasCollections: Boolean;
    function FindFirstExternalCollection: Boolean;
    function FindFirstExistingCollectionID(const PreferredID: Integer): Integer;

    function ActivateGroup(const ID: Integer): Boolean;


    //
    //
    //
    procedure GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord);
    procedure DeleteBook(const BookKey: TBookKey);

    procedure SetExtra(const BookKey: TBookKey; extra: TBookExtra);
    procedure SetRate(const BookKey: TBookKey; Rate: Integer);
    procedure SetProgress(const BookKey: TBookKey; Progress: Integer);
    function GetAnnotation(const BookKey: TBookKey): string;
    procedure SetAnnotation(const BookKey: TBookKey; const Annotation: string);
    function GetReview(const BookKey: TBookKey): string;
    function SetReview(const BookKey: TBookKey; const Review: string): Integer;
    procedure SetLocal(const BookKey: TBookKey; Value: Boolean);
    procedure SetFileName(const BookKey: TBookKey; const FileName: string);
    procedure SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer);
    procedure SetFolder(const BookKey: TBookKey; const Folder: string);

    procedure UpdateBook(const BookRecord: TBookRecord);

    //
    // Работа с группами
    //
    function AddGroup(const GroupName: string): Boolean;
    function RenameGroup(GroupID: Integer; const NewName: string): Boolean;
    procedure DeleteGroup(GroupID: Integer);
    procedure ClearGroup(GroupID: Integer);

    procedure AddBookToGroup(const BookKey: TBookKey; GroupID: Integer; const BookRecord: TBookRecord);
    procedure DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer);
    procedure RemoveUnusedBooks;
    procedure CopyBookToGroup(
      const BookKey: TBookKey;
      SourceGroupID: Integer;
      TargetGroupID: Integer;
      MoveBook: Boolean
    );

    //
    // Пользовательские данные
    //
    procedure ExportUserData(data: TUserData);
    procedure ImportUserData(data: TUserData);

    // Batch update methods:
    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer);

    //Iterators:
    function GetBookIterator(const Filter: string): IBookIterator;
    function GetGroupIterator: IGroupIterator;
    function GetCollectionInfoIterator: ICollectionInfoIterator;

  public
    property ActiveCollectionInfo: TCollectionInfo read FActiveCollectionInfo;
  end;

var
  DMUser: TDMUser;

implementation

uses
  SysUtils,
  StrUtils,
  IOUtils,
  Variants,
  unit_SearchUtils,
  unit_Settings,
  unit_Logger;

resourcestring
  rstrNamelessColection = 'безымянная коллекция';
  rstrUnknownCollection = 'неизвестная коллекция';

{$R *.dfm}

{ TBookIteratorImpl }

constructor TDMUser.TBookIteratorImpl.Create(User: TDMUser; const Filter: string);
var
  pLogger: IIntervalLogger;
begin
  inherited Create;

  Assert(Assigned(User));

  FUser := User;

  FBooks := TABSQuery.Create(FUser.DBUser);
  FBooks.DatabaseName := FUser.DBUser.DatabaseName;
  FBooks.SQL.Text := CreateSQL(Filter);
  FBooks.ReadOnly := True;

  pLogger := GetIntervalLogger('TBookIteratorImpl.Create', FBooks.SQL.Text);
  FBooks.Active := True;
  pLogger := nil;

  FBookID := FBooks.FieldByName(BOOK_ID_FIELD) as TIntegerField;
  FDatabaseID := FBooks.FieldByName(DB_ID_FIELD) as TIntegerField;
end;

destructor TDMUser.TBookIteratorImpl.Destroy;
begin
  FreeAndNil(FBooks);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TDMUser.TBookIteratorImpl.Next(out BookRecord: TBookRecord): Boolean;
begin
  Result := not FBooks.Eof;

  if Result then
  begin
    FUser.GetBookRecord(CreateBookKey(FBookID.Value, FDatabaseID.Value), BookRecord);
    FBooks.Next;
  end;
end;

function TDMUser.TBookIteratorImpl.RecordCount: Integer;
begin
  Result := FBooks.RecordCount;
end;

function TDMUser.TBookIteratorImpl.CreateSQL(const Filter: string): string;
var
  Where: string;
begin
  Result := 'SELECT b.BookID, b.DatabaseID FROM BookGroups bg INNER JOIN Books b ON bg.BookID = b.BookID AND bg.DatabaseID = b.DatabaseID ';

  if Filter <> '' then
    Result := Result + ' WHERE ' + Filter + ' ';
end;

{ TGroupIteratorImpl }

constructor TDMUser.TGroupIteratorImpl.Create(User: TDMUser);
var
  pLogger: IIntervalLogger;
begin
  inherited Create;

  Assert(Assigned(User));

  FUser := User;

  FGroups := TABSQuery.Create(FUser.DBUser);
  FGroups.DatabaseName := FUser.DBUser.DatabaseName;
  FGroups.SQL.Text := CreateSQL;
  FGroups.ReadOnly := True;

  pLogger := GetIntervalLogger('TGroupIteratorImpl.Create', FGroups.SQL.Text);
  FGroups.Active := True;
  pLogger := nil;

  FGroupID := FGroups.FieldByName(GROUP_ID_FIELD) as TIntegerField;
  FGroupName := FGroups.FieldByName(GROUP_NAME_FIELD) as TWideStringField;
  FAllowDelete := FGroups.FieldByName(GROUP_ALLOWDELETE_FIELD) as TBooleanField;
end;

destructor TDMUser.TGroupIteratorImpl.Destroy;
begin
  FreeAndNil(FGroups);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TDMUser.TGroupIteratorImpl.Next(out Group: TGroupData): Boolean;
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

function TDMUser.TGroupIteratorImpl.RecordCount: Integer;
begin
  Result := FGroups.RecordCount;
end;

function TDMUser.TGroupIteratorImpl.CreateSQL: string;
begin
  Result := 'SELECT g.' + GROUP_ID_FIELD + ', g.' + GROUP_NAME_FIELD + ', g. ' + GROUP_ALLOWDELETE_FIELD + ' FROM Groups g ';
end;

{ TCollectionInfoIteratorImpl }

constructor TDMUser.TCollectionInfoIteratorImpl.Create(User: TDMUser);
var
  pLogger: IIntervalLogger;
begin
  inherited Create;

  Assert(Assigned(User));

  FUser := User;

  FBases := TABSQuery.Create(FUser.DBUser);
  FBases.DatabaseName := FUser.DBUser.DatabaseName;
  FBases.SQL.Text := CreateSQL;
  FBases.ReadOnly := True;

  pLogger := GetIntervalLogger('TCollectionInfoIteratorImpl.Create', FBases.SQL.Text);
  FBases.Active := True;
  pLogger := nil;

  FBasesID := FBases.FieldByName(ID_FIELD) as TIntegerField;
end;

destructor TDMUser.TCollectionInfoIteratorImpl.Destroy;
begin
  FreeAndNil(FBases);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TDMUser.TCollectionInfoIteratorImpl.Next(out CollectionInfo: TCollectionInfo): Boolean;
begin
  Result := not FBases.Eof;

  if Result then
  begin
    FUser.GetCollectionInfo(FBasesID.Value, CollectionInfo);
    FBases.Next;
  end;
end;

function TDMUser.TCollectionInfoIteratorImpl.RecordCount: Integer;
begin
  Result := FBases.RecordCount;
end;

function TDMUser.TCollectionInfoIteratorImpl.CreateSQL: string;
begin
  Result := 'SELECT b.' + ID_FIELD + ' FROM Bases b ';
end;


{ TDMUser }

procedure TDMUser.GetBookLibID(const BookKey: TBookKey; out ARes: String);
begin
  Assert(AllBooks.Active);

  if not AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    Assert(False);
    Exit;
  end;

  ARes := AllBooksLibID.AsString;
end;

function TDMUser.ActivateGroup(const ID: Integer): Boolean;
begin
  Result := Groups.Locate(GROUP_ID_FIELD, ID, []);
end;

constructor TDMUser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FActiveCollectionInfo := TCollectionInfo.Create;
end;

destructor TDMUser.Destroy;
begin
  FreeAndNil(FActiveCollectionInfo);
  inherited Destroy;
end;

procedure TDMUser.RegisterCollection(
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

function TDMUser.GetCollectionInfo(const CollectionID: Integer; out CollectionInfo: TCollectionInfo): Boolean;
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

procedure TDMUser.UpdateCollectionInfo(const CollectionInfo: TCollectionInfo);
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

function TDMUser.ActivateCollection(CollectionID: Integer): Boolean;
begin
  Assert(CollectionID > 0);
  Result := GetCollectionInfo(CollectionID, FActiveCollectionInfo);
end;

function TDMUser.FindCollectionWithProp(PropID: TCollectionProp; const Value: string; IgnoreID: Integer): Boolean;
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

function TDMUser.HasCollections: Boolean;
begin
  Result := (DMUser.GetCollectionInfoIterator.RecordCount > 0);
end;

function TDMUser.FindFirstExternalCollection: Boolean;
var
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: TCollectionInfo;
begin
  Result := False;

  CollectionInfoIterator := GetCollectionInfoIterator;
  if CollectionInfoIterator.RecordCount = 0 then
    Exit;

  CollectionInfo := TCollectionInfo.Create;
  try
    while CollectionInfoIterator.Next(CollectionInfo) do
    begin
      if isExternalCollection(CollectionInfo.CollectionType) then
      begin
        Result := True;
        Exit;
      end;
    end;
  finally
    FreeAndNil(CollectionInfo);
  end;
end;

function TDMUser.FindFirstExistingCollectionID(const PreferredID: Integer): Integer;
var
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: TCollectionInfo;
begin
  Result := INVALID_COLLECTION_ID;

  CollectionInfo := TCollectionInfo.Create;
  try
    CollectionInfoIterator := DMUser.GetCollectionInfoIterator;
    while CollectionInfoIterator.Next(CollectionInfo) do
    begin
      if FileExists(CollectionInfo.DBFileName) then
      begin
        if CollectionInfo.ID = PreferredID then
        begin
          //
          // Пользователь предпочитает эту коллекцию, она доступна -> выходим
          //
          Result := CollectionInfo.ID;
          Break;
        end;

        if Result = INVALID_COLLECTION_ID then
        begin
          //
          // Запомним первую доступную коллекцию
          //
          Result := CollectionInfo.ID;
        end;
      end;
    end;
  finally
    FreeAndNil(CollectionInfo);
  end;
end;

procedure TDMUser.DeleteCollection(CollectionID: Integer);
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

  Query := TABSQuery.Create(DBUser);
  try
    Query.DatabaseName := DBUser.DatabaseName;

    // Delete books from groups by DatabaseID:
    Query.SQL.Text := Format(DELETE_REL_QUERY, [CollectionID]);
    pLogger := GetIntervalLogger('TDMUser.DeleteCollection', Query.SQL.Text);
    Query.ExecSQL;
    pLogger := nil;

    Query.SQL.Text := Format(DELETE_BOOKS_QUERY, [CollectionID]);
    pLogger := GetIntervalLogger('TDMUser.DeleteCollection', Query.SQL.Text);
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

procedure TDMUser.SetTableState(State: Boolean);
begin
  tblBases.Active := State;
  Groups.Active := State;
  GroupBooks.Active := State;
  AllBooks.Active := State;
  AllBookGroups.Active := State;
end;

procedure TDMUser.GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord);
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

procedure TDMUser.DeleteBook(const BookKey: TBookKey);
const
  SQL_DELETE_FROM_BOOK_GROUPS: string = 'DELETE FROM BookGroups WHERE BookID = %u AND DatabaseID = %u ';
  SQL_DELETE_FROM_BOOKS: string = 'DELETE FROM Books WHERE BookID = %u AND DatabaseID = %u ';
var
  Query: TABSQuery;
  pLogger: IIntervalLogger;
begin
  Query := TABSQuery.Create(DBUser);
  try
    Query.DatabaseName := DBUser.DatabaseName;

    Query.SQL.Text := Format(SQL_DELETE_FROM_BOOK_GROUPS, [BookKey.BookID, BookKey.DatabaseID]);
    pLogger := GetIntervalLogger('TDMUser.DeleteBook', Query.SQL.Text);
    Query.ExecSQL;
    pLogger := nil;

    Query.SQL.Text := Format(SQL_DELETE_FROM_BOOKS, [BookKey.BookID, BookKey.DatabaseID]);
    pLogger := GetIntervalLogger('TDMUser.DeleteBook', Query.SQL.Text);
    Query.ExecSQL;
    pLogger := nil;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TDMUser.SetExtra(const BookKey: TBookKey; extra: TBookExtra);
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

procedure TDMUser.SetRate(const BookKey: TBookKey; Rate: Integer);
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

procedure TDMUser.SetProgress(const BookKey: TBookKey; Progress: Integer);
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

function TDMUser.GetAnnotation(const BookKey: TBookKey): string;
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
    Result := AllBooksAnnotation.Value
  else
    Result := '';
end;

procedure TDMUser.SetAnnotation(const BookKey: TBookKey; const Annotation: string);
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
  begin
    AllBooks.Edit;
    try
      if Annotation = '' then
        AllBooksAnnotation.Clear
      else
        AllBooksAnnotation.Value := Annotation;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise;
    end;
  end;
end;

function TDMUser.GetReview(const BookKey: TBookKey): string;
begin
  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
    Result := AllBooksReview.Value
  else
    Result := '';
end;

function TDMUser.SetReview(const BookKey: TBookKey; const Review: string): Integer;
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

procedure TDMUser.SetLocal(const BookKey: TBookKey; Value: Boolean);
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

procedure TDMUser.SetFileName(const BookKey: TBookKey; const FileName: string);
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

procedure TDMUser.SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer);
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
procedure TDMUser.ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer);
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

    Query := TABSQuery.Create(DBUser);
    try
      Query.DatabaseName := DBUser.DatabaseName;
      Query.SQL.Text := Format(UPDATE_SQL, [newSerie, DatabaseID, oldSerie]);
      pLogger := GetIntervalLogger('TDMUser.ChangeBookSeriesID', Query.SQL.Text);
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
function TDMUser.GetBookIterator(const Filter: string): IBookIterator;
begin
  Result := TBookIteratorImpl.Create(Self, Filter);
end;

function TDMUser.GetGroupIterator: IGroupIterator;
begin
  Result := TGroupIteratorImpl.Create(Self);
end;

function TDMUser.GetCollectionInfoIterator: ICollectionInfoIterator;
begin
  Result := TCollectionInfoIteratorImpl.Create(Self);
end;

procedure TDMUser.SetFolder(const BookKey: TBookKey; const Folder: string);
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

procedure TDMUser.UpdateBook(const BookRecord: TBookRecord);
begin

end;

//
// Создать группу
//
function TDMUser.AddGroup(const GroupName: string): Boolean;
var
  GroupID: Integer;
begin
  Result := InternalAddGroup(GroupName, GroupID);
end;

function TDMUser.RenameGroup(GroupID: Integer; const NewName: string): Boolean;
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

function TDMUser.InternalFindGroup(const GroupName: string): Boolean;
begin
  Result := Groups.Locate(GROUP_NAME_FIELD, GroupName, []);
end;

function TDMUser.InternalFindGroup(GroupID: Integer): Boolean;
begin
  Result := Groups.Locate(GROUP_ID_FIELD, GroupID, []);
end;

//
// Очищает текущую группу
//
function TDMUser.InternalAddGroup(const GroupName: string; out GroupID: Integer): Boolean;
begin
  Result := not InternalFindGroup(GroupName);
  if Result then
  begin
    Groups.Append;
    try
      GroupsGroupName.Value := GroupName;
      GroupsAllowDelete.Value := True;
      Groups.Post;
    except
      Groups.Cancel;
      raise;
    end;
  end;
  GroupID := GroupsGroupID.Value;
end;

procedure TDMUser.InternalClearGroup(GroupID: Integer; RemoveGroup: Boolean);
begin
  if InternalFindGroup(GroupID) then
  begin
    //
    // Удалить книги из группы
    //
    GroupBooks.First;
    while not GroupBooks.Eof do
      GroupBooks.Delete;
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
end;

//
// Удалить группу
//
procedure TDMUser.DeleteGroup(GroupID: Integer);
begin
  InternalClearGroup(GroupID, True);
end;

//
// Очистить
//
procedure TDMUser.ClearGroup(GroupID: Integer);
begin
  InternalClearGroup(GroupID, False);
end;

procedure TDMUser.AddBookToGroup(
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
procedure TDMUser.DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer);
begin
  if InternalFindGroup(GroupID) then
  begin
    if GroupBooks.Locate(BOOK_ID_DB_ID_FIELDS, VarArrayOf([BookKey.BookID, BookKey.DatabaseID]), []) then
      GroupBooks.Delete;
  end;
end;

//
// Удалить книги, не входящие в группы
//
procedure TDMUser.RemoveUnusedBooks;
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
  Query := TABSQuery.Create(DBUser);
  try
    Query.DatabaseName := DBUser.DatabaseName;
    Query.SQL.Text := SQL;
    pLogger := GetIntervalLogger('TDMUser.RemoveUnusedBooks', Query.SQL.Text);
    Query.ExecSQL;
    pLogger := nil;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TDMUser.CopyBookToGroup(
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

procedure TDMUser.ExportUserData(data: TUserData);
var
  CollectionID: Integer;
  BookGroup: TBookGroup;
  GroupIterator: IGroupIterator;
  GroupData: TGroupData;
  BookIterator: IBookIterator;
  BookRecord: TBookRecord;
begin
  Assert(Assigned(data));

  CollectionID := ActiveCollectionInfo.ID;

  GroupIterator := GetGroupIterator;
  while GroupIterator.Next(GroupData) do
  begin
    BookGroup := data.Groups.AddGroup(GroupData.GroupID, GroupData.Text);

    BookIterator := GetBookIterator(Format('bg.%0:s = %1:d AND bg.%2:s = %3:d', [GROUP_ID_FIELD, GroupData.GroupID, DB_ID_FIELD, CollectionID]));
    while BookIterator.Next(BookRecord) do
      BookGroup.AddBook(BookRecord.BookKey.BookID, BookRecord.LibID);
  end;
end;

procedure TDMUser.ImportUserData(data: TUserData);
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

end.
