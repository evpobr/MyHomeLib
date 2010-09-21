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
  unit_Globals,
  unit_Consts,
  unit_Interfaces,
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
    FVersion: Integer;
    FCollectionType: COLLECTION_TYPE;
    FAllowDelete: Boolean;
    FURL: string;
    FScript: string;
    FSettings: TStrings;

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
    function GetVersion: Integer;
    procedure SetVersion(const NewVersion: Integer);
    function GetCollectionType: COLLECTION_TYPE;
    procedure SetCollectionType(const NewCollectionType: COLLECTION_TYPE);
    function GetAllowDelete: Boolean;
    procedure SetAllowDelete(const NewAllowDelete: Boolean);
    function GetURL: string;
    procedure SetURL(const NewURL: string);
    function GetScript: string;
    procedure SetScript(const NewScript: string);

    function GetSettings: TStrings;
    function GetRootPath: string;

    procedure Assign(Source: ICollectionInfo);
    procedure Clear;

  public
    constructor Create;
    destructor Destroy; override;
  end;

  TSystemData = class abstract(TInterfacedObject, ISystemData)
  protected
    FActiveCollectionInfo: ICollectionInfo;

  public
    constructor Create;
    destructor Destroy; override;

  public // virtual
    function GetCollectionInfo(const CollectionID: Integer): ICollectionInfo; virtual; abstract;
    procedure UpdateCollectionInfo(const CollectionInfo: ICollectionInfo); virtual; abstract;

    procedure ActivateCollection(CollectionID: Integer); virtual; abstract;
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
    ); virtual; abstract;
    function FindCollectionWithProp(
      PropID: TCollectionProp;
      const Value: string;
      IgnoreID: Integer = INVALID_COLLECTION_ID
    ): Boolean; virtual; abstract;
    procedure DeleteCollection(CollectionID: Integer); virtual; abstract;

    procedure CreateBookCollectionDatabase(const DBCollectionFile: string; const GenresFileName: string); virtual; abstract;
    procedure DropBookCollectionDatabase(const DBCollectionFile: string); virtual; abstract;

    function CreateBookCollection(const DBCollectionFile: string; ADefaultSession: Boolean = True): IBookCollection; virtual; abstract;

    function ActivateGroup(const ID: Integer): Boolean; virtual; abstract;

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
    function RenameGroup(GroupID: Integer; const NewName: string): Boolean; virtual; abstract;
    procedure DeleteGroup(GroupID: Integer); virtual; abstract;
    procedure ClearGroup(GroupID: Integer); virtual; abstract;
    function GetGroup(const GroupID: Integer): TGroupData; virtual; abstract;

    procedure AddBookToGroup(const BookKey: TBookKey; GroupID: Integer; const BookRecord: TBookRecord); virtual; abstract;
    procedure DeleteFromGroup(const BookKey: TBookKey; GroupID: Integer); virtual; abstract;
    procedure RemoveUnusedBooks; virtual; abstract;
    procedure CopyBookToGroup(
      const BookKey: TBookKey;
      SourceGroupID: Integer;
      TargetGroupID: Integer;
      MoveBook: Boolean
    ); virtual; abstract;

    //
    // Пользовательские данные
    //
    procedure ImportUserData(data: TUserData); virtual; abstract;

    // Batch update methods:
    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer); virtual; abstract;

    //Iterators:
    function GetBookIterator(const GroupID: Integer; const DatabaseID: Integer = INVALID_COLLECTION_ID): IBookIterator; virtual; abstract;
    function GetGroupIterator: IGroupIterator; virtual; abstract;
    function GetCollectionInfoIterator: ICollectionInfoIterator; virtual; abstract;

  public
    function HasCollections: Boolean;
    function FindFirstExistingCollectionID(const PreferredID: Integer): Integer;
    procedure ExportUserData(data: TUserData);
    function GetActiveCollectionInfo: ICollectionInfo;
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

constructor TCollectionInfo.Create;
begin
  inherited Create;
  FSettings := TStringList.Create;

  Clear;
end;

procedure TCollectionInfo.Assign(Source: ICollectionInfo);
begin
  FID := Source.ID;
  FName := Source.Name;
  FRootFolder := Source.RootFolder;
  FDBFileName := Source.DBFileName;
  FNotes := Source.Notes;
  FUser := Source.User;
  FPassword := Source.Password;
  FCreationDate := Source.CreationDate;
  FVersion := Source.Version;
  FCollectionType := Source.CollectionType;
  FAllowDelete := Source.AllowDelete;
  FURL := Source.URL;
  FScript := Source.Script;

  Assert(Assigned(Source.Settings));
  FSettings.Assign(Source.Settings);
end;

destructor TCollectionInfo.Destroy;
begin
  FreeAndNil(FSettings);
  inherited Destroy;
end;

procedure TCollectionInfo.Clear;
begin
  FID := INVALID_COLLECTION_ID;
  FName := '';
  FRootFolder := '';
  FDBFileName := '';
  FNotes := '';
  FCreationDate := 0;
  FVersion := UNVERSIONED_COLLECTION;
  FCollectionType := CT_PRIVATE_FB;
  FAllowDelete := False;
  FUser := '';
  FPassword := '';
  FURL := '';
  FScript := '';
  FSettings.Clear;
end;

function TCollectionInfo.GetRootPath: string;
begin
  Result := IncludeTrailingPathDelimiter(FRootFolder);
end;

function TCollectionInfo.GetSettings: TStrings;
begin
  Result := FSettings;
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

function TCollectionInfo.GetVersion: Integer;
begin
  Result := FVersion;
end;

procedure TCollectionInfo.SetVersion(const NewVersion: Integer);
begin
  FVersion := NewVersion;
end;

function TCollectionInfo.GetCollectionType: COLLECTION_TYPE;
begin
  Result := FCollectionType;
end;

procedure TCollectionInfo.SetCollectionType(const NewCollectionType: COLLECTION_TYPE);
begin
  FCollectionType := NewCollectionType;
end;

function TCollectionInfo.GetAllowDelete: Boolean;
begin
  Result := FAllowDelete;
end;

procedure TCollectionInfo.SetAllowDelete(const NewAllowDelete: Boolean);
begin
  FAllowDelete := NewAllowDelete;
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
  FActiveCollectionInfo := TCollectionInfo.Create;
end;

destructor TSystemData.Destroy;
begin
  inherited Destroy;
end;

function TSystemData.HasCollections: Boolean;
begin
  Result := (GetCollectionInfoIterator.RecordCount > 0);
end;

function TSystemData.FindFirstExistingCollectionID(const PreferredID: Integer): Integer;
var
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: ICollectionInfo;
begin
  Result := INVALID_COLLECTION_ID;

  CollectionInfo := TCollectionInfo.Create;
  CollectionInfoIterator := GetCollectionInfoIterator;
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
  Result := FActiveCollectionInfo;
end;

end.
