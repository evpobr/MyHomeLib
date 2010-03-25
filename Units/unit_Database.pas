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
    function GetGenreAlias(const FB2Code: string): string;
    function GetTopGenreAlias(const FB2Code: string): string;

    property DatabaseFileName: string read GetDatabaseFileName write SetDatabaseFileName;
    property Active: Boolean read GetActive write SetActive;

  private
    FDatabase: TABSDatabase;
    FAuthors: TABSTable;
    FAuthorList: TABSTable;
    FBooks: TABSTable;
    FSeries: TABSTable;
    FGenres: TABSTable;
    FGenreList: TABSTable;
    FExtra: TABSTable;
  end;

implementation

uses
  SysUtils,
  IOUtils,
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

  TBLOBFieldDesc = record
    Name: string;
    BlobCompressionAlgorithm: TCompressionAlgorithm;
    BlobCompressionMode: Byte;
  end;

const

//-----------------------------------------------------------------------------
//                                 Коллекция
//-----------------------------------------------------------------------------
//
// Author List
//
AuthorListTableFields: array [1 .. 4] of TFieldDesc = (
  (Name: AUTHOR_ID_FIELD; DataType: ftInteger;    Size: 0;         Required: True),
  (Name: BOOK_ID_FIELD;   DataType: ftInteger;    Size: 0;         Required: True),
  (Name: 'AL_Series';     DataType: ftWideString; Size: INDEXSIZE; Required: False),
  (Name: 'AL_Title';      DataType: ftWideString; Size: INDEXSIZE; Required: False)
);

AuthorListTableIndexes: array [1..3] of TIndexDesc = (
  (Name: 'ID_Index';  Fields: AUTHOR_ID_FIELD + ';' + BOOK_ID_FIELD;   Options: [ixPrimary]),
  (Name: 'BookIndex'; Fields: BOOK_ID_FIELD;                           Options: []),
  (Name: 'AuthIndex'; Fields: AUTHOR_ID_FIELD + ';AL_Series;AL_Title'; Options: [ixCaseInsensitive])   // TODO -oNickR -cDB opt : remove
);

//
//  Authors
//
AuthorsTableFields: array [1 .. 4] of TFieldDesc = (
  (Name: AUTHOR_ID_FIELD; DataType: ftAutoInc;    Size: 0;   Required: True),
  (Name: 'A_Family';      DataType: ftWideString; Size: 128; Required: True),
  (Name: 'A_Name';        DataType: ftWideString; Size: 128; Required: False),
  (Name: 'A_Middle';      DataType: ftWideString; Size: 128; Required: False)
);

AuthorsTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';      Fields: AUTHOR_ID_FIELD;            Options: [ixPrimary]),
  (Name: 'AlphabetIndex'; Fields: 'A_Family;A_Name;A_Middle'; Options: [ixCaseInsensitive])
);

//
// Books table
//
BooksTableFields: array [1 .. 19] of TFieldDesc = (
  (Name: BOOK_ID_FIELD;  DataType: ftAutoInc;     Size: 0;   Required: True),
  (Name: LIB_ID_FIELD;   DataType: ftInteger;     Size: 0;   Required: False),
  (Name: 'Title';        DataType: ftWideString;  Size: 150; Required: False),
  (Name: 'FullName';     DataType: ftWideString;  Size: 120; Required: True),
  (Name: SERIE_ID_FIELD; DataType: ftInteger;     Size: 0;   Required: False),
  (Name: 'SeqNumber';    DataType: ftSmallInt;    Size: 0;   Required: False),
  (Name: 'Date';         DataType: ftDate;        Size: 0;   Required: False),
  (Name: 'LibRate';      DataType: ftInteger;     Size: 0;   Required: False),
  (Name: 'Lang';         DataType: ftWideString;  Size: 2;   Required: False),
  (Name: FOLDER_FIELD;   DataType: ftWideString;  Size: MAXFOLDERLENGTH; Required: False),
  (Name: FILENAME_FIELD; DataType: ftWideString;  Size: 170; Required: True),
  (Name: 'InsideNo';     DataType: ftInteger;     Size: 0;   Required: True),
  (Name: 'Ext';          DataType: ftWideString;  Size: 10;  Required: False),
  (Name: 'Size';         DataType: ftInteger;     Size: 0;   Required: False),
  //
  (Name: 'URI';          DataType: ftWideString;  Size: 60;  Required: False),         // TODO -oNickR -cDB opt : remove
  //
  (Name: 'Code';         DataType: ftSmallInt;    Size: 0;   Required: False),
  (Name: 'Local';        DataType: ftBoolean;     Size: 0;   Required: False),
  (Name: 'Deleted';      DataType: ftBoolean;     Size: 0;   Required: False),
  (Name: 'KeyWords';     DataType: ftWideString;  Size: 255; Required: False)
);

BooksTableIndexes: array [1..10] of TIndexDesc = (
  (Name: 'ID_Index';       Fields: BOOK_ID_FIELD;           Options: [ixPrimary]),
  (Name: 'Series_Index';   Fields: SERIE_ID_FIELD + ';SeqNumber';       Options: []),
  (Name: 'Title_Index';    Fields: 'FullName;Title;Deleted;Lang;Date;Local;KeyWords'; Options: [ixCaseInsensitive]),
  (Name: 'File_Index';     Fields: FILENAME_FIELD;          Options: [ixCaseInsensitive]),
  (Name: 'Folder_Index';   Fields: FOLDER_FIELD;            Options: [ixCaseInsensitive]),
  (Name: 'Deleted_Index';  Fields: 'Deleted';               Options: []),
  (Name: 'Date_Index';     Fields: 'Date';                  Options: []),
  (Name: 'Local_Index';    Fields: 'Local';                 Options: []),
  (Name: 'LibID_Index';    Fields: LIB_ID_FIELD;            Options: []),
  (Name: 'KeyWords_Index'; Fields: 'KeyWords';              Options: [ixCaseInsensitive])
);

//
// Series
//
SeriesTableFields: array [1 .. 4] of TFieldDesc = (
  (Name: SERIE_ID_FIELD;   DataType: ftAutoInc;    Size: 0;  Required: True),
  (Name: AUTHOR_ID_FIELD;  DataType: ftInteger;    Size: 0;  Required: True),
  (Name: GENRE_CODE_FIELD; DataType: ftWideString; Size: 20; Required: True),
  (Name: 'S_Title';        DataType: ftWideString; Size: 80; Required: True)
);

SeriesTableIndexes: array [1..4] of TIndexDesc = (
  (Name: 'ID_Index';    Fields: SERIE_ID_FIELD;               Options: [ixPrimary]),
  (Name: 'TiteIndex';   Fields: 'S_Title;' + AUTHOR_ID_FIELD; Options: [ixCaseInsensitive]),
  (Name: 'AuthorIndex'; Fields: AUTHOR_ID_FIELD + ';S_Title'; Options: [ixCaseInsensitive]),
  (Name: 'SeqTitle';    Fields: 'S_Title';                    Options: [ixCaseInsensitive])
);

//
// Genres
//
GenresTableFields: array [1 .. 5] of TFieldDesc = (
  (Name: 'G_ID';           DataType: ftAutoInc;    Size: 0;  Required: True),
  (Name: GENRE_CODE_FIELD; DataType: ftWideString; Size: 20; Required: True),
  (Name: 'G_ParentCode';   DataType: ftWideString; Size: 20; Required: False),
  (Name: 'G_FB2Code';      DataType: ftWideString; Size: 20; Required: False),
  (Name: 'G_Alias';        DataType: ftWideString; Size: 50; Required: True)
);

GenresTableIndexes: array [1..4] of TIndexDesc = (
  (Name: 'ID_Index';     Fields: GENRE_CODE_FIELD;                   Options: [ixPrimary]),
  (Name: 'CodeIndex';    Fields: 'G_ParentCode;' + GENRE_CODE_FIELD; Options: [ixCaseInsensitive]),
  (Name: 'FB2CodeIndex'; Fields: 'G_FB2Code';                        Options: [ixCaseInsensitive]),
  (Name: 'AliasIndex';   Fields: 'G_Alias';                          Options: [])
);

//
// Genre List
//
GenreListTableFields: array [1 .. 6] of TFieldDesc = (
  (Name: 'GL_ID';          DataType: ftAutoInc;    Size: 0;         Required: True),     // TODO -oNickR -cDB opt : remove. Не до конца ерен
  (Name: GENRE_CODE_FIELD; DataType: ftWideString; Size: 20;        Required: True),
  (Name: BOOK_ID_FIELD;    DataType: ftInteger;    Size: 0;         Required: True),
  (Name: 'GL_Family';      DataType: ftWideString; Size: INDEXSIZE; Required: False),
  (Name: 'GL_Series';      DataType: ftWideString; Size: INDEXSIZE; Required: False),
  (Name: 'GL_Title';       DataType: ftWideString; Size: INDEXSIZE; Required: False)
);

GenreListTableIndexes: array [1..3] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: 'GL_ID';                                  Options: [ixPrimary]),
  (Name: 'BookIndex';  Fields: BOOK_ID_FIELD;                            Options: []),
  (Name: 'GenreIndex'; Fields: 'GenreCode;GL_Family;GL_Series;GL_Title'; Options: [ixCaseInsensitive])
);

//
// Extra
//
ExtraTableFields: array [1 .. 5] of TFieldDesc = (
  (Name: BOOK_ID_FIELD;  DataType: ftInteger;    Size: 0;   Required: True),
  (Name: 'Annotation';   DataType: ftWideMemo;   Size: 0;   Required: False),
  (Name: 'Review';       DataType: ftWideMemo;   Size: 0;   Required: False),
  (Name: 'Rate';         DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Progress';     DataType: ftInteger;    Size: 0;   Required: False)
);

ExtraTableIndexes: array [1 .. 1] of TIndexDesc = (
  (Name: 'ID_Index';     Fields: BOOK_ID_FIELD;         Options: [ixPrimary])
);

ExtraTableBlobs: array [1 .. 2] of TBLOBFieldDesc = (
  (Name: 'Annotation';   BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5),
  (Name: 'Review';       BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5)
);

// -----------------------------------------------------------------------------
// User.dbsx
// -----------------------------------------------------------------------------
//
// Bases table
//
BasesTableFields: array [1 .. 15] of TFieldDesc = (
  (Name: ID_FIELD;       DataType: ftAutoInc;    Size: 0;   Required: True),
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
  (Name: 'ID_Index';   Fields: ID_FIELD; Options: [ixPrimary]),
  (Name: 'Name_Index'; Fields: 'Name';   Options: [])
);

BasesTableBlobs: array [1 .. 2] of TBLOBFieldDesc = (
  (Name: 'Settings';     BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5),
  (Name: 'Connection';   BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5)
);

//
// Groups List (группы: избранное, прочитанное, к прочтению и т.п.)
//
GroupsListTableFields: array [1..5] of TFieldDesc = (
  (Name: GROUP_ID_FIELD; DataType: ftAutoInc;    Size: 0;   Required: True),
  (Name: 'Name';         DataType: ftWideString; Size: 255; Required: False),
  (Name: 'AllowDelete';  DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: 'Notes';        DataType: ftMemo;       Size: 0;   Required: False),
  (Name: 'Icon';         DataType: ftBlob;       Size: 0;   Required: False)
);

GroupsListTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: GROUP_ID_FIELD;  Options: [ixPrimary]),
  (Name: 'NameIndex';  Fields: 'Name';    Options: [])
);

//
// Book Groups
//
BookGroupsTableFields: array [1 .. 3] of TFieldDesc = (
  (Name: BOOK_ID_FIELD;  DataType: ftInteger;    Size: 0; Required: True),
  (Name: DB_ID_FIELD;    DataType: ftInteger;    Size: 0; Required: True),
  (Name: GROUP_ID_FIELD; DataType: ftInteger;    Size: 0; Required: True)
);

BookGroupsTableIndexes: array [1 .. 2] of TIndexDesc = (
  (Name: 'ID_Index';    Fields: GROUP_ID_FIELD + ';' + BOOK_DB_FIELDS;   Options: [ixPrimary]),
  (Name: 'BookDBIndex'; Fields: BOOK_DB_FIELDS;                          Options: [])
);


//
// Groups table
//
// TODO -oNickR -cDB opt : инхронизировать с таблицей Books
GroupsTableFields: array [1 .. 25] of TFieldDesc = (
  (Name: BOOK_ID_FIELD;  DataType: ftInteger;    Size: 0;   Required: True),
  (Name: DB_ID_FIELD;    DataType: ftInteger;    Size: 0;   Required: True),
  (Name: LIB_ID_FIELD;   DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Title';        DataType: ftWideString; Size: 150; Required: False),
  (Name: 'FullName';     DataType: ftWideString; Size: 255; Required: False),
  (Name: SERIE_ID_FIELD; DataType: ftInteger;     Size: 0;   Required: False),
  (Name: 'SeqNumber';    DataType: ftSmallInt;   Size: 0;   Required: False),
  (Name: 'Date';         DataType: ftDate;       Size: 0;   Required: False),
  (Name: 'LibRate';      DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Lang';         DataType: ftWideString; Size: 2;   Required: False),
  (Name: FOLDER_FIELD;   DataType: ftWideString; Size: 255; Required: False),
  (Name: FILENAME_FIELD; DataType: ftWideString; Size: 255; Required: True),
  (Name: 'InsideNo';     DataType: ftInteger;    Size: 0;   Required: True),
  (Name: 'Ext';          DataType: ftWideString; Size: 10;  Required: False),
  (Name: 'Size';         DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'URI';          DataType: ftWideString; Size: 60;  Required: False),         // TODO -oNickR -cDB opt : remove
  (Name: 'Code';         DataType: ftSmallInt;   Size: 0;   Required: False),
  (Name: 'Local';        DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: 'Deleted';      DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: 'KeyWords';     DataType: ftWideString; Size: 255; Required: False),

  //
  // Данные из таблицы Extra
  //
  (Name: 'Review';       DataType: ftWideMemo;   Size: 0;   Required: False),
  (Name: 'Rate';         DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Progress';     DataType: ftSmallInt;   Size: 0;   Required: False),

  //
  // Данные из других таблиц
  //
  (Name: 'Genres';       DataType: ftWideString; Size: 128; Required: False),
  (Name: 'Series';       DataType: ftWideString; Size: 128; Required: False)
);

GroupsTableIndexes: array [1 .. 3] of TIndexDesc = (
  (Name: 'ID_Index';       Fields: BOOK_DB_FIELDS;          Options: [ixPrimary]),
  (Name: 'FullName_Index'; Fields: 'FullName;Series;Title'; Options: []),
  (Name: 'File_Index';     Fields: FILENAME_FIELD;          Options: [])
);

GroupBooksTableBlobs: array [1 .. 1] of TBLOBFieldDesc = (
  (Name: 'Review';     BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5)
);

// ------------------------------------------------------------------------------

procedure CreateTable(
  ADatabase: TABSDatabase;
  const TableName: string;
  const FieldDesc: array of TFieldDesc;
  const IndexDesc: array of TIndexDesc;
  const BLOBDesc: array of TBLOBFieldDesc
  );
var
  TempTable: TABSTable;
  i: Integer;
  f: TABSAdvFieldDef;
begin
  TempTable := TABSTable.Create(ADatabase);
  try
    TempTable.TableName := TableName;

    for i := 0 to High(FieldDesc) do
      TempTable.FieldDefs.Add(FieldDesc[i].Name, FieldDesc[i].DataType, FieldDesc[i].Size, FieldDesc[i].Required);

    for i := 0 to High(IndexDesc) do
      TempTable.IndexDefs.Add(IndexDesc[i].Name, IndexDesc[i].Fields, IndexDesc[i].Options);

    TempTable.CreateTable;

    if Length(BLOBDesc) > 0 then
    begin
      TempTable.Open;
      TempTable.Close;

      for i := 0 to High(BLOBDesc) do
      begin
        f := TempTable.RestructureFieldDefs.Find(BLOBDesc[i].Name);
        if Assigned(f) then
        begin
          f.BlobCompressionAlgorithm := BLOBDesc[i].BlobCompressionAlgorithm;
          f.BlobCompressionMode := BLOBDesc[i].BlobCompressionMode;
        end;
      end;

      TempTable.RestructureTable;
    end;
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

    CreateTable(ADatabase, 'Bases',      BasesTableFields,      BasesTableIndexes,      BasesTableBlobs);
    CreateTable(ADatabase, 'Groups',     GroupsListTableFields, GroupsListTableIndexes, []);
    CreateTable(ADatabase, 'BookGroups', BookGroupsTableFields, BookGroupsTableIndexes, GroupBooksTableBlobs);
    CreateTable(ADatabase, 'Books',      GroupsTableFields,     GroupsTableIndexes,     []);
    ADatabase.Connected := False;

    //
    // Зададим дефлотные группы
    //
    Groups := TABSTable.Create(ADatabase);
    Groups.TableName := 'Groups';
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
  CreateTable(FDatabase, 'Books',       BooksTableFields,      BooksTableIndexes,      []);
  CreateTable(FDatabase, 'Authors',     AuthorsTableFields,    AuthorsTableIndexes,    []);
  CreateTable(FDatabase, 'Series',      SeriesTableFields,     SeriesTableIndexes,     []);
  CreateTable(FDatabase, 'Genres',      GenresTableFields,     GenresTableIndexes,     []);
  CreateTable(FDatabase, 'Genre_List',  GenreListTableFields,  GenreListTableIndexes,  []);
  CreateTable(FDatabase, 'Author_List', AuthorListTableFields, AuthorListTableIndexes, []);
  CreateTable(FDatabase, 'Extra',       ExtraTableFields,      ExtraTableIndexes,      ExtraTableBlobs);

  Active := True;

  //
  // Заполним таблицу жанров
  //
  LoadGenres(GenresFileName);

  //
  // Создадим фиктивную серию
  //
  FSeries.Insert;
  FSeries.FieldByName('S_Title').AsString := NO_SERIES_TITLE;
  FSeries[GENRE_CODE_FIELD] := '0';
  FSeries[AUTHOR_ID_FIELD] := 0;
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
      if FGenres.Locate(GENRE_CODE_FIELD, Code, []) then
        Continue;

      //
      // все хорошо => добавляем в базу
      //
      FGenres.Insert;
      FGenres.FieldByName(GENRE_CODE_FIELD).AsString := Code;
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

function TMHLLibrary.GetGenreAlias(const FB2Code: string): string;
begin
  FGenres.Locate('G_FB2Code', FB2Code, []);
  Result := FGenres.FieldByName('G_Alias').AsWideString;
end;

function TMHLLibrary.GetTopGenreAlias(const FB2Code: string): string;
var
  Code: string;
  p: Integer;
begin
  FGenres.Locate('G_FB2Code', FB2Code, []);
  Code := FGenres.FieldByName(GENRE_CODE_FIELD).AsWideString;

  Delete(Code, 1, 2); // "0."
  p := Pos('.', Code);
  Code := '0.' + Copy(Code, 1, p - 1);

  FGenres.Locate(GENRE_CODE_FIELD, Code, []);
  Result := FGenres.FieldByName('G_Alias').AsWideString;
end;

function TMHLLibrary.CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean;
var
  S: string;
begin
  CheckActive;

  if ZipFolder then
    Result := FBooks.Locate(FOLDER_FIELD, FileName, [loCaseInsensitive])
  else
  begin
    if FullNameSearch then
      S := ExtractFileName(FileName)
    else
      S := TPath.GetFileNameWithoutExtension(FileName);
    Result := FBooks.Locate(FILENAME_FIELD, S, [loCaseInsensitive]);
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
      FAuthors.FieldByName('A_Name').AsString := BookRecord.Authors[i].FirstName;
      FAuthors.FieldByName('A_Family').AsString := BookRecord.Authors[i].LastName;
      FAuthors.FieldByName('A_Middle').AsString := BookRecord.Authors[i].MiddleName;
      FAuthors.Post;
    end;

    //
    // и запомним ID-ки
    //
    BookRecord.Authors[i].ID := FAuthors[AUTHOR_ID_FIELD];
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
        BookRecord.Genres[i].GenreCode := FGenres.FieldByName(GENRE_CODE_FIELD).AsString
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
      (not FGenres.Locate(GENRE_CODE_FIELD, BookRecord.Genres[i].GenreCode, [loCaseInsensitive]))  // внутренний код неизвестен
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
    FSeries.FieldByName('S_Title').AsString := BookRecord.Series;
    FSeries.FieldByName(GENRE_CODE_FIELD).AsString := BookRecord.Genres[0].GenreCode;
    FSeries.FieldByName(AUTHOR_ID_FIELD).AsInteger := BookRecord.Authors[0].ID;
    FSeries.Post;
  end;

  //
  // Собственно сохраним информацию о книге
  //

  if CheckFileName then
    if FullCheck then
      Res := FBooks.Locate('Folder;FileName', VarArrayOf([BookRecord.Folder, BookRecord.FileName]), [loCaseInsensitive])
    else
      Res := FBooks.Locate(FILENAME_FIELD, BookRecord.FileName, [loCaseInsensitive])
    else
      Res := False;

  if not Res then
  begin
    ASeqNumber := BookRecord.SeqNumber;
    if ASeqNumber > 5000 then
      ASeqNumber := 0;

    FBooks.Insert;
    FBooks.FieldByName(LIB_ID_FIELD).AsInteger := BookRecord.LibID;
    FBooks.FieldByName('Title').AsString := BookRecord.Title;
    FBooks.FieldByName('FullName').AsString := AnsiUpperCase(BookRecord.Authors[0].GetFullName); // поле только для поиска!
    FBooks.FieldByName(SERIE_ID_FIELD).AsInteger := FSeries.FieldByName(SERIE_ID_FIELD).AsInteger;
    FBooks.FieldByName('SeqNumber').AsInteger := ASeqNumber;
    FBooks.FieldByName('Date').AsDateTime := BookRecord.Date;
    FBooks.FieldByName('LibRate').AsInteger := BookRecord.LibRate;
    FBooks.FieldByName('Lang').AsString := BookRecord.Lang;
    FBooks.FieldByName(FOLDER_FIELD).AsString := BookRecord.Folder;
    FBooks.FieldByName(FILENAME_FIELD).AsString := BookRecord.FileName;
    FBooks.FieldByName('InsideNo').AsInteger := BookRecord.InsideNo;
    FBooks.FieldByName('Ext').AsString := BookRecord.FileExt;
    FBooks.FieldByName('Size').AsInteger := BookRecord.Size;
    FBooks.FieldByName('URI').AsString := BookRecord.URI;
    FBooks.FieldByName('Code').AsInteger := BookRecord.Code;
    FBooks.FieldByName('Local').AsBoolean := BookRecord.Local;
    FBooks.FieldByName('Deleted').AsBoolean := BookRecord.Deleted;
    FBooks.FieldByName('KeyWords').AsString := BookRecord.KeyWords;
    FBooks.Post;

    for Genre in BookRecord.Genres do
    begin
      FGenreList.Insert;
      FGenreList.FieldByName(BOOK_ID_FIELD).AsInteger := FBooks.FieldByName(BOOK_ID_FIELD).AsInteger;
      FGenreList.FieldByName(GENRE_CODE_FIELD).AsString := Genre.GenreCode;
      //
      // формирование индексных полей (индексирование по первым 10-ти символам)
      //
      FGenreList.FieldByName('GL_Family').AsString := Copy(BookRecord.Authors[0].GetFullName, 1, INDEXSIZE);
      FGenreList.FieldByName('GL_Title').AsString := Copy(BookRecord.Title, 1, INDEXSIZE);
      FGenreList.FieldByName('GL_Series').AsString := Copy(BookRecord.Series, 1, INDEXSIZE);
      FGenreList.Post;
    end;

    for Author in BookRecord.Authors do
    begin
      FAuthorList.Append;
      try
        FAuthorList.FieldByName(AUTHOR_ID_FIELD).AsInteger := Author.ID;
        FAuthorList.FieldByName(BOOK_ID_FIELD).AsInteger := FBooks.FieldByName(BOOK_ID_FIELD).AsInteger;
        //
        // формирование индексных полей (индексирование по первым 10-ти символам)
        //
        FAuthorList.FieldByName('AL_Title').AsString := Copy(BookRecord.Title, 1, INDEXSIZE);
        FAuthorList.FieldByName('AL_Series').AsString := Copy(BookRecord.Series, 1, INDEXSIZE);

        FAuthorList.Post;
      except
        FAuthorList.Cancel;
      end;
    end;

    if BookRecord.Annotation <> '' then
    begin
      FExtra.Insert;
      FExtra.FieldByName(BOOK_ID_FIELD).AsInteger := FBooks.FieldByName(BOOK_ID_FIELD).AsInteger;
      FExtra.FieldByName('Annotation').AsString := BookRecord.Annotation;
      FExtra.Post;
    end;

    Result := FBooks.FieldByName(BOOK_ID_FIELD).AsInteger;
  end;
end;

procedure TMHLLibrary.DeleteBook;
var
  SerieID: Integer;
begin
  CheckActive;

  if FBooks.Locate(BOOK_ID_FIELD, BookID, []) then
  begin
    SerieID := FBooks[SERIE_ID_FIELD];
    FBooks.Delete;

    { TODO -oNickR : Заменить эти вызовы на DELETE FROM query }

    while FGenreList.Locate(BOOK_ID_FIELD, BookID, []) do
      FGenreList.Delete;
    while FAuthorList.Locate(BOOK_ID_FIELD, BookID, []) do
      FAuthorList.Delete;

    //
    // Если книга входила в серию (SerieID <> 1) проверим, не пора ли удалить серию.
    //
    if SerieID <> 1 then
    begin
      if not FBooks.Locate(SERIE_ID_FIELD, SerieID, []) then
      begin
        //
        // Больше книг из этой серии нет => удалим серию
        //
        FSeries.Locate(SERIE_ID_FIELD, SerieID, []);
        FSeries.Delete;
      end;
    end;

    // удаляем из Extra
    if ClearExtra and FExtra.Locate(BOOK_ID_FIELD, BookID, []) then
      FExtra.Delete;

    //
    // У каждого автора должна быть хоть одна книга.
    // TODO -oNickR -cUsability : Возможно, стоит смягчить это требование и хранить описание авторов, книг которых нет в библиотеке
    //
    FAuthors.First;
    while not FAuthors.Eof do
    begin
      if FAuthorList.Locate(AUTHOR_ID_FIELD, FAuthors[AUTHOR_ID_FIELD], []) then
        FAuthors.Next
      else
        FAuthors.Delete;
    end;

    { TODO 5 -oNickR -cBug : Необходимо удалить книгу из групп }
  end;
end;

procedure TMHLLibrary.AddBookGenre(BookID: Integer; const GenreCode: string);
begin
  CheckActive;

  if FBooks.Locate(BOOK_ID_FIELD, BookID, []) then
  begin
    FGenreList.Insert;
    FGenreList[BOOK_ID_FIELD] := BookID;
    FGenreList[GENRE_CODE_FIELD] := GenreCode;
    FGenreList['GL_Family'] := Copy(FBooks['FullName'], 1, INDEXSIZE);
    FGenreList['GL_Title'] := Copy(FBooks['Title'], 1, INDEXSIZE);

    if FSeries.Locate(SERIE_ID_FIELD, FBooks[SERIE_ID_FIELD], []) then
      FGenreList['GL_Series'] := Copy(FSeries.FieldByName('S_Title').AsString, 1, INDEXSIZE);
    FGenreList.Post;
  end;
end;

procedure TMHLLibrary.CleanBookGenres(BookID: Integer);
begin
  CheckActive;

  while FGenreList.Locate(BOOK_ID_FIELD, BookID, []) do
    FGenreList.Delete;
end;

procedure TMHLLibrary.CorrectExtra(OldID, NewID: Integer);
begin
  ///FExtra.MasterSource := nil;
  if FExtra.Locate(BOOK_ID_FIELD, OldID, []) then
  begin
    FExtra.Edit;
    FExtra[BOOK_ID_FIELD] := NewID;
    FExtra.Post;
  end;
end;

procedure TMHLLibrary.GetSeries(SeriesList: TStrings);
begin
  FSeries.First;
  while not FSeries.Eof do
  begin
    if FSeries[SERIE_ID_FIELD] <> 1 then
      SeriesList.Add(FSeries.FieldByName('S_Title').AsString);
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
