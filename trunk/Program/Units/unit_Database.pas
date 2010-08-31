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

unit unit_Database;

interface

uses
  DB,
  Classes,
  Variants,
  ABSMain,
  unit_Globals;

type
  TABSTableHelper = class helper for TABSTable
    constructor Create(AOwner: TComponent);
  end;

  TMHLLibrary = class(TComponent)
  private
    procedure CheckActive;
    procedure CheckInactive;

    function GetDatabaseFileName: string;
    procedure SetDatabaseFileName(const Value: string);

    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);

    procedure LoadGenres(const GenresFileName: string);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    //
    // Database creation & management
    //
    class procedure CreateSystemTables(const DBFile: string);
    procedure CreateCollectionTables(const DBFile: string; const GenresFileName: string);
    procedure ReloadDefaultGenres(const FileName: string);

    procedure SetProperty(PropID: Integer; const Value: string); overload;
    procedure SetProperty(PropID: Integer; const Value: Integer); overload;

    //
    // Content management
    //
    function CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean;

    function InsertBook(BookRecord: TBookRecord; CheckFileName, FullCheck: Boolean): Integer;
    procedure DeleteBook(const BookKey: TBookKey);

    function GetTopGenreAlias(const FB2Code: string): string;
    procedure CleanBookGenres(BookID: Integer);
    procedure InsertBookGenres(const BookID: Integer; var Genres: TBookGenres);

    procedure GetSeries(SeriesList: TStrings);

    //
    // Bulk operation
    //
    procedure BeginBulkOperation;
    procedure EndBulkOperation(Commit: Boolean = True);

  public
    property DatabaseFileName: string read GetDatabaseFileName write SetDatabaseFileName;
    property Active: Boolean read GetActive write SetActive;

  private
    FDatabase: TABSDatabase;

    FSettings: TABSTable;
    FSettingsID: TIntegerField;
    FSettingsValue: TWideMemoField;

    FAuthors: TABSTable;
    FAuthorID: TIntegerField;
    FAuthorLastName: TWideStringField;
    FAuthorFirstName: TWideStringField;
    FAuthorMiddleName: TWideStringField;

    FAuthorList: TABSTable;
    FAuthorListAuthorID: TIntegerField;
    FAuthorListBookID: TIntegerField;

    FBooks: TABSTable;
    FBookBookID: TIntegerField;
    FBookLibID: TIntegerField;
    FBookTitle: TWideStringField;
    FBookSeriesID: TIntegerField;
    FBookSeqNumber: TSmallintField;
    FBookDate: TDateField;
    FBookLibRate: TIntegerField;
    FBookLang: TWideStringField;
    FBookFolder: TWideStringField;
    FBookFileName: TWideStringField;
    FBookInsideNo: TIntegerField;
    FBookExt: TWideStringField;
    FBookSize: TIntegerField;
    FBookCode: TSmallintField;
    FBookIsLocal: TBooleanField;
    FBookIsDeleted: TBooleanField;
    FBookKeyWords: TWideStringField;
    FBookRate: TIntegerField;
    FBookProgress: TIntegerField;
    FBookAnnotation: TWideMemoField;
    FBookReview: TWideMemoField;

    FSeries: TABSTable;
    FSeriesSeriesID: TIntegerField;
    FSeriesSeriesTitle: TWideStringField;

    FGenres: TABSTable;
    FGenresGenreCode: TWideStringField;
    FGenresParentCode: TWideStringField;
    FGenresFB2Code: TWideStringField;
    FGenresAlias: TWideStringField;

    FGenreList: TABSTable;
    FGenreListGenreCode: TWideStringField;
    FGenreListBookID: TIntegerField;

    procedure FilterDuplicateAuthorsByID(var Authors: TBookAuthors);
    procedure FilterDuplicateGenresByCode(var Genres: TBookGenres);
  end;

implementation

uses
  Types,
  SysUtils,
  IOUtils,
  Generics.Collections,
  bdeconst,
  unit_Consts,
  dm_user;

resourcestring
  rstrFavoritesGroupName = 'Избранное';
  rstrToReadGroupName = 'К прочтению';

const
  TEMP_DATABASE = 'TempDB';
  USER_DATABASE = 'UserDB';
  DATABASE_VERSION = '1000';

// ------------------------------------------------------------------------------

{ TMHLLibrary }

procedure TMHLLibrary.CheckActive;
begin
  if not Active then
    DatabaseError(SDatabaseClosed, Self);
end;

procedure TMHLLibrary.CheckInactive;
begin
  if Active then
    DatabaseError(SDatabaseOpen, Self);
end;

constructor TMHLLibrary.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDatabase := TABSDatabase.Create(Self);
  FDatabase.DatabaseName := TEMP_DATABASE;
  FDatabase.MaxConnections := 5;
  FDatabase.PageSize := 65535;
  FDatabase.PageCountInExtent := 16;

  FSettings := TABSTable.Create(FDatabase);
  FSettings.TableName := 'Settings';

  FAuthors := TABSTable.Create(FDatabase);
  FAuthors.TableName := 'Authors';

  FAuthorList := TABSTable.Create(FDatabase);
  FAuthorList.TableName := 'Author_list';

  FBooks := TABSTable.Create(FDatabase);
  FBooks.TableName := 'Books';

  FSeries := TABSTable.Create(FDatabase);
  FSeries.TableName := 'Series';

  FGenres := TABSTable.Create(FDatabase);
  FGenres.TableName := 'Genres';

  FGenreList := TABSTable.Create(FDatabase);
  FGenreList.TableName := 'Genre_list';
end;

destructor TMHLLibrary.Destroy;
begin
  Active := False;
  inherited Destroy;
end;

function TMHLLibrary.GetActive: Boolean;
begin
  Result := FDatabase.Connected;
end;

procedure TMHLLibrary.SetActive(const Value: Boolean);
begin
  FDatabase.Connected := Value;

  FSettings.Active := Value;
  FAuthors.Active := Value;
  FAuthorList.Active := Value;
  FBooks.Active := Value;
  FSeries.Active := Value;
  FGenres.Active := Value;
  FGenreList.Active := Value;

  if Value then
  begin
    FSettingsID := FSettings.FieldByName(ID_FIELD) as TIntegerField;
    FSettingsValue := FSettings.FieldByName(SETTING_VALIE_FIELD) as TWideMemoField;

    FAuthorID := FAuthors.FieldByName(AUTHOR_ID_FIELD) as TIntegerField;
    FAuthorLastName := FAuthors.FieldByName(AUTHOR_LASTTNAME_FIELD) as TWideStringField;
    FAuthorFirstName := FAuthors.FieldByName(AUTHOR_FIRSTNAME_FIELD) as TWideStringField;
    FAuthorMiddleName := FAuthors.FieldByName(AUTHOR_MIDDLENAME_FIELD) as TWideStringField;

    FAuthorListAuthorID := FAuthorList.FieldByName(AUTHOR_ID_FIELD) as TIntegerField;
    FAuthorListBookID := FAuthorList.FieldByName(BOOK_ID_FIELD) as TIntegerField;

    FBookBookID := FBooks.FieldByName(BOOK_ID_FIELD) as TIntegerField;
    FBookLibID := FBooks.FieldByName(BOOK_LIBID_FIELD) as TIntegerField;
    FBookTitle := FBooks.FieldByName(BOOK_TITLE_FIELD) as TWideStringField;
    FBookSeriesID := FBooks.FieldByName(SERIES_ID_FIELD) as TIntegerField;
    FBookSeqNumber := FBooks.FieldByName(BOOK_SEQNUMBER_FIELD) as TSmallintField;
    FBookDate := FBooks.FieldByName(BOOK_DATE_FIELD) as TDateField;
    FBookLibRate := FBooks.FieldByName(BOOK_LIBRATE_FIELD) as TIntegerField;
    FBookLang := FBooks.FieldByName(BOOK_LANG_FIELD) as TWideStringField;
    FBookFolder := FBooks.FieldByName(BOOK_FOLDER_FIELD) as TWideStringField;
    FBookFileName := FBooks.FieldByName(BOOK_FILENAME_FIELD) as TWideStringField;
    FBookInsideNo := FBooks.FieldByName(BOOK_INSIDENO_FIELD) as TIntegerField;
    FBookExt := FBooks.FieldByName(BOOK_EXT_FIELD) as TWideStringField;
    FBookSize := FBooks.FieldByName(BOOK_SIZE_FIELD) as TIntegerField;
    FBookCode := FBooks.FieldByName(BOOK_CODE_FIELD) as TSmallintField;
    FBookIsLocal := FBooks.FieldByName(BOOK_LOCAL_FIELD) as TBooleanField;
    FBookIsDeleted := FBooks.FieldByName(BOOK_DELETED_FIELD) as TBooleanField;
    FBookKeyWords := FBooks.FieldByName(BOOK_KEYWORDS_FIELD) as TWideStringField;
    FBookRate := FBooks.FieldByName(BOOK_RATE_FIELD) as TIntegerField;
    FBookProgress := FBooks.FieldByName(BOOK_PROGRESS_FIELD) as TIntegerField;
    FBookAnnotation := FBooks.FieldByName(BOOK_ANNOTATION_FIELD) as TWideMemoField;
    FBookReview := FBooks.FieldByName(BOOK_REVIEW_FIELD) as TWideMemoField;

    FSeriesSeriesID := FSeries.FieldByName(SERIES_ID_FIELD) as TIntegerField;
    FSeriesSeriesTitle := FSeries.FieldByName(SERIES_TITLE_FIELD) as TWideStringField;

    FGenresGenreCode := FGenres.FieldByName(GENRE_CODE_FIELD) as TWideStringField;
    FGenresParentCode := FGenres.FieldByName(GENRE_PARENTCODE_FIELD) as TWideStringField;
    FGenresFB2Code := FGenres.FieldByName(GENRE_FB2CODE_FIELD) as TWideStringField;
    FGenresAlias := FGenres.FieldByName(GENRE_ALIAS_FIELD) as TWideStringField;

    FGenreListGenreCode := FGenreList.FieldByName(GENRE_CODE_FIELD) as TWideStringField;
    FGenreListBookID := FGenreList.FieldByName(BOOK_ID_FIELD) as TIntegerField;
  end
  else
  begin
    FSettingsID := nil;
    FSettingsValue := nil;

    FAuthorID := nil;
    FAuthorLastName := nil;
    FAuthorFirstName := nil;
    FAuthorMiddleName := nil;

    FAuthorListAuthorID := nil;
    FAuthorListBookID := nil;

    FBookBookID := nil;
    FBookLibID := nil;
    FBookTitle := nil;
    FBookSeriesID := nil;
    FBookSeqNumber := nil;
    FBookDate := nil;
    FBookLibRate := nil;
    FBookLang := nil;
    FBookFolder := nil;
    FBookFileName := nil;
    FBookInsideNo := nil;
    FBookExt := nil;
    FBookSize := nil;
    FBookCode := nil;
    FBookIsLocal := nil;
    FBookIsDeleted := nil;
    FBookKeyWords := nil;
    FBookRate := nil;
    FBookProgress := nil;
    FBookAnnotation := nil;
    FBookReview := nil;

    FSeriesSeriesID := nil;
    FSeriesSeriesTitle := nil;

    FGenresGenreCode := nil;
    FGenresParentCode := nil;
    FGenresFB2Code := nil;
    FGenresAlias := nil;

    FGenreListGenreCode := nil;
    FGenreListBookID := nil;
  end;
end;

function TMHLLibrary.GetDatabaseFileName: string;
begin
  Result := FDatabase.DatabaseFileName;
end;

procedure TMHLLibrary.SetDatabaseFileName(const Value: string);
begin
  CheckInactive;
  FDatabase.DatabaseFileName := Value;
end;

procedure TMHLLibrary.SetProperty(PropID: Integer; const Value: Integer);
begin
  if Value = 0 then
    Exit;

  SetProperty(PropID, IntToStr(Value));
end;

procedure TMHLLibrary.SetProperty(PropID: Integer; const Value: string);
begin
  if Value = '' then
    Exit;

  CheckActive;

  if FSettings.Locate(ID_FIELD, PropID, []) then
    FSettings.Edit
  else
    FSettings.Append;

  try
    FSettingsID.Value := PropID;
    FSettingsValue.Value := Value;

    FSettings.Post;
  except
    FSettings.Cancel;
  end;
end;

class procedure TMHLLibrary.CreateSystemTables(const DBFile: string);
var
  ADatabase: TABSDatabase;
  createScript: TStream;
  createQuery: TABSQuery;
  Groups: TABSTable;
begin
  ADatabase := TABSDatabase.Create(nil);
  try
    ADatabase.DatabaseFileName := DBFile;
    ADatabase.DatabaseName := USER_DATABASE;
    ADatabase.MaxConnections := 5;
    ADatabase.CreateDatabase;

    createScript := TResourceStream.Create(HInstance, 'CreateSystemDB', RT_RCDATA);
    try
      createQuery := TABSQuery.Create(nil);
      try
        createQuery.DatabaseName := ADatabase.DatabaseName;
        createQuery.SQL.LoadFromStream(createScript);
        createQuery.ExecSQL;
      finally
        createQuery.Free;
      end;
    finally
      createScript.Free;
    end;

    ADatabase.Connected := False;

    //
    // Зададим дефлотные группы
    //
    Groups := TABSTable.Create(ADatabase);
    try
      Groups.TableName := 'Groups';
      Groups.Active := True;

      Groups.AppendRecord([FAVORITES_GROUP_ID, rstrFavoritesGroupName, False]);
      Groups.AppendRecord([FAVORITES_GROUP_ID + 1, rstrToReadGroupName, False]);
    finally
      Groups.Free;
    end;
  finally
    ADatabase.Free;
  end;
end;

procedure TMHLLibrary.CreateCollectionTables(const DBFile: string; const GenresFileName: string);
var
  createScript: TStream;
  createQuery: TABSQuery;
begin
  CheckInactive;

  DatabaseFileName := DBFile;
  FDatabase.CreateDatabase;

  createScript := TResourceStream.Create(HInstance, 'CreateCollectionDB', RT_RCDATA);
  try
    createQuery := TABSQuery.Create(nil);
    try
      createQuery.DatabaseName := FDatabase.DatabaseName;
      createQuery.SQL.LoadFromStream(createScript);
      createQuery.ExecSQL;
    finally
      createQuery.Free;
    end;
  finally
    createScript.Free;
  end;

  Active := True;

  //
  // Запишем версию метаданных, и дату создания
  //
  FSettings.AppendRecord([SETTING_VERSION, DATABASE_VERSION]);
  FSettings.AppendRecord([SETTING_CREATION_DATE, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now)]);

  //
  // Заполним таблицу жанров
  //
  LoadGenres(GenresFileName);
end;

procedure TMHLLibrary.LoadGenres(const GenresFileName: string);
var
  FS: TStringList;
  i: Integer;
  p: Integer;
  S: string;
  ParentCode: string;
  Code: string;
  FB2Code: string;
begin
  CheckActive;

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
      Code := Copy(S, 1, p - 1);
      Delete(S, 1, p);

      //
      // и код родительского элемента (0)
      //
      p := LastDelimiter('.', Code);
      if 0 = p then
        Continue;
      ParentCode := Copy(Code, 1, p - 1);

      //
      // fb2 код. Может отсутствовать! (sf)
      //
      FB2Code := '';
      p := AnsiPos(';', S);
      if 0 <> p then
      begin
        FB2Code := Copy(S, 1, p - 1);
        Delete(S, 1, p);
      end;

      //
      // Если такой жанр уже существует => пропустим его
      //
      { TODO -oNickR : может стоит проверить и остальные поля? }
      if FGenres.Locate(GENRE_CODE_FIELD, Code, []) then
        Continue;

      //
      // все хорошо => добавляем в базу
      //
      FGenres.Insert;
      try
        FGenresGenreCode.Value := Code;
        FGenresParentCode.Value := ParentCode;
        FGenresFB2Code.Value := FB2Code;
        FGenresAlias.Value := S;
        FGenres.Post;
      except
        FGenres.Cancel;
        raise;
      end;
    end;
  finally
    FS.Free;
  end;
end;

procedure TMHLLibrary.ReloadDefaultGenres(const FileName: string);
begin
  CheckActive;

  //
  // почистить таблицу Genres
  //
  FGenres.Active := False;
  FGenres.EmptyTable;
  FGenres.Active := True;

  LoadGenres(FileName);
end;

function TMHLLibrary.GetTopGenreAlias(const FB2Code: string): string;
var
  Code: string;
  p: Integer;
begin
  FGenres.Locate(GENRE_FB2CODE_FIELD, FB2Code, []);
  Code := FGenresGenreCode.Value;

  Delete(Code, 1, 2); // "0."
  p := Pos('.', Code);
  Code := '0.' + Copy(Code, 1, p - 1);

  FGenres.Locate(GENRE_CODE_FIELD, Code, []);
  Result := FGenresAlias.Value;
end;

function TMHLLibrary.CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean;
var
  S: string;
begin
  CheckActive;

  if ZipFolder then
    Result := FBooks.Locate(BOOK_FOLDER_FIELD, FileName, [loCaseInsensitive])
  else
  begin
    if FullNameSearch then
      S := ExtractFileName(FileName)
    else
      S := TPath.GetFileNameWithoutExtension(FileName);
    Result := FBooks.Locate(BOOK_FILENAME_FIELD, S, [loCaseInsensitive]);
  end;
end;

function TMHLLibrary.InsertBook(BookRecord: TBookRecord; CheckFileName, FullCheck: Boolean): Integer;
var
  i: Integer;
  Author: TAuthorData;

  Res: Boolean;

begin
  Result := 0;
  CheckActive;

  if BookRecord.FileName = '' then
    Exit;

  BookRecord.Normalize;

  //
  // Создадим отсутствующих авторов
  //
  Assert(BookRecord.AuthorCount > 0);
  for i := 0 to BookRecord.AuthorCount - 1 do
  begin
    if not FAuthors.Locate(AUTHOR_FULLNAME_FIELDS, VarArrayOf([BookRecord.Authors[i].LastName, BookRecord.Authors[i].FirstName, BookRecord.Authors[i].MiddleName]), [loCaseInsensitive]) then
    begin
      FAuthors.Insert;
      try
        FAuthorLastName.Value := BookRecord.Authors[i].LastName;
        FAuthorFirstName.Value := BookRecord.Authors[i].FirstName;
        FAuthorMiddleName.Value := BookRecord.Authors[i].MiddleName;
        FAuthors.Post;
      except
        FAuthors.Cancel;
        raise;
      end;
    end;

    //
    // и запомним ID-ки
    //
    BookRecord.Authors[i].AuthorID := FAuthorID.Value;
  end;

  // Filter out duplicate authors by AuthorID:
  FilterDuplicateAuthorsByID(BookRecord.Authors);

  //
  // Определяем код жанра
  //
  Assert(BookRecord.GenreCount > 0);
  for i := 0 to BookRecord.GenreCount - 1 do
  begin
    //
    // Если fb2 код указан, переводим его в универсальный код
    //
    if BookRecord.Genres[i].FB2GenreCode <> '' then
    begin
      //
      // Знаем fb2-код жанра => получаем внутренний код
      //
      if FGenres.Locate(GENRE_FB2CODE_FIELD, BookRecord.Genres[i].FB2GenreCode, [loCaseInsensitive]) then
        BookRecord.Genres[i].GenreCode := FGenresGenreCode.Value
      else
        //
        // fb2-код неизвестный - так и запишем
        //
        BookRecord.Genres[i].GenreCode := UNKNOWN_GENRE_CODE;
    end
    else
    //
    // если не указан fb2-код, проверяем наличие внутреннего кода.
    // если внутренний код неизвестен или не указан => "так и запишем"
    //
    if
      (BookRecord.Genres[i].GenreCode = '') or                         // внутренний код не указан
      (not FGenres.Locate(GENRE_CODE_FIELD, BookRecord.Genres[i].GenreCode, [loCaseInsensitive]))  // внутренний код неизвестен
    then
      BookRecord.Genres[i].GenreCode := UNKNOWN_GENRE_CODE;
  end;

  //
  // создадим отсутствующую серию
  //
  if NO_SERIES_TITLE = BookRecord.Series then
  begin
    BookRecord.SeriesID := NO_SERIE_ID;
  end
  else
  begin
    if not FSeries.Locate(SERIES_TITLE_FIELD, BookRecord.Series, [loCaseInsensitive]) then
    begin
      FSeries.Append;
      try
        FSeriesSeriesTitle.Value := BookRecord.Series;
        FSeries.Post;
      except
        FSeries.Cancel;
        raise;
      end;
    end;
    BookRecord.SeriesID := FSeriesSeriesID.AsInteger;
  end;

  //
  // Собственно сохраним информацию о книге
  //
  if CheckFileName then
    if FullCheck then
      Res := FBooks.Locate('Folder;FileName', VarArrayOf([BookRecord.Folder, BookRecord.FileName]), [loCaseInsensitive])
    else
      Res := FBooks.Locate(BOOK_FILENAME_FIELD, BookRecord.FileName, [loCaseInsensitive])
    else
      Res := False;

  if not Res then
  begin
    if BookRecord.SeqNumber > 5000 then
      BookRecord.SeqNumber := 0;

    FBooks.Append;
    try
      FBookLibID.Value := BookRecord.LibID;
      FBookTitle.Value := BookRecord.Title;
      if NO_SERIE_ID <> BookRecord.SeriesID then
      begin
        FBookSeriesID.Value := BookRecord.SeriesID;
        FBookSeqNumber.Value := BookRecord.SeqNumber;
      end;
      FBookDate.Value := BookRecord.Date;
      FBookLibRate.Value := BookRecord.LibRate;
      FBookLang.Value := BookRecord.Lang;
      FBookFolder.Value := BookRecord.Folder;
      FBookFileName.Value := BookRecord.FileName;
      FBookInsideNo.Value := BookRecord.InsideNo;
      FBookExt.Value := BookRecord.FileExt;
      FBookSize.Value := BookRecord.Size;
      FBookCode.Value := BookRecord.Code;
      FBookIsLocal.Value := BookRecord.IsLocal;
      FBookIsDeleted.Value := BookRecord.IsDeleted;
      FBookKeyWords.Value := BookRecord.KeyWords;
      FBookRate.Value := BookRecord.Rate;
      FBookProgress.Value := BookRecord.Progress;
      if BookRecord.Annotation <> '' then
        FBookAnnotation.Value := BookRecord.Annotation;
      if BookRecord.Review <> '' then
        FBookReview.Value := BookRecord.Review;
      FBooks.Post;
    except
      FBooks.Cancel;
      raise;
    end;

    InsertBookGenres(FBookBookID.Value, BookRecord.Genres);

    for Author in BookRecord.Authors do
    begin
      FAuthorList.Append;
      try
        FAuthorListAuthorID.Value := Author.AuthorID;
        FAuthorListBookID.Value := FBookBookID.Value;

        FAuthorList.Post;
      except
        FAuthorList.Cancel;
        raise;
      end;
    end;

    Result := FBookBookID.Value;
  end;
end;

procedure TMHLLibrary.DeleteBook(const BookKey: TBookKey);
var
  SeriesID: Integer;
begin
  CheckActive;

  if FBooks.Locate(BOOK_ID_FIELD, BookKey.BookID, []) then
  begin
    SeriesID := FBookSeriesID.Value;
    FBooks.Delete;

    { TODO -oNickR : Заменить эти вызовы на DELETE FROM query }

    while FGenreList.Locate(BOOK_ID_FIELD, BookKey.BookID, []) do
      FGenreList.Delete;
    while FAuthorList.Locate(BOOK_ID_FIELD, BookKey.BookID, []) do
      FAuthorList.Delete;

    //
    // Если книга входила в серию (SeriesID <> 1) проверим, не пора ли удалить серию.
    //
    if SeriesID <> NO_SERIE_ID then
    begin
      if not FBooks.Locate(SERIES_ID_FIELD, SeriesID, []) then
      begin
        //
        // Больше книг из этой серии нет => удалим серию
        //
        FSeries.Locate(SERIES_ID_FIELD, SeriesID, []);
        FSeries.Delete;
      end;
    end;

    //
    // У каждого автора должна быть хоть одна книга.
    // TODO -oNickR -cUsability : Возможно, стоит смягчить это требование и хранить описание авторов, книг которых нет в библиотеке
    //
    FAuthors.First;
    while not FAuthors.Eof do
    begin
      if FAuthorList.Locate(AUTHOR_ID_FIELD, FAuthorID.Value, []) then
        FAuthors.Next
      else
        FAuthors.Delete;
    end;

    DMUser.DeleteBook(BookKey);
  end;
end;

procedure TMHLLibrary.CleanBookGenres(BookID: Integer);
begin
  CheckActive;

  while FGenreList.Locate(BOOK_ID_FIELD, BookID, []) do
    FGenreList.Delete;
end;

// Add book genres for the book specified by BookID
// Please notice that Genres could be altered by the method if it contains genres with duplicate codes
procedure TMHLLibrary.InsertBookGenres(const BookID: Integer; var Genres: TBookGenres);
var
  Genre: TGenreData;
begin
  FilterDuplicateGenresByCode(Genres);

  for Genre in Genres do
  begin
    FGenreList.Append;
    try
      FGenreListBookID.Value := BookID;
      FGenreListGenreCode.Value := Genre.GenreCode;

      FGenreList.Post;
    except
      FGenreList.Cancel;
      raise;
    end;
  end;
end;

procedure TMHLLibrary.GetSeries(SeriesList: TStrings);
begin
  FSeries.First;
  while not FSeries.Eof do
  begin
    SeriesList.Add(FSeriesSeriesTitle.Value);
    FSeries.Next;
  end;
end;

// Filter out duplicates by author ID
procedure TMHLLibrary.FilterDuplicateAuthorsByID(var Authors: TBookAuthors);
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
procedure TMHLLibrary.FilterDuplicateGenresByCode(var Genres: TBookGenres);
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

procedure TMHLLibrary.BeginBulkOperation;
begin
  CheckActive;
  Assert(not FDatabase.InTransaction);

  FDatabase.StartTransaction;
end;

procedure TMHLLibrary.EndBulkOperation(Commit: Boolean = True);
begin
  CheckActive;
  Assert(FDatabase.InTransaction);

  if Commit then
    FDatabase.Commit(False)
  else
    FDatabase.Rollback;
end;

{ TAbsTableHelper }

constructor TABSTableHelper.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //
  // TABSDatabase не наследуется от TDatabase. Как результат, конструктор TDataset-а
  // (базового класса TAbsTable) не может установить свойство "DatabaseName".
  // Восстановим это поведение.
  //
  if AOwner is TABSDatabase then
    DatabaseName := TABSDatabase(AOwner).DatabaseName;
end;

end.
