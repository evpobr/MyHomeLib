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
  unit_Globals,
  unit_Consts,
  unit_Interfaces,
  UserData;

type
  TSystemData = class abstract(TInterfacedObject, ISystemData)
  protected
    FActiveCollectionInfo: TCollectionInfo;

  public
    constructor Create; virtual;
    destructor Destroy; override;

  public // virtual
    procedure GetCollectionInfo(const CollectionID: Integer; CollectionInfo: TCollectionInfo); virtual; abstract;
    procedure UpdateCollectionInfo(const CollectionInfo: TCollectionInfo); virtual; abstract;

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

    procedure GetBookLibID(const BookKey: TBookKey; out ARes: string); virtual; abstract; // deprecated;

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
    function GetActiveCollectionInfo: TCollectionInfo;
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

{ TSystemData }

constructor TSystemData.Create;
begin
  FActiveCollectionInfo := TCollectionInfo.Create;
end;

destructor TSystemData.Destroy;
begin
  FreeAndNil(FActiveCollectionInfo);

  inherited Destroy;
end;

function TSystemData.HasCollections: Boolean;
begin
  Result := (GetCollectionInfoIterator.RecordCount > 0);
end;

function TSystemData.FindFirstExistingCollectionID(const PreferredID: Integer): Integer;
var
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: TCollectionInfo;
begin
  Result := INVALID_COLLECTION_ID;

  CollectionInfo := TCollectionInfo.Create;
  try
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
  finally
    FreeAndNil(CollectionInfo);
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

function TSystemData.GetActiveCollectionInfo: TCollectionInfo;
begin
  Result := FActiveCollectionInfo;
end;

end.
