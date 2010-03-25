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
    dsBooksA: TDataSource;
    tblBooksA: TABSTable;
    tblBooksG: TABSTable;
    tblGenres: TABSTable;
    dsBooksG: TDataSource;
    tblAuthorsS: TABSTable;
    tblBooksS: TABSTable;
    dsSeries: TDataSource;
    dsAuthorsS: TDataSource;
    dsBooksS: TDataSource;
    tblAuthorsSID: TAutoIncField;
    tblAuthorsSFamily: TWideStringField;
    tblAuthorsSName: TWideStringField;
    tblBooksAID: TAutoIncField;
    tblBooksASerieID: TIntegerField;
    tblBooksASeqNumber: TSmallintField;
    tblBooksADate: TDateField;
    tblBooksALibID: TIntegerField;
    tblBooksAInsideNo: TIntegerField;
    tblBooksAFileName: TWideStringField;
    tblBooksAext: TWideStringField;
    tblBooksASize: TIntegerField;
    tblBooksACode: TSmallintField;
    tblBooksAFolder: TWideStringField;
    tblBooksALocal: TBooleanField;
    tblBooksADeleted: TBooleanField;
    tblBooks_Genre_List: TABSTable;
    dsBook_Genre_List: TDataSource;
    dsBooks_Genres: TDataSource;
    tblGenre_List: TABSTable;
    dsGenre_List: TDataSource;
    tblBooksSID: TAutoIncField;
    tblBooksSSerieID: TIntegerField;
    tblBooksSSeqNumber: TSmallintField;
    tblBooksSDate: TDateField;
    tblBooksSTitle: TWideStringField;
    tblBooksSLibID: TIntegerField;
    tblBooksSInsideNo: TIntegerField;
    tblBooksSFileName: TWideStringField;
    tblBooksSext: TWideStringField;
    tblBooksSSize: TIntegerField;
    tblBooksSCode: TSmallintField;
    tblBooksSFolder: TWideStringField;
    tblBooksSLocal: TBooleanField;
    tblBooksSDeleted: TBooleanField;
    tblBooksGID: TAutoIncField;
    tblBooksGSerieID: TIntegerField;
    tblBooksGSeqNumber: TSmallintField;
    tblBooksGDate: TDateField;
    tblBooksGTitle: TWideStringField;
    tblBooksGLibID: TIntegerField;
    tblBooksGInsideNo: TIntegerField;
    tblBooksGFileName: TWideStringField;
    tblBooksGext: TWideStringField;
    tblBooksGSize: TIntegerField;
    tblBooksGCode: TSmallintField;
    tblBooksGFolder: TWideStringField;
    tblBooksGLocal: TBooleanField;
    tblBooksGDeleted: TBooleanField;
    tblAuthor_List: TABSTable;
    dsAuthor_List: TDataSource;
    tblBooks: TABSTable;
    tblSeriesA: TABSTable;
    dsBooks: TDataSource;
    tblBooks_Genres: TABSTable;
    tblAuthor_Detail: TABSTable;
    tblAuthor_Master: TABSTable;
    dsAuthor_Detail: TDataSource;
    dsAuthor_Master: TDataSource;
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
    tblSeriesB: TABSTable;
    tblExtra: TABSTable;
    tblAuthors: TABSQuery;
    tblAuthorsID: TAutoIncField;
    tblAuthorsFamily: TWideStringField;
    tblAuthorsName: TWideStringField;
    tblAuthorsMiddle: TWideStringField;
    tblSeries: TABSQuery;
    tblSeriesSerieID: TAutoIncField;
    tblSeriesAuthID: TIntegerField;
    tblSeriesTitle: TWideStringField;
    tblSeriesGenreCode: TWideStringField;
    tblBooksALibRate: TIntegerField;
    tblBooksALang: TWideStringField;
    tblBooksAURI: TWideStringField;
    tblBooksLibRate: TIntegerField;
    tblBooksLang: TWideStringField;
    tblBooksURI: TWideStringField;
    tblBooksSLibRate: TIntegerField;
    tblBooksSLang: TWideStringField;
    tblBooksSURI: TWideStringField;
    tblBooksGLibRate: TIntegerField;
    tblBooksGLang: TWideStringField;
    tblBooksGURI: TWideStringField;
    tblBooksKeyWords: TWideStringField;
    sqlBooks: TABSQuery;
    sqlBooksLibID: TIntegerField;
    sqlBooksTitle: TWideStringField;
    sqlBooksSerieID: TIntegerField;
    sqlBooksSeqNumber: TSmallintField;
    sqlBooksDate: TDateField;
    sqlBooksLibRate: TIntegerField;
    sqlBooksLang: TWideStringField;
    sqlBooksFolder: TWideStringField;
    sqlBooksFileName: TWideStringField;
    sqlBooksInsideNo: TIntegerField;
    sqlBooksExt: TWideStringField;
    sqlBooksSize: TIntegerField;
    sqlBooksURI: TWideStringField;
    sqlBooksCode: TSmallintField;
    sqlBooksLocal: TBooleanField;
    sqlBooksDeleted: TBooleanField;
    sqlBooksKeyWords: TWideStringField;
    sqlBooksRate: TIntegerField;
    tblBooksAKeyWords: TWideStringField;
    tblBooksSKeyWords: TWideStringField;
    tblBooksGKeyWords: TWideStringField;
    sqlBooksFullName: TWideStringField;
    tblGenresG_ID: TAutoIncField;
    tblGenresGenreCode: TWideStringField;
    tblGenresG_ParentCode: TWideStringField;
    tblGenresG_FB2Code: TWideStringField;
    tblGenresG_Alias: TWideStringField;
    tblGenre_ListGL_ID: TAutoIncField;
    tblGenre_ListGenreCode: TWideStringField;
    tblGenre_ListBookID: TIntegerField;
    tblGenre_ListGL_Family: TWideStringField;
    tblGenre_ListGL_Series: TWideStringField;
    tblGenre_ListGL_Title: TWideStringField;
    tblAuthor_ListAuthorID: TIntegerField;
    tblAuthor_ListBookID: TIntegerField;
    tblAuthor_ListAL_Series: TWideStringField;
    tblAuthor_ListAL_Title: TWideStringField;
    tblBooks_Genre_ListGL_ID: TAutoIncField;
    tblBooks_Genre_ListGenreCode: TWideStringField;
    tblBooks_Genre_ListBookID: TIntegerField;
    tblBooks_Genre_ListGL_Family: TWideStringField;
    tblBooks_Genre_ListGL_Series: TWideStringField;
    tblBooks_Genre_ListGL_Title: TWideStringField;
    tblBooks_GenresG_ID: TAutoIncField;
    tblBooks_GenresGenreCode: TWideStringField;
    tblBooks_GenresG_ParentCode: TWideStringField;
    tblBooks_GenresG_FB2Code: TWideStringField;
    tblBooks_GenresG_Alias: TWideStringField;
    tblSeriesASerieID: TAutoIncField;
    tblSeriesAAuthorID: TIntegerField;
    tblSeriesAGenreCode: TWideStringField;
    tblSeriesAS_Title: TWideStringField;
    tblAuthor_MasterAuthorID: TIntegerField;
    tblAuthor_MasterBookID: TIntegerField;
    tblAuthor_MasterAL_Series: TWideStringField;
    tblAuthor_MasterAL_Title: TWideStringField;
    tblAuthor_DetailA_ID: TAutoIncField;
    tblAuthor_DetailA_Family: TWideStringField;
    tblAuthor_DetailA_Name: TWideStringField;
    tblAuthor_DetailA_Middle: TWideStringField;
    tblBooksATitle: TWideStringField;
    tblBooksAFullName: TWideStringField;
    dsGenres: TDataSource;
    tblSeriesBSerieID: TAutoIncField;
    tblSeriesBAuthorID: TIntegerField;
    tblSeriesBGenreCode: TWideStringField;
    tblSeriesBS_Title: TWideStringField;
    tblBooksASeries: TWideStringField;
    tblBooksSSeries: TWideStringField;
    tblBooksGSeries: TWideStringField;
    tblBooksSeries: TWideStringField;
    sqlBooksSeries: TWideStringField;
    tblBooksFullName: TWideStringField;
    sqlBooksID: TIntegerField;
    tblExtraBookID: TIntegerField;
    tblExtraAnnotation: TWideMemoField;
    tblExtraReview: TWideMemoField;
    Books: TABSTable;
    BooksBookID: TAutoIncField;
    BooksLibID: TIntegerField;
    BooksTitle: TWideStringField;
    BooksFullName: TWideStringField;
    BooksSerieID: TIntegerField;
    BooksSeqNumber: TSmallintField;
    BooksDate: TDateField;
    BooksLibRate: TIntegerField;
    BooksLang: TWideStringField;
    BooksFolder: TWideStringField;
    BooksFileName: TWideStringField;
    BooksInsideNo: TIntegerField;
    BooksExt: TWideStringField;
    BooksSize: TIntegerField;
    BooksURI: TWideStringField;
    BooksCode: TSmallintField;
    BooksLocal: TBooleanField;
    BooksDeleted: TBooleanField;
    BooksKeyWords: TWideStringField;
    AllSeries: TABSTable;
    AllSeriesSerieID: TAutoIncField;
    AllSeriesS_Title: TWideStringField;
    Extra: TABSTable;
    ExtraBookID: TIntegerField;
    ExtraAnnotation: TWideMemoField;
    ExtraReview: TWideMemoField;
    ExtraRate: TIntegerField;
    ExtraProgress: TIntegerField;

  private
    FIsFavorites: Boolean;
    FActiveTable: TABSTable;

  public
    procedure GetBookFileName(ID: Integer; out AFile, AFolder, AExt: string; out ANo: Integer);

    procedure SetActiveTable(Tag: Integer);
    procedure GetCurrentBook(var R: TBookRecord);
    function GetBookGenres(BookID: Integer; FirstOnly: Boolean): string;
    function GetRootGenre(BookID: Integer): string;
    function GetGenreCode(BookID: Integer): string;

    procedure FieldByName(AID: Integer; const AField: string; out ARes: string); overload;
    procedure FieldByName(AID: Integer; const AField: string; out ARes: Integer); overload;
    procedure FieldByName(AID: Integer; const AField: string; out ARes: Boolean); overload;

    procedure GetBookFolder(ID: Integer; out AFolder: string);
    procedure SetLocalStatus(AID: Integer; AState: Boolean);

    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
    property ActiveTable: TABSTable read FActiveTable;

    procedure Clear;
    procedure SetTableState(State: Boolean);
    function FullName(BookID: Integer): string;
    function AuthorID(BookID: Integer): Integer;
    function FullAuthorsString(BookID: Integer): string;

    //
    //
    //
    function SerieByID(SerieID: Integer): string;
    procedure FillBookData(BookID: Integer; DatabaseID: Integer; Data: PBookData);

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
    procedure AddBookToGroup(BookID: Integer; DatabaseID: Integer; GropID: Integer);

  private type
    TUpdateExtraProc = reference to procedure;

  private
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
  tblAuthor_Master.Locate(BOOK_ID_FIELD, BookID, []);
  while (not tblAuthor_Master.Eof) and (tblAuthor_MasterBookID.Value = BookID) do
  begin
    S := Trim(TAuthorRecord.FormatName(tblAuthor_DetailA_Family.Value, tblAuthor_DetailA_Name.Value, tblAuthor_DetailA_Middle.Value));

    Result := IfThen(Result = '', S, Result + ', ' + S);
    tblAuthor_Master.Next;
  end
end;

function TDMCollection.FullName(BookID: Integer): string;
begin
  if BookID <> 0 then
    tblAuthor_Master.Locate(BOOK_ID_FIELD, BookID, []);
  Result := Trim(TAuthorRecord.FormatName(tblAuthor_DetailA_Family.Value, tblAuthor_DetailA_Name.Value, tblAuthor_DetailA_Middle.Value));
end;

procedure TDMCollection.FieldByName(AID: Integer; const AField: String; out ARes: String);
begin
  if AID <> 0 then
    FActiveTable.Locate(BOOK_ID_FIELD, AID, []);
  ARes := FActiveTable.FieldByName(AField).AsString;
end;

procedure TDMCollection.FieldByName(AID: Integer; const AField: String; out ARes: Integer);
begin
  if AID <> 0 then
    FActiveTable.Locate(BOOK_ID_FIELD, AID, []);
  ARes := FActiveTable.FieldByName(AField).AsInteger;
end;

function TDMCollection.AuthorID(BookID: Integer): Integer;
begin
  if BookID <> 0 then
    tblAuthor_Master.Locate(BOOK_ID_FIELD, BookID, []);
  Result := tblAuthor_MasterAuthorID.Value;
end;

procedure TDMCollection.Clear;
begin
  SetTableState(False);

  // tblAuthors.EmptyTable;
  tblAuthor_List.EmptyTable;
  // tblSeries.EmptyTable;
  tblBooksA.EmptyTable;
  tblBooksS.EmptyTable;
  tblGenres.EmptyTable;
  tblBooks_Genre_List.EmptyTable;
  tblBooks_Genres.EmptyTable;
  tblGenre_List.EmptyTable;
  tblBooksG.EmptyTable;
  tblBooks.EmptyTable;
  tblSeriesA.EmptyTable;
  tblSeriesB.EmptyTable;

  SetTableState(True);
end;

procedure TDMCollection.FieldByName(AID: Integer; const AField: String; out ARes: Boolean);
begin
  if AID <> 0 then
    FActiveTable.Locate(BOOK_ID_FIELD, AID, []);
  ARes := FActiveTable.FieldByName(AField).AsBoolean;
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

function TDMCollection.GetBookGenres(BookID: Integer; FirstOnly: Boolean): String;
var
  S: String;
  i: Integer;
begin
  i := 0;
  tblBooks_Genre_List.Locate(BOOK_ID_FIELD, BookID, []);
  while (not tblBooks_Genre_List.Eof) and (tblBooks_Genre_ListBookID.Value = BookID) do
  begin
    if FirstOnly and (i > 0) then
      Break;
    if not tblBooks_GenresG_Alias.IsNull then
      S := S + tblBooks_GenresG_Alias.Value + ' / ';
    tblBooks_Genre_List.Next;
    inc(i);
  end;
  Delete(S, Length(S) - 2, 3);
  Result := S;
end;

procedure TDMCollection.GetCurrentBook(var R: TBookRecord);
var
  BookID: Integer;
begin
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
  if not FIsFavorites then
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
    tblBooks_Genre_List.Locate(BOOK_ID_FIELD, BookID, []);
    tblGenres.Locate(GENRE_CODE_FIELD, tblBooks_GenresG_ParentCode.Value, []);
    R.RootGenre.Alias := tblGenresG_Alias.Value;

    while (not tblBooks_Genre_List.Eof) and (tblBooks_Genre_ListBookID.AsInteger = BookID) do
    begin
      R.AddGenreFB2(
        tblBooks_GenresGenreCode.AsWideString,
        tblBooks_GenresG_FB2Code.AsWideString,
        tblBooks_GenresG_Alias.AsWideString
      );

      tblBooks_Genre_List.Next;
    end;

    (* ***************************************************************************
      * Попробовал использовать Query для получения информации об авторах книги.
      * По совершенно необъяснимым для меня причинам это работало ОЧЕНЬ медленно.
      * Возможно, стоит исследовать этот вопрос дополнительно.
      *
      * select A1."Family", A1."Name", A1."Middle"
      * from "Author_List" A2 inner join "Authors" A1 on (A2."AuthID" = A1."ID")
      * where (A2."BookID" = :BookID)
      *
      *)

    tblAuthor_Master.Locate(BOOK_ID_FIELD, BookID, []);
    while (not tblAuthor_Master.Eof) and (tblAuthor_MasterBookID.Value = BookID) do
    begin
      R.AddAuthor(
        tblAuthor_DetailA_Family.AsWideString,
        tblAuthor_DetailA_Name.AsWideString,
        tblAuthor_DetailA_Middle.AsWideString,
        tblAuthor_DetailA_ID.Value
      );

      tblAuthor_Master.Next;
    end
  end // not Favorites
  else
  begin
    R.AddGenreFB2('', '', ActiveTable.FieldByName('Genres').AsWideString);
    R.AddAuthor(ActiveTable.FieldByName('FullName').AsWideString, '', '');
  end;
end;

function TDMCollection.GetGenreCode(BookID: Integer): String;
begin
  tblBooks_Genre_List.Locate(BOOK_ID_FIELD, BookID, []);
  Result := tblBooks_GenresGenreCode.Value;
end;

function TDMCollection.GetRootGenre(BookID: Integer): string;
begin
  tblBooks_Genre_List.Locate(BOOK_ID_FIELD, BookID, []);
  tblGenres.Locate(GENRE_CODE_FIELD, tblBooks_GenresG_ParentCode.Value, []);
  Result := tblGenresG_Alias.Value;
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

  BM1 := DMCollection.tblAuthors.GetBookmark;
  try
    FilterStateA := DMCollection.tblAuthors.Filtered;
    FilterStringA := DMCollection.tblAuthors.Filter;

    FilterStateS := DMCollection.tblSeries.Filtered;

    DMCollection.tblAuthors.Filtered := False;
    DMCollection.tblSeries.Filtered := False;

    AuthorsCount := DMCollection.tblAuthors.RecordCount;
    BooksCount := DMCollection.tblBooks.RecordCount;
    SeriesCount := DMCollection.tblSeries.RecordCount;

    DMCollection.tblAuthors.Filter := FilterStringA;
    DMCollection.tblAuthors.Filtered := FilterStateA;
    DMCollection.tblSeries.Filtered := FilterStateS;

    DMCollection.tblAuthors.GotoBookmark(BM1);
  finally
    DMCollection.tblAuthors.FreeBookmark(BM1);
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
    AFolder := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder) + FActiveTable.FieldByName(FOLDER_FIELD).AsString
  else
    AFolder := FActiveTable.FieldByName(FOLDER_FIELD).AsString;
end;

procedure TDMCollection.SetLocalStatus(AID: Integer; AState: Boolean);
begin
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
  tblAuthors.Active := State;
  tblAuthor_List.Active := State;
  tblSeries.Active := State;
  tblBooksA.Active := State;
  tblBooksS.Active := State;
  tblGenres.Active := State;
  tblBooks_Genres.Active := State;
  tblBooks_Genre_List.Active := State;
  tblGenre_List.Active := State;
  tblBooksG.Active := State;
  tblBooks.Active := State;
  tblSeriesA.Active := State;
  tblSeriesB.Active := State;
  tblExtra.Active := State;
  tblAuthor_Master.Active := State;
  tblAuthor_Detail.Active := State;

  AllSeries.Active := State;
  Books.Active := State;
  Extra.Active := State;
end;

function TDMCollection.SerieByID(SerieID: Integer): string;
begin
  if AllSeries.Locate(SERIE_ID_FIELD, SerieID, []) then
    Result := AllSeriesS_Title.Value
  else
    Result := '';
end;

procedure TDMCollection.FillBookData(BookID: Integer; DatabaseID: Integer; Data: PBookData);
begin
  Assert(Assigned(Data));
  Initialize(Data^);
  Data.nodeType := ntBookInfo;

  if not Books.Active then
  begin
    //
    // временная заглушка
    //
    Exit;
  end;

  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if not Books.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      Assert(False);
      Exit;
    end;

    Data^.BookID := BookID;
    Data^.DatabaseID := DatabaseID;
    Data^.SerieID := BooksSerieID.Value;

    Data^.Title := BooksTitle.Value;
    //if Data^.SerieID <> NO_SERIE_ID then
    //  Data^.Series := BooksSeries.Value;
    Data^.Series := SerieByID(BooksSerieID.Value);

    Data^.Genre := GetBookGenres(BookID, False);
    Data^.FullName := FullAuthorsString(BookID);
    Data^.CollectionName := DMUser.ActiveCollection.Name;
    Data^.FileType := BooksExt.Value;
    Delete(Data^.FileType, 1, 1);
    Data^.Lang := BooksLang.Value;
    Data^.Size := BooksSize.Value;
    Data^.No := BooksSeqNumber.Value;
    Data^.LibRate := BooksLibRate.Value;
    Data^.Code := BooksCode.Value;
    Data^.Locale := BooksLocal.Value;
    Data^.Deleted := BooksDeleted.Value;
    Data^.Date := BooksDate.Value;

    //
    // данные из таблицы Extra
    //
    Assert(Extra.Active);

    if Extra.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      Data^.Rate := ExtraRate.Value;
      Data^.Progress := ExtraProgress.Value;
    end;
  end
  else
    DMUser.FillBookData(BookID, DatabaseID, Data);
end;

procedure TDMCollection.UpdateExtra(BookID, DatabaseID: Integer; UpdateProc: TUpdateExtraProc);
begin
  Assert(Extra.Active);

  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if Extra.Locate(BOOK_ID_FIELD, BookID, []) then
      Extra.Edit
    else
    begin
      Extra.Append;
      ExtraBookID.Value := BookID;
    end;

    UpdateProc;

    Extra.Post;
  end;
end;

procedure TDMCollection.ClearExtra(BookID: Integer; DatabaseID: Integer; UpdateProc: TUpdateExtraProc);
begin
  Assert(Extra.Active);

  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if Extra.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      Extra.Edit;
      UpdateProc;
      Extra.Post;
    end;
  end;

  //
  // все значимые поля таблицы пусты - удалим запись
  //
  if ExtraAnnotation.IsNull and ExtraReview.IsNull and ExtraRate.IsNull and ExtraProgress.IsNull then
    Extra.Delete;
end;

procedure TDMCollection.SetRate(BookID, DatabaseID, Rate: Integer);
begin
  if Rate = 0 then
    ClearExtra(
      BookID, DatabaseID,
      procedure
      begin
        ExtraRate.Clear;
      end
    )
  else
    UpdateExtra(
      BookID, DatabaseID,
      procedure
      begin
        ExtraRate.Value := Rate;
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
        ExtraProgress.Clear;
      end
    )
  else
    UpdateExtra(
      BookID, DatabaseID,
      procedure
      begin
        ExtraProgress.Value := Progress;
      end
    );

  //
  // Обновим информацию в группах
  //
  DMUser.SetProgress(BookID, DatabaseID, Progress);
end;

function TDMCollection.GetReview(BookID: Integer; DatabaseID: Integer): string;
begin
  Assert(Extra.Active);

  if DatabaseID = DMUser.ActiveCollection.ID then
  begin
    if Extra.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      Result := ExtraReview.Value;
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

  if (DatabaseID = DMUser.ActiveCollection.ID) and Books.Locate(BOOK_ID_FIELD, BookID, []) then
  begin
    Books.Edit;

    if NewReview = '' then
    begin
      ClearExtra(
        BookID, DatabaseID,
        procedure
        begin
          ExtraReview.Clear
        end
      );
      BooksCode.Value := 0;
    end
    else
    begin
      UpdateExtra(
        BookID, DatabaseID,
        procedure
        begin
          ExtraReview.Value := NewReview;
        end
      );
      BooksCode.Value := 1;
      Result := 1;
    end;

    Books.Post;
  end;

  //
  // Обновим информацию в группах
  //
  Result := Result or DMUser.SetReview(BookID, DatabaseID, NewReview);
end;

procedure TDMCollection.AddBookToGroup(BookID: Integer; DatabaseID: Integer; GropID: Integer);
var
  MasterSource: TDataSource;
begin
  Assert(DatabaseID = DMUser.ActiveCollection.ID);
  Assert(Books.Active);
  Assert(Extra.Active);
  Assert(DMUser.Books.Active);

  if not Books.Locate(BOOK_ID_FIELD, BookID, []) then
  begin
    Assert(False);
    Exit;
  end;

  //
  // Добавить книгу в таблицу Books
  //
  if not DMUser.Books.Locate(BOOK_DB_FIELDS, VarArrayOf([BookID, DatabaseID]), []) then
  begin
    DMUser.Books.Append;

    DMUser.BooksBookID.Value := BookID;
    DMUser.BooksDatabaseID.Value := DatabaseID;
    DMUser.BooksLibID.Value := BooksLibID.Value;
    DMUser.BooksTitle.Value := BooksTitle.Value;
    DMUser.BooksFullName.Value := FullAuthorsString(BookID);
    DMUser.BooksSerieID.Value := BooksSerieID.Value;
    DMUser.BooksSeqNumber.Value := BooksSeqNumber.Value;
    DMUser.BooksDate.Value := BooksDate.Value;
    DMUser.BooksLibRate.Value := BooksLibRate.Value;
    DMUser.BooksLang.Value := BooksLang.Value;
    DMUser.BooksFolder.Value := TPath.Combine(DMUser.ActiveCollection.RootFolder, BooksFolder.Value);
    DMUser.BooksFileName.Value := BooksFileName.Value;
    DMUser.BooksInsideNo.Value := BooksInsideNo.Value;
    DMUser.BooksExt.Value := BooksExt.Value;
    DMUser.BooksSize.Value := BooksSize.Value;
    DMUser.BooksURI.Value := BooksURI.Value;
    DMUser.BooksCode.Value := BooksCode.Value;
    DMUser.BooksLocal.Value := BooksLocal.Value;
    DMUser.BooksDeleted.Value := BooksDeleted.Value;
    DMUser.BooksKeyWords.Value := BooksKeyWords.Value;

    if Extra.Locate(BOOK_ID_FIELD, BookID, []) then
    begin
      DMUser.BooksReview.Value := ExtraReview.Value;
      DMUser.BooksRate.Value := ExtraRate.Value;
      DMUser.BooksProgress.Value := ExtraProgress.Value;
    end;

    DMUser.BooksGenres.Value := GetBookGenres(BookID, False);
    DMUser.BooksSeries.Value := SerieByID(BooksSerieID.Value);

    DMUser.Books.Post;
  end;

  //
  // Поместить книгу в нужную группу
  //
  MasterSource := DMUser.BookGroups.MasterSource;
  DMUser.BookGroups.MasterSource := nil;
  try
    if not DMUser.BookGroups.Locate(GROUP_ID_FIELD + ';' + BOOK_DB_FIELDS, VarArrayOf([GropID, BookID, DatabaseID]), []) then
    begin
      DMUser.BookGroups.Append;
      DMUser.BookGroupsGroupID.Value := GropID;
      DMUser.BookGroupsBookID.Value := BookID;
      DMUser.BookGroupsDatabaseID.Value := DatabaseID;
      DMUser.BookGroups.Post;
    end;
  finally
    DMUser.BookGroups.MasterSource := MasterSource;
  end;
end;

end.
