{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit unit_ImportInpxThread;

interface

uses
  Classes,
  SysUtils,
  StrUtils,
  unit_WorkerThread,
  unit_MHL_xml,
  unit_globals;



type

  TFields = (flNone,flAuthor, flTitle, flSeries, flSerNo, flGenre, flLibID,
             flInsideNo, flFile, flFolder, flExt, flSize, flLang, flDate,
             flCode, flDeleted, flRate, flURI, flLibRate, flKeyWords);

  TFieldDescr = record
                   Code: string;
                  FType: TFields;
  end;

  TImportLibRusEcThread = class(TWorker)
  private

    FDBFileName: string;
    FCollectionRoot: string;
    FCollectionType: Integer;
    FInpxFileName: string;

    FFields: array of TFields;

    FPersonalFolder: boolean;

    FVersion: integer;
    FGenresType: TGenresType;

    procedure SetCollectionRoot(const Value: string);
    procedure  ParseData(input: WideString; var R: TBookRecord);

  protected
    procedure WorkFunction; override;
    procedure GetFields;
  public
    function Import:integer;

    property DBFileName: string read FDBFileName write FDBFileName;
    property CollectionRoot: string read FCollectionRoot write SetCollectionRoot;
    property CollectionType: COLLECTION_TYPE read FCollectionType write FCollectionType;
    property InpxFileName: string read FInpxFileName write FInpxFileName;
    property GenresType: TGenresType write FGenresType;

  end;

implementation

uses
  unit_database,
  unit_Settings,
  unit_Consts,
  unit_Helpers,
  ZipForge;

type
  INPXType = (inpUnknown, inpFormat_10, inpFormat_11);

const

  FieldsDescr: array [1..19] of  TFieldDescr= (
    (Code:'AUTHOR'; FType: flAuthor),
    (Code:'TITLE';  FType:  flTitle),
    (Code:'SERIES'; FType:  flSeries),
    (Code:'SERNO';  FType:  flSerNo),
    (Code:'GENRE';  FType:  flGenre),
    (Code:'LIBID';  FType:   flLibID),
    (Code:'INSNO';  FType:  flInsideNo),
    (Code:'FILE';   FType:  flFile),
    (Code:'FOLDER'; FType: flFolder),
    (Code:'EXT';    FType:   flExt),
    (Code:'SIZE';   FType:   flSize),
    (Code:'LANG';   FType:  flLang),
    (Code:'DATE';   FType:  flDate),
    (Code:'CODE';   FType:  flCode),
    (Code:'DEL';    FType:  flDeleted),
    (Code:'RATE';   FType: flRate),
    (Code:'URI';    FType:  flURI),
    (Code:'LIBRATE';FType:  flLibRate),
    (Code:'KEYWORDS';FType:  flKeyWords)
  );

{ TImportLibRusEcThread }

function ParseString(const InputStr: String; const DelimiterChar: Char;
  var slParams: TStringList): Boolean;
//const
//  DelimiterChar = Chr(4);
var
  nPos : integer;
  cParam: String;
  nParamsCount : Integer;
begin
  nParamsCount := 0;
  slParams.Clear;
  //
  // Инициализируем выходной стринглист slParams
  // В цикле обрабатываем строку, если символ равен разделителю - добавляем параметр в стринглист,
  // иначе - прибавляем символ ко временной переменной
  //
  cParam := '';
  for nPos := 1 to Length(InputStr) do begin
    if InputStr[nPos] <> DelimiterChar  then
      cParam := cParam + InputStr[nPos]
    else begin
      slParams.Add(cParam);
      cParam := '';
      inc(nParamsCount);
    end;
  end;
  //
  // Если временная переменная не пуста, добавляем её в стринглист.
  //
  if cParam <> '' then begin
    slParams.Add(cParam);
    Inc(nParamsCount);
    cParam := '';
  end;
  //
  // Проверяем соответствие количества параметров в стринглисте счётчику
  // и выводим полученное значение как результат функции разбора
  //
  Result := slParams.Count = nParamsCount;
end;


procedure TImportLibRusEcThread.ParseData(input: WideString; var R: TBookRecord);
const
  DelimiterChar = Chr(4);
var
  p,i: integer;
  slParams: TStringList;
  nParamsCount : Integer;
  AuthorList: string;
  strLastName: string;
  strFirstName: string;
  strMidName: string;
  GenreList: string;
  s: string;
  mm, dd, yy: word;

  Max : integer;

begin

  R.Clear;
  slParams := TStringList.Create;
  try
    ParseString(input, DelimiterChar, slParams);

    // -- костыль
    if slParams.Count < High(FFields) then
      Max := slParams.Count - 1
    else
      Max := High(FFields);
    //--

    for i := 0 to Max do
      case FFields[i] of
        flAuthor: begin                                       // Список авторов
                    AuthorList := slParams[i];
                    p := PosChr(':', AuthorList);
                    while p <> 0 do
                    begin
                      s := Copy(AuthorList, 1, p - 1);
                      Delete(AuthorList, 1, p);

                      p := PosChr(',', s);
                      strLastName := Copy(s, 1, p - 1);
                      Delete(S, 1, p);

                      p := PosChr(',', s);
                      strFirstName := Copy(s, 1, p - 1);
                      Delete(S, 1, p);

                      strMidName := S;

                      R.AddAuthor(strLastName, strFirstName, strMidName);

                      p := PosChr(':', AuthorList);
                    end;
                  end;
        flGenre: begin                                         // Список жанров
                   GenreList := slParams[i];
                   p := PosChr(':', GenreList);
                   while p <> 0 do
                   begin
                     if FGenresType = gtFb2 then
                       R.AddGenreFB2('', Copy(GenreList, 1, p - 1), '')
                     else
                       R.AddGenreAny(Copy(GenreList, 1, p - 1), '');

                     Delete(GenreList, 1, p);
                     p := PosChr(':', GenreList);
                    end;
                 end;
        flTitle:  R.Title := slParams[i];                        // Название
        flSeries: R.Series := slParams[i];                       // Серия
        flSerNo:  R.SeqNumber := StrToIntDef(slParams[i], 0);    // Номер внутри серии
        flFile:   R.FileName := CheckSymbols(Trim(slParams[i])); // Имя файла
        flExt:    R.FileExt := '.' + slParams[i];                // Тип
        flSize:   R.Size := StrToIntDef(slParams[i], 0);         // Размер
        flLibID:  R.LibID := StrToIntDef(slParams[i], 0);        // внутр. номер
        flDeleted:R.Deleted := (slParams[i] = '1');              // удалена
        flDate:   begin                                          // дата
                    if slParams[i] <> '' then
                    begin
                      yy := StrToInt(Copy(slParams[i], 1, 4));
                      mm := StrToInt(Copy(slParams[i], 6, 2));
                      dd := StrToInt(Copy(slParams[i], 9, 2));
                      R.Date := EncodeDate(yy, mm, dd);
                    end
                    else R.Date:=now;
                  end;

        flInsideNo:  R.InsideNo := StrToInt(slParams[i]);        // номер в архиве
        flFolder:    R.Folder := slParams[i];                    // папка
        flLibrate:   R.LibRate := StrToIntDef(slParams[i], 0);   // внешний рейтинг
        flLang:      R.Lang := slParams[i];                      // язык
        flKeyWords:  R.KeyWords := slParams[i];                  // ключевые слова
    end; // case, for
    R.Normalize;
  finally
    slParams.Free;
  end;
end;

procedure TImportLibRusEcThread.GetFields;
const
  del = ';';
  Default = 'AUTHOR;GENRE;TITLE;SERIES;SERNO;FILE;SIZE;LIBID;DEL;EXT;DATE;';
  FN = 'structure.info';

var
  S: string;
  p, i: integer;
  F: text;

  function FindType(S:string): TFields;
  var
    F: TFieldDescr;
  begin
    for F in FieldsDescr do
      if F.Code = S then
      begin
        Result := F.FType;
        Break;
      end;
  end;


begin

  S := '';
  if FileExists(Settings.TempPath + FN) then
  begin
    AssignFile(F,Settings.TempPath + FN);
    Reset(F);
    Read(F,S);
    CloseFile(F);

    DeleteFile(Settings.TempPath + FN);
  end;

  if S = '' then S := Default;

  // код
  SetLength(FFields,0);
  i :=0;
  p := pos(del,S);
  while p <> 0 do
  begin
    SetLength(FFields,i + 1);
    FFields[i] := FindType(copy(S,1,p - 1));
    Delete(S,1,p);
    p := pos(del,S);

    if not FPersonalFolder then
        FPersonalFolder := (FFields[i]=flFolder);

    inc(i);
  end;
end;

function TImportLibRusEcThread.Import:integer;
var
  FLibrary: TMHLLibrary;
  BookList: TStringList;
  i: Integer;
  j: Integer;
  R: TBookRecord;
  filesProcessed: Integer;
  unZip:TZipForge;
  CurrentFile: string;
  ArchItem: TZFArchiveItem;

  FileStream : TMemoryStream;

begin
  filesProcessed := 0;
  i := 0;
  SetProgress(0);
  FLibrary := TMHLLibrary.Create(nil);
  try
    FLibrary.DatabaseFileName := DBFileName;

    FLibrary.Active := True;

    FLibrary.BeginBulkOperation;
    try
      unZip := TZipForge.Create(Nil);
      unZip.BaseDir := Settings.TempPath;
      unZip.FileName := FInpxFileName;
      unZip.OpenArchive;
      unZip.ExtractFiles('*.*');
      GetFields;
      try
        BookList := TStringListEx.Create;
        if (unZip.FindFirst('*.inp',ArchItem,faAnyFile-faDirectory)) then
        repeat
          CurrentFile:= ArchItem.FileName;
          if not(isOnlineCollection(CollectionType)) and
            ( CurrentFile = 'extra.inp')
            then Continue;

          Teletype(Format('Обрабатываем файл %s', [CurrentFile]), tsInfo);
          BookList.LoadFromFile(Settings.TempPath + CurrentFile,TEncoding.UTF8);
          for j := 0 to BookList.Count - 1 do
          begin
            ParseData(BookList[j], R);
            if isOnlineCollection(CollectionType) then
            begin
              // И\Иванов Иван\1234 Просто книга.fb2.zip
              R.Folder := R.GenerateLocation + FB2ZIP_EXTENSION;
              // Сохраним отметку о существовании файла
              R.Local := FileExists(FCollectionRoot + R.Folder);
            end
            else
            begin
              if not FPersonalFolder then
              begin
                // 98058-98693.inp -> 98058-98693.zip
                R.Folder := ChangeFileExt(CurrentFile, ZIP_EXTENSION);
                //
                R.InsideNo := j;
              end
            end;
            FLibrary.InsertBook(R);
            Inc(filesProcessed);
            if (filesProcessed mod ProcessedItemThreshold) = 0 then
            begin
              SetProgress(round((i + j/BookList.Count) * 100 / unZip.FileCount));
              SetComment(Format('Добавлено %u книг', [filesProcessed]));
            end;
          end;
          inc(i);
          if Canceled then
            Break;
        until (not unZip.FindNext(ArchItem));
      finally
        BookList.Free;
      end;
      SetComment(Format('Добавлено %u книг', [filesProcessed]));
    finally
      unZip.Free;
    end;
  finally
    FLibrary.EndBulkOperation;
    FLibrary.Free;
  end;
end;

procedure TImportLibRusEcThread.SetCollectionRoot(const Value: string);
begin
  FCollectionRoot := IncludeTrailingPathDelimiter(Value);
end;

procedure TImportLibRusEcThread.WorkFunction;
begin
  Import;
end;

end.

