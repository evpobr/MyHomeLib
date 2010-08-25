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
  // TThreeState = (tsTrue, tsFalse, tsUnknown);

  TDMCollection = class(TDataModule)
    DBCollection: TABSDatabase;

    Authors: TABSQuery;
    AuthorsID: TAutoIncField;
    AuthorsFamily: TWideStringField;
    AuthorsName: TWideStringField;
    AuthorsMiddle: TWideStringField;

    dsAuthors: TDataSource;

    AuthorBooks: TABSTable;
    AuthorBooksAuthorID: TIntegerField;
    AuthorBooksBookID: TIntegerField;

    dsAuthorBooks: TDataSource;

    BooksByAuthor: TABSTable;
    BooksByAuthorID: TAutoIncField;

    Series: TABSQuery;
    SeriesSerieID: TAutoIncField;
    SeriesTitle: TWideStringField;

    dsSeries: TDataSource;

    BooksBySerie: TABSTable;
    BooksBySerieID: TAutoIncField;
    BooksBySerieSerieID: TIntegerField;

    Genres: TABSTable;
    GenresGenreCode: TWideStringField;
    GenresParentCode: TWideStringField;
    GenresFB2Code: TWideStringField;
    GenresGenreAlias: TWideStringField;

    dsGenres: TDataSource;

    GenreBooks: TABSTable;
    GenreBooksGenreCode: TWideStringField;
    GenreBooksBookID: TIntegerField;
    dsGenreBooks: TDataSource;

    BooksByGenre: TABSTable;
    BooksByGenreID: TAutoIncField;

    BookAuthors: TABSTable;
    BookAuthorsAuthorID: TIntegerField;
    BookAuthorsBookID: TIntegerField;

    BookGenres: TABSTable;
    BookGenresGenreCode: TWideStringField;
    BookGenresBookID: TIntegerField;

    AllBooks: TABSTable;
    AllBooksBookID: TAutoIncField;
    AllBooksLibID: TIntegerField;
    AllBooksTitle: TWideStringField;
    AllBooksSerieID: TIntegerField;
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
    AllSeriesSerieID: TAutoIncField;
    AllSeriesSerieTitle: TWideStringField;

    AllGenres: TABSTable;
    AllGenresGenreCode: TWideStringField;
    AllGenresParentCode: TWideStringField;
    AllGenresFB2Code: TWideStringField;
    AllGenresAlias: TWideStringField;

    sqlBooks: TABSQuery;
    sqlBooksID: TIntegerField;

    tblBooks: TABSTable;
    tblBooksID: TAutoIncField;
    tblBooksSerieID: TIntegerField;
    tblBooksSeqNumber: TSmallintField;
    tblBooksLibID: TIntegerField;
    tblBooksDate: TDateField;
    tblBooksTitle: TWideStringField;
    tblBooksInsideNo: TIntegerField;
    tblBooksFileName: TWideStringField;
    tblBooksExt: TWideStringField;
    tblBooksSize: TIntegerField;
    tblBooksCode: TSmallintField;
    tblBooksFolder: TWideStringField;
    tblBooksLocal: TBooleanField;
    tblBooksDeleted: TBooleanField;
    tblBooksLibRate: TIntegerField;
    tblBooksLang: TWideStringField;
    tblBooksKeyWords: TWideStringField;
    tblBooksSeries: TWideStringField;

    tblSeriesB1: TABSTable;
    tblSeriesB1SerieID: TAutoIncField;
    tblSeriesB1SerieTitle: TWideStringField;

    procedure DataModuleCreate(Sender: TObject);

  strict private
    // GetCurrentBook(var R: TBookRecord);
    // SetActiveTable
    FIsFavorites: Boolean;
    FActiveTable: TABSTable;

    //
    // Фильтрация базы
    //
    // В текущей версии
    // - фильт по авторам и серия выставляется через Filter DataSet-а
    // - фильтр скачанных книг через запрос
    // - фильтр удаленных книг через Filter DataSet-а
    //
    // В результате возможна ситуация, когда автор показан, но книг у него нет, т к они все помеченны как удаленные.
    // Использовать запрос для предотвращения этой ситуации можно, но работает это очень медленно.
    // Поэтому, отложим это до перехода на нормальный SQL сервер.
    //

  strict private
  type
    TDataPart = (dpAuthors, dpSeries, dpBooks);
    TDataParts = set of TDataPart;

    TFilterPart = (fpAuthors, fpSeries, fpLocalOnly, fpHideDeleted);
    TFilterParts = set of TFilterPart;

    TBookIteratorImpl = class(TInterfacedObject, IBookIterator)
    public
      constructor Create(Collection: TDMCollection;
        const Mode: TBookIteratorMode; const LoadMemos: Boolean;
        const Filter: string);
      destructor Destroy; override;

    protected
      //
      // IBookIterator
      //
      function Next(out BookRecord: TBookRecord): Boolean;
      function GetNumRecords: Integer;

    private
      FCollection: TDMCollection;
      FBooks: TABSQuery;
      FBookID: TIntegerField;

      FCollectionID: Integer; // Active collection's ID at the time the iterator was created
      FLoadMemos: Boolean;

      procedure InitSQL(const Mode: TBookIteratorMode; const Filter: string);
    end;

  strict private
    FAuthorFilter: string;
    FSerieFilter: string;
    FShowLocalOnly: Boolean;
    FHideDeleted: Boolean;

  private type
    TUpdateExtraProc = reference to procedure;

  public type
    TGUIUpdateExtraProc = reference to procedure(const BookKey: TBookKey;
      extra: TBookExtra);

  strict private
    procedure GetAuthor(AuthorID: Integer; var Author: TAuthorData);
    procedure GetBookAuthors(BookID: Integer; var BookAuthors: TBookAuthors);

    function GetSerieTitle(SerieID: Integer): string;

    procedure GetGenre(const GenreCode: string; var Genre: TGenreData);
    procedure GetBookGenres(BookID: Integer; var BookGenres: TBookGenres;
      RootGenre: PGenreData = nil); overload;

    //
    // Установка фильтров
    //

    //
    // Создает и устанавливает фильтры и запросы в соответствии с текущими режимами
    // Т к при
    //
    function UpdateFilters(Parts: TFilterParts): TDataParts;

    procedure RefreshData(Parts: TDataParts);

  public
    // TfrmMain.FormCreate
    // TfrmMain.pgControlChange
    procedure SetActiveTable(Tag: Integer);
    deprecated;

    // TDownloader.DoDownload
    procedure GetBookLibID(const BookKey: TBookKey; out ARes: string);
    deprecated;

    // TExport2XMLThread.WorkFunction
    // TExport2INPXThread.WorkFunction
    // WriteFb2InfoToFile
    // TfrmConvertToFBD.PrepareForm
    procedure GetCurrentBook(var R: TBookRecord); overload;
    deprecated;

    procedure SetTableState(State: Boolean);

  public
    //
    // новые методы, учитывающие DatabaseID
    //

    //
    // Получение полной информации о книге
    //
    procedure GetBookRecord(const BookKey: TBookKey;
      var BookRecord: TBookRecord; LoadMemos: Boolean);

    //
    // Обновление полей
    //
    procedure SetLocal(const BookKey: TBookKey; AState: Boolean);
    procedure SetFileName(const BookKey: TBookKey; const FileName: string);
    procedure SetFolder(const BookKey: TBookKey; const Folder: string);
    procedure SetBookSerieID(const BookKey: TBookKey; const SerieID: Integer);
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
    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer;
      out SeriesCount: Integer);

    //
    // Установка фильтров
    //
    procedure SetAuthorFilter(const Value: string; Refresh: Boolean = True);
    procedure SetSerieFilter(const Value: string; Refresh: Boolean = True);
    procedure SetShowLocalBookOnly(Value: Boolean; Refresh: Boolean = True);
    procedure SetHideDeletedBook(Value: Boolean; Refresh: Boolean = True);

    //
    // Пользовательские данные
    //
    procedure ExportUserData(data: TUserData);
    procedure ImportUserData(data: TUserData;
      guiUpdateCallback: TGUIUpdateExtraProc);

    // Batch update methods:
    procedure ChangeBookSerieID(const OldSerieID: Integer;
      const NewSerieID: Integer; const DatabaseID: Integer);

    function AddOrLocateSerieIDBySerieTitle(const SerieTitle: string): Integer;
    procedure SetSerieTitle(const SerieID: Integer;
      const NewSerieTitle: string);

    procedure VerifyCurrentCollection(const DatabaseID: Integer);
    function GetTotalNumBooks: Integer;

    // Iterators:
    function GetBookIterator(const Mode: TBookIteratorMode;
      const LoadMemos: Boolean): IBookIterator; overload;
    function GetBookIterator(const Mode: TBookIteratorMode;
      const LoadMemos: Boolean; const Filter: string): IBookIterator; overload;

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
  dm_user,
  unit_Consts,
  unit_Messages,
  unit_Helpers,
  unit_Errors;
{$R *.dfm}

{ TBookIteratorImpl }

constructor TDMCollection.TBookIteratorImpl.Create(Collection: TDMCollection;
  const Mode: TBookIteratorMode; const LoadMemos: Boolean;
  const Filter: string);
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollection.ID;
  FLoadMemos := LoadMemos;
  FCollection := Collection;

  FBooks := TABSQuery.Create(FCollection.DBCollection);
  FBooks.DatabaseName := FCollection.DBCollection.DatabaseName;
  InitSql(Mode, Filter);
  FBooks.Active := True;

  FBookID := FBooks.FieldByName(BOOK_ID_FIELD) as TIntegerField;
end;

destructor TDMCollection.TBookIteratorImpl.Destroy;
begin
  FreeAndNil(FBooks);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TDMCollection.TBookIteratorImpl.Next(out BookRecord: TBookRecord)
  : Boolean;
begin
  Result := not FBooks.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollection.ID = FCollectionID); // shouldn't happen
    FCollection.GetBookRecord(CreateBookKey(FBookID.Value, FCollectionID),
      BookRecord, FLoadMemos);
    FBooks.Next;
  end;
end;

function TDMCollection.TBookIteratorImpl.GetNumRecords: Integer;
begin
  Result := FBooks.RecordCount;
end;

procedure TDMCollection.TBookIteratorImpl.InitSQL(const Mode: TBookIteratorMode; const Filter: string);
var
  Where: string;
begin
  case Mode of
    bimBook:
      FBooks.SQL.Text := 'SELECT BookID FROM Books';
    bimGenreBook:
      FBooks.SQL.Text :=
        'SELECT b.BookID FROM Genre_List gl INNER JOIN Books b ON gl.BookID = b.BookID ';
  else
    Assert(False);
  end;

  Where := '';
  if Filter <> '' then
  begin
    if Where = '' then
      Where := ' WHERE ' + Filter
    else
      Where := Where + ' AND ' + Filter;
  end;
  if FCollection.FHideDeleted then
  begin
    if Where = '' then
      Where := ' WHERE b.Deleted = False '
    else
      Where := Where + ' AND b.Deleted = False ';
  end;
  if FCollection.FShowLocalOnly then
  begin
    if Where = '' then
      Where := ' WHERE b.Local = True '
    else
      Where := Where + ' AND b.Local = True ';
  end;
  FBooks.SQL.Text := FBooks.SQL.Text + Where;
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

procedure TDMCollection.GetStatistics(out AuthorsCount: Integer;
  out BooksCount: Integer; out SeriesCount: Integer);
var
  FilterStateA: Boolean;
  FilterStringA: string;

  BM1: TBookMark;
begin
  (* ***************************************************************************
    *
    * Более предпочтительно использовать 3 простых запроса,
    * но пока оставим как есть
    *
    *************************************************************************** *)

  BM1 := Authors.GetBookmark;
  try
    FilterStateA := Authors.Filtered;
    FilterStringA := Authors.Filter;
    Authors.Filtered := False;

    AuthorsCount := Authors.RecordCount;
    BooksCount := AllBooks.RecordCount;
    SeriesCount := AllSeries.RecordCount;

    Authors.Filter := FilterStringA;
    Authors.Filtered := FilterStateA;

    Authors.GotoBookmark(BM1);
  finally
    Authors.FreeBookmark(BM1);
  end;
end;

procedure TDMCollection.SetActiveTable(Tag: Integer);
begin
  if Tag = PAGE_FAVORITES then
  begin
    FActiveTable := DMUser.BooksByGroup;
    FIsFavorites := True;
  end
  else
  begin
    FActiveTable := tblBooks;
    FIsFavorites := False;
  end;
end;

procedure TDMCollection.SetTableState(State: Boolean);
begin
  Authors.Active := State;
  AuthorBooks.Active := State;
  BooksByAuthor.Active := State;

  Series.Active := State;
  BooksBySerie.Active := State;

  Genres.Active := State;
  GenreBooks.Active := State;
  BooksByGenre.Active := State;

  BookGenres.Active := State;
  BookAuthors.Active := State;

  tblBooks.Active := State;
  tblSeriesB1.Active := State;

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

function TDMCollection.GetSerieTitle(SerieID: Integer): string;
begin
  if AllSeries.Locate(SERIE_ID_FIELD, SerieID, []) then
    Result := AllSeriesSerieTitle.Value
  else
    Result := '';
end;

procedure TDMCollection.GetGenre(const GenreCode: string;
  var Genre: TGenreData);
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

procedure TDMCollection.GetBookAuthors(BookID: Integer;
  var BookAuthors: TBookAuthors);
var
  i: Integer;
begin
  Assert(Self.BookAuthors.Active);
  Self.BookAuthors.SetRange([BookID], [BookID]);
  try
    i := Length(BookAuthors);
    Self.BookAuthors.First;
    while not Self.BookAuthors.Eof do
    begin
      SetLength(BookAuthors, i + 1);
      GetAuthor(Self.BookAuthorsAuthorID.Value, BookAuthors[i]);

      Inc(i);
      Self.BookAuthors.Next;
    end;
  finally
    Self.BookAuthors.CancelRange;
  end;
end;

procedure TDMCollection.GetBookGenres(BookID: Integer;
  var BookGenres: TBookGenres; RootGenre: PGenreData = nil);
var
  i: Integer;
begin
  Assert(Self.BookGenres.Active);

  Self.BookGenres.SetRange([BookID], [BookID]);
  try
    i := Length(BookGenres);
    Self.BookGenres.First;

    while not Self.BookGenres.Eof do
    begin
      SetLength(BookGenres, i + 1);
      GetGenre(BookGenresGenreCode.Value, BookGenres[i]);

      Inc(i);
      Self.BookGenres.Next;
    end;

    if Assigned(RootGenre) then
    begin
      if Length(BookGenres) > 0 then
        GetGenre(BookGenres[0].ParentCode, RootGenre^)
      else
        RootGenre^.Clear;
    end;
  finally
    Self.BookGenres.CancelRange;
  end;
end;

procedure TDMCollection.GetCurrentBook(var R: TBookRecord);
var
  BookKey: TBookKey;
begin
  BookKey.BookID := FActiveTable.FieldByName(BOOK_ID_FIELD).Value;
  if FActiveTable = tblBooks then
    BookKey.DatabaseID := DMUser.ActiveCollection.ID
  else
    BookKey.DatabaseID := FActiveTable.FieldByName(DB_ID_FIELD).AsInteger;

  GetBookRecord(BookKey, R, True);
end;

procedure TDMCollection.GetBookRecord(const BookKey: TBookKey;
  var BookRecord: TBookRecord; LoadMemos: Boolean);
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
    BookRecord.SerieID := AllBooksSerieID.Value;
    BookRecord.Serie := GetSerieTitle(AllBooksSerieID.Value);
    BookRecord.SeqNumber := AllBooksSeqNumber.Value;
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

    GetBookGenres(BookRecord.BookKey.BookID, BookRecord.Genres, @
        (BookRecord.RootGenre));
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

procedure TDMCollection.SetFileName(const BookKey: TBookKey;
  const FileName: string);
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

procedure TDMCollection.SetFolder(const BookKey: TBookKey;
  const Folder: string);
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

procedure TDMCollection.SetBookSerieID(const BookKey: TBookKey;
  const SerieID: Integer);
begin
  VerifyCurrentCollection(BookKey.DatabaseID);
  Assert(AllBooks.Active);

  DMCollection.tblBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []);
  DMCollection.tblBooks.Edit;
  try
    DMCollection.tblBooksSerieID.Value := SerieID;
    DMCollection.tblBooks.Post;
  except
    DMCollection.tblBooks.Cancel;
    raise ;
  end;

  // Обновим информацию в группах
  DMUser.SetBookSerieID(BookKey, SerieID);
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

procedure TDMCollection.SetAnnotation(const BookKey: TBookKey;
  const Annotation: string);
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

function TDMCollection.SetReview(const BookKey: TBookKey; const Review: string)
  : Integer;
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

procedure TDMCollection.AddBookToGroup(const BookKey: TBookKey;
  GroupID: Integer);
var
  BookRecord: TBookRecord;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);
  Assert(AllBooks.Active);

  GetBookRecord(BookKey, BookRecord, True);

  DMUser.AddBookToGroup(BookKey, GroupID, BookRecord);
end;

function TDMCollection.UpdateFilters(Parts: TFilterParts): TDataParts;
const
  GetAuthorsBegin =
    'SELECT a.AuthorID, a.LastName, a.FirstName, a.MiddleName FROM Authors a ';
  GetAuthorsQuery =
    'WHERE (a.AuthorID IN (SELECT DISTINCT l.AuthorID FROM Author_List l INNER JOIN Books b ON l.BookID = b.BookID WHERE `Local` = true)) ';
  GetAuthorsEnd = 'ORDER BY a.LastName, a.FirstName, a.MiddleName ';

  GetSeriessBegin = 'SELECT s.SerieID, s.SerieTitle FROM Series s ';
  GetSeriessQuery =
    'WHERE (s.SerieID <> 1) AND (s.SerieID IN (SELECT DISTINCT b.SerieID FROM Books b WHERE `Local` = true)) ';
  GetSeriessEnd = 'ORDER BY s.SerieTitle';

  LocalFilters: array [Boolean] of string = ('', '(`Local` = true)');
  HideDeletedFilters: array [Boolean] of string = ('', '(`Deleted` = false)');
var
  SQLQuery: string;
  LocalFilter: string;
  HideDeletedFilter: string;
  TotalFilter: string;
  SetFilter: Boolean;
begin
  Result := [];

  // ----------------------------------------------
  if fpAuthors in Parts then
  begin
    if FAuthorFilter = ALPHA_FILTER_ALL then
    begin
      Authors.Filter := '';
      Authors.Filtered := False;
    end
    else if FAuthorFilter = ALPHA_FILTER_NON_ALPHA then
    begin
      Authors.Filter := Format('(UPPER(%0:s) <> "Ё*") AND ' +
        // буква Ё лежит отдельно
          '(' + '(UPPER(%0:s) < "A*") OR ' + // меньше латинской A
          '(UPPER(%0:s) > "Z*" AND UPPER(%0:s) < "А*") OR ' +
        // больше латинской Z и меньше русской А
          '(UPPER(%0:s) > "Я*")' + // меньше русской Я
          ')', [AUTHOR_LASTTNAME_FIELD]);
      Authors.Filtered := True;
    end
    else
    begin
      Assert(Length(FAuthorFilter) = 1);
      Assert(TCharacter.IsUpper(FAuthorFilter, 1));
      Authors.Filter := Format('UPPER(%0:s) = "%1:s*"',
        // начинается на заданную букву
        [AUTHOR_LASTTNAME_FIELD, FAuthorFilter]);
      Authors.Filtered := True;
    end;
  end;

  // ----------------------------------------------
  if fpSeries in Parts then
  begin
    if FSerieFilter = ALPHA_FILTER_ALL then
    begin
      Series.Filter := Format('%0:s <> "%1:s"', // фильтруем специальную серию
        [SERIE_TITLE_FIELD, NO_SERIES_TITLE]);
    end
    else if FSerieFilter = ALPHA_FILTER_NON_ALPHA then
    begin
      Series.Filter := Format('(%0:s <> "%1:s") AND ' +
        // фильтруем специальную серию
          '(UPPER(%0:s) <> "Ё*") AND ' + // буква Ё лежит отдельно
          '(' + '(UPPER(%0:s) < "A*") OR ' + // меньше латинской A
          '(UPPER(%0:s) > "Z*" AND UPPER(%0:s) < "А*") OR ' +
        // больше латинской Z и меньше русской А
          '(UPPER(%0:s) > "Я*")' + // меньше русской Я
          ')', [SERIE_TITLE_FIELD, NO_SERIES_TITLE]);
    end
    else
    begin
      Assert(Length(FSerieFilter) = 1);
      Assert(TCharacter.IsUpper(FSerieFilter, 1));
      Series.Filter := Format('UPPER(%0:s) = "%1:s*"',
        // начинается на заданную букву
        [SERIE_TITLE_FIELD, FSerieFilter]);
    end;
    Series.Filtered := True;
  end;

  // ----------------------------------------------
  if fpLocalOnly in Parts then
  begin
    SQLQuery := GetAuthorsBegin;
    if FShowLocalOnly then
      SQLQuery := SQLQuery + GetAuthorsQuery;
    SQLQuery := SQLQuery + GetAuthorsEnd;

    Authors.Active := False;
    Authors.SQL.Text := SQLQuery;
    Authors.Prepare;
    Include(Result, dpAuthors);

    SQLQuery := GetSeriessBegin;
    if FShowLocalOnly then
      SQLQuery := SQLQuery + GetSeriessQuery;
    SQLQuery := SQLQuery + GetSeriessEnd;

    Series.Active := False;
    Series.SQL.Text := SQLQuery;
    Series.Prepare;
    Include(Result, dpSeries);
  end;

  // ----------------------------------------------
  if ([fpLocalOnly, fpHideDeleted] * Parts) <> [] then
  begin
    LocalFilter := LocalFilters[FShowLocalOnly];
    HideDeletedFilter := HideDeletedFilters[FHideDeleted];

    SetFilter := True;
    if (LocalFilter <> '') and (HideDeletedFilter <> '') then
      TotalFilter := LocalFilter + ' AND ' + HideDeletedFilter
    else if (LocalFilter <> '') then
      TotalFilter := LocalFilter
    else if (HideDeletedFilter <> '') then
      TotalFilter := HideDeletedFilter
    else
    begin
      TotalFilter := '';
      SetFilter := False;
    end;

    BooksByAuthor.Active := False;
    BooksByGenre.Active := False;
    BooksBySerie.Active := False;

    if SetFilter then
    begin
      BooksByAuthor.Filter := TotalFilter;
      BooksByGenre.Filter := TotalFilter;
      BooksBySerie.Filter := TotalFilter;
      DMUser.BooksByGroup.Filter := TotalFilter;
    end;

    BooksByAuthor.Filtered := SetFilter;
    BooksByGenre.Filtered := SetFilter;
    BooksBySerie.Filtered := SetFilter;
    DMUser.BooksByGroup.Filtered := SetFilter;

    Include(Result, dpBooks);
  end;
end;

procedure TDMCollection.RefreshData(Parts: TDataParts);
begin
  if dpAuthors in Parts then
  begin
    Authors.Active := True;
  end;

  if dpSeries in Parts then
  begin
    Series.Active := True;
  end;

  if dpBooks in Parts then
  begin
    BooksByAuthor.Active := True;
    BooksByGenre.Active := True;
    BooksBySerie.Active := True;
  end;
end;

procedure TDMCollection.SetAuthorFilter(const Value: string;
  Refresh: Boolean = True);
var
  Parts: TDataParts;
begin
  FAuthorFilter := Value;

  Parts := UpdateFilters([fpAuthors]);

  if Refresh then
    RefreshData(Parts);
end;

procedure TDMCollection.SetSerieFilter(const Value: string;
  Refresh: Boolean = True);
var
  Parts: TDataParts;
begin
  FSerieFilter := Value;

  Parts := UpdateFilters([fpSeries]);

  if Refresh then
    RefreshData(Parts);
end;

procedure TDMCollection.SetShowLocalBookOnly
  (Value: Boolean; Refresh: Boolean = True);
var
  Parts: TDataParts;
begin
  FShowLocalOnly := Value;

  Parts := UpdateFilters([fpLocalOnly]);

  if Refresh then
    RefreshData(Parts);
end;

procedure TDMCollection.SetHideDeletedBook
  (Value: Boolean; Refresh: Boolean = True);
var
  Parts: TDataParts;
begin
  FHideDeleted := Value;

  Parts := UpdateFilters([fpHideDeleted]);

  if Refresh then
    RefreshData(Parts);
end;

procedure TDMCollection.ExportUserData(data: TUserData);
begin
  Assert(Assigned(data));
  Assert(AllBooks.Active);

  AllBooks.First;
  while not AllBooks.Eof do
  begin
    if (AllBooksRate.Value <> 0) or (AllBooksProgress.Value <> 0) or
      (not AllBooksReview.IsNull) then
      data.Extras.AddExtra(AllBooksBookID.Value, AllBooksLibID.Value,
        AllBooksRate.Value, AllBooksProgress.Value, AllBooksReview.Value);

    AllBooks.Next;
  end;

  DMUser.ExportUserData(data);
end;

procedure TDMCollection.ImportUserData(data: TUserData;
  guiUpdateCallback: TGUIUpdateExtraProc);
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
      BookKey := CreateBookKey
        (AllBooksBookID.Value, DMUser.ActiveCollection.ID);
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
    raise ENotSupportedException.Create
      (Format(rstrErrorOnlyForCurrentCollection, [DMUser.ActiveCollection.Name,
        BookCollectionName]));
  end;
end;

// Get the total number of books
function TDMCollection.GetTotalNumBooks: Integer;
begin
  Result := tblBooks.RecordCount;
end;

// Return an iterator working on the active collection
// but having its own Books datase (the rest of the tables are from the active collection).
// No need to free the iterator when done as it's a TInterfacedObject
// and knows to self destroyed when no longer referenced.
function TDMCollection.GetBookIterator(const Mode: TBookIteratorMode;
  const LoadMemos: Boolean): IBookIterator;
begin
  Result := TBookIteratorImpl.Create(Self, Mode, LoadMemos, '');
end;

function TDMCollection.GetBookIterator(const Mode: TBookIteratorMode;
  const LoadMemos: Boolean; const Filter: string): IBookIterator;
begin
  Result := TBookIteratorImpl.Create(Self, Mode, LoadMemos, Filter);
end;

// Change SerieID value for all books in the current database with old SerieID value
procedure TDMCollection.ChangeBookSerieID(const OldSerieID: Integer;
  const NewSerieID: Integer; const DatabaseID: Integer);
const
  UPDATE_SQL = 'UPDATE Books SET SerieID = %u WHERE SerieID = %u';
begin
  VerifyCurrentCollection(DatabaseID);

  sqlBooks.SQL.Text := Format(UPDATE_SQL, [NewSerieID, OldSerieID]);
  sqlBooks.ExecSQL;

  // Обновим информацию в группах
  DMUser.ChangeBookSerieID(OldSerieID, NewSerieID, DatabaseID);
end;

// If the series title is already in DB - locate it and return the SerieID
// If the title is not in DB - add and returned the ID of the added row
function TDMCollection.AddOrLocateSerieIDBySerieTitle(const SerieTitle: string)
  : Integer;
begin
  Assert(tblSeriesB1.Active);

  if not tblSeriesB1.Locate(SERIE_TITLE_FIELD, SerieTitle, []) then
  begin
    tblSeriesB1.Append;
    try
      tblSeriesB1SerieTitle.Value := SerieTitle;
      tblSeriesB1.Post;
    except
      tblSeriesB1.Cancel;
      raise ;
    end;
  end;
  Result := tblSeriesB1SerieID.Value;
end;

procedure TDMCollection.SetSerieTitle(const SerieID: Integer;
  const NewSerieTitle: string);
begin
  Assert(tblSeriesB1.Active);

  if (tblSeriesB1.Locate(SERIE_ID_FIELD, SerieID, [])) then
  begin
    tblSeriesB1.Edit;
    try
      DMCollection.tblSeriesB1SerieTitle.Value := NewSerieTitle;
      DMCollection.tblSeriesB1.Post;
    except
      DMCollection.tblSeriesB1.Cancel;
      raise ;
    end;
  end;
end;

end.
