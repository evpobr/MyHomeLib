(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             12.02.2010
  * Description
  * Author(s)           Aleksey Penkov  alex.penkov@gmail.com
  *                     Nick Rymanov (nrymanov@gmail.com)
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_Globals;

interface

uses
  Classes,
  SysUtils,
  Generics.Collections,
  VirtualTrees,
  IdHTTP,
  ZipForge;

type
  TTXTEncoding = (enUTF8, en1251, enUnicode, enUnknown);

  TTreeMode = (tmTree, tmFlat);

  TGenresType = (gtFb2, gtAny);

  TBookIdStruct = record
    BookID: Integer;
    DatabaseID: Integer;
    Res: Boolean;
  end;

  TBookIdList = array of TBookIdStruct;

type
  EInvalidLogin = class(Exception);

    //
    // Global consts
    //
    // -----------------------------------------------------------------------------
  const
    {
      0000 0000
      \ /   |
      |    - 0 - fb2, 1 - non-fb2
      |
      |-- 00 - пользовательская, 10 - внешняя локальная, 11 - внешняя онлайн

      Младшее слово - тип содержимого
      Пока определены следующие типы:
      0000        : книги в fb2
      0001        : книги не в fb2

      Старшее слово - тип коллекции
      Определены следующие диапазоны:
      0000        : пользовательская коллекция (всегда локальная)
      0001 - 07FF : внешние локальные коллекции
      0800 - 0FFF : внешние онлайн коллекции

      Note: Установленный старший бит указывает на онлайн коллекцию
      }

    //
    // тип содержимого
    //
    CONTENT_FB = $0000;
    CONTENT_NONFB = $0001;

    //
    // расположения библиотеки
    //
    LOCATION_LOCAL = $00000000;
    LOCATION_ONLINE = $08000000;

    //
    // предопределенные библиотеки
    //
    LIBRARY_PRIVATE = $00000000;
    LIBRARY_LIBRUSEC = $00010000;
    LIBRARY_GENESIS = $00020000;

    //
    // различные маски
    //
    CT_CONTENT_MASK = $00000001;
    CT_LOCATION_MASK = $08000000;
    CT_TYPE_MASK = $08030000;
    CT_MASK = CT_CONTENT_MASK or CT_TYPE_MASK;

    //
    // Несколько предопределенных типов
    //
    CT_PRIVATE_FB = LIBRARY_PRIVATE or CONTENT_FB; // 0000 0000 -
    CT_PRIVATE_NONFB = LIBRARY_PRIVATE or CONTENT_NONFB; // 0000 0001 -
    CT_LIBRUSEC_LOCAL_FB = LOCATION_LOCAL or LIBRARY_LIBRUSEC or CONTENT_FB; // 0001 0000 - local lib.rus.ec
    CT_LIBRUSEC_ONLINE_FB = LOCATION_ONLINE or LIBRARY_LIBRUSEC or CONTENT_FB; // 0801 0000 - online lib.rus.ec
    CT_GENESIS_LOCAL_NONFB = LOCATION_LOCAL or LIBRARY_GENESIS or CONTENT_NONFB; // 0002 0001 - local Genesis
    CT_GENESIS_ONLINE_NONFB = LOCATION_ONLINE or LIBRARY_GENESIS or CONTENT_NONFB; // 0802 0001 - online Genesis
    CT_LIBRUSEC_USR = LOCATION_LOCAL or LIBRARY_LIBRUSEC or CONTENT_NONFB; // 0001 0001 - online Genesis

    CT_DEPRICATED_ONLINE_FB = 99;

  type
    COLLECTION_TYPE = Integer;

  function isPrivateCollection(t: COLLECTION_TYPE): Boolean; inline;
  function isExternalCollection(t: COLLECTION_TYPE): Boolean; inline;
  function isLocalCollection(t: COLLECTION_TYPE): Boolean; inline;
  function isOnlineCollection(t: COLLECTION_TYPE): Boolean; inline;
  function isFB2Collection(t: COLLECTION_TYPE): Boolean; inline;
  function isNonFB2Collection(t: COLLECTION_TYPE): Boolean; inline;

  // -----------------------------------------------------------------------------
  function Transliterate(const Input: string): string;
  function CheckSymbols(const Input: string): string;
  function EncodePassString(const Input: string): string;
  function DecodePassString(const Input: string): string;
  procedure StrReplace(const s1: string; const s2: string; var s3: string);

  function ClearDir(const DirectoryName: string): Boolean;
  function IsRelativePath(const FileName: string): Boolean;
  function CreateFolders(const Root: string; const Path: string): Boolean;
  procedure CopyFile(const SourceFileName: string; const DestFileName: string);
  procedure ConvertToTxt(const SourceFileName: string; DestFileName: string; Enc: TTXTEncoding);
  procedure ZipFile(const FileName: string; const ZipFileName: string);

  function InclideUrlSlash(const S: string): string;

  function PosChr(aCh: Char; const S: string): Integer;
  function CompareInt(i1, i2: Integer): Integer;
  function CompareDate(d1, d2: TDateTime): Integer;

  function GenerateBookLocation(const FullName: string): string;
  function GenerateFileName(const Title: string; libID: Integer): string;

  procedure DebugOut(const DebugMessage: string); overload;
  procedure DebugOut(const DebugMessage: string; const Args: array of const ); overload;

  procedure SetProxySettings(var IdHTTP: TidHTTP);

  function GetSpecialPath(CSIDL: word): string;
  function GetLibUpdateVersion(Full: Boolean): Integer;
  function ExecAndWait(const FileName, Params: string; const WinState: word): Boolean;

  function CleanExtension(const Ext: string): string;

  function TestArchive(const FileName: string): Boolean;

type
  TAppLanguage = (alEng, alRus);
  TExportMode = (emFB2, emFB2Zip, emLrf, emTxt, emEpub, emPDF);

  TBookFlag = (bfLocalBook, bfDeletedBook);
  TBookFlags = set of TBookFlag;

  //
  // TreeView data records
  //
  // --------------------------------------------------------------------------
  PAuthorData = ^TAuthorData;
  TAuthorData = record
    AuthorID: Integer;
    FFirstName: string;
    FMiddleName: string;
    FLastName: string;

    procedure SetFirstName(const Value: string); inline;
    procedure SetLastName(const Value: string); inline;
    procedure SetMiddleName(const Value: string); inline;

    function GetFullName(onlyInitials: Boolean = False): string; inline;

    property FirstName: string read FFirstName write SetFirstName;
    property MiddleName: string read FMiddleName write SetMiddleName;
    property LastName: string read FLastName write SetLastName;

    procedure Clear;

    class function FormatName(const LastName: string; const FirstName: string; const MiddleName: string; const nickName: string = ''; onlyInitials: Boolean = False): string; static;
  end;
  TBookAuthors = array of TAuthorData;

  // --------------------------------------------------------------------------
  PSerieData = ^TSerieData;
  TSerieData = record
    SerieID: Integer;
    SerieTitle: string;
  end;

  // --------------------------------------------------------------------------
  PGenreData = ^TGenreData;
  TGenreData = record
    GenreCode: string;
    ParentCode: string;
    FB2GenreCode: string;
    GenreAlias: string;

    procedure Clear;
  end;
  TBookGenres = array of TGenreData;

  // --------------------------------------------------------------------------
  PGroupData = ^TGroupData;
  TGroupData = record
    GroupID: Integer;
    Text: string;
    CanDelete: Boolean;
  end;

  // --------------------------------------------------------------------------
  TDownloadState = (dsWait, dsRun, dsOk, dsError);
  PDownloadData = ^TDownloadData;
  TDownloadData = record
    BookID: Integer;
    DatabaseID: Integer;
    Author: string;
    Title: string;
    Size: Integer;
    FileName: string;
    URL: string;
    State: TDownloadState;
  end;

  // --------------------------------------------------------------------------
  TBookNodeType = (ntAuthorInfo = 1, ntSeriesInfo, ntBookInfo);

  PBookData = ^TBookData;
  TBookData = record
    nodeType: TBookNodeType;

    BookID: Integer;
    DatabaseID: Integer;
    SerieID: Integer;

    Title: string;
    Serie: string;

    Genres: TBookGenres;
    Authors: TBookAuthors;

    CollectionName: string;
    FileType: string;
    Lang: string;
    Size: Integer;
    Rate: Integer;
    SeqNumber: Integer;
    Progress: Integer;
    LibRate: Integer;
    Code: Integer;
    Flags: TBookFlags;
    Date: TDateTime;

    function GetGenres: string;
    function GetAuthors: string;

    function GetLocal: Boolean; inline;
    procedure SetLocal(const Value: Boolean); inline;

    function GetDeleted: Boolean; inline;
    procedure SetDeleted(const Value: Boolean); inline;

    property Local: Boolean read GetLocal write SetLocal;
    property Deleted: Boolean read GetDeleted write SetDeleted;
  end;

  TBookRecord = record
    //
    // TODO : добавить отдельное поле для ID книги, SeriesID в эту структуру
    //
    Title: string;

    Folder: string;
    FileName: string;
    FileExt: string;
    InsideNo: Integer;

    SerieID: Integer;
    Serie: string;
    SeqNumber: Integer;

    Authors: TBookAuthors;
    Genres: TBookGenres;
    RootGenre: TGenreData;

    Code: Integer;
    Size: Integer;
    LibID: Integer;
    Flags: TBookFlags;
    Date: TDateTime;
    Lang: string;
    LibRate: Integer;

    //
    // TODO : проверить использование этих полей
    //
    KeyWords: string;
    URI: string;

    //
    // Следующие поля зачитываются из таблицы Extra
    //
    Review: string;
    Annotation: string;
    Rate: Integer;
    Progress: Integer;

    //
    // Вычисляемые поля
    //
    CollectionName: string;

    // ----------------------------------------------------
    procedure Normalize;
    procedure Clear;

    function GenerateLocation: string;

    procedure ClearAuthors; inline;
    procedure AddAuthor(const LastName: string; const FirstName: string; const MiddleName: string; AuthorID: Integer = 0);
    function AuthorCount: Integer; inline;
    function GetAutorsList: string;

    procedure ClearGenres; inline;
    procedure AddGenreFB2(const GenreCode: string; const GenreFb2Code: string; const Alias: string);
    procedure AddGenreAny(const GenreCode: string; const Alias: string);
    function GenreCount: Integer; inline;
    function GetGenresList: string;

    function GetLocal: Boolean; inline;
    procedure SetLocal(const Value: Boolean); inline;

    function GetDeleted: Boolean; inline;
    procedure SetDeleted(const Value: Boolean); inline;

    property Local: Boolean read GetLocal write SetLocal;
    property Deleted: Boolean read GetDeleted write SetDeleted;

    // ----------------------------------------------------
    procedure FillBookData(Data: PBookData);
  end;

  PFileData = ^TFileData;
  TFileData = record
    FullPath, FileName, Folder, Ext, Title: string;
    Size: Integer;
    DataType: (dtFolder, dtFile);
    Date: TDateTime;
  end;

  TColumnData = record
    Text: string;
    Position, Width, MaxWidth, MinWidth: Integer;
    Alignment: TAlignment;
    Options: TVTColumnOptions;
  end;

implementation

uses
  Forms,
  Windows,
  StrUtils,
  IOUtils,
  Character,
  unit_Settings,
  unit_Consts,
  ShlObj,
  unit_fb2ToText,
  unit_Helpers;

const
  lat: set of Char = ['A' .. 'Z', 'a' .. 'z', '\', '-', ':', '`', ',', '.', '0' .. '9', '_', ' ', '(', ')', '[', ']', '{', '}'];

const
  denied: set of Char = ['<', '>', ':', '"', '/', '|', '*', '?'];

const
  TransL: array [0 .. 31] of string = ('a', 'b', 'v', 'g', 'd', 'e', 'zh', 'z', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'c', 'ch', 'sh', 'sch', '''', 'i', '''', 'e', 'yu', 'ya');

const
  TransU: array [0 .. 31] of string = ('A', 'B', 'V', 'G', 'D', 'E', 'Zh', 'Z', 'I', 'Y', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'H', 'C', 'Ch', 'Sh', 'Sch', '''', 'I', '''', 'E', 'Yu', 'Ya');

  // -----------------------------------------------------------------------------
  // различная информация о коллекции
  // -----------------------------------------------------------------------------
function isPrivateCollection(t: COLLECTION_TYPE): Boolean;
begin
  Result := (t and CT_TYPE_MASK) = LIBRARY_PRIVATE;
end;

function isExternalCollection(t: COLLECTION_TYPE): Boolean;
begin
  Result := (t and CT_TYPE_MASK) <> LIBRARY_PRIVATE;
end;

function isLocalCollection(t: COLLECTION_TYPE): Boolean;
begin
  Result := (t and CT_LOCATION_MASK) = LOCATION_LOCAL;
end;

function isOnlineCollection(t: COLLECTION_TYPE): Boolean;
begin
  Result := (t and CT_LOCATION_MASK) = LOCATION_ONLINE;
end;

function isFB2Collection(t: COLLECTION_TYPE): Boolean; inline;
begin
  Result := (t and CT_CONTENT_MASK) = CONTENT_FB;
end;

function isNonFB2Collection(t: COLLECTION_TYPE): Boolean; inline;
begin
  Result := (t and CT_CONTENT_MASK) = CONTENT_NONFB;
end;

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------

function PosChr(aCh: Char; const S: string): Integer;
var
  i, max: Integer;
begin
  Result := 0;
  max := Length(S);
  for i := 1 to max do
    if S[i] = aCh then
    begin
      Result := i;
      Exit;
    end;
end;

procedure StrReplace(const s1: string; const s2: string; var s3: string);
var
  p: Integer;
begin
  p := Pos(s1, s3);
  while p > 0 do
  begin
    s3 := Copy(s3, 1, p - 1) + s2 + Copy(s3, p + Length(s1));
    p := Pos(s1, s3);
  end;
end;

function IsRelativePath(const FileName: string): Boolean;
var
  L: Integer;
begin
  Result := True;
  L := Length(FileName);
  if ((L >= 1) and IsPathDelimiter(FileName, 1)) or // \dir\subdir or /dir/subdir
    ((L >= 2) and (FileName[1] in ['A' .. 'Z', 'a' .. 'z']) and (FileName[2] = ':')) // C:, D:, etc.
    then
    Result := False;
end;

function CreateFolders(const Root: string; const Path: string): Boolean;
var
  FullPath: string;
begin
  if Path = '\' then
  begin
    Assert(False);
    FullPath := Root;
  end
  else
    FullPath := TPath.Combine(Root, Path);

  Assert(TPath.IsPathRooted(FullPath));

  Result := SysUtils.ForceDirectories(FullPath);
end;
{$WARNINGS OFF}

procedure CopyFile(const SourceFileName: string; const DestFileName: string);
var
  SourceFile: TFileStream;
  DestFile: TFileStream;
begin
  SourceFile := TFileStream.Create(SourceFileName, fmOpenRead or fmShareDenyWrite);
  try
    DestFile := TFileStream.Create(DestFileName, fmCreate or fmShareDenyRead);
    try
      if SourceFile.Size <> DestFile.CopyFrom(SourceFile, 0) then
        RaiseLastOSError;
    finally
      DestFile.Free;
    end;
  finally
    SourceFile.Free;
  end;
end;
{$WARNINGS ON}

procedure ConvertToTxt(const SourceFileName: string; DestFileName: string; Enc: TTXTEncoding);
var
  Converter: TFb2ToText;
begin
  Converter := TFb2ToText.Create;
  try
    DestFileName := ChangeFileExt(DestFileName, '.txt');
    Converter.Convert(SourceFileName, DestFileName, Enc);
  finally
    Converter.Free;
  end;
end;

procedure ZipFile(const FileName: string; const ZipFileName: string);
var
  ziper: TZipForge;
begin
  ziper := TZipForge.Create(nil);
  try
    ziper.FileName := ZipFileName;
    ziper.OpenArchive(fmCreate);
    ziper.BaseDir := ExtractFilePath(FileName);
    ziper.AddFiles(ExtractFileName(FileName));
    ziper.CloseArchive;
  finally
    ziper.Free;
  end;
end;

function EncodePassString(const Input: string): string;
var
  i: Integer;
begin
  Result := Input;
  for i := 1 to Length(Input) do
    Result[i] := Chr(Ord(Input[i]) + 5);
end;

function DecodePassString(const Input: string): string;
var
  i: Integer;
begin
  Result := Input;
  for i := 1 to Length(Input) do
    Result[i] := Chr(Ord(Input[i]) - 5);
end;
{$WARNINGS OFF}

function ClearDir(const DirectoryName: string): Boolean;
var
  SearchRec: TSearchRec;
  ACurrentDir: string;
begin
  ACurrentDir := IncludeTrailingPathDelimiter(DirectoryName);

  try
    if FindFirst(ACurrentDir + '*.*', faAnyFile, SearchRec) = 0 then
      try
        repeat
          if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
            SysUtils.DeleteFile(ACurrentDir + SearchRec.Name);
        until FindNext(SearchRec) <> 0;
      finally
        SysUtils.FindClose(SearchRec);
      end;
  except
    Result := False;
  end;
end;
{$WARNINGS ON}

function Transliterate(const Input: string): string;
var
  S, conv: string;
  f, o: Integer;
begin
  conv := '';
  for f := 1 to Length(Input) do
  begin
    o := Ord(Input[f]);
    if (o >= 1072) and (o <= 1104) then
      S := TransL[o - 1072]
    else if (o >= 1040) and (o <= 1071) then
      S := TransU[o - 1040]
    else if CharInSet(Input[f], lat) then
      S := Input[f]
    else
      S := '_';
    conv := conv + S;
  end;
  Result := conv;
end;

function CheckSymbols(const Input: string): string;
var
  S, conv: string;
  f: Integer;
begin
  conv := '';
  for f := 1 to Length(Input) do
  begin
    if CharInSet(Input[f], denied) then
      S := ' '
    else
      S := Input[f];
    conv := conv + S;
  end;

  // фильтруем точки в конце имени
  if Length(conv) > 0 then
    while conv[Length(conv)] = '.' do
      Delete(conv, Length(conv), 1);
  Result := conv;
end;

function GenerateBookLocation(const FullName: string): string;
var
  Letter: Char;
  AuthorName: string;
begin
  //
  // Не обрезаем пробелы здесь!!! От их наличия зависит расположение файла - на букве или в каталоге '_'
  //
  AuthorName := CheckSymbols(FullName); // Ф.И.О. - полностью!

  Letter := AuthorName[1];
  if not IsLetterOrDigit(Letter) then
    Letter := '_';

  AuthorName := Trim(AuthorName);
  if AuthorName = '' then
    AuthorName := UNKNOWN_AUTHOR_LASTNAME;

  Result := IncludeTrailingPathDelimiter(Letter) + IncludeTrailingPathDelimiter(AuthorName);
end;

function GenerateFileName(const Title: string; libID: Integer): string;
var
  BookTitle: string;
begin
  BookTitle := Trim(CheckSymbols(Title));
  if BookTitle = '' then
    BookTitle := BOOK_NO_TITLE;
  Result := IntToStr(libID) + ' ' + BookTitle;
end;

{ TAuthorRecord }

procedure TAuthorData.Clear;
begin
  AuthorID := 0;
  FFirstName := '';
  FMiddleName := '';
  FLastName := UNKNOWN_AUTHOR_LASTNAME;
end;

class function TAuthorData.FormatName(const LastName: string; const FirstName: string; const MiddleName: string; const nickName: string = ''; onlyInitials: Boolean = False): string;
begin
  Result := LastName;

  if FirstName <> '' then
    Result := Result + ' ' + IfThen(onlyInitials, FirstName[1] + '.', FirstName);

  if MiddleName <> '' then
    Result := Result + ' ' + IfThen(onlyInitials, MiddleName[1] + '.', MiddleName);

  if nickName <> '' then
  begin
    if Result = '' then
      Result := nickName
    else
      Result := Result + '(' + nickName + ')';
  end;
end;

function TAuthorData.GetFullName(onlyInitials: Boolean = False): string;
begin
  Assert(LastName <> '');

  Result := FormatName(LastName, FirstName, MiddleName, '', onlyInitials);
end;

procedure TAuthorData.SetFirstName(const Value: string);
begin
  FFirstName := Trim(Value);
end;

procedure TAuthorData.SetLastName(const Value: string);
begin
  FLastName := Trim(Value);
end;

procedure TAuthorData.SetMiddleName(const Value: string);
begin
  FMiddleName := Trim(Value);
end;

{ TGenreData }

procedure TGenreData.Clear;
begin
  GenreCode := UNKNOWN_GENRE_CODE;
  ParentCode := '';
  FB2GenreCode := '';
  GenreAlias := '';
end;


procedure TBookRecord.Clear;
begin
  Title := '';

  SerieID := 0;
  Serie := '';

  Folder := '';
  FileName := '';
  FileExt := '';

  ClearAuthors;
  ClearGenres;

  Code := 0;
  Size := 0;
  InsideNo := 0;
  SeqNumber := 0;
  libID := 0;

  Deleted := False;
  Local := False;
  Date := 0;

  Review := '';
  Annotation := '';
  Rate := 0;
  Progress := 0;

  CollectionName := '';
end;

//
// Добавляет отсутствующую информацию о книге, заполняя поля значения по умолчанию
//
procedure TBookRecord.Normalize;
var
  i: Integer;
begin
  if Title = '' then
    Title := BOOK_NO_TITLE;
  if Serie = '' then
    Serie := NO_SERIES_TITLE;

  for i := 0 to AuthorCount - 1 do
    if Authors[i].LastName = '' then
      Authors[i].LastName := UNKNOWN_AUTHOR_LASTNAME;
  if AuthorCount = 0 then
    AddAuthor(UNKNOWN_AUTHOR_LASTNAME, '', '');

  for i := 0 to GenreCount - 1 do
    if Genres[i].GenreCode = '' then
      Genres[i].GenreCode := UNKNOWN_GENRE_CODE;
  if GenreCount = 0 then
    AddGenreFB2(UNKNOWN_GENRE_CODE, '', '');
end;

function TBookRecord.GetDeleted: Boolean;
begin
  Result := bfDeletedBook in Flags;
end;

procedure TBookRecord.SetDeleted(const Value: Boolean);
begin
  if Value then
    Include(Flags, bfDeletedBook)
  else
    Exclude(Flags, bfDeletedBook);
end;

function TBookRecord.GetLocal: Boolean;
begin
  Result := bfLocalBook in Flags;
end;

procedure TBookRecord.SetLocal(const Value: Boolean);
begin
  if Value then
    Include(Flags, bfLocalBook)
  else
    Exclude(Flags, bfLocalBook);
end;

//
// Формирует И\Иванов Иван Иванович\Просто книга
//
function TBookRecord.GenerateLocation: string;
begin
  Assert(AuthorCount > 0);
  Result := Copy(GenerateBookLocation(Authors[0].GetFullName) + GenerateFileName(Title, libID), 1, MAXFOLDERLENGTH - 10);
end;

procedure TBookRecord.ClearAuthors;
begin
  SetLength(Authors, 0);
end;

procedure TBookRecord.AddAuthor(const LastName: string; const FirstName: string; const MiddleName: string; AuthorID: Integer = 0);
var
  i: Integer;
begin
  i := AuthorCount;
  SetLength(Authors, i + 1);

  Authors[i].LastName := LastName;
  Authors[i].FirstName := FirstName;
  Authors[i].MiddleName := MiddleName;
  Authors[i].AuthorID := AuthorID;
end;

function TBookRecord.AuthorCount: Integer;
begin
  Result := Length(Authors);
end;

function TBookRecord.GetAutorsList: string;
begin
  Result := TArrayUtils.Join<TAuthorData>(
    Authors,
    ', ',
    function(const Author: TAuthorData): string
    begin
      Result := Author.GetFullName;
    end
  );
end;

procedure TBookRecord.ClearGenres;
begin
  SetLength(Genres, 0);
end;

procedure TBookRecord.AddGenreFB2(const GenreCode: string; const GenreFb2Code: string; const Alias: string);
var
  i: Integer;
begin
  i := GenreCount;
  SetLength(Genres, i + 1);

  Genres[i].GenreCode := GenreCode;
  Genres[i].ParentCode := '';
  Genres[i].FB2GenreCode := GenreFb2Code;
  Genres[i].GenreAlias := Alias;
end;

procedure TBookRecord.AddGenreAny(const GenreCode: string; const Alias: string);
var
  i: Integer;
begin
  i := GenreCount;
  SetLength(Genres, i + 1);

  Genres[i].GenreCode := GenreCode;
  Genres[i].ParentCode := '';
  Genres[i].FB2GenreCode := '';
  Genres[i].GenreAlias := Alias;
end;

function TBookRecord.GenreCount: Integer;
begin
  Result := Length(Genres);
end;

function TBookRecord.GetGenresList: string;
begin
  Result := TArrayUtils.Join<TGenreData>(
    Genres,
    ' / ',
    function(const genre: TGenreData): string
    begin
      Result := genre.GenreAlias;
    end
  );
end;

procedure TBookRecord.FillBookData(Data: PBookData);
begin
  Assert(Assigned(Data));

  Initialize(Data^);
  Data^.nodeType := ntBookInfo;

  Data^.Title := Title;

  Data^.SerieID := SerieID;
  Data^.Serie := Serie;

  Data^.Genres := Genres;
  Data^.Authors := Authors;

  Data^.CollectionName := CollectionName;
  Data^.FileType := CleanExtension(FileExt);
  Data^.Lang := Lang;
  Data^.Size := Size;
  Data^.SeqNumber := SeqNumber;
  Data^.LibRate := LibRate;
  Data^.Code := Code;
  Data^.Local := Local;
  Data^.Deleted := Deleted;
  Data^.Date := Date;

  //
  // данные из таблицы Extra
  //
  Data^.Rate := Rate;
  Data^.Progress := Progress;
end;

// ============================================================================

function InclideUrlSlash(const S: string): string;
begin
  Result := S;
  if Result[Length(Result)] <> '/' then
    Result := Result + '/';
end;

function CompareDate(d1, d2: TDateTime): Integer;
begin
  if d1 > d2 then
    Result := 1
  else if d1 < d2 then
    Result := -1
  else // if d1 = d2 then
    Result := 0;
end;

function CompareInt(i1, i2: Integer): Integer;
begin
  if i1 > i2 then
    Result := 1
  else if i1 < i2 then
    Result := -1
  else // if i1 = i2 then
    Result := 0;
end;

procedure DebugOut(const DebugMessage: string);
begin
{$IFOPT D+}
  DebugOut(DebugMessage, []);
{$ENDIF}
end;

procedure DebugOut(const DebugMessage: string; const Args: array of const );
begin
{$IFOPT D+}
  OutputDebugString(PChar(Format(DebugMessage, Args)));
{$ENDIF}
end;

function GetSpecialPath(CSIDL: word): string;
var
  S: string;
begin
  SetLength(S, MAX_PATH);
  if not SHGetSpecialFolderPath(0, PChar(S), CSIDL, True) then
    S := '';
  Result := IncludeTrailingPathDelimiter(PChar(S));
end;

procedure SetProxySettings(var IdHTTP: TidHTTP);
begin
  with IdHTTP.ProxyParams do
  begin
    if Settings.UseIESettings then
    begin
      ProxyServer := Settings.IEProxyServer;
      ProxyPort := Settings.IEProxyPort;
    end
    else
    begin
      ProxyServer := Settings.ProxyServer;
      ProxyPort := Settings.ProxyPort;
      ProxyUsername := Settings.ProxyUsername;
      ProxyPassword := Settings.ProxyPassword;
    end;
    BasicAuthentication := True;
  end;

  IdHTTP.Request.UserAgent := 'MyHomeLib/2.0 (compatible; Indy Library)';

  IdHTTP.ConnectTimeout := Settings.TimeOut;
  IdHTTP.ReadTimeout := Settings.ReadTimeout;

  // idHTTP.CookieManager := frmMain.IdCookieManager;
  IdHTTP.AllowCookies := True;

  IdHTTP.HandleRedirects := True;
end;

function CheckLibVersion(ALocalVersion: Integer; Full: Boolean; out ARemoteVersion: Integer): Boolean;
var
  HTTP: TidHTTP;
  LF: TMemoryStream;
  SL: TStringList;

  URL: string;
begin
  Result := False;

  URL := InclideUrlSlash(Settings.UpdateURL) + IfThen(Full, LIBRUSEC_UPDATEVERINFO_FILENAME, EXTRA_UPDATEVERINFO_FILENAME);

  HTTP := TidHTTP.Create(nil);
  SetProxySettings(HTTP);
  try
    LF := TMemoryStream.Create;
    try
      HTTP.Get(URL, LF);
      SL := TStringList.Create;
      try
        LF.Seek(0, soFromBeginning);
        SL.LoadFromStream(LF);
        if SL.Count > 0 then
        begin
          ARemoteVersion := StrToInt(SL[0]);
          Result := (ALocalVersion < ARemoteVersion);
        end;
      finally
        SL.Free;
      end;
    finally
      LF.Free;
    end;
  finally
    HTTP.Free;
  end;
end;

function GetLibUpdateVersion(Full: Boolean): Integer;
var
  f: Text;
  S: string;
begin
  Result := 0;
  S := Settings.SystemFileName[sfCollectionVerInfo];

  if FileExists(S) then
  begin
    AssignFile(f, S);
    try
      Reset(f);
      Readln(f, S);
      CloseFile(f);
      Result := StrToIntDef(S, 0);
    except
      on EInOutError do
        { не смогли открыть файл } ;
    end;
  end
  else
    Result := UNVERSIONED_COLLECTION;
end;

function ExecAndWait(const FileName, Params: string; const WinState: word): Boolean;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  CmdLine := '' + FileName + ' ' + Params;
  FillChar(StartInfo, Sizeof(StartInfo), #0);
  with StartInfo do
  begin
    cb := Sizeof(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;

  Result := CreateProcess(
    nil,
    PChar(CmdLine),
    nil,
    nil,
    False,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,
    nil,
    PChar(ExtractFilePath(FileName)),
    StartInfo,
    ProcInfo
  );

  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Free the Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end
  else
  begin
    // { TODO -oNickR -cRefactoring : не самая лучшая идея показывать диалоги прямо из этой функции. Она может быть вызвана из рабочего потока. }
    Application.MessageBox(PChar(Format(' Не удалось запустить %s ! ', [FileName])), '', mb_IconExclamation)
  end;
end;

function GetFileNameZip(Zip: TZipForge; No: Integer): string;
var
  i: Integer;
  ArchItem: TZFArchiveItem;
begin
  i := 0;
  if (Zip.FindFirst('*.*', ArchItem, faAnyFile - faDirectory)) then
    while i <> No do
    begin
      Zip.FindNext(ArchItem);
      Inc(i);
    end;
  Result := ArchItem.FileName;
end;

function CleanExtension(const Ext: string): string;
begin
  Result := Trim(Ext);
  if (Result <> '') and (Result[1] = '.') then
    Delete(Result, 1, 1);
end;

function TestArchive(const FileName: string): Boolean;
var
  Zip: TZipForge;
begin
  Zip := TZipForge.Create(nil);
  try
    Zip.FileName := FileName;
    Zip.TempDir := Settings.TempDir;
    try
      Zip.OpenArchive;
      Zip.TestFiles('*.*');
      Zip.CloseArchive;
      Result := True;
    except
      Result := False;
    end;
  finally
    Zip.Free;
  end;
end;

{ TBookData }

function TBookData.GetAuthors: string;
begin
  Result := TArrayUtils.Join<TAuthorData>(
    Authors,
    ', ',
    function(const Author: TAuthorData): string
    begin
      Result := Author.GetFullName;
    end
  );
end;

function TBookData.GetGenres: string;
begin
  Result := TArrayUtils.Join<TGenreData>(
    Genres,
    ' / ',
    function(const genre: TGenreData): string
    begin
      Result := genre.GenreAlias;
    end
  );
end;

function TBookData.GetDeleted: Boolean;
begin
  Result := bfDeletedBook in Flags;
end;

procedure TBookData.SetDeleted(const Value: Boolean);
begin
  if Value then
    Include(Flags, bfDeletedBook)
  else
    Exclude(Flags, bfDeletedBook);
end;

function TBookData.GetLocal: Boolean;
begin
  Result := bfLocalBook in Flags;
end;

procedure TBookData.SetLocal(const Value: Boolean);
begin
  if Value then
    Include(Flags, bfLocalBook)
  else
    Exclude(Flags, bfLocalBook);
end;

end.
