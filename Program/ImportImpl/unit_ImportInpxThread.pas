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
  * NickR 02.09.2010    INPX больше не распаковывается на диск для обработки. Вся работа происходит в памяти.
  *
  ****************************************************************************** *)

unit unit_ImportInpxThread;

interface

uses
  Windows,
  unit_WorkerThread,
  unit_Globals,
  unit_Interfaces;

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
  strict private
    FCollectionID: Integer;
    FInpxFileName: string;
    FGenresType: TGenresType;

    FFields: array of TFields;
    FUseStoredFolder: Boolean;

    procedure ParseData(const input: string; const OnlineCollection: Boolean; var R: TBookRecord);

  protected
    procedure WorkFunction; override;
    procedure GetFields(const StructureInfo: string);
    procedure Import(CheckFiles: Boolean; BookCollection: IBookCollection);

  public
    property CollectionID: Integer read FCollectionID write FCollectionID;

    property InpxFileName: string read FInpxFileName write FInpxFileName;
    property GenresType: TGenresType read FGenresType write FGenresType;
  end;

implementation

uses
  Classes,
  SysUtils,
  IOUtils,
  unit_MHLArchiveHelpers,
  unit_Settings,
  unit_Consts,
  unit_Helpers,
  unit_Errors,
  unit_SystemDatabase;

resourcestring
  rstrProcessingFile = 'Обрабатываем файл %s';
  rstrAddedBooks = 'Добавлено %u книг';
  rstrErrorInpStructure = 'Ошибка структуры inp. Файл %s, Строка %u ';
  rstrDBErrorInp = 'Ошибка базы данных при импорте книги. Файл %s, Строка %u ';
  rstrUpdatingDB = 'Обновление базы данных. Пожалуйста, подождите ... ';

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

  DEFAULTSTRUCTURE = 'AUTHOR;GENRE;TITLE;SERIES;SERNO;FILE;SIZE;LIBID;DEL;EXT;DATE;LANG;LIBRATE;KEYWORDS';

{ TImportInpxThread }

function ExtractStrings(Content: PChar; const Separator: Char; Strings: TStrings): Integer;
var
  Head, Tail: PChar;
  EOS: Boolean;
  Item: string;
begin
  Result := 0;
  if (Content = nil) or (Content^ = #0) or (Strings = nil) then
    Exit;
  Tail := Content;

  Strings.BeginUpdate;
  try
    repeat
      Head := Tail;
      while not CharInSet(Tail^, [Separator, #0]) do
        Tail := StrNextChar(Tail);

      EOS := Tail^ = #0;
      if {(Head <> Tail) and} (Head^ <> #0) then
      begin
        SetString(Item, Head, Tail - Head);
        Strings.Add(Item);

        Inc(Result);
      end;
      Tail := StrNextChar(Tail);
    until EOS;
  finally
    Strings.EndUpdate;
  end;
end;

procedure TImportInpxThread.ParseData(const input: string; const OnlineCollection: Boolean; var R: TBookRecord);
var
  p, i: Integer;
  slParams: TStringList;
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
    ExtractStrings(PChar(input), INPX_FIELD_DELIMITER, slParams);

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
              R.LibID := slParams[i] // внутр. номер
            else
              R.LibID := '';
          end;

        flDeleted:
          begin
            if (slParams[i] = '1') then // удалена
              Include(R.BookProps, bpIsDeleted)
            else
              Exclude(R.BookProps, bpIsDeleted);
          end;

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

procedure TImportInpxThread.GetFields(const StructureInfo: string);
const
  del = ';';
var
  s: string;
  p, i: Integer;

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
  s := StructureInfo;

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

    //
    // если среди полей есть Folder, то необходимо использовать это поле при создании BookRecord
    //
    FUseStoredFolder := FUseStoredFolder or (FFields[i] = flFolder);

    Inc(i);
  end;
end;

procedure TImportInpxThread.Import(CheckFiles: Boolean; BookCollection: IBookCollection);
var
  FCollectionRoot: string;
  BookList: TStringList;
  i: Integer;
  j: Integer;
  R: TBookRecord;
  filesProcessed: Integer;
  CurrentFile: string;
  IsOnline: Boolean;
  inpStream: TStream;
  StructureInfo: string;
  header: TINPXHeader;
  strVersion: string;
  idxFile: Integer;
  numFiles: Integer;
  archiver: IArchiver;
begin
  filesProcessed := 0;
  i := 0;
  SetProgress(0);

  IsOnline := isOnlineCollection(BookCollection.CollectionCode);
  FCollectionRoot := BookCollection.GetProperty(PROP_ROOTFOLDER);

  SetLength(FFields, 0);
  FUseStoredFolder := False;

  archiver := TArchiver.Create(FInpxFileName, afZip);
  idxFile := archiver.GetIdxByFileName(STRUCTUREINFO_FILENAME);
  if idxFile >= 0 then
    StructureInfo := archiver.UnarchiveToString(idxFile)
  else
    StructureInfo := DEFAULTSTRUCTURE;

  GetFields(StructureInfo);

  //
  // TODO - добавить чтение и установку версии
  //
  BookCollection.StartBatchUpdate;
  try
    numFiles := archiver.GetNumFiles;
    idxFile := archiver.GetIdxByExt('.inp');
    if idxFile >= 0 then
    begin
      repeat
        CurrentFile := archiver.GetFileName(idxFile);

        if not IsOnline and (CurrentFile = 'extra.inp') then
          Continue;

        Teletype(Format(rstrProcessingFile, [CurrentFile]), tsInfo);

        BookList := TStringList.Create;
        try
          inpStream := archiver.UnarchiveToStream(idxFile);
          try
            inpStream.Seek(0, soBeginning);
            BookList.LoadFromStream(inpStream, TEncoding.UTF8);
          finally
            FreeAndNil(inpStream);
          end;

          for j := 0 to BookList.Count - 1 do
          begin
            try
              ParseData(BookList[j], IsOnline, R);
              if IsOnline then
              begin
                //
                // TODO: здесь некоторая фигня. Что будет, если этот INPX описывает не-FB2 коллекцию?
                //

                // И\Иванов Иван\1234 Просто книга.fb2.zip
                R.Folder := R.GenerateLocation + FB2ZIP_EXTENSION;
                // Сохраним отметку о существовании файла
                if FileExists(TPath.Combine(FCollectionRoot, R.Folder)) then
                  Include(R.BookProps, bpIsLocal)
                else
                  Exclude(R.BookProps, bpIsLocal);
              end
              else
              begin
                if not FUseStoredFolder then
                begin
                  // 98058-98693.inp -> 98058-98693.zip
                  R.Folder := ChangeFileExt(CurrentFile, ZIP_EXTENSION);
                  //
                  R.InsideNo := j;
                end
              end;

              try
                if BookCollection.InsertBook(R, CheckFiles, False) <> 0 then
                  Inc(filesProcessed);
              except
                on E: Exception do
                  raise EDBError.Create(E.Message);
              end;

              if (filesProcessed mod ProcessedItemThreshold) = 0 then
              begin
                SetProgress(Round((i + j / BookList.Count) * 100 / numFiles));
                SetComment(Format(rstrAddedBooks, [filesProcessed]));

                if Canceled then
                  Break;
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
        finally
          FreeAndNil(BookList);
        end;

        Inc(i);
        if Canceled then
          Break;

        idxFile := archiver.GetIdxByExt('.inp', idxFile + 1);
      until (idxFile < 0);
    end;

    Teletype(Format(rstrAddedBooks, [filesProcessed]), tsInfo);

    FProgressEngine.BeginOperation(-1, rstrUpdatingDB, '');

    //
    // Прочитать и установить свойства коллекции
    //
    idxFile := archiver.GetIdxByFileName(COLLECTIONINFO_FILENAME);
    if idxFile >= 0 then
    begin
      header.ParseString(archiver.UnarchiveToString(idxFile));
      BookCollection.SetProperty(PROP_NOTES, header.Notes);
      BookCollection.SetProperty(PROP_URL, header.URL);
      BookCollection.SetProperty(PROP_CONNECTIONSCRIPT, header.Script);
    end;

    idxFile := archiver.GetIdxByFileName(VERINFO_FILENAME);
    if idxFile >= 0 then
    begin
      strVersion := archiver.UnarchiveToString(idxFile);
      strVersion := Trim(strVersion);
      BookCollection.SetProperty(PROP_DATAVERSION, StrToIntDef(strVersion, UNVERSIONED_COLLECTION));
    end;

    BookCollection.AfterBatchUpdate;
  finally
    BookCollection.FinishBatchUpdate;
  end;
end;

procedure TImportInpxThread.WorkFunction;
var
  BookCollection: IBookCollection;
begin
  BookCollection := GetSystemData.GetCollection(FCollectionID);
  BookCollection.BeginBulkOperation;
  try
    Import(False, BookCollection);
    BookCollection.EndBulkOperation(True);
  except
    on E: Exception do
    begin
      Teletype(E.Message, tsError);
      BookCollection.EndBulkOperation(False);
    end;
  end;
end;

end.
