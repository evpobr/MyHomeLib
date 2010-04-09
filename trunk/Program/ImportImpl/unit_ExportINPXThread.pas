(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             22.02.2010
  * Description
  * Author(s)           Nick Rymanov    nrymanov@gmail.com
  *                     Aleksey Penkov  alex.penkov@gmail.com
  *
  * History
  * NickR 08.04.2010    Информация из глобальных переменных зачитывается в контексте основного потока.
  *
  ****************************************************************************** *)

unit unit_ExportINPXThread;

interface

uses
  Classes,
  unit_WorkerThread,
  unit_Globals;

type
  TExport2INPXThread = class(TWorker)
  private
    FTempPath: string;

    FCollectionName: string;
    FCollectionDBFileName: string;
    FCollectionType: COLLECTION_TYPE;
    FCollectionVersion: Integer;
    FCollectionNotes: string;

    FINPXFileName: string;

    FGenresType: TGenresType;

    function INPRecordCreate(const R: TBookRecord): string;
    procedure INPXPack(const INPXFileName: string; const FileList: TStrings);

  protected
    procedure WorkFunction; override;

  public
    constructor Create;

    property INPXFileName: string read FINPXFileName write FINPXFileName;
  end;

implementation

uses
  Windows,
  Forms,
  SysUtils,
  StrUtils,
  dm_collection,
  dm_user,
  ZipForge,
  unit_Consts,
  unit_Settings,
  unit_MHL_strings;

const
  BOOKS_INFO_FILE = 'books.inp'; { TODO -oNickR -cRefactoring : добавить в систебные файлы? }

  { TImportXMLThread }

(*

  Вообще говоря, использовать основной экземпляр датамодуля в потоке не очень корректно.
  Но!, 1) мы не используем датаэвэ-контролы, 2) все использование происходит при поднятой модальной форме.
  Возможно, стоит создавать новый экземпляр, но пока обойдемся и так.

*)

constructor TExport2INPXThread.Create;
begin
  inherited Create;

  FTempPath := Settings.TempPath;

  FCollectionType := DMUser.ActiveCollection.CollectionType;
  FCollectionVersion := DMUser.ActiveCollection.Version;
  FCollectionName := DMUser.ActiveCollection.Name;
  FCollectionDBFileName := DMUser.ActiveCollection.DBFileName;

  FCollectionNotes := DMUser.ActiveCollection.Notes;
  if FCollectionNotes = '' then
    FCollectionNotes := 'Версия от ' + DateToStr(Now);
end;

procedure TExport2INPXThread.WorkFunction;
var
  slFileList: TStringList;
  slHelper: TStringList;
  cINPRecord: string;

  cVersion: string;

  totalBooks: Integer;
  processedBooks: Integer;
  R: TBookRecord;
begin
  SetComment('Экспортируем коллекцию.');

  totalBooks := DMCollection.tblBooks.RecordCount;
  processedBooks := 0;

  if isFB2Collection(FCollectionType) then
    FGenresType := gtFb2
  else
    FGenresType := gtAny;

  slFileList := TStringList.Create;
  try
    slHelper := TStringList.Create;
    try
      DMCollection.tblBooks.First;
      while not DMCollection.tblBooks.Eof do
      begin
        if Canceled then
          Exit;

        //
        // можно оставить
        //
        DMCollection.GetCurrentBook(R);

        cINPRecord := INPRecordCreate(R);
        Assert(cINPRecord <> '');

        slHelper.Add(cINPRecord);

        DMCollection.tblBooks.Next;

        Inc(processedBooks);
        if (processedBooks mod ProcessedItemThreshold) = 0 then
          SetComment(Format(rstrBookProcessedMsg2, [processedBooks, totalBooks]));
        SetProgress(processedBooks * 100 div totalBooks);
      end;

      SetComment('Сохраняем документ. Подождите, пожалуйста.');

      slHelper.SaveToFile(FTempPath + BOOKS_INFO_FILE, TEncoding.UTF8);
      slFileList.Add(FTempPath + BOOKS_INFO_FILE);

      //
      // Создаём файл version.info
      //
      cVersion := IntToStr(FCollectionVersion); // Получаем дату в формате '20091231'
      if Length(cVersion) <> 8 then
      begin                            // Если длина строки не равна 8, то получаем текущую дату
        cVersion := DateToStr(Date()); // Получаем дату в формате '2009-12-31'
        Delete(cVersion, 5, 1);        // Получаем дату в формате '200912-31'
        Delete(cVersion, 7, 1);        // Получаем дату в формате '20091231'
      end;

      slHelper.Clear;
      slHelper.Add(cVersion);
      slHelper.SaveToFile(FTempPath + VERINFO_FILENAME);
      slFileList.Add(FTempPath + VERINFO_FILENAME);

      //
      // Записываем файл structure.info
      //
      slHelper.Clear;
      slHelper.Add('AUTHOR;GENRE;TITLE;SERIES;SERNO;FILE;SIZE;LIBID;DEL;EXT;DATE;INSNO;FOLDER;LANG;KEYWORDS;');
      slHelper.SaveToFile(FTempPath + STRUCTUREINFO_FILENAME);
      slFileList.Add(FTempPath + STRUCTUREINFO_FILENAME);
    finally
      FreeAndNil(slHelper);
    end;

    //
    // Упаковываем файлы в zip-архив и устанавливаем комментарий
    //
    INPXPack(INPXFileName, slFileList);
  finally
    slFileList.Free;
  end;
end;

procedure TExport2INPXThread.INPXPack(const INPXFileName: string; const FileList: TStrings);
var
  ZIP: TZipForge;
  nIndex: Integer;
begin
  //
  // Удаляем INPX-файл, если он уже существует
  //
  if FileExists(INPXFileName) then
    SysUtils.DeleteFile(INPXFileName);
  //
  // Создаем экземпляр TZipForge, инициализируем и открываем его
  //
  ZIP := TZipForge.Create(Application.MainForm);
  try
    ZIP.FileName := INPXFileName;
    ZIP.BaseDir := FTempPath;
    ZIP.OpenArchive;

    //
    // Перемещаем файлы в архив согласно списку FileList
    //
    for nIndex := 0 to FileList.Count - 1 do
      ZIP.MoveFiles(FileList[nIndex]);

    //
    // Устанавливаем комментарий для INPX-файла
    //
    ZIP.Comment :=
      FCollectionName + CRLF +
      ExtractFileName(FCollectionDBFileName) + CRLF +
      IntToStr(FCollectionType) + CRLF +
      FCollectionNotes;
    ZIP.CloseArchive;
  finally
    ZIP.Free;
  end;
end;

function TExport2INPXThread.INPRecordCreate(const R: TBookRecord): string;
var
  author: TAuthorData;
  strAuthors: string;
  genre: TGenreData;
  strGenres: string;
  strFileExt: string;
begin
  //
  // Список авторов
  //
  for author in R.Authors do
  begin
    strAuthors := strAuthors +
      author.LastName + INPX_SUBITEM_DELIMITER +
      author.FirstName + INPX_SUBITEM_DELIMITER +
      author.MiddleName +
      INPX_ITEM_DELIMITER;
  end;
  if strAuthors = '' then
    strAuthors := INPX_ITEM_DELIMITER;

  //
  // Список жанров
  //
  for genre in R.Genres do
  begin
    strGenres := strGenres +
      IfThen(FGenresType = gtFb2, genre.FB2GenreCode, genre.GenreCode) + INPX_ITEM_DELIMITER;
  end;
  if strGenres = '' then
    strGenres := INPX_ITEM_DELIMITER;

  strFileExt := R.FileExt;
  Delete(strFileExt, 1, 1);

  Result :=
    strAuthors                           + INPX_FIELD_DELIMITER + // 0 - authors list
    strGenres                            + INPX_FIELD_DELIMITER + // 1 - genres list
    Trim(R.Title)                        + INPX_FIELD_DELIMITER + // 2 - book title
    Trim(R.Serie)                        + INPX_FIELD_DELIMITER + // 3 - book serie title
    IntToStr(R.SeqNumber)                + INPX_FIELD_DELIMITER + // 4 - book serie no
    CheckSymbols(Trim(R.FileName))       + INPX_FIELD_DELIMITER + // 5 - book filename
    IntToStr(R.Size)                     + INPX_FIELD_DELIMITER + // 6 - unpacked book filesize
    IntToStr(R.LibID)                    + INPX_FIELD_DELIMITER + // 7 - book LibID
    IfThen(R.Deleted, '1', '0')          + INPX_FIELD_DELIMITER + // 8 - book deleted flag
    strFileExt                           + INPX_FIELD_DELIMITER + // 9 - book fileext
    FormatDateTime('yyyy-mm-dd', R.Date) + INPX_FIELD_DELIMITER + // 10 - book data added
    IntToStr(R.InsideNo)                 + INPX_FIELD_DELIMITER + // 11 - File InsideNo in archive
    R.Folder                             + INPX_FIELD_DELIMITER + // 12 - Base folder/base archive name
    R.Lang                               + INPX_FIELD_DELIMITER + // 12 - language
    R.KeyWords                           + INPX_FIELD_DELIMITER;  // 13 - keywords
end;

end.
