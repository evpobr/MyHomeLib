(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Aleksey Penkov  alex.penkov@gmail.com
  *                     Nick Rymanov (nrymanov@gmail.com)
  * Created             12.02.2010
  * Description
  *
  * $Id$
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_Database_Abstract;

interface

uses
  Classes,
  UserData,
  unit_Globals,
  unit_Interfaces;

type
  TGUIUpdateExtraProc = reference to procedure(
    const BookKey: TBookKey;
    extra: TBookExtra
  );

  TBookCollection = class abstract
  public // virtual
    procedure ReloadDefaultGenres(const FileName: string); virtual; abstract;
    procedure SetPropertyS(PropID: Integer; const Value: string); virtual; abstract;
    function CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean; virtual; abstract;
    function InsertBook(BookRecord: TBookRecord; CheckFileName, FullCheck: Boolean): Integer; virtual; abstract;
    procedure DeleteBook(const BookKey: TBookKey); virtual; abstract;
    procedure GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord; LoadMemos: Boolean); virtual; abstract;
    function GetTopGenreAlias(const FB2Code: string): string; virtual; abstract;
    procedure CleanBookGenres(BookID: Integer); virtual; abstract;
    procedure InsertBookGenres(const BookID: Integer; var Genres: TBookGenres); virtual; abstract;
    procedure GetSeries(SeriesList: TStrings); virtual; abstract;
    procedure SetSeriesTitle(const SeriesID: Integer; const NewSeriesTitle: string); virtual; abstract;
    function AddOrLocateSeriesIDBySeriesTitle(const SeriesTitle: string): Integer; virtual; abstract;
    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer); virtual; abstract;
    procedure ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc); virtual; abstract;
    procedure ExportUserData(data: TUserData); virtual; abstract;
    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer); virtual; abstract;
    procedure UpdateBook(const BookRecord: TBookRecord); virtual; abstract;
    function SetReview(const BookKey: TBookKey; const Review: string): Integer; virtual; abstract;
    function GetReview(const BookKey: TBookKey): string; virtual; abstract;
    procedure SetProgress(const BookKey: TBookKey; Progress: Integer); virtual; abstract;
    procedure SetRate(const BookKey: TBookKey; Rate: Integer); virtual; abstract;
    procedure SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer); virtual; abstract;
    procedure SetFolder(const BookKey: TBookKey; const Folder: string); virtual; abstract;
    procedure SetFileName(const BookKey: TBookKey; const FileName: string); virtual; abstract;
    procedure SetLocal(const BookKey: TBookKey; AState: Boolean); virtual; abstract;
    procedure GetBookLibID(const BookKey: TBookKey; out ARes: string); virtual; abstract; // deprecated;
    procedure TruncateTablesBeforeImport; virtual; abstract;

    procedure CompactDatabase; virtual; abstract;
    procedure RepairDatabase; virtual; abstract;

    //
    // Bulk operation
    //
    procedure BeginBulkOperation; virtual; abstract;
    procedure EndBulkOperation(Commit: Boolean = True); virtual; abstract;

    // Iterators:
    function GetBookIterator1(const Mode: TBookIteratorMode; const LoadMemos: Boolean; const Filter: string = ''): IBookIterator; virtual; abstract;
    function GetBookIterator2(const LoadMemos: Boolean; const SearchCriteria: TBookSearchCriteria): IBookIterator; virtual; abstract;
    function GetAuthorIterator(const Mode: TAuthorIteratorMode; const Filter: string = ''): IAuthorIterator; virtual; abstract;
    function GetGenreIterator(const Mode: TGenreIteratorMode; const Filter: string = ''): IGenreIterator; virtual; abstract;
    function GetSeriesIterator(const Mode: TSeriesIteratorMode; const Filter: string = ''): ISeriesIterator; virtual; abstract;

  protected // virtual
    procedure InsertGenreIfMissing(const GenreData: TGenreData); virtual; abstract;
    procedure GetGenre(const GenreCode: string; var Genre: TGenreData); virtual; abstract;

  public
    procedure SetPropertyI(PropID: Integer; const Value: Integer);
    procedure VerifyCurrentCollection(const DatabaseID: Integer);
    procedure AddBookToGroup(const BookKey: TBookKey; GroupID: Integer);

  protected
    procedure LoadGenres(const GenresFileName: string);
    procedure FilterDuplicateAuthorsByID(var Authors: TBookAuthors);
    procedure FilterDuplicateGenresByCode(var Genres: TBookGenres);
    procedure GetBookGenres(BookID: Integer; var BookGenres: TBookGenres; RootGenre: PGenreData = nil);
    procedure GetBookAuthors(BookID: Integer; var BookAuthors: TBookAuthors);

  strict private
    FAuthorFilterType: string;
    FSeriesFilterType: string;
    FShowLocalOnly: Boolean;
    FHideDeleted: Boolean;

  public
    property HideDeleted: Boolean read FHideDeleted write FHideDeleted;
    property ShowLocalOnly: Boolean read FShowLocalOnly write FShowLocalOnly;
    property SeriesFilterType: string read FSeriesFilterType write FSeriesFilterType;
    property AuthorFilterType: string read FAuthorFilterType write FAuthorFilterType;
  end;

resourcestring
  rstrFavoritesGroupName = 'Избранное';
  rstrToReadGroupName = 'К прочтению';


implementation

uses
  Generics.Collections,
  SysUtils,
  dm_user,
  unit_Errors,
  unit_Consts;

{ TBookCollection }

procedure TBookCollection.SetPropertyI(PropID: Integer; const Value: Integer);
begin
  if Value = 0 then
    Exit;

  SetPropertyS(PropID, IntToStr(Value));
end;

procedure TBookCollection.LoadGenres(const GenresFileName: string);
var
  FS: TStringList;
  i: Integer;
  p: Integer;
  S: string;
  Genre: TGenreData;
begin
  FS := TStringList.Create;
  try
    FS.LoadFromFile(GenresFileName, TEncoding.UTF8);

    for i := 0 to FS.Count - 1 do
    begin
      S := FS[i];
      //
      // Пропустим пустые строки
      //
      if S = '' then
        Continue;

      //
      // ... и комментарии
      //
      if S[1] = '#' then
        Continue;

      //
      // Дальше идут строки в следующем формате
      // -------------------------------------
      // 0.1 Фантастика (Научная фантастика и Фэнтези)
      // 0.2 Детективы и Триллеры
      // ...
      // 0.1.0 sf;Научная Фантастика
      // 0.1.1 sf_history;Альтернативная история
      // ...
      // -------------------------------------

      //
      // Выделяем код (0.1)
      //
      p := AnsiPos(' ', S);
      if 0 = p then
        Continue;
      Genre.GenreCode := Copy(S, 1, p - 1);
      Delete(S, 1, p);

      //
      // и код родительского элемента (0)
      //
      p := LastDelimiter('.', Genre.GenreCode);
      if 0 = p then
        Continue;
      Genre.ParentCode := Copy(Genre.GenreCode, 1, p - 1);

      //
      // fb2 код. Может отсутствовать! (sf)
      //
      Genre.FB2GenreCode := '';
      p := AnsiPos(';', S);
      if 0 <> p then
      begin
        Genre.FB2GenreCode := Copy(S, 1, p - 1);
        Delete(S, 1, p);
      end;

      Genre.GenreAlias := S;

      //
      // Если такой жанр уже существует => пропустим его
      //
      InsertGenreIfMissing(Genre);
    end;
  finally
    FS.Free;
  end;
end;

// Filter out duplicates by author ID
procedure TBookCollection.FilterDuplicateAuthorsByID(var Authors: TBookAuthors);
var
  MapId: TList<Integer>;
  NewAuthors: TBookAuthors;
  AuthorData: TAuthorData;
  Len: Integer;
begin
  Len := 0;

  MapId := TList<Integer>.Create;
  try
    for AuthorData in Authors do
    begin
      if -1 = MapId.IndexOf(AuthorData.AuthorID) then
      begin
        SetLength(NewAuthors, Len + 1);
        NewAuthors[Len] := AuthorData;
        Inc(Len);
        MapId.Add(AuthorData.AuthorID);
      end;
    end;
  finally
    FreeAndNil(MapId);
  end;
  Authors := NewAuthors;
end;

// Filter out duplicates by genre code
procedure TBookCollection.FilterDuplicateGenresByCode(var Genres: TBookGenres);
var
  MapId: TList<string>;
  NewGenres: TBookGenres;
  GenreData: TGenreData;
  Len: Integer;
begin
  Len := 0;

  MapId := TList<string>.Create;
  try
    for GenreData in Genres do
    begin
      if -1 = MapId.IndexOf(GenreData.GenreCode) then
      begin
        SetLength(NewGenres, Len + 1);
        NewGenres[Len] := GenreData;
        Inc(Len);
        MapId.Add(GenreData.GenreCode);
      end;
    end;
  finally
    FreeAndNil(MapId);
  end;
  Genres := NewGenres;
end;

procedure TBookCollection.GetBookGenres(BookID: Integer; var BookGenres: TBookGenres; RootGenre: PGenreData = nil);
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

procedure TBookCollection.GetBookAuthors(BookID: Integer; var BookAuthors: TBookAuthors);
var
  AuthorIterator: IAuthorIterator;
  i: Integer;
begin
  AuthorIterator := GetAuthorIterator(amByBook, Format('a.%s = %u', [BOOK_ID_FIELD, BookID]));
  SetLength(BookAuthors, AuthorIterator.GetNumRecords + 1); // an extra dummy element
  i := 0;
  while AuthorIterator.Next(BookAuthors[i]) do
    Inc(i);
  SetLength(BookAuthors, AuthorIterator.GetNumRecords); // remove the dummy element
end;

procedure TBookCollection.VerifyCurrentCollection(const DatabaseID: Integer);
var
  BookCollectionName: string;
  CurrentCollectionName: string;
begin
  if DatabaseID <> DMUser.ActiveCollectionInfo.ID then
  begin
    if (DMUser.SelectCollection(DatabaseID)) then
      BookCollectionName := DMUser.CurrentCollectionInfo.Name
    else
      BookCollectionName := '';
    raise ENotSupportedException.Create(Format(rstrErrorOnlyForCurrentCollection, [DMUser.ActiveCollectionInfo.Name, BookCollectionName]));
  end;
end;

procedure TBookCollection.AddBookToGroup(const BookKey: TBookKey; GroupID: Integer);
var
  BookRecord: TBookRecord;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  GetBookRecord(BookKey, BookRecord, True);

  DMUser.AddBookToGroup(BookKey, GroupID, BookRecord);
end;

end.
