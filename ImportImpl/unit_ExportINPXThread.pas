{ ****************************************************************************** }
{ }
{ MyHomeLib }
{ }
{ Version 0.9 }
{ 20.08.2008 }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com }
{ }
{ @author Nick Rymanov nrymanov@gmail.com }
{ }
{ ****************************************************************************** }

unit unit_ExportINPXThread;

interface

uses
  Windows,
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_Globals,
  unit_Settings;

type
  TExport2INPXThread = class(TWorker)
  private
    FINPXFileName: string;

    FGenresType: TGenresType;

    function INPRecordCreate(const R: TBookRecord): string;
    procedure INPXPack(const INPXFileName: string; const FileList: TStrings);

  protected
    procedure WorkFunction; override;

  public
    property INPXFileName: string read FINPXFileName write FINPXFileName;
  end;

implementation

uses
  Forms,
  StrUtils,
  dm_collection,
  dm_user,
  ZipForge,
  unit_Consts,
  unit_MHL_strings;

const
  BOOKS_INFO_FILE = 'books.inp'; { TODO -oNickR -cRefactoring : добавить в систебные файлы? }

  { TImportXMLThread }

  (*

    Вообще говоря, использовать основной экземпляр датамодуля в потоке не очень корректно.
    Но!, 1) мы не используем датаэвэ-контролы, 2) все использование происходит при поднятой модальной форме.
    Возможно, стоит создавать новый экземпляр, но пока обойдемся и так.

    *)

procedure TExport2INPXThread.WorkFunction;
var
  slFileList: TStringList;
  slHelper: TStringList;
  cINPRecord: string;
  nCollectionVersion: Integer;
  cVersion: string;

  totalBooks: Integer;
  processedBooks: Integer;
  R: TBookRecord;

  strTempPath: string;
begin
  SetComment('Экспортируем коллекцию.');

  totalBooks := DMCollection.tblBooks.RecordCount;
  processedBooks := 0;

  strTempPath := Settings.TempPath;

  if isFB2Collection(DMUser.ActiveCollection.CollectionType) then
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

      slHelper.SaveToFile(strTempPath + BOOKS_INFO_FILE, TEncoding.UTF8);
      slFileList.Add(strTempPath + BOOKS_INFO_FILE);

      //
      // Создаём файл version.info
      //
      nCollectionVersion := DMUser.ActiveCollection.Version;
      cVersion := IntToStr(nCollectionVersion); // Получаем дату в формате '20091231'
      if Length(cVersion) <> 8 then
      begin                            // Если длина строки не равна 8, то получаем текущую дату
        cVersion := DateToStr(Date()); // Получаем дату в формате '2009-12-31'
        Delete(cVersion, 5, 1);        // Получаем дату в формате '200912-31'
        Delete(cVersion, 7, 1);        // Получаем дату в формате '20091231'
      end;

      slHelper.Clear;
      slHelper.Add(cVersion);
      slHelper.SaveToFile(strTempPath + VERINFO_FILENAME);
      slFileList.Add(strTempPath + VERINFO_FILENAME);

      //
      // Записываем файл structure.info
      //
      slHelper.Clear;
      slHelper.Add('AUTHOR;GENRE;TITLE;SERIES;SERNO;FILE;SIZE;LIBID;DEL;EXT;DATE;INSNO;FOLDER;LANG;KEYWORDS;');
      slHelper.SaveToFile(strTempPath + STRUCTUREINFO_FILENAME);
      slFileList.Add(strTempPath + STRUCTUREINFO_FILENAME);
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
  CollectionName: string;
  CollectionDBFileName: string;
  CollectionType: Integer;
  CollectionNotes: String;

  cComment: String;

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
    ZIP.BaseDir := Settings.TempPath;
    ZIP.OpenArchive;

    //
    // Перемещаем файлы в архив согласно списку FileList
    //
    for nIndex := 0 to FileList.Count - 1 do
      ZIP.MoveFiles(FileList[nIndex]);

    //
    // Устанавливаем комментарий для INPX-файла
    //
    CollectionName := DMUser.ActiveCollection.Name;
    CollectionDBFileName := DMUser.ActiveCollection.DBFileName;
    CollectionType := DMUser.ActiveCollection.CollectionType;

    if DMUser.ActiveCollection.Notes <> '' then
      CollectionNotes := DMUser.ActiveCollection.Notes
    else
      CollectionNotes := 'Версия от ' + DateToStr(Now);

    cComment := CollectionName + #13#10 +              // '%s'#13#10
      ExtractFileName(CollectionDBFileName) + #13#10 + // '%s'#13#10
      IntToStr(CollectionType) + #13#10 +              // '%u'#13#10
      CollectionNotes;                                 // '%s'

    ZIP.Comment := cComment;
    ZIP.CloseArchive;
  finally
    ZIP.Free;
  end;
end;

function TExport2INPXThread.INPRecordCreate(const R: TBookRecord): string;
const
  FieldDelimiterChar = Chr(4);
  ItemDelimiterChar = ':';
  SubItemDelimiterChar = ',';
var
  author: TAuthorRecord;
  strAuthors: string;
  genre: TGenreRecord;
  strGenres: string;
  strFileExt: string;
begin
  //
  // Список авторов
  //
  for author in R.Authors do
  begin
    strAuthors := strAuthors +
      author.LastName + SubItemDelimiterChar +
      author.FirstName + SubItemDelimiterChar +
      author.MiddleName +
      ItemDelimiterChar;
  end;
  if strAuthors = '' then
    strAuthors := ItemDelimiterChar;

  //
  // Список жанров
  //
  for genre in R.Genres do
  begin
    strGenres := strGenres +
      IfThen(FGenresType = gtFb2, genre.GenreFb2Code, genre.GenreCode) + ItemDelimiterChar;
  end;
  if strGenres = '' then
    strGenres := ItemDelimiterChar;

  strFileExt := R.FileExt;
  Delete(strFileExt, 1, 1);

  Result :=
    strAuthors                           + FieldDelimiterChar + // 0 - authors list
    strGenres                            + FieldDelimiterChar + // 1 - genres list
    Trim(R.Title)                        + FieldDelimiterChar + // 2 - book title
    Trim(R.Series)                       + FieldDelimiterChar + // 3 - book serie title
    IntToStr(R.SeqNumber)                + FieldDelimiterChar + // 4 - book serie no
    CheckSymbols(Trim(R.FileName))       + FieldDelimiterChar + // 5 - book filename
    IntToStr(R.Size)                     + FieldDelimiterChar + // 6 - unpacked book filesize
    IntToStr(R.LibID)                    + FieldDelimiterChar + // 7 - book LibID
    IfThen(R.Deleted, '1', '0')          + FieldDelimiterChar + // 8 - book deleted flag
    strFileExt                           + FieldDelimiterChar + // 9 - book fileext
    FormatDateTime('yyyy-mm-dd', R.Date) + FieldDelimiterChar + // 10 - book data added
    IntToStr(R.InsideNo)                 + FieldDelimiterChar + // 11 - File InsideNo in archive
    R.Folder                             + FieldDelimiterChar + // 12 - Base folder/base archive name
    R.Lang                               + FieldDelimiterChar + // 12 - language
    R.KeyWords                           + FieldDelimiterChar;  // 13 - keywords
end;

end.
