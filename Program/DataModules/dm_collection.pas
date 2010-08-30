(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors             Aleksey Penkov   alex.penkov@gmail.com
  *                     Nick Rymanov     nrymanov@gmail.com
  * Created             30.06.2010
  * Description
  *
  * $Id$
  *
  * History
  * NickR 02.03.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit dm_collection;

interface

uses
  Classes,
  ABSMain,
  DB,
  unit_Globals,
  UserData;

type

  TDMCollection = class(TDataModule)
    DBCollection: TABSDatabase;

    AllBooks: TABSTable;
    AllBooksBookID: TAutoIncField;
    AllBooksLibID: TIntegerField;
    AllBooksTitle: TWideStringField;
    AllBooksSeriesID: TIntegerField;
    AllBooksSeqNumber: TSmallintField;
    AllBooksDate: TDateField;
    AllBooksLibRate: TIntegerField;
    AllBooksLang: TWideStringField;
    AllBooksFolder: TWideStringField;
    AllBooksFileName: TWideStringField;
    AllBooksInsideNo: TIntegerField;
    AllBooksExt: TWideStringField;
    AllBooksSize: TIntegerField;
    AllBooksCode: TSmallintField;
    AllBooksLocal: TBooleanField;
    AllBooksDeleted: TBooleanField;
    AllBooksKeyWords: TWideStringField;
    AllBooksRate: TIntegerField;
    AllBooksProgress: TIntegerField;
    AllBooksAnnotation: TWideMemoField;
    AllBooksReview: TWideMemoField;

    AllAuthors: TABSTable;
    AllAuthorsAuthorID: TAutoIncField;
    AllAuthorsLastName: TWideStringField;
    AllAuthorsFirstName: TWideStringField;
    AllAuthorsMiddleName: TWideStringField;

    AllSeries: TABSTable;
    AllSeriesSeriesID: TAutoIncField;
    AllSeriesSeriesTitle: TWideStringField;

    AllGenres: TABSTable;
    AllGenresGenreCode: TWideStringField;
    AllGenresParentCode: TWideStringField;
    AllGenresFB2Code: TWideStringField;
    AllGenresAlias: TWideStringField;

    procedure DataModuleCreate(Sender: TObject);

  strict private
  type
    TBookIteratorImpl = class(TInterfacedObject, IBookIterator)
    public
      constructor Create(
        Collection: TDMCollection;
        const Mode: TBookIteratorMode;
        const LoadMemos: Boolean;
        const Filter: string;
        const SearchCriteria: TBookSearchCriteria
      );
      destructor Destroy; override;

    protected
      //
      // IBookIterator
      //
      function Next(out BookRecord: TBookRecord): Boolean;
      function GetNumRecords: Integer;

    strict private
      FCollection: TDMCollection;
      FBooks: TABSQuery;
      FBookID: TIntegerField;

      FCollectionID: Integer; // Active collection's ID at the time the iterator was created
      FLoadMemos: Boolean;

      function CreateSQL(const Mode: TBookIteratorMode; const Filter: string; const SearchCriteria: TBookSearchCriteria): string;
      function CreateSearchSQL(const SearchCriteria: TBookSearchCriteria): string;
    end;
    // << TBookIteratorImpl

    TAuthorIteratorImpl = class(TInterfacedObject, IAuthorIterator)
    public
      constructor Create(
        Collection: TDMCollection;
        const Mode: TAuthorIteratorMode;
        const Filter: string
      );
      destructor Destroy; override;

    protected
      //
      // IAuthorIterator
      //
      function Next(out AuthorData: TAuthorData): Boolean;
      function GetNumRecords: Integer;

    strict private
      FCollection: TDMCollection;
      FAuthors: TABSQuery;
      FAuthorID: TIntegerField;
      FCollectionID: Integer; // Active collection's ID at the time the iterator was created

      function CreateSQL(const Mode: TAuthorIteratorMode; const Filter: string): string;
    end;
    // << TAuthorIteratorImpl


    TGenreIteratorImpl = class(TInterfacedObject, IGenreIterator)
    public
      constructor Create(Collection: TDMCollection; const Mode: TGenreIteratorMode; const Filter: string);
      destructor Destroy; override;

    protected
      //
      // IGenreIterator
      //
      function Next(out GenreData: TGenreData): Boolean;
      function GetNumRecords: Integer;

    strict private
      FCollection: TDMCollection;
      FGenres: TABSQuery;
      FGenreCode: TWideStringField;
      FCollectionID: Integer; // Active collection's ID at the time the iterator was created

      function CreateSQL(const Mode: TGenreIteratorMode; const Filter: string): string;
    end;
    // << TGenreIteratorImpl

    TSeriesIteratorImpl = class(TInterfacedObject, ISeriesIterator)
    public
      constructor Create(Collection: TDMCollection; const Mode: TSeriesIteratorMode; const Filter: string);
      destructor Destroy; override;

    protected
      //
      // ISeriesIterator
      //
      function Next(out SeriesData: TSeriesData): Boolean;
      function GetNumRecords: Integer;

    strict private
      FCollection: TDMCollection;
      FSeries: TABSQuery;
      FSeriesID: TIntegerField;
      FSeriesTitle: TWideStringField;
      FCollectionID: Integer; // Active collection's ID at the time the iterator was created

      function CreateSQL(const Mode: TSeriesIteratorMode; const Filter: string): string;
    end;
    // << TSeriesIteratorImpl

  strict private
    FAuthorFilterType: string;
    FSeriesFilterType: string;
    FShowLocalOnly: Boolean;
    FHideDeleted: Boolean;

  private type
    TUpdateExtraProc = reference to procedure;

  public type
    TGUIUpdateExtraProc = reference to procedure(
      const BookKey: TBookKey;
      extra: TBookExtra
    );

  strict private
    procedure GetAuthor(AuthorID: Integer; var Author: TAuthorData);
    procedure GetBookAuthors(BookID: Integer; var BookAuthors: TBookAuthors);

    function GetSeriesTitle(SeriesID: Integer): string;

    procedure GetGenre(const GenreCode: string; var Genre: TGenreData);
    procedure GetBookGenres(BookID: Integer; var BookGenres: TBookGenres; RootGenre: PGenreData = nil); overload;

  public
    // TDownloader.DoDownload
    procedure GetBookLibID(const BookKey: TBookKey; out ARes: string); deprecated;

    procedure SetTableState(State: Boolean);

  public
    //
    // новые методы, учитывающие DatabaseID
    //

    //
    // Получение полной информации о книге
    //
    procedure GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord; LoadMemos: Boolean);

    //
    // Обновление полей
    //
    procedure SetLocal(const BookKey: TBookKey; AState: Boolean);
    procedure SetFileName(const BookKey: TBookKey; const FileName: string);
    procedure SetFolder(const BookKey: TBookKey; const Folder: string);
    procedure SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer);
    procedure SetRate(const BookKey: TBookKey; Rate: Integer);
    procedure SetProgress(const BookKey: TBookKey; Progress: Integer);

    //
    // NOTE: Эти методы сейчас не используются.
    //
    function GetAnnotation(const BookKey: TBookKey): string;
    procedure SetAnnotation(const BookKey: TBookKey; const Annotation: string);

    function GetReview(const BookKey: TBookKey): string;
    function SetReview(const BookKey: TBookKey; const Review: string): Integer;

    //
    // Полностью обновляет информацию о книге с сохранением BookID
    //
    procedure UpdateBook(const BookRecord: TBookRecord);

    //
    // Работа с группами
    //
    procedure AddBookToGroup(const BookKey: TBookKey; GroupID: Integer);

    //
    // Статистика по текущей коллекции
    //
    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);

    //
    // Получение и установка свойств коллекции
    //
    //procedure SetProperty(PropID: string; const Value: string); overload;
    //procedure SetProperty(PropID: string; Value: Integer); overload;
    //procedure SetProperty(PropID: string; const Value: TStrings); overload;
    //procedure GetProperty(PropID: string; var Value: string); overload;
    //procedure GetProperty(PropID: string; var Value: Integer); overload;
    //procedure GetProperty(PropID: string; var Value: TStrings); overload;

    //
    // Установка фильтров
    //
    property AuthorFilterType: string read FAuthorFilterType write FAuthorFilterType;
    property SeriesFilterType: string read FSeriesFilterType write FSeriesFilterType;
    property ShowLocalOnly: Boolean read FShowLocalOnly write FShowLocalOnly;
    property HideDeleted: Boolean read FHideDeleted write FHideDeleted;

    //
    // Пользовательские данные
    //
    procedure ExportUserData(data: TUserData);
    procedure ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc);

    // Batch update methods:
    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer);

    function AddOrLocateSeriesIDBySeriesTitle(const SeriesTitle: string): Integer;
    procedure SetSeriesTitle(const SeriesID: Integer; const NewSeriesTitle: string);

    procedure VerifyCurrentCollection(const DatabaseID: Integer);
    function GetTotalNumBooks: Integer;

    // Iterators:
    function GetBookIterator(const Mode: TBookIteratorMode; const LoadMemos: Boolean; const Filter: string = ''): IBookIterator; overload;
    function GetBookIterator(const LoadMemos: Boolean; const SearchCriteria: TBookSearchCriteria): IBookIterator; overload;
    function GetAuthorIterator(const Mode: TAuthorIteratorMode; const Filter: string = ''): IAuthorIterator;
    function GetGenreIterator(const Mode: TGenreIteratorMode; const Filter: string = ''): IGenreIterator;
    function GetSeriesIterator(const Mode: TSeriesIteratorMode; const Filter: string = ''): ISeriesIterator;
  end;

var
  DMCollection: TDMCollection;

implementation

uses
  Windows,
  Forms,
  SysUtils,
  StrUtils,
  IOUtils,
  Variants,
  Character,
  DateUtils,
  dm_user,
  unit_Consts,
  unit_Messages,
  unit_Helpers,
  unit_Errors,
  unit_SearchUtils,
  unit_Settings;

{$R *.dfm}

{ TBookIteratorImpl }

constructor TDMCollection.TBookIteratorImpl.Create(
  Collection: TDMCollection;
  const Mode: TBookIteratorMode;
  const LoadMemos: Boolean;
  const Filter: string;
  const SearchCriteria: TBookSearchCriteria
);
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollection.ID;
  FLoadMemos := LoadMemos;
  FCollection := Collection;

  FBooks := TABSQuery.Create(FCollection.DBCollection);
  FBooks.DatabaseName := FCollection.DBCollection.DatabaseName;
  FBooks.SQL.Text := CreateSQL(Mode, Filter, SearchCriteria);
  Log('TBookIteratorImpl >> ' + FBooks.SQL.Text);
  FBooks.ReadOnly := True;
  FBooks.RequestLive := True;
  FBooks.Active := True;
  Log('TBookIteratorImpl done');

  FBookID := FBooks.FieldByName(BOOK_ID_FIELD) as TIntegerField;
end;

destructor TDMCollection.TBookIteratorImpl.Destroy;
begin
  FreeAndNil(FBooks);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TDMCollection.TBookIteratorImpl.Next(out BookRecord: TBookRecord): Boolean;
begin
  Result := not FBooks.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollection.ID = FCollectionID); // shouldn't happen
    FCollection.GetBookRecord(CreateBookKey(FBookID.Value, FCollectionID), BookRecord, FLoadMemos);
    FBooks.Next;
  end;
end;

function TDMCollection.TBookIteratorImpl.GetNumRecords: Integer;
begin
  Result := FBooks.RecordCount;
end;

function TDMCollection.TBookIteratorImpl.CreateSQL(
  const Mode: TBookIteratorMode;
  const Filter: string;
  const SearchCriteria: TBookSearchCriteria
): string;
var
  Where: string;
begin
  Where := '';

  case Mode of
    bmAll:
      Result := 'SELECT b.' + BOOK_ID_FIELD + ' FROM Books';
    bmByGenre:
      Result :=
        'SELECT b.' + BOOK_ID_FIELD + ' FROM Genre_List gl INNER JOIN Books b ON gl.' + BOOK_ID_FIELD + ' = b.' + BOOK_ID_FIELD + ' ';
    bmByAuthor:
      Result :=
        'SELECT b.' + BOOK_ID_FIELD + ' FROM Author_List al INNER JOIN Books b ON al.' + BOOK_ID_FIELD + ' = b.' + BOOK_ID_FIELD + ' ';
    bmBySeries:
      Result :=
        'SELECT b.' + BOOK_ID_FIELD + ' FROM Books b ';
    bmSearch:
    begin
      Assert(Filter = '');
      Result := CreateSearchSQL(SearchCriteria);
    end
    else
      Assert(False);
  end;

  if Filter <> '' then
    AddToWhere(Where, Filter);

  if Mode in [bmByGenre, bmByAuthor, bmBySeries] then
  begin
    if FCollection.FHideDeleted then
      AddToWhere(Where, ' b.' + BOOK_DELETED_FIELD + ' = False ');
    if FCollection.FShowLocalOnly then
      AddToWhere(Where, ' b.' + BOOK_LOCAL_FIELD + ' = True ');
  end;

  Result := Result + Where;
  // + ' ORDER BY ' + BOOK_ID_FIELD; // Order fo result consistency
end;

// Original code was extracted from TfrmMain.DoApplyFilter
function TDMCollection.TBookIteratorImpl.CreateSearchSQL(const SearchCriteria: TBookSearchCriteria): string;
var
  FilterString: string;
const
  SQLStartStr = 'SELECT DISTINCT b.' + BOOK_ID_FIELD;
begin
  Result := '';
  try
    // ------------------------ авторы ----------------------------------------
    FilterString := '';
    if SearchCriteria.FullName <> '' then
    begin
      AddToFilter('a.' + AUTHOR_LASTTNAME_FIELD + ' + ' + 'CASE WHEN a.' +
          AUTHOR_FIRSTNAME_FIELD + ' IS NULL THEN '''' ELSE '' '' END + a.' +
          AUTHOR_FIRSTNAME_FIELD + ' + ' + 'CASE WHEN a.' +
          AUTHOR_MIDDLENAME_FIELD + ' IS NULL THEN '''' ELSE '' '' END + a.' +
          AUTHOR_MIDDLENAME_FIELD, PrepareQuery(SearchCriteria.FullName, True),
        True, FilterString);
      if FilterString <> '' then
      begin
        FilterString := SQLStartStr +
          ' FROM Authors a INNER JOIN Author_List b ON (a.' + AUTHOR_ID_FIELD + ' = b.' + AUTHOR_ID_FIELD + ') WHERE '
          + FilterString;

        Result := Result + FilterString;
      end;
    end;

    // ------------------------ серия -----------------------------------------
    FilterString := '';
    if SearchCriteria.Series <> '' then
    begin
      AddToFilter('s.' + SERIES_TITLE_FIELD, PrepareQuery(SearchCriteria.Series, True), True, FilterString);

      if FilterString <> '' then
      begin
        FilterString := SQLStartStr +
          ' FROM Series s JOIN Books b ON b.' + SERIES_ID_FIELD + ' = s.' + SERIES_ID_FIELD + ' WHERE ' +
          FilterString;

        if Result <> '' then
          Result := Result + ' INTERSECT ';

        Result := Result + FilterString;
      end;
    end;

    // -------------------------- жанр ----------------------------------------
    FilterString := '';
    if (SearchCriteria.Genre <> '') then
    begin
      FilterString := SQLStartStr +
        ' FROM Genre_List g JOIN Books b ON b.' + BOOK_ID_FIELD + ' = g.' + BOOK_ID_FIELD + ' WHERE (' +
        SearchCriteria.Genre + ')';

      if Result <> '' then
        Result := Result + ' INTERSECT ';

      Result := Result + FilterString;
    end;

    // -------------------  все остальное   -----------------------------------
    FilterString := '';
    AddToFilter('b.' + BOOK_ANNOTATION_FIELD, PrepareQuery(SearchCriteria.Annotation, True), True, FilterString);
    AddToFilter('b.' + BOOK_TITLE_FIELD, PrepareQuery(SearchCriteria.Title, True), True, FilterString);
    AddToFilter('b.' + BOOK_FILENAME_FIELD, PrepareQuery(SearchCriteria.FileName, False), False, FilterString);
    AddToFilter('b.' + BOOK_FOLDER_FIELD, PrepareQuery(SearchCriteria.Folder, False), False, FilterString);
    AddToFilter('b.' + BOOK_EXT_FIELD, PrepareQuery(SearchCriteria.FileExt, False), False, FilterString);
    AddToFilter('b.' + BOOK_LANG_FIELD, PrepareQuery(SearchCriteria.Lang, True, False), True, FilterString);
    AddToFilter('b.' + BOOK_KEYWORDS_FIELD, PrepareQuery(SearchCriteria.KeyWord, True), True, FilterString);
    //
    if SearchCriteria.DateIdx = -1 then
      AddToFilter('b.' + BOOK_DATE_FIELD, PrepareQuery(SearchCriteria.DateText, False), False, FilterString)
    else
      case SearchCriteria.DateIdx of
        0: AddToFilter('b.' + BOOK_DATE_FIELD, Format('> "%s"', [DateToStr(IncDay(Now, -1))]), False, FilterString);
        1: AddToFilter('b.' + BOOK_DATE_FIELD, Format('> "%s"', [DateToStr(IncDay(Now, -3))]), False, FilterString);
        2: AddToFilter('b.' + BOOK_DATE_FIELD, Format('> "%s"', [DateToStr(IncDay(Now, -7))]), False, FilterString);
        3: AddToFilter('b.' + BOOK_DATE_FIELD, Format('> "%s"', [DateToStr(IncDay(Now, -14))]), False, FilterString);
        4: AddToFilter('b.' + BOOK_DATE_FIELD, Format('> "%s"', [DateToStr(IncDay(Now, -30))]), False, FilterString);
        5: AddToFilter('b.' + BOOK_DATE_FIELD, Format('> "%s"', [DateToStr(IncDay(Now, -90))]), False, FilterString);
      end;

    case SearchCriteria.DownloadedIdx of
      1: AddToFilter('b.' + BOOK_LOCAL_FIELD, '= True', False, FilterString);
      2: AddToFilter('b.' + BOOK_LOCAL_FIELD, '= False', False, FilterString);
    end;

    if SearchCriteria.Deleted then
      AddToFilter('b.' + BOOK_DELETED_FIELD, '= False', False, FilterString);

    if FilterString <> '' then
    begin
      if Result <> '' then
        Result := Result + ' INTERSECT ';
      Result := Result + SQLStartStr + ' FROM Books b WHERE ' + FilterString;
    end;
  except
    on E: Exception do
      raise Exception.Create(rstrFilterParamError);
  end;

  if Result = '' then
    raise Exception.Create(rstrCheckFilterParams);
end;

{ TAuthorIteratorImpl }

constructor TDMCollection.TAuthorIteratorImpl.Create(
  Collection: TDMCollection;
  const Mode: TAuthorIteratorMode;
  const Filter: string
);
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollection.ID;
  FCollection := Collection;

  FAuthors := TABSQuery.Create(FCollection.DBCollection);
  FAuthors.DatabaseName := FCollection.DBCollection.DatabaseName;
  FAuthors.SQL.Text := CreateSQL(Mode, Filter);
  Log('TAuthorIteratorImpl >> ' + FAuthors.SQL.Text);
  FAuthors.ReadOnly := True;
  FAuthors.RequestLive := True;
  FAuthors.Active := True;
  Log('TAuthorIteratorImpl done ');

  FAuthorID := FAuthors.FieldByName(AUTHOR_ID_FIELD) as TIntegerField;
end;

destructor TDMCollection.TAuthorIteratorImpl.Destroy;
begin
  FreeAndNil(FAuthors);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TDMCollection.TAuthorIteratorImpl.Next(out AuthorData: TAuthorData): Boolean;
begin
  Result := not FAuthors.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollection.ID = FCollectionID); // shouldn't happen
    FCollection.GetAuthor(FAuthorID.Value, AuthorData);
    FAuthors.Next;
  end;
end;

function TDMCollection.TAuthorIteratorImpl.GetNumRecords: Integer;
begin
  Result := FAuthors.RecordCount;
end;

function TDMCollection.TAuthorIteratorImpl.CreateSQL(
  const Mode: TAuthorIteratorMode;
  const Filter: string
): string;
var
  Where: string;
begin
  Where := '';

  case Mode of
    amAll:
      Result := 'SELECT a.' + AUTHOR_ID_FIELD + ' FROM Authors a ';

    amByBook:
      Result := 'SELECT a.' + AUTHOR_ID_FIELD + ' FROM Author_List a ';

    amFullFilter:
      begin
        Result := 'SELECT DISTINCT a.' + AUTHOR_ID_FIELD + ' FROM Authors a ';
        if FCollection.FHideDeleted or FCollection.FShowLocalOnly then
        begin
          Result := Result + ' INNER JOIN Author_List al ON a.' + AUTHOR_ID_FIELD + ' = al.' + AUTHOR_ID_FIELD + ' INNER JOIN Books b ON al.' + BOOK_ID_FIELD + ' = b.' + BOOK_ID_FIELD + ' ';
          if FCollection.FHideDeleted then
            AddToWhere(Where, ' b.' + BOOK_DELETED_FIELD + ' = False ');
          if FCollection.FShowLocalOnly then
            AddToWhere(Where, ' b.' + BOOK_LOCAL_FIELD + ' = True ');
        end;

        // Add an author type filter:
        if FCollection.FAuthorFilterType <> '' then
        begin
          if FCollection.FAuthorFilterType = ALPHA_FILTER_NON_ALPHA then
          begin
            AddToWhere(Where, Format(
              '(POS(UPPER(SUBSTRING(a.%0:s, 1, 1)), "%1:s") = 0) AND (POS(UPPER(SUBSTRING(a.%0:s, 1, 1)), "%2:s") = 0)',
              [AUTHOR_LASTTNAME_FIELD, ENGLISH_ALPHABET, RUSSIAN_ALPHABET]
            ));
          end
          else if FCollection.FAuthorFilterType <> ALPHA_FILTER_ALL then
          begin
            Assert(Length(FCollection.FAuthorFilterType) = 1);
            Assert(TCharacter.IsUpper(FCollection.FAuthorFilterType, 1));
            AddToWhere(Where, Format(
              'UPPER(a.%0:s) LIKE "%1:s%%"',                                // начинается на заданную букву
              [AUTHOR_LASTTNAME_FIELD, FCollection.FAuthorFilterType]
            ));
          end;
        end;
      end;

    else
      Assert(False);
  end;

  if Filter <> '' then
    AddToWhere(Where, Filter);

  if Mode in [amAll, amFullFilter] then
    Result := Result + Where + ' ORDER BY a.' + AUTHOR_LASTTNAME_FIELD + ', a.' + AUTHOR_FIRSTNAME_FIELD + ', a.' + AUTHOR_MIDDLENAME_FIELD + ' ';
end;

{ TGenreIteratorImpl }

constructor TDMCollection.TGenreIteratorImpl.Create(Collection: TDMCollection; const Mode: TGenreIteratorMode; const Filter: string);
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollection.ID;
  FCollection := Collection;

  FGenres := TABSQuery.Create(FCollection.DBCollection);
  FGenres.DatabaseName := FCollection.DBCollection.DatabaseName;
  FGenres.SQL.Text := CreateSQL(Mode, Filter);
  Log('TGenreIteratorImpl >> ' + FGenres.SQL.Text);
  FGenres.ReadOnly := True;
  FGenres.RequestLive := True;
  FGenres.Active := True;
  Log('TGenreIteratorImpl done ');

  FGenreCode := FGenres.FieldByName(GENRE_CODE_FIELD) as TWideStringField;
end;

destructor TDMCollection.TGenreIteratorImpl.Destroy;
begin
  FreeAndNil(FGenres);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TDMCollection.TGenreIteratorImpl.Next(out GenreData: TGenreData): Boolean;
begin
  Result := not FGenres.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollection.ID = FCollectionID); // shouldn't happen
    FCollection.GetGenre(FGenreCode.Value, GenreData);
    FGenres.Next;
  end;
end;

function TDMCollection.TGenreIteratorImpl.GetNumRecords: Integer;
begin
  Result := FGenres.RecordCount;
end;

function TDMCollection.TGenreIteratorImpl.CreateSQL(const Mode: TGenreIteratorMode; const Filter: string): string;
var
  Where: string;
begin
  Where := '';

  case Mode of
    gmAll:
      Result := 'SELECT g.' + GENRE_CODE_FIELD + ' FROM Genres g ';
    gmByBook:
      Result := 'SELECT gl.' + GENRE_CODE_FIELD + ' FROM Genre_List gl ';
    else
      Assert(False);
  end;

  if Filter <> '' then
    AddToWhere(Where, Filter);
  Result := Result + Where;
end;

{ TSeriesIteratorImpl }

constructor TDMCollection.TSeriesIteratorImpl.Create(Collection: TDMCollection; const Mode: TSeriesIteratorMode; const Filter: string);
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollection.ID;
  FCollection := Collection;

  FSeries := TABSQuery.Create(FCollection.DBCollection);
  FSeries.DatabaseName := FCollection.DBCollection.DatabaseName;
  FSeries.SQL.Text := CreateSQL(Mode, Filter);
  Log('TSeriesIteratorImpl >> ' + FSeries.SQL.Text);
  FSeries.ReadOnly := True;
  FSeries.RequestLive := True;
  FSeries.Active := True;
  Log('TSeriesIteratorImpl done ');

  FSeriesID := FSeries.FieldByName(SERIES_ID_FIELD) as TIntegerField;
  FSeriesTitle := FSeries.FieldByName(SERIES_TITLE_FIELD) as TWideStringField;
end;

destructor TDMCollection.TSeriesIteratorImpl.Destroy;
begin
  FreeAndNil(FSeries);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TDMCollection.TSeriesIteratorImpl.Next(out SeriesData: TSeriesData): Boolean;
begin
  Result := not FSeries.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollection.ID = FCollectionID); // shouldn't happen
    SeriesData.SeriesID := FSeriesID.Value;
    SeriesData.SeriesTitle := FSeriesTitle.Value;
    FSeries.Next;
  end;
end;

function TDMCollection.TSeriesIteratorImpl.GetNumRecords: Integer;
begin
  Result := FSeries.RecordCount;
end;

function TDMCollection.TSeriesIteratorImpl.CreateSQL(const Mode: TSeriesIteratorMode; const Filter: string): string;
var
  Where: string;
begin
  Where := '';
  case Mode of
    smAll:
      Result := 'SELECT s.' + SERIES_ID_FIELD + ', s.' + SERIES_TITLE_FIELD + ' FROM Series s ';
    smFullFilter:
    begin
      Result := 'SELECT DISTINCT s.' + SERIES_ID_FIELD + ', s.' + SERIES_TITLE_FIELD + ' FROM Series s ';
      if FCollection.FHideDeleted or FCollection.FShowLocalOnly then
      begin
        Result := Result + ' INNER JOIN Books b ON s.' + SERIES_ID_FIELD + ' = b.' + SERIES_ID_FIELD + ' ';
        if FCollection.FHideDeleted then
          AddToWhere(Where, ' b.' + BOOK_DELETED_FIELD + ' = False ');
        if FCollection.FShowLocalOnly then
          AddToWhere(Where, ' b.' + BOOK_LOCAL_FIELD + ' = True ');
      end;

      // Series type filter
      if FCollection.FSeriesFilterType <> '' then
      begin
        if FCollection.FSeriesFilterType = ALPHA_FILTER_NON_ALPHA then
          AddToWhere(Where, Format(
            '(POS(UPPER(SUBSTRING(s.%0:s, 1, 1)), "%1:s") = 0) AND (POS(UPPER(SUBSTRING(s.%0:s, 1, 1)), "%2:s") = 0)',
            [SERIES_TITLE_FIELD, ENGLISH_ALPHABET, RUSSIAN_ALPHABET]
          ))
        else if FCollection.FSeriesFilterType <> ALPHA_FILTER_ALL then
        begin
          Assert(Length(FCollection.FSeriesFilterType) = 1);
          Assert(TCharacter.IsUpper(FCollection.FSeriesFilterType, 1));
          AddToWhere(Where, Format(
            'UPPER(s.%0:s) LIKE "%1:s%%"',                                // начинается на заданную букву
            [SERIES_TITLE_FIELD, FCollection.FSeriesFilterType]
          ));
        end;
      end;
    end
    else
      Assert(False);
  end;

  if Filter <> '' then
    AddToWhere(Where, Filter);
  Result := Result + Where;
  Result := Result + ' ORDER BY s.' + SERIES_TITLE_FIELD;
end;

{ TDMCollection }

procedure TDMCollection.GetBookLibID(const BookKey: TBookKey; out ARes: String);
begin
  if BookKey.DatabaseID = DMUser.ActiveCollection.ID then
  begin
    Assert(AllBooks.Active);

    if not AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
    begin
      Assert(False);
      Exit;
    end;

    ARes := AllBooksLibID.AsString;
  end
  else
    DMUser.GetBookLibID(BookKey, ARes);
end;

procedure TDMCollection.GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
begin
  (* ***************************************************************************
    *
    * Более предпочтительно использовать 3 простых запроса,
    * но пока оставим как есть
    *
    *************************************************************************** *)
  AuthorsCount := AllAuthors.RecordCount;
  BooksCount := AllBooks.RecordCount;
  SeriesCount := AllSeries.RecordCount;
end;

procedure TDMCollection.SetTableState(State: Boolean);
begin
  AllAuthors.Active := State;
  AllSeries.Active := State;
  AllBooks.Active := State;
  AllGenres.Active := State;
end;

// ============================================================================
//
// Новые методы
//
// ============================================================================

function TDMCollection.GetSeriesTitle(SeriesID: Integer): string;
begin
  if (NO_SERIE_ID <> SeriesID) and AllSeries.Locate(SERIES_ID_FIELD, SeriesID, []) then
    Result := AllSeriesSeriesTitle.Value
  else
    Result := NO_SERIES_TITLE;
end;

procedure TDMCollection.GetGenre(const GenreCode: string; var Genre: TGenreData);
begin
  Assert(AllGenres.Active);
  if AllGenres.Locate(GENRE_CODE_FIELD, GenreCode, []) then
  begin
    Genre.GenreCode := GenreCode;
    Genre.ParentCode := AllGenresParentCode.Value;
    Genre.FB2GenreCode := AllGenresFB2Code.Value;
    Genre.GenreAlias := AllGenresAlias.Value;
  end
  else
    Genre.Clear;
end;

procedure TDMCollection.GetAuthor(AuthorID: Integer; var Author: TAuthorData);
begin
  Assert(AllAuthors.Active);
  if AllAuthors.Locate(AUTHOR_ID_FIELD, AuthorID, []) then
  begin
    Author.AuthorID := AuthorID;
    Author.LastName := AllAuthorsLastName.Value;
    Author.FirstName := AllAuthorsFirstName.Value;
    Author.MiddleName := AllAuthorsMiddleName.Value;
  end
  else
    Author.Clear;
end;

procedure TDMCollection.GetBookAuthors(BookID: Integer; var BookAuthors: TBookAuthors);
var
  AuthorIterator: IAuthorIterator;
  i: Integer;
begin
  AuthorIterator := GetAuthorIterator(amByBook, Format('al.%s = %u', [BOOK_ID_FIELD, BookID]));
  SetLength(BookAuthors, AuthorIterator.GetNumRecords + 1); // an extra dummy element
  i := 0;
  while AuthorIterator.Next(BookAuthors[i]) do
    Inc(i);
  SetLength(BookAuthors, AuthorIterator.GetNumRecords); // remove the dummy element
end;

procedure TDMCollection.GetBookGenres(BookID: Integer; var BookGenres: TBookGenres; RootGenre: PGenreData = nil);
var
  i: Integer;
  GenreIterator: IGenreIterator;
  Genre: TGenreData;
begin
  GenreIterator := GetGenreIterator(gmByBook, Format('gl.%s = %d', [BOOK_ID_FIELD, BookID]));
  i := Length(BookGenres);
  while GenreIterator.Next(Genre) do
  begin
    SetLength(BookGenres, i + 1);
    BookGenres[i] := Genre;
    Inc(i);
  end;

  if Assigned(RootGenre) then
  begin
    if Length(BookGenres) > 0 then
      GetGenre(BookGenres[0].ParentCode, RootGenre^)
    else
      RootGenre^.Clear;
  end;
end;

procedure TDMCollection.GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord; LoadMemos: Boolean);
begin
  BookRecord.Clear;

  if BookKey.DatabaseID = DMUser.ActiveCollection.ID then
  begin
    Assert(AllBooks.Active);

    if not AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
    begin
      Assert(False);
      Exit;
    end;

    BookRecord.BookKey.BookID := AllBooksBookID.Value;
    BookRecord.BookKey.DatabaseID := DMUser.ActiveCollection.ID;
    BookRecord.Title := AllBooksTitle.Value;
    BookRecord.Folder := AllBooksFolder.Value;
    BookRecord.FileName := AllBooksFileName.Value;
    BookRecord.FileExt := AllBooksExt.Value;
    BookRecord.InsideNo := AllBooksInsideNo.Value;
    if not AllBooksSeriesID.IsNull then
    begin
      BookRecord.SeriesID := AllBooksSeriesID.Value;
      BookRecord.Series := GetSeriesTitle(AllBooksSeriesID.Value);
      BookRecord.SeqNumber := AllBooksSeqNumber.Value;
    end;
    BookRecord.Code := AllBooksCode.Value;
    BookRecord.Size := AllBooksSize.Value;
    BookRecord.LibID := AllBooksLibID.Value;
    BookRecord.Deleted := AllBooksDeleted.Value;
    BookRecord.Local := AllBooksLocal.Value;
    BookRecord.Date := AllBooksDate.Value;
    BookRecord.Lang := AllBooksLang.Value;
    BookRecord.LibRate := AllBooksLibRate.Value;
    BookRecord.KeyWords := AllBooksKeyWords.Value;
    BookRecord.NodeType := ntBookInfo;
    BookRecord.Rate := AllBooksRate.Value;
    BookRecord.Progress := AllBooksProgress.Value;
    BookRecord.CollectionRoot := DMUser.ActiveCollection.RootPath;
    BookRecord.CollectionName := DMUser.ActiveCollection.Name;

    GetBookGenres(BookRecord.BookKey.BookID, BookRecord.Genres, @(BookRecord.RootGenre));
    GetBookAuthors(BookRecord.BookKey.BookID, BookRecord.Authors);

    if LoadMemos then
    begin
      // TODO - rethink when to load the memo fields.
      //
      // Это поле нужно зачитывать только при копировании книги в другую коллекцию.
      // Во всех остальных случаях оно не используется.
      //
      BookRecord.Review := AllBooksReview.Value;
      BookRecord.Annotation := AllBooksAnnotation.Value;
    end;
  end
  else
    DMUser.GetBookRecord(BookKey, BookRecord);
end;

procedure TDMCollection.SetLocal(const BookKey: TBookKey; AState: Boolean);
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  if AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    AllBooks.Edit;
    try
      AllBooksLocal.Value := AState;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise ;
    end;
  end;

  DMUser.SetLocal(BookKey, AState);
end;

procedure TDMCollection.DataModuleCreate(Sender: TObject);
begin
  FShowLocalOnly := False;
  FHideDeleted := True;
end;

procedure TDMCollection.SetRate(const BookKey: TBookKey; Rate: Integer);
begin
  VerifyCurrentCollection(BookKey.DatabaseID);
  Assert(AllBooks.Active);

  if AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    AllBooks.Edit;
    try
      AllBooksRate.Value := Rate;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise ;
    end;
  end;

  //
  // Обновим информацию в группах
  //
  DMUser.SetRate(BookKey, Rate);
end;

procedure TDMCollection.SetProgress(const BookKey: TBookKey; Progress: Integer);
begin
  VerifyCurrentCollection(BookKey.DatabaseID);
  Assert(AllBooks.Active);

  if AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    AllBooks.Edit;
    try
      AllBooksProgress.Value := Progress;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise ;
    end;
  end;

  //
  // Обновим информацию в группах
  //
  DMUser.SetProgress(BookKey, Progress);
end;

procedure TDMCollection.SetFileName(const BookKey: TBookKey; const FileName: string);
begin
  VerifyCurrentCollection(BookKey.DatabaseID);
  Assert(AllBooks.Active);

  if AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    AllBooks.Edit;
    try
      AllBooksFileName.Value := FileName;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise ;
    end;
  end;

  // Обновим информацию в группах
  DMUser.SetFileName(BookKey, FileName);
end;

procedure TDMCollection.SetFolder(const BookKey: TBookKey; const Folder: string);
begin
  VerifyCurrentCollection(BookKey.DatabaseID);
  Assert(AllBooks.Active);

  if AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    AllBooks.Edit;
    try
      AllBooksFolder.Value := Folder;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise ;
    end;
  end;

  // Обновим информацию в группах
  DMUser.SetFolder(BookKey, Folder);
end;

procedure TDMCollection.SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer);
begin
  VerifyCurrentCollection(BookKey.DatabaseID);
  Assert(AllBooks.Active);

  AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []);
  AllBooks.Edit;
  try
    if NO_SERIE_ID = SeriesID then
      AllBooksSeriesID.Clear
    else
      AllBooksSeriesID.Value := SeriesID;
    AllBooks.Post;
  except
    AllBooks.Cancel;
    raise ;
  end;

  // Обновим информацию в группах
  DMUser.SetBookSeriesID(BookKey, SeriesID);
end;

function TDMCollection.GetAnnotation(const BookKey: TBookKey): string;
begin
  Assert(AllBooks.Active);

  if BookKey.DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
    begin
      Result := AllBooksAnnotation.Value;
    end;
  end
  else
    Result := DMUser.GetAnnotation(BookKey);
end;

procedure TDMCollection.SetAnnotation(const BookKey: TBookKey; const Annotation: string);
var
  NewAnnotation: string;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  NewAnnotation := Trim(Annotation);

  Assert(AllBooks.Active);
  if AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    AllBooks.Edit;
    try
      if Annotation = '' then
        AllBooksAnnotation.Clear
      else
        AllBooksAnnotation.Value := NewAnnotation;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise ;
    end;
  end;

  //
  // Обновим информацию в группах
  //
  DMUser.SetAnnotation(BookKey, NewAnnotation);
end;

function TDMCollection.GetReview(const BookKey: TBookKey): string;
begin
  if BookKey.DatabaseID = DMUser.ActiveCollection.ID then
  begin
    Assert(AllBooks.Active);
    if AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
      Result := AllBooksReview.Value
    else
      Result := '';
  end
  else
    Result := DMUser.GetReview(BookKey);
end;

function TDMCollection.SetReview(const BookKey: TBookKey; const Review: string): Integer;
var
  NewReview: string;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);
  Assert(AllBooks.Active);

  Result := 0;
  NewReview := Trim(Review);

  Result := 0;
  if AllBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    AllBooks.Edit;
    try
      if Review = '' then
      begin
        AllBooksReview.Clear;
        AllBooksCode.Value := 0;
      end
      else
      begin
        AllBooksReview.Value := Review;
        AllBooksCode.Value := 1;
        Result := 1;
      end;
      AllBooks.Post;
    except
      AllBooks.Cancel;
      raise ;
    end;
  end;

  //
  // Обновим информацию в группах
  //
  Result := Result or DMUser.SetReview(BookKey, NewReview);
end;

procedure TDMCollection.UpdateBook(const BookRecord: TBookRecord);
begin
  VerifyCurrentCollection(BookRecord.BookKey.DatabaseID);
  Assert(AllBooks.Active);

  if AllBooks.Locate(BOOK_ID_FIELD, BookRecord.BookKey.BookID, []) then
  begin

  end;

  DMUser.UpdateBook(BookRecord);
end;

procedure TDMCollection.AddBookToGroup(const BookKey: TBookKey; GroupID: Integer);
var
  BookRecord: TBookRecord;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);
  Assert(AllBooks.Active);

  GetBookRecord(BookKey, BookRecord, True);

  DMUser.AddBookToGroup(BookKey, GroupID, BookRecord);
end;

procedure TDMCollection.ExportUserData(data: TUserData);
begin
  Assert(Assigned(data));
  Assert(AllBooks.Active);

  AllBooks.First;
  while not AllBooks.Eof do
  begin
    if
      (AllBooksRate.Value <> 0) or
      (AllBooksProgress.Value <> 0) or
      (not AllBooksReview.IsNull)
    then
      data.Extras.AddExtra(
        AllBooksBookID.Value,
        AllBooksLibID.Value,
        AllBooksRate.Value,
        AllBooksProgress.Value,
        AllBooksReview.Value
      );

    AllBooks.Next;
  end;

  DMUser.ExportUserData(data);
end;

procedure TDMCollection.ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc);
var
  extra: TBookExtra;
  group: TBookGroup;
  groupBook: TGroupBook;

  BookKey: TBookKey;

  function GetBookKey(bookInfo: TBookInfo; out BookKey: TBookKey): Boolean;
  begin
    if bookInfo.LibID = 0 then
      Result := AllBooks.Locate(BOOK_ID_FIELD, bookInfo.BookID, [])
    else
      Result := AllBooks.Locate(BOOK_LIBID_FIELD, bookInfo.LibID, []);

    if Result then
    begin
      BookKey := CreateBookKey(AllBooksBookID.Value, DMUser.ActiveCollection.ID);
    end;
  end;

begin
  Assert(Assigned(data));
  Assert(Assigned(guiUpdateCallback));
  Assert(AllBooks.Active);

  //
  // Заполним рейтинги, review и признак прочитанности
  //
  for extra in data.Extras do
  begin
    if GetBookKey(extra, BookKey) then
    begin
      AllBooks.Edit;
      try
        if extra.Rating <> 0 then
          AllBooksRate.Value := extra.Rating;
        if extra.Progress <> 0 then
          AllBooksProgress.Value := extra.Progress;
        if extra.Review <> '' then
          AllBooksReview.Value := extra.Review;
        AllBooks.Post;
      except
        AllBooks.Cancel;
        raise ;
      end;
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

procedure TDMCollection.VerifyCurrentCollection(const DatabaseID: Integer);
var
  BookCollectionName: string;
  CurrentCollectionName: string;
begin
  if DatabaseID <> DMUser.ActiveCollection.ID then
  begin
    if (DMUser.SelectCollection(DatabaseID)) then
      BookCollectionName := DMUser.CurrentCollection.Name
    else
      BookCollectionName := '';
    raise ENotSupportedException.Create(Format(rstrErrorOnlyForCurrentCollection, [DMUser.ActiveCollection.Name, BookCollectionName]));
  end;
end;

// Get the total number of books
function TDMCollection.GetTotalNumBooks: Integer;
begin
  Result := AllBooks.RecordCount;
end;

// Return an iterator working on the active collection
// but having its own Books dataset (the rest of the tables are from the active collection).
// No need to free the iterator when done as it's a TInterfacedObject
// and knows to self destroy when no longer referenced.
function TDMCollection.GetBookIterator(const Mode: TBookIteratorMode; const LoadMemos: Boolean; const Filter: string): IBookIterator;
var
  EmptySearchCriteria: TBookSearchCriteria;
begin
  Result := TBookIteratorImpl.Create(Self, Mode, LoadMemos, Filter, EmptySearchCriteria);
end;

function TDMCollection.GetBookIterator(const LoadMemos: Boolean; const SearchCriteria: TBookSearchCriteria): IBookIterator;
begin
  Result := TBookIteratorImpl.Create(Self, bmSearch, LoadMemos, '', SearchCriteria);
end;

function TDMCollection.GetAuthorIterator(const Mode: TAuthorIteratorMode; const Filter: string): IAuthorIterator;
begin
  Result := TAuthorIteratorImpl.Create(Self, Mode, Filter);
end;

function TDMCollection.GetGenreIterator(const Mode: TGenreIteratorMode; const Filter: string): IGenreIterator;
begin
  Result := TGenreIteratorImpl.Create(Self, Mode, Filter);
end;

function TDMCollection.GetSeriesIterator(const Mode: TSeriesIteratorMode; const Filter: string = ''): ISeriesIterator;
begin
  Result := TSeriesIteratorImpl.Create(Self, Mode, Filter);
end;

// Change SeriesID value for all books in the current database with old SeriesID value
procedure TDMCollection.ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer);
const
  UPDATE_SQL = 'UPDATE Books SET ' + SERIES_ID_FIELD + ' = %s WHERE ' + SERIES_ID_FIELD + ' = %s';
var
  Query: TABSQuery;
  newSerie: string;
  oldSerie: string;
begin
  Assert(OldSeriesID <> NewSeriesID);

  VerifyCurrentCollection(DatabaseID);

  Query := TABSQuery.Create(DBCollection);
  try
    Query.DatabaseName := DBCollection.DatabaseName;

    if NO_SERIE_ID = NewSeriesID then
      newSerie := 'NULL'
    else
      newSerie := Format('%u', [NewSeriesID]);

    if NO_SERIE_ID = OldSeriesID then
      oldSerie := 'IS NULL'
    else
      oldSerie := Format('= %u', [NewSeriesID]);

    Query.SQL.Text := Format(UPDATE_SQL, [newSerie, oldSerie]);
    Log(Query.SQL.Text);
    Query.ExecSQL;
  finally
    FreeAndNil(Query);
  end;

  // Обновим информацию в группах
  DMUser.ChangeBookSeriesID(OldSeriesID, NewSeriesID, DatabaseID);
end;

// If the series title is already in DB - locate it and return the SeriesID
// If the title is not in DB - add and returned the ID of the added row
function TDMCollection.AddOrLocateSeriesIDBySeriesTitle(const SeriesTitle: string): Integer;
begin
  Assert(AllSeries.Active);

  if NO_SERIES_TITLE = SeriesTitle then
  begin
    Result := NO_SERIE_ID;
    Exit;
  end;

  if not AllSeries.Locate(SERIES_TITLE_FIELD, SeriesTitle, []) then
  begin
    AllSeries.Append;
    try
      AllSeriesSeriesTitle.Value := SeriesTitle;
      AllSeries.Post;
    except
      AllSeries.Cancel;
      raise ;
    end;
  end;
  Result := AllSeriesSeriesID.Value;
end;

procedure TDMCollection.SetSeriesTitle(const SeriesID: Integer; const NewSeriesTitle: string);
begin
  Assert(AllSeries.Active);
  Assert(SeriesID <> NO_SERIE_ID);
  Assert(NewSeriesTitle <> NO_SERIES_TITLE);

  if (AllSeries.Locate(SERIES_ID_FIELD, SeriesID, [])) then
  begin
    AllSeries.Edit;
    try
      AllSeriesSeriesTitle.Value := NewSeriesTitle;
      AllSeries.Post;
    except
      AllSeries.Cancel;
      raise ;
    end;
  end;
end;

end.
