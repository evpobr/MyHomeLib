unit dm_collection;

interface

uses
  SysUtils, Classes, ABSMain, DB, unit_globals;

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
    sqlBooksID: TIntegerField;
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
    tblExtraID: TAutoIncField;
    tblExtraBookID: TIntegerField;
    tblExtraAnnotation: TMemoField;
    tblExtraReview: TMemoField;
    tblExtraCover: TBlobField;
    tblExtraData: TMemoField;
  private
    FActiveTable: TAbsTable;

    { Private declarations }
  public
    procedure GetBookFileName(ID: integer; out AFile, AFolder, AExt: string;
      out ANo: integer);

    procedure SetActiveTable(Tag: integer);
    procedure GetCurrentBook(var R: TBookRecord);
    function GetBookGenres(BookID: Integer; FirstOnly: boolean): String;

    procedure FieldByName(AID: integer; AField: String; out ARes: String); overload;
    procedure FieldByName(AID: integer; AField: String; out ARes: integer); overload;
    procedure FieldByName(AID: integer; AField: String; out Ares: boolean); overload;

    procedure GetBookFolder(ID: integer; out AFolder: String);
    procedure SetLocalStatus(AId: integer; AState: boolean);

    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
    property ActiveTable: TabsTable read FActiveTable;

    procedure Clear;
    procedure SetTableState(State: boolean);
    function FullName(BookID: Integer): string;

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

function TDMCollection.FullName(BookID: Integer): string;
begin
  if BookID <> 0 then tblAuthor_Master.Locate('AL_BookID', BookID, []);
  Result := trim(tblAuthor_DetailA_Family.Value + ' ' +
                 tblAuthor_DetailA_Name.Value +  ' ' +
                 tblAuthor_DetailA_Middle.Value);
end;

procedure TDMCollection.FieldByName(AID: integer; AField: String; out ARes: String);
begin
  if AID<> 0 then FActiveTable.Locate('ID', AID, []);
  ARes := FActiveTable.FieldByName(AField).AsString;
end;

procedure TDMCollection.FieldByName(AID: integer; AField: String; out ARes: integer);
begin
  if AID<> 0 then FActiveTable.Locate('ID', AID, []);
  ARes := FActiveTable.FieldByName(AField).AsInteger;
end;

procedure TDMCollection.Clear;
begin
  SetTableState(False);

//  tblAuthors.EmptyTable;
  tblAuthor_List.EmptyTable;
//  tblSeries.EmptyTable;
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

procedure TDMCollection.FieldByName(AID: integer; AField: String; out Ares: boolean);
begin
  if AID <> 0 then FActiveTable.Locate('ID', AID, []);
  ARes := FActiveTable.FieldByName(AField).AsBoolean;
end;

procedure TDMCollection.GetBookFileName(ID: integer; out AFile:string;
                                  out AFolder: string; out AExt: string;
                                  out ANo:integer);
begin
  FActiveTable.Locate('ID', ID, []);
  AExt := FActiveTable.FieldByName('Ext').AsString;
  AFile := FActiveTable.FieldByName('FileName').AsString + AExt;
  AFolder := FActiveTable.FieldByName('Folder').AsString;
  ANo := FActiveTable.FieldByName('InsideNo').AsInteger;
end;

function TDMCollection.GetBookGenres(BookID: Integer; FirstOnly: boolean): String;
var
  s: String;
  i: integer;
begin
  i := 0;
  tblBooks_Genre_List.Locate('GL_BookID', BookID, []);
  while (not tblBooks_Genre_List.Eof) and (tblBooks_Genre_ListGL_BookID.Value = BookID) do
  begin
    if FirstOnly and (i > 0) then Break;
    if not tblBooks_GenresG_Alias.IsNull then
      s := s + tblBooks_GenresG_Alias.Value + ' / ';
    tblBooks_Genre_List.Next;
    inc(i);
  end;
  Delete(S, Length(S) - 2, 3);
  Result := s;
end;

procedure TDMCollection.GetCurrentBook(var R: TBookRecord);
var
  BookID: Integer;
begin
  BookID := tblBooksID.Value;

  R.Clear;

  R.Title := tblBooksTitle.Value;
  R.Series := IfThen(tblBooksSerID.IsNull, NO_SERIES_TITLE, tblBooksSeries.Value);
  R.SeqNumber := tblBooksSeqNumber.Value;
  R.Folder := tblBooksFolder.Value;
  R.FileName := tblBooksFileName.Value;
  R.FileExt := tblBooksExt.Value;
  R.Size := tblBooksSize.Value;
  R.InsideNo := tblBooksInsideNo.Value;
  R.Date := tblBooksDate.Value;
  R.Lang := tblBooksLang.Value;
  R.KeyWords := tblBooksKeyWords.Value;

  tblBooks_Genre_List.Locate('GL_BookID', BookID, []);
  while (not tblBooks_Genre_List.Eof) and (tblBooks_Genre_ListGL_BookID.Value = BookID) do
  begin
    R.AddGenreFB2(
      tblBooks_GenresG_Code.Value,
      tblBooks_GenresG_FB2Code.Value,
      tblBooks_GenresG_Alias.Value
      );

    tblBooks_Genre_List.Next;
  end;

  (****************************************************************************
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
      tblAuthor_DetailA_Family.Value,
      tblAuthor_DetailA_Name.Value,
      tblAuthor_DetailA_Middle.Value
      );

    tblAuthor_Master.Next;
  end;
end;

procedure TDMCollection.GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
var
  FilterStateA: boolean;
  FilterStringA: string;
  FilterStateS: boolean;

  BM1: TBookMark;
begin
  (****************************************************************************
   *
   * Более предпочтительно использовать 3 простых запроса,
   * но пока оставим как есть
   *
   ****************************************************************************)

  BM1 := DMCollection.tblAuthors.GetBookmark;
  try
    FilterStateA := DMCollection.tblAuthors.Filtered;
    FilterStringA := DMCollection.tblAuthors.Filter;

    FilterStateS := DMCollection.tblSeries.Filtered;


    DMCollection.tblAuthors.Filtered := False;
    DMCollection.tblSeries.Filtered  := False;

    AuthorsCount := DMCollection.tblAuthors.RecordCount;
    BooksCount := DMCollection.tblBooks.RecordCount;
    SeriesCount := DMCollection.tblSeries.RecordCount;

    DMCollection.tblAuthors.Filter := FilterStringA;
    DMCollection.tblAuthors.Filtered := FilterStateA;
    DMCollection.tblSeries.Filtered  := FilterStateS;

    DMCollection.tblAuthors.GotoBookmark(BM1);
  finally
    DMCollection.tblAuthors.FreeBookmark(BM1);
  end;
end;

procedure TDMCollection.SetActiveTable(Tag: integer);
begin
  if Tag = PAGE_FAVORITES then
    FActiveTable := DMUser.tblGrouppedBooks
  else
    FActiveTable := tblBooks;
end;

procedure TDMCollection.GetBookFolder(ID: integer; out AFolder: String);
begin
  FActiveTable.Locate('ID', ID, []);
  if FActiveTable.Name = 'tblBooks' then
    AFolder := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder) + FActiveTable.FieldByName('Folder').AsString
  else
    AFolder := FActiveTable.FieldByName('Folder').AsString;
end;

procedure TDMCollection.SetLocalStatus(AId: integer; AState: boolean);
begin
  if Aid <> 0 then
  if  FActiveTable.Locate('ID',AId,[]) then
  begin
    FActiveTable.Edit;
    FActiveTable.FieldByName('Local').AsBoolean := AState;
    FActiveTable.Post;

    //
    // обновим информацию о книге в главном окне программы
    //
    PostMessage(
      Application.MainFormHandle,
      WM_MHL_DOWNLOAD_COMPLETE,
      AId,
      Integer(LongBool(AState))
      );

  end;
end;

procedure TDMCollection.SetTableState(State: boolean);
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
