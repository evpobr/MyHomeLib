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
  Generics.Collections,
  UserData,
  unit_Globals,
  unit_Interfaces,
  unit_SystemDatabase;

type
  TBookCollection = class abstract (TInterfacedObject, IBookCollection)
  public // virtual
    //
    // IBookCollection
    //

    // Iterators:
    function GetAuthorIterator(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue = nil): IAuthorIterator; virtual; abstract;
    function GetGenreIterator(const Mode: TGenreIteratorMode; const FilterValue: PFilterValue = nil): IGenreIterator; virtual; abstract;
    function GetSeriesIterator(const Mode: TSeriesIteratorMode): ISeriesIterator; virtual; abstract;
    function GetBookIterator(const Mode: TBookIteratorMode; const LoadMemos: Boolean; const FilterValue: PFilterValue = nil): IBookIterator; virtual; abstract;
    function Search(const SearchCriteria: TBookSearchCriteria; const LoadMemos: Boolean): IBookIterator; virtual; abstract;

    //
    //
    //
    function InsertBook(BookRecord: TBookRecord; const CheckFileName: Boolean; const FullCheck: Boolean): Integer; virtual; abstract;
    procedure GetBookRecord(const BookKey: TBookKey; out BookRecord: TBookRecord; const LoadMemos: Boolean); virtual; abstract;
    procedure UpdateBook(BookRecord: TBookRecord); virtual; abstract;
    procedure DeleteBook(const BookKey: TBookKey); virtual; abstract;
    procedure AddBookToGroup(const BookKey: TBookKey; const GroupID: Integer);

    function GetLibID(const BookKey: TBookKey): string; virtual; abstract; // deprecated;
    function GetReview(const BookKey: TBookKey): string; virtual; abstract;

    function SetReview(const BookKey: TBookKey; const Review: string): Integer; virtual; abstract;
    procedure SetProgress(const BookKey: TBookKey; const Progress: Integer); virtual; abstract;
    procedure SetRate(const BookKey: TBookKey; const Rate: Integer); virtual; abstract;
    procedure SetLocal(const BookKey: TBookKey; const AState: Boolean); virtual; abstract;
    procedure SetFolder(const BookKey: TBookKey; const Folder: string); virtual; abstract;
    procedure SetFileName(const BookKey: TBookKey; const FileName: string); virtual; abstract;
    procedure SetSeriesID(const BookKey: TBookKey; const SeriesID: Integer); virtual; abstract;

    //
    // манипуляции с авторами книги
    //
    procedure CleanBookAuthors(const BookID: Integer); virtual; abstract;
    procedure InsertBookAuthors(const BookID: Integer; const Authors: TBookAuthors); virtual; abstract;

    //
    // манипуляции с жанрами книги
    //
    procedure CleanBookGenres(const BookID: Integer); virtual; abstract;
    procedure InsertBookGenres(const BookID: Integer; const Genres: TBookGenres); virtual; abstract;

    function FindOrCreateSeries(const Title: string): Integer; virtual; abstract;
    procedure SetSeriesTitle(const SeriesID: Integer; const NewSeriesTitle: string); virtual; abstract;
    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer); virtual; abstract;

    procedure SetStringProperty(const PropID: Integer; const Value: string); virtual; abstract;
    procedure SetIntProperty(const PropID: Integer; const Value: Integer);

    procedure ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc); virtual; abstract;
    procedure ExportUserData(data: TUserData); virtual; abstract;

    function CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean; virtual; abstract;

    //
    // очень странная ф-ия. Нужна только в одном месте и то, не ясно, нужна ли на самом деле.
    //
    function GetTopGenreAlias(const FB2Code: string): string;

    //
    // Bulk operation
    //
    procedure BeginBulkOperation; virtual; abstract;
    procedure EndBulkOperation(Commit: Boolean = True); virtual; abstract;

    procedure CompactDatabase; virtual; abstract;
    procedure RepairDatabase; virtual; abstract;
    procedure ReloadGenres(const FileName: string); virtual; abstract;
    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer); virtual; abstract;

    procedure TruncateTablesBeforeImport; virtual; abstract;

  protected // virtual
    procedure InsertGenreIfMissing(const GenreData: TGenreData); virtual; abstract;

  public
    procedure VerifyCurrentCollection(const DatabaseID: Integer);
    procedure LoadGenres(const GenresFileName: string);

  protected type
    TGenreCache = class(TDictionary<string, TGenreData>)
    private
      function GetByFB2Code(const FB2Code: string): TGenreData;
      function GetItems(const Code: string): TGenreData; inline;

    public
      constructor Create;

      procedure Add(const Genre: TGenreData); inline;
      function HasGenre(const Code: string): Boolean; inline;
      function GetRootGenre(const Code: string): TGenreData;
      function GetRootGenreByFB2Code(const FB2Code: string): TGenreData;

      property Items[const Code: string]: TGenreData read GetItems; default;
      property ByFB2Code[const FB2Code: string]: TGenreData read GetByFB2Code;
    end;

  protected
    constructor Create;
    destructor Destroy; override;

    procedure GetGenre(const GenreCode: string; var Genre: TGenreData);
    procedure GetBookGenres(BookID: Integer; var BookGenres: TBookGenres; RootGenre: PGenreData = nil);
    procedure GetBookAuthors(BookID: Integer; var BookAuthors: TBookAuthors);

  strict protected
    FAuthorFilterType: string;
    FSeriesFilterType: string;
    FShowLocalOnly: Boolean;
    FHideDeleted: Boolean;
    FGenreCache: TGenreCache;

  public
    procedure SetHideDeleted(const HideDeleted: Boolean);
    function GetHideDeleted: Boolean;
    procedure SetShowLocalOnly(const ShowLocalOnly: Boolean);
    function GetShowLocalOnly: Boolean;
    procedure SetSeriesFilterType(const SeriesFilterType: string);
    function GetSeriesFilterType: string;
    procedure SetAuthorFilterType(const AuthorFilterType: string);
    function GetAuthorFilterType: string;
  end;

const
  DATABASE_VERSION = '1000';

implementation

uses
  SysUtils,
  unit_Errors,
  unit_Consts,
  unit_Database;

{ TBookCollection }

procedure TBookCollection.SetIntProperty(const PropID: Integer; const Value: Integer);
begin
  if Value = 0 then
    Exit;

  SetStringProperty(PropID, IntToStr(Value));
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
constructor TBookCollection.Create;
begin
  inherited Create;
  FGenreCache := TGenreCache.Create;
end;

destructor TBookCollection.Destroy;
begin
  FreeAndNil(FGenreCache);
  inherited Destroy;
end;

procedure TBookCollection.GetBookGenres(BookID: Integer; var BookGenres: TBookGenres; RootGenre: PGenreData = nil);
var
  i: Integer;
  GenreIterator: IGenreIterator;
  Genre: TGenreData;
  FilterValue: TFilterValue;
begin
  FilterValue.ValueInt := BookID;
  GenreIterator := GetGenreIterator(gmByBook, @FilterValue); //Format('gl.%s = %d', [BOOK_ID_FIELD, BookID])
  i := Length(BookGenres);
  while GenreIterator.Next(Genre) do
  begin
    SetLength(BookGenres, i + 1);
    BookGenres[i] := Genre;
    Inc(i);
  end;

  if Assigned(RootGenre) then
    RootGenre^ := FGenreCache.GetRootGenre(BookGenres[0].GenreCode);
end;

procedure TBookCollection.GetGenre(const GenreCode: string; var Genre: TGenreData);
begin
  Genre := FGenreCache[GenreCode];
end;

function TBookCollection.GetTopGenreAlias(const FB2Code: string): string;
begin
  Result := FGenreCache.GetRootGenreByFB2Code(FB2Code).GenreAlias;
end;

procedure TBookCollection.GetBookAuthors(BookID: Integer; var BookAuthors: TBookAuthors);
var
  AuthorIterator: IAuthorIterator;
  i: Integer;
  FilterValue: TFilterValue;
  Author: TAuthorData;
begin
  FilterValue.ValueInt := BookID;
  AuthorIterator := GetAuthorIterator(amByBook, @FilterValue);
  i := Length(BookAuthors);
  while AuthorIterator.Next(Author) do
  begin
    SetLength(BookAuthors, i + 1);
    BookAuthors[i] := Author;
    Inc(i);
  end;
end;

procedure TBookCollection.VerifyCurrentCollection(const DatabaseID: Integer);
var
  BookCollectionName: string;
  CurrentCollectionName: string;
  CollectionInfo: TCollectionInfo;
begin
  if DatabaseID <> GetSystemData.ActiveCollectionInfo.ID then
  begin
    CollectionInfo := TCollectionInfo.Create;
    try
      if GetSystemData.GetCollectionInfo(DatabaseID, CollectionInfo) then
        BookCollectionName := CollectionInfo.Name
      else
        BookCollectionName := '';
    finally

    end;
    raise ENotSupportedException.Create(Format(rstrErrorOnlyForCurrentCollection, [GetSystemData.ActiveCollectionInfo.Name, BookCollectionName]));
  end;
end;

procedure TBookCollection.AddBookToGroup(const BookKey: TBookKey; const GroupID: Integer);
var
  BookRecord: TBookRecord;
begin
  VerifyCurrentCollection(BookKey.DatabaseID);

  GetBookRecord(BookKey, BookRecord, True);

  GetSystemData.AddBookToGroup(BookKey, GroupID, BookRecord);
end;

{ TBookCollection.TGenreCache }

constructor TBookCollection.TGenreCache.Create;
begin
  inherited Create;
end;

procedure TBookCollection.TGenreCache.Add(const Genre: TGenreData);
begin
  inherited Add(Genre.GenreCode, Genre);
end;

function TBookCollection.TGenreCache.HasGenre(const Code: string): Boolean;
begin
  Result := ContainsKey(code);
end;

function TBookCollection.TGenreCache.GetItems(const Code: string): TGenreData;
begin
  if not TryGetValue(Code, Result) then
    Result.Clear;
end;

function TBookCollection.TGenreCache.GetByFB2Code(const FB2Code: string): TGenreData;
var
  Genre: TGenreData;
begin
  for Genre in Values do
  begin
    if FB2Code = Genre.FB2GenreCode then
    begin
      Result := Genre;
      Exit;
    end;
  end;

  Result.Clear;
end;

function TBookCollection.TGenreCache.GetRootGenre(const Code: string): TGenreData;
begin
  Result := Items[Code];
  while Result.ParentCode <> '' do
    Result := Items[Result.ParentCode];
end;

function TBookCollection.TGenreCache.GetRootGenreByFB2Code(const FB2Code: string): TGenreData;
begin
  Result := ByFB2Code[FB2Code];
  while Result.ParentCode <> '' do
    Result := Items[Result.ParentCode];
end;

procedure TBookCollection.SetHideDeleted(const HideDeleted: Boolean);
begin
  FHideDeleted := HideDeleted;
end;

function TBookCollection.GetHideDeleted: Boolean;
begin
  Result := FHideDeleted;
end;

procedure TBookCollection.SetShowLocalOnly(const ShowLocalOnly: Boolean);
begin
  FShowLocalOnly := ShowLocalOnly;
end;

function TBookCollection.GetShowLocalOnly: Boolean;
begin
  Result := FShowLocalOnly;
end;

procedure TBookCollection.SetSeriesFilterType(const SeriesFilterType: string);
begin
  FSeriesFilterType := SeriesFilterType;
end;

function TBookCollection.GetSeriesFilterType: string;
begin
  Result := FSeriesFilterType;
end;

procedure TBookCollection.SetAuthorFilterType(const AuthorFilterType: string);
begin
  FAuthorFilterType := AuthorFilterType;
end;

function TBookCollection.GetAuthorFilterType: string;
begin
  Result := FAuthorFilterType;
end;

end.
