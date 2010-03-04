(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             12.02.2010
  * Description
  * Author(s)           Aleksey Penkov  alex.penkov@gmail.com
  *                     Nick Rymanov (nrymanov@gmail.com)
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_Database;

interface

uses
  DB,
  Classes,
  Variants,
  ABSMain,
  unit_Globals;

type
  TABSTableHelper = class helper for TABSTable
    constructor Create(AOwner: TComponent);
  end;

  TMHLLibrary = class(TComponent)
  private
    procedure CheckActive;
    procedure CheckInactive;

    function GetDatabaseFileName: string;
    procedure SetDatabaseFileName(const Value: string);

    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);

    procedure LoadGenres(const GenresFileName: string);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    //
    // Database creation & management
    //
    class procedure CreateSystemTables(const DBFile: string);
    procedure CreateCollectionTables(const DBFile: string; const GenresFileName: string);
    procedure ReloadDefaultGenres(const FileName: string);

    //
    // Content management
    //
    function CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean;

    function InsertBook(BookRecord: TBookRecord; CheckFileName, FullCheck: Boolean): Integer;
    procedure DeleteBook(BookID: Integer; ClearExtra: Boolean = True);
    procedure CorrectExtra(OldID, NewID: Integer);

    procedure AddBookGenre(BookID: Integer; const GenreCode: string);
    procedure CleanBookGenres(BookID: Integer);

    procedure GetSeries(SeriesList: TStrings);

    //
    // Bulk operation
    //
    procedure BeginBulkOperation;
    procedure EndBulkOperation(Commit: Boolean = True);

  public
    property DatabaseFileName: string read GetDatabaseFileName write SetDatabaseFileName;
    property Active: Boolean read GetActive write SetActive;
    function GetGenreAlias(FB2Code: string): string;
    function GetTopGenreAlias(FB2Code: string): string;

  private
    FDatabase: TABSDatabase;
    FAuthors: TABSTable;
    FAuthorList: TABSTable;
    FBooks: TABSTable;
    FSeriesList: TABSTable;
    FSeries: TABSTable;
    FGenres: TABSTable;
    FGenreList: TABSTable;
    FExtra: TABSTable;
  end;

implementation

uses
  SysUtils,
  bdeconst,
  unit_Consts;

const
  TEMP_DATABASE = 'TempDB';
  USER_DATABASE = 'UserDB';

type
  TFieldDesc = record
    Name: string;
    DataType: TFieldType;
    Size: Integer;
    Required: Boolean;
  end;

  TIndexDesc = record
    Name: string;
    Fields: string;
    Options: TIndexOptions;
  end;

  TTableFields = array of TFieldDesc;
  TTableIndexes = array of TIndexDesc;

const

//-----------------------------------------------------------------------------
//                                 Коллекция
//-----------------------------------------------------------------------------
//
// Author List
//
AuthorListTableFields: array [1 .. 5] of TFieldDesc = (
  (Name: 'AL_ID';     DataType: ftAutoInc;    Size: 0;         Required: True),
  (Name: 'AL_AuthID'; DataType: ftInteger;    Size: 0;         Required: False),
  (Name: 'AL_BookID'; DataType: ftInteger;    Size: 0;         Required: False),
  (Name: 'AL_Series'; DataType: ftWideString; Size: INDEXSIZE; Required: False),
  (Name: 'AL_Title';  DataType: ftWideString; Size: INDEXSIZE; Required: False)
);

AuthorListTableIndexes: array [1..3] of TIndexDesc = (
  (Name: 'ID_Index';  Fields: 'AL_ID';                        Options: [ixPrimary, ixUnique]),
  (Name: 'BookIndex'; Fields: 'AL_BookID';                    Options: []),
  (Name: 'AuthIndex'; Fields: 'AL_AuthID;AL_Series;AL_Title'; Options: [ixCaseInsensitive])
);

//
//  Authors
//
AuthorsTableFields: array [1 .. 4] of TFieldDesc = (
  (Name: 'A_ID';       DataType: ftAutoInc;    Size: 0;   Required: True),
  (Name: 'A_Family';   DataType: ftWideString; Size: 128; Required: True),
  (Name: 'A_Name';     DataType: ftWideString; Size: 128; Required: False),
  (Name: 'A_Middle';   DataType: ftWideString; Size: 128; Required: False)
);

AuthorsTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';      Fields: 'A_ID';                     Options: [ixPrimary, ixUnique]),
  (Name: 'AlphabetIndex'; Fields: 'A_Family;A_Name;A_Middle'; Options: [ixCaseInsensitive])
);

//
//  NickNames
//
//NickNamesTableFields: array [1 .. 2] of TFieldDesc = (
//  (Name: 'BadID';       DataType: ftInteger;     Size: 0;   Required: true),
//  (Name: 'GoodID';       DataType: ftInteger;    Size: 0;   Required: true)
//);

//NickNamesTableIndexes: array [1..1] of TIndexDesc = (
//  (Name: 'ID_Index';      Fields: 'BadID';          Options: [ixPrimary, ixUnique])
//);

  //
  // NickNames
  //
  // NickNamesTableFields: array [1 .. 2] of TFieldDesc = (
  // (Name: 'BadID';       DataType: ftInteger;     Size: 0;   Required: true),
  // (Name: 'GoodID';       DataType: ftInteger;    Size: 0;   Required: true)
  // );

  // NickNamesTableIndexes: array [1..1] of TIndexDesc = (
  // (Name: 'ID_Index';      Fields: 'BadID';          Options: [ixPrimary, ixUnique])
  // );

//
// Books table
//
BooksTableFields: array [1 .. 21] of TFieldDesc = (
  (Name: 'ID';         DataType: ftAutoInc;     Size: 0;   Required: True),
  (Name: 'DatabaseID'; DataType: ftInteger;     Size: 0;   Required: False),
  (Name: 'LibID';      DataType: ftInteger;     Size: 0;   Required: False),
  (Name: 'Title';      DataType: ftWideString;  Size: 150; Required: False),
  (Name: 'FullName';   DataType: ftWideString;  Size: 120; Required: True),
  (Name: 'SerID';      DataType: ftInteger;     Size: 0;   Required: False),
  (Name: 'SeqNumber';  DataType: ftSmallInt;    Size: 0;   Required: False),
  (Name: 'Date';       DataType: ftDate;        Size: 0;   Required: False),
  (Name: 'LibRate';    DataType: ftInteger;     Size: 0;   Required: False),
  (Name: 'Lang';       DataType: ftWideString;  Size: 2;   Required: False),
  //
  (Name: 'DiscID';     DataType: ftInteger;     Size: 0;   Required: False),
  (Name: 'Folder';     DataType: ftWideString;  Size: MAXFOLDERLENGTH; Required: False),
  (Name: 'FileName';   DataType: ftWideString;  Size: 170; Required: True),
  (Name: 'InsideNo';   DataType: ftInteger;     Size: 0;   Required: True),
  (Name: 'Ext';        DataType: ftWideString;  Size: 10;  Required: False),
  (Name: 'Size';       DataType: ftInteger;     Size: 0;   Required: False),
  //
  (Name: 'URI';        DataType: ftWideString;  Size: 60;  Required: False),
  //
  (Name: 'Code';       DataType: ftSmallInt;    Size: 0;   Required: False),
  (Name: 'Local';      DataType: ftBoolean;     Size: 0;   Required: False),
  (Name: 'Deleted';    DataType: ftBoolean;     Size: 0;   Required: False),
  (Name: 'KeyWords';   DataType: ftWideString;  Size: 255; Required: False)
);

BooksTableIndexes: array [1..10] of TIndexDesc = (
  (Name: 'ID_Index';       Fields: 'ID';                    Options: [ixPrimary, ixUnique]),
  (Name: 'Series_Index';   Fields: 'SerID;SeqNumber';       Options: []),
  (Name: 'Title_Index';    Fields: 'FullName;Title,Deleted,Lang,Date,Local,KeyWords'; Options: [ixCaseInsensitive]),
  (Name: 'File_Index';     Fields: 'FileName';              Options: [ixCaseInsensitive]),
  (Name: 'Folder_Index';   Fields: 'Folder';                Options: [ixCaseInsensitive]),
  (Name: 'Deleted_Index';  Fields: 'Deleted';               Options: []),
  (Name: 'Date_Index';     Fields: 'Date';                  Options: []),
  (Name: 'Local_Index';    Fields: 'Local';                 Options: []),
  (Name: 'LibID_Index';    Fields: 'LibID';                 Options: []),
  (Name: 'KeyWords_Index'; Fields: 'KeyWords';              Options: [ixCaseInsensitive])
);

//
// Series
//
SeriesTableFields: array [1 .. 4] of TFieldDesc = (
  (Name: 'S_ID';        DataType: ftAutoInc;    Size: 0;  Required: True),
  (Name: 'S_AuthID';    DataType: ftInteger;    Size: 0;  Required: True),
  (Name: 'S_GenreCode'; DataType: ftWideString; Size: 20; Required: True),
  (Name: 'S_Title';     DataType: ftWideString; Size: 80; Required: True)
);

SeriesTableIndexes: array [1..4] of TIndexDesc = (
  (Name: 'ID_Index';    Fields: 'S_ID';             Options: [ixPrimary, ixUnique]),
  (Name: 'TiteIndex';   Fields: 'S_Title;S_AuthID'; Options: [ixCaseInsensitive]),
  (Name: 'AuthorIndex'; Fields: 'S_AuthID;S_Title'; Options: [ixCaseInsensitive]),
  (Name: 'SeqTitle';    Fields: 'S_Title';          Options: [ixCaseInsensitive])
);

//
// Genres
//
GenresTableFields: array [1 .. 5] of TFieldDesc = (
  (Name: 'G_ID';         DataType: ftAutoInc;    Size: 0;  Required: True),
  (Name: 'G_Code';       DataType: ftWideString; Size: 20; Required: False),
  (Name: 'G_ParentCode'; DataType: ftWideString; Size: 20; Required: False),
  (Name: 'G_FB2Code';    DataType: ftWideString; Size: 20; Required: False),
  (Name: 'G_Alias';      DataType: ftWideString; Size: 50; Required: False)
);

GenresTableIndexes: array [1..4] of TIndexDesc = (
  (Name: 'ID_Index';     Fields: 'G_Code';              Options: [ixPrimary, ixUnique]),
  (Name: 'CodeIndex';    Fields: 'G_ParentCode;G_Code'; Options: [ixCaseInsensitive]),
  (Name: 'FB2CodeIndex'; Fields: 'G_FB2Code';           Options: [ixCaseInsensitive]),
  (Name: 'AliasIndex';   Fields: 'G_Alias';             Options: [])
);

//
// Genre List
//
GenreListTableFields: array [1 .. 6] of TFieldDesc = (
  (Name: 'GL_ID';     DataType: ftAutoInc;    Size: 0;         Required: True),
  (Name: 'GL_Code';   DataType: ftWideString; Size: 30;        Required: False),
  (Name: 'GL_BookID'; DataType: ftInteger;    Size: 0;         Required: False),
  (Name: 'GL_Family'; DataType: ftWideString; Size: INDEXSIZE; Required: False),
  (Name: 'GL_Series'; DataType: ftWideString; Size: INDEXSIZE; Required: False),
  (Name: 'GL_Title';  DataType: ftWideString; Size: INDEXSIZE; Required: False)
);

GenreListTableIndexes: array [1..3] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: 'GL_ID';                                 Options: [ixPrimary, ixUnique]),
  (Name: 'BookIndex';  Fields: 'GL_BookID';                             Options: []),
  (Name: 'GenreIndex'; Fields: 'GL_Code;GL_Family;GL_Series;GL_Title';  Options: [ixCaseInsensitive])
);

//
// Extra
//
ExtraTableFields: array [1 .. 6] of TFieldDesc = (
  (Name: 'E_ID';        DataType: ftAutoInc;    Size: 0;   Required: True),
  (Name: 'E_BookID';    DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'E_Annotation';DataType: ftWideMemo;   Size: 0;   Required: False),
  (Name: 'E_Review';    DataType: ftWideMemo;   Size: 0;   Required: False),
  (Name: 'E_Cover';     DataType: ftBlob;       Size: 0;   Required: False),
  (Name: 'E_Data';      DataType: ftWideMemo;   Size: 0;   Required: False)
);

ExtraTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';         Fields: 'E_ID';                   Options: [ixPrimary, ixUnique]),
  (Name: 'BookIndex';        Fields: 'E_BookID';               Options: [])
);

// -----------------------------------------------------------------------------
// User.dbsx
// -----------------------------------------------------------------------------
//
// Bases table
//
BasesTableFields: array [1 .. 15] of TFieldDesc = (
  (Name: 'ID';           DataType: ftAutoInc;    Size: 0;   Required: True),
  (Name: 'Name';         DataType: ftWideString; Size: 64;  Required: True),
  (Name: 'RootFolder';   DataType: ftWideString; Size: 128; Required: True),
  (Name: 'DBFileName';   DataType: ftWideString; Size: 128; Required: True),
  (Name: 'Notes';        DataType: ftWideString; Size: 255; Required: False),
  (Name: 'Date';         DataType: ftDate;       Size: 0;   Required: False),
  (Name: 'Version';      DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Code';         DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'AllowDelete';  DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: 'Settings';     DataType: ftWideMemo;   Size: 0;   Required: False),
  (Name: 'Icon';         DataType: ftBlob;       Size: 0;   Required: False),
  (Name: 'URL';          DataType: ftWideString; Size: 255; Required: False),
  (Name: 'User';         DataType: ftWideString; Size: 50;  Required: False),
  (Name: 'Pass';         DataType: ftWideString; Size: 50;  Required: False),
  (Name: 'Connection';   DataType: ftWideMemo;   Size: 0;   Required: False)
);

BasesTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: 'ID';   Options: [ixPrimary]),
  (Name: 'Name_Index'; Fields: 'Name'; Options: [])
);

//
// Groups List (группы: избранное, прочитанное, к прочтению и т.п.)
//
GroupsListTableFields: array [1..5] of TFieldDesc = (
  (Name: 'ID';          DataType: ftAutoInc;    Size: 0;   Required: True),
  (Name: 'Name';        DataType: ftWideString; Size: 255; Required: False),
  (Name: 'AllowDelete'; DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: 'Notes';       DataType: ftMemo;       Size: 0;   Required: False),
  (Name: 'Icon';        DataType: ftBlob;       Size: 0;   Required: False)
);

GroupsListTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: 'ID';   Options: [ixPrimary, ixUnique]),
  (Name: 'NameIndex';  Fields: 'Name'; Options: [])
);

//
// Groups table
//
GroupsTableFields: array [1 .. 25] of TFieldDesc = (
  (Name: 'ID';         DataType: ftAutoInc;    Size: 0;   Required: True),  // локальный уникальный ID в этой таблице
  (Name: 'GroupID';    DataType: ftInteger;    Size: 0;   Required: True),  // id родительской группы
  (Name: 'OuterID';    DataType: ftInteger;    Size: 0;   Required: False), // внешний ID книги в коллекции
  (Name: 'SerID';      DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'SeqNumber';  DataType: ftSmallInt;   Size: 0;   Required: False),
  (Name: 'DatabaseID'; DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'LibID';      DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Date';       DataType: ftDate;       Size: 0;   Required: False),
  (Name: 'Title';      DataType: ftWideString; Size: 150; Required: False),
  (Name: 'FullName';   DataType: ftWideString; Size: 255; Required: False),
  (Name: 'InsideNo';   DataType: ftInteger;    Size: 0;   Required: True),
  (Name: 'FileName';   DataType: ftWideString; Size: 255; Required: True),
  (Name: 'Ext';        DataType: ftWideString; Size: 10;  Required: False),
  (Name: 'Size';       DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Code';       DataType: ftSmallInt;   Size: 0;   Required: False),
  (Name: 'Folder';     DataType: ftWideString; Size: 255; Required: False),
  (Name: 'DiscID';     DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Local';      DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: 'Deleted';    DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: 'Genres';     DataType: ftWideString; Size: 128; Required: False),
  (Name: 'Series';     DataType: ftWideString; Size: 128; Required: False),
  (Name: 'Rate';       DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Progress';   DataType: ftSmallInt;   Size: 0;   Required: False),
  (Name: 'LibRate';    DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Lang';       DataType: ftWideString; Size: 2;   Required: False)
  // (Name: 'KeyWords';   DataType: ftWideString; Size: 255; Required: False)
);

GroupsTableIndexes: array [1..4] of TIndexDesc = (
  (Name: 'ID_Index';       Fields: 'ID';                            Options: [ixPrimary]),
  (Name: 'OuterID_Index';  Fields: 'GroupID;OuterID';               Options: []),
  (Name: 'FullName_Index'; Fields: 'GroupID;FullName;Series;Title'; Options: []),
  (Name: 'File_Index';     Fields: 'FileName';                      Options: [])
);

//
// Rates table
//
RatesTableFields: array [1 .. 5] of TFieldDesc = (
  (Name: 'ID';         DataType: ftAutoInc; Size: 0; Required: True),
  (Name: 'BookID';     DataType: ftInteger; Size: 0; Required: True),
  (Name: 'DataBaseID'; DataType: ftInteger; Size: 0; Required: True),
  (Name: 'Rate';       DataType: ftInteger; Size: 0; Required: True),
  (Name: 'Date';       DataType: ftDate;    Size: 0; Required: False)
);

RatesTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: 'ID';                Options: [ixPrimary]),
  (Name: 'Book_Index'; Fields: 'DatabaseID,BookID'; Options: [])
);

//
// finished books table
//
FinishedTableFields: array [1 .. 5] of TFieldDesc = (
  (Name: 'ID';         DataType: ftAutoInc;  Size: 0; Required: True),
  (Name: 'BookID';     DataType: ftInteger;  Size: 0; Required: True),
  (Name: 'DataBaseID'; DataType: ftInteger;  Size: 0; Required: True),
  (Name: 'Progress';   DataType: ftSmallInt; Size: 0; Required: False),
  (Name: 'Date';       DataType: ftDate;     Size: 0; Required: False)
);

FinishedTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: 'ID';                         Options: [ixPrimary]),
  (Name: 'Book_Index'; Fields: 'DatabaseID,BookID,Progress'; Options: [])
);

// ------------------------------------------------------------------------------

procedure CreateTable(ADatabase: TABSDatabase; const TableName: string; FieldDesc: array of TFieldDesc; IndexDesc: array of TIndexDesc);
var
  TempTable: TABSTable;
  i: Integer;
begin
  TempTable := TABSTable.Create(ADatabase);
  try
    TempTable.TableName := TableName;

    for i := 0 to High(FieldDesc) do
      TempTable.FieldDefs.Add(FieldDesc[i].Name, FieldDesc[i].DataType, FieldDesc[i].Size, FieldDesc[i].Required);

    for i := 0 to High(IndexDesc) do
      TempTable.IndexDefs.Add(IndexDesc[i].Name, IndexDesc[i].Fields, IndexDesc[i].Options);

    TempTable.CreateTable;
  finally
    TempTable.Free;
  end;
end;

{ TMHLLibrary }

procedure TMHLLibrary.CheckActive;
begin
  if not Active then
    DatabaseError(SDatabaseClosed, Self);
end;

procedure TMHLLibrary.CheckInactive;
begin
  if Active then
    DatabaseError(SDatabaseOpen, Self);
end;

constructor TMHLLibrary.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDatabase := TABSDatabase.Create(Self);
  FDatabase.DatabaseName := TEMP_DATABASE;
  FDatabase.MaxConnections := 5;
  FDatabase.PageSize := 65535;
  FDatabase.PageCountInExtent := 16;

  FAuthors := TABSTable.Create(FDatabase);
  FAuthors.TableName := 'Authors';

  FAuthorList := TABSTable.Create(FDatabase);
  FAuthorList.TableName := 'Author_list';

  FBooks := TABSTable.Create(FDatabase);
  FBooks.TableName := 'Books';

  FSeriesList := TABSTable.Create(FDatabase);
  FSeriesList.TableName := 'SeriesList';

  FSeries := TABSTable.Create(FDatabase);
  FSeries.TableName := 'Series';

  FGenres := TABSTable.Create(FDatabase);
  FGenres.TableName := 'Genres';

  FGenreList := TABSTable.Create(FDatabase);
  FGenreList.TableName := 'Genre_list';

  FExtra := TABSTable.Create(FDatabase);
  FExtra.TableName := 'Extra';
end;

destructor TMHLLibrary.Destroy;
begin
  Active := False;
  inherited Destroy;
end;

function TMHLLibrary.GetActive: Boolean;
begin
  Result := FDatabase.Connected;
end;

procedure TMHLLibrary.SetActive(const Value: Boolean);
begin
  FDatabase.Connected := Value;

  FAuthors.Active := Value;
  FAuthorList.Active := Value;
  FBooks.Active := Value;
  FSeries.Active := Value;
  FGenres.Active := Value;
  FGenreList.Active := Value;
  FExtra.Active := Value;
end;

function TMHLLibrary.GetDatabaseFileName: string;
begin
  Result := FDatabase.DatabaseFileName;
end;

procedure TMHLLibrary.SetDatabaseFileName(const Value: string);
begin
  CheckInactive;
  FDatabase.DatabaseFileName := Value;
end;

class procedure TMHLLibrary.CreateSystemTables(const DBFile: string);
var
  ADatabase: TABSDatabase;
  Groups: TABSTable;
begin
  ADatabase := TABSDatabase.Create(nil);
  try
    ADatabase.DatabaseFileName := DBFile;
    ADatabase.DatabaseName := USER_DATABASE;
    ADatabase.MaxConnections := 5;
    ADatabase.CreateDatabase;

    CreateTable(ADatabase, 'Bases',        BasesTableFields,      BasesTableIndexes);
    CreateTable(ADatabase, 'GroupsList',   GroupsListTableFields, GroupsListTableIndexes);
    CreateTable(ADatabase, 'GroupedBooks', GroupsTableFields,     GroupsTableIndexes);
    CreateTable(ADatabase, 'Rates',        RatesTableFields,      RatesTableIndexes);
    CreateTable(ADatabase, 'Finished',     FinishedTableFields,   FinishedTableIndexes);
    CreateTable(ADatabase, 'Extra',        ExtraTableFields,      ExtraTableIndexes);
    ADatabase.Connected := False;

    //
    // Зададим дефлотные группы
    //

    Groups := TABSTable.Create(ADatabase);
    Groups.TableName := 'GroupsList';
    Groups.Active := True;

    Groups.Insert;
    Groups['Name'] := 'Избранное';
    Groups['AllowDelete'] := False;
    Groups.Post;

    Groups.Insert;
    Groups['Name'] := 'К прочтению';
    Groups['AllowDelete'] := False;
    Groups.Post;
  finally
    ADatabase.Free;
  end;
end;

procedure TMHLLibrary.CreateCollectionTables(const DBFile: string; const GenresFileName: string);
begin
  CheckInactive;

  DatabaseFileName := DBFile;
  FDatabase.CreateDatabase;

  //
  // Создадим таблицы
  //
  CreateTable(FDatabase, 'Books',       BooksTableFields,      BooksTableIndexes);
  CreateTable(FDatabase, 'Authors',     AuthorsTableFields,    AuthorsTableIndexes);
  // CreateTable(FDatabase, 'SeriesList',  SeriesListTableFields, SeriesListTableIndexes);
  CreateTable(FDatabase, 'Series',      SeriesTableFields,     SeriesTableIndexes);
  CreateTable(FDatabase, 'Genres',      GenresTableFields,     GenresTableIndexes);
  CreateTable(FDatabase, 'Genre_List',  GenreListTableFields,  GenreListTableIndexes);
  CreateTable(FDatabase, 'Author_List', AuthorListTableFields, AuthorListTableIndexes);
  CreateTable(FDatabase, 'Extra',       ExtraTableFields,      ExtraTableIndexes);

  Active := True;

  //
  // Заполним таблицу жанров
  //
  LoadGenres(GenresFileName);

  //
  // Создадим фиктивную серию
  //
  FSeries.Insert;
  FSeries['S_Title'] := NO_SERIES_TITLE;
  FSeries['S_GenreCode'] := '0';
  FSeries['S_AuthID'] := 0;
  FSeries.Post;
end;

procedure TMHLLibrary.LoadGenres(const GenresFileName: string);
var
  FS: TStringList;
  i: Integer;
  p: Integer;
  S: string;
  ParentCode: String;
  Code: String;
  FB2Code: String;
begin
  CheckActive;

  FS := TStringList.Create;
  try
    FS.LoadFromFile(GenresFileName, TEncoding.UTF8);

    for i := 0 to FS.Count - 1 do
    begin
      S := FS[i];
      //
      // Пропустим пустые строки
      //
      if S = '' then
        Continue;

      //
      // ... и комментарии
      //
      if S[1] = '#' then
        Continue;

      //
      // Дальше идут строки в следующем формате
      // -------------------------------------
      // 0.1 Фантастика (Научная фантастика и Фэнтези)
      // 0.2 Детективы и Триллеры
      // ...
      // 0.1.0 sf;Научная Фантастика
      // 0.1.1 sf_history;Альтернативная история
      // ...
      // -------------------------------------

      //
      // Выделяем код (0.1)
      //
      p := AnsiPos(' ', S);
      if 0 = p then
        Continue;
      Code := Copy(S, 1, p - 1);
      Delete(S, 1, p);

      //
      // и код родительского элемента (0)
      //
      p := LastDelimiter('.', Code);
      if 0 = p then
        Continue;
      ParentCode := Copy(Code, 1, p - 1);

      //
      // fb2 код. Может отсутствовать! (sf)
      //
      FB2Code := '';
      p := AnsiPos(';', S);
      if 0 <> p then
      begin
        FB2Code := Copy(S, 1, p - 1);
        Delete(S, 1, p);
      end;

      //
      // Если такой жанр уже существует => пропустим его
      //
      { TODO -oNickR : может стоит проверить и остальные поля? }
      if FGenres.Locate('G_Code', Code, []) then
        Continue;

      //
      // все хорошо => добавляем в базу
      //
      FGenres.Insert;
      FGenres['G_Code'] := Code;
      FGenres['G_ParentCode'] := ParentCode;
      FGenres['G_FB2Code'] := FB2Code;
      FGenres['G_Alias'] := S;
      FGenres.Post;
    end;
  finally
    FS.Free;
  end;
end;

procedure TMHLLibrary.ReloadDefaultGenres(const FileName: string);
begin
  CheckActive;

  //
  // почистить таблицу Genres
  //
  FGenres.Active := False;
  FGenres.EmptyTable;
  FGenres.Active := True;

  LoadGenres(FileName);
end;

function TMHLLibrary.GetGenreAlias(FB2Code: string): string;
begin
  FGenres.Locate('G_FB2Code', FB2Code, []);
  Result := FGenres.FieldByName('G_Alias').AsWideString;
end;

function TMHLLibrary.GetTopGenreAlias(FB2Code: string): string;
var
  Code: string;
  p: Integer;
begin
  FGenres.Locate('G_FB2Code', FB2Code, []);
  Code := FGenres.FieldByName('G_Code').AsWideString;

  Delete(Code, 1, 2); // "0."
  p := Pos('.', Code);
  Code := '0.' + Copy(Code, 1, p - 1);

  FGenres.Locate('G_Code', Code, []);
  Result := FGenres.FieldByName('G_Alias').AsWideString;
end;

function TMHLLibrary.CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean;
var
  S: string;
begin
  CheckActive;

  if ZipFolder then
    Result := FBooks.Locate('Folder', FileName, [loCaseInsensitive])
  else
  begin
    if FullNameSearch then
      S := ExtractFileName(FileName)
    else
      S := ExtractShortFileName(ExtractFileName(FileName));
    Result := FBooks.Locate('FileName', S, [loCaseInsensitive]);
  end;
end;

function TMHLLibrary.InsertBook(BookRecord: TBookRecord; CheckFileName, FullCheck: Boolean): Integer;
var
  i: Integer;
  ASeqNumber: Integer;
  Genre: TGenreRecord;
  Author: TAuthorRecord;

  Res: Boolean;

begin
  Result := 0;
  CheckActive;

  if BookRecord.FileName = '' then
    Exit;

  BookRecord.Normalize;
  //
  // Создадим отсутствующих авторов
  //
  Assert(BookRecord.AuthorCount > 0);
  for i := 0 to BookRecord.AuthorCount - 1 do
  begin
    if not FAuthors.Locate('A_Family;A_Name;A_Middle', VarArrayOf([BookRecord.Authors[i].LastName, BookRecord.Authors[i].FirstName, BookRecord.Authors[i].MiddleName]), [loCaseInsensitive]) then
    begin
      FAuthors.Insert;
      FAuthors['A_Name'] := BookRecord.Authors[i].FirstName;
      FAuthors['A_Family'] := BookRecord.Authors[i].LastName;
      FAuthors['A_Middle'] := BookRecord.Authors[i].MiddleName;
      // FAuthors['FullName'] := BookRecord.Authors[i].GetFullName;
      FAuthors.Post;
    end;

    //
    // и запомним ID-ки
    //
    BookRecord.Authors[i].ID := FAuthors['A_ID'];
  end;

  //
  // Определяем код жанра
  //
  Assert(BookRecord.GenreCount > 0);
  for i := 0 to BookRecord.GenreCount - 1 do
  begin
    //
    // Если fb2 код указан, переводим его в универсальный код
    //
    if BookRecord.Genres[i].GenreFb2Code <> '' then
    begin
      //
      // Знаем fb2-код жанра => получаем внутренний код
      //
      if FGenres.Locate('G_FB2Code', BookRecord.Genres[i].GenreFb2Code, [loCaseInsensitive]) then
        BookRecord.Genres[i].GenreCode := FGenres['G_Code']
      else
        //
        // fb2-код неизвестный - так и запишем
        //
        BookRecord.Genres[i].GenreCode := UNKNOWN_GENRE_CODE;
    end
    else
    //
    // если не указан fb2-код, проверяем наличие внутреннего кода.
    // если внутренний код неизвестен или не указан => "так и запишем"
    //
    if
      (BookRecord.Genres[i].GenreCode = '') or                         // внутренний код не указан
      (not FGenres.Locate('G_Code', BookRecord.Genres[i].GenreCode, [loCaseInsensitive]))  // внутренний код неизвестен
    then
      BookRecord.Genres[i].GenreCode := UNKNOWN_GENRE_CODE;
  end;

  //
  // создадим отсутствующую серию
  // DONE -oNickR : может стоит проверять не только Title, но и AuthID?
  // т к в одной серии могут буть книги разных авторов, то _пока_ оставим как есть
  // возможно, во второй версии вернемся к этому вопросу.
  //
  // TODO -cRelease2.0 : Создавать отдельные серии для каждого автора, с возможностью их объединения
  //
  if (not FSeries.Locate('S_Title', BookRecord.Series, [loCaseInsensitive])) then
  begin
    FSeries.Insert;
    FSeries['S_Title'] := BookRecord.Series;
    FSeries['S_GenreCode'] := BookRecord.Genres[0].GenreCode;
    FSeries['S_AuthID'] := BookRecord.Authors[0].ID;
    FSeries.Post;
  end;

  //
  // Собственно сохраним информацию о книге
  //

  if CheckFileName then
    if FullCheck then
      Res := FBooks.Locate('Folder;FileName', VarArrayOf([BookRecord.Folder, BookRecord.FileName]), [loCaseInsensitive])
    else
      Res := FBooks.Locate('FileName', BookRecord.FileName, [loCaseInsensitive])
    else
      Res := False;

  if not Res then
  begin
    ASeqNumber := BookRecord.SeqNumber;
    if ASeqNumber > 5000 then
      ASeqNumber := 0;

    FBooks.Insert;
    FBooks['FullName'] := AnsiUpperCase(BookRecord.Authors[0].GetFullName); // поле только для поиска!
    FBooks['FileName'] := BookRecord.FileName;
    FBooks['ext'] := BookRecord.FileExt;
    FBooks['Code'] := BookRecord.Code;
    FBooks['InsideNo'] := BookRecord.InsideNo;
    FBooks['Size'] := BookRecord.Size;
    FBooks['Folder'] := BookRecord.Folder;
    FBooks['DiscID'] := 0;
    FBooks['Local'] := BookRecord.Local;
    FBooks['SerID'] := FSeries['S_ID'];
    FBooks['Title'] := BookRecord.Title;
    FBooks['Date'] := BookRecord.Date;
    FBooks['SeqNumber'] := ASeqNumber;
    FBooks['LibID'] := BookRecord.LibID;
    FBooks['Date'] := BookRecord.Date;
    FBooks['Deleted'] := BookRecord.Deleted;
    FBooks['Lang'] := BookRecord.Lang;
    FBooks['LibRate'] := BookRecord.LibRate;
    FBooks['KeyWords'] := BookRecord.KeyWords;
    FBooks['URI'] := BookRecord.URI;
    FBooks['Code'] := BookRecord.Code;
    FBooks.Post;

    for Genre in BookRecord.Genres do
    begin
      FGenreList.Insert;
      FGenreList['GL_BookID'] := FBooks['ID'];
      FGenreList['GL_Code'] := Genre.GenreCode;
      //
      // формирование индексных полей (индексирование по первым 10-ти символам)
      //
      FGenreList['GL_Family'] := Copy(BookRecord.Authors[0].GetFullName, 1, INDEXSIZE);
      FGenreList['GL_Title'] := Copy(BookRecord.Title, 1, INDEXSIZE);
      FGenreList['GL_Series'] := Copy(BookRecord.Series, 1, INDEXSIZE);
      FGenreList.Post;
    end;

    for Author in BookRecord.Authors do
    begin
      FAuthorList.Insert;
      FAuthorList['AL_BookID'] := FBooks['ID'];
      FAuthorList['AL_AuthID'] := Author.ID;
      //
      // формирование индексных полей (индексирование по первым 10-ти символам)
      //
      FAuthorList['AL_Title'] := Copy(BookRecord.Title, 1, INDEXSIZE);
      FAuthorList['AL_Series'] := Copy(BookRecord.Series, 1, INDEXSIZE);
      FAuthorList.Post;
    end;

    if BookRecord.Annotation <> '' then
    begin
      FExtra.Insert;
      FExtra['E_BookID'] := FBooks['ID'];
      FExtra['E_Annotation'] := BookRecord.Annotation;
      FExtra.Post;
    end;

    Result := FBooks['ID'];
  end;
end;

procedure TMHLLibrary.DeleteBook;
var
  SerID: Integer;
begin
  CheckActive;

  if FBooks.Locate('ID', BookID, []) then
  begin
    SerID := FBooks['SerID'];
    FBooks.Delete;

    { TODO -oNickR : Заменить эти вызовы на DELETE FROM query }

    while FGenreList.Locate('GL_BookID', BookID, []) do
      FGenreList.Delete;
    while FAuthorList.Locate('AL_BookID', BookID, []) do
      FAuthorList.Delete;

    //
    // Если книга входила в серию (SerID <> 1) проверим, не пора ли удалить серию.
    //
    if SerID <> 1 then
    begin
      if not FBooks.Locate('SerID', SerID, []) then
      begin
        //
        // Больше книг из этой серии нет => удалим серию
        //
        FSeries.Locate('S_ID', SerID, []);
        FSeries.Delete;
      end;
    end;

    // удаляем из Extra
    if ClearExtra and FExtra.Locate('E_BookID', BookID, []) then
      FExtra.Delete;

    //
    // У каждого автора должна быть хоть одна книга.
    // TODO -oNickR -cUsability : Возможно, стоит смягчить это требование и хранить описание авторов, книг которых нет в библиотеке
    //
    FAuthors.First;
    while not FAuthors.Eof do
    begin
      if FAuthorList.Locate('AL_AuthID', FAuthors['A_ID'], []) then
        FAuthors.Next
      else
        FAuthors.Delete;
    end;

    { TODO 5 -oNickR -cBug : Необходимо почистить таблицы Favorites и Rates }
  end;
end;

procedure TMHLLibrary.AddBookGenre(BookID: Integer; const GenreCode: string);
begin
  CheckActive;

  if FBooks.Locate('ID', BookID, []) then
  begin
    FGenreList.Insert;
    FGenreList['GL_BookID'] := BookID;
    FGenreList['GL_Code'] := GenreCode;
    FGenreList['GL_Family'] := Copy(FBooks['FullName'], 1, INDEXSIZE);
    FGenreList['GL_Title'] := Copy(FBooks['Title'], 1, INDEXSIZE);

    if FSeries.Locate('S_ID', FBooks['SerID'], []) then
      FGenreList['GL_Series'] := Copy(FSeries['S_Title'], 1, INDEXSIZE);
    FGenreList.Post;
  end;
end;

procedure TMHLLibrary.CleanBookGenres(BookID: Integer);
begin
  CheckActive;

  while FGenreList.Locate('GL_BookID', BookID, []) do
    FGenreList.Delete;
end;

procedure TMHLLibrary.CorrectExtra(OldID, NewID: Integer);
begin
  FExtra.MasterSource := nil;
  if FExtra.Locate('E_BookID', OldID, []) then
  begin
    FExtra.Edit;
    FExtra['E_BookID'] := NewID;
    FExtra.Post;
  end;
end;

procedure TMHLLibrary.GetSeries(SeriesList: TStrings);
begin
  FSeries.First;
  while not FSeries.Eof do
  begin
    if FSeries['S_ID'] <> 1 then
      SeriesList.Add(FSeries['S_Title']);
    FSeries.Next;
  end;
end;

procedure TMHLLibrary.BeginBulkOperation;
begin
  CheckActive;
  Assert(not FDatabase.InTransaction);

  FDatabase.StartTransaction;
end;

procedure TMHLLibrary.EndBulkOperation(Commit: Boolean = True);
begin
  CheckActive;
  Assert(FDatabase.InTransaction);

  if Commit then
    FDatabase.Commit(False)
  else
    FDatabase.Rollback;
end;

{ TAbsTableHelper }

constructor TABSTableHelper.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //
  // TABSDatabase не наследуется от TDatabase. Как результат, конструктор TDataset-а
  // (базового класса TAbsTable) не может установить свойство "DatabaseName".
  // Восстановим это поведение.
  //
  if AOwner is TABSDatabase then
    DatabaseName := TABSDatabase(AOwner).DatabaseName;
end;

end.
