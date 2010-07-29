(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Aleksey Penkov  alex.penkov@gmail.com
  *                     Nick Rymanov (nrymanov@gmail.com)
  * Created             12.02.2010
  * Description
  *
  * $Id$
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

    function GetTopGenreAlias(const FB2Code: string): string;
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

  private
    FDatabase: TABSDatabase;

    FAuthors: TABSTable;
    FAuthorID: TIntegerField;
    FAuthorLastName: TWideStringField;
    FAuthorFirstName: TWideStringField;
    FAuthorMiddleName: TWideStringField;

    FAuthorList: TABSTable;
    FAuthorListAuthorID: TIntegerField;
    FAuthorListBookID: TIntegerField;

    FBooks: TABSTable;
    FBookBookID: TIntegerField;
    FBookLibID: TIntegerField;
    FBookTitle: TWideStringField;
    FBookSerieID: TIntegerField;
    FBookSeqNumber: TSmallintField;
    FBookDate: TDateField;
    FBookLibRate: TIntegerField;
    FBookLang: TWideStringField;
    FBookFolder: TWideStringField;
    FBookFileName: TWideStringField;
    FBookInsideNo: TIntegerField;
    FBookExt: TWideStringField;
    FBookSize: TIntegerField;
    FBookCode: TSmallintField;
    FBookLocal: TBooleanField;
    FBookDeleted: TBooleanField;
    FBookKeyWords: TWideStringField;

    FSeries: TABSTable;
    FSeriesSerieID: TIntegerField;
    FSeriesSerieTitle: TWideStringField;

    FGenres: TABSTable;
    FGenresGenreCode: TWideStringField;
    FGenresParentCode: TWideStringField;
    FGenresFB2Code: TWideStringField;
    FGenresAlias: TWideStringField;

    FGenreList: TABSTable;
    FGenreListGenreCode: TWideStringField;
    FGenreListBookID: TIntegerField;

    FExtra: TABSTable;
    FExtraBookID: TIntegerField;
    FExtraAnnotation: TWideMemoField;
    //FExtraReview: TWideMemoField;
    FExtraRate: TIntegerField;
    FExtraProgress: TIntegerField;
  end;

implementation

uses
  SysUtils,
  IOUtils,
  bdeconst,
  unit_Consts;

resourcestring
  rstrFavoritesGroupName = 'Избранное';
  rstrToReadGroupName = 'К прочтению';

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
AuthorListTableFields: array [1 .. 2] of TFieldDesc = (
  (Name: AUTHOR_ID_FIELD; DataType: ftInteger;    Size: 0;         Required: True),
  (Name: BOOK_ID_FIELD;   DataType: ftInteger;    Size: 0;         Required: True)
);

AuthorListTableIndexes: array [1 .. 2] of TIndexDesc = (
  (Name: 'ID_Index';  Fields: AUTHOR_ID_BOOK_ID_FIELDS; Options: [ixPrimary]),
  (Name: 'BookIndex'; Fields: BOOK_ID_FIELD;            Options: [])
);

//
//  Authors
//
AuthorsTableFields: array [1 .. 4] of TFieldDesc = (
  (Name: AUTHOR_ID_FIELD;         DataType: ftAutoInc;    Size: 0;   Required: True),
  (Name: AUTHOR_LASTTNAME_FIELD;  DataType: ftWideString; Size: 128; Required: True),
  (Name: AUTHOR_FIRSTNAME_FIELD;  DataType: ftWideString; Size: 128; Required: False),
  (Name: AUTHOR_MIDDLENAME_FIELD; DataType: ftWideString; Size: 128; Required: False)
);

AuthorsTableIndexes: array [1 .. 2] of TIndexDesc = (
  (Name: 'ID_Index';      Fields: AUTHOR_ID_FIELD;        Options: [ixPrimary]),
  (Name: 'AlphabetIndex'; Fields: AUTHOR_FULLNAME_FIELDS; Options: [ixCaseInsensitive])
);

//
// Books table
//
BooksTableFields: array [1 .. 17] of TFieldDesc = (
  (Name: BOOK_ID_FIELD;        DataType: ftAutoInc;     Size: 0;   Required: True),
  (Name: BOOK_LIBID_FIELD;     DataType: ftInteger;     Size: 0;   Required: False),
  (Name: BOOK_TITLE_FIELD;     DataType: ftWideString;  Size: 150; Required: False),
  (Name: SERIE_ID_FIELD;       DataType: ftInteger;     Size: 0;   Required: False),
  (Name: BOOK_SEQNUMBER_FIELD; DataType: ftSmallInt;    Size: 0;   Required: False),
  (Name: BOOK_DATE_FIELD;      DataType: ftDate;        Size: 0;   Required: False),
  (Name: BOOK_LIBRATE_FIELD;   DataType: ftInteger;     Size: 0;   Required: False),
  (Name: BOOK_LANG_FIELD;      DataType: ftWideString;  Size: 2;   Required: False),
  (Name: BOOK_FOLDER_FIELD;    DataType: ftWideString;  Size: MAXFOLDERLENGTH; Required: False),
  (Name: BOOK_FILENAME_FIELD;  DataType: ftWideString;  Size: 170; Required: True),
  (Name: BOOK_INSIDENO_FIELD;  DataType: ftInteger;     Size: 0;   Required: True),
  (Name: BOOK_EXT_FIELD;       DataType: ftWideString;  Size: 10;  Required: False),
  (Name: BOOK_SIZE_FIELD;      DataType: ftInteger;     Size: 0;   Required: False),
  (Name: BOOK_CODE_FIELD;      DataType: ftSmallInt;    Size: 0;   Required: False),
  (Name: BOOK_LOCAL_FIELD;     DataType: ftBoolean;     Size: 0;   Required: False),
  (Name: BOOK_DELETED_FIELD;   DataType: ftBoolean;     Size: 0;   Required: False),
  (Name: BOOK_KEYWORDS_FIELD;  DataType: ftWideString;  Size: 255; Required: False)
);

BooksTableIndexes: array [1 .. 10] of TIndexDesc = (
  (Name: 'ID_Index';       Fields: BOOK_ID_FIELD;             Options: [ixPrimary]),
  (Name: 'Series_Index';   Fields: SERIE_ID_SEQNUMBER_FIELDS; Options: []),
  (Name: 'Title_Index';    Fields: BOOK_TITLE_FIELD;          Options: [ixCaseInsensitive]),
  (Name: 'File_Index';     Fields: BOOK_FILENAME_FIELD;       Options: [ixCaseInsensitive]),
  (Name: 'Folder_Index';   Fields: BOOK_FOLDER_FIELD;         Options: [ixCaseInsensitive]),
  (Name: 'Deleted_Index';  Fields: BOOK_DELETED_FIELD;        Options: []),
  (Name: 'Date_Index';     Fields: BOOK_DATE_FIELD;           Options: []),
  (Name: 'Local_Index';    Fields: BOOK_LOCAL_FIELD;          Options: []),
  (Name: 'LibID_Index';    Fields: BOOK_LIBID_FIELD;          Options: []),
  (Name: 'KeyWords_Index'; Fields: BOOK_KEYWORDS_FIELD;       Options: [ixCaseInsensitive])
);

//
// Series
//
SeriesTableFields: array [1 .. 2] of TFieldDesc = (
  (Name: SERIE_ID_FIELD;    DataType: ftAutoInc;    Size: 0;  Required: True),
  (Name: SERIE_TITLE_FIELD; DataType: ftWideString; Size: 80; Required: True)
);

SeriesTableIndexes: array [1 .. 2] of TIndexDesc = (
  (Name: 'ID_Index';        Fields: SERIE_ID_FIELD;    Options: [ixPrimary]),
  (Name: 'SerieTitleIndex'; Fields: SERIE_TITLE_FIELD; Options: [ixCaseInsensitive])
);

//
// Genres
//
GenresTableFields: array [1 .. 4] of TFieldDesc = (
  (Name: GENRE_CODE_FIELD;       DataType: ftWideString; Size: 20; Required: True),
  (Name: GENRE_PARENTCODE_FIELD; DataType: ftWideString; Size: 20; Required: False),
  (Name: GENRE_FB2CODE_FIELD;    DataType: ftWideString; Size: 20; Required: False),
  (Name: GENRE_ALIAS_FIELD;      DataType: ftWideString; Size: 50; Required: True)
);

GenresTableIndexes: array [1 .. 4] of TIndexDesc = (
  (Name: 'ID_Index';     Fields: GENRE_CODE_FIELD;             Options: [ixPrimary]),
  (Name: 'CodeIndex';    Fields: GENRE_PARENTCODE_CODE_FIELDS; Options: [ixCaseInsensitive, ixUnique]),
  (Name: 'FB2CodeIndex'; Fields: GENRE_FB2CODE_FIELD;          Options: [ixCaseInsensitive]),
  (Name: 'AliasIndex';   Fields: GENRE_ALIAS_FIELD;            Options: [])
);

//
// Genre List
//
GenreListTableFields: array [1 .. 2] of TFieldDesc = (
  (Name: GENRE_CODE_FIELD; DataType: ftWideString; Size: 20;        Required: True),
  (Name: BOOK_ID_FIELD;    DataType: ftInteger;    Size: 0;         Required: True)
);

GenreListTableIndexes: array [1 .. 2] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: GENRE_CODE_BOOK_ID_FIELDS; Options: [ixPrimary]),
  (Name: 'BookIndex';  Fields: BOOK_ID_FIELD;             Options: [])
);

//
// Extra
//
ExtraTableFields: array [1 .. 5] of TFieldDesc = (
  (Name: BOOK_ID_FIELD;         DataType: ftInteger;    Size: 0;   Required: True),
  (Name: BOOK_RATE_FIELD;       DataType: ftInteger;    Size: 0;   Required: False),
  (Name: BOOK_PROGRESS_FIELD;   DataType: ftInteger;    Size: 0;   Required: False),
  (Name: BOOK_ANNOTATION_FIELD; DataType: ftWideMemo;   Size: 0;   Required: False),
  (Name: BOOK_REVIEW_FIELD;     DataType: ftWideMemo;   Size: 0;   Required: False)
);

ExtraTableIndexes: array [1 .. 1] of TIndexDesc = (
  (Name: 'ID_Index';     Fields: BOOK_ID_FIELD;         Options: [ixPrimary])
);

ExtraTableBlobs: array [1 .. 2] of TBLOBFieldDesc = (
  (Name: BOOK_ANNOTATION_FIELD; BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5),
  (Name: BOOK_REVIEW_FIELD;     BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5)
);

// -----------------------------------------------------------------------------
// User.dbsx
// -----------------------------------------------------------------------------
//
// Bases table
//
BasesTableFields: array [1 .. 15] of TFieldDesc = (
  (Name: ID_FIELD;        DataType: ftAutoInc;    Size: 0;   Required: True),
  (Name: BASE_NAME_FIELD; DataType: ftWideString; Size: 64;  Required: True),
  (Name: 'RootFolder';    DataType: ftWideString; Size: 128; Required: True),
  (Name: 'DBFileName';    DataType: ftWideString; Size: 128; Required: True),
  (Name: 'Notes';         DataType: ftWideString; Size: 255; Required: False),
  (Name: 'Date';          DataType: ftDate;       Size: 0;   Required: False),
  (Name: 'Version';       DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'Code';          DataType: ftInteger;    Size: 0;   Required: False),
  (Name: 'AllowDelete';   DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: 'Settings';      DataType: ftWideMemo;   Size: 0;   Required: False),
  (Name: 'Icon';          DataType: ftBlob;       Size: 0;   Required: False),
  (Name: 'URL';           DataType: ftWideString; Size: 255; Required: False),
  (Name: 'User';          DataType: ftWideString; Size: 50;  Required: False),
  (Name: 'Pass';          DataType: ftWideString; Size: 50;  Required: False),
  (Name: 'Connection';    DataType: ftWideMemo;   Size: 0;   Required: False)
);

BasesTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: ID_FIELD;        Options: [ixPrimary]),
  (Name: 'Name_Index'; Fields: BASE_NAME_FIELD; Options: [])
);

BasesTableBlobs: array [1 .. 2] of TBLOBFieldDesc = (
  (Name: 'Settings';     BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5),
  (Name: 'Connection';   BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5)
);

//
// Groups List (группы: избранное, прочитанное, к прочтению и т.п.)
//
GroupsListTableFields: array [1..5] of TFieldDesc = (
  (Name: GROUP_ID_FIELD;   DataType: ftAutoInc;    Size: 0;   Required: True),
  (Name: GROUP_NAME_FIELD; DataType: ftWideString; Size: 255; Required: False),
  (Name: 'AllowDelete';    DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: 'Notes';          DataType: ftMemo;       Size: 0;   Required: False),
  (Name: 'Icon';           DataType: ftBlob;       Size: 0;   Required: False)
);

GroupsListTableIndexes: array [1..2] of TIndexDesc = (
  (Name: 'ID_Index';   Fields: GROUP_ID_FIELD;   Options: [ixPrimary]),
  (Name: 'NameIndex';  Fields: GROUP_NAME_FIELD; Options: [])
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
  (Name: 'ID_Index';    Fields: GROUP_ID_BOOK_ID_DB_ID_FIELDS; Options: [ixPrimary]),
  (Name: 'BookDBIndex'; Fields: BOOK_ID_DB_ID_FIELDS;          Options: [])
);


//
// Groups table
//
// TODO -oNickR -cDB opt : инхронизировать с таблицей Books
GroupsTableFields: array [1 .. 23] of TFieldDesc = (
  (Name: BOOK_ID_FIELD;        DataType: ftInteger;    Size: 0;   Required: True),
  (Name: DB_ID_FIELD;          DataType: ftInteger;    Size: 0;   Required: True),
  (Name: BOOK_LIBID_FIELD;     DataType: ftInteger;    Size: 0;   Required: False),
  (Name: BOOK_TITLE_FIELD;     DataType: ftWideString; Size: 150; Required: False),
  (Name: SERIE_ID_FIELD;       DataType: ftInteger;    Size: 0;   Required: False),
  (Name: BOOK_SEQNUMBER_FIELD; DataType: ftSmallInt;   Size: 0;   Required: False),
  (Name: BOOK_DATE_FIELD;      DataType: ftDate;       Size: 0;   Required: False),
  (Name: BOOK_LIBRATE_FIELD;   DataType: ftInteger;    Size: 0;   Required: False),
  (Name: BOOK_LANG_FIELD;      DataType: ftWideString; Size: 2;   Required: False),
  (Name: BOOK_FOLDER_FIELD;    DataType: ftWideString; Size: 255; Required: False),
  (Name: BOOK_FILENAME_FIELD;  DataType: ftWideString; Size: 255; Required: True),
  (Name: BOOK_INSIDENO_FIELD;  DataType: ftInteger;    Size: 0;   Required: True),
  (Name: BOOK_EXT_FIELD;       DataType: ftWideString; Size: 10;  Required: False),
  (Name: BOOK_SIZE_FIELD;      DataType: ftInteger;    Size: 0;   Required: False),
  (Name: BOOK_CODE_FIELD;      DataType: ftSmallInt;   Size: 0;   Required: False),
  (Name: BOOK_LOCAL_FIELD;     DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: BOOK_DELETED_FIELD;   DataType: ftBoolean;    Size: 0;   Required: False),
  (Name: BOOK_KEYWORDS_FIELD;  DataType: ftWideString; Size: 255; Required: False),

  //
  // Данные из таблицы Extra
  //
  (Name: BOOK_RATE_FIELD;      DataType: ftInteger;    Size: 0;   Required: False),
  (Name: BOOK_PROGRESS_FIELD;  DataType: ftSmallInt;   Size: 0;   Required: False),
  (Name: BOOK_ANNOTATION_FIELD;DataType: ftWideMemo;   Size: 0;   Required: False),
  (Name: BOOK_REVIEW_FIELD;    DataType: ftWideMemo;   Size: 0;   Required: False),

  //
  // Данные из других таблиц. Название серии, авторы, жанры.
  // TODO : Необходимо сделать обновление этой информации.
  //
  (Name: BOOK_EXTRAINFO_FIELD; DataType: ftBlob;       Size: 0;   Required: False)
);

GroupsTableIndexes: array [1 .. 2] of TIndexDesc = (
  (Name: 'ID_Index';       Fields: BOOK_ID_DB_ID_FIELDS; Options: [ixPrimary]),
  (Name: 'File_Index';     Fields: BOOK_FILENAME_FIELD;  Options: [])
);

GroupBooksTableBlobs: array [1 .. 3] of TBLOBFieldDesc = (
  (Name: BOOK_ANNOTATION_FIELD;BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5),
  (Name: BOOK_REVIEW_FIELD;    BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5),
  (Name: BOOK_EXTRAINFO_FIELD; BlobCompressionAlgorithm: caZLIB;   BlobCompressionMode: 5)
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

  if Value then
  begin
    FAuthorID := FAuthors.FieldByName(AUTHOR_ID_FIELD) as TIntegerField;
    FAuthorLastName := FAuthors.FieldByName(AUTHOR_LASTTNAME_FIELD) as TWideStringField;
    FAuthorFirstName := FAuthors.FieldByName(AUTHOR_FIRSTNAME_FIELD) as TWideStringField;
    FAuthorMiddleName := FAuthors.FieldByName(AUTHOR_MIDDLENAME_FIELD) as TWideStringField;

    FAuthorListAuthorID := FAuthorList.FieldByName(AUTHOR_ID_FIELD) as TIntegerField;
    FAuthorListBookID := FAuthorList.FieldByName(BOOK_ID_FIELD) as TIntegerField;

    FBookBookID := FBooks.FieldByName(BOOK_ID_FIELD) as TIntegerField;
    FBookLibID := FBooks.FieldByName(BOOK_LIBID_FIELD) as TIntegerField;
    FBookTitle := FBooks.FieldByName(BOOK_TITLE_FIELD) as TWideStringField;
    FBookSerieID := FBooks.FieldByName(SERIE_ID_FIELD) as TIntegerField;
    FBookSeqNumber := FBooks.FieldByName(BOOK_SEQNUMBER_FIELD) as TSmallintField;
    FBookDate := FBooks.FieldByName(BOOK_DATE_FIELD) as TDateField;
    FBookLibRate := FBooks.FieldByName(BOOK_LIBRATE_FIELD) as TIntegerField;
    FBookLang := FBooks.FieldByName(BOOK_LANG_FIELD) as TWideStringField;
    FBookFolder := FBooks.FieldByName(BOOK_FOLDER_FIELD) as TWideStringField;
    FBookFileName := FBooks.FieldByName(BOOK_FILENAME_FIELD) as TWideStringField;
    FBookInsideNo := FBooks.FieldByName(BOOK_INSIDENO_FIELD) as TIntegerField;
    FBookExt := FBooks.FieldByName(BOOK_EXT_FIELD) as TWideStringField;
    FBookSize := FBooks.FieldByName(BOOK_SIZE_FIELD) as TIntegerField;
    FBookCode := FBooks.FieldByName(BOOK_CODE_FIELD) as TSmallintField;
    FBookLocal := FBooks.FieldByName(BOOK_LOCAL_FIELD) as TBooleanField;
    FBookDeleted := FBooks.FieldByName(BOOK_DELETED_FIELD) as TBooleanField;
    FBookKeyWords := FBooks.FieldByName(BOOK_KEYWORDS_FIELD) as TWideStringField;

    FExtraBookID := FExtra.FieldByName(BOOK_ID_FIELD) as TIntegerField;
    FExtraAnnotation := FExtra.FieldByName(BOOK_ANNOTATION_FIELD) as TWideMemoField;
    //FExtraReview := FExtra.FieldByName(BOOK_REVIEW_FIELD) as TWideMemoField;
    FExtraRate := FExtra.FieldByName(BOOK_RATE_FIELD) as TIntegerField;
    FExtraProgress := FExtra.FieldByName(BOOK_PROGRESS_FIELD) as TIntegerField;

    FSeriesSerieID := FSeries.FieldByName(SERIE_ID_FIELD) as TIntegerField;
    FSeriesSerieTitle := FSeries.FieldByName(SERIE_TITLE_FIELD) as TWideStringField;

    FGenresGenreCode := FGenres.FieldByName(GENRE_CODE_FIELD) as TWideStringField;
    FGenresParentCode := FGenres.FieldByName(GENRE_PARENTCODE_FIELD) as TWideStringField;
    FGenresFB2Code := FGenres.FieldByName(GENRE_FB2CODE_FIELD) as TWideStringField;
    FGenresAlias := FGenres.FieldByName(GENRE_ALIAS_FIELD) as TWideStringField;

    FGenreListGenreCode := FGenreList.FieldByName(GENRE_CODE_FIELD) as TWideStringField;
    FGenreListBookID := FGenreList.FieldByName(BOOK_ID_FIELD) as TIntegerField;
  end
  else
  begin
    FAuthorID := nil;
    FAuthorLastName := nil;
    FAuthorFirstName := nil;
    FAuthorMiddleName := nil;

    FAuthorListAuthorID := nil;
    FAuthorListBookID := nil;

    FBookBookID := nil;
    FBookLibID := nil;
    FBookTitle := nil;
    FBookSerieID := nil;
    FBookSeqNumber := nil;
    FBookDate := nil;
    FBookLibRate := nil;
    FBookLang := nil;
    FBookFolder := nil;
    FBookFileName := nil;
    FBookInsideNo := nil;
    FBookExt := nil;
    FBookSize := nil;
    FBookCode := nil;
    FBookLocal := nil;
    FBookDeleted := nil;
    FBookKeyWords := nil;

    FExtraBookID := nil;
    FExtraAnnotation := nil;
    //FExtraReview := nil;
    FExtraRate := nil;
    FExtraProgress := nil;

    FSeriesSerieID := nil;
    FSeriesSerieTitle := nil;

    FGenresGenreCode := nil;
    FGenresParentCode := nil;
    FGenresFB2Code := nil;
    FGenresAlias := nil;

    FGenreListGenreCode := nil;
    FGenreListBookID := nil;
  end;
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
    CreateTable(ADatabase, 'BookGroups', BookGroupsTableFields, BookGroupsTableIndexes, []);
    CreateTable(ADatabase, 'Books',      GroupsTableFields,     GroupsTableIndexes,     GroupBooksTableBlobs);
    ADatabase.Connected := False;

    //
    // Зададим дефлотные группы
    //
    Groups := TABSTable.Create(ADatabase);
    try
      Groups.TableName := 'Groups';
      Groups.Active := True;

      Groups.Append;
      Groups.FieldByName(GROUP_NAME_FIELD).AsWideString := rstrFavoritesGroupName;
      Groups.FieldByName('AllowDelete').AsBoolean := False;
      Groups.Post;
      Assert(Groups.FieldByName(GROUP_ID_FIELD).AsInteger = FAVORITES_GROUP_ID);

      Groups.Append;
      Groups.FieldByName(GROUP_NAME_FIELD).AsWideString := rstrToReadGroupName;
      Groups.FieldByName('AllowDelete').AsBoolean := False;
      Groups.Post;
      Assert(Groups.FieldByName(GROUP_ID_FIELD).AsInteger = (FAVORITES_GROUP_ID + 1));
    finally
      Groups.Free;
    end;
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
  FSeries.Append;
  FSeriesSerieTitle.Value := NO_SERIES_TITLE;
  FSeries.Post;
end;

procedure TMHLLibrary.LoadGenres(const GenresFileName: string);
var
  FS: TStringList;
  i: Integer;
  p: Integer;
  S: string;
  ParentCode: string;
  Code: string;
  FB2Code: string;
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
      FGenresGenreCode.Value := Code;
      FGenresParentCode.Value := ParentCode;
      FGenresFB2Code.Value := FB2Code;
      FGenresAlias.Value := S;
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

function TMHLLibrary.GetTopGenreAlias(const FB2Code: string): string;
var
  Code: string;
  p: Integer;
begin
  FGenres.Locate(GENRE_FB2CODE_FIELD, FB2Code, []);
  Code := FGenresGenreCode.Value;

  Delete(Code, 1, 2); // "0."
  p := Pos('.', Code);
  Code := '0.' + Copy(Code, 1, p - 1);

  FGenres.Locate(GENRE_CODE_FIELD, Code, []);
  Result := FGenresAlias.Value;
end;

function TMHLLibrary.CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean;
var
  S: string;
begin
  CheckActive;

  if ZipFolder then
    Result := FBooks.Locate(BOOK_FOLDER_FIELD, FileName, [loCaseInsensitive])
  else
  begin
    if FullNameSearch then
      S := ExtractFileName(FileName)
    else
      S := TPath.GetFileNameWithoutExtension(FileName);
    Result := FBooks.Locate(BOOK_FILENAME_FIELD, S, [loCaseInsensitive]);
  end;
end;

function TMHLLibrary.InsertBook(BookRecord: TBookRecord; CheckFileName, FullCheck: Boolean): Integer;
var
  i: Integer;
  ASeqNumber: Integer;
  Genre: TGenreData;
  Author: TAuthorData;

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
    if not FAuthors.Locate(AUTHOR_FULLNAME_FIELDS, VarArrayOf([BookRecord.Authors[i].LastName, BookRecord.Authors[i].FirstName, BookRecord.Authors[i].MiddleName]), [loCaseInsensitive]) then
    begin
      FAuthors.Insert;
      FAuthorLastName.Value := BookRecord.Authors[i].LastName;
      FAuthorFirstName.Value := BookRecord.Authors[i].FirstName;
      FAuthorMiddleName.Value := BookRecord.Authors[i].MiddleName;
      FAuthors.Post;
    end;

    //
    // и запомним ID-ки
    //
    BookRecord.Authors[i].AuthorID := FAuthorID.Value;
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
    if BookRecord.Genres[i].FB2GenreCode <> '' then
    begin
      //
      // Знаем fb2-код жанра => получаем внутренний код
      //
      if FGenres.Locate(GENRE_FB2CODE_FIELD, BookRecord.Genres[i].FB2GenreCode, [loCaseInsensitive]) then
        BookRecord.Genres[i].GenreCode := FGenresGenreCode.Value
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
  //
  if not FSeries.Locate(SERIE_TITLE_FIELD, BookRecord.Serie, [loCaseInsensitive]) then
  begin
    FSeries.Append;
    FSeriesSerieTitle.Value := BookRecord.Serie;
    FSeries.Post;
  end;

  //
  // Собственно сохраним информацию о книге
  //
  if CheckFileName then
    if FullCheck then
      Res := FBooks.Locate('Folder;FileName', VarArrayOf([BookRecord.Folder, BookRecord.FileName]), [loCaseInsensitive])
    else
      Res := FBooks.Locate(BOOK_FILENAME_FIELD, BookRecord.FileName, [loCaseInsensitive])
    else
      Res := False;

  if not Res then
  begin
    ASeqNumber := BookRecord.SeqNumber;
    if ASeqNumber > 5000 then
      ASeqNumber := 0;

    FBooks.Append;
    FBookLibID.Value := BookRecord.LibID;
    FBookTitle.Value := BookRecord.Title;
    FBookSerieID.Value := FSeriesSerieID.AsInteger;
    FBookSeqNumber.Value := ASeqNumber;
    FBookDate.Value := BookRecord.Date;
    FBookLibRate.Value := BookRecord.LibRate;
    FBookLang.Value := BookRecord.Lang;
    FBookFolder.Value := BookRecord.Folder;
    FBookFileName.Value := BookRecord.FileName;
    FBookInsideNo.Value := BookRecord.InsideNo;
    FBookExt.Value := BookRecord.FileExt;
    FBookSize.Value := BookRecord.Size;
    FBookCode.Value := BookRecord.Code;
    FBookLocal.Value := BookRecord.Local;
    FBookDeleted.Value := BookRecord.Deleted;
    FBookKeyWords.Value := BookRecord.KeyWords;
    FBooks.Post;

    for Genre in BookRecord.Genres do
    begin
      FGenreList.Append;
      try
        FGenreListBookID.Value := FBookBookID.Value;
        FGenreListGenreCode.Value := Genre.GenreCode;

        FGenreList.Post;
      except
        FGenreList.Cancel;
      end;
    end;

    for Author in BookRecord.Authors do
    begin
      FAuthorList.Append;
      try
        FAuthorListAuthorID.Value := Author.AuthorID;
        FAuthorListBookID.Value := FBookBookID.Value;

        FAuthorList.Post;
      except
        FAuthorList.Cancel;
      end;
    end;

    if (BookRecord.Annotation <> '') or (BookRecord.Rate <> 0) or (BookRecord.Progress <> 0) then
    begin
      FExtra.Append;
      FExtraBookID.Value := FBookBookID.Value;

      if BookRecord.Rate <> 0 then
        FExtraRate.Value := BookRecord.Rate;

      if BookRecord.Progress <> 0 then
        FExtraProgress.Value := BookRecord.Progress;

      if BookRecord.Annotation <> '' then
        FExtraAnnotation.Value := BookRecord.Annotation;

      FExtra.Post;
    end;

    Result := FBookBookID.Value;
  end;
end;

procedure TMHLLibrary.DeleteBook(BookID: Integer; ClearExtra: Boolean = True);
var
  SerieID: Integer;
begin
  CheckActive;

  if FBooks.Locate(BOOK_ID_FIELD, BookID, []) then
  begin
    SerieID := FBookSerieID.Value;
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
      if FAuthorList.Locate(AUTHOR_ID_FIELD, FAuthorID.Value, []) then
        FAuthors.Next
      else
        FAuthors.Delete;
    end;

    { TODO 5 -oNickR -cBug : Необходимо удалить книгу из групп }
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
  if FExtra.Locate(BOOK_ID_FIELD, OldID, []) then
  begin
    FExtra.Edit;
    FExtraBookID.AsInteger := NewID;
    FExtra.Post;
  end;
end;

procedure TMHLLibrary.GetSeries(SeriesList: TStrings);
begin
  FSeries.First;
  while not FSeries.Eof do
  begin
    if FSeriesSerieID.Value <> NO_SERIE_ID then
      SeriesList.Add(FSeriesSerieTitle.Value);
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
