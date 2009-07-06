
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}

unit unit_Globals;

interface

uses
  Classes,
  Graphics,
  SysUtils,
  ABSMain,
  StrUtils,
  Dialogs,
  VirtualTrees,
  IdHTTP,
  ZipForge;

type

  TTXTEncoding = (enUTF8, en1251, enUnicode, enUnknown);


  TTreeMode = (tmTree,tmFlat);

  TGenresType = (gtFb2, gtAny);

  TBookIdList = array of record
                   ID: integer;
                  Res: boolean;
                end;



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
  CONTENT_FB               = $0000;
  CONTENT_NONFB            = $0001;

  //
  // расположения библиотеки
  //
  LOCATION_LOCAL           = $00000000;
  LOCATION_ONLINE          = $08000000;

  //
  // предопределенные библиотеки
  //
  LIBRARY_PRIVATE          = $00000000;
  LIBRARY_LIBRUSEC         = $00010000;
  LIBRARY_GENESIS          = $00020000;

  //
  // различные маски
  //
  CT_CONTENT_MASK          = $00000001;
  CT_LOCATION_MASK         = $08000000;
  CT_TYPE_MASK             = $08030000;
  CT_MASK                  = CT_CONTENT_MASK or CT_TYPE_MASK;

  //
  // Несколько предопределенных типов
  //
  CT_PRIVATE_FB           = LIBRARY_PRIVATE or CONTENT_FB;                              // 0000 0000 -
  CT_PRIVATE_NONFB        = LIBRARY_PRIVATE or CONTENT_NONFB;                           // 0000 0001 -
  CT_LIBRUSEC_LOCAL_FB    = LOCATION_LOCAL or LIBRARY_LIBRUSEC or CONTENT_FB;           // 0001 0000 - local lib.rus.ec
  CT_LIBRUSEC_ONLINE_FB   = LOCATION_ONLINE or LIBRARY_LIBRUSEC or CONTENT_FB;          // 0801 0000 - online lib.rus.ec
  CT_GENESIS_LOCAL_NONFB  = LOCATION_LOCAL or LIBRARY_GENESIS or CONTENT_NONFB;         // 0002 0001 - local Genesis
  CT_GENESIS_ONLINE_NONFB = LOCATION_ONLINE or LIBRARY_GENESIS or CONTENT_NONFB;        // 0802 0001 - online Genesis
  CT_LIBRUSEC_USR         = LOCATION_LOCAL or LIBRARY_LIBRUSEC or CONTENT_NONFB;        // 0001 0001 - online Genesis

  CT_DEPRICATED_ONLINE_FB = 99;

type
  COLLECTION_TYPE = Integer;

function isPrivateCollection(t: COLLECTION_TYPE): Boolean; //inline;
function isExternalCollection(t: COLLECTION_TYPE): Boolean; //inline;
function isLocalCollection(t: COLLECTION_TYPE): Boolean; //inline;
function isOnlineCollection(t: COLLECTION_TYPE): Boolean; //inline;
function isFB2Collection(t: COLLECTION_TYPE): Boolean; //inline;
function isNonFB2Collection(t: COLLECTION_TYPE): Boolean; //inline;

// -----------------------------------------------------------------------------
function Transliterate(Input: string): string;
function CheckSymbols(Input: string): string;
///procedure GetFileList(InitDir, Ext: string; var OutList: TStringList);
function EncodeStr(Input: string): string;
function DecodeStr(Input: string): string;
//function DecodeBase64(const CinLine: ansistring): ansistring;
procedure StrReplace(s1, s2: String; var s3: String);

function ClearDir(const DirectoryName: string): Boolean;
function IsRelativePath(const FileName: string): Boolean;
function CreateFolders(Root: string; const Path: string): Boolean;
procedure CopyFile(const SourceFileName: string; const DestFileName: string);
procedure ConvertToTxt(const SourceFileName: string; DestFileName: string; Enc: TTXTEncoding);
procedure ZipFile(const FileName: string; const ZipFileName: string);

function InclideUrlSlash(S: string):string;

function PosChr(aCh: Char; const S: string): integer;
function CompareInt(i1, i2: Integer): Integer;
function CompareDate(d1,d2: TDateTime):Integer;

function GetFullBookPath(const Table: TAbsTable; const FCollectionRoot: string): string;

function GenerateBookLocation(const FullName: string):string;
function GenerateFileName(const Title: string; libID: integer):string;

procedure DebugOut(const DebugMessage: string); overload;
procedure DebugOut(const DebugMessage: string; const Args: array of const); overload;

procedure SetProxySettings(var idHTTP:TidHTTP);

function c_GetTempPath: String;
function GetSpecialPath(CSIDL: word): string;
function GetLibUpdateVersion(Full: boolean):integer;
function ExecAndWait(const FileName,Params: String; const WinState: Word): boolean;

//function GetFileNameZip(Zip: TZipForge; No: integer): string;
function CleanExtension(const Ext: string): string;


function TestArchive(FileName: string): boolean;

type
  TAppLanguage = (alEng, alRus);
  TExportMode = (emFB2, emFB2Zip, emLrf, emTxt);

  TDownloadState = (dsWait, dsRun, dsOk, dsError);

  PDownloadData = ^TDownloadData;
  TDownloadData = record
          ID: integer;
      Author: string;
       Title: string;
        Size: integer;
    FileName: string;
         URL: string;
       State: TDownloadState;
  end;

  PAuthorData = ^TAuthorData;
  TAuthorData = record
    Text: String;
    ID, Level: Integer;
    Checked: Boolean;
  end;

  TBookNodeType = (ntAuthorInfo = 1, ntSeriesInfo, ntBookInfo);
  PBookData = ^TBookData;
  TBookData = record
    nodeType: TBookNodeType;

    Title, Series, Genre, FullName, ColName, FileType : String;

    Lang: string[2];

    ID, SeriesID, Size, Rate, No, ImageIndex, Progress, LibRate: Integer;
    RatePos: Integer;
    Locale: boolean;
    Deleted: boolean;
    Date: TDateTime;
  end;

  PGenreData = ^TGenreData;
  TGenreData = record
    ID: integer;
    Text: String;
    Code: String;
    ParentCode: String;
  end;

  PGroupData = ^TGenreData;
  TGroupData = record
    ID: integer;
    Text: String;
  end;

  TGenreRecord = record
    GenreCode: String;
    GenreFb2Code: String;
    Alias: String;
  end;

  TAuthorRecord = record
    FFirstName: String;
    FMiddleName: String;
    FLastName: String;

    ID: Integer;

    procedure SetFirstName(const Value: String); inline;
    procedure SetLastName(const Value: String); inline;
    procedure SetMiddleName(const Value: String); inline;

    function GetFullName: String; inline;

    property FirstName: String read FFirstName write SetFirstName;
    property MiddleName: String read FMiddleName write SetMiddleName;
    property LastName: String read FLastName write SetLastName;
  end;

  TBookRecord = record
    Title: String;
    Series: String;

    Folder: String;
    FileName: String;
    FileExt: String;

    Authors: array of TAuthorRecord;
    Genres: array of TGenreRecord;

    Code: Integer;
    Size: Integer;
    InsideNo: Integer;
    SeqNumber: Integer;
    LibID: Integer;

    Deleted: Boolean;
    Local: Boolean;
    Date: TDateTime;

    Lang: string[2];
    LibRate: integer;

    KeyWords: string;
    URI: string;

    procedure Normalize;
    procedure Clear;
    function GenerateLocation: string;

    procedure ClearAuthors;
    procedure AddAuthor(const LastName: String; const FirstName: String; const MiddleName: String);
    function GetAuthorCount: Integer;
    property AuthorCount: Integer read GetAuthorCount;

    procedure ClearGenres;
    procedure AddGenreFB2(const GenreCode: String; const GenreFb2Code: String; const Alias: String);
    procedure AddGenreAny(const GenreCode: String; const Alias: String);
    function GetGenreCount: Integer;
    property GenreCount: Integer read GetGenreCount;

  end;

  PFileData = ^TFileData;
  TFileData = record
    FullPath, FileName, Folder, Ext, Title: String;
    Size: integer;
    DataType : (dtFolder,dtFile);
    Date: TDateTime;
  end;

  TColumnData = record
    Text: String;
    Position, Width, MaxWidth, MinWidth: Integer;
    Alignment: TAlignment;
    Options: TVTColumnOptions;
  end;

implementation

uses
  Forms,
  Windows,
  unit_Settings,
  unit_Consts,
  idException,
  idStack,
  ShlObj,
  frm_main,
  unit_fb2ToText;

const
  lat: set of char = ['A'..'Z', 'a'..'z', '\', '-', ':', '`', ',', '.', '0'..'9', '_', '(', ')', '[', ']', '{', '}'];
const
  denied: set of char = ['<', '>', ':', '"', '/', '|', '*', '?'];
const
  TransL: array[0..31] of string = ('a', 'b', 'v', 'g', 'd', 'e', 'zh', 'z', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'c', 'ch', 'sh', 'sch', '''', 'i', '''', 'e', 'yu', 'ya');
const
  TransU: array[0..31] of string = ('A', 'B', 'V', 'G', 'D', 'E', 'Zh', 'Z', 'I', 'Y', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'H', 'C', 'Ch', 'Sh', 'Sch', '''', 'I', '''', 'E', 'Yu', 'Ya');

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

function PosChr(aCh: Char; const S: string): integer;
var
  i, max: integer;
begin
  Result := 0;
  Max := Length(S);
  for i := 1 to Max do
    if S[i] = aCh then
    begin
      Result := i;
      Exit;
    end;
end;

procedure StrReplace(s1, s2: String; var s3: String);
var
  p: integer;
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
  if
    ((L >= 1) and IsPathDelimiter(FileName, 1)) or // \dir\subdir or /dir/subdir
    ((L >= 2) and (FileName[1] in ['A'..'Z', 'a'..'z']) and (FileName[2] = ':')) // C:, D:, etc.
    then
    Result := False;
end;

function CreateFolders(Root: string; const Path: string): Boolean;
var
  fullPath: string;
begin
  if Path <> '\' then
  begin
    if Root = '' then Root := Settings.AppPath;
    fullPath := ExcludeTrailingPathDelimiter(
      IfThen(IsRelativePath(Path), IncludeTrailingPathDelimiter(Root) + Path, Path)
      )
  end
  else
    fullPath := ExcludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(Root));
  Result := SysUtils.ForceDirectories(fullPath);
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
    DestFileName := ChangeFileExt(DestFileName,'.txt');
    Converter.Convert(SourceFileName,DestFileName, Enc);
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

function EncodeStr(Input: string): string;
var
  i: Integer;
begin
  Result := Input;
  for i := 1 to Length(Input) do
    Result[i] := Chr(Ord(Input[i]) + 5);
end;

function DecodeStr(Input: string): string;
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
           SysUtils.DeleteFile(ACurrentDir + SearchRec.Name)
      until FindNext(SearchRec) <> 0;
    finally
      SysUtils.FindClose(SearchRec);
    end;
  except
    Result := False;
  end;
end;
{$WARNINGS ON}

function Transliterate(Input: string): string;
var
  s, conv: string;
  f, o: integer;
begin
  Conv := '';
  for f := 1 to length(input) do
  begin
    o := ord(Input[f]);
    if (o >= 1072) and (o <= 1104) then
      s := TransL[o - 1072]
    else if (o >= 1040 ) and (o <= 1071) then
      s := TransU[o - 1040]
    else
      if CharInSet(Input[f],lat) then
        s := Input[f]
    else
      s := '_';
    Conv := Conv + s;
  end;
  result := conv;
end;

function CheckSymbols(Input: string): string;
var
  s, conv: string;
  f: integer;
begin
  Conv := '';
  for f := 1 to length(input) do
  begin
    if CharInSet(Input[f],denied) then
      s := ' '
    else
      s := Input[f];
    Conv := Conv + s;
  end;
  result := conv;
end;

function DecodeBase64(const CinLine: ansistring): ansistring;
const
  RESULT_ERROR = -2;
var
  inLineIndex: Integer;
  c: AnsiChar;
  x: SmallInt;
  c4: Word;
  StoredC4: array[0..3] of SmallInt;
  InLineLength: Integer;
begin
  Result := '';
  inLineIndex := 1;
  c4 := 0;
  InLineLength := Length(CinLine);

  while inLineIndex <= InLineLength do
  begin
    while (inLineIndex <= InLineLength) and (c4 < 4) do
    begin
      c := CinLine[inLineIndex];
      case c of
        '+': x := 62;
        '/': x := 63;
        '0'..'9': x := Ord(c) - (Ord('0') - 52);
        '=': x := -1;
        'A'..'Z': x := Ord(c) - Ord('A');
        'a'..'z': x := Ord(c) - (Ord('a') - 26);
      else
        x := RESULT_ERROR;
      end;
      if x <> RESULT_ERROR then
      begin
        StoredC4[c4] := x;
        Inc(c4);
      end;
      Inc(inLineIndex);
    end;

    if c4 = 4 then
    begin
      c4 := 0;
      Result := Result + AnsiChar((StoredC4[0] shl 2) or (StoredC4[1] shr 4));
      if StoredC4[2] = -1 then
        Exit;
      Result := Result + AnsiChar((StoredC4[1] shl 4) or (StoredC4[2] shr 2));
      if StoredC4[3] = -1 then
        Exit;
      Result := Result + AnsiChar((StoredC4[2] shl 6) or (StoredC4[3]));
    end;
  end;
end;

function GenerateBookLocation(const FullName: string):string;
var
  Letter: string;
  AuthorName: string;
begin
  //
  // Не обрезаем пробелы здесь!!! От их наличия зависит расположение файла - на букве или в каталоге '_'
  //
  AuthorName := CheckSymbols(FullName);  // Ф.И.О. - полностью!

  Letter := Trim(AuthorName[1]);
  if Letter = '' then
    Letter := '_';

  AuthorName := Trim(AuthorName);
  if AuthorName = '' then
    AuthorName := UNKNOWN_AUTHOR_LASTNAME;

  Result := IncludeTrailingPathDelimiter(Letter) + IncludeTrailingPathDelimiter(AuthorName);
end;

function GenerateFileName(const Title: string; libID: integer):string;
var
  BookTitle: string;
begin
  BookTitle := Trim(CheckSymbols(Title));
  if BookTitle = '' then
    BookTitle := BOOK_NO_TITLE;
  Result := IntToStr(LibID) + ' ' + BookTitle;
end;

{ TAuthorRecord }

function TAuthorRecord.GetFullName: String;
begin
  Assert(LastName <> '');

  Result := LastName;

  if FirstName <> '' then
    Result := Result + ' ' + FirstName;

  if MiddleName <> '' then
    Result := Result + ' ' + MiddleName;
end;

procedure TAuthorRecord.SetFirstName(const Value: String);
begin
  FFirstName := Trim(Value);
end;

procedure TAuthorRecord.SetLastName(const Value: String);
begin
  FLastName := Trim(Value);
end;

procedure TAuthorRecord.SetMiddleName(const Value: String);
begin
  FMiddleName := Trim(Value);
end;

procedure TBookRecord.Clear;
begin
  Title := '';
  Series := '';

  Folder := '';
  FileName := '';
  FileExt := '';

  ClearAuthors;
  ClearGenres;

  Code := 0;
  Size := 0;
  InsideNo := 0;
  SeqNumber := 0;
  LibID := 0;

  Deleted := False;
  Local := False;
  Date := 0;
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
  if Series = '' then
    Series := NO_SERIES_TITLE;

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

//
// Формирует И\Иванов Иван Иванович\Просто книга
//
function TBookRecord.GenerateLocation: string;
begin
  Assert(AuthorCount > 0);
  Result := GenerateBookLocation(Authors[0].GetFullName) + GenerateFileName(Title, LibID);
end;

procedure TBookRecord.ClearAuthors;
begin
  SetLength(Authors, 0);
end;

procedure TBookRecord.AddAuthor(const LastName: String; const FirstName: String; const MiddleName: String);
var
  i: Integer;
begin
  i := AuthorCount;
  SetLength(Authors, i + 1);

  Authors[i].LastName := LastName;
  Authors[i].FirstName := FirstName;
  Authors[i].MiddleName := MiddleName;
  Authors[i].ID := 0;
end;

function TBookRecord.GetAuthorCount: Integer;
begin
  Result := Length(Authors);
end;

procedure TBookRecord.ClearGenres;
begin
  SetLength(Genres, 0);
end;

procedure TBookRecord.AddGenreFB2(const GenreCode: String; const GenreFb2Code: String; const Alias: String);
var
  i: Integer;
begin
  i := GenreCount;
  SetLength(Genres, i + 1);

  Genres[i].GenreCode := GenreCode;
  Genres[i].GenreFb2Code := GenreFb2Code;
  Genres[i].Alias := Alias;
end;

procedure TBookRecord.AddGenreAny(const GenreCode: String; const Alias: String);
var
  i: Integer;
begin
  i := GenreCount;
  SetLength(Genres, i + 1);

  Genres[i].GenreCode := GenreCode;
  Genres[i].GenreFb2Code := '';
  Genres[i].Alias := Alias;
end;



function TBookRecord.GetGenreCount: Integer;
begin
  Result := Length(Genres);
end;

function GetFullBookPath(const Table:TAbsTable; const FCollectionRoot:string):string;
begin
  if Table.Name = 'tblFavorites' then
      Result := Table.FieldByName('Folder').AsString
   else if not Table.FieldByName('Folder').IsNull then
      Result := FCollectionRoot + Table.FieldByName('Folder').AsString
   else
      Result := FCollectionRoot;
end;

//procedure RenameFileInArchive(ArchName,NewFileName:string);
//var
//  Zip: TZipMaster;
//
//begin
//  Zip := TZipMaster.Create(Nil);
//  try
//    Zip.ZipFileName := ArchName;
//    ZipDirEntry(Zip.ZipContents[0]^).FileName := NewFileName + '.fb2';
//  finally
//    Zip.Free;
//  end;
//end;


function InclideUrlSlash(S: string):string;
begin
  Result := S;
  if Result[ Length(Result) ] <> '/' then
    Result := Result + '/';
end;

function CompareDate(d1, d2: TDateTime): integer;
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

procedure DebugOut(const DebugMessage: string; const Args: array of const);
begin
{$IFOPT D+}
  OutputDebugString(PChar(Format(DebugMessage, Args)));
{$ENDIF}
end;

function c_GetTempPath: String;
var
  Buffer: array[0..65536] of Char;
begin
  SetString(Result, Buffer, GetTempPath(Sizeof(Buffer)-1,Buffer));
end;

function GetSpecialPath(CSIDL: word): string;
var s:  string;
begin
  SetLength(s, MAX_PATH);
  if not SHGetSpecialFolderPath(0, PChar(s), CSIDL, true)
  then s := '';
  result := IncludeTrailingPathDelimiter(PChar(s));
end;

procedure SetProxySettings(var idHTTP:TidHTTP);
begin
  with idHTTP.ProxyParams do
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

  idHTTP.ConnectTimeout := Settings.TimeOut;
  idHTTP.ReadTimeout := Settings.ReadTimeOut;

  idHTTP.CookieManager := frmMain.IdCookieManager;
  idHTTP.AllowCookies := True;

  idHTTP.HandleRedirects := True;

end;

function CheckLibVersion(ALocalVersion: Integer; Full: boolean; out ARemoteVersion: Integer): Boolean;
var
  HTTP: TIdHTTP;
  LF: TMemoryStream;
  SL: TStringList;

  URL: string;
begin
  Result := False;

  URL := IfThen(Full,
                InclideUrlSlash(Settings.UpdateURL) + LIBRUSEC_UPDATEVERINFO_FILENAME,
                InclideUrlSlash(Settings.UpdateURL) + EXTRA_UPDATEVERINFO_FILENAME);

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

function GetLibUpdateVersion(Full: boolean):integer;
var
  F: Text;
  S: String;

begin
  Result := 0;
  S := Settings.SystemFileName[sfCollectionVerInfo];

  if FileExists(S) then
  begin
    AssignFile(F, S);
    try
      Reset(F);
      Readln(F, S);
      CloseFile(F);
      Result := StrToIntDef(S, 0);
    except
      on EInOutError do
            { не смогли открыть файл };
    end;
  end
  else Result := UNVERSIONED_COLLECTION;
end;

function ExecAndWait(const FileName,Params: String; const WinState: Word): boolean;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: String;
begin
  CmdLine := '' + Filename + ' ' + Params;
  FillChar(StartInfo, SizeOf(StartInfo), #0);
  with StartInfo do
  begin
    cb := SizeOf(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
  CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
  PChar(ExtractFilePath(Filename)),StartInfo,ProcInfo);
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Free the Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end
  else
  begin
    //
    // { TODO -oNickR -cRefactoring : не самая лучшая идея показывать диалоги прямо из этой функции. Она может быть вызвана из рабочего потока. }
    //
    Application.MessageBox(PChar(Format(' Не удалось запустить %s ! ',[FileName])),'',mb_IconExclamation)
  end;
end;

function GetFileNameZip(Zip: TZipForge; No: integer): string;
var
  i: integer;
  ArchItem: TZFArchiveItem;
begin
  i := 0;
  if (Zip.FindFirst('*.*',ArchItem,faAnyFile-faDirectory)) then
  while i <> No do
  begin
    Zip.FindNext(ArchItem);
    inc(i);
  end;
  Result := ArchItem.FileName;
end;

function CleanExtension(const Ext: string): string;
begin
  Result := Trim(Ext);
  if (Result <> '') and (Result[1] = '.') then
    Delete(Result, 1, 1);
end;

function TestArchive(FileName: string): boolean;
var
  Zip: TZipForge;
begin
  Result := False;
  Zip := TZipForge.Create(nil);
  try
    Zip.FileName := FileName;
    Zip.TempDir := Settings.TempDir;
    Zip.OpenArchive;
    try
      Zip.TestFiles('*.*');
    except

    end;
    Zip.CloseArchive;
    Result := True;
  finally
    Zip.Free;
  end;
end;


end.

