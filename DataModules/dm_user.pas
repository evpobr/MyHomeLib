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
  unit_globals,
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

    tblRates: TABSTable;
    tblGrouppedBooks: TABSTable;
    dsGroupedBooks: TDataSource;
    SeverityImages: TImageList;
    SeverityImagesBig: TImageList;
    dsGroupList: TDataSource;
    tblFinished: TABSTable;
    tblGroupList: TABSTable;
    tblGroupListID: TAutoIncField;
    tblGroupListName: TWideStringField;
    tblGroupListAllowDelete: TBooleanField;
    tblGroupListNotes: TMemoField;
    tblGroupListIcon: TBlobField;
    tblRatesID: TAutoIncField;
    tblRatesBookID: TIntegerField;
    tblRatesDataBaseID: TIntegerField;
    tblRatesRate: TIntegerField;
    tblRatesDate: TDateField;
    tblFinishedID: TAutoIncField;
    tblFinishedBookID: TIntegerField;
    tblFinishedDataBaseID: TIntegerField;
    tblFinishedProgress: TSmallintField;
    tblFinishedDate: TDateField;
    tblGrouppedBooksID: TAutoIncField;
    tblGrouppedBooksGroupID: TIntegerField;
    tblGrouppedBooksOuterID: TIntegerField;
    tblGrouppedBooksSerID: TIntegerField;
    tblGrouppedBooksSeqNumber: TSmallintField;
    tblGrouppedBooksDatabaseID: TIntegerField;
    tblGrouppedBooksLibID: TIntegerField;
    tblGrouppedBooksDate: TDateField;
    tblGrouppedBooksTitle: TWideStringField;
    tblGrouppedBooksFullName: TWideStringField;
    tblGrouppedBooksInsideNo: TIntegerField;
    tblGrouppedBooksFileName: TWideStringField;
    tblGrouppedBooksExt: TWideStringField;
    tblGrouppedBooksSize: TIntegerField;
    tblGrouppedBooksCode: TSmallintField;
    tblGrouppedBooksFolder: TWideStringField;
    tblGrouppedBooksDiscID: TIntegerField;
    tblGrouppedBooksLocal: TBooleanField;
    tblGrouppedBooksDeleted: TBooleanField;
    tblGrouppedBooksGenres: TWideStringField;
    tblGrouppedBooksSeries: TWideStringField;
    tblGrouppedBooksRate: TIntegerField;
    tblGrouppedBooksProgress: TSmallintField;
    tblGrouppedBooksLibRate: TIntegerField;
    tblGrouppedBooksLang: TWideStringField;
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
    tblExtra: TABSTable;
    tblExtraE_ID: TAutoIncField;
    tblExtraE_BookID: TIntegerField;
    tblExtraE_Annotation: TWideMemoField;
    tblExtraE_Review: TWideMemoField;
    tblExtraE_Cover: TBlobField;
    tblExtraE_Data: TWideMemoField;

  private
    FCollection: TMHLCollection;

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

    procedure SetUserTableState(Status: Boolean);

  public
    //
    // Active Collection
    //
    property ActiveCollection: TMHLCollection read FCollection;
    procedure SetTableState(State: Boolean);

    function FindFirstExternalCollection: Boolean;
    function FindNextExternalCollection: Boolean;

    function FindFirstCollection: Boolean;
    function FindNextCollection: Boolean;

    function ActivateGroup(const ID: Integer): Boolean;

    procedure SetRate(ID, Rate: Integer);
    procedure SetLocal(ID: Integer; Value: Boolean);
    procedure SetFinished(ID, Progress: Integer; ADBID: Integer = 0);
    procedure DeleteRate(AID: Integer; ADBID: Integer = 0);
    procedure DeleteFinished(AID: Integer; ADBID: Integer = 0);
    procedure InsertToGroupTable(ID: Integer; const Genre: string);
    procedure AddGroup(const Name: string);

    procedure LoadRates(const SL: TStringList; var i: Integer);
    procedure LoadGroupedBooks(const SL: TStringList; var i: Integer);
    procedure LoadFinished(const SL: TStringList; var i: Integer);
    procedure LoadGroups(const SL: TStringList; var i: Integer);
    procedure LoadReviews(const SL: TStringList; var i: Integer);
    procedure CorrectExtra(OldID, NewID: Integer);
    procedure DeleteExtra(AID: Integer);
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
  Variants,
  dm_Collection;

resourcestring
  rstrNamelessColection = 'безымянная коллекция';

{$R *.dfm}

{ TDMUser }

function TDMUser.ActivateGroup(const ID: Integer): Boolean;
begin
  Result := tblGroupList.Locate('Id', ID, []);
end;

procedure TDMUser.AddGroup(const Name: string);
begin
  if not tblGroupList.Locate('Name', Name, []) then
  begin
    tblGroupList.Insert;
    tblGroupListName.Value := Name;
    tblGroupListAllowDelete.Value := True;
    tblGroupList.Post;
  end;
end;

procedure TDMUser.CorrectExtra(OldID, NewID: Integer);
begin
  if tblRates.Locate('BookID; DatabaseID', VarArrayOf([OldID, ActiveCollection.GetID]), []) then
  begin
    tblRates.Edit;
    tblRatesBookID.Value := NewID;
    tblRates.Post;
  end;

  if tblFinished.Locate('BookID; DatabaseID', VarArrayOf([OldID, ActiveCollection.GetID]), []) then
  begin
    tblFinished.Edit;
    tblFinishedBookID.Value := NewID;
    tblFinished.Post;
  end;

  if tblGrouppedBooks.Locate('OuterID; DatabaseID', VarArrayOf([OldID, ActiveCollection.GetID]), []) then
  begin
    tblGrouppedBooks.Edit;
    tblGrouppedBooksOuterID.Value := NewID;
    tblGrouppedBooks.Post;
  end;
end;

constructor TDMUser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCollection := TMHLCollection.Create;
  FCollection.FSysDataModule := Self;
end;

procedure TDMUser.DeleteExtra(AID: Integer);
begin
  DeleteFinished(AID);
  DeleteRate(AID);
end;

procedure TDMUser.DeleteFinished;
var
  DbId: Integer;
begin
  if ADBID = 0 then
    DbId := ActiveCollection.ID
  else
    DbId := ADBID;

  if tblFinished.Locate('DataBaseID;BookID', VarArrayOf([DbId, AID]), []) then
    tblFinished.Delete;
end;

procedure TDMUser.DeleteRate;
var
  DbId: Integer;
begin
  if ADBID = 0 then
    DbId := ActiveCollection.ID
  else
    DbId := ADBID;

  if tblRates.Locate('DataBaseID;BookID', VarArrayOf([DbId, AID]), []) then
    tblRates.Delete;
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

  while tblBases.Locate('Id', ID, []) do // проверяем уникальность
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
  Result := tblBases.Locate('ID', CollectionID, []);
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

procedure TDMUser.InsertToGroupTable(ID: Integer; const Genre: string);
begin
  dmCollection.tblBooks.Locate('ID', ID, []);

  if not tblGrouppedBooks.Locate('FileName', dmCollection.tblBooksFileName.Value, []) then
  begin
    tblGrouppedBooks.Insert;
    tblGrouppedBooksOuterID.Value := ID;
    tblGrouppedBooksDatabaseID.Value := ActiveCollection.ID;
    tblGrouppedBooksTitle.Value := dmCollection.tblBooksTitle.Value;

    tblGrouppedBooksSerID.Value := dmCollection.tblBooksSerID.Value;

    if dmCollection.tblBooksSeries.IsNull then
      tblGrouppedBooksSeries.Value := NO_SERIES_TITLE
    else
      tblGrouppedBooksSeries.Value := dmCollection.tblBooksSeries.Value;

    tblGrouppedBooksFullName.Value := dmCollection.FullAuthorsString(ID);

    tblGrouppedBooksSeqNumber.Value := dmCollection.tblBooksSeqNumber.Value;
    tblGrouppedBooksLibID.Value := dmCollection.tblBooksLibID.Value;
    tblGrouppedBooksSize.Value := dmCollection.tblBooksSize.Value;
    tblGrouppedBooksDeleted.Value := dmCollection.tblBooksDeleted.Value;
    tblGrouppedBooksLocal.Value := dmCollection.tblBooksLocal.Value;

    if not dmCollection.tblBooksFolder.IsNull then
      tblGrouppedBooksFolder.Value := IncludeTrailingPathDelimiter(ActiveCollection.RootFolder) + CheckSymbols(dmCollection.tblBooksFolder.Value)
    else
      tblGrouppedBooksFolder.Value := IncludeTrailingPathDelimiter(ActiveCollection.RootFolder);

    tblGrouppedBooksFileName.Value := dmCollection.tblBooksFileName.Value;
    tblGrouppedBooksExt.Value := dmCollection.tblBooksExt.Value;
    tblGrouppedBooksInsideNo.Value := dmCollection.tblBooksInsideNo.Value;
    tblGrouppedBooksGenres.Value := Genre;
    tblGrouppedBooksRate.Value := dmCollection.tblBooksRate.Value;
    tblGrouppedBooksDate.Value := dmCollection.tblBooksDate.Value;
    tblGrouppedBooksProgress.Value := dmCollection.tblBooksProgress.Value;
    tblGrouppedBooksCode.Value := dmCollection.tblBooksCode.Value;
    // tblGrouppedBooksKeyWords.Value := dmCollection.tblBooksKeyWords.Value;
    tblGrouppedBooks.Post;

    if tblGrouppedBooksCode.Value = 1 then
    begin
      tblExtra.Insert;
      tblExtraE_Review.Value := dmCollection.tblExtraE_Review.Value;
      tblExtra.Post;
    end;
  end;
end;

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

    dmCollection.tblBooks.Locate('LibID', ID, []);
    ID := dmCollection.tblBooksID.Value;

    if not tblFinished.Locate('DataBaseID; ID', VarArrayOf([ActiveCollection.ID, ID]), []) then
    begin
      tblFinished.Insert;
      tblFinishedBookID.Value := ID;
      tblFinishedProgress.Value := Progress;
      tblFinishedDataBaseID.Value := ActiveCollection.ID;
      tblFinishedDate.Value := Now;
      tblFinished.Post;
    end
    else
    begin
      tblFinished.Edit;
      tblFinishedProgress.Value := Progress;
      tblFinished.Post;
    end;
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

    if not tblGroupList.Locate('Name', Name, []) then
      tblGroupList.Locate('ID', GroupID, []);

    if dmCollection.tblBooks.Locate('LibID', ID, []) then
      InsertToGroupTable(dmCollection.tblBooksID.Value, dmCollection.GetBookGenres(dmCollection.tblBooksID.Value, False));
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

    dmCollection.tblBooks.Locate('LibID', ID, []); // получаем реальный ID
    ID := dmCollection.tblBooksID.Value;

    if dmCollection.tblBooks.Locate('ID', ID, []) then
    begin
      dmCollection.tblExtra.Insert;
      dmCollection.tblExtraE_Review.Value := S;
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

    dmCollection.tblBooks.Locate('LibID', LibID, []); // получаем реальный ID
    ID := dmCollection.tblBooksID.Value;

    if not tblRates.Locate('DataBaseID; BookID', VarArrayOf([ActiveCollection.ID, ID]), []) then
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
    Inc(i);
  end;
end;

procedure TDMUser.SetFinished;
var
  DbId: Integer;
begin
  if ADBID = 0 then
    DbId := ActiveCollection.ID
  else
    DbId := ADBID;

  if not tblFinished.Locate('DataBaseID;BookID', VarArrayOf([DbId, ID]), []) then
  begin
    tblFinished.Insert;
    tblFinishedBookID.Value := ID;
    tblFinishedProgress.Value := Progress;
    tblFinishedDataBaseID.Value := DbId;
    tblFinishedDate.Value := Now;
    tblFinished.Post;
  end
  else
  begin
    tblFinished.Edit;
    tblFinishedProgress.Value := Progress;
    tblFinished.Post;
  end;
end;

procedure TDMUser.SetLocal(ID: Integer; Value: Boolean);
begin
  if tblGrouppedBooks.Locate('DataBaseID;OuterID', VarArrayOf([ActiveCollection.ID, ID]), []) then
  begin
    tblGrouppedBooks.Edit;
    tblGrouppedBooksLocal.Value := Value;
    tblGrouppedBooks.Post;
  end;
end;

procedure TDMUser.SetRate(ID, Rate: Integer);
begin
  if not tblRates.Locate('DataBaseID;BookID', VarArrayOf([ActiveCollection.ID, ID]), []) then
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
end;

procedure TDMUser.SetTableState(State: Boolean);
begin
  tblGroupList.Active := State;
  tblGrouppedBooks.Active := State;
  tblRates.Active := State;
  tblBases.Active := State;
  tblFinished.Active := State;
end;

procedure TDMUser.SetUserTableState(Status: Boolean);
begin
  tblGroupList.Active := Status;
  tblGrouppedBooks.Active := Status;
  tblRates.Active := Status;
  tblBases.Active := Status;
  tblFinished.Active := Status;
  tblExtra.Active := Status;
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
