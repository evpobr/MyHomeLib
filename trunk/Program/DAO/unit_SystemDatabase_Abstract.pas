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

unit unit_SystemDatabase_Abstract;

interface

uses
  Classes,
  Windows,
  Generics.Collections,
  unit_Globals,
  unit_Consts,
  unit_Interfaces,
  unit_MHLGenerics,
  UserData;

type
  TCollectionInfo = class(TInterfacedObject, ICollectionInfo)
  private
    FID: Integer;
    FName: string;
    FRootFolder: string;
    FDBFileName: string;
    FNotes: string;
    FUser: string;
    FPassword: string;
    FCreationDate: TDateTime;
    FDataVersion: Integer;
    FCollectionType: COLLECTION_TYPE;
    FURL: string;
    FScript: string;

  public // interface methods
    function GetID: Integer;
    procedure SetID(const NewID: Integer);
    function GetName: string;
    procedure SetName(const NewName: string);
    function GetRootFolder: string;
    procedure SetRootFolder(const NewRootFolder: string);
    function GetDBFileName: string;
    procedure SetDBFileName(const NewDBFileName: string);
    function GetNotes: string;
    procedure SetNotes(const NewNotes: string);
    function GetUser: string;
    procedure SetUser(const NewUser: string);
    function GetPassword: string;
    procedure SetPassword(const NewPassword: string);
    function GetCreationDate: TDateTime;
    procedure SetCreationDate(const NewCreationDate: TDateTime);
    function GetDataVersion: Integer;
    procedure SetDataVersion(const NewVersion: Integer);
    function GetCollectionType: COLLECTION_TYPE;
    procedure SetCollectionType(const NewCollectionType: COLLECTION_TYPE);
    function GetURL: string;
    procedure SetURL(const NewURL: string);
    function GetScript: string;
    procedure SetScript(const NewScript: string);

    function GetRootPath: string;

    procedure Clear;
  end;

  // --------------------------------------------------------------------------
  TCollectionInfoCache = TInterfaceCache<Integer, ICollectionInfo>;
  TBookCollectionCache = TInterfaceCache<string, IBookCollection>;

  // --------------------------------------------------------------------------

  TSystemData = class abstract(TInterfacedObject, ISystemData)
  protected
    FActiveCollectionInfo: ICollectionInfo;
    FBookCollectionCache: TBookCollectionCache;

    function InternalCreateCollection(const DBCollectionFile: string): IBookCollection; virtual; abstract;

  public
    //
    // ISystemData
    //

    //
    // Создание, регистрация и удаление коллекций
    //
    function CreateCollection(
      const DisplayName: string;
      const RootFolder: string;
      const DBFileName: string;
      CollectionType: COLLECTION_TYPE;
      const GenresFileName: string
    ): Integer; virtual; abstract;

    function RegisterCollection(
      const DBFileName: string;
      const DisplayName: string;
      const RootFolder: string
    ): Integer; virtual; abstract;

    procedure DeleteCollection(CollectionID: Integer; RemoveFromDisk: Boolean = True); virtual; abstract;

    function HasCollections: Boolean;
    function HasCollectionWithProp(PropID: TPropertyID; const Value: string; IgnoreID: Integer = INVALID_COLLECTION_ID): Boolean; virtual; abstract;
    function FindFirstExistingCollectionID(const PreferredID: Integer): Integer;

    procedure SetProperty(const CollectionID: Integer; const PropID: TPropertyID; const Value: Variant); virtual; abstract;
    function GetProperty(const CollectionID: Integer; const PropID: TPropertyID): Variant; virtual; abstract;

    function GetCollectionInfo(const CollectionID: Integer): ICollectionInfo; virtual; abstract;
    procedure UpdateCollectionInfo(const CollectionInfo: ICollectionInfo); virtual; abstract;

    function GetCollection(const DBCollectionFile: string): IBookCollection;

    procedure ActivateCollection(CollectionID: Integer); virtual; abstract;
    function GetActiveCollectionInfo: ICollectionInfo;
    function GetActiveCollection: IBookCollection;
    function ActivateGroup(const ID: Integer): Boolean; virtual; abstract;

    //
    // Работа с книгами
    //
    procedure GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord); virtual; abstract;
    procedure DeleteBook(const BookKey: TBookKey); virtual; abstract;
    procedure UpdateBook(const BookRecord: TBookRecord); virtual; abstract;

    procedure SetExtra(const BookKey: TBookKey; extra: TBookExtra); virtual; abstract;
    procedure SetRate(const BookKey: TBookKey; Rate: Integer); virtual; abstract;
    procedure SetProgress(const BookKey: TBookKey; Progress: Integer); virtual; abstract;
    function GetReview(const BookKey: TBookKey): string; virtual; abstract;
    function SetReview(const BookKey: TBookKey; const Review: string): Integer; virtual; abstract;

    procedure SetLocal(const BookKey: TBookKey; Value: Boolean); virtual; abstract;
    procedure SetFileName(const BookKey: TBookKey; const FileName: string); virtual; abstract;
    procedure SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer); virtual; abstract;
    procedure SetFolder(const BookKey: TBookKey; const Folder: string); virtual; abstract;

    //
    // Работа с группами
    //
    function AddGroup(const GroupName: string; const AllowDelete: Boolean = True): Boolean; virtual; abstract;
    function GetGroup(const GroupID: Integer): TGroupData; virtual; abstract;
    function RenameGroup(GroupID: Integer; const NewName: string): Boolean; virtual; abstract;
    procedure ClearGroup(GroupID: Integer); virtual; abstract;
    procedure DeleteGroup(GroupID: Integer); virtual; abstract;

    procedure AddBookToGroup(const BookKey: TBookKey; GroupID: Integer; const BookRecord: TBookRecord); virtual; abstract;
    procedure CopyBookToGroup(const BookKey: TBookKey; SourceGroupID: Integer; TargetGroupID: Integer; MoveBook: Boolean); virtual; abstract;
    procedure DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer); virtual; abstract;

    //
    // Пользовательские данные
    //
    procedure ImportUserData(data: TUserData); virtual; abstract;
    procedure ExportUserData(data: TUserData);

    // Batch update methods:
    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer); virtual; abstract;

    //Iterators:
    function GetBookIterator(const GroupID: Integer; const DatabaseID: Integer = INVALID_COLLECTION_ID): IBookIterator; virtual; abstract;
    function GetGroupIterator: IGroupIterator; virtual; abstract;
    function GetCollectionInfoIterator: ICollectionInfoIterator; virtual; abstract;

    //
    // Служебные методы
    //
    procedure ClearCollectionCache;
    procedure RemoveUnusedBooks; virtual; abstract;

  public
    constructor Create;
    destructor Destroy; override;
  end;

resourcestring
  rstrNamelessColection = 'безымянная коллекция';
  rstrUnknownCollection = 'неизвестная коллекция';
  rstrFavoritesGroupName = 'Избранное';
  rstrToReadGroupName = 'К прочтению';

const
  USER_DATABASE = 'UserDB';

implementation

uses
  SysUtils;

{ TCollectionInfo }

procedure TCollectionInfo.Clear;
begin
  FID := INVALID_COLLECTION_ID;
  FName := '';
  FRootFolder := '';
  FDBFileName := '';
  FNotes := '';
  FCreationDate := 0;
  FDataVersion := UNVERSIONED_COLLECTION;
  FCollectionType := CT_PRIVATE_FB;
  FUser := '';
  FPassword := '';
  FURL := '';
  FScript := '';
end;

function TCollectionInfo.GetRootPath: string;
begin
  Result := IncludeTrailingPathDelimiter(FRootFolder);
end;

function TCollectionInfo.GetID: Integer;
begin
  Result := FID;
end;

procedure TCollectionInfo.SetID(const NewID: Integer);
begin
  FID := NewID;
end;

function TCollectionInfo.GetName: string;
begin
  Result := FName;
end;

procedure TCollectionInfo.SetName(const NewName: string);
begin
  FName := NewName;
end;

function TCollectionInfo.GetRootFolder: string;
begin
  Result := FRootFolder;
end;

procedure TCollectionInfo.SetRootFolder(const NewRootFolder: string);
begin
  FRootFolder := NewRootFolder;
end;

function TCollectionInfo.GetDBFileName: string;
begin
  Result := FDBFileName;
end;

procedure TCollectionInfo.SetDBFileName(const NewDBFileName: string);
begin
  FDBFileName := NewDBFileName;
end;

function TCollectionInfo.GetNotes: string;
begin
  Result := FNotes;
end;

procedure TCollectionInfo.SetNotes(const NewNotes: string);
begin
  FNotes := NewNotes;
end;

function TCollectionInfo.GetUser: string;
begin
  Result := FUser;
end;

procedure TCollectionInfo.SetUser(const NewUser: string);
begin
  FUser := NewUser;
end;

function TCollectionInfo.GetPassword: string;
begin
  Result := FPassword;
end;

procedure TCollectionInfo.SetPassword(const NewPassword: string);
begin
  FPassword := NewPassword;
end;

function TCollectionInfo.GetCreationDate: TDateTime;
begin
  Result := FCreationDate;
end;

procedure TCollectionInfo.SetCreationDate(const NewCreationDate: TDateTime);
begin
  FCreationDate := NewCreationDate;
end;

function TCollectionInfo.GetDataVersion: Integer;
begin
  Result := FDataVersion;
end;

procedure TCollectionInfo.SetDataVersion(const NewVersion: Integer);
begin
  FDataVersion := NewVersion;
end;

function TCollectionInfo.GetCollectionType: COLLECTION_TYPE;
begin
  Result := FCollectionType;
end;

procedure TCollectionInfo.SetCollectionType(const NewCollectionType: COLLECTION_TYPE);
begin
  FCollectionType := NewCollectionType;
end;

function TCollectionInfo.GetURL: string;
begin
  Result := FURL;
end;

procedure TCollectionInfo.SetURL(const NewURL: string);
begin
  FURL := NewURL;
end;

function TCollectionInfo.GetScript: string;
begin
  Result := FScript;
end;

procedure TCollectionInfo.SetScript(const NewScript: string);
begin
  FScript := NewScript;
end;

{ TSystemData }

constructor TSystemData.Create;
begin
  inherited Create;

  FBookCollectionCache := TBookCollectionCache.Create;
end;

destructor TSystemData.Destroy;
begin
  FActiveCollectionInfo := nil;
  FreeAndNil(FBookCollectionCache);
  inherited Destroy;
end;

function TSystemData.HasCollections: Boolean;
begin
  Result := (GetCollectionInfoIterator.RecordCount > 0);
end;

function TSystemData.FindFirstExistingCollectionID(const PreferredID: Integer): Integer;
var
  it: ICollectionInfoIterator;
  Info: ICollectionInfo;
begin
  Result := INVALID_COLLECTION_ID;

  it := GetCollectionInfoIterator;
  while it.Next(Info) do
  begin
    if FileExists(Info.DBFileName) then
    begin
      if Info.ID = PreferredID then
      begin
        //
        // Пользователь предпочитает эту коллекцию, она доступна -> выходим
        //
        Result := Info.ID;
        Break;
      end;

      if Result = INVALID_COLLECTION_ID then
      begin
        //
        // Запомним первую доступную коллекцию
        //
        Result := Info.ID;
      end;
    end;
  end;
end;

procedure TSystemData.ExportUserData(data: TUserData);
var
  CollectionID: Integer;
  BookGroup: TBookGroup;
  GroupIterator: IGroupIterator;
  GroupData: TGroupData;
  BookIterator: IBookIterator;
  BookRecord: TBookRecord;
begin
  Assert(Assigned(data));

  CollectionID := FActiveCollectionInfo.ID;

  GroupIterator := GetGroupIterator;
  while GroupIterator.Next(GroupData) do
  begin
    BookGroup := data.Groups.AddGroup(GroupData.GroupID, GroupData.Text);

    BookIterator := GetBookIterator(GroupData.GroupID, CollectionID);
    while BookIterator.Next(BookRecord) do
      BookGroup.AddBook(BookRecord.BookKey.BookID, BookRecord.LibID);
  end;
end;

function TSystemData.GetActiveCollectionInfo: ICollectionInfo;
begin
  Assert(Assigned(FActiveCollectionInfo));
  Result := FActiveCollectionInfo;
end;

function TSystemData.GetCollection(const DBCollectionFile: string): IBookCollection;
begin
  Assert(DBCollectionFile <> '');

  FBookCollectionCache.LockMap;
  try
    if FBookCollectionCache.ContainsKey(DBCollectionFile) then
    begin
      Result := FBookCollectionCache.Get(DBCollectionFile);
    end
    else
    begin
      Result := InternalCreateCollection(DBCollectionFile);
      FBookCollectionCache.Add(DBCollectionFile, Result);
    end;
  finally
    FBookCollectionCache.UnlockMap;
  end;
end;

function TSystemData.GetActiveCollection: IBookCollection;
begin
  Assert(FActiveCollectionInfo.ID > 0);
  Result := GetCollection(FActiveCollectionInfo.DBFileName);
end;

procedure TSystemData.ClearCollectionCache;
begin
  FBookCollectionCache.Clear;
end;

end.
