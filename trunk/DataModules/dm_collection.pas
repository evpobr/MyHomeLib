(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
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
  unit_Globals;

type
  TDMCollection = class(TDataModule)
    DBCollection: TABSDatabase;
    dsAuthors: TDataSource;
    BooksByAuthor: TABSTable;
    BooksByGenre: TABSTable;
    Genres: TABSTable;
    tblAuthorsS: TABSTable;
    BooksBySerie: TABSTable;
    dsSeries: TDataSource;
    dsAuthorsS: TDataSource;
    tblAuthorsSID: TAutoIncField;
    tblAuthorsSFamily: TWideStringField;
    tblAuthorsSName: TWideStringField;
    BooksByAuthorID: TAutoIncField;
    BooksByAuthorSerieID: TIntegerField;
    BookGenres_List: TABSTable;
    dsBookGenres_List: TDataSource;
    GenreBooks: TABSTable;
    dsGenreBooks: TDataSource;
    BooksBySerieID: TAutoIncField;
    BooksBySerieSerieID: TIntegerField;
    BooksByGenreID: TAutoIncField;
    BooksByGenreSerieID: TIntegerField;
    AuthorBooks: TABSTable;
    dsAuthorBooks: TDataSource;
    tblBooks: TABSTable;
    dsBooks: TDataSource;
    BookGenres: TABSTable;
    BookAuthor: TABSTable;
    BookAuthors_List: TABSTable;
    dsBookAuthors_List: TDataSource;
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
    tblSeriesB1: TABSTable;
    tblExtra: TABSTable;
    Authors: TABSQuery;
    AuthorsID: TAutoIncField;
    AuthorsFamily: TWideStringField;
    AuthorsName: TWideStringField;
    AuthorsMiddle: TWideStringField;
    Series: TABSQuery;
    SeriesSerieID: TAutoIncField;
    SeriesAuthID: TIntegerField;
    SeriesTitle: TWideStringField;
    SeriesGenreCode: TWideStringField;
    tblBooksLibRate: TIntegerField;
    tblBooksLang: TWideStringField;
    tblBooksURI: TWideStringField;
    tblBooksKeyWords: TWideStringField;
    sqlBooks: TABSQuery;
    sqlBooksSerieID: TIntegerField;
    GenresG_ID: TAutoIncField;
    GenresGenreCode: TWideStringField;
    GenresG_ParentCode: TWideStringField;
    GenresG_FB2Code: TWideStringField;
    GenresG_Alias: TWideStringField;
    GenreBooksGL_ID: TAutoIncField;
    GenreBooksGenreCode: TWideStringField;
    GenreBooksBookID: TIntegerField;
    GenreBooksGL_Family: TWideStringField;
    GenreBooksGL_Series: TWideStringField;
    GenreBooksGL_Title: TWideStringField;
    AuthorBooksAuthorID: TIntegerField;
    AuthorBooksBookID: TIntegerField;
    AuthorBooksAL_Series: TWideStringField;
    AuthorBooksAL_Title: TWideStringField;
    BookGenres_ListGL_ID: TAutoIncField;
    BookGenres_ListGenreCode: TWideStringField;
    BookGenres_ListBookID: TIntegerField;
    BookGenres_ListGL_Family: TWideStringField;
    BookGenres_ListGL_Series: TWideStringField;
    BookGenres_ListGL_Title: TWideStringField;
    BookGenresG_ID: TAutoIncField;
    BookGenresGenreCode: TWideStringField;
    BookGenresG_ParentCode: TWideStringField;
    BookGenresG_FB2Code: TWideStringField;
    BookGenresG_Alias: TWideStringField;
    BookAuthors_ListAuthorID: TIntegerField;
    BookAuthors_ListBookID: TIntegerField;
    BookAuthors_ListAL_Series: TWideStringField;
    BookAuthors_ListAL_Title: TWideStringField;
    BookAuthorA_ID: TAutoIncField;
    BookAuthorLastName: TWideStringField;
    BookAuthorFirstName: TWideStringField;
    BookAuthorMiddleName: TWideStringField;
    dsGenres: TDataSource;
    tblSeriesB1SerieID: TAutoIncField;
    tblSeriesB1AuthorID: TIntegerField;
    tblSeriesB1GenreCode: TWideStringField;
    tblSeriesB1S_Title: TWideStringField;
    tblBooksSeries: TWideStringField;
    tblBooksFullName: TWideStringField;
    sqlBooksID: TIntegerField;
    tblExtraBookID: TIntegerField;
    tblExtraAnnotation: TWideMemoField;
    tblExtraReview: TWideMemoField;
    AllBooks: TABSTable;
    AllBooksBookID: TAutoIncField;
    AllBooksLibID: TIntegerField;
    AllBooksTitle: TWideStringField;
    AllBooksFullName: TWideStringField;
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
    AllBooksURI: TWideStringField;
    AllBooksCode: TSmallintField;
    AllBooksLocal: TBooleanField;
    AllBooksDeleted: TBooleanField;
    AllBooksKeyWords: TWideStringField;
    AllSeries: TABSTable;
    AllSeriesSerieID: TAutoIncField;
    AllSeriesS_Title: TWideStringField;
    AllExtra: TABSTable;
    AllExtraBookID: TIntegerField;
    AllExtraAnnotation: TWideMemoField;
    AllExtraReview: TWideMemoField;
    AllExtraRate: TIntegerField;
    AllExtraProgress: TIntegerField;

  private
    FIsFavorites: Boolean;
    FActiveTable: TABSTable;

  private
    function GetBookGenres(BookID: Integer): string; deprecated;
    function GetRootGenre(BookID: Integer): string; deprecated; {unused}

  public
    procedure GetBookFolder(ID: Integer; out AFolder: string); deprecated;
    procedure GetBookFileName(ID: Integer; out AFile, AFolder, AExt: string; out ANo: Integer); deprecated;

    procedure SetActiveTable(Tag: Integer); deprecated;
    function GetGenreCode(BookID: Integer): string; deprecated;

    procedure FieldByName(AID: Integer; const AField: string; out ARes: string); overload; deprecated;

    procedure SetLocalStatus(AID: Integer; AState: Boolean); deprecated;

    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
    property ActiveTable: TABSTable read FActiveTable;

    procedure SetTableState(State: Boolean);
    function FullName(BookID: Integer): string; deprecated;
    function AuthorID(BookID: Integer): Integer; deprecated;
    function FullAuthorsString(BookID: Integer): string; deprecated;

    //
    //
    //
    function GetBookSerie(BookID: Integer; DatabaseID: Integer; SerieID: Integer): string;
    procedure FillBookData(BookID: Integer; DatabaseID: Integer; Data: PBookData);
    procedure GetCurrentBook(var R: TBookRecord); overload; deprecated;
    procedure GetBookRecord(BookID: Integer; DatabaseID: Integer; var BookRecord: TBookRecord); overload;

    //
    // Обновление полей
    //
    procedure SetLocal(BookID: Integer; DatabaseID: Integer; AState: Boolean);

    //
    // Обновление полей из таблицы Extra
    //
    procedure SetRate(BookID: Integer; DatabaseID: Integer; Rate: Integer);
    procedure SetProgress(BookID: Integer; DatabaseID: Integer; Progress: Integer);

    function GetReview(BookID: Integer; DatabaseID: Integer): string;
    function SetReview(BookID: Integer; DatabaseID: Integer; const Review: string): Integer;

    //
    // Работа с группами
    //
    procedure AddBookToGroup(BookID: Integer; DatabaseID: Integer; GroupID: Integer);

  private type
    TUpdateExtraProc = reference to procedure;

  strict private
    procedure UpdateExtra(BookID: Integer; DatabaseID: Integer; UpdateProc: TUpdateExtraProc);
    procedure ClearExtra(BookID: Integer; DatabaseID: Integer; UpdateProc: TUpdateExtraProc);
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
  Math,
  dm_user,
  unit_Consts,
  unit_Messages;

{$R *.dfm}

{ TDMMain }

function TDMCollection.FullAuthorsString(BookID: Integer): string;
var
  S: string;
begin
  Result := '';
  BookAuthors_List.Locate(BOOK_ID_FIELD, BookID, []);
  while (not BookAuthors_List.Eof) and (BookAuthors_ListBookID.Value = BookID) do
  begin
    S := Trim(TAuthorRecord.FormatName(BookAuthorLastName.Value, BookAuthorFirstName.Value, BookAuthorMiddleName.Value));

    Result := IfThen(Result = '', S, Result + ', ' + S);
    BookAuthors_List.Next;
  end
end;

function TDMCollection.FullName(BookID: Integer): string;
begin
  if BookID <> 0 then
    BookAuthors_List.Locate(BOOK_ID_FIELD, BookID, []);
  Result := Trim(TAuthorRecord.FormatName(BookAuthorLastName.Value, BookAuthorFirstName.Value, BookAuthorMiddleName.Value));
end;

procedure TDMCollection.FieldByName(AID: Integer; const AField: String; out ARes: String);
begin
  if AID <> 0 then
    FActiveTable.Locate(BOOK_ID_FIELD, AID, []);
  ARes := FActiveTable.FieldByName(AField).AsString;
end;

function TDMCollection.AuthorID(BookID: Integer): Integer;
begin
  if BookID <> 0 then
    BookAuthors_List.Locate(BOOK_ID_FIELD, BookID, []);
  Result := BookAuthors_ListAuthorID.Value;
end;

procedure TDMCollection.GetBookFileName(ID: Integer; out AFile: string; out AFolder: string; out AExt: string; out ANo: Integer);
begin
  FActiveTable.Locate(BOOK_ID_FIELD, ID, []);
  AExt := FActiveTable.FieldByName('Ext').AsString;
  AFile := FActiveTable.FieldByName(FILENAME_FIELD).AsString;

  if ExtractFileExt(AFile) <> ZIP_EXTENSION then // могут быть проблемы!
    AFile := AFile + AExt;

  AFolder := FActiveTable.FieldByName(FOLDER_FIELD).AsString;
  ANo := FActiveTable.FieldByName('InsideNo').AsInteger;
end;

function TDMCollection.GetBookGenres(BookID: Integer): string;
var
  S: string;
  i: Integer;
begin
  i := 0;
  BookGenres_List.Locate(BOOK_ID_FIELD, BookID, []);
  while (not BookGenres_List.Eof) and (BookGenres_ListBookID.Value = BookID) do
  begin
    if not BookGenresG_Alias.IsNull then
      S := S + BookGenresG_Alias.Value + ' / ';
    BookGenres_List.Next;
    Inc(i);
  end;
  Delete(S, Length(S) - 2, 3);
  Result := S;
end;

function TDMCollection.GetGenreCode(BookID: Integer): string;
begin
  BookGenres_List.Locate(BOOK_ID_FIELD, BookID, []);
  Result := BookGenresGenreCode.Value;
end;

function TDMCollection.GetRootGenre(BookID: Integer): string;
begin
  BookGenres_List.Locate(BOOK_ID_FIELD, BookID, []);
  Genres.Locate(GENRE_CODE_FIELD, BookGenresG_ParentCode.Value, []);
  Result := GenresG_Alias.Value;
end;

procedure TDMCollection.GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
var
  FilterStateA: Boolean;
  FilterStringA: string;
  FilterStateS: Boolean;

  BM1: TBookMark;
begin
  (* ***************************************************************************
    *
    * Более предпочтительно использовать 3 простых запроса,
    * но пока оставим как есть
    *
    *************************************************************************** *)

  BM1 := DMCollection.Authors.GetBookmark;
  try
    FilterStateA := DMCollection.Authors.Filtered;
    FilterStringA := DMCollection.Authors.Filter;

    FilterStateS := DMCollection.Series.Filtered;

    DMCollection.Authors.Filtered := False;
    DMCollection.Series.Filtered := False;

    AuthorsCount := DMCollection.Authors.RecordCount;
    BooksCount := DMCollection.tblBooks.RecordCount;
    SeriesCount := DMCollection.Series.RecordCount;

    DMCollection.Authors.Filter := FilterStringA;
    DMCollection.Authors.Filtered := FilterStateA;
    DMCollection.Series.Filtered := FilterStateS;

    DMCollection.Authors.GotoBookmark(BM1);
  finally
    DMCollection.Authors.FreeBookmark(BM1);
  end;
end;

procedure TDMCollection.SetActiveTable(Tag: Integer);
begin
  if Tag = PAGE_FAVORITES then
  begin
    FActiveTable := DMUser.GroupedBooks;
    FIsFavorites := True;
  end
  else
  begin
    FActiveTable := tblBooks;
    FIsFavorites := False;
  end;
end;

procedure TDMCollection.GetBookFolder(ID: Integer; out AFolder: String);
begin
  FActiveTable.Locate(BOOK_ID_FIELD, ID, []);
  if FActiveTable = tblBooks then
    AFolder := TPath.Combine(DMUser.ActiveCollection.RootPath, tblBooksFolder.Value)
  else
    AFolder := FActiveTable.FieldByName(FOLDER_FIELD).AsString;
end;

procedure TDMCollection.SetLocalStatus(AID: Integer; AState: Boolean);
begin

  //
  // Это совершенно неудачный вариант :(
  // На самом деле, поток должен посылать главному окну сообщение об окончании закачки книги,
  // окно отлавливает это сообщение, модифицирует базу и обновляет деревья
  //

  if AID <> 0 then
    if FActiveTable.Locate(BOOK_ID_FIELD, AID, []) then
    begin
      FActiveTable.Edit;
      FActiveTable.FieldByName('Local').AsBoolean := AState;
      FActiveTable.Post;

      if FActiveTable = DMUser.GroupedBooks then
        if DMCollection.tblBooks.Locate(BOOK_ID_FIELD, FActiveTable.FieldByName(BOOK_ID_FIELD).AsInteger, []) then
        begin
          DMCollection.tblBooks.Edit;
          DMCollection.tblBooksLocal.Value := AState;
          DMCollection.tblBooks.Post;
        end;

      //
      // обновим информацию о книге в главном окне программы
      //
      PostMessage(Application.MainFormHandle, WM_MHL_DOWNLOAD_COMPLETE, AID, Integer(LongBool(AState)));
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

  BookGenres_List.Active := State;
  BookGenres.Active := State;

  BookAuthors_List.Active := State;
  BookAuthor.Active := State;

  tblBooks.Active := State;
  tblExtra.Active := State;

  tblSeriesB1.Active := State;

  AllSeries.Active := State;
  AllBooks.Active := State;
  AllExtra.Active := State;
end;

// ============================================================================
//
// Новые методы
//
// ============================================================================

function TDMCollection.GetBookSerie(BookID: Integer; DatabaseID: Integer; SerieID: Integer): string;
begin
  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if AllSeries.Locate(SERIE_ID_FIELD, SerieID, []) then
      Result := AllSeriesS_Title.Value
    else
      Result := '';
    end
  else
    Result := DMUser.GetBookSerie(BookID, DatabaseID, SerieID);
end;

procedure TDMCollection.FillBookData(BookID: Integer; DatabaseID: Integer; Data: PBookData);
begin
  Assert(Assigned(Data));
  Initialize(Data^);
  Data.nodeType := ntBookInfo;

  if not AllBooks.Active then
  begin
    //
    // временная заглушка
    //
    Exit;
  end;

  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if not AllBooks.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      Assert(False);
      Exit;
    end;

    Data^.BookID := BookID;
    Data^.DatabaseID := DatabaseID;
    Data^.SerieID := AllBooksSerieID.Value;
    Data^.Title := AllBooksTitle.Value;
    Data^.Series := GetBookSerie(BookID, DatabaseID, AllBooksSerieID.Value);
    Data^.Genre := GetBookGenres(BookID);
    Data^.FullName := FullAuthorsString(BookID);
    Data^.CollectionName := DMUser.ActiveCollection.Name;
    Data^.FileType := AllBooksExt.Value;
    Delete(Data^.FileType, 1, 1);
    Data^.Lang := AllBooksLang.Value;
    Data^.Size := AllBooksSize.Value;
    Data^.No := AllBooksSeqNumber.Value;
    Data^.LibRate := AllBooksLibRate.Value;
    Data^.Code := AllBooksCode.Value;
    Data^.Locale := AllBooksLocal.Value;
    Data^.Deleted := AllBooksDeleted.Value;
    Data^.Date := AllBooksDate.Value;

    //
    // данные из таблицы Extra
    //
    Assert(AllExtra.Active);
    if AllExtra.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      Data^.Rate := AllExtraRate.Value;
      Data^.Progress := AllExtraProgress.Value;
    end;
  end
  else
    DMUser.FillBookData(BookID, DatabaseID, Data);
end;

procedure TDMCollection.GetCurrentBook(var R: TBookRecord);
var
  BookID: Integer;
begin
  //
  // TODO : необходимо объеденить этот метод со следующим
  //
  BookID := ActiveTable.FieldByName(BOOK_ID_FIELD).Value;

  R.Clear;
  R.Title := ActiveTable.FieldByName('Title').AsWideString;
  R.Series := IfThen(ActiveTable.FieldByName(SERIE_ID_FIELD).IsNull, NO_SERIES_TITLE, ActiveTable.FieldByName('Series').AsWideString);
  R.SeqNumber := ActiveTable.FieldByName('SeqNumber').AsInteger;
  R.Folder := ActiveTable.FieldByName(FOLDER_FIELD).AsWideString;
  R.FileName := ActiveTable.FieldByName(FILENAME_FIELD).AsWideString;
  R.FileExt := ActiveTable.FieldByName('Ext').AsWideString;
  R.Size := ActiveTable.FieldByName('Size').AsInteger;
  R.InsideNo := ActiveTable.FieldByName('InsideNo').AsInteger;
  R.Local := ActiveTable.FieldByName('Local').AsBoolean;
  R.Date := ActiveTable.FieldByName('Date').AsDateTime;
  R.Lang := ActiveTable.FieldByName('Lang').AsWideString;
  R.KeyWords := ActiveTable.FieldByName('KeyWords').AsWideString;
  R.Code := ActiveTable.FieldByName('Code').AsInteger;

  if tblExtra.Locate(BOOK_ID_FIELD, BookID, []) then
    R.Annotation := tblExtraAnnotation.Value;

  if ActiveTable.FieldByName(LIB_ID_FIELD).AsInteger <> 0 then
    R.LibID := ActiveTable.FieldByName(LIB_ID_FIELD).AsInteger
  else
    R.LibID := BookID;

  if not FIsFavorites then
  begin
    BookGenres_List.SetRange([BookID], [BookID]);
    try
      BookGenres_List.First;

      if not BookGenres_List.Eof then
      begin
        Genres.Locate(GENRE_CODE_FIELD, BookGenresG_ParentCode.Value, []);
        R.RootGenre.Alias := GenresG_Alias.Value;
      end;

      while not BookGenres_List.Eof do
      begin
        R.AddGenreFB2(
          BookGenresGenreCode.Value, BookGenresG_FB2Code.Value, BookGenresG_Alias.Value
        );
        BookGenres_List.Next;
      end;
    finally
      BookGenres_List.CancelRange;
    end;

    BookAuthors_List.SetRange([BookID], [BookID]);
    try
      BookAuthors_List.First;
      while not BookAuthors_List.Eof do
      begin
        R.AddAuthor(
          BookAuthorLastName.Value, BookAuthorFirstName.Value, BookAuthorMiddleName.Value, BookAuthorA_ID.Value
        );
        BookAuthors_List.Next;
      end;
    finally
      BookAuthors_List.CancelRange;
    end;
  end // not Favorites
  else
  begin
    R.AddGenreFB2('', '', ActiveTable.FieldByName('Genres').AsWideString);
    R.AddAuthor(ActiveTable.FieldByName('FullName').AsWideString, '', '');
  end;
end;

procedure TDMCollection.GetBookRecord(BookID: Integer; DatabaseID: Integer; var BookRecord: TBookRecord);
begin
  BookRecord.Clear;

  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if not AllBooks.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      Assert(False);
      Exit;
    end;

    BookRecord.Title := AllBooksTitle.Value;
    BookRecord.Folder := AllBooksFolder.Value;
    BookRecord.FileName := AllBooksFileName.Value;
    BookRecord.FileExt := AllBooksExt.Value;
    BookRecord.InsideNo := AllBooksInsideNo.Value;
    BookRecord.Series := GetBookSerie(BookID, DatabaseID, AllBooksSerieID.Value);
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
    BookRecord.URI := AllBooksURI.Value;

    //
    // данные из таблицы Extra
    //
    Assert(AllExtra.Active);
    if AllExtra.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      BookRecord.Annotation := AllExtraAnnotation.Value;
    end;

    BookGenres_List.SetRange([BookID], [BookID]);
    try
      BookGenres_List.First;

      if not BookGenres_List.Eof then
      begin
        Genres.Locate(GENRE_CODE_FIELD, BookGenresG_ParentCode.Value, []);
        BookRecord.RootGenre.Alias := GenresG_Alias.Value;
      end;

      while not BookGenres_List.Eof do
      begin
        BookRecord.AddGenreFB2(
          BookGenresGenreCode.Value, BookGenresG_FB2Code.Value, BookGenresG_Alias.Value
        );
        BookGenres_List.Next;
      end;
    finally
      BookGenres_List.CancelRange;
    end;

    BookAuthors_List.SetRange([BookID], [BookID]);
    try
      BookAuthors_List.First;
      while not BookAuthors_List.Eof do
      begin
        BookRecord.AddAuthor(
          BookAuthorLastName.Value, BookAuthorFirstName.Value, BookAuthorMiddleName.Value,
          BookAuthorA_ID.Value
        );
        BookAuthors_List.Next;
      end;
    finally
      BookAuthors_List.CancelRange;
    end;
  end
  else
    DMUser.GetBookRecord(BookID, DatabaseID, BookRecord);
end;

procedure TDMCollection.SetLocal(BookID: Integer; DatabaseID: Integer; AState: Boolean);
begin
  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if AllBooks.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      AllBooks.Edit;
      AllBooksLocal.Value := AState;
      AllBooks.Post;
    end;
  end;

  DMUser.SetLocal(BookID, DatabaseID, AState);
end;

procedure TDMCollection.UpdateExtra(BookID, DatabaseID: Integer; UpdateProc: TUpdateExtraProc);
begin
  Assert(AllExtra.Active);

  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if AllExtra.Locate(BOOK_ID_FIELD, BookID, []) then
      AllExtra.Edit
    else
    begin
      AllExtra.Append;
      AllExtraBookID.Value := BookID;
    end;

    UpdateProc;

    AllExtra.Post;
  end;
end;

procedure TDMCollection.ClearExtra(BookID: Integer; DatabaseID: Integer; UpdateProc: TUpdateExtraProc);
begin
  Assert(AllExtra.Active);

  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if AllExtra.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      AllExtra.Edit;
      UpdateProc;
      AllExtra.Post;
    end;
  end;

  //
  // все значимые поля таблицы пусты - удалим запись
  //
  if AllExtraAnnotation.IsNull and AllExtraReview.IsNull and AllExtraRate.IsNull and AllExtraProgress.IsNull then
    AllExtra.Delete;
end;

procedure TDMCollection.SetRate(BookID, DatabaseID, Rate: Integer);
begin
  if Rate = 0 then
    ClearExtra(
      BookID, DatabaseID,
      procedure
      begin
        AllExtraRate.Clear;
      end
    )
  else
    UpdateExtra(
      BookID, DatabaseID,
      procedure
      begin
        AllExtraRate.Value := Rate;
      end
    );

  //
  // Обновим информацию в группах
  //
  DMUser.SetRate(BookID, DatabaseID, Rate);
end;

procedure TDMCollection.SetProgress(BookID, DatabaseID, Progress: Integer);
begin
  if Progress = 0 then
    ClearExtra(
      BookID, DatabaseID,
      procedure
      begin
        AllExtraProgress.Clear;
      end
    )
  else
    UpdateExtra(
      BookID, DatabaseID,
      procedure
      begin
        AllExtraProgress.Value := Progress;
      end
    );

  //
  // Обновим информацию в группах
  //
  DMUser.SetProgress(BookID, DatabaseID, Progress);
end;

function TDMCollection.GetReview(BookID: Integer; DatabaseID: Integer): string;
begin
  Assert(AllExtra.Active);

  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if AllExtra.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      Result := AllExtraReview.Value;
    end;
  end
  else
    Result := DMUser.GetReview(BookID, DatabaseID);
end;

function TDMCollection.SetReview(BookID: Integer; DatabaseID: Integer; const Review: string): Integer;
var
  NewReview: string;
begin
  Result := 0;
  NewReview := Trim(Review);

  if (DatabaseID = DMUser.ActiveCollection.ID) and AllBooks.Locate(BOOK_ID_FIELD, BookID, []) then
  begin
    AllBooks.Edit;

    if NewReview = '' then
    begin
      ClearExtra(
        BookID, DatabaseID,
        procedure
        begin
          AllExtraReview.Clear
        end
      );
      AllBooksCode.Value := 0;
    end
    else
    begin
      UpdateExtra(
        BookID, DatabaseID,
        procedure
        begin
          AllExtraReview.Value := NewReview;
        end
      );
      AllBooksCode.Value := 1;
      Result := 1;
    end;

    AllBooks.Post;
  end;

  //
  // Обновим информацию в группах
  //
  Result := Result or DMUser.SetReview(BookID, DatabaseID, NewReview);
end;

procedure TDMCollection.AddBookToGroup(BookID: Integer; DatabaseID: Integer; GroupID: Integer);
begin
  Assert(DatabaseID = DMUser.ActiveCollection.ID);
  Assert(AllBooks.Active);
  Assert(AllExtra.Active);
  Assert(DMUser.AllBooks.Active);

  if not AllBooks.Locate(BOOK_ID_FIELD, BookID, []) then
  begin
    Assert(False);
    Exit;
  end;

  //
  // Добавить книгу в таблицу Books
  //
  if not DMUser.AllBooks.Locate(BOOK_DB_FIELDS, VarArrayOf([BookID, DatabaseID]), []) then
  begin
    DMUser.AllBooks.Append;

    DMUser.AllBooksBookID.Value := BookID;
    DMUser.AllBooksDatabaseID.Value := DatabaseID;
    DMUser.AllBooksLibID.Value := AllBooksLibID.Value;
    DMUser.AllBooksTitle.Value := AllBooksTitle.Value;
    DMUser.AllBooksFullName.Value := FullAuthorsString(BookID);
    DMUser.AllBooksSerieID.Value := AllBooksSerieID.Value;
    DMUser.AllBooksSeqNumber.Value := AllBooksSeqNumber.Value;
    DMUser.AllBooksDate.Value := AllBooksDate.Value;
    DMUser.AllBooksLibRate.Value := AllBooksLibRate.Value;
    DMUser.AllBooksLang.Value := AllBooksLang.Value;
    DMUser.AllBooksFolder.Value := TPath.Combine(DMUser.ActiveCollection.RootFolder, AllBooksFolder.Value);
    DMUser.AllBooksFileName.Value := AllBooksFileName.Value;
    DMUser.AllBooksInsideNo.Value := AllBooksInsideNo.Value;
    DMUser.AllBooksExt.Value := AllBooksExt.Value;
    DMUser.AllBooksSize.Value := AllBooksSize.Value;
    DMUser.AllBooksURI.Value := AllBooksURI.Value;
    DMUser.AllBooksCode.Value := AllBooksCode.Value;
    DMUser.AllBooksLocal.Value := AllBooksLocal.Value;
    DMUser.AllBooksDeleted.Value := AllBooksDeleted.Value;
    DMUser.AllBooksKeyWords.Value := AllBooksKeyWords.Value;

    if AllExtra.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      DMUser.AllBooksReview.Value := AllExtraReview.Value;
      DMUser.AllBooksRate.Value := AllExtraRate.Value;
      DMUser.AllBooksProgress.Value := AllExtraProgress.Value;
    end;

    DMUser.AllBooksGenres.Value := GetBookGenres(BookID);
    DMUser.AllBooksSeries.Value := GetBookSerie(BookID, DatabaseID, AllBooksSerieID.Value);

    DMUser.AllBooks.Post;
  end;

  //
  // Поместить книгу в нужную группу
  //
  DMUser.CopyBookToGroup(BookID, DatabaseID, 0, GroupID, False);
end;

end.
