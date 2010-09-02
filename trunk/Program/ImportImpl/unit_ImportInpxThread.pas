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
    FGenresType: TGenresType;

    FFields: array of TFields;
    FUseStoredFolder: Boolean;

    procedure SetCollectionRoot(const Value: string);
    procedure ParseData(const input: string; const OnlineCollection: Boolean; var R: TBookRecord);

  protected
    procedure WorkFunction; override;
    procedure GetFields(const StructureInfo: string);
    procedure Import(CheckFiles: Boolean);

  public
    property DBFileName: string read FDBFileName write FDBFileName;
    property CollectionRoot: string read FCollectionRoot write SetCollectionRoot;
    property CollectionType: COLLECTION_TYPE read FCollectionType write FCollectionType;
    property InpxFileName: string read FInpxFileName write FInpxFileName;
    property GenresType: TGenresType read FGenresType write FGenresType;
  end;

implementation

uses
  Classes,
  SysUtils,
  unit_Database,
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

procedure TImportInpxThread.Import(CheckFiles: Boolean);
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
  IsOnline: Boolean;
  FileStream: TMemoryStream;
  StructureInfo: string;
begin
  filesProcessed := 0;
  i := 0;
  SetProgress(0);

  IsOnline := isOnlineCollection(CollectionType);
  SetLength(FFields, 0);
  FUseStoredFolder := False;

  FLibrary := GetBookCollection(DBFileName);
  FLibrary.BeginBulkOperation;
  try
    unZip := TZipForge.Create(nil);
    try
      unZip.BaseDir := Settings.TempPath;
      unZip.FileName := FInpxFileName;
      unZip.OpenArchive(fmOpenRead);

      if unZip.FindFirst(STRUCTUREINFO_FILENAME, ArchItem, faAnyFile - faDirectory) then
        unZip.ExtractToString(ArchItem.FileName, StructureInfo)
      else
        StructureInfo := DEFAULTSTRUCTURE;

      GetFields(StructureInfo);

      if (unZip.FindFirst('*.inp', ArchItem, faAnyFile - faDirectory)) then
      begin
        repeat
          CurrentFile := ArchItem.FileName;

          if not IsOnline and (CurrentFile = 'extra.inp') then
            Continue;

          Teletype(Format(rstrProcessingFile, [CurrentFile]), tsInfo);

          BookList := TStringList.Create;
          try
            FileStream := TMemoryStream.Create;
            try
              unZip.ExtractToStream(CurrentFile, FileStream);
              FileStream.Seek(0, soBeginning);
              BookList.LoadFromStream(FileStream, TEncoding.UTF8);
            finally
              FreeAndNil(FileStream);
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
                  R.IsLocal := FileExists(FCollectionRoot + R.Folder);
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
          finally
            FreeAndNil(BookList);
          end;

          Inc(i);
          if Canceled then
            Break;
        until (not unZip.FindNext(ArchItem));
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
  try
    Import(False);
  except
    on E: Exception do
      Teletype(E.Message, tsError);
  end;
end;

end.
