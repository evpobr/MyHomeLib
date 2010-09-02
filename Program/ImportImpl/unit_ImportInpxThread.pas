(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  *                     Aleksey Penkov  alex.penkov@gmail.com
  * Created             12.02.2010
  * Description
  *
  * $Id$
  *
  * History
  * NickR 02.03.2010    Код переформатирован
  *
  ****************************************************************************** *)

{ TODO -oNickR : думаю, стоит попробовать не распаковывать архив на диск, а распаковывать нужный файл напрямую в Stream }

unit unit_ImportInpxThread;

interface

uses
  Windows,
  unit_WorkerThread,
  unit_Globals;

type
  TFields = (
    flNone,
    flAuthor,
    flTitle,
    flSeries,
    flSerNo,
    flGenre,
    flLibID,
    flInsideNo,
    flFile,
    flFolder,
    flExt,
    flSize,
    flLang,
    flDate,
    flCode,
    flDeleted,
    flRate,
    flURI,
    flLibRate,
    flKeyWords
  );

  TFieldDescr = record
    Code: string;
    FType: TFields;
  end;

  TImportInpxThread = class(TWorker)
  private
    FDBFileName: string;
    FCollectionRoot: string;
    FCollectionType: Integer;
    FInpxFileName: string;

    FFields: array of TFields;

    FPersonalFolder: boolean;

    FGenresType: TGenresType;

    procedure SetCollectionRoot(const Value: string);
    procedure ParseData(const input: string; const OnlineCollection: Boolean; var R: TBookRecord);

  protected
    procedure WorkFunction; override;
    procedure GetFields;

  public
    function Import(CheckFiles: Boolean): Integer;

    property DBFileName: string read FDBFileName write FDBFileName;
    property CollectionRoot: string read FCollectionRoot write SetCollectionRoot;
    property CollectionType: COLLECTION_TYPE read FCollectionType write FCollectionType;
    property InpxFileName: string read FInpxFileName write FInpxFileName;
    property GenresType: TGenresType write FGenresType;
  end;

implementation

uses
  Classes,
  SysUtils,
  unit_database,
  unit_Settings,
  unit_Consts,
  unit_Helpers,
  unit_Errors,
  ZipForge;

resourcestring
  rstrProcessingFile = 'Обрабатываем файл %s';
  rstrAddedBooks = 'Добавлено %u книг';
  rstrErrorInpStructure = 'Ошибка структуры inp. Файл %s, Строка %u ';
  rstrDBErrorInp = 'Ошибка базы данных при импорте книги. Файл %s, Строка %u ';

//type
//  INPXType = (inpUnknown, inpFormat_10, inpFormat_11);

const
  FieldsDescr: array [1 .. 20] of TFieldDescr = (
    (Code: 'AUTHOR';   FType: flAuthor),
    (Code: 'TITLE';    FType: flTitle),
    (Code: 'SERIES';   FType: flSeries),
    (Code: 'SERNO';    FType: flSerNo),
    (Code: 'GENRE';    FType: flGenre),
    (Code: 'LIBID';    FType: flLibID),
    (Code: 'INSNO';    FType: flInsideNo),
    (Code: 'FILE';     FType: flFile),
    (Code: 'FOLDER';   FType: flFolder),
    (Code: 'EXT';      FType: flExt),
    (Code: 'SIZE';     FType: flSize),
    (Code: 'LANG';     FType: flLang),
    (Code: 'DATE';     FType: flDate),
    (Code: 'CODE';     FType: flCode),
    (Code: 'DEL';      FType: flDeleted),
    (Code: 'RATE';     FType: flRate),
    (Code: 'URI';      FType: flURI),
    (Code: 'LIBRATE';  FType: flLibRate),
    (Code: 'KEYWORDS'; FType: flKeyWords),
    (Code: 'URL';      FType: flURI)
  );

  { TImportLibRusEcThread }

function ParseString(const InputStr: string; const DelimiterChar: Char; var slParams: TStringList): Boolean;
var
  nPos: Integer;
  cParam: string;
  nParamsCount: Integer;
begin
  nParamsCount := 0;
  slParams.Clear;
  //
  // Инициализируем выходной стринглист slParams
  // В цикле обрабатываем строку, если символ равен разделителю - добавляем параметр в стринглист,
  // иначе - прибавляем символ ко временной переменной
  //
  cParam := '';
  for nPos := 1 to Length(InputStr) do
  begin
    if InputStr[nPos] <> DelimiterChar then
      cParam := cParam + InputStr[nPos]
    else
    begin
      slParams.Add(cParam);
      cParam := '';
      Inc(nParamsCount);
    end;
  end;
  //
  // Если временная переменная не пуста, добавляем её в стринглист.
  //
  if cParam <> '' then
  begin
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

procedure TImportInpxThread.ParseData(const input: string; const OnlineCollection: Boolean; var R: TBookRecord);
var
  p, i: Integer;
  slParams: TStringList;
  //nParamsCount: Integer;
  AuthorList: string;
  strLastName: string;
  strFirstName: string;
  strMidName: string;
  GenreList: string;
  s: string;
  mm, dd, yy: word;

  Max: Integer;

begin

  R.Clear;
  slParams := TStringList.Create;
  try
    ParseString(input, INPX_FIELD_DELIMITER, slParams);

    // -- костыль
    if slParams.Count < High(FFields) then
      Max := slParams.Count - 1
    else
      Max := High(FFields);
    // --

    for i := 0 to Max do
    begin
      case FFields[i] of
        flAuthor:
          begin // Список авторов
            AuthorList := slParams[i];
            p := PosChr(INPX_ITEM_DELIMITER, AuthorList);
            while p <> 0 do
            begin
              s := Copy(AuthorList, 1, p - 1);
              Delete(AuthorList, 1, p);

              p := PosChr(INPX_SUBITEM_DELIMITER, s);
              strLastName := Copy(s, 1, p - 1);
              Delete(s, 1, p);

              p := PosChr(INPX_SUBITEM_DELIMITER, s);
              strFirstName := Copy(s, 1, p - 1);
              Delete(s, 1, p);

              strMidName := s;

              TAuthorsHelper.Add(R.Authors, strLastName, strFirstName, strMidName);

              p := PosChr(INPX_ITEM_DELIMITER, AuthorList);
            end;
          end;

        flGenre:
          begin // Список жанров
            GenreList := slParams[i];
            p := PosChr(INPX_ITEM_DELIMITER, GenreList);
            while p <> 0 do
            begin
              if FGenresType = gtFb2 then
                TGenresHelper.Add(R.Genres, '', '', Copy(GenreList, 1, p - 1))
              else
                TGenresHelper.Add(R.Genres, Copy(GenreList, 1, p - 1), '', '');

              Delete(GenreList, 1, p);
              p := PosChr(INPX_ITEM_DELIMITER, GenreList);
            end;
          end;

        flTitle:
          R.Title := slParams[i]; // Название

        flSeries:
          R.Series := slParams[i]; // Серия

        flSerNo:
          R.SeqNumber := StrToIntDef(slParams[i], 0); // Номер внутри серии

        flFile:
          R.FileName := CheckSymbols(Trim(slParams[i])); // Имя файла

        flExt:
          R.FileExt := '.' + slParams[i]; // Тип

        flSize:
          R.Size := StrToIntDef(slParams[i], 0); // Размер

        flLibID:
          begin
            // relevant only for online collections in which will used to access the remote book by this id
            if OnlineCollection then
              R.LibID := StrToIntDef(slParams[i], 0) // внутр. номер
            else
              R.LibID := 0;
          end;

        flDeleted:
          R.IsDeleted := (slParams[i] = '1'); // удалена

        flDate:
          begin // дата
            if slParams[i] <> '' then
            begin
              yy := StrToInt(Copy(slParams[i], 1, 4));
              mm := StrToInt(Copy(slParams[i], 6, 2));
              dd := StrToInt(Copy(slParams[i], 9, 2));
              R.Date := EncodeDate(yy, mm, dd);
            end
            else
              R.Date := EncodeDate(70, 01, 01);
          end;

        flInsideNo:
          R.InsideNo := StrToInt(slParams[i]); // номер в архиве

        flFolder:
          R.Folder := slParams[i]; // папка

        flLibRate:
          R.LibRate := StrToIntDef(slParams[i], 0); // внешний рейтинг

        flLang:
          R.Lang := slParams[i]; // язык

        flKeyWords:
          R.KeyWords := slParams[i]; // ключевые слова

        flURI:
          Assert(False, 'Not supported anymore');
          ///R.URI := slParams[i]; // ключевые слова
      end; // case, for
    end;

    R.Normalize;
  finally
    slParams.Free;
  end;
end;

procedure TImportInpxThread.GetFields;
const
  del = ';';
  Default = 'AUTHOR;GENRE;TITLE;SERIES;SERNO;FILE;SIZE;LIBID;DEL;EXT;DATE;LANG;LIBRATE;KEYWORDS';
  FN = 'structure.info';

var
  s: string;
  p, i: Integer;
  F: text;

  function FindType(const s: string): TFields;
  var
    F: TFieldDescr;
  begin
    for F in FieldsDescr do
      if F.Code = s then
      begin
        Result := F.FType;
        Exit;
      end;
    Result := flNone;
  end;

begin
  s := '';
  if FileExists(Settings.TempPath + FN) then
  begin
    AssignFile(F, Settings.TempPath + FN);
    Reset(F);
    Read(F, s);
    CloseFile(F);

    DeleteFile(Settings.TempPath + FN);
  end;

  if s = '' then
    s := Default;

  // код
  SetLength(FFields, 0);
  i := 0;
  p := Pos(del, s);
  while p <> 0 do
  begin
    SetLength(FFields, i + 1);
    FFields[i] := FindType(Copy(s, 1, p - 1));
    Delete(s, 1, p);
    p := Pos(del, s);

    if not FPersonalFolder then
      FPersonalFolder := (FFields[i] = flFolder);

    Inc(i);
  end;
end;

function TImportInpxThread.Import(CheckFiles: Boolean): Integer;
var
  FLibrary: TBookCollection;
  BookList: TStringList;
  i: Integer;
  j: Integer;
  R: TBookRecord;
  filesProcessed: Integer;
  unZip: TZipForge;
  CurrentFile: string;
  ArchItem: TZFArchiveItem;
  OnlineCollection: Boolean;
  //FileStream: TMemoryStream;
begin
  filesProcessed := 0;
  i := 0;
  SetProgress(0);

  FLibrary := GetBookCollection(DBFileName);
  FLibrary.BeginBulkOperation;
  try
    unZip := TZipForge.Create(nil);
    try
      unZip.BaseDir := Settings.TempPath;
      unZip.FileName := FInpxFileName;
      unZip.OpenArchive(fmOpenRead);
      unZip.ExtractFiles('*.*');

      GetFields;

      BookList := TStringList.Create; { TODO -oNickR -cunused code : насколько я понимаю, этот класс больше ненужен }
      try
        if (unZip.FindFirst('*.inp', ArchItem, faAnyFile - faDirectory)) then
        begin
          repeat
            CurrentFile := ArchItem.FileName;

            OnlineCollection := isOnlineCollection(CollectionType);
            if not isOnlineCollection(CollectionType) and (CurrentFile = 'extra.inp') then
              Continue;

            Teletype(Format(rstrProcessingFile, [CurrentFile]), tsInfo);

            BookList.LoadFromFile(Settings.TempPath + CurrentFile, TEncoding.UTF8);

            for j := 0 to BookList.Count - 1 do
            begin
              try
                ParseData(BookList[j], OnlineCollection, R);
                if OnlineCollection then
                begin
                  // И\Иванов Иван\1234 Просто книга.fb2.zip
                  R.Folder := R.GenerateLocation + FB2ZIP_EXTENSION;
                  // Сохраним отметку о существовании файла
                  R.IsLocal := FileExists(FCollectionRoot + R.Folder);
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

                try
                  if FLibrary.InsertBook(R, CheckFiles, False) <> 0 then
                    Inc(filesProcessed);
                except
                  on E: Exception do
                    raise EDBError.Create(E.Message);
                end;

                if (filesProcessed mod ProcessedItemThreshold) = 0 then
                begin
                  SetProgress(Round((i + j / BookList.Count) * 100 / unZip.FileCount));
                  SetComment(Format(rstrAddedBooks, [filesProcessed]));
                end;
              except
                on E: EConvertError do
                  Teletype(Format(rstrErrorInpStructure, [CurrentFile, j]), tsError);
                on E: EDBError do
                  Teletype(Format(rstrDBErrorInp, [CurrentFile, j]), tsError);
                on E: Exception do
                  Teletype(E.Message, tsError);
              end;
            end;

            Inc(i);
            if Canceled then
              Break;
          until (not unZip.FindNext(ArchItem));
        end;
      finally
        BookList.Free;
      end;
      Teletype(Format(rstrAddedBooks, [filesProcessed]), tsInfo);
    finally
      unZip.Free;
    end;
    FLibrary.EndBulkOperation(True);
  except
    FLibrary.EndBulkOperation(False);
    raise;
  end;
end;

procedure TImportInpxThread.SetCollectionRoot(const Value: string);
begin
  FCollectionRoot := IncludeTrailingPathDelimiter(Value);
end;

procedure TImportInpxThread.WorkFunction;
begin
  Import(False);
end;

end.
