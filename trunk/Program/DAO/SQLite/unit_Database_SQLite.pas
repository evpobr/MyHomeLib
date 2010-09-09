(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           eg
  *                     Nick Rymanov    nrymanov@gmail.com
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
      FBooks: TSQLiteQuery;
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
      FAuthors: TSQLiteQuery;
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
      FGenres: TSQLiteQuery;
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
      FSeries: TSQLiteQuery;
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
    // procedure UpdateBook(const BookRecord: TBookRecord); override;
    procedure DeleteBook(const BookKey: TBookKey); override;

    // function GetLibID(const BookKey: TBookKey): string; override; // deprecated;
    function GetReview(const BookKey: TBookKey): string; override;
    function SetReview(const BookKey: TBookKey; const Review: string): Integer; override;
    procedure SetProgress(const BookKey: TBookKey; const Progress: Integer); override;
    procedure SetRate(const BookKey: TBookKey; const Rate: Integer); override;
    procedure SetLocal(const BookKey: TBookKey; const AState: Boolean); override;
    procedure SetFolder(const BookKey: TBookKey; const Folder: string); override;
    procedure SetFileName(const BookKey: TBookKey; const FileName: string); override;
    // procedure SetSeriesID(const BookKey: TBookKey; const SeriesID: Integer); override;

    //
    // манипуляции с авторами книги
    //
    procedure CleanBookAuthors(const BookID: Integer); override;
    procedure InsertBookAuthors(const BookID: Integer; const Authors: TBookAuthors); override;

    //
    // манипуляции с жанрами книги
    //
    procedure CleanBookGenres(const BookID: Integer); override;
    procedure InsertBookGenres(const BookID: Integer; const Genres: TBookGenres); override;

    function FindOrCreateSeries(const Title: string): Integer; override;
    // procedure SetSeriesTitle(const SeriesID: Integer; const NewTitle: string); override;
    // procedure ChangeBookSeriesID(const OldID: Integer; const NewID: Integer; const DatabaseID: Integer); override;
    //
    procedure SetStringProperty(const PropID: Integer; const Value: string); override;

    procedure ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc); override;
    procedure ExportUserData(data: TUserData); override;

    function CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean; override;

    //
    // Bulk operation
    //
    procedure BeginBulkOperation; override;
    procedure EndBulkOperation(Commit: Boolean = True); override;

    procedure CompactDatabase; override;
    procedure RepairDatabase; override;
    // procedure ReloadGenres(const FileName: string); override;
    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer); override;

    procedure TruncateTablesBeforeImport; override;

  protected
    procedure InsertGenreIfMissing(const GenreData: TGenreData); override;
    procedure InternalLoadGenres;

  strict private
    FDatabase: TSQLiteDatabase; // NOT THREAD-SAFE (query parameters are stored on the object)!

    procedure InternalUpdateField(const BookID: Integer; const UpdateSQL: string; const NewValue: string);
    procedure GetAuthor(AuthorID: Integer; var Author: TAuthorData);
    function GetSeriesTitle(SeriesID: Integer): string;
    function InsertAuthorIfMissing(const Author: TAuthorData): Integer;
    function IsFileNameConflict(const BookRecord: TBookRecord; const IncludeFolder: Boolean): Boolean;
  end;

procedure CreateCollectionTables_SQLite(const DBCollectionFile: string; const GenresFileName: string);

implementation

uses
  SysUtils,
  Windows,
  Character,
  Generics.Collections,
  SQLite3,
  dm_user,
  DateUtils,
  Math,
  StrUtils,
  IOUtils,
  unit_Consts,
  unit_Logger,
  unit_SearchUtils,
  unit_Settings,
  unit_Errors;

const
  INIT_ROWS_ARR: array[0 .. 1] of Boolean = (False, True);
  ANNOTATION_SIZE_LIMIT = 4096;


// Read provided resource file as a string list (split by ';')
// This is done as ExecSQL works with only one statement at a time
function ReadResourceAsStringList(const ResourceName: string): TStringList;
var
  ResourceStream: TStream;
  Text: string;
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
    StrReplace('--', '@', Text);

    // Split by ';'
    Result.Clear;
    Result.StrictDelimiter := True; // so that spaces are ignored
    Result.Delimiter := '@';
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
  StructureDDL: string;
  BookCollection: TBookCollection;
begin
  ADatabase := TSQLiteDatabase.Create(DBCollectionFile);
  try
    StringList := ReadResourceAsStringList('CreateCollectionDB_SQLite');
    try
      for StructureDDL in StringList do
      begin
        if Trim(StructureDDL) <> '' then
          ADatabase.ExecSQL(StructureDDL);
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
    BookCollection.BeginBulkOperation;
    try
      // Fill metadata version and creation date:
      BookCollection.SetStringProperty(SETTING_VERSION, DATABASE_VERSION);
      BookCollection.SetStringProperty(SETTING_CREATION_DATE, FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now));

      // Fill the Genres table:
      BookCollection.LoadGenres(GenresFileName);

      BookCollection.EndBulkOperation(True);
    except
      BookCollection.EndBulkOperation(False);
      raise;
    end;
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
  query: TSQLiteQuery;

  procedure SetParams(query: TSQLiteQuery; const Mode: TBookIteratorMode);
  begin
    case Mode of
      bmByGenre:
      begin
        if isFB2Collection(DMUser.ActiveCollectionInfo.CollectionType) or not Settings.ShowSubGenreBooks then
          query.SetParam(':GenreCode', FilterValue^.ValueString)
        else
          query.SetParam(':GenreCode', FilterValue^.ValueString + '%');
      end;

      bmByAuthor:
      begin
        query.SetParam(':AuthorID', FilterValue^.ValueInt);
      end;

      bmBySeries:
      begin
        query.SetParam(':SeriesID', FilterValue^.ValueInt);
      end;
    end;

    if Mode in [bmByGenre, bmByAuthor, bmBySeries] then
    begin
      if FCollection.HideDeleted then
        query.SetParam(':IsDeleted', False);

      if FCollection.ShowLocalOnly then
        query.SetParam(':IsLocal', True);
    end;
  end;

begin
  Where := '';

  case Mode of
    bmAll:
    begin
      SQLRows := 'SELECT BookID FROM Books';
    end;

    bmByGenre:
    begin
      Assert(Assigned(FilterValue));
      SQLRows := 'SELECT b.BookID FROM Genre_List gl INNER JOIN Books b ON gl.BookID = b.BookID ';
      if isFB2Collection(DMUser.ActiveCollectionInfo.CollectionType) or not Settings.ShowSubGenreBooks then
        AddToWhere(Where, 'gl.GenreCode = :GenreCode')
      else
        AddToWhere(Where, 'gl.GenreCode LIKE :GenreCode');
    end;

    bmByAuthor:
    begin
      Assert(Assigned(FilterValue));
      SQLRows := 'SELECT b.BookID FROM Author_List al INNER JOIN Books b ON al.BookID = b.BookID ';
      AddToWhere(Where, 'al.AuthorID = :AuthorID ');
    end;

    bmBySeries:
    begin
      Assert(Assigned(FilterValue));
      SQLRows := 'SELECT b.BookID FROM Books b ';
      AddToWhere(Where, 'b.SeriesID = :SeriesID ');
    end;

    else
      Assert(False);
  end;

  if Mode in [bmByGenre, bmByAuthor, bmBySeries] then
  begin
    if FCollection.HideDeleted then
      AddToWhere(Where, ' b.IsDeleted = :IsDeleted');

    if FCollection.ShowLocalOnly then
      AddToWhere(Where, ' b.IsLocal = :IsLocal ');
  end;

  SQLRows := SQLRows + Where;
  SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';

  query := FCollection.FDatabase.NewQuery(SQLCount);
  try
    SetParams(query, Mode);
    query.Open;
    if query.Eof then
      FNumRecords := 0
    else
      FNumRecords := query.FieldAsInt(0);
  finally
    query.Free;
  end;

  FBooks := FCollection.FDatabase.NewQuery(SQLRows);
  try
    SetParams(FBooks, Mode);
    FBooks.Open;
  except
    FreeAndNil(FBooks);
    raise;
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
  InitRows: Boolean;
begin
  for InitRows in INIT_ROWS_ARR do
  begin
    SQLRows := '';

    try
      // ------------------------ авторы ----------------------------------------
      FilterString := '';
      if SearchCriteria.FullName <> '' then
      begin
        AddToFilter('a.SearchName ',
          PrepareQuery(SearchCriteria.FullName, True),
          False, FilterString);
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
        AddToFilter('s.SearchSeriesTitle', PrepareQuery(SearchCriteria.Series, True), False, FilterString);

        if FilterString <> '' then
        begin
          FilterString := SQL_START_STR +
            ' FROM Series s JOIN Books b ON b.SeriesID = s.SeriesID WHERE ' +
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
      AddToFilter('b.SearchAnnotation', PrepareQuery(SearchCriteria.Annotation, True), False, FilterString);
      AddToFilter('b.SearchTitle', PrepareQuery(SearchCriteria.Title, True), False, FilterString);
      AddToFilter('b.SearchFileName', PrepareQuery(SearchCriteria.FileName, True), False, FilterString);
      AddToFilter('b.SearchFolder', PrepareQuery(SearchCriteria.Folder, True), False, FilterString);
      AddToFilter('b.SearchExt', PrepareQuery(SearchCriteria.FileExt, True), False, FilterString);
      AddToFilter('b.SearchLang', PrepareQuery(SearchCriteria.Lang, True, False), False, FilterString);
      AddToFilter('b.SearchKeyWords', PrepareQuery(SearchCriteria.KeyWord, True), False, FilterString);
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
      FBooks := FCollection.FDatabase.NewQuery(SQLRows);
      FBooks.Open;
    end
    else
    begin
      SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';
      FNumRecords := FCollection.FDatabase.GetTableInt(SQLCount);
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
  FromList: string;
  Where: string;
  SQLRows: string;
  SQLCount: string;
  query: TSQLiteQuery;

  procedure SetParams(query: TSQLiteQuery; const Mode: TAuthorIteratorMode);
  begin
    case Mode of
      amByBook:
        begin
          query.SetParam(1, FilterValue^.ValueInt);
        end;

      amFullFilter:
        begin
          if FCollection.HideDeleted then
            query.SetParam(':IsDeleted', False);

          if FCollection.ShowLocalOnly then
            query.SetParam(':IsLocal', True);

          if
            (FCollection.AuthorFilterType <> '') and
            (FCollection.AuthorFilterType <> ALPHA_FILTER_ALL) and
            (FCollection.AuthorFilterType <> ALPHA_FILTER_NON_ALPHA)
          then
            query.SetParam(':FilterType', FCollection.AuthorFilterType + '%');
        end;
    end;
  end;

begin
  Where := '';

  case Mode of
    amAll:
      begin
        SQLRows := 'SELECT AuthorID FROM Authors ORDER BY LastName, FirstName, MiddleName';
        SQLCount := 'SELECT COUNT(*) FROM Authors';
      end;

    amByBook:
      begin
        Assert(Assigned(FilterValue));
        SQLRows := 'SELECT al.AuthorID FROM Author_List al INNER JOIN Authors a ON al.AuthorID = a.AuthorID WHERE BookID = :v0 ORDER BY a.LastName, a.FirstName, a.MiddleName ';
        SQLCount := 'SELECT COUNT(*) FROM Author_List WHERE BookID = :v0';
      end;

    amFullFilter:
      begin
        FromList := 'Author_List al ';
        if FCollection.HideDeleted or FCollection.ShowLocalOnly then
          FromList := FromList + 'INNER JOIN Books b ON al.BookID = b.BookID ';
        FromList := FromList + 'INNER JOIN Authors a ON a.AuthorID = al.AuthorID ';

        if FCollection.HideDeleted then
          AddToWhere(Where, ' b.IsDeleted = :IsDeleted ');

        if FCollection.ShowLocalOnly then
          AddToWhere(Where, ' b.IsLocal = :IsLocal ');

        if FCollection.AuthorFilterType = ALPHA_FILTER_NON_ALPHA then
        begin
          AddToWhere(Where,
            '(UPPER(SUBSTR(a.LastName, 1, 1)) NOT IN (' + ENGLISH_ALPHABET_SEPARATORS + ')) AND ' +
            '(UPPER(SUBSTR(a.LastName, 1, 1)) NOT IN (' + RUSSIAN_ALPHABET_SEPARATORS + '))'
          );
        end
        else if (FCollection.AuthorFilterType <> '') and (FCollection.AuthorFilterType <> ALPHA_FILTER_ALL) then
        begin
          Assert(Length(FCollection.AuthorFilterType) = 1);
          Assert(TCharacter.IsUpper(FCollection.AuthorFilterType, 1));
          AddToWhere(Where,
            'UPPER(a.LastName) LIKE :FilterType'  // начинается на заданную букву
          );
        end;

        SQLRows := 'SELECT DISTINCT al.AuthorID FROM ' + FromList + Where;
        SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';
        SQLRows := 'SELECT DISTINCT al.AuthorID FROM ' + FromList + Where + ' ORDER BY a.LastName, a.FirstName, a.MiddleName ';
      end;

    else
      Assert(False);
  end;

  query := FCollection.FDatabase.NewQuery(SQLCount);
  try
    SetParams(query, Mode);
    query.Open;
    if query.Eof then
      FNumRecords := 0
    else
      FNumRecords := query.FieldAsInt(0);
  finally
    query.Free;
  end;

  FAuthors := FCollection.FDatabase.NewQuery(SQLRows);
  try
    SetParams(FAuthors, Mode);
    FAuthors.Open;
  except
    FreeAndNil(FAuthors);
    raise;
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
  query: TSQLiteQuery;
begin
  case Mode of
    gmAll:
    begin
      SQLRows := 'SELECT GenreCode FROM Genres';
      SQLCount := 'SELECT COUNT(*) FROM Genres';
    end;

    gmByBook:
    begin
      Assert(Assigned(FilterValue));
      SQLRows := 'SELECT GenreCode FROM Genre_List WHERE BookID = :v0';
      SQLCount := 'SELECT COUNT(*) FROM Genre_List WHERE BookID = :v0';
    end;

    else
      Assert(False);
  end;

  query := FCollection.FDatabase.NewQuery(SQLCount);
  try
    if Mode = gmByBook then
      query.SetParam(1, FilterValue^.ValueInt);
    query.Open;
    if query.Eof then
      FNumRecords := 0
    else
      FNumRecords := query.FieldAsInt(0);
  finally
    query.Free;
  end;

  FGenres := FCollection.FDatabase.NewQuery(SQLRows);
  try
    if Mode = gmByBook then
      FGenres.SetParam(1, FilterValue^.ValueInt);
    FGenres.Open;
  except
    FreeAndNil(FGenres);
    raise;
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
  query: TSQLiteQuery;

  procedure SetParams(query: TSQLiteQuery; const Mode: TSeriesIteratorMode);
  begin
    if Mode = smFullFilter then
    begin
      if FCollection.HideDeleted then
        query.SetParam(':IsDeleted', False);

      if FCollection.ShowLocalOnly then
        query.SetParam(':IsLocal', True);

      if
        (FCollection.SeriesFilterType <> '') and
        (FCollection.SeriesFilterType <> ALPHA_FILTER_NON_ALPHA) and
        (FCollection.SeriesFilterType <> ALPHA_FILTER_ALL)
      then
        query.SetParam(':FilterType', FCollection.SeriesFilterType + '%');
    end;
  end;

begin
  Where := '';

  case Mode of
    smAll:
    begin
      SQLRows := 'SELECT SeriesID, SeriesTitle FROM Series ORDER BY SeriesTitle';
      SQLCount := 'SELECT COUNT(*) FROM Series';
    end;

    smFullFilter:
    begin
      SQLRows := 'SELECT DISTINCT s.SeriesID, s.SeriesTitle FROM Series s ';
      if FCollection.HideDeleted or FCollection.ShowLocalOnly then
      begin
        SQLRows := SQLRows + ' INNER JOIN Books b ON s.SeriesID = b.SeriesID ';
        if FCollection.HideDeleted then
          AddToWhere(Where, ' b.IsDeleted = :IsDeleted ');

        if FCollection.ShowLocalOnly then
          AddToWhere(Where, ' b.IsLocal = :IsLocal ');
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
        end;
      end;

      SQLRows := SQLRows + Where;
      SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';
      SQLRows := SQLRows + ' ORDER BY s.' + SERIES_TITLE_FIELD;
    end;

    else
      Assert(False);
  end;

  query := FCollection.FDatabase.NewQuery(SQLCount);
  try
    SetParams(query, Mode);
    query.Open;
    if query.Eof then
      FNumRecords := 0
    else
      FNumRecords := query.FieldAsInt(0);
  finally
    query.Free;
  end;

  FSeries := FCollection.FDatabase.NewQuery(SQLRows);
  try
    SetParams(FSeries, Mode);
    FSeries.Open;
  except
    FreeAndNil(FSeries);
    raise;
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
  SQL_DELETE = 'DELETE FROM Settings WHERE ID = ?';
  SQL_UPDATE = 'UPDATE Settings SET SettingValue = ? WHERE ID = ?';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(IfThen(Value = '', SQL_DELETE, SQL_UPDATE));
  try
    if Value = '' then
      query.SetParam(1, PropID)
    else
    begin
      query.SetBlobParam(1, Value);
      query.SetParam(2, PropID);
    end;

    query.ExecSQL;
  finally
    query.Free;
  end;
end;

procedure TBookCollection_SQLite.ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc);
var
  extra: TBookExtra;
  group: TBookGroup;
  groupBook: TGroupBook;
  Sql: string;
  query: TSQLiteQuery;
  BookKey: TBookKey;

  function GetBookKey(bookInfo: TBookInfo; out BookKey: TBookKey): Boolean;
  const
    SQL_BY_BOOKID = 'SELECT b.BookID FROM Books b WHERE b.BookID = ?';
    SQL_BY_LIBID = 'SELECT b.BookID FROM Books b WHERE b.LibID = ?';
  var
    query: TSQLiteQuery;
    BookID: Integer;
  begin
    query := FDatabase.NewQuery(IfThen(bookInfo.LibID = 0, SQL_BY_BOOKID, SQL_BY_LIBID));
    try
      query.SetParam(1, IfThen(bookInfo.LibID = 0, bookInfo.BookID, bookInfo.LibID));
      query.Open;
      if query.Eof then
        BookID := 0
      else
        BookID := query.FieldAsInt(0);
    finally
      query.Free;
    end;

    Result := BookID > 0;
    if Result then
    begin
      BookKey := CreateBookKey(BookID, DMUser.ActiveCollectionInfo.ID);
    end;
  end;

begin
  Assert(Assigned(data));
  Assert(Assigned(guiUpdateCallback));

  //
  // Заполним рейтинги, review и признак прочитанности
  //
  for extra in data.Extras do
  begin
    Sql := ''; //UPDATE Books SET
    if GetBookKey(extra, BookKey) then
    begin
      if extra.Rating <> 0 then
        Sql := 'Rate = :NewRate ';

      if extra.Progress <> 0 then
      begin
        if Sql <> '' then
          Sql := Sql + ', ';
        Sql := 'Progress = :NewProgress ';
      end;

      if Sql <> '' then
      begin
        Sql := 'UPDATE Books SET ' + Sql;

        query := FDatabase.NewQuery(Sql);
        try
          if extra.Rating <> 0 then
            query.SetParam(':NewRate', extra.Rating);

          if extra.Progress <> 0 then
            query.SetParam(':NewProgress', extra.Progress);

          query.ExecSQL;
        finally
          query.Free;
        end;
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
  query: TSQLiteQuery;
begin
  Assert(Assigned(data));

  query := FDatabase.NewQuery(SQL);
  try
    query.Open;
    while not query.Eof do
    begin
      data.Extras.AddExtra(
        query.FieldAsInt(0),        // BookID
        query.FieldAsInt(1),        // LibID
        query.FieldAsInt(2),        // Rate
        query.FieldAsInt(3),        // Progress
        query.FieldAsBlobString(4)  // Review
      );
    end;
  finally
    query.Free;
  end;
  DMUser.ExportUserData(data);
end;

function TBookCollection_SQLite.CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean;
const
  SQL_BY_FOLDER = 'SELECT 1 FROM Books b WHERE b.Folder = ?';
  SQL_BY_FILENAME = 'SELECT 1 FROM Books b WHERE b.FileName = ?';
var
  S: string;
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(IfThen(ZipFolder, SQL_BY_FOLDER, SQL_BY_FILENAME));
  try
    if ZipFolder then
      S := FileName
    else if FullNameSearch then
      S := ExtractFileName(FileName)
    else
      S := TPath.GetFileNameWithoutExtension(FileName);

    query.SetParam(1, s);

    query.Open;

    Result := not query.Eof;
  finally
    query.Free;
  end;
end;

function TBookCollection_SQLite.IsFileNameConflict(const BookRecord: TBookRecord; const IncludeFolder: Boolean): Boolean;
const
  SQL_SELECT_BY_FOLDER_AND_FILENAME = 'SELECT 1 FROM Books b WHERE b.FileName = ? AND b.Folder = ?';
  SQL_SELECT_BY_FILENAME = 'SELECT 1 FROM Books b WHERE b.FileName = ?';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(IfThen(IncludeFolder, SQL_SELECT_BY_FOLDER_AND_FILENAME, SQL_SELECT_BY_FILENAME));
  try
    query.SetParam(1, BookRecord.FileName);
    if IncludeFolder then
      query.SetParam(2, BookRecord.Folder);

    query.Open;

    Result := not query.Eof;
  finally
    query.Free;
  end;
end;

procedure TBookCollection_SQLite.InsertGenreIfMissing(const GenreData: TGenreData);
const
  SQL_INSERT = 'INSERT INTO Genres (GenreCode, ParentCode, FB2Code, GenreAlias) VALUES(?, ?, ?, ?)';
var
  insertQuery: TSQLiteQuery;
begin
  //
  // Если такой жанр уже существует => пропустим его
  //
  { TODO -oNickR : может стоит проверить и остальные поля? }
  if FGenreCache.HasGenre(GenreData.GenreCode) then
    Exit;

  insertQuery := FDatabase.NewQuery(SQL_INSERT);
  try
    insertQuery.SetParam(1, GenreData.GenreCode);
    insertQuery.SetParam(2, GenreData.ParentCode);
    insertQuery.SetParam(3, GenreData.FB2GenreCode);
    insertQuery.SetParam(4, GenreData.GenreAlias);
    insertQuery.ExecSQL;

    FGenreCache.Add(GenreData);
  finally
    insertQuery.Free;
  end;
end;

procedure TBookCollection_SQLite.InternalLoadGenres;
const
  SQL = 'SELECT GenreCode, ParentCode, FB2Code, GenreAlias FROM Genres';
var
  query: TSQLiteQuery;
  Genre: TGenreData;
begin
  FGenreCache.Clear;

  query := FDatabase.NewQuery(SQL);
  try
    query.Open;
    while not query.EOF do
    begin
      Genre.GenreCode := query.FieldAsString(0);
      Genre.ParentCode := query.FieldAsString(1);
      Genre.FB2GenreCode := query.FieldAsString(2);
      Genre.GenreAlias := query.FieldAsString(3);

      FGenreCache.Add(Genre);

      query.Next;
    end;
  finally
    FreeAndNil(query);
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
  SQL = 'SELECT LastName, FirstName, MiddleName FROM Authors WHERE AuthorID = ?';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL);
  try
    query.SetParam(1, AuthorID);
    query.Open;

    if not query.Eof then
    begin
      Author.AuthorID := AuthorID;
      Author.LastName := query.FieldAsString(0);
      Author.FirstName := query.FieldAsString(1);
      Author.MiddleName := query.FieldAsString(2);
    end
    else
      Author.Clear;
  finally
    FreeAndNil(query);
  end;
end;

// Insert an Author if the name combination doesn't exist
// Return AuthorID of the existing/added Author record
function TBookCollection_SQLite.InsertAuthorIfMissing(const Author: TAuthorData): Integer;
const
  SQL_SELECT = 'SELECT AuthorID FROM Authors WHERE LastName = ? AND FirstName = ? AND MiddleName = ?';
  SQL_INSERT = 'INSERT INTO Authors (LastName, FirstName, MiddleName) VALUES(?, ?, ?)';
var
  searchQuery: TSQLiteQuery;
  insertQuery: TSQLiteQuery;
begin
  searchQuery := FDatabase.NewQuery(SQL_SELECT);
  try
    searchQuery.SetParam(1, Author.LastName);
    searchQuery.SetParam(2, Author.FirstName);
    searchQuery.SetParam(3, Author.MiddleName);
    searchQuery.Open;

    if searchQuery.Eof then
    begin
      insertQuery := FDatabase.NewQuery(SQL_INSERT);
      try
        insertQuery.SetParam(1, Author.LastName);
        insertQuery.SetParam(2, Author.FirstName);
        insertQuery.SetParam(3, Author.MiddleName);
        insertQuery.ExecSQL;

        Result := FDatabase.LastInsertRowID;
      finally
        insertQuery.Free;
      end;
    end
    else
      Result := searchQuery.FieldAsInt(0);
  finally
    searchQuery.Free;
  end;
end;

function TBookCollection_SQLite.FindOrCreateSeries(const Title: string): Integer;
const
  SQL_SELECT = 'SELECT SeriesID FROM Series WHERE SeriesTitle = ?';
  SQL_INSERT = 'INSERT INTO Series (SeriesTitle) VALUES (?)';
var
  searchQuery: TSQLiteQuery;
  insertQuery: TSQLiteQuery;
  SearchExpr: string;
begin
  if NO_SERIES_TITLE = Title then
    Result := NO_SERIE_ID
  else
  begin
    SearchExpr := ToUpper(Trim(Title));

    searchQuery := FDatabase.NewQuery(SQL_SELECT);
    try
      searchQuery.SetParam(1, Title);
      searchQuery.Open;

      if searchQuery.Eof then
      begin
        insertQuery := FDatabase.NewQuery(SQL_INSERT);
        try
          insertQuery.SetParam(1, Title);
          insertQuery.ExecSQL;

          Result := FDatabase.LastInsertRowID;
        finally
          insertQuery.Free;
        end;
      end
      else
        Result := searchQuery.FieldAsInt(0);
    finally
      searchQuery.Free;
    end;
  end;
end;

function TBookCollection_SQLite.InsertBook(BookRecord: TBookRecord; const CheckFileName: Boolean; const FullCheck: Boolean): Integer;
const
  SQL_INSERT =
    'INSERT INTO Books (' +
    'Title,     Folder,    FileName,   Ext,      InsideNo, ' +  // 01 .. 05
    'SeriesID,  SeqNumber, Code,       BookSize, LibID, ' +     // 06 .. 10
    'IsDeleted, IsLocal,   UpdateDate, Lang,     LibRate, ' +   // 11 .. 15
    'KeyWords,  Rate,      Progress,   Review,   Annotation' +  // 16 .. 20
    ') ' +
    'VALUES (' +
    ':v01, :v02, :v03, :v04, :v05, ' +
    ':v06, :v07, :v08, :v09, :v10, ' +
    ':v11, :v12, :v13, :v14, :v15, ' +
    ':v16, :v17, :v18, :v19, :v20' +
    ')';
var
  i: Integer;
  NameConflict: Boolean;
  query: TSQLiteQuery;
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
      BookRecord.Genres[i] := FGenreCache.ByFB2Code[BookRecord.Genres[i].FB2GenreCode]
    else
      BookRecord.Genres[i] := FGenreCache[BookRecord.Genres[i].GenreCode];
  end;

  //
  // создадим отсутствующую серию
  //
  BookRecord.SeriesID := FindOrCreateSeries(BookRecord.Series);

  //
  // Собственно сохраним информацию о книге
  //
  NameConflict := CheckFileName and IsFileNameConflict(BookRecord, FullCheck);

  if not NameConflict then
  begin
    if BookRecord.SeqNumber > 5000 then
      BookRecord.SeqNumber := 0;

    BookRecord.Review := Trim(BookRecord.Review);
    BookRecord.Code := IfThen(BookRecord.Review = '', 0, 1);
    BookRecord.Annotation := LeftStr(Trim(BookRecord.Annotation), ANNOTATION_SIZE_LIMIT);

    query := FDatabase.NewQuery(SQL_INSERT);
    try
      query.SetParam(1, BookRecord.Title);
      query.SetParam(2, BookRecord.Folder);
      query.SetParam(3, BookRecord.FileName);
      query.SetParam(4, BookRecord.FileExt);
      query.SetParam(5, BookRecord.InsideNo);
      if NO_SERIE_ID <> BookRecord.SeriesID then
      begin
        query.SetParam(6, BookRecord.SeriesID);
        query.SetParam(7, BookRecord.SeqNumber);
      end
      else
      begin
        query.SetNullParam(6);
        query.SetNullParam(7);
      end;
      query.SetParam(8, BookRecord.Code);
      query.SetParam(9, BookRecord.Size);
      query.SetParam(10, BookRecord.LibID);
      query.SetParam(11, BookRecord.IsDeleted);
      query.SetParam(12, BookRecord.IsLocal);
      query.SetParam(13, BookRecord.Date);
      query.SetParam(14, BookRecord.Lang);
      query.SetParam(15, BookRecord.LibRate);
      query.SetParam(16, BookRecord.KeyWords);
      query.SetParam(17, BookRecord.Rate);
      query.SetParam(18, BookRecord.Progress);

      if BookRecord.Review = '' then
        query.SetNullParam(19)
      else
        query.SetBlobParam(19, BookRecord.Review);

      if BookRecord.Annotation = '' then
        query.SetNullParam(20)
      else
        query.SetParam(20, LeftStr(BookRecord.Annotation, ANNOTATION_SIZE_LIMIT));

      query.ExecSQL;

      BookRecord.BookKey.BookID := FDatabase.LastInsertRowID;
      BookRecord.BookKey.DatabaseID := DMUser.ActiveCollectionInfo.ID;
    finally
      query.Free;
    end;

    InsertBookGenres(BookRecord.BookKey.BookID, BookRecord.Genres);
    InsertBookAuthors(BookRecord.BookKey.BookID, BookRecord.Authors);

    Result := BookRecord.BookKey.BookID;
  end;
end;

procedure TBookCollection_SQLite.GetBookRecord(const BookKey: TBookKey; out BookRecord: TBookRecord; const LoadMemos: Boolean);
const
  SQL =
    'SELECT ' +
    'b.Title, b.Folder, b.FileName, b.Ext, b.InsideNo, ' +        // 0  .. 4
    'b.SeriesID, b.SeqNumber, b.Code, b.BookSize, b.LibID, ' +    // 5  .. 9
    'b.IsDeleted, b.IsLocal, b.UpdateDate, b.Lang, b.LibRate, ' + // 10 .. 14
    'b.KeyWords, b.Rate, b.Progress, b.Review, b.Annotation ' +   // 15 .. 19
    'FROM Books b ' +
    'WHERE BookID = ?';
var
  Table: TSQLiteQuery;
begin
  BookRecord.Clear;

  if BookKey.DatabaseID = DMUser.ActiveCollectionInfo.ID then
  begin
    Table := FDatabase.NewQuery(SQL);
    try
      Table.SetParam(1, BookKey.BookID);
      Table.Open;

      Assert(not Table.Eof);

      BookRecord.NodeType := ntBookInfo;
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
        BookRecord.Annotation := Table.FieldAsString(19);
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
  //
  // Предлагаю обойтись триггерами
  //

  //
  // TODO: BUG - мы никогда не записываем в SeriesID значение NO_SERIE_ID
  //

  SQL_DELETE_SERIES = 'DELETE FROM Series WHERE SeriesID in ' +
    '(SELECT b.SeriesID FROM Books b WHERE b.BookID = :v0 AND b.SeriesID <> :v1 GROUP BY b.SeriesID HAVING COUNT(*) <= 1) ';
  SQL_DELETE_AUTHORS = 'DELETE FROM Authors WHERE NOT AuthorID in (SELECT DISTINCT al.AuthorID FROM Author_List al) ';
  SQL_DELETE_BOOKS = 'DELETE FROM Books WHERE BookID = :v0 ';

var
  query: TSQLiteQuery;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  CleanBookGenres(BookKey.BookID);
  CleanBookAuthors(BookKey.BookID);

  query := FDatabase.NewQuery(SQL_DELETE_SERIES);
  try
    query.SetParam(1, BookKey.BookID);
    query.SetParam(2, NO_SERIE_ID);
    query.ExecSQL;
  finally
    query.Free;
  end;

  query := FDatabase.NewQuery(SQL_DELETE_AUTHORS);
  try
    query.ExecSQL;
  finally
    query.Free;
  end;

  query := FDatabase.NewQuery(SQL_DELETE_BOOKS);
  try
    query.SetParam(1, BookKey.BookID);
    query.ExecSQL;
  finally
    query.Free;
  end;

  DMUser.DeleteBook(BookKey);
end;

function TBookCollection_SQLite.GetReview(const BookKey: TBookKey): string;
const
  SQL = 'SELECT Review FROM Books WHERE BookID = ?';
var
  query: TSQLiteQuery;
begin
  if BookKey.DatabaseID = DMUser.ActiveCollectionInfo.ID then
  begin
    query := FDatabase.NewQuery(SQL);
    try
      query.SetParam(1, BookKey.BookID);
      query.Open;

      if not query.Eof then
        Result := query.FieldAsBlobString(0)
      else
        Result := '';
    finally
      query.Free;
    end;
  end
  else
    Result := DMUser.GetReview(BookKey);
end;

function TBookCollection_SQLite.SetReview(const BookKey: TBookKey; const Review: string): Integer;
const
  SQL_UPDATE = 'UPDATE Books SET Code = ?, Review = ? WHERE BookID = ?';
var
  NewReview: string;
  NewCode: Integer;
  query: TSQLiteQuery;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  NewReview := Trim(Review);
  NewCode := IfThen(NewReview = '', 0, 1);

  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(1, NewCode);
    if NewCode = 0 then
      query.SetNullParam(2)
    else
      query.SetBlobParam(2, NewReview);
    query.SetParam(3, BookKey.BookID);

    query.ExecSQL;
  finally
    query.Free;
  end;

  //
  // Обновим информацию в группах
  //
  Result := NewCode or DMUser.SetReview(BookKey, NewReview);
end;

procedure TBookCollection_SQLite.SetProgress(const BookKey: TBookKey; const Progress: Integer);
const
  SQL_UPDATE = 'UPDATE Books SET Progress = ? WHERE BookID = ?';
var
  query: TSQLiteQuery;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(1, Progress);
    query.SetParam(2, BookKey.BookID);

    query.ExecSQL;
  finally
    query.Free;
  end;

  //
  // Обновим информацию в группах
  //
  DMUser.SetProgress(BookKey, Progress);
end;

procedure TBookCollection_SQLite.SetRate(const BookKey: TBookKey; const Rate: Integer);
const
  SQL_UPDATE = 'UPDATE Books SET Rate = ? WHERE BookID = ?';
var
  query: TSQLiteQuery;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(1, Rate);
    query.SetParam(2, BookKey.BookID);

    query.ExecSQL;
  finally
    query.Free;
  end;

  //
  // Обновим информацию в группах
  //
  DMUser.SetRate(BookKey, Rate);
end;

procedure TBookCollection_SQLite.SetLocal(const BookKey: TBookKey; const AState: Boolean);
const
  SQL_UPDATE = 'UPDATE Books SET IsLocal = ? WHERE BookID = ?';
var
  query: TSQLiteQuery;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  query := FDatabase.NewQuery(SQL_UPDATE);
  try
    query.SetParam(1, AState);
    query.SetParam(2, BookKey.BookID);

    query.ExecSQL;
  finally
    query.Free;
  end;

  //
  // Обновим информацию в группах
  //
  DMUser.SetLocal(BookKey, AState);
end;

procedure TBookCollection_SQLite.InternalUpdateField(const BookID: Integer; const UpdateSQL: string; const NewValue: string);
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(UpdateSQL);
  try
    query.SetParam(1, NewValue);
    query.SetParam(2, BookID);

    query.ExecSQL;
  finally
    query.Free;
  end;
end;

procedure TBookCollection_SQLite.SetFolder(const BookKey: TBookKey; const Folder: string);
const
  SQL_UPDATE = 'UPDATE Books SET Folder = ? WHERE BookID = ?';
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  InternalUpdateField(BookKey.BookID, SQL_UPDATE, Folder);

  //
  // Обновим информацию в группах
  //
  DMUser.SetFolder(BookKey, Folder);
end;

procedure TBookCollection_SQLite.SetFileName(const BookKey: TBookKey; const FileName: string);
const
  SQL_UPDATE = 'UPDATE Books SET FileName = ? WHERE BookID = ?';
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  InternalUpdateField(BookKey.BookID, SQL_UPDATE, FileName);

  //
  // Обновим информацию в группах
  //
  DMUser.SetFileName(BookKey, FileName);
end;

function TBookCollection_SQLite.GetSeriesTitle(SeriesID: Integer): string;
const
  SQL = 'SELECT s.SeriesTitle FROM Series s WHERE s.SeriesID = ?';
var
  query: TSQLiteQuery;
begin
  Result := NO_SERIES_TITLE;

  if (NO_SERIE_ID <> SeriesID) then
  begin
    query := FDatabase.NewQuery(SQL);
    try
      query.SetParam(1, SeriesID);
      query.Open;

      if not query.Eof then
        Result := query.FieldAsString(0);
    finally
      query.Free;
    end;
  end
end;

procedure TBookCollection_SQLite.BeginBulkOperation;
begin
  Assert(not FDatabase.InTransaction);

  FDatabase.Start;
end;

procedure TBookCollection_SQLite.EndBulkOperation(Commit: Boolean = True);
begin
  Assert(FDatabase.InTransaction);

  if Commit then
    FDatabase.Commit
  else
    FDatabase.Rollback;
end;

procedure TBookCollection_SQLite.CompactDatabase;
const
  SQL = 'VACUUM';
begin
  FDatabase.ExecSQL(SQL);
end;

procedure TBookCollection_SQLite.RepairDatabase;
begin
  // Not supported for SQLite, skip
end;

procedure TBookCollection_SQLite.GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
const
  SQL_SELECT = 'SELECT COUNT(*) FROM %s ';
var
  Sql: string;
begin
  Sql := Format(SQL_SELECT, ['Authors']);
  AuthorsCount := FDatabase.GetTableInt(Sql);

  Sql := Format(SQL_SELECT, ['Books']);
  BooksCount := FDatabase.GetTableInt(Sql);

  Sql := Format(SQL_SELECT, ['Series']);
  SeriesCount := FDatabase.GetTableInt(Sql);
end;

// Clear contents of collection tables (except for Settings and Genres)
procedure TBookCollection_SQLite.TruncateTablesBeforeImport;
const
  SQL_TRUNCATE = 'DELETE FROM %s';
  TABLE_NAMES: array [0 .. 4] of string = ('Author_List', 'Genre_List', 'Books', 'Authors', 'Series');
var
  TableName: string;
begin
  for TableName in TABLE_NAMES do
    FDatabase.ExecSQL(Format(SQL_TRUNCATE, [TableName]));
end;

procedure TBookCollection_SQLite.CleanBookAuthors(const BookID: Integer);
const
  SQL_DELETE = 'DELETE FROM Author_List WHERE BookID = ?';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_DELETE);
  try
    query.SetParam(1, BookID);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

procedure TBookCollection_SQLite.InsertBookAuthors(const BookID: Integer; const Authors: TBookAuthors);
const
  SQL_INSERT = 'INSERT INTO Author_List (AuthorID, BookID) VALUES(?, ?)';
var
  insertedIds: TList<Integer>;
  query: TSQLiteQuery;
  Author: TAuthorData;
begin
  insertedIds := TList<Integer>.Create;
  try
    query := FDatabase.NewQuery(SQL_INSERT);
    try
      for Author in Authors do
      begin
        if -1 = insertedIds.IndexOf(Author.AuthorID) then
        begin
            query.SetParam(1, Author.AuthorID);
            query.SetParam(2, BookID);
            query.ExecSQL;
            insertedIds.Add(Author.AuthorID);
        end;
      end;
    finally
      query.Free;
    end;
  finally
    insertedIds.Free;
  end;
end;

procedure TBookCollection_SQLite.CleanBookGenres(const BookID: Integer);
const
  SQL_DELETE = 'DELETE FROM Genre_List WHERE BookID = ?';
var
  query: TSQLiteQuery;
begin
  query := FDatabase.NewQuery(SQL_DELETE);
  try
    query.SetParam(1, BookID);
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

// Add book genres for the book specified by BookID
procedure TBookCollection_SQLite.InsertBookGenres(const BookID: Integer; const Genres: TBookGenres);
const
  SQL_INSERT = 'INSERT INTO Genre_List (BookID, GenreCode) VALUES(?, ?)';
var
  insertedCodes: TList<string>;
  Genre: TGenreData;
  query: TSQLiteQuery;
begin
  insertedCodes := TList<string>.Create;
  try
    query := FDatabase.NewQuery(SQL_INSERT);
    try
      for Genre in Genres do
      begin
        if -1 = insertedCodes.IndexOf(Genre.GenreCode) then
        begin
          query.SetParam(1, BookID);
          query.SetParam(2, Genre.GenreCode);
          query.ExecSQL;
          insertedCodes.Add(Genre.GenreCode);
        end;
      end;
    finally
      query.Free;
    end;
  finally
    insertedCodes.Free;
  end;
end;

end.

