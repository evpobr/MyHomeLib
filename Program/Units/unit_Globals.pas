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

unit unit_Globals;

interface

uses
  Classes,
  SysUtils,
  Generics.Collections,
  VirtualTrees,
  IdHTTP;

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

  TTXTEncoding = (enUTF8, en1251, enUnicode, enUnknown);

  TTreeMode = (tmTree, tmFlat);

  TGenresType = (gtFb2, gtAny);

  TBookIteratorMode = (
    bmAll,       // All books
    bmByGenre,   // Books by genre
    bmByAuthor,  // Books by author
    bmBySeries,  // Books by series
    bmSearch     // Book search
  );

  TAuthorIteratorMode = (
    amAll,       // All authors
    amByBook,    // Authors by book id
    amFullFilter // Full filter - both Alpha, Local and Deleted
  );

  TGenreIteratorMode = (
    gmAll,       // All genres
    gmByBook     // Genres by book id
  );

  TSeriesIteratorMode = (
    smAll,       // All series
    smFullFilter // Full filter - both Alpha, Local and Deleted
  );

  TBookFormat = (
    bfFb2,    // A pure FB2 file
    bfFb2Zip, // An FB2 packed in a ZIP
    bfFbd,    // An (FBD + a raw book file) packed together in a zip
    bfRaw     // A raw file = any other book format
  );

  PBookKey = ^TBookKey;
  TBookKey = record
    BookID: Integer;
    DatabaseID: Integer;

    procedure Clear; inline;
    function IsSameAs(const other: TBookKey): Boolean; inline;
  end;

  TBookIdStruct = record
    BookKey: TBookKey;
    Res: Boolean;
  end;

  TBookIdList = array of TBookIdStruct;

  TAppLanguage = (alEng, alRus);
  TExportMode = (emFB2, emFB2Zip, emLrf, emTxt, emEpub, emPDF);

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

  TAuthorsHelper = class
  public
    class procedure Add(
      var Authors: TBookAuthors;
      const LastName: string;
      const FirstName: string;
      const MiddleName: string;
      AuthorID: Integer = 0
    );

    class function GetList(const Authors: TBookAuthors): string;
    class function GetLinkList(const Authors: TBookAuthors): string;
  end;

  // --------------------------------------------------------------------------
  PSeriesData = ^TSeriesData;
  TSeriesData = record
    SeriesID: Integer;
    SeriesTitle: string;
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

  TGenresHelper = class
  public
    class procedure Add(
      var Genres: TBookGenres;
      const GenreCode: string;
      const Alias: string;
      const GenreFb2Code: string
    );

    class function GetList(const Genres: TBookGenres): string;
    class function GetLinkList(const Genres: TBookGenres): string;
  end;

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
    BookKey: TBookKey;
    Author: string;
    Title: string;
    Size: Integer;
    FileName: string;
    URL: string;
    State: TDownloadState;
  end;

  // --------------------------------------------------------------------------
  TBookNodeType = (ntAuthorInfo = 1, ntSeriesInfo, ntBookInfo);

  PBookRecord = ^TBookRecord;
  TBookRecord = record
    nodeType: TBookNodeType;
    BookKey: TBookKey;
    SeriesID: Integer;
    Title: string;
    Series: string;
    Genres: TBookGenres;
    Authors: TBookAuthors;
    CollectionName: string;
    Lang: string;
    Size: Integer;
    Rate: Integer;
    SeqNumber: Integer;
    Progress: Integer;
    LibRate: Integer;
    Code: Integer;
    Local: Boolean;
    Deleted: Boolean;
    Date: TDateTime;
    FileExt: string;

    FileName: string;
    LibID: Integer;
    Folder: string;
    InsideNo: Integer;
    RootGenre: TGenreData;
    KeyWords: string;
    CollectionRoot: String;

    //TODO - rethink when to load the memo fields. Today are loaded only when LoadMemos flag is True
    Annotation: string;
    Review: string;


    // ----------------------------------------------------
    function GetFileType: string;
    procedure Normalize;
    procedure Clear;

    function GenerateLocation: string;

    procedure ClearAuthors; inline;
    function AuthorCount: Integer; inline;

    procedure ClearGenres; inline;
    function GenreCount: Integer; inline;

    // ----------------------------------------------------
    function GetBookFormat: TBookFormat;
    function GetBookFileName: string;
    function GetBookContainer: string;
    function GetBookStream: TStream;
    function GetBookDescriptorStream: TStream;
    procedure SaveBookToFile(const DestFileName: String);
  end;

  // --------------------------------------------------------------------------
  TBookEvent = procedure(const BookRecord: TBookRecord) of object;
  TSelectBookEvent = procedure(MoveForward: Boolean) of object;
  TGetBookEvent = procedure(var BookRecord: TBookRecord) of object;
  TChangeStateEvent = procedure(State: Boolean) of object;
  TOnLocateBookEvent = procedure(const Text: string; MoveForward: Boolean) of object;
  TOnHelpEvent = function(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean of object;

  // --------------------------------------------------------------------------
  PFileData = ^TFileData;
  TFileData = record
    FullPath, FileName, Folder, Ext, Title: string;
    Size: Integer;
    DataType: (dtFolder, dtFile);
    Date: TDateTime;
  end;

  // --------------------------------------------------------------------------
  TColumnData = record
    Text: string;
    Position, Width, MaxWidth, MinWidth: Integer;
    Alignment: TAlignment;
    Options: TVTColumnOptions;
  end;

  // --------------------------------------------------------------------------
  IBookIterator = interface
    function Next(out BookRecord: TBookRecord): Boolean;
    function GetNumRecords: Integer;
  end;

  IAuthorIterator = interface
    function Next(out AuthorData: TAuthorData): Boolean;
    function GetNumRecords: Integer;
  end;

  IGenreIterator = interface
    function Next(out GenreData: TGenreData): Boolean;
    function GetNumRecords: Integer;
  end;

  ISeriesIterator = interface
    function Next(out SerieData: TSeriesData): Boolean;
    function GetNumRecords: Integer;
  end;

  // --------------------------------------------------------------------------
  TBookSearchCriteria = record
    FullName: string;
    Series: string;
    Annotation: string;
    Genre: string;
    Title: string;
    FileName: string;
    Folder: string;
    FileExt: string;
    Lang: string;
    KeyWord: string;
    Deleted: Boolean;

    DownloadedIdx: Integer;
    DateIdx: Integer;
    DateText: string
  end;

  // --------------------------------------------------------------------------
  TFilterParam = record
    ShowLocalOnly: Boolean;
    HideDeleted: Boolean;
    AuthorFilterType: String; // ALPHA_FILTER_ALL or ALPHA_FILTER_NON_ALPHA or a single letter
  end;

// ============================================================================
//
// helpers
//
// ============================================================================
  function CreateBookKey(BookID: Integer; DatabaseID: Integer): TBookKey; inline;

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
  //function IsRelativePath(const FileName: string): Boolean;
  function CreateFolders(const Root: string; const Path: string): Boolean;
  procedure CopyFile(const SourceFileName: string; const DestFileName: string);
  procedure ConvertToTxt(const SourceFileName: string; DestFileName: string; Enc: TTXTEncoding);
  procedure ZipFile(const FileName: string; const ZipFileName: string);

  function InclideUrlSlash(const S: string): string;

  function PosChr(aCh: Char; const S: string): Integer;
  function CompareInt(i1, i2: Integer): Integer; inline;
  function CompareSeqNumber(i1, i2: Integer): Integer; inline;
  function CompareDate(d1, d2: TDateTime): Integer; inline;

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

  procedure Log(const Text: string);
  procedure ClearLog;

implementation

uses
  Forms,
  Windows,
  StrUtils,
  Math,
  IOUtils,
  Character,
  ZFConst,
  ZFExcept,
  ZipForge,
  unit_Errors,
  unit_Settings,
  unit_Consts,
  ShlObj,
  unit_fb2ToText,
  unit_Helpers,
  unit_MHLHelpers;

resourcestring
  rstrUnableToLaunch = ' Не удалось запустить %s ! ';
  rstrBookNotFoundInArchive = 'В архиве "%s" не найдено описание книги!';

const
  lat: set of AnsiChar = ['A' .. 'Z', 'a' .. 'z', '\', '-', ':', '`', ',', '.', '0' .. '9', '_', ' ', '(', ')', '[', ']', '{', '}'];

const
  denied: set of AnsiChar = ['<', '>', ':', '"', '/', '|', '*', '?'];

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

(*
function IsRelativePath(const FileName: string): Boolean;
//var
//  L: Integer;
begin
  Result := TPath.IsPathRooted(FileName);
  {
  Result := True;
  L := Length(FileName);
  if ((L >= 1) and IsPathDelimiter(FileName, 1)) or // \dir\subdir or /dir/subdir
    ((L >= 2) and CharInSet(FileName[1], ['A' .. 'Z', 'a' .. 'z']) and (FileName[2] = ':')) // C:, D:, etc.
  then
    Result := False;
  }
end;
*)

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
    ziper.BaseDir := ExtractFilePath(FileName);
    ziper.TempDir := Settings.TempDir;
    ziper.OpenArchive(fmCreate);
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
    AuthorName := rstrUnknownAuthor;

  Result := IncludeTrailingPathDelimiter(Letter) + IncludeTrailingPathDelimiter(AuthorName);
end;

function GenerateFileName(const Title: string; libID: Integer): string;
var
  BookTitle: string;
begin
  BookTitle := Trim(CheckSymbols(Title));
  if BookTitle = '' then
    BookTitle := rstrNoTitle;
  Result := IntToStr(libID) + ' ' + BookTitle;
end;

{ TAuthorRecord }

procedure TAuthorData.Clear;
begin
  AuthorID := 0;
  FFirstName := '';
  FMiddleName := '';
  FLastName := rstrUnknownAuthor;
end;

class function TAuthorData.FormatName(const LastName: string; const FirstName: string; const MiddleName: string; const nickName: string = ''; onlyInitials: Boolean = False): string;
begin
  Result := LastName;

  if FirstName <> '' then
  begin
    if onlyInitials then
      Result := Result + ' ' + FirstName[1] + '.'
    else
      Result := Result + ' ' + FirstName;
  end;

  if MiddleName <> '' then
  begin
    if onlyInitials then
      Result := Result + ' ' + MiddleName[1] + '.'
    else
      Result := Result + ' ' + MiddleName;
  end;

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

{ TAuthorsHelper }

class procedure TAuthorsHelper.Add(
  var Authors: TBookAuthors;
  const LastName: string;
  const FirstName: string;
  const MiddleName: string;
  AuthorID: Integer = 0
);
var
  i: Integer;
begin
  i := Length(Authors);
  SetLength(Authors, i + 1);

  Authors[i].LastName := LastName;
  Authors[i].FirstName := FirstName;
  Authors[i].MiddleName := MiddleName;
  Authors[i].AuthorID := AuthorID;
end;

class function TAuthorsHelper.GetList(const Authors: TBookAuthors): string;
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

class function TAuthorsHelper.GetLinkList(const Authors: TBookAuthors): string;
begin
  Result := TArrayUtils.Join<TAuthorData>(
    Authors,
    ' ',
    function(const Author: TAuthorData): string
    begin
      Result := Format('<a href="%d">%s</a>', [Author.AuthorID, Author.GetFullName(True)]);
    end
  );
end;

{ TGenreData }

procedure TGenreData.Clear;
begin
  GenreCode := UNKNOWN_GENRE_CODE;
  ParentCode := '';
  FB2GenreCode := '';
  GenreAlias := '';
end;

{ TGenresHelper }

class procedure TGenresHelper.Add(var Genres: TBookGenres; const GenreCode, Alias, GenreFb2Code: string);
var
  i: Integer;
begin
  i := Length(Genres);
  SetLength(Genres, i + 1);

  Genres[i].GenreCode := GenreCode;
  Genres[i].ParentCode := '';
  Genres[i].FB2GenreCode := GenreFb2Code;
  Genres[i].GenreAlias := Alias;
end;

class function TGenresHelper.GetList(const Genres: TBookGenres): string;
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

class function TGenresHelper.GetLinkList(const Genres: TBookGenres): string;
begin
  Result := TArrayUtils.Join<TGenreData>(
    Genres,
    ' ',
    function(const genre: TGenreData): string
    begin
      Result := Format('<a href="%s">%s</a>', [genre.GenreCode, genre.GenreAlias]);
    end
  );
end;

function CreateBookKey(BookID: Integer; DatabaseID: Integer): TBookKey;
begin
  Result.BookID := BookID;
  Result.DatabaseID := DatabaseID;
end;

procedure TBookKey.Clear;
begin
  BookID := MHL_INVALID_ID;
  DatabaseID := MHL_INVALID_ID;
end;

// Is the other key equal to this one?
function TBookKey.IsSameAs(const other: TBookKey): Boolean;
begin
  Result := (BookID = other.BookID) and (DatabaseID = other.DatabaseID);
end;

procedure TBookRecord.Clear;
begin
  Title := '';

  SeriesID := NO_SERIE_ID;
  Series := NO_SERIES_TITLE;

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
    Title := rstrNoTitle;

  for i := 0 to AuthorCount - 1 do
    if Authors[i].LastName = '' then
      Authors[i].LastName := rstrUnknownAuthor;
  if AuthorCount = 0 then
    TAuthorsHelper.Add(Authors, rstrUnknownAuthor, '', '');

  for i := 0 to GenreCount - 1 do
    if Genres[i].GenreCode = '' then
      Genres[i].GenreCode := UNKNOWN_GENRE_CODE;
  if GenreCount = 0 then
    TGenresHelper.Add(Genres, UNKNOWN_GENRE_CODE, '', '');
end;

function TBookRecord.GetFileType: string;
begin
  Result := CleanExtension(FileExt);
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

function TBookRecord.AuthorCount: Integer;
begin
  Result := Length(Authors);
end;

procedure TBookRecord.ClearGenres;
begin
  SetLength(Genres, 0);
end;

function TBookRecord.GenreCount: Integer;
begin
  Result := Length(Genres);
end;

// Get the book format enum value
function TBookRecord.GetBookFormat: TBookFormat;
var
  BookContainer: string;
  PathLen: Integer;
  LongFileName: string;
begin
  Result := bfRaw; // default
  BookContainer := TPath.Combine(CollectionRoot, Folder);
  PathLen := Length(BookContainer);

  if
    (PathLen = 0) or
    (BookContainer[PathLen] = TPath.DirectorySeparatorChar) or
    (BookContainer[PathLen] = TPath.AltDirectorySeparatorChar) then
  begin
    //BookContainer is either empty or a path
    LongFileName := TPath.Combine(BookContainer, FileName);

    if ExtractFileExt(LongFileName) = ZIP_EXTENSION then
      Result := bfFbd
    else if FileExt = FB2_EXTENSION then
      Result := bfFb2
  end
  else
  begin
    if ExtractFileExt(BookContainer) = ZIP_EXTENSION then
      Result := bfFb2Zip;
  end;

  if (Result = bfRaw) and (FileExt = FB2_EXTENSION) then
    Result := bfFb2
end;

// Get the fully expanded book file name
function TBookRecord.GetBookFileName: string;
var
  BookFormat: TBookFormat;
  BookContainer: string;
begin
  BookContainer := GetBookContainer;
  BookFormat := GetBookFormat;
  if BookFormat = bfFBD then
    Result := TPath.Combine(BookContainer, FileName)
  else if BookFormat = bfFb2Zip then
    Result := BookContainer
  else // bfFb2 or bfRaw
    Result := TPath.Combine(BookContainer, FileName) + FileExt;
end;

// Get the container holding the book (folder or zip file)
//  For bfFb2, bfFBD and bfRaw - brings the folder containing the file
//  For bfFb2Zip - brings the name of the Zip file
function TBookRecord.GetBookContainer: string;
begin
  Result := TPath.Combine(CollectionRoot, Folder);
end;

// Get the book file as a stream.
// The caller code must free the stream when done!
// For FBD archives brings the raw book (and NOT the FBD descriptor)
function TBookRecord.GetBookStream: TStream;
var
  BookFormat: TBookFormat;
  BookFileName: string;
  Zip: TZipForge;

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

begin
  Result := nil;
  BookFileName := GetBookFileName;

  BookFormat := GetBookFormat;
  if BookFormat in [bfFb2Zip, bfFbd] then
  begin
    Zip := TZipForge.Create(nil);
    try
      Zip.BaseDir := Settings.ReadPath;
      Zip.TempDir := Settings.TempDir;
      Zip.FileName := BookFileName;
      try
        Zip.OpenArchive(fmOpenRead);
        Result := TMemoryStream.Create;
        try
          Zip.ExtractToStream(GetFileNameZip(Zip, InsideNo), Result);
          Zip.CloseArchive;
        except
          FreeAndNil(Result);
          raise;
        end;
      except
        on e: EZFException do
        begin
          if e.NativeError = ErCannotOpenFile then
            raise EBookNotFound.CreateFmt(rstrArchiveNotFound, [BookFileName])
          else
            raise;
        end;
      end;
    finally
      FreeAndNil(Zip);
    end;
  end
  else // bfFb2, bfRaw
  begin
    try
      Result := TFileStream.Create(BookFileName, fmOpenRead);
    except
      on e: EFOpenError do
      begin
        //
        // TODO: на самом деле, файл может существовать, но буть заблокирован другим приложением
        //
        raise EBookNotFound.CreateFmt(rstrFileNotFound, [BookFileName]);
      end;
    end;
  end;

  Assert(Assigned(Result));
end;

// Get the descriptor file as a stream.
// The caller code must free the stream when done!
//  For bfFbd - brings the FBD descriptor file
//  For bfFb2Zip and bfFb2 - brings the FB2 file
//  For bfRaw - raise ENotSupportedException exception
function TBookRecord.GetBookDescriptorStream: TStream;
var
  BookFileName: string;
  Zip: TZipForge;
  ArciveItem: TZFArchiveItem;
begin
  case GetBookFormat of
    bfFb2, bfFb2Zip:
      begin
        Result := GetBookStream;
      end;

    bfFbd:
      begin
        BookFileName := GetBookFileName;

        Zip := TZipForge.Create(nil);
        try
          Zip.BaseDir := Settings.ReadPath;
          Zip.TempDir := Settings.TempDir;
          Zip.FileName := BookFileName;

          try
            Zip.OpenArchive(fmOpenRead);

            Result := TMemoryStream.Create;
            try
              if Zip.FindFirst('*' + FBD_EXTENSION, ArciveItem) then
                Zip.ExtractToStream(ArciveItem.FileName, Result)
              else // not a valid FBD structure
                raise EBookNotFound.CreateFmt(rstrBookNotFoundInArchive, [BookFileName]);

              Zip.CloseArchive;
            except
              FreeAndNil(Result);
              raise;
            end;
          except
            on e: EZFException do
            begin
              if e.NativeError = ErCannotOpenFile then
                raise EBookNotFound.CreateFmt(rstrArchiveNotFound, [BookFileName])
              else
                raise;
            end;
          end;
        finally
          FreeAndNil(Zip);
        end;
      end;

    bfRaw:
      begin
        raise ENotSupportedException.Create(rstrErrorNotSupported);
      end;
  end;

  Assert(Assigned(Result));
end;

// Save the book to a destination file
procedure TBookRecord.SaveBookToFile(const DestFileName: String);
var
  SourceStream: TStream;
  DestStream: TFileStream;
begin
  SourceStream := GetBookStream;
  try
    if SourceStream <> nil then
    begin
      DestStream := TFileStream.Create(DestFileName, fmCreate);
      try
        DestStream.CopyFrom(SourceStream, 0);
      finally
        FreeAndNil(DestStream);
      end;
    end;
  finally
    FreeAndNil(SourceStream);
  end;
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
  Result := Sign(i1 - i2);
end;

function CompareSeqNumber(i1, i2: Integer): Integer;
begin
  if (i1 > 0) and (i2 = 0) then
    Result := -1
  else if (i1 = 0) and (i2 > 0) then
    Result := 1
  else
    Result := Sign(i1 - i2);
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
  IdHTTP.ReadTimeout := Settings.ReadTimeOut;

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
    Application.MessageBox(PChar(Format(rstrUnableToLaunch, [FileName])), '', mb_IconExclamation)
  end;
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
      Zip.OpenArchive(fmOpenRead);
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

// When in DEBUG mode, append the text to the log file
procedure Log(const Text: string);
var
  FileName: string;
  LogFile: TextFile;
begin
{$IFDEF DEBUG}
  FileName := Settings.AppPath + 'MyHomeLib.log';
  AssignFile(LogFile, FileName);
  if FileExists(FileName) then
  begin
    Append(LogFile)
  end
  else
    ReWrite(LogFile);
  try
    if FileSize(LogFile) >= 10000 then
      ReWrite(LogFile);       // No more than 10000 lines
    WriteLn(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now) + '> ' + Text);
  finally
    CloseFile(LogFile);
  end;
{$ENDIF}
end;

procedure ClearLog;
var
  FileName: string;
  LogFile: TextFile;
begin
{$IFDEF DEBUG}
  FileName := Settings.AppPath + 'MyHomeLib.log';
  AssignFile(LogFile, FileName);
  if FileExists(FileName) then
  begin
    ReWrite(LogFile);
    CloseFile(LogFile);
  end;
{$ENDIF}
end;

end.

