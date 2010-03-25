(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
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
  unit_Globals,
  ImgList,
  Controls,
  unit_Consts;

type
  TCollectionProp = (cpDisplayName, cpFileName, cpRootFolder);

  TMHLCollection = class;

  TDMUser = class(TDataModule)
    DBUser: TABSDatabase;

    tblBases: TABSTable;

    dsBases: TDataSource;
    GroupedBooks: TABSTable;
    SeverityImages: TImageList;
    SeverityImagesBig: TImageList;
    dsGroups: TDataSource;
    Groups: TABSTable;
    tblBasesID: TAutoIncField;
    tblBasesName: TWideStringField;
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
    BookGroups: TABSTable;
    dsBookGroups: TDataSource;
    BookGroupsGroupID: TIntegerField;
    BookGroupsBookID: TIntegerField;
    BookGroupsDatabaseID: TIntegerField;
    GroupsGroupID: TAutoIncField;
    GroupsName: TWideStringField;
    GroupsAllowDelete: TBooleanField;
    GroupsNotes: TMemoField;
    GroupsIcon: TBlobField;
    GroupedBooksBookID: TIntegerField;
    GroupedBooksDatabaseID: TIntegerField;
    GroupedBooksLibID: TIntegerField;
    GroupedBooksTitle: TWideStringField;
    GroupedBooksFullName: TWideStringField;
    GroupedBooksSerieID: TIntegerField;
    GroupedBooksSeqNumber: TSmallintField;
    GroupedBooksDate: TDateField;
    GroupedBooksLibRate: TIntegerField;
    GroupedBooksLang: TWideStringField;
    GroupedBooksFolder: TWideStringField;
    GroupedBooksFileName: TWideStringField;
    GroupedBooksInsideNo: TIntegerField;
    GroupedBooksExt: TWideStringField;
    GroupedBooksSize: TIntegerField;
    GroupedBooksURI: TWideStringField;
    GroupedBooksCode: TSmallintField;
    GroupedBooksLocal: TBooleanField;
    GroupedBooksDeleted: TBooleanField;
    GroupedBooksKeyWords: TWideStringField;
    GroupedBooksReview: TWideMemoField;
    GroupedBooksRate: TIntegerField;
    GroupedBooksProgress: TSmallintField;
    GroupedBooksGenres: TWideStringField;
    GroupedBooksSeries: TWideStringField;
    Books: TABSTable;
    BooksBookID: TIntegerField;
    BooksDatabaseID: TIntegerField;
    BooksLibID: TIntegerField;
    BooksTitle: TWideStringField;
    BooksFullName: TWideStringField;
    BooksSerieID: TIntegerField;
    BooksSeqNumber: TSmallintField;
    BooksDate: TDateField;
    BooksLibRate: TIntegerField;
    BooksLang: TWideStringField;
    BooksFolder: TWideStringField;
    BooksFileName: TWideStringField;
    BooksInsideNo: TIntegerField;
    BooksExt: TWideStringField;
    BooksSize: TIntegerField;
    BooksURI: TWideStringField;
    BooksCode: TSmallintField;
    BooksLocal: TBooleanField;
    BooksDeleted: TBooleanField;
    BooksKeyWords: TWideStringField;
    BooksReview: TWideMemoField;
    BooksRate: TIntegerField;
    BooksProgress: TSmallintField;
    BooksGenres: TWideStringField;
    BooksSeries: TWideStringField;
    ClearQuery: TABSQuery;

  private
    FCollection: TMHLCollection;

  private
    procedure InternalClearGroup(GroupID: Integer; RemoveGroup: Boolean);

  public const
    INVALID_COLLECTION_ID = -1;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ActivateCollection(CollectionID: Integer): Boolean;

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

    procedure UpdateCollectionProps(
      CollectionID: Integer;
      const DisplayName: string;
      const RootFolder: string;
      const DBFileName: string;
      const Description: string = '';
      const URL: string = '';
      const User: string = '';
      const Pass: string = '';
      const Script: string = ''
    );

    function FindCollectionWithProp(
      PropID: TCollectionProp;
      const Value: string;
      IgnoreID: Integer = INVALID_COLLECTION_ID
    ): Boolean;

    procedure SetTableState(State: Boolean);

  public
    //
    // Active Collection
    //
    property ActiveCollection: TMHLCollection read FCollection;

    function FindFirstExternalCollection: Boolean;
    function FindNextExternalCollection: Boolean;

    function FindFirstCollection: Boolean;
    function FindNextCollection: Boolean;

    function ActivateGroup(const ID: Integer): Boolean;

    procedure SetLocal(ID: Integer; Value: Boolean);
    ///procedure InsertToGroupTable(BookID: Integer; const Genre: string);

    procedure LoadRates(const SL: TStringList; var i: Integer);
    procedure LoadGroupedBooks(const SL: TStringList; var i: Integer);
    procedure LoadFinished(const SL: TStringList; var i: Integer);
    procedure LoadGroups(const SL: TStringList; var i: Integer);
    procedure LoadReviews(const SL: TStringList; var i: Integer);
    procedure CorrectExtra(OldID, NewID: Integer);

    //
    //
    //
    procedure FillBookData(BookID: Integer; DatabaseID: Integer; Data: PBookData);
    procedure SetRate(BookID: Integer; DatabaseID: Integer; Rate: Integer);
    procedure SetProgress(BookID: Integer; DatabaseID: Integer; Progress: Integer);
    function GetReview(BookID: Integer; DatabaseID: Integer): string;
    function SetReview(BookID: Integer; DatabaseID: Integer; const Review: string): Integer;

    //
    // Работа с группами
    //
    function AddGroup(const Name: string): Boolean;
    procedure DeleteGroup(GroupID: Integer);
    procedure ClearGroup(GroupID: Integer);
    procedure DeleteFromGroup(BookID: Integer; DatabaseID: Integer; GroupID: Integer);
    procedure RemoveUnusedBooks;

  end;

  TMHLCollection = class
  private
    FSysDataModule: TDMUser;

    function GetActive: Boolean;

    function GetID: Integer;

    function GetName: string;
    procedure SetName(const Value: string);

    function GetRootFolder: string;
    procedure SetRootFolder(const Value: string);

    function GetDBFileName: string;
    procedure SetDBFileName(const Value: string);

    function GetNotes: string;
    procedure SetNotes(const Value: string);

    function GetUser: string;
    procedure SetUser(const Value: string);

    function GetPassword: string;
    procedure SetPassword(const Value: string);

    function GetCreationDate: TDateTime;
    procedure SetCreationDate(const Value: TDateTime);

    function GetVersion: Integer;
    procedure SetVersion(const Value: Integer);

    function GetCollectionType: COLLECTION_TYPE;
    procedure SetCollectionType(const Value: COLLECTION_TYPE);

    function GetAllowDelete: Boolean;
    procedure SetAllowDelete(const Value: Boolean);
    function GetURL: string;
    procedure SetURL(const Value: string);
    function GetScript: string;
    procedure SetScript(const Value: string);

  public
    property Active: Boolean read GetActive;

    property ID: Integer read GetID;
    property Name: string read GetName write SetName;
    property RootFolder: string read GetRootFolder write SetRootFolder;
    property DBFileName: string read GetDBFileName write SetDBFileName;
    property Notes: string read GetNotes write SetNotes;
    property CreationDate: TDateTime read GetCreationDate write SetCreationDate;
    property Version: Integer read GetVersion write SetVersion;
    property CollectionType: COLLECTION_TYPE read GetCollectionType write SetCollectionType;
    property AllowDelete: Boolean read GetAllowDelete write SetAllowDelete;
    property User: string read GetUser write SetUser;
    property Password: string read GetPassword write SetPassword;
    property URL: string read GetURL write SetURL;
    property Script: string read GetScript write SetScript;
  end;

var
  DMUser: TDMUser;

implementation

uses
  SysUtils,
  StrUtils,
  Variants,
  dm_Collection;

resourcestring
  rstrNamelessColection = 'безымянная коллекция';

{$R *.dfm}

{ TDMUser }

function TDMUser.ActivateGroup(const ID: Integer): Boolean;
begin
  Result := Groups.Locate(GROUP_ID_FIELD, ID, []);
end;

procedure TDMUser.CorrectExtra(OldID, NewID: Integer);
begin
  if GroupedBooks.Locate(BOOK_DB_FIELDS, VarArrayOf([OldID, ActiveCollection.GetID]), []) then
  begin
    GroupedBooks.Edit;
    GroupedBooksBookID.Value := NewID;
    GroupedBooks.Post;
  end;
end;

constructor TDMUser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCollection := TMHLCollection.Create;
  FCollection.FSysDataModule := Self;
end;

destructor TDMUser.Destroy;
begin
  FCollection.Free;
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
var
  ID: Integer;
begin
  { TODO -oNickR -cRefactoring : магические числа!!! }
  case CollectionType of // предопределенные типы
    65536: ID := 10001; // либрусек fb2
    65537: ID := 10002; // либрусек не-fb2
    134283264: ID := 10003; // либрусек on-line
  else
    begin
      Randomize;
      ID := Random(10000);
    end;
  end;

  while tblBases.Locate(ID_FIELD, ID, []) do // проверяем уникальность
    ID := Random(10000);

  //
  // регистрируем коллекцию
  //
  tblBases.Insert;
  tblBasesID.Value := ID;                           // хм... это автоинкрементное поле, зачем его заполнять?
  tblBasesName.Value := DisplayName;
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
end;

function TDMUser.ActivateCollection(CollectionID: Integer): Boolean;
begin
  Result := tblBases.Locate(ID_FIELD, CollectionID, []);
end;

procedure TDMUser.UpdateCollectionProps(
  CollectionID: Integer;
  const DisplayName: string;
  const RootFolder: string;
  const DBFileName: string;
  const Description: string = '';
  const URL: string = '';
  const User: string = '';
  const Pass: string = '';
  const Script: string = ''
);
begin
  if ActivateCollection(CollectionID) then
  begin
    tblBases.Edit;

    tblBasesName.Value := DisplayName;
    tblBasesRootFolder.Value := RootFolder;
    tblBasesDBFileName.Value := DBFileName;
    tblBasesNotes.Value := Description;
    tblBasesURL.Value := URL;
    tblBasesUser.Value := User;
    tblBasesPass.Value := Pass;
    tblBasesConnection.Value := Script;

    tblBases.Post;
  end;
end;

function TDMUser.FindCollectionWithProp(PropID: TCollectionProp; const Value: string; IgnoreID: Integer): Boolean;
const
  Fields: array [TCollectionProp] of string = ('Name', 'DBFileName', 'RootFolder');
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

function TDMUser.FindFirstCollection: Boolean;
begin
  Result := False;
  if tblBases.IsEmpty then
    Exit;

  tblBases.First;
end;

function TDMUser.FindFirstExternalCollection: Boolean;
begin
  Result := False;
  if tblBases.IsEmpty then
    Exit;

  tblBases.First;
  while not tblBases.Eof do
  begin
    if isExternalCollection(ActiveCollection.CollectionType) then
    begin
      Result := True;
      Exit;
    end;

    tblBases.Next;
  end;
end;

function TDMUser.FindNextCollection: Boolean;
begin
  tblBases.Next;
  Result := not tblBases.Eof;
end;

function TDMUser.FindNextExternalCollection: Boolean;
begin
  tblBases.Next;

  while not tblBases.Eof do
  begin
    if isExternalCollection(ActiveCollection.CollectionType) then
    begin
      Result := True;
      Exit;
    end;

    tblBases.Next;
  end;

  Result := False;
end;

{***
procedure TDMUser.InsertToGroupTable(BookID: Integer; const Genre: string);
begin
  dmCollection.tblBooks.Locate(BOOK_ID_FIELD, BookID, []);

  if not tblBooks.Locate(FILENAME_FIELD, dmCollection.tblBooksFileName.Value, []) then
  begin
    tblBooks.Insert;
    tblBooksBookID.Value := BookID;
    tblBooksDatabaseID.Value := ActiveCollection.ID;
    tblBooksTitle.Value := dmCollection.tblBooksTitle.Value;

    tblBooksSeries.Value := IfThen(dmCollection.tblBooksSeries.IsNull, NO_SERIES_TITLE, dmCollection.tblBooksSeries.Value);

    tblBooksFullName.Value := dmCollection.FullAuthorsString(BookID);
    tblBooksSerieID.Value := dmCollection.tblBooksSerieID.Value;
    tblBooksSeqNumber.Value := dmCollection.tblBooksSeqNumber.Value;
    tblBooksLibID.Value := dmCollection.tblBooksLibID.Value;
    tblBooksSize.Value := dmCollection.tblBooksSize.Value;
    tblBooksDeleted.Value := dmCollection.tblBooksDeleted.Value;
    tblBooksLocal.Value := dmCollection.tblBooksLocal.Value;

    if dmCollection.tblBooksFolder.IsNull then
      tblBooksFolder.Value := IncludeTrailingPathDelimiter(ActiveCollection.RootFolder)
    else
      tblBooksFolder.Value := IncludeTrailingPathDelimiter(ActiveCollection.RootFolder) + CheckSymbols(dmCollection.tblBooksFolder.Value);

    tblBooksFileName.Value := dmCollection.tblBooksFileName.Value;
    tblBooksExt.Value := dmCollection.tblBooksExt.Value;
    tblBooksInsideNo.Value := dmCollection.tblBooksInsideNo.Value;
    tblBooksGenres.Value := Genre;
    ///tblBooksRate.Value := dmCollection.tblBooksRate.Value;
    tblBooksDate.Value := dmCollection.tblBooksDate.Value;
    ///tblBooksProgress.Value := dmCollection.tblBooksProgress.Value;
    tblBooksCode.Value := dmCollection.tblBooksCode.Value;
    tblBooksKeyWords.Value := dmCollection.tblBooksKeyWords.Value;
    tblBooks.Post;

    if tblBooksCode.Value = 1 then
    begin
      ///tblExtra.Insert;
      ///tblExtraReview.Value := dmCollection.tblExtraReview.Value;
      ///tblExtra.Post;
    end;
  end;
end;
***}

procedure TDMUser.LoadFinished;
var
  p, ID, Progress: Integer;
begin
  // Прочитаное
  Inc(i);
  while (i < SL.Count) and (Pos('#', SL[i]) = 0) do
  begin
    p := Pos(' ', SL[i]);
    ID := StrToInt(Copy(SL[i], 1, p - 1));
    Progress := StrToInt(Copy(SL[i], p + 1));

    dmCollection.tblBooks.Locate(LIB_ID_FIELD, ID, []);
    ID := dmCollection.tblBooksID.Value;

    {***
    if not tblFinished.Locate(DB_ID_FIELD + '; ID', VarArrayOf([ActiveCollection.ID, ID]), []) then
    begin
      tblFinished.Insert;
      tblFinishedBookID.Value := ID;
      tblFinishedDataBaseID.Value := ActiveCollection.ID;
      tblFinishedDate.Value := Now;
      tblFinishedProgress.Value := Progress;
      tblFinished.Post;
    end
    else
    begin
      tblFinished.Edit;
      tblFinishedProgress.Value := Progress;
      tblFinished.Post;
    end;
    ***}

    Inc(i);
  end;
end;

procedure TDMUser.LoadGroupedBooks;
var
  p, ID, GroupID: Integer;
  Name: string;
begin
  // Избранное
  Inc(i);
  while (i < SL.Count) and (Pos('#', SL[i]) = 0) do
  begin
    p := Pos(' ', SL[i]);
    if p <> 0 then
    begin
      ID := StrToInt(Copy(SL[i], 1, p - 1));
      Name := Copy(SL[i], p + 1);
    end
    else
    begin
      ID := StrToInt(SL[i]);
      GroupID := 1;
      Name := '';
    end;

    if not Groups.Locate('Name', Name, []) then
      Groups.Locate(GROUP_ID_FIELD, GroupID, []);

    ///if dmCollection.tblBooks.Locate(LIB_ID_FIELD, ID, []) then
    ///  InsertToGroupTable(dmCollection.tblBooksID.Value, dmCollection.GetBookGenres(dmCollection.tblBooksID.Value, False));
    Inc(i);
  end;
end;

procedure TDMUser.LoadReviews;
var
  ID, p: Integer;
  S: string;
begin
  // Рецензии
  Inc(i);
  while (i < SL.Count) and (Pos('#', SL[i]) = 0) do
  begin
    p := Pos(' ', SL[i]);
    ID := StrToInt(Copy(SL[i], 1, p - 1));
    S := Copy(SL[i], p + 1);

    StrReplace('~', #13#10, S);

    dmCollection.tblBooks.Locate(LIB_ID_FIELD, ID, []); // получаем реальный ID
    ID := dmCollection.tblBooksID.Value;

    if dmCollection.tblBooks.Locate(BOOK_ID_FIELD, ID, []) then
    begin
      dmCollection.tblExtra.Insert;
      dmCollection.tblExtraReview.Value := S;
      dmCollection.tblExtra.Post;

      dmCollection.tblBooks.Edit;
      dmCollection.tblBooksCode.Value := 1;
      dmCollection.tblBooks.Post;
    end;

    Inc(i);
  end;
end;

procedure TDMUser.LoadGroups(const SL: TStringList; var i: Integer);
var
  k: Integer;
begin
  Inc(i);
  k := 1;
  while Pos('#', SL[i]) = 0 do
  begin
    if k > 2 then
      AddGroup(SL[i]);
    Inc(k);
    Inc(i);
  end;
end;

procedure TDMUser.LoadRates;
var
  p, ID, LibID, Rate: Integer;
begin
  // Рейтинги
  Inc(i);
  while Pos('#', SL[i]) = 0 do
  begin
    p := Pos(' ', SL[i]);
    LibID := StrToInt(Copy(SL[i], 1, p - 1));
    Rate := StrToInt(Copy(SL[i], p + 1));

    dmCollection.tblBooks.Locate(LIB_ID_FIELD, LibID, []); // получаем реальный ID
    ID := dmCollection.tblBooksID.Value;

    {***
    if not tblRates.Locate(BOOK_DB_FIELDS, VarArrayOf([ID, ActiveCollection.ID]), []) then
    begin
      tblRates.Insert;
      tblRatesBookID.Value := ID;
      tblRatesRate.Value := Rate;
      tblRatesDataBaseID.Value := ActiveCollection.ID;
      tblRatesDate.Value := Now;
      tblRates.Post;
    end
    else
    begin
      tblRates.Edit;
      tblRatesRate.Value := Rate;
      tblRates.Post;
    end;
    ***}
    Inc(i);
  end;
end;

procedure TDMUser.SetLocal(ID: Integer; Value: Boolean);
begin
  if GroupedBooks.Locate(BOOK_DB_FIELDS, VarArrayOf([ID, ActiveCollection.ID]), []) then
  begin
    GroupedBooks.Edit;
    GroupedBooksLocal.Value := Value;
    GroupedBooks.Post;
  end;
end;

procedure TDMUser.SetTableState(State: Boolean);
begin
  tblBases.Active := State;
  Groups.Active := State;
  BookGroups.Active := State;
  GroupedBooks.Active := State;
  Books.Active := State;
end;

procedure TDMUser.FillBookData(BookID: Integer; DatabaseID: Integer; Data: PBookData);
begin
  Assert(False, 'Not implemented yet!');
end;

procedure TDMUser.SetRate(BookID: Integer; DatabaseID: Integer; Rate: Integer);
begin
  Assert(Books.Active);
  if Books.Locate(BOOK_DB_FIELDS, VarArrayOf([BookID, DatabaseID]), []) then
  begin
    Books.Edit;
    BooksRate.Value := Rate;
    Books.Post;
  end;
end;

procedure TDMUser.SetProgress(BookID: Integer; DatabaseID: Integer; Progress: Integer);
begin
  Assert(Books.Active);
  if Books.Locate(BOOK_DB_FIELDS, VarArrayOf([BookID, DatabaseID]), []) then
  begin
    Books.Edit;
    BooksProgress.Value := Progress;
    Books.Post;
  end;
end;

function TDMUser.GetReview(BookID: Integer; DatabaseID: Integer): string;
begin
  Assert(Books.Active);
  if Books.Locate(BOOK_DB_FIELDS, VarArrayOf([BookID, DatabaseID]), []) then
  begin
    Result := BooksReview.Value;
  end
  else
    Result := '';
end;

function TDMUser.SetReview(BookID: Integer; DatabaseID: Integer; const Review: string): Integer;
begin
  Assert(Books.Active);
  Result := 0;
  if Books.Locate(BOOK_DB_FIELDS, VarArrayOf([BookID, DatabaseID]), []) then
  begin
    Books.Edit;
    if Review = '' then
    begin
      BooksReview.Clear;
      BooksCode.Value := 0;
    end
    else
    begin
      BooksReview.Value := Review;
      BooksCode.Value := 1;
      Result := 1;
    end;
    Books.Post;
  end;
end;

//
// Создать группу
//
function TDMUser.AddGroup(const Name: string): Boolean;
begin
  if not Groups.Locate('Name', Name, []) then
  begin
    Groups.Append;
    GroupsName.Value := Name;
    GroupsAllowDelete.Value := True;
    Groups.Post;

    Result := True;
  end
  else
    Result := False;
end;

//
// Очищает текущую группу
//
procedure TDMUser.InternalClearGroup(GroupID: Integer; RemoveGroup: Boolean);
begin
  if Groups.Locate(GROUP_ID_FIELD, GroupID, []) then
  begin
    //
    // Удалить книги из группы
    //
    BookGroups.First;
    while not BookGroups.Eof do
      BookGroups.Delete;
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

//
// Удалить указанную книгу из указанной группы.
// NOTE: этот метод не удаляет неиспользуемые книги !!!
//
procedure TDMUser.DeleteFromGroup(BookID: Integer; DatabaseID: Integer; GroupID: Integer);
begin
  if Groups.Locate(GROUP_ID_FIELD, GroupID, []) then
  begin
    if BookGroups.Locate(BOOK_DB_FIELDS, VarArrayOf([BookID, DatabaseID]), []) then
      BookGroups.Delete;
  end;
end;

//
// Удалить книги, не входящие в группы
//
procedure TDMUser.RemoveUnusedBooks;
begin
  ClearQuery.ExecSQL;
end;

{ TMHLCollection }

function TMHLCollection.GetActive: Boolean;
begin
  Assert(Assigned(FSysDataModule));
  Result := FSysDataModule.tblBases.Active and not FSysDataModule.tblBasesID.IsNull;
end;

function TMHLCollection.GetID: Integer;
begin
  Assert(Assigned(FSysDataModule));
  if FSysDataModule.tblBasesID.IsNull then
    Result := NO_ACTIVECOLLECTION_ID
  else
    Result := FSysDataModule.tblBasesID.Value;
end;

function TMHLCollection.GetName: string;
begin
  Assert(Assigned(FSysDataModule));
  if FSysDataModule.tblBasesName.IsNull then
    Result := rstrNamelessColection
  else
    Result := FSysDataModule.tblBasesName.Value;
end;

procedure TMHLCollection.SetName(const Value: string);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBasesName.Value := Value;
end;

function TMHLCollection.GetRootFolder: string;
begin
  Assert(Assigned(FSysDataModule));
  Result := FSysDataModule.tblBasesRootFolder.Value;
end;

function TMHLCollection.GetScript: string;
begin
  Result := FSysDataModule.tblBasesConnection.Value;
end;

procedure TMHLCollection.SetRootFolder(const Value: string);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBasesRootFolder.Value := ExcludeTrailingPathDelimiter(Value);
end;

procedure TMHLCollection.SetScript(const Value: string);
begin
  FSysDataModule.tblBasesConnection.Value := Value;
end;

function TMHLCollection.GetDBFileName: string;
begin
  Assert(Assigned(FSysDataModule));
  Result := FSysDataModule.tblBasesDBFileName.Value;
end;

procedure TMHLCollection.SetDBFileName(const Value: string);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBasesDBFileName.Value := Value;
end;

function TMHLCollection.GetNotes: string;
begin
  Assert(Assigned(FSysDataModule));
  Result := FSysDataModule.tblBasesNotes.Value;
end;

procedure TMHLCollection.SetNotes(const Value: string);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBasesNotes.Value := Value;
end;

function TMHLCollection.GetURL: string;
begin
  Result := FSysDataModule.tblBasesURL.Value;
end;

function TMHLCollection.GetUser: string;
begin
  Assert(Assigned(FSysDataModule));
  Result := FSysDataModule.tblBasesUser.Value;
end;

procedure TMHLCollection.SetURL(const Value: string);
begin
  FSysDataModule.tblBasesURL.Value := Value;
end;

procedure TMHLCollection.SetUser(const Value: string);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBasesUser.Value := Value;
end;

function TMHLCollection.GetPassword: string;
begin
  Assert(Assigned(FSysDataModule));
  Result := FSysDataModule.tblBasesPass.Value;
end;

procedure TMHLCollection.SetPassword(const Value: string);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBasesPass.Value := Value;
end;

function TMHLCollection.GetCreationDate: TDateTime;
begin
  Assert(Assigned(FSysDataModule));
  Result := FSysDataModule.tblBasesDate.Value;
end;

procedure TMHLCollection.SetCreationDate(const Value: TDateTime);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBasesDate.Value := Value;
end;

function TMHLCollection.GetVersion: Integer;
begin
  Assert(Assigned(FSysDataModule));
  if FSysDataModule.tblBasesVersion.IsNull then
    Result := UNVERSIONED_COLLECTION
  else
    Result := FSysDataModule.tblBasesVersion.Value;
end;

procedure TMHLCollection.SetVersion(const Value: Integer);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBases.Edit;
  FSysDataModule.tblBasesVersion.Value := Value;
  FSysDataModule.tblBases.Post;
end;

function TMHLCollection.GetCollectionType: COLLECTION_TYPE;
begin
  Assert(Assigned(FSysDataModule));
  Result := FSysDataModule.tblBasesCode.Value;

  if Result = CT_DEPRICATED_ONLINE_FB then
    Result := CT_LIBRUSEC_ONLINE_FB;
end;

procedure TMHLCollection.SetCollectionType(const Value: COLLECTION_TYPE);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBasesCode.Value := Value;
end;

function TMHLCollection.GetAllowDelete: Boolean;
begin
  Assert(Assigned(FSysDataModule));
  if FSysDataModule.tblBasesAllowDelete.IsNull then
    Result := True
  else
    Result := FSysDataModule.tblBasesAllowDelete.Value;
end;

procedure TMHLCollection.SetAllowDelete(const Value: Boolean);
begin
  Assert(Assigned(FSysDataModule));
  FSysDataModule.tblBasesAllowDelete.Value := Value;
end;

end.
