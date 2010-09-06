(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           eg
  *
  * Created             04.09.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_Database_SQLite;

interface

uses
  Classes,
  SQLiteWrap,
  UserData,
  unit_Globals,
  unit_Interfaces,
  unit_Database_Abstract;

type
  // The class is NOT THREAD-SAFE as the connection instance FDatabase is not.
  TBookCollection_SQLite = class(TBookCollection)
  strict private type
    //-------------------------------------------------------------------------
    TBookIteratorImpl = class(TInterfacedObject, IBookIterator)
    public
      constructor Create(
        Collection: TBookCollection_SQLite;
        const Mode: TBookIteratorMode;
        const LoadMemos: Boolean;
        const FilterValue: PFilterValue;
        const SearchCriteria: TBookSearchCriteria
      );
      destructor Destroy; override;

    protected
      // IBookIterator
      function Next(out BookRecord: TBookRecord): Boolean;
      function RecordCount: Integer;

    strict private
      FCollection: TBookCollection_SQLite;
      FBooks: TSQLiteTable;
      FCollectionID: Integer; // Active collection's ID at the time the iterator was created
      FLoadMemos: Boolean;
      FNumRecords: Integer;

      procedure PrepareData(const Mode: TBookIteratorMode; const FilterValue: PFilterValue; const SearchCriteria: TBookSearchCriteria);
      procedure PrepareSearchData(const SearchCriteria: TBookSearchCriteria);
    end;
    // << TBookIteratorImpl

    //-------------------------------------------------------------------------
    TAuthorIteratorImpl = class(TInterfacedObject, IAuthorIterator)
    public
      constructor Create(
        Collection: TBookCollection_SQLite;
        const Mode: TAuthorIteratorMode;
        const FilterValue: PFilterValue
      );
      destructor Destroy; override;

    protected
      // IAuthorIterator
      function Next(out AuthorData: TAuthorData): Boolean;
      function RecordCount: Integer;

    strict private
      FCollection: TBookCollection_SQLite;
      FAuthors: TSQLiteTable;
      FCollectionID: Integer; // Active collection's ID at the time the iterator was created
      FNumRecords: Integer;

      procedure PrepareData(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue);
    end;
    // << TAuthorIteratorImpl

    //-------------------------------------------------------------------------
    TGenreIteratorImpl = class(TInterfacedObject, IGenreIterator)
    public
      constructor Create(Collection: TBookCollection_SQLite; const Mode: TGenreIteratorMode; const FilterValue: PFilterValue);
      destructor Destroy; override;

    protected
      // IGenreIterator
      function Next(out GenreData: TGenreData): Boolean;
      function RecordCount: Integer;

    strict private
      FCollection: TBookCollection_SQLite;
      FGenres: TSQLiteTable;
      FCollectionID: Integer; // Active collection's ID at the time the iterator was created
      FNumRecords: Integer;

      procedure PrepareData(const Mode: TGenreIteratorMode; const FilterValue: PFilterValue);
    end;
    // << TGenreIteratorImpl

    //-------------------------------------------------------------------------
    TSeriesIteratorImpl = class(TInterfacedObject, ISeriesIterator)
    public
      constructor Create(Collection: TBookCollection_SQLite; const Mode: TSeriesIteratorMode);
      destructor Destroy; override;

    protected
      //
      // ISeriesIterator
      //
      function Next(out SeriesData: TSeriesData): Boolean;
      function RecordCount: Integer;

    strict private
      FCollection: TBookCollection_SQLite;
      FSeries: TSQLiteTable;
      FCollectionID: Integer; // Active collection's ID at the time the iterator was created
      FNumRecords: Integer;

      procedure PrepareData(const Mode: TSeriesIteratorMode);
    end;
    // << TSeriesIteratorImpl

  public
    constructor Create(const DBCollectionFile: string);
    destructor Destroy; override;

    // Iterators:
    function GetAuthorIterator(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue = nil): IAuthorIterator; override;
    function GetGenreIterator(const Mode: TGenreIteratorMode; const FilterValue: PFilterValue = nil): IGenreIterator; override;
    function GetSeriesIterator(const Mode: TSeriesIteratorMode): ISeriesIterator; override;
    function GetBookIterator(const Mode: TBookIteratorMode; const LoadMemos: Boolean; const FilterValue: PFilterValue = nil): IBookIterator; override;
    function Search(const SearchCriteria: TBookSearchCriteria; const LoadMemos: Boolean): IBookIterator; override;

    //
    //
    //
    function InsertBook(BookRecord: TBookRecord; const CheckFileName: Boolean; const FullCheck: Boolean): Integer; override;
    procedure GetBookRecord(const BookKey: TBookKey; out BookRecord: TBookRecord; const LoadMemos: Boolean); override;
//    procedure UpdateBook(const BookRecord: TBookRecord); override;
    procedure DeleteBook(const BookKey: TBookKey); override;
//
//    function GetLibID(const BookKey: TBookKey): string; override; // deprecated;
//    function GetReview(const BookKey: TBookKey): string; override;
//
    function SetReview(const BookKey: TBookKey; const Review: string): Integer; override;
//    procedure SetProgress(const BookKey: TBookKey; const Progress: Integer); override;
//    procedure SetRate(const BookKey: TBookKey; const Rate: Integer); override;
//    procedure SetLocal(const BookKey: TBookKey; const AState: Boolean); override;
//    procedure SetFolder(const BookKey: TBookKey; const Folder: string); override;
//    procedure SetFileName(const BookKey: TBookKey; const FileName: string); override;
//    procedure SetSeriesID(const BookKey: TBookKey; const SeriesID: Integer); override;
//
//    procedure CleanBookGenres(const BookID: Integer); override;
    procedure InsertBookGenres(const BookID: Integer; const Genres: TBookGenres); override;
//
//    function FindOrCreateSeries(const Title: string): Integer; override;
//    procedure SetSeriesTitle(const SeriesID: Integer; const NewTitle: string); override;
//    procedure ChangeBookSeriesID(const OldID: Integer; const NewID: Integer; const DatabaseID: Integer); override;
//
    procedure SetStringProperty(const PropID: Integer; const Value: string); override;
//    procedure SetIntProperty(const PropID: Integer; const Value: Integer);
//
    procedure ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc); override;
    procedure ExportUserData(data: TUserData); override;

    function CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean; override;
    function GetTopGenreAlias(const FB2Code: string): string; override;

    //
    // Bulk operation
    //
    procedure BeginBulkOperation; override;
    procedure EndBulkOperation(Commit: Boolean = True); override;

    procedure CompactDatabase; override;
    procedure RepairDatabase; override;
//    procedure ReloadGenres(const FileName: string); override;
//    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer); override;
//
    procedure TruncateTablesBeforeImport; override;

  protected
    procedure InsertGenreIfMissing(const GenreData: TGenreData); override;
    procedure InternalLoadGenres;

  strict private
    FDatabase: TSQLiteDatabase; // NOT THREAD-SAFE (query parameters are stored on the object)!

    procedure GetAuthor(AuthorID: Integer; var Author: TAuthorData);
    function GetSeriesTitle(SeriesID: Integer): string;
    function InsertAuthorIfMissing(const Author: TAuthorData): Integer;
    function InsertSeriesIfMissing(const SeriesTitle: string): Integer;
    function InsertAuthorListEntry(const BookKey: TBookKey; const Author: TAuthorData): Integer;
    function IsFileNameConflict(const BookRecord: TBookRecord; const IncludeFolder: Boolean): Boolean;
    procedure FixGenreCode(var GenreData: TGenreData);
    procedure SetAnnotation(const BookKey: TBookKey; const Annotation: string);
    function GenerateFullName(const LastName: string; const FirstName: string; const MiddleName: string): String; inline;
  end;

procedure CreateCollectionTables_SQLite(const DBCollectionFile: string; const GenresFileName: string);

implementation

uses
  SysUtils,
  Windows,
  Character,
  dm_user,
  DateUtils,
  IOUtils,
  unit_Consts,
  unit_Logger,
  unit_SearchUtils,
  unit_Settings,
  unit_Errors;

const
  INIT_ROWS_ARR: array[0 .. 1] of Boolean = (False, True);


// Read provided resource file as a string list (split by ';')
// This is done as ExecSQL works with only one statement at a time
function ReadResourceAsStringList(const ResourceName: string): TStringList;
var
  ResourceStream: TStream;
  Text: String;
begin
  ResourceStream := TResourceStream.Create(HInstance, ResourceName, RT_RCDATA);
  try
    Result := TStringList.Create;

    // Load the file:
    Result.LoadFromStream(ResourceStream);

    // Clean up the text:
    Text := Result.Text;
    StrReplace(CRLF, ' ', Text);
    StrReplace(LF, ' ', Text);

    // Split by ';'
    Result.Clear;
    Result.StrictDelimiter := True; // so that spaces are ignored
    Result.Delimiter := ';';
    Result.DelimitedText := Text;
  finally
    FreeAndNil(ResourceStream);
  end;
end;

// Generate table structure and minimal data for a new collection
procedure CreateCollectionTables_SQLite(const DBCollectionFile: string; const GenresFileName: string);
var
  ADatabase: TSQLiteDatabase;
  StringList: TStringList;
  StructureDDL: String;
  BookCollection: TBookCollection;
  Logger: IIntervalLogger;
begin
  ADatabase := TSQLiteDatabase.Create(DBCollectionFile);
  try
    StringList := ReadResourceAsStringList('CreateCollectionDB_SQLite');
    try
      for StructureDDL in StringList do
      begin
        if Trim(StructureDDL) <> '' then
        begin
          Logger := GetIntervalLogger('CreateCollectionTables_SQLite', StructureDDL);
          ADatabase.ExecSQL(StructureDDL);
          Logger := nil
        end;
      end;
    finally
      FreeAndNil(StringList);
    end;
  finally
    FreeAndNil(ADatabase);
  end;

  // Now that we have the DB structure in place, can create a collection instance:
  BookCollection := TBookCollection_SQLite.Create(DBCollectionFile);
  try
    // Fill metadata version and creation date:
    BookCollection.SetStringProperty(SETTING_VERSION, DATABASE_VERSION);
    BookCollection.SetStringProperty(SETTING_CREATION_DATE, FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now));

    // Fill the Genres table:
    BookCollection.LoadGenres(GenresFileName);
  finally
    FreeAndNil(BookCollection);
  end;
end;

// ------------------------------------------------------------------------------

{ TBookIteratorImpl }

constructor TBookCollection_SQLite.TBookIteratorImpl.Create(
  Collection: TBookCollection_SQLite;
  const Mode: TBookIteratorMode;
  const LoadMemos: Boolean;
  const FilterValue: PFilterValue;
  const SearchCriteria: TBookSearchCriteria
);
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollectionInfo.ID;
  FLoadMemos := LoadMemos;
  FCollection := Collection;

  if Mode = bmSearch then
  begin
    Assert(not Assigned(FilterValue));
    PrepareSearchData(SearchCriteria);
  end
  else
    PrepareData(Mode, FilterValue, SearchCriteria);
end;

destructor TBookCollection_SQLite.TBookIteratorImpl.Destroy;
begin
  FreeAndNil(FBooks);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TBookCollection_SQLite.TBookIteratorImpl.Next(out BookRecord: TBookRecord): Boolean;
var
  BookID: Integer;
begin
  Result := not FBooks.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollectionInfo.ID = FCollectionID); // shouldn't happen
    BookID := FBooks.FieldAsInt(0);
    FCollection.GetBookRecord(CreateBookKey(BookID, FCollectionID), BookRecord, FLoadMemos);
    FBooks.Next;
  end;
end;

function TBookCollection_SQLite.TBookIteratorImpl.RecordCount: Integer;
begin
  Result := FNumRecords;
end;

procedure TBookCollection_SQLite.TBookIteratorImpl.PrepareData(
  const Mode: TBookIteratorMode;
  const FilterValue: PFilterValue;
  const SearchCriteria: TBookSearchCriteria
);
var
  Where: string;
  SQLRows: string;
  SQLCount: string;
  Logger: IIntervalLogger;
  InitRows: Boolean;
begin
  for InitRows in INIT_ROWS_ARR do
  begin
    Where := '';
    FCollection.FDatabase.ParamsClear;

    case Mode of
      bmAll:
        SQLRows := 'SELECT b.BookID FROM Books b ';

      bmByGenre:
      begin
        Assert(Assigned(FilterValue));
        SQLRows := 'SELECT b.BookID FROM Genre_List gl INNER JOIN Books b ON gl.BookID = b.BookID ';
        if isFB2Collection(DMUser.ActiveCollectionInfo.CollectionType) or not Settings.ShowSubGenreBooks then
          AddToWhere(Where, 'gl.GenreCode = :GenreCode')
        else
          AddToWhere(Where, 'gl.GenreCode LIKE :GenreCode%');
        FCollection.FDatabase.AddParamString(':GenreCode', FilterValue^.ValueString);
      end;

      bmByAuthor:
      begin
        Assert(Assigned(FilterValue));
        SQLRows := 'SELECT b.BookID FROM Author_List al INNER JOIN Books b ON al.BookID = b.BookID ';
        AddToWhere(Where, 'al.AuthorID = :AuthorID ');
        FCollection.FDatabase.AddParamInt(':AuthorID', FilterValue^.ValueInt);
      end;

      bmBySeries:
      begin
        Assert(Assigned(FilterValue));
        SQLRows := 'SELECT b.BookID FROM Books b ';
        AddToWhere(Where, 'b.SeriesID = :SeriesID ');
        FCollection.FDatabase.AddParamInt(':SeriesID', FilterValue^.ValueInt);
      end;

      else
        Assert(False);
    end;

    if Mode in [bmByGenre, bmByAuthor, bmBySeries] then
    begin
      if FCollection.HideDeleted then
      begin
        AddToWhere(Where, ' b.IsDeleted = :IsDeleted');
        FCollection.FDatabase.AddParamBoolean(':IsDeleted', False);
      end;
      if FCollection.ShowLocalOnly then
      begin
        AddToWhere(Where, ' b.IsLocal = :IsLocal ');
        FCollection.FDatabase.AddParamBoolean(':IsLocal', True);
      end;
    end;

    SQLRows := SQLRows + Where;

    // InitRows - workaround for the need to reset params between invocations to receive a new dataset
    if InitRows then
    begin
      Logger := GetIntervalLogger('TBookIteratorImpl.PrepareData', SQLRows);
      FBooks := FCollection.FDatabase.GetTable(SQLRows);
      Logger := nil;
    end
    else
    begin
      SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';
      Logger := GetIntervalLogger('TBookIteratorImpl.PrepareData', SQLCount);
      FNumRecords := FCollection.FDatabase.GetTableInt(SQLCount);
      Logger := nil;
    end;
  end;
end;

// Original code was extracted from TfrmMain.DoApplyFilter
procedure TBookCollection_SQLite.TBookIteratorImpl.PrepareSearchData(const SearchCriteria: TBookSearchCriteria);
const
  SQL_START_STR = 'SELECT DISTINCT b.BookID ';
  DT_FORMAT = 'yyyy-mm-dd "00:00:00.000"';
var
  FilterString: string;
  SQLRows: string;
  SQLCount: string;
  Logger: IIntervalLogger;
  InitRows: Boolean;
begin
  for InitRows in INIT_ROWS_ARR do
  begin
    SQLRows := '';
    FCollection.FDatabase.ParamsClear;

    try
      // ------------------------ авторы ----------------------------------------
      FilterString := '';
      if SearchCriteria.FullName <> '' then
      begin
        AddToFilter('a.LastName + CASE WHEN a.FirstName' +
            ' IS NULL THEN '''' ELSE '' '' END + a.FirstName' +
            ' + CASE WHEN a.MiddleName IS NULL THEN '''' ELSE '' '' END + a.MiddleName ',
          PrepareQuery(SearchCriteria.FullName, True),
          True, FilterString);
        if FilterString <> '' then
        begin
          FilterString := SQL_START_STR +
            ' FROM Authors a INNER JOIN Author_List b ON (a.AuthorID = b.AuthorID) WHERE '
            + FilterString;

          SQLRows := SQLRows + FilterString;
        end;
      end;

      // ------------------------ серия -----------------------------------------
      FilterString := '';
      if SearchCriteria.Series <> '' then
      begin
        AddToFilter('s.SeriesTitle', PrepareQuery(SearchCriteria.Series, True), True, FilterString);

        if FilterString <> '' then
        begin
          FilterString := SQL_START_STR +
            ' FROM Series s JOIN Books b ON b.' + SERIES_ID_FIELD + ' = s.' + SERIES_ID_FIELD + ' WHERE ' +
            FilterString;

          if SQLRows <> '' then
            SQLRows := SQLRows + ' INTERSECT ';

          SQLRows := SQLRows + FilterString;
        end;
      end;

      // -------------------------- жанр ----------------------------------------
      FilterString := '';
      if (SearchCriteria.Genre <> '') then
      begin
        FilterString := SQL_START_STR +
          ' FROM Genre_List g JOIN Books b ON b.BookID = g.BookID WHERE (' +
          SearchCriteria.Genre + ')';

        if SQLRows <> '' then
          SQLRows := SQLRows + ' INTERSECT ';

        SQLRows := SQLRows + FilterString;
      end;

      // -------------------  все остальное   -----------------------------------
      FilterString := '';
      AddToFilter('b.Annotation', PrepareQuery(SearchCriteria.Annotation, True), True, FilterString);
      AddToFilter('b.Title', PrepareQuery(SearchCriteria.Title, True), True, FilterString);
      AddToFilter('b.FileName', PrepareQuery(SearchCriteria.FileName, False), False, FilterString);
      AddToFilter('b.Folder', PrepareQuery(SearchCriteria.Folder, False), False, FilterString);
      AddToFilter('b.Ext', PrepareQuery(SearchCriteria.FileExt, False), False, FilterString);
      AddToFilter('b.Lang', PrepareQuery(SearchCriteria.Lang, True, False), True, FilterString);
      AddToFilter('b.KeyWords', PrepareQuery(SearchCriteria.KeyWord, True), True, FilterString);
      //
      if SearchCriteria.DateIdx = -1 then
        AddToFilter('b.UpdateDate', PrepareQuery(SearchCriteria.DateText, False), False, FilterString)
      else
        case SearchCriteria.DateIdx of
          0: AddToFilter('b.UpdateDate', Format('> "%s"', [FormatDateTime(DT_FORMAT, IncDay(Now, -1))]), False, FilterString);
          1: AddToFilter('b.UpdateDate', Format('> "%s"', [FormatDateTime(DT_FORMAT, IncDay(Now, -3))]), False, FilterString);
          2: AddToFilter('b.UpdateDate', Format('> "%s"', [FormatDateTime(DT_FORMAT, IncDay(Now, -7))]), False, FilterString);
          3: AddToFilter('b.UpdateDate', Format('> "%s"', [FormatDateTime(DT_FORMAT, IncDay(Now, -14))]), False, FilterString);
          4: AddToFilter('b.UpdateDate', Format('> "%s"', [FormatDateTime(DT_FORMAT, IncDay(Now, -30))]), False, FilterString);
          5: AddToFilter('b.UpdateDate', Format('> "%s"', [FormatDateTime(DT_FORMAT, IncDay(Now, -90))]), False, FilterString);
        end;

      case SearchCriteria.DownloadedIdx of
        1: AddToFilter('b.IsLocal ', '= 1', False, FilterString);
        2: AddToFilter('b.IsLocal ', '= 0', False, FilterString);
      end;

      if SearchCriteria.Deleted then
        AddToFilter('b.IsDeleted ', '= 0', False, FilterString);

      if FilterString <> '' then
      begin
        if SQLRows <> '' then
          SQLRows := SQLRows + ' INTERSECT ';
        SQLRows := SQLRows + SQL_START_STR + ' FROM Books b WHERE ' + FilterString;
      end;
    except
      on E: Exception do
        raise Exception.Create(rstrFilterParamError);
    end;

    if SQLRows = '' then
      raise Exception.Create(rstrCheckFilterParams);

    // InitRows - workaround for the need to reset params between invocations to receive a new dataset
    if InitRows then
    begin
      Logger := GetIntervalLogger('TBookIteratorImpl.PrepareSearchData', SQLCount);
      FBooks := FCollection.FDatabase.GetTable(SQLRows);
      Logger := nil;
    end
    else
    begin
      SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';
      Logger := GetIntervalLogger('TBookIteratorImpl.PrepareSearchData', SQLCount);
      FNumRecords := FCollection.FDatabase.GetTableInt(SQLCount);
      Logger := nil;
    end;
  end;
end;

{ TAuthorIteratorImpl }

constructor TBookCollection_SQLite.TAuthorIteratorImpl.Create(
  Collection: TBookCollection_SQLite;
  const Mode: TAuthorIteratorMode;
  const FilterValue: PFilterValue
);
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollectionInfo.ID;
  FCollection := Collection;

  PrepareData(Mode, FilterValue);
end;

destructor TBookCollection_SQLite.TAuthorIteratorImpl.Destroy;
begin
  FreeAndNil(FAuthors);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TBookCollection_SQLite.TAuthorIteratorImpl.Next(out AuthorData: TAuthorData): Boolean;
var
  AuthorID: Integer;
begin
  Result := not FAuthors.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollectionInfo.ID = FCollectionID); // shouldn't happen

    AuthorID := FAuthors.FieldAsInt(0);
    FCollection.GetAuthor(AuthorID, AuthorData);

    FAuthors.Next;
  end;
end;

function TBookCollection_SQLite.TAuthorIteratorImpl.RecordCount: Integer;
begin
  Result := FNumRecords;
end;

procedure TBookCollection_SQLite.TAuthorIteratorImpl.PrepareData(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue);
var
  Where: string;
  SQLRows: string;
  SQLCount: string;
  Logger: IIntervalLogger;
  InitRows: Boolean;
begin
  for InitRows in INIT_ROWS_ARR do
  begin
    Where := '';
    FCollection.FDatabase.ParamsClear;

    case Mode of
      amAll:
        SQLRows := 'SELECT a.AuthorID FROM Authors a ';

      amByBook:
        begin
          Assert(Assigned(FilterValue));
          SQLRows := 'SELECT DISTINCT a.AuthorID FROM Author_List a WHERE a.BookID = :v0 ';
          FCollection.FDatabase.AddParamInt(':v0', FilterValue^.ValueInt);
        end;

      amFullFilter:
        begin
          SQLRows := 'SELECT DISTINCT a.AuthorID FROM Authors a ';
          if FCollection.HideDeleted or FCollection.ShowLocalOnly then
          begin
            SQLRows := SQLRows + ' INNER JOIN Author_List al ON a.AuthorID = al.AuthorID INNER JOIN Books b ON al.BookID = b.BookID ';
            if FCollection.HideDeleted then
            begin
              AddToWhere(Where, ' b.IsDeleted = :IsDeleted ');
              FCollection.FDatabase.AddParamBoolean(':IsDeleted', False);
            end;
            if FCollection.ShowLocalOnly then
            begin
              AddToWhere(Where, ' b.IsLocal = :IsLocal ');
              FCollection.FDatabase.AddParamBoolean(':IsLocal', True);
            end;
          end;

          // Add an author type filter:
          if FCollection.AuthorFilterType <> '' then
          begin
            if FCollection.AuthorFilterType = ALPHA_FILTER_NON_ALPHA then
            begin
              AddToWhere(Where,
                '(UPPER(SUBSTR(a.LastName, 1, 1)) NOT IN (' + ENGLISH_ALPHABET_SEPARATORS + ')) AND ' +
                '(UPPER(SUBSTR(a.LastName, 1, 1)) NOT IN (' + RUSSIAN_ALPHABET_SEPARATORS + '))'
              );
            end
            else if FCollection.AuthorFilterType <> ALPHA_FILTER_ALL then
            begin
              Assert(Length(FCollection.AuthorFilterType) = 1);
              Assert(TCharacter.IsUpper(FCollection.AuthorFilterType, 1));
              AddToWhere(Where,
                'UPPER(a.LastName) LIKE :FilterType'  // начинается на заданную букву
              );
              FCollection.FDatabase.AddParamString(':FilterType', FCollection.AuthorFilterType + '%');
            end;
          end;
        end;

      else
        Assert(False);
    end;

    SQLRows := SQLRows + Where;
    SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';
    if Mode in [amAll, amFullFilter] then
      SQLRows := SQLRows + ' ORDER BY a.LastName, a.FirstName, a.MiddleName ';

    if InitRows then
    begin
      Logger := GetIntervalLogger('TAuthorIteratorImpl.PrepareData', SQLRows);
      FAuthors := FCollection.FDatabase.GetTable(SQLRows);
      Logger := nil;
    end
    else
    begin
      Logger := GetIntervalLogger('TAuthorIteratorImpl.PrepareData', SQLCount);
      FNumRecords := FCollection.FDatabase.GetTableInt(SQLCount);
      Logger := nil;
    end;
  end;
end;

{ TGenreIteratorImpl }

constructor TBookCollection_SQLite.TGenreIteratorImpl.Create(Collection: TBookCollection_SQLite; const Mode: TGenreIteratorMode; const FilterValue: PFilterValue);
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollectionInfo.ID;
  FCollection := Collection;

  PrepareData(Mode, FilterValue);
end;

destructor TBookCollection_SQLite.TGenreIteratorImpl.Destroy;
begin
  FreeAndNil(FGenres);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TBookCollection_SQLite.TGenreIteratorImpl.Next(out GenreData: TGenreData): Boolean;
var
  GenreCode: String;
begin
  Result := not FGenres.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollectionInfo.ID = FCollectionID); // shouldn't happen
    GenreCode := FGenres.FieldAsString(0);
    FCollection.GetGenre(GenreCode, GenreData);
    FGenres.Next;
  end;
end;

function TBookCollection_SQLite.TGenreIteratorImpl.RecordCount: Integer;
begin
  Result := FNumRecords;
end;

procedure TBookCollection_SQLite.TGenreIteratorImpl.PrepareData(const Mode: TGenreIteratorMode; const FilterValue: PFilterValue);
var
  SQLRows: String;
  SQLCount: String;
  Logger: IIntervalLogger;
  InitRows: Boolean;
begin
  for InitRows in INIT_ROWS_ARR do
  begin
    FCollection.FDatabase.ParamsClear;

    case Mode of
      gmAll:
        SQLRows := 'SELECT g.GenreCode FROM Genres g ';
      gmByBook:
      begin
        Assert(Assigned(FilterValue));
        SQLRows := 'SELECT gl.GenreCode FROM Genre_List gl WHERE BookID = :v0 ';
        FCollection.FDatabase.AddParamInt(':v0', FilterValue^.ValueInt);
     end
      else
        Assert(False);
    end;

    SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';

    if InitRows then
    begin
      Logger := GetIntervalLogger('TGenreIteratorImpl.PrepareData', SQLRows);
      FGenres := FCollection.FDatabase.GetTable(SQLRows);
      Logger := nil;
    end
    else
    begin
      Logger := GetIntervalLogger('TGenreIteratorImpl.PrepareData', SQLCount);
      FNumRecords := FCollection.FDatabase.GetTableInt(SQLCount);
      Logger := nil;
    end;
  end;
end;

{ TSeriesIteratorImpl }

constructor TBookCollection_SQLite.TSeriesIteratorImpl.Create(Collection: TBookCollection_SQLite; const Mode: TSeriesIteratorMode);
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollectionInfo.ID;
  FCollection := Collection;

  PrepareData(Mode);
end;

destructor TBookCollection_SQLite.TSeriesIteratorImpl.Destroy;
begin
  FreeAndNil(FSeries);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TBookCollection_SQLite.TSeriesIteratorImpl.Next(out SeriesData: TSeriesData): Boolean;
begin
  Result := not FSeries.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollectionInfo.ID = FCollectionID); // shouldn't happen
    SeriesData.SeriesID := FSeries.FieldAsInt(0);
    SeriesData.SeriesTitle := FSeries.FieldAsString(1);
    FSeries.Next;
  end;
end;

function TBookCollection_SQLite.TSeriesIteratorImpl.RecordCount: Integer;
begin
  Result := FNumRecords;
end;

procedure TBookCollection_SQLite.TSeriesIteratorImpl.PrepareData(const Mode: TSeriesIteratorMode);
var
  Where: string;
  SQLRows: string;
  SQLCount: string;
  Logger: IIntervalLogger;
  InitRows: Boolean;
begin
  for InitRows in INIT_ROWS_ARR do
  begin
    Where := '';
    FCollection.FDatabase.ParamsClear;

    case Mode of
      smAll:
        SQLRows := 'SELECT s.SeriesID, s.SeriesTitle FROM Series s ';

      smFullFilter:
      begin
        SQLRows := 'SELECT DISTINCT s.SeriesID, s.SeriesTitle FROM Series s ';
        if FCollection.HideDeleted or FCollection.ShowLocalOnly then
        begin
          SQLRows := SQLRows + ' INNER JOIN Books b ON s.SeriesID = b.SeriesID ';
          if FCollection.HideDeleted then
          begin
            AddToWhere(Where, ' b.IsDeleted = :IsDeleted ');
            FCollection.FDatabase.AddParamBoolean(':IsDeleted', False);
          end;
          if FCollection.ShowLocalOnly then
          begin
            AddToWhere(Where, ' b.IsLocal = :IsLocal ');
            FCollection.FDatabase.AddParamBoolean(':IsLocal', True);
          end;
        end;

        // Series type filter
        if FCollection.SeriesFilterType <> '' then
        begin
          if FCollection.SeriesFilterType = ALPHA_FILTER_NON_ALPHA then
          begin
            AddToWhere(Where,
              '(UPPER(SUBSTR(s.SeriesTitle, 1, 1)) NOT IN (' + ENGLISH_ALPHABET_SEPARATORS + ')) AND ' +
              '(UPPER(SUBSTR(s.SeriesTitle, 1, 1)) NOT IN (' + RUSSIAN_ALPHABET_SEPARATORS + '))'
            );
          end
          else if FCollection.SeriesFilterType <> ALPHA_FILTER_ALL then
          begin
            Assert(Length(FCollection.SeriesFilterType) = 1);
            Assert(TCharacter.IsUpper(FCollection.SeriesFilterType, 1));
            AddToWhere(Where,
              'UPPER(s.SeriesTitle) LIKE :FilterType'   // начинается на заданную букву
            );
            FCollection.FDatabase.AddParamString(':FilterType', FCollection.SeriesFilterType + '%');
          end;
        end;
      end
      else
        Assert(False);
    end;

    SQLRows := SQLRows + Where;
    SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';
    SQLRows := SQLRows + ' ORDER BY s.' + SERIES_TITLE_FIELD;

    if InitRows then
    begin
      Logger := GetIntervalLogger('TSeriesIteratorImpl.PrepareData', SQLRows);
      FSeries := FCollection.FDatabase.GetTable(SQLRows);
      Logger := nil;
    end
    else
    begin
      Logger := GetIntervalLogger('TSeriesIteratorImpl.PrepareData', SQLCount);
      FNumRecords := FCollection.FDatabase.GetTableInt(SQLCount);
      Logger := nil;
    end;
  end;
end;

//-----------------------------------------------------------------------------

{ TBookCollection_SQLite }

constructor TBookCollection_SQLite.Create(const DBCollectionFile: string);
begin
  inherited Create;

  FDatabase := TSQLiteDatabase.Create(DBCollectionFile);
  InternalLoadGenres;
end;

destructor TBookCollection_SQLite.Destroy;
begin
  FreeAndNil(FDatabase);

  inherited Destroy;
end;

procedure TBookCollection_SQLite.SetStringProperty(const PropID: Integer; const Value: string);
const
  // A special format of query with a '?' sign for the blob value
  SQL_UPDATE = 'UPDATE Settings SET SettingValue = ? WHERE ID = :v0 ';
  SQL_DELETE = 'DELETE FROM Settings WHERE ID = :v0 ';
var
  ValueStream: TStringStream;
  Logger: IIntervalLogger;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamInt(':v0', PropID);

  if Value <> '' then
  begin
    ValueStream := TStringStream.Create(Value);
    try
      Logger := GetIntervalLogger('SetPropertyS', SQL_UPDATE);
      FDatabase.UpdateBlob(SQL_UPDATE, ValueStream);
      Logger := nil;
    finally
      FreeAndNil(ValueStream);
    end;
  end
  else
  begin
    Logger := GetIntervalLogger('SetPropertyS', SQL_DELETE);
    FDatabase.ExecSQL(SQL_DELETE);
    Logger := nil;
  end;
end;

procedure TBookCollection_SQLite.ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc);
var
  extra: TBookExtra;
  group: TBookGroup;
  groupBook: TGroupBook;
  Sql: String;
  Logger: IIntervalLogger;

  BookKey: TBookKey;

  function GetBookKey(bookInfo: TBookInfo; out BookKey: TBookKey): Boolean;
  const
    SQL_BY_BOOKID = 'SELECT b.BookID FROM Books b WHERE b.BookID = :v0 ';
    SQL_BY_LIBID = 'SELECT b.BookID FROM Books b WHERE b.LibID = :v0 ';
  var
    Logger: IIntervalLogger;
    BookID: Integer;
  begin
    FDatabase.ParamsClear;
    if bookInfo.LibID = 0 then
    begin
      FDatabase.AddParamInt(':v0', bookInfo.BookID);
      Logger := GetIntervalLogger('ImportUserData.GetBookKey', SQL_BY_BOOKID);
      BookID := FDatabase.GetTableInt(SQL_BY_BOOKID);
    end
    else
    begin
      FDatabase.AddParamInt(':v0', bookInfo.LibID);
      Logger := GetIntervalLogger('ImportUserData.GetBookKey', SQL_BY_LIBID);
      BookID := FDatabase.GetTableInt(SQL_BY_LIBID);
    end;
    Logger := nil;

    Result := BookID > 0;
    if Result then
    begin
      BookKey := CreateBookKey(BookID, DMUser.ActiveCollectionInfo.ID);
    end;
  end;

begin
  Assert(Assigned(data));
  Assert(Assigned(guiUpdateCallback));

  Logger := nil;
  //
  // Заполним рейтинги, review и признак прочитанности
  //
  for extra in data.Extras do
  begin
    Sql := ''; //UPDATE Books SET
    FDatabase.ParamsClear;
    if GetBookKey(extra, BookKey) then
    begin
      if extra.Rating <> 0 then
      begin
        Sql := 'Rate = :v0 ';
        FDatabase.AddParamInt(':v0', extra.Rating);
      end;
      if extra.Progress <> 0 then
      begin
        if Sql <> '' then
          Sql := Sql + ', ';
        Sql := 'Progress = :v1 ';
        FDatabase.AddParamInt(':v1', extra.Progress);
      end;
      if Sql <> '' then
      begin
        Sql := 'UPDATE Books SET ' + Sql;
        if not Assigned(Logger)  then
          Logger := GetIntervalLogger('ImportUserData', Sql)
        else
          Logger.Restart(Sql);
        FDatabase.ExecSql(Sql);
      end;

      if extra.Review <> '' then
        SetReview(BookKey, extra.Review);
    end;

    //
    // Обновим информацию в группах
    //
    DMUser.SetExtra(BookKey, extra);

    //
    // Дадим возможность главному окну обновить измененные ноды
    //
    guiUpdateCallback(BookKey, extra);
  end;

  //
  // Создадим пользовательские группы
  //
  DMUser.ImportUserData(data);

  //
  // Добавим книги в группы
  //
  for group in data.Groups do
  begin
    for groupBook in group do
    begin
      if GetBookKey(groupBook, BookKey) then
      begin
        AddBookToGroup(BookKey, group.GroupID);
      end;
    end;
  end;
end;

procedure TBookCollection_SQLite.ExportUserData(data: TUserData);
const
  SQL = 'SELECT b.BookID, b.LibID, b.Rate, b.Progress, b.Review FROM Books b ' +
    'WHERE b.Rate > 0 OR b.Progress > 0 OR b.Review IS NOT NULL ' +
    'ORDER BY b.BookID ';
var
  Logger: IIntervalLogger;
  Table: TSQLiteTable;
begin
  Assert(Assigned(data));

  FDatabase.ParamsClear;
  Logger := GetIntervalLogger('ExportUserData', SQL);
  Table := FDatabase.GetTable(SQL);
  Logger := nil;
  while not Table.Eof do
  begin
    data.Extras.AddExtra(
      Table.FieldAsInt(0),        // BookID
      Table.FieldAsInt(1),        // LibID
      Table.FieldAsInt(2),        // Rate
      Table.FieldAsInt(3),        // Progress
      Table.FieldAsBlobString(4)  // Review
    );
  end;

  DMUser.ExportUserData(data);
end;

function TBookCollection_SQLite.CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean;
const
  SQL_BY_FOLDER = 'SELECT COUNT(*) FROM Books b WHERE UPPER(b.Folder) = UPPER(:v0) ';
  SQL_BY_FILENAME = 'SELECT COUNT(*) FROM Books b WHERE UPPER(b.FileName) = UPPER(:v0) ';
var
  S: string;
  Logger: IIntervalLogger;
begin
  if ZipFolder then
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamString(':v0', FileName);
    Logger := GetIntervalLogger('CheckFileInCollection', SQL_BY_FOLDER);
    Result := (FDatabase.GetTableInt(SQL_BY_FOLDER) > 0);
    Logger := nil;
  end
  else
  begin
    if FullNameSearch then
      S := ExtractFileName(FileName)
    else
      S := TPath.GetFileNameWithoutExtension(FileName);

    FDatabase.ParamsClear;
    FDatabase.AddParamString(':v0', S);
    Logger := GetIntervalLogger('CheckFileInCollection', SQL_BY_FILENAME);
    Result := (FDatabase.GetTableInt(SQL_BY_FILENAME) > 0);
    Logger := nil;
  end;
end;

function TBookCollection_SQLite.GetTopGenreAlias(const FB2Code: string): string;
const
  SQL_BY_FB2CODE = 'SELECT g.GenreCode FROM Genres g WHERE g.FB2Code = :v0 ';
  SQL_BY_GENRECODE = 'SELECT g.GenreAlias FROM Genres g WHERE g.GenreCode = :v0 ';
var
  Code: string;
  P: Integer;
  Logger: IIntervalLogger;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamString(':v0', FB2Code);
  Logger := GetIntervalLogger('GetTopGenreAlias', SQL_BY_FB2CODE);
  Code := FDatabase.GetTableString(SQL_BY_FB2CODE);
  Logger := nil;

  Delete(Code, 1, 2); // "0."
  P := Pos('.', Code);
  Code := '0.' + Copy(Code, 1, P - 1);

  FDatabase.ParamsClear;
  FDatabase.AddParamString(':v0', Code);
  Logger := GetIntervalLogger('GetTopGenreAlias', SQL_BY_GENRECODE);
  Result := FDatabase.GetTableString(SQL_BY_GENRECODE); // Alias
  Logger := nil;
end;

procedure TBookCollection_SQLite.InsertGenreIfMissing(const GenreData: TGenreData);
const
  SQL_SELECT = 'SELECT COUNT(*) FROM Genres g WHERE g.GenreCode = :v0';
  SQL_INSERT = 'INSERT INTO Genres (GenreCode, ParentCode, FB2Code, GenreAlias) ' +
    'SELECT :v0, :v1, :v2, :v3 ';
var
  Logger: IIntervalLogger;
  Count: Integer;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamString(':v0', GenreData.GenreCode);
  Logger := GetIntervalLogger('InsertGenreIfMissing', SQL_SELECT);
  Count := FDatabase.GetTableInt(SQL_SELECT);
  Logger := nil;

  if Count = 0 then // A new Genre
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamString(':v0', GenreData.GenreCode);
    FDatabase.AddParamString(':v1', GenreData.ParentCode);
    FDatabase.AddParamString(':v2', GenreData.FB2GenreCode);
    FDatabase.AddParamString(':v3', GenreData.GenreAlias);
    Logger := GetIntervalLogger('InsertGenreIfMissing', SQL_INSERT);
    FDatabase.ExecSQL(SQL_INSERT);
    Logger := nil;
  end;
end;

procedure TBookCollection_SQLite.InternalLoadGenres;
const
  SQL = 'SELECT g.GenreCode, g.ParentCode, g.FB2Code, g.GenreAlias FROM Genres g ';
var
  Logger: IIntervalLogger;
  Table: TSQLiteTable;
  Genre: TGenreData;
begin
  FGenreCache.Clear;

  Logger := GetIntervalLogger('InternalLoadGenres', SQL);
  Table := FDatabase.GetTable(SQL);
  try
    Logger := nil;
    while not Table.EOF do
    begin
      Genre.GenreCode := Table.FieldAsString(0);
      Genre.ParentCode := Table.FieldAsString(1);
      Genre.FB2GenreCode := Table.FieldAsString(2);
      Genre.GenreAlias := Table.FieldAsString(3);

      FGenreCache.Add(Genre.GenreCode, Genre);

      Table.Next;
    end;
  finally
    FreeAndNil(Table);
  end;
end;

function TBookCollection_SQLite.GetBookIterator(const Mode: TBookIteratorMode; const LoadMemos: Boolean; const FilterValue: PFilterValue = nil): IBookIterator;
var
  EmptySearchCriteria: TBookSearchCriteria;
begin
  Result := TBookIteratorImpl.Create(Self, Mode, LoadMemos, FilterValue, EmptySearchCriteria);
end;

function TBookCollection_SQLite.Search(const SearchCriteria: TBookSearchCriteria; const LoadMemos: Boolean): IBookIterator;
begin
  Result := TBookIteratorImpl.Create(Self, bmSearch, LoadMemos, nil, SearchCriteria);
end;

function TBookCollection_SQLite.GetAuthorIterator(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue = nil): IAuthorIterator;
begin
  Result := TAuthorIteratorImpl.Create(Self, Mode, FilterValue);
end;

function TBookCollection_SQLite.GetSeriesIterator(const Mode: TSeriesIteratorMode): ISeriesIterator;
begin
  Result := TSeriesIteratorImpl.Create(Self, Mode);
end;

function TBookCollection_SQLite.GetGenreIterator(const Mode: TGenreIteratorMode; const FilterValue: PFilterValue = nil): IGenreIterator;
begin
  Result := TGenreIteratorImpl.Create(Self, Mode, FilterValue);
end;

procedure TBookCollection_SQLite.GetAuthor(AuthorID: Integer; var Author: TAuthorData);
const
  SQL = 'SELECT a.LastName, a.FirstName, a.MiddleName FROM Authors a WHERE AuthorID = :v0 ';
var
  Logger: IIntervalLogger;
  Table: TSQLiteTable;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamInt(':v0', AuthorID);

  Logger := GetIntervalLogger('GetAuthor', SQL);
  Table := FDatabase.GetTable(SQL);
  try
    Logger := nil;

    if not Table.Eof then
    begin
      Author.AuthorID := AuthorID;
      Author.LastName := Table.FieldAsString(0);
      Author.FirstName := Table.FieldAsString(1);
      Author.MiddleName := Table.FieldAsString(2);
    end
    else
      Author.Clear;
  finally
    FreeAndNil(Table);
  end;
end;

// Insert an Author if the name combination doesn't exist
// Return AuthorID of the existing/added Author record
function TBookCollection_SQLite.InsertAuthorIfMissing(const Author: TAuthorData): Integer;
const
  SQL_SELECT = 'SELECT a.AuthorID FROM Authors a ' +
    'WHERE a.FullName = :v0 ';
  SQL_INSERT = 'INSERT INTO Authors (LastName, FirstName, MiddleName, FullName) ' +
    'SELECT :v0, :v1, :v2, :v3 ';

var
  Logger: IIntervalLogger;
  FullName: string;
begin
  FullName := GenerateFullName(Author.LastName, Author.FirstName, Author.MiddleName);

  FDatabase.ParamsClear;
  FDatabase.AddParamString(':v0', FullName);
  Logger := GetIntervalLogger('InsertAuthorIfMissing', SQL_SELECT);
  Result := FDatabase.GetTableInt(SQL_SELECT);
  Logger := nil;

  if Result = 0 then // not found in DB
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamString(':v0', Author.LastName);
    FDatabase.AddParamString(':v1', Author.FirstName);
    FDatabase.AddParamString(':v2', Author.MiddleName);
    FDatabase.AddParamString(':v3', FullName);
    Logger := GetIntervalLogger('InsertAuthorIfMissing', SQL_INSERT);
    FDatabase.ExecSQL(SQL_INSERT);
    Logger := nil;
    Result := FDatabase.LastInsertRowID;
  end;
end;

function TBookCollection_SQLite.InsertSeriesIfMissing(const SeriesTitle: string): Integer;
const
  SQL_SELECT = 'SELECT s.SeriesID FROM Series s WHERE UPPER(s.SeriesTitle) = UPPER(:v0) LIMIT 1 ';
  SQL_INSERT = 'INSERT INTO Series (SeriesTitle) SELECT :v0 ';
var
  Logger: IIntervalLogger;
begin
  if NO_SERIES_TITLE = SeriesTitle then
    Result := NO_SERIE_ID
  else
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamString(':v0', SeriesTitle);
    Logger := GetIntervalLogger('InsertSeriesIfMissing', SQL_SELECT);
    Result := FDatabase.GetTableInt(SQL_SELECT);
    Logger := nil;

    if Result = 0 then // not found
    begin
      FDatabase.ParamsClear;
      FDatabase.AddParamString(':v0', SeriesTitle);
      Logger := GetIntervalLogger('InsertSeriesIfMissing', SQL_INSERT);
      FDatabase.ExecSQL(SQL_INSERT);
      Logger := nil;
      Result := FDatabase.LastInsertRowID;
    end;
  end;
end;

function TBookCollection_SQLite.InsertAuthorListEntry(const BookKey: TBookKey; const Author: TAuthorData): Integer;
const
  SQL_INSERT = 'INSERT INTO Author_List (AuthorID, BookID) ' +
    'SELECT :v0, :v1 ';
var
  Logger: IIntervalLogger;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamInt(':v0', Author.AuthorID);
  FDatabase.AddParamInt(':v1', BookKey.BookID);
  Logger := GetIntervalLogger('InsertAuthorListEntry', SQL_INSERT);
  FDatabase.ExecSQL(SQL_INSERT);
  Logger := nil;
end;

function TBookCollection_SQLite.IsFileNameConflict(const BookRecord: TBookRecord; const IncludeFolder: Boolean): Boolean;
const
  SQL_SELECT_BY_FOLDER_AND_FILENAME = 'SELECT COUNT(*) FROM Books b ' +
    'WHERE UPPER(b.FileName) = UPPER(:v0) AND UPPER(b.Folder) = UPPER(:v1) ';
  SQL_SELECT_BY_FILENAME = 'SELECT COUNT(*) FROM Books b ' +
    'WHERE UPPER(b.FileName) = UPPER(:v0) ';
var
  Logger: IIntervalLogger;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamString(':v0', BookRecord.FileName);
  if IncludeFolder then
  begin
    FDatabase.AddParamString(':v1', BookRecord.Folder);
    Logger := GetIntervalLogger('IsFileNameConflict', SQL_SELECT_BY_FOLDER_AND_FILENAME);
    Result := (FDatabase.GetTableInt(SQL_SELECT_BY_FOLDER_AND_FILENAME) > 0);
    Logger := nil;
  end
  else
  begin
    Logger := GetIntervalLogger('IsFileNameConflict', SQL_SELECT_BY_FILENAME);
    Result := (FDatabase.GetTableInt(SQL_SELECT_BY_FILENAME) > 0);
    Logger := nil;
  end;
end;

procedure TBookCollection_SQLite.FixGenreCode(var GenreData: TGenreData);
const
  SQL_BY_FB2CODE = 'SELECT GenreCode FROM Genres g WHERE UPPER(g.FB2Code) = UPPER(:v0) ';
  SQL_BY_GENRECODE = 'SELECT COUNT(*) FROM Genres g WHERE UPPER(g.GenreCode) = UPPER(:v0) ';
var
  Logger: IIntervalLogger;
  Code: String;
  Count: Integer;
begin
  //
  // Если fb2 код указан, переводим его в универсальный код
  //
  if GenreData.FB2GenreCode <> '' then
  begin
    //
    // Знаем fb2-код жанра => получаем внутренний код
    //
    FDatabase.ParamsClear;
    FDatabase.AddParamString(':v0', GenreData.FB2GenreCode);
    Logger := GetIntervalLogger('FixGenreCode', SQL_BY_FB2CODE);
    Code := FDatabase.GetTableString(SQL_BY_FB2CODE);
    Logger := nil;

    if Code <> ''  then
      GenreData.GenreCode := Code
    else
      //
      // fb2-код неизвестный - так и запишем
      //
      GenreData.GenreCode := UNKNOWN_GENRE_CODE;
  end
  else
  begin
    //
    // если не указан fb2-код, проверяем наличие внутреннего кода.
    // если внутренний код неизвестен или не указан => "так и запишем"
    //
    if GenreData.GenreCode = '' then
      GenreData.GenreCode := UNKNOWN_GENRE_CODE
    else
    begin
      FDatabase.ParamsClear;
      FDatabase.AddParamString(':v0', GenreData.GenreCode);
      Logger := GetIntervalLogger('FixGenreCode', SQL_BY_GENRECODE);
      Count := FDatabase.GetTableInt(SQL_BY_GENRECODE);
      Logger := nil;
      if Count = 0 then
        GenreData.GenreCode := UNKNOWN_GENRE_CODE
    end;
  end;
end;

function TBookCollection_SQLite.InsertBook(BookRecord: TBookRecord; const CheckFileName: Boolean; const FullCheck: Boolean): Integer;
const
  SQL_INSERT = 'INSERT INTO Books (' +
    'Title, Folder, FileName, Ext, InsideNo, ' +        // 0  .. 4
    'SeriesID, SeqNumber, Code, BookSize, LibID, ' +    // 5  .. 9
    'IsDeleted, IsLocal, UpdateDate, Lang, LibRate, ' + // 10 .. 14
    'KeyWords, Rate, Progress ' +                       // 15 .. 17
    ') SELECT :v0, :v1, :v2, :v3, :v4, :v5, :v6, :v7, :v8, :v9, :v10, :v11, :v12, :v13, :v14, :v15, :v16, :v17 ';
var
  i: Integer;
  Author: TAuthorData;
  NameConflict: Boolean;
  Logger: IIntervalLogger;
begin
  Result := 0;

  if BookRecord.FileName = '' then
    Exit;

  BookRecord.Normalize;

  //
  // Создадим отсутствующих авторов
  //
  Assert(BookRecord.AuthorCount > 0);
  for i := 0 to BookRecord.AuthorCount - 1 do
    BookRecord.Authors[i].AuthorID := InsertAuthorIfMissing(BookRecord.Authors[i]);

  // Filter out duplicate authors by AuthorID:
  FilterDuplicateAuthorsByID(BookRecord.Authors);

  //
  // Определяем код жанра
  //
  Assert(BookRecord.GenreCount > 0);
  for i := 0 to BookRecord.GenreCount - 1 do
    FixGenreCode(BookRecord.Genres[i]);

  //
  // создадим отсутствующую серию
  //
  BookRecord.SeriesID := InsertSeriesIfMissing(BookRecord.Series);

  //
  // Собственно сохраним информацию о книге
  //
  if CheckFileName then
    NameConflict := IsFileNameConflict(BookRecord, FullCheck);

  if not NameConflict then
  begin
    if BookRecord.SeqNumber > 5000 then
      BookRecord.SeqNumber := 0;

    FDatabase.ParamsClear;
    FDatabase.AddParamString(':v0', BookRecord.Title);
    FDatabase.AddParamString(':v1', BookRecord.Folder);
    FDatabase.AddParamString(':v2', BookRecord.FileName);
    FDatabase.AddParamString(':v3', BookRecord.FileExt);
    FDatabase.AddParamInt(':v4', BookRecord.InsideNo);
    if NO_SERIE_ID <> BookRecord.SeriesID then
    begin
      FDatabase.AddParamInt(':v5', BookRecord.SeriesID);
      FDatabase.AddParamInt(':v6', BookRecord.SeqNumber);
    end
    else
    begin
      FDatabase.AddParamNull(':v5');
      FDatabase.AddParamNull(':v6');
    end;
    FDatabase.AddParamInt(':v7', BookRecord.Code);
    FDatabase.AddParamInt(':v8', BookRecord.Size);
    FDatabase.AddParamInt(':v9', BookRecord.LibID);
    FDatabase.AddParamBoolean(':v10', BookRecord.IsDeleted);
    FDatabase.AddParamBoolean(':v11', BookRecord.IsLocal);
    FDatabase.AddParamDateTime(':v12', BookRecord.Date);
    FDatabase.AddParamString(':v13', BookRecord.Lang);
    FDatabase.AddParamInt(':v14', BookRecord.LibRate);
    FDatabase.AddParamString(':v15', BookRecord.KeyWords);
    FDatabase.AddParamInt(':v16', BookRecord.Rate);
    FDatabase.AddParamInt(':v17', BookRecord.Progress);
    Logger := GetIntervalLogger('InsertBook', SQL_INSERT);
    FDatabase.ExecSQL(SQL_INSERT);
    Logger := nil;
    BookRecord.BookKey.BookID := FDatabase.LastInsertRowID;
    BookRecord.BookKey.DatabaseID := DMUser.ActiveCollectionInfo.ID;

    if BookRecord.Review <> '' then
      SetReview(BookRecord.BookKey, BookRecord.Review);
    if BookRecord.Annotation < '' then
      SetAnnotation(BookRecord.BookKey, BookRecord.Annotation);

    FilterDuplicateGenresByCode(BookRecord.Genres);
    InsertBookGenres(BookRecord.BookKey.BookID, BookRecord.Genres);

    for Author in BookRecord.Authors do
      InsertAuthorListEntry(BookRecord.BookKey, Author);

    Result := BookRecord.BookKey.BookID;
  end;
end;

procedure TBookCollection_SQLite.GetBookRecord(const BookKey: TBookKey; out BookRecord: TBookRecord; const LoadMemos: Boolean);
const
  SQL = 'SELECT ' +
    'b.Title, b.Folder, b.FileName, b.Ext, b.InsideNo, ' +        // 0  .. 4
    'b.SeriesID, b.SeqNumber, b.Code, b.BookSize, b.LibID, ' +    // 5  .. 9
    'b.IsDeleted, b.IsLocal, b.UpdateDate, b.Lang, b.LibRate, ' + // 10 .. 14
    'b.KeyWords, b.Rate, b.Progress, b.Review, b.Annotation ' +   // 15 .. 19
    'FROM Books b WHERE BookID = :v0 ';
var
  Logger: IIntervalLogger;
  Count: Integer;
  Table: TSQLiteTable;
begin
  BookRecord.Clear;

  if BookKey.DatabaseID = DMUser.ActiveCollectionInfo.ID then
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamInt(':v0', BookKey.BookID);
    Logger := GetIntervalLogger('GetBookRecord', SQL);
    Table := FDatabase.GetTable(SQL);
    try
      Logger := nil;
      Assert(not Table.Eof);

      BookRecord.BookKey := BookKey;
      BookRecord.Title := Table.FieldAsString(0);
      BookRecord.Folder := Table.FieldAsString(1);
      BookRecord.FileName := Table.FieldAsString(2);
      BookRecord.FileExt := Table.FieldAsString(3);
      BookRecord.InsideNo := Table.FieldAsInt(4);

      if not Table.FieldIsNull(5) then
      begin
        BookRecord.SeriesID := Table.FieldAsInt(5);
        BookRecord.Series := GetSeriesTitle(BookRecord.SeriesID);
        BookRecord.SeqNumber := Table.FieldAsInt(6);
      end;
      BookRecord.Code := Table.FieldAsInt(7);
      BookRecord.Size := Table.FieldAsInt(8);
      BookRecord.LibID := Table.FieldAsInt(9);
      BookRecord.IsDeleted := Table.FieldAsBoolean(10);
      BookRecord.IsLocal := Table.FieldAsBoolean(11);
      BookRecord.Date := Table.FieldAsDateTime(12);
      BookRecord.Lang := Table.FieldAsString(13);
      BookRecord.LibRate := Table.FieldAsInt(14);
      BookRecord.KeyWords := Table.FieldAsString(15);
      BookRecord.NodeType := ntBookInfo;
      BookRecord.Rate := Table.FieldAsInt(16);
      BookRecord.Progress := Table.FieldAsInt(17);
      BookRecord.CollectionRoot := DMUser.ActiveCollectionInfo.RootPath;
      BookRecord.CollectionName := DMUser.ActiveCollectionInfo.Name;

      GetBookGenres(BookRecord.BookKey.BookID, BookRecord.Genres, @(BookRecord.RootGenre));
      GetBookAuthors(BookRecord.BookKey.BookID, BookRecord.Authors);

      if LoadMemos then
      begin
        // TODO - rethink when to load the memo fields.
        //
        BookRecord.Review := Table.FieldAsBlobString(18);
        BookRecord.Annotation := Table.FieldAsBlobString(19);
      end;
    finally
      FreeAndNil(Table);
    end;
  end
  else
    DMUser.GetBookRecord(BookKey, BookRecord);
end;

procedure TBookCollection_SQLite.DeleteBook(const BookKey: TBookKey);
const
  SQL_DELETE_GENRELIST = 'DELETE FROM Genre_List WHERE BookID = :v0 ';
  SQL_DELETE_AUTHORLIST = 'DELETE FROM Author_List WHERE BookID = :v0 ';
  SQL_DELETE_SERIES = 'DELETE FROM Series WHERE SeriesID in ' +
    '(SELECT b.SeriesID FROM Books b WHERE b.BookID = :v0 AND b.SeriesID <> :v1 GROUP BY b.SeriesID HAVING COUNT(*) <= 1) ';
  SQL_DELETE_AUTHORS = 'DELETE FROM Authors WHERE NOT AuthorID in (SELECT DISTINCT al.AuthorID FROM Author_List al) ';
  SQL_DELETE_BOOKS = 'DELETE FROM Books WHERE BookID = :v0 ';

var
  Logger: IIntervalLogger;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  Logger := GetIntervalLogger('DeleteBook', SQL_DELETE_GENRELIST);
  FDatabase.ParamsClear;
  FDatabase.AddParamInt(':v0', BookKey.BookID);
  FDatabase.ExecSQL(SQL_DELETE_GENRELIST);

  Logger.Restart(SQL_DELETE_AUTHORLIST);
  FDatabase.ParamsClear;
  FDatabase.AddParamInt(':v0', BookKey.BookID);
  FDatabase.ExecSQL(SQL_DELETE_AUTHORLIST);

  Logger.Restart(SQL_DELETE_SERIES);
  FDatabase.ParamsClear;
  FDatabase.AddParamInt(':v0', BookKey.BookID);
  FDatabase.AddParamInt(':v1', NO_SERIE_ID);
  FDatabase.ExecSQL(SQL_DELETE_SERIES);

  Logger.Restart(SQL_DELETE_AUTHORS);
  FDatabase.ParamsClear;
  FDatabase.ExecSQL(SQL_DELETE_AUTHORS);

  Logger.Restart(SQL_DELETE_BOOKS);
  FDatabase.ParamsClear;
  FDatabase.AddParamInt(':v0', BookKey.BookID);
  FDatabase.ExecSQL(SQL_DELETE_BOOKS);
  Logger := nil;

  DMUser.DeleteBook(BookKey);
end;

function TBookCollection_SQLite.SetReview(const BookKey: TBookKey; const Review: string): Integer;
const
  SQL_UPDATE_BLOB = 'UPDATE Books SET Review = ? WHERE BookID = :v0 ';
var
  ValueStream: TStringStream;
  NewReview: string;
begin
  Result := 0;
  // TODO  SetReview


//  VerifyCurrentCollection(BookKey.DatabaseID);
//  Assert(FBooks.Active);
//
//  Result := 0;
//  NewReview := Trim(Review);
//
//  Result := 0;
//  if FBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
//  begin
//    FBooks.Edit;
//    try
//      if Review = '' then
//      begin
//        FBooksReview.Clear;
//        FBooksCode.Value := 0;
//      end
//      else
//      begin
//        FBooksReview.Value := Review;
//        FBooksCode.Value := 1;
//        Result := 1;
//      end;
//      FBooks.Post;
//    except
//      FBooks.Cancel;
//      raise ;
//    end;
//  end;
//
//  //
//  // Обновим информацию в группах
//  //
//  Result := Result or DMUser.SetReview(BookKey, NewReview);
//
//  // TODO
end;

function TBookCollection_SQLite.GetSeriesTitle(SeriesID: Integer): string;
const
  SQL = 'SELECT s.SeriesTitle FROM Series s WHERE s.SeriesID = :v0 ';
var
  Logger: IIntervalLogger;
begin
  Result := NO_SERIES_TITLE;

  if (NO_SERIE_ID <> SeriesID) then
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamInt(':v0', SeriesID);
    Logger := GetIntervalLogger('GetSeriesTitle', SQL);
    Result := FDatabase.GetTableString(SQL);
    Logger := nil;

    if Result = '' then
      Result := NO_SERIES_TITLE;
  end
end;

procedure TBookCollection_SQLite.BeginBulkOperation;
begin
  Assert(not FDatabase.InTransaction);

  FDatabase.Start('');
end;

procedure TBookCollection_SQLite.EndBulkOperation(Commit: Boolean = True);
begin
  Assert(FDatabase.InTransaction);

  if Commit then
    FDatabase.Commit('')
  else
    FDatabase.Rollback('');
end;

procedure TBookCollection_SQLite.CompactDatabase;
const
  SQL = 'VACUUM';
var
  Logger: IIntervalLogger;
begin
  FDatabase.ParamsClear;
  Logger := GetIntervalLogger('CompactDatabase', SQL);
  FDatabase.ExecSQL(SQL);
  Logger := nil;
end;

procedure TBookCollection_SQLite.RepairDatabase;
begin
  // Not supported for SQLite, skip
end;

// Clear contents of collection tables (except for Settings and Genres)
procedure TBookCollection_SQLite.TruncateTablesBeforeImport;
const
  SQL_TRUNCATE = 'DELETE FROM %s ';
  TABLE_NAMES: array [0 .. 4] of string = ('Author_List', 'Genre_List', 'Books', 'Authors', 'Series');
var
  TableName: string;
  Logger: IIntervalLogger;
begin
  Logger := nil;
  for TableName in TABLE_NAMES do
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamString(':v0', TableName);
    if not Assigned(Logger) then
      Logger := GetIntervalLogger('InsertBookGenres', SQL_TRUNCATE)
    else
      Logger.Restart(SQL_TRUNCATE);
    FDatabase.ExecSQL(Format(SQL_TRUNCATE, [TableName]));
  end;
end;

// Add book genres for the book specified by BookID
procedure TBookCollection_SQLite.InsertBookGenres(const BookID: Integer; const Genres: TBookGenres);
const
  SQL_INSERT = 'INSERT INTO Genre_List (BookID, GenreCode) ' +
    'SELECT :v0, :v1 ';
var
  Genre: TGenreData;
  Logger: IIntervalLogger;
begin
  for Genre in Genres do
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamInt(':v0', BookID);
    FDatabase.AddParamString(':v1', Genre.GenreCode);
    Logger := GetIntervalLogger('InsertBookGenres', SQL_INSERT);
    FDatabase.ExecSQL(SQL_INSERT);
    Logger := nil;
  end;
end;

procedure TBookCollection_SQLite.SetAnnotation(const BookKey: TBookKey; const Annotation: string);
const
  SQL_UPDATE_BLOB = 'UPDATE Books SET Annotation = ? WHERE BookID = :v0 ';
var
  ValueStream: TStringStream;
begin
  // TODO SetAnnotation

end;

function TBookCollection_SQLite.GenerateFullName(const LastName: string; const FirstName: string; const MiddleName: string): String;
begin
  Result := ToUpper(LastName + ';' + FirstName + ';' + MiddleName);
end;

end.
