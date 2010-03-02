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
  SysUtils,
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
    tblBooksASerID: TIntegerField;
    tblBooksASeqNumber: TSmallintField;
    tblBooksADate: TDateField;
    tblBooksARate: TIntegerField;
    tblBooksALibID: TIntegerField;
    tblBooksAInsideNo: TIntegerField;
    tblBooksAFileName: TWideStringField;
    tblBooksAext: TWideStringField;
    tblBooksASize: TIntegerField;
    tblBooksACode: TSmallintField;
    tblBooksAFolder: TWideStringField;
    tblBooksADiscID: TIntegerField;
    tblBooksALocal: TBooleanField;
    tblBooksADeleted: TBooleanField;
    tblBooks_Genre_List: TABSTable;
    dsBook_Genre_List: TDataSource;
    dsBooks_Genres: TDataSource;
    tblGenre_List: TABSTable;
    dsGenre_List: TDataSource;
    tblBooksSID: TAutoIncField;
    tblBooksSSerID: TIntegerField;
    tblBooksSSeqNumber: TSmallintField;
    tblBooksSDate: TDateField;
    tblBooksSTitle: TWideStringField;
    tblBooksSRate: TIntegerField;
    tblBooksSLibID: TIntegerField;
    tblBooksSInsideNo: TIntegerField;
    tblBooksSFileName: TWideStringField;
    tblBooksSext: TWideStringField;
    tblBooksSSize: TIntegerField;
    tblBooksSCode: TSmallintField;
    tblBooksSFolder: TWideStringField;
    tblBooksSDiscID: TIntegerField;
    tblBooksSLocal: TBooleanField;
    tblBooksSDeleted: TBooleanField;
    tblBooksGID: TAutoIncField;
    tblBooksGSerID: TIntegerField;
    tblBooksGSeqNumber: TSmallintField;
    tblBooksGDate: TDateField;
    tblBooksGTitle: TWideStringField;
    tblBooksGRate: TIntegerField;
    tblBooksGLibID: TIntegerField;
    tblBooksGInsideNo: TIntegerField;
    tblBooksGFileName: TWideStringField;
    tblBooksGext: TWideStringField;
    tblBooksGSize: TIntegerField;
    tblBooksGCode: TSmallintField;
    tblBooksGFolder: TWideStringField;
    tblBooksGDiscID: TIntegerField;
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
    tblBooksSerID: TIntegerField;
    tblBooksSeqNumber: TSmallintField;
    tblBooksDatabaseID: TIntegerField;
    tblBooksLibID: TIntegerField;
    tblBooksDate: TDateField;
    tblBooksTitle: TWideStringField;
    tblBooksInsideNo: TIntegerField;
    tblBooksFileName: TWideStringField;
    tblBooksExt: TWideStringField;
    tblBooksSize: TIntegerField;
    tblBooksCode: TSmallintField;
    tblBooksFolder: TWideStringField;
    tblBooksDiscID: TIntegerField;
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
    tblSeriesID: TAutoIncField;
    tblSeriesAuthID: TIntegerField;
    tblSeriesTitle: TWideStringField;
    tblSeriesGenreCode: TWideStringField;
    tblBooksRate: TIntegerField;
    tblBooksAProgress: TSmallintField;
    tblBooksSProgress: TSmallintField;
    tblBooksGProgress: TSmallintField;
    tblBooksProgress: TSmallintField;
    tblBooksADatabaseID: TIntegerField;
    tblBooksALibRate: TIntegerField;
    tblBooksALang: TWideStringField;
    tblBooksAURI: TWideStringField;
    tblBooksLibRate: TIntegerField;
    tblBooksLang: TWideStringField;
    tblBooksURI: TWideStringField;
    tblBooksSDatabaseID: TIntegerField;
    tblBooksSLibRate: TIntegerField;
    tblBooksSLang: TWideStringField;
    tblBooksSURI: TWideStringField;
    tblBooksGDatabaseID: TIntegerField;
    tblBooksGLibRate: TIntegerField;
    tblBooksGLang: TWideStringField;
    tblBooksGURI: TWideStringField;
    tblBooksKeyWords: TWideStringField;
    sqlBooks: TABSQuery;
    sqlBooksDatabaseID: TIntegerField;
    sqlBooksLibID: TIntegerField;
    sqlBooksTitle: TWideStringField;
    sqlBooksSerID: TIntegerField;
    sqlBooksSeqNumber: TSmallintField;
    sqlBooksDate: TDateField;
    sqlBooksLibRate: TIntegerField;
    sqlBooksLang: TWideStringField;
    sqlBooksDiscID: TIntegerField;
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
    sqlBooksProgress: TSmallintField;
    sqlBooksRate: TIntegerField;
    tblBooksAKeyWords: TWideStringField;
    tblBooksSKeyWords: TWideStringField;
    tblBooksGKeyWords: TWideStringField;
    sqlBooksFullName: TWideStringField;
    tblGenresG_ID: TAutoIncField;
    tblGenresG_Code: TWideStringField;
    tblGenresG_ParentCode: TWideStringField;
    tblGenresG_FB2Code: TWideStringField;
    tblGenresG_Alias: TWideStringField;
    tblGenre_ListGL_ID: TAutoIncField;
    tblGenre_ListGL_Code: TWideStringField;
    tblGenre_ListGL_BookID: TIntegerField;
    tblGenre_ListGL_Family: TWideStringField;
    tblGenre_ListGL_Series: TWideStringField;
    tblGenre_ListGL_Title: TWideStringField;
    tblAuthor_ListAL_ID: TAutoIncField;
    tblAuthor_ListAL_AuthID: TIntegerField;
    tblAuthor_ListAL_BookID: TIntegerField;
    tblAuthor_ListAL_Series: TWideStringField;
    tblAuthor_ListAL_Title: TWideStringField;
    tblBooks_Genre_ListGL_ID: TAutoIncField;
    tblBooks_Genre_ListGL_Code: TWideStringField;
    tblBooks_Genre_ListGL_BookID: TIntegerField;
    tblBooks_Genre_ListGL_Family: TWideStringField;
    tblBooks_Genre_ListGL_Series: TWideStringField;
    tblBooks_Genre_ListGL_Title: TWideStringField;
    tblBooks_GenresG_ID: TAutoIncField;
    tblBooks_GenresG_Code: TWideStringField;
    tblBooks_GenresG_ParentCode: TWideStringField;
    tblBooks_GenresG_FB2Code: TWideStringField;
    tblBooks_GenresG_Alias: TWideStringField;
    tblSeriesAS_ID: TAutoIncField;
    tblSeriesAS_AuthID: TIntegerField;
    tblSeriesAS_GenreCode: TWideStringField;
    tblSeriesAS_Title: TWideStringField;
    tblAuthor_MasterAL_ID: TAutoIncField;
    tblAuthor_MasterAL_AuthID: TIntegerField;
    tblAuthor_MasterAL_BookID: TIntegerField;
    tblAuthor_MasterAL_Series: TWideStringField;
    tblAuthor_MasterAL_Title: TWideStringField;
    tblAuthor_DetailA_ID: TAutoIncField;
    tblAuthor_DetailA_Family: TWideStringField;
    tblAuthor_DetailA_Name: TWideStringField;
    tblAuthor_DetailA_Middle: TWideStringField;
    tblBooksATitle: TWideStringField;
    tblBooksAFullName: TWideStringField;
    dsGenres: TDataSource;
    tblSeriesBS_ID: TAutoIncField;
    tblSeriesBS_AuthID: TIntegerField;
    tblSeriesBS_GenreCode: TWideStringField;
    tblSeriesBS_Title: TWideStringField;
    tblBooksASeries: TWideStringField;
    tblBooksSSeries: TWideStringField;
    tblBooksGSeries: TWideStringField;
    tblBooksSeries: TWideStringField;
    sqlBooksSeries: TWideStringField;
    tblBooksFullName: TWideStringField;
    sqlBooksID: TIntegerField;
    tblExtraE_ID: TAutoIncField;
    tblExtraE_BookID: TIntegerField;
    tblExtraE_Annotation: TWideMemoField;
    tblExtraE_Review: TWideMemoField;
    tblExtraE_Cover: TBlobField;
    tblExtraE_Data: TWideMemoField;

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

    procedure FieldByName(AID: Integer; AField: string; out ARes: string); overload;
    procedure FieldByName(AID: Integer; AField: string; out ARes: Integer); overload;
    procedure FieldByName(AID: Integer; AField: string; out ARes: Boolean); overload;

    procedure GetBookFolder(ID: Integer; out AFolder: string);
    procedure SetLocalStatus(AID: Integer; AState: Boolean);

    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
    property ActiveTable: TABSTable read FActiveTable;

    procedure Clear;
    procedure SetTableState(State: Boolean);
    function FullName(BookID: Integer): string;
    function AuthorID(BookID: Integer): Integer;
    function FullAuthorsString(BookID: Integer): string;
  end;

var
  DMCollection: TDMCollection;

implementation

uses
  Windows,
  Forms,
  dm_user,
  frm_main,
  StrUtils,
  unit_Consts,
  unit_Messages;

{$R *.dfm}

{ TDMMain }

function TDMCollection.FullAuthorsString(BookID: Integer): string;
var
  S: string;
begin
  Result := '';
  tblAuthor_Master.Locate('AL_BookID', BookID, []);
  while (not tblAuthor_Master.Eof) and (tblAuthor_MasterAL_BookID.Value = BookID) do
  begin
    { TODO -oNickR : использовать метод TAuthorRecord }
    S := Trim(tblAuthor_DetailA_Family.Value + ' ' + tblAuthor_DetailA_Name.Value + ' ' + tblAuthor_DetailA_Middle.Value);

    Result := IfThen(Result = '', S, Result + ', ' + S);
    tblAuthor_Master.Next;
  end
end;

function TDMCollection.FullName(BookID: Integer): string;
begin
  if BookID <> 0 then
    tblAuthor_Master.Locate('AL_BookID', BookID, []);
  { TODO -oNickR : использовать метод TAuthorRecord }
  Result := Trim(tblAuthor_DetailA_Family.Value + ' ' + tblAuthor_DetailA_Name.Value + ' ' + tblAuthor_DetailA_Middle.Value);
end;

procedure TDMCollection.FieldByName(AID: Integer; AField: String; out ARes: String);
begin
  if AID <> 0 then
    FActiveTable.Locate('ID', AID, []);
  ARes := FActiveTable.FieldByName(AField).AsString;
end;

procedure TDMCollection.FieldByName(AID: Integer; AField: String; out ARes: Integer);
begin
  if AID <> 0 then
    FActiveTable.Locate('ID', AID, []);
  ARes := FActiveTable.FieldByName(AField).AsInteger;
end;

function TDMCollection.AuthorID(BookID: Integer): Integer;
begin
  if BookID <> 0 then
    tblAuthor_Master.Locate('AL_BookID', BookID, []);
  Result := tblAuthor_MasterAL_AuthID.Value;
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

procedure TDMCollection.FieldByName(AID: Integer; AField: String; out ARes: Boolean);
begin
  if AID <> 0 then
    FActiveTable.Locate('ID', AID, []);
  ARes := FActiveTable.FieldByName(AField).AsBoolean;
end;

procedure TDMCollection.GetBookFileName(ID: Integer; out AFile: string; out AFolder: string; out AExt: string; out ANo: Integer);
begin
  FActiveTable.Locate('ID', ID, []);
  AExt := FActiveTable.FieldByName('Ext').AsString;
  AFile := FActiveTable.FieldByName('FileName').AsString;

  if ExtractFileExt(AFile) <> ZIP_EXTENSION then // могут быть проблемы!
    AFile := AFile + AExt;

  AFolder := FActiveTable.FieldByName('Folder').AsString;
  ANo := FActiveTable.FieldByName('InsideNo').AsInteger;
end;

function TDMCollection.GetBookGenres(BookID: Integer; FirstOnly: Boolean): String;
var
  S: String;
  i: Integer;
begin
  i := 0;
  tblBooks_Genre_List.Locate('GL_BookID', BookID, []);
  while (not tblBooks_Genre_List.Eof) and (tblBooks_Genre_ListGL_BookID.Value = BookID) do
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
  BookID := ActiveTable.FieldByName('ID').Value;

  R.Clear;
  R.Title := ActiveTable.FieldByName('Title').AsWideString;
  R.Series := IfThen(ActiveTable.FieldByName('SerID').IsNull, NO_SERIES_TITLE, ActiveTable.FieldByName('Series').AsWideString);
  R.SeqNumber := ActiveTable.FieldByName('SeqNumber').AsInteger;
  R.Folder := ActiveTable.FieldByName('Folder').AsWideString;
  R.FileName := ActiveTable.FieldByName('FileName').AsWideString;
  R.FileExt := ActiveTable.FieldByName('Ext').AsWideString;
  R.Size := ActiveTable.FieldByName('Size').AsInteger;
  R.InsideNo := ActiveTable.FieldByName('InsideNo').AsInteger;
  R.Local := ActiveTable.FieldByName('Local').AsBoolean;
  R.Date := ActiveTable.FieldByName('Date').AsDateTime;
  R.Lang := ActiveTable.FieldByName('Lang').AsWideString;
  if not FIsFavorites then
    R.KeyWords := ActiveTable.FieldByName('KeyWords').AsWideString;
  R.Code := ActiveTable.FieldByName('Code').AsInteger;

  if tblExtra.Locate('E_BookID', BookID, []) then
    R.Annotation := tblExtraE_Annotation.Value;

  if ActiveTable.FieldByName('LibID').AsInteger <> 0 then
    R.LibID := ActiveTable.FieldByName('LibID').AsInteger
  else
    R.LibID := BookID;

  if not FIsFavorites then
  begin
    tblBooks_Genre_List.Locate('GL_BookID', BookID, []);
    tblGenres.Locate('G_Code', tblBooks_GenresG_ParentCode.Value, []);
    R.RootGenre.Alias := tblGenresG_Alias.Value;

    while (not tblBooks_Genre_List.Eof) and (tblBooks_Genre_ListGL_BookID.AsInteger = BookID) do
    begin
      R.AddGenreFB2(
        tblBooks_GenresG_Code.AsWideString,
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

    tblAuthor_Master.Locate('AL_BookID', BookID, []);
    while (not tblAuthor_Master.Eof) and (tblAuthor_MasterAL_BookID.Value = BookID) do
    begin
      R.AddAuthor(
        tblAuthor_DetailA_Family.AsWideString,
        tblAuthor_DetailA_Name.AsWideString,
        tblAuthor_DetailA_Middle.AsWideString
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
  tblBooks_Genre_List.Locate('GL_BookID', BookID, []);
  Result := tblBooks_GenresG_Code.Value;
end;

function TDMCollection.GetRootGenre(BookID: Integer): string;
begin
  tblBooks_Genre_List.Locate('GL_BookID', BookID, []);
  tblGenres.Locate('G_Code', tblBooks_GenresG_ParentCode.Value, []);
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
    FActiveTable := DMUser.tblGrouppedBooks;
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
  FActiveTable.Locate('ID', ID, []);
  if FActiveTable.Name = 'tblBooks' then
    AFolder := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder) + FActiveTable.FieldByName('Folder').AsString
  else
    AFolder := FActiveTable.FieldByName('Folder').AsString;
end;

procedure TDMCollection.SetLocalStatus(AID: Integer; AState: Boolean);
begin
  if AID <> 0 then
    if FActiveTable.Locate('ID', AID, []) then
    begin
      FActiveTable.Edit;
      FActiveTable.FieldByName('Local').AsBoolean := AState;
      FActiveTable.Post;

      if FActiveTable.Name = 'tblGrouppedBooks' then
        if DMCollection.tblBooks.Locate('ID', FActiveTable.FieldByName('OuterID').AsInteger, []) then
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
end;

end.
