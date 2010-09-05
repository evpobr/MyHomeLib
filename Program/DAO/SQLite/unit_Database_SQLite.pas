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
//    function Search(const SearchCriteria: TBookSearchCriteria; const LoadMemos: Boolean): IBookIterator; override;
//
//    //
//    //
//    //
//    function InsertBook(BookRecord: TBookRecord; const CheckFileName: Boolean; const FullCheck: Boolean): Integer; override;
    procedure GetBookRecord(const BookKey: TBookKey; out BookRecord: TBookRecord; const LoadMemos: Boolean); override;
//    procedure UpdateBook(const BookRecord: TBookRecord); override;
//    procedure DeleteBook(const BookKey: TBookKey); override;
//    procedure AddBookToGroup(const BookKey: TBookKey; const GroupID: Integer);
//
//    function GetLibID(const BookKey: TBookKey): string; override; // deprecated;
//    function GetReview(const BookKey: TBookKey): string; override;
//
//    function SetReview(const BookKey: TBookKey; const Review: string): Integer; override;
//    procedure SetProgress(const BookKey: TBookKey; const Progress: Integer); override;
//    procedure SetRate(const BookKey: TBookKey; const Rate: Integer); override;
//    procedure SetLocal(const BookKey: TBookKey; const AState: Boolean); override;
//    procedure SetFolder(const BookKey: TBookKey; const Folder: string); override;
//    procedure SetFileName(const BookKey: TBookKey; const FileName: string); override;
//    procedure SetSeriesID(const BookKey: TBookKey; const SeriesID: Integer); override;
//
//    procedure CleanBookGenres(const BookID: Integer); override;
//    procedure InsertBookGenres(const BookID: Integer; var Genres: TBookGenres); override;
//
//    function FindOrCreateSeries(const Title: string): Integer; override;
//    procedure SetSeriesTitle(const SeriesID: Integer; const NewTitle: string); override;
//    procedure ChangeBookSeriesID(const OldID: Integer; const NewID: Integer; const DatabaseID: Integer); override;
//
    procedure SetStringProperty(const PropID: Integer; const Value: string); override;
//    procedure SetIntProperty(const PropID: Integer; const Value: Integer);
//
//    procedure ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc); override;
//    procedure ExportUserData(data: TUserData); override;
//
//    function CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean; override;
//    function GetTopGenreAlias(const FB2Code: string): string; override;
//
//    //
//    // Bulk operation
//    //
//    procedure BeginBulkOperation; override;
//    procedure EndBulkOperation(Commit: Boolean = True); override;
//
//    procedure CompactDatabase; override;
//    procedure RepairDatabase; override;
//    procedure ReloadGenres(const FileName: string); override;
//    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer); override;
//
//    procedure TruncateTablesBeforeImport; override;

  protected
    procedure InsertGenreIfMissing(const GenreData: TGenreData); override;
    procedure GetGenre(const GenreCode: string; var Genre: TGenreData); override;

  strict private
    FDatabase: TSQLiteDatabase; // NOT THREAD-SAFE (query parameters are stored on the object)!

    procedure GetAuthor(AuthorID: Integer; var Author: TAuthorData);
    function GetSeriesTitle(SeriesID: Integer): string;
  end;

procedure CreateCollectionTables_SQLite(const DBCollectionFile: string; const GenresFileName: string);

implementation

uses
  SysUtils,
  Windows,
  Character,
  dm_user,
  DateUtils,
  unit_Consts,
  unit_Logger,
  unit_SearchUtils,
  unit_Settings,
  unit_Errors;

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
var
  pLogger: IIntervalLogger;
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollectionInfo.ID;
  FLoadMemos := LoadMemos;
  FCollection := Collection;

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
    BookID := FBooks.FieldAsInteger(0);
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
      FCollection.FDatabase.AddParamText(':GenreCode', FilterValue^.ValueString);
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

    bmSearch:
    begin
      Assert(not Assigned(FilterValue));
      PrepareSearchData(SearchCriteria);
    end
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
  SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';

  Logger := GetIntervalLogger('TBookIteratorImpl.PrepareData', SQLCount);
  FNumRecords := FCollection.FDatabase.GetTableValue(SQLCount);
  Logger := nil;

  Logger := GetIntervalLogger('TBookIteratorImpl.PrepareData', SQLRows);
  FBooks := FCollection.FDatabase.GetTable(SQLRows);
  Logger := nil;
end;

// Original code was extracted from TfrmMain.DoApplyFilter
procedure TBookCollection_SQLite.TBookIteratorImpl.PrepareSearchData(const SearchCriteria: TBookSearchCriteria);
var
  FilterString: string;
  SQLRows: string;
  SQLCount: string;
  Logger: IIntervalLogger;
const
  SQLStartStr = 'SELECT DISTINCT b.BookID ';
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
        FilterString := SQLStartStr +
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
        FilterString := SQLStartStr +
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
      FilterString := SQLStartStr +
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
        0: AddToFilter('b.UpdateDate', Format('> "%s"', [DateToStr(IncDay(Now, -1))]), False, FilterString);
        1: AddToFilter('b.UpdateDate', Format('> "%s"', [DateToStr(IncDay(Now, -3))]), False, FilterString);
        2: AddToFilter('b.UpdateDate', Format('> "%s"', [DateToStr(IncDay(Now, -7))]), False, FilterString);
        3: AddToFilter('b.UpdateDate', Format('> "%s"', [DateToStr(IncDay(Now, -14))]), False, FilterString);
        4: AddToFilter('b.UpdateDate', Format('> "%s"', [DateToStr(IncDay(Now, -30))]), False, FilterString);
        5: AddToFilter('b.UpdateDate', Format('> "%s"', [DateToStr(IncDay(Now, -90))]), False, FilterString);
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
      SQLRows := SQLRows + SQLStartStr + ' FROM Books b WHERE ' + FilterString;
    end;
  except
    on E: Exception do
      raise Exception.Create(rstrFilterParamError);
  end;

  if SQLRows = '' then
    raise Exception.Create(rstrCheckFilterParams);

  SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';

  Logger := GetIntervalLogger('TBookIteratorImpl.PrepareSearchData', SQLCount);
  FNumRecords := FCollection.FDatabase.GetTableValue(SQLCount);
  Logger := nil;

  Logger := GetIntervalLogger('TBookIteratorImpl.PrepareSearchData', SQLRows);
  FBooks := FCollection.FDatabase.GetTable(SQLRows);
  Logger := nil;
end;

{ TAuthorIteratorImpl }

constructor TBookCollection_SQLite.TAuthorIteratorImpl.Create(
  Collection: TBookCollection_SQLite;
  const Mode: TAuthorIteratorMode;
  const FilterValue: PFilterValue
);
var
  pLogger: IIntervalLogger;
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

    AuthorID := FAuthors.FieldAsInteger(0);
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
              '(POS(UPPER(SUBSTRING(a.LastName, 1, 1)), ":EN") = 0) AND (POS(UPPER(SUBSTRING(a.LastName, 1, 1)), ":RU") = 0)'
            );
            FCollection.FDatabase.AddParamText(':EN', ENGLISH_ALPHABET);
            FCollection.FDatabase.AddParamText(':RU', RUSSIAN_ALPHABET);
          end
          else if FCollection.AuthorFilterType <> ALPHA_FILTER_ALL then
          begin
            Assert(Length(FCollection.AuthorFilterType) = 1);
            Assert(TCharacter.IsUpper(FCollection.AuthorFilterType, 1));
            AddToWhere(Where,
              'UPPER(a.LastName) LIKE ":FilterType%"'  // начинается на заданную букву
            );
            FCollection.FDatabase.AddParamText(':FilterType', FCollection.AuthorFilterType);
          end;
        end;
      end;

    else
      Assert(False);
  end;

  SQLRows := SQLRows + Where;
  SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';

  Logger := GetIntervalLogger('TAuthorIteratorImpl.PrepareData', SQLCount);
  FNumRecords := FCollection.FDatabase.GetTableValue(SQLCount);
  Logger := nil;

  if Mode in [amAll, amFullFilter] then
    SQLRows := SQLRows + ' ORDER BY a.LastName, a.FirstName, a.MiddleName ';

  Logger := GetIntervalLogger('TAuthorIteratorImpl.PrepareData', SQLRows);
  FAuthors := FCollection.FDatabase.GetTable(SQLRows);
  Logger := nil;
end;

{ TGenreIteratorImpl }

constructor TBookCollection_SQLite.TGenreIteratorImpl.Create(Collection: TBookCollection_SQLite; const Mode: TGenreIteratorMode; const FilterValue: PFilterValue);
var
  pLogger: IIntervalLogger;
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

  Logger := GetIntervalLogger('TGenreIteratorImpl.PrepareData', SQLCount);
  FNumRecords := FCollection.FDatabase.GetTableValue(SQLCount);
  Logger := nil;

  Logger := GetIntervalLogger('TGenreIteratorImpl.PrepareData', SQLRows);
  FGenres := FCollection.FDatabase.GetTable(SQLRows);
  Logger := nil;
end;

{ TSeriesIteratorImpl }

constructor TBookCollection_SQLite.TSeriesIteratorImpl.Create(Collection: TBookCollection_SQLite; const Mode: TSeriesIteratorMode);
var
  pLogger: IIntervalLogger;
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
    SeriesData.SeriesID := FSeries.FieldAsInteger(0);
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
            '(POS(UPPER(SUBSTRING(s.SeriesTitle, 1, 1)), ":EN") = 0) AND (POS(UPPER(SUBSTRING(s.SeriesTitle, 1, 1)), ":RU") = 0)'
          );
          FCollection.FDatabase.AddParamText(':EN', ENGLISH_ALPHABET);
          FCollection.FDatabase.AddParamText(':RU', RUSSIAN_ALPHABET);
        end
        else if FCollection.SeriesFilterType <> ALPHA_FILTER_ALL then
        begin
          Assert(Length(FCollection.SeriesFilterType) = 1);
          Assert(TCharacter.IsUpper(FCollection.SeriesFilterType, 1));
          AddToWhere(Where,
            'UPPER(s.SeriesTitle) LIKE ":FilterType%"'   // начинается на заданную букву
          );
          FCollection.FDatabase.AddParamText(':FilterType', FCollection.SeriesFilterType);
        end;
      end;
    end
    else
      Assert(False);
  end;

  SQLRows := SQLRows + Where;
  SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';
  SQLRows := SQLRows + ' ORDER BY s.' + SERIES_TITLE_FIELD;

  Logger := GetIntervalLogger('TSeriesIteratorImpl.PrepareData', SQLCount);
  FNumRecords := FCollection.FDatabase.GetTableValue(SQLCount);
  Logger := nil;

  Logger := GetIntervalLogger('TSeriesIteratorImpl.PrepareData', SQLRows);
  FSeries := FCollection.FDatabase.GetTable(SQLRows);
  Logger := nil;
end;

//-----------------------------------------------------------------------------

{ TBookCollection_SQLite }

constructor TBookCollection_SQLite.Create(const DBCollectionFile: string);
begin
  inherited Create;

  FDatabase := TSQLiteDatabase.Create(DBCollectionFile);
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

procedure TBookCollection_SQLite.InsertGenreIfMissing(const GenreData: TGenreData);
const
  SQL_SELECT = 'SELECT COUNT(*) FROM Genres WHERE GenreCode = :v0';
  SQL_INSERT = 'INSERT INTO Genres (GenreCode, ParentCode, FB2Code, GenreAlias) ' +
    'SELECT :v0, :v1, :v2, :v3 ';
var
  Logger: IIntervalLogger;
  Count: Integer;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamText(':v0', GenreData.GenreCode);
  Logger := GetIntervalLogger('InsertGenreIfMissing', SQL_SELECT);
  Count := FDatabase.GetTableValue(SQL_SELECT);
  Logger := nil;

  if Count = 0 then // A new Genre
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamText(':v0', GenreData.GenreCode);
    FDatabase.AddParamText(':v1', GenreData.ParentCode);
    FDatabase.AddParamText(':v2', GenreData.FB2GenreCode);
    FDatabase.AddParamText(':v3', GenreData.GenreAlias);
    Logger := GetIntervalLogger('InsertGenreIfMissing', SQL_INSERT);
    FDatabase.ExecSQL(SQL_INSERT);
    Logger := nil;
  end;
end;

procedure TBookCollection_SQLite.GetGenre(const GenreCode: string; var Genre: TGenreData);
const
  SQL = 'SELECT ParentCode, FB2Code, GenreAlias FROM Genres WHERE GenreCode = :v0 ';
var
  Logger: IIntervalLogger;
  Table: TSQLiteTable;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamText(':v0', GenreCode);

  Logger := GetIntervalLogger('GetGenre', SQL);
  Table := FDatabase.GetTable(SQL);
  try
    Logger := nil;
    if not Table.Eof then
    begin
      Genre.GenreCode := GenreCode;
      Genre.ParentCode := Table.FieldAsString(0);
      Genre.FB2GenreCode := Table.FieldAsString(1);
      Genre.GenreAlias := Table.FieldAsString(2);
    end
    else
      Genre.Clear;
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
  SQL = 'SELECT LastName, FirstName, MiddleName FROM Authors WHERE AuthorID = :v0 ';
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

procedure TBookCollection_SQLite.GetBookRecord(const BookKey: TBookKey; out BookRecord: TBookRecord; const LoadMemos: Boolean);
const
  SQL = 'SELECT ' +
    'b.Title,     b.Folder,    b.FileName,   b.Ext,      b.InsideNo, ' +  // 0  .. 4
    'b.SeriesID,  b.SeqNumber, b.Code,       b.BookSize, b.LibID, ' +     // 5  .. 9
    'b.IsDeleted, b.IsLocal,   b.UpdateDate, b.Lang,     b.LibRate, ' +   // 10 .. 14
    'b.KeyWords,  b.Rate,      b.Progress,   b.Review,   b.Annotation ' + // 15 .. 19
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
    Logger := nil;
    Assert(not Table.Eof);

    BookRecord.BookKey := BookKey;
    BookRecord.Title := Table.FieldAsString(0);
    BookRecord.Folder := Table.FieldAsString(1);
    BookRecord.FileName := Table.FieldAsString(2);
    BookRecord.FileExt := Table.FieldAsString(3);
    BookRecord.InsideNo := Table.FieldAsInteger(4);

    if not Table.FieldIsNull(5) then
    begin
      BookRecord.SeriesID := Table.FieldAsInteger(5);
      BookRecord.Series := GetSeriesTitle(BookRecord.SeriesID);
      BookRecord.SeqNumber := Table.FieldAsInteger(6);
    end;
    BookRecord.Code := Table.FieldAsInteger(7);
    BookRecord.Size := Table.FieldAsInteger(8);
    BookRecord.LibID := Table.FieldAsInteger(9);
    BookRecord.IsDeleted := Table.FieldAsBoolean(10);
    BookRecord.IsLocal := Table.FieldAsBoolean(11);
    BookRecord.Date := Table.FieldAsDateTime(12);
    BookRecord.Lang := Table.FieldAsString(13);
    BookRecord.LibRate := Table.FieldAsInteger(14);
    BookRecord.KeyWords := Table.FieldAsString(15);
    BookRecord.NodeType := ntBookInfo;
    BookRecord.Rate := Table.FieldAsInteger(16);
    BookRecord.Progress := Table.FieldAsInteger(17);
    BookRecord.CollectionRoot := DMUser.ActiveCollectionInfo.RootPath;
    BookRecord.CollectionName := DMUser.ActiveCollectionInfo.Name;

    GetBookGenres(BookRecord.BookKey.BookID, BookRecord.Genres, @(BookRecord.RootGenre));
    GetBookAuthors(BookRecord.BookKey.BookID, BookRecord.Authors);

    if LoadMemos then
    begin
      // TODO - rethink when to load the memo fields.
      //
      BookRecord.Review := Table.FieldAsBlobText(18);
      BookRecord.Annotation := Table.FieldAsBlobText(19);
    end;
  end
  else
    DMUser.GetBookRecord(BookKey, BookRecord);
end;

function TBookCollection_SQLite.GetSeriesTitle(SeriesID: Integer): string;
const
  SQL = 'SELECT SeriesTitle FROM Series WHERE SeriesID = :v0 ';
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

end.
