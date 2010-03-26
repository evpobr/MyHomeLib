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
    tblBooks_Genre_List: TABSTable;
    dsBook_Genre_List: TDataSource;
    dsBooks_Genres: TDataSource;
    tblGenre_List: TABSTable;
    dsGenre_List: TDataSource;
    tblBooksSID: TAutoIncField;
    tblBooksSSerieID: TIntegerField;
    tblBooksGID: TAutoIncField;
    tblBooksGSerieID: TIntegerField;
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
    tblBooksLibRate: TIntegerField;
    tblBooksLang: TWideStringField;
    tblBooksURI: TWideStringField;
    tblBooksKeyWords: TWideStringField;
    sqlBooks: TABSQuery;
    sqlBooksSerieID: TIntegerField;
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
    dsGenres: TDataSource;
    tblSeriesBSerieID: TAutoIncField;
    tblSeriesBAuthorID: TIntegerField;
    tblSeriesBGenreCode: TWideStringField;
    tblSeriesBS_Title: TWideStringField;
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

    procedure SetLocalStatus(AID: Integer; AState: Boolean);
    procedure GetBookFolder(ID: Integer; out AFolder: string);

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
    function GetBookSerie(BookID: Integer; DatabaseID: Integer; SerieID: Integer): string;
    procedure FillBookData(BookID: Integer; DatabaseID: Integer; Data: PBookData);

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

procedure TDMCollection.FieldByName(AID: Integer; const AField: string; out ARes: Boolean);
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

function TDMCollection.GetBookGenres(BookID: Integer; FirstOnly: Boolean): string;
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
    AFolder := TPath.Combine(DMUser.ActiveCollection.RootPath, FActiveTable.FieldByName(FOLDER_FIELD).AsString)
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
  AllBooks.Active := State;
  AllExtra.Active := State;
end;

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
    //if Data^.SerieID <> NO_SERIE_ID then
    //  Data^.Series := BooksSeries.Value;
    Data^.Series := GetBookSerie(BookID, DatabaseID, AllBooksSerieID.Value);

    Data^.Genre := GetBookGenres(BookID, False);
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

    DMUser.AllBooksGenres.Value := GetBookGenres(BookID, False);
    DMUser.AllBooksSeries.Value := DMCollection.GetBookSerie(BookID, DatabaseID, AllBooksSerieID.Value);

    DMUser.AllBooks.Post;
  end;

  //
  // Поместить книгу в нужную группу
  //
  DMUser.CopyBookToGroup(BookID, DatabaseID, 0, GroupID, False);
end;

end.
