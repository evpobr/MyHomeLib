(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov    nrymanov@gmail.com
  *                     Aleksey Penkov  alex.penkov@gmail.com
  * Created             22.02.2010
  * Description
  *
  * $Id$
  *
  * History
  * NickR 02.03.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_ImportFB2ThreadBase;

interface

uses
  Windows,
  Classes,
  SysUtils,
  fictionbook_21,
  files_list,
  unit_Globals,
  unit_WorkerThread,
  unit_Database,
  unit_Templater;

type
  TImportFB2ThreadBase = class(TWorker)
  protected
    FDBFileName: string;
    FLibrary: TMHLLibrary;
    FTemplater: TTemplater;
    FFiles: TStringList;
    FRootPath: string;
    FFilesList: TFilesList;

    //
    // Эти поля должны быть установлены конструктором производного класса
    //
    FTargetExt: string;
    FZipFolder: Boolean;
    FFullNameSearch: Boolean;

    FCheckExistsFiles: Boolean;

    procedure ScanFolder;

    procedure ShowCurrentDir(Sender: TObject; const Dir: string);
    procedure AddFile2List(Sender: TObject; const F: TSearchRec);

    function GetNewFolder(Folder: string; R: TBookRecord): string;
    function GetNewFileName(FileName: string; R: TBookRecord): string;

  protected
    procedure WorkFunction; override;
    procedure ProcessFileList; virtual; abstract;
    procedure GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);
    procedure SortFiles(var R: TBookRecord); virtual;

  public
    property DBFileName: string read FDBFileName write FDBFileName;
  end;

implementation

{
Settings.CheckExistsFiles
Settings.EnableSort
Settings.FB2FolderTemplate
Settings.FB2FileTemplate
Settings.FBDFolderTemplate
Settings.FBDFileTemplate
Settings.ImportPath
}

uses
  dm_user,
  unit_Settings,
  unit_Consts,
  Dialogs;

resourcestring
  rstrCheckTemplateValidity = 'Проверьте правильность шаблона';
  rstrScanningOne = 'Сканируем %s';
  rstrScanningAll = 'Сканируем...';
  rstrScanningFolders = 'Сканирование папок...';

{ TImportFB2Thread }

procedure TImportFB2ThreadBase.GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);
var
  i: Integer;
begin
  //
  // TODO : создать в unit_FB2Utils ф-ию для получения инф-ии о книге из файла и заменить ее этот метод
  //
  with book.Description.Titleinfo do
  begin
    for i := 0 to Author.Count - 1 do
      TAuthorsHelper.Add(R.Authors, Author[i].Lastname.Text, Author[i].Firstname.Text, Author[i].MiddleName.Text);

    if Booktitle.IsTextElement then
      R.Title := Booktitle.Text;

    for i := 0 to Genre.Count - 1 do
      TGenresHelper.Add(R.Genres, '', '', Genre[i]);

    R.Lang := Lang;
    R.KeyWords := KeyWords.Text;

    if Sequence.Count > 0 then
    begin
      try
        R.Series := Sequence[0].Name;
        R.SeqNumber := Sequence[0].Number;
      except
      end;
    end;

    for i := 0 to Annotation.P.Count - 1 do
      if Annotation.P.Items[i].IsTextElement then
        R.Annotation := R.Annotation + CRLF + Annotation.P.Items[i].OnlyText;

    if R.GenreCount > 0 then
      R.RootGenre.GenreAlias := Trim(FLibrary.GetTopGenreAlias(R.Genres[0].FB2GenreCode));
  end;
end;

procedure TImportFB2ThreadBase.SortFiles(var R: TBookRecord);
var
  NewFilename, NewFolder: string;
begin
  NewFolder := GetNewFolder(Settings.FB2FolderTemplate, R);
  CreateFolders(FRootPath, NewFolder);

  CopyFile(Settings.ImportPath + R.FileName + R.FileExt, FRootPath + NewFolder + R.FileName + R.FileExt);
  R.Folder := NewFolder;

  NewFilename := GetNewFileName(Settings.FB2FileTemplate, R);
  if NewFilename <> '' then
  begin
    RenameFile(FRootPath + NewFolder + R.FileName + R.FileExt, FRootPath + NewFolder + NewFilename + R.FileExt);
    R.FileName := NewFilename;
  end;
end;

function TImportFB2ThreadBase.GetNewFileName(FileName: string; R: TBookRecord): string;
begin
  { DONE -oNickR -cPerformance : необходимо создавать шаблонизатор только один раз при инициализации потока }
  { DONE -oNickR -cBug : нет реакции на невалидный шаблон }
  if FTemplater.SetTemplate(FileName, TpFile) = ErFine then
    FileName := FTemplater.ParseString(R, TpFile)
  else
  begin
    Dialogs.ShowMessage(rstrCheckTemplateValidity);
    Exit;
  end;

  FileName := CheckSymbols(Trim(FileName));
  if FileName <> '' then
    Result := FileName
  else
    Result := '';
end;

function TImportFB2ThreadBase.GetNewFolder(Folder: string; R: TBookRecord): string;
begin
  { DONE -oNickR -cPerformance : необходимо создавать шаблонизатор только один раз при инициализации потока }
  { DONE -oNickR -cBug : нет реакции на невалидный шаблон }
  if FTemplater.SetTemplate(Folder, TpPath) = ErFine then
    Folder := FTemplater.ParseString(R, TpPath)
  else
  begin
    Dialogs.ShowMessage(rstrCheckTemplateValidity);
    Exit;
  end;

  Folder := CheckSymbols(Trim(Folder));
  if Folder <> '' then
    Result := IncludeTrailingPathDelimiter(Folder)
  else
    Result := '';
end;

procedure TImportFB2ThreadBase.ShowCurrentDir(Sender: TObject; const Dir: string);
begin
  SetComment(Format(rstrScanningOne, [Dir]));
end;

procedure TImportFB2ThreadBase.AddFile2List(Sender: TObject; const F: TSearchRec);
var
  FileName: string;
begin
  if ExtractFileExt(F.Name) = FTargetExt then
  begin
    if FCheckExistsFiles then
    begin
      if Settings.EnableSort then
        FileName := FFilesList.LastDir + F.Name
      else
        FileName := ExtractRelativePath(FRootPath, FFilesList.LastDir) + F.Name;
      if not FLibrary.CheckFileInCollection(FileName, FFullNameSearch, FZipFolder) then
        FFiles.Add(FFilesList.LastDir + F.Name);
    end;
  end;

  //
  // сколько найдем файлов неизвестно => зациклим прогресс
  //
  SetProgress(FFiles.Count mod 100);

  if Canceled then
    Abort;
end;

procedure TImportFB2ThreadBase.ScanFolder;
begin
  SetProgress(0);
  SetComment(rstrScanningAll);
  Teletype(rstrScanningFolders);

  FCheckExistsFiles := Settings.CheckExistsFiles;

  FFilesList := TFilesList.Create(nil);
  try
    FFilesList.OnDirectory := ShowCurrentDir;
    FFilesList.OnFile := AddFile2List;

    if Settings.EnableSort then
      FFilesList.TargetPath := Settings.ImportPath
    else
      FFilesList.TargetPath := DMUser.ActiveCollection.RootPath;

    try
      FFilesList.Process;
    except
      on EAbort do
        { nothing } ;
    end;
  finally
    FreeAndNil(FFilesList);
  end;
end;

procedure TImportFB2ThreadBase.WorkFunction;
begin
  FRootPath := DMUser.ActiveCollection.RootPath;

  FLibrary := TMHLLibrary.Create(nil);
  try
    FLibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
    FLibrary.Active := True;

    FFiles := TStringList.Create;
    try
      ScanFolder;

      if Canceled then
        Exit;

      FLibrary.BeginBulkOperation;
      try
        ProcessFileList;
      finally
        FLibrary.EndBulkOperation;
      end;
    finally
      FreeAndNil(FFiles);
    end;
  finally
    FreeAndNil(FLibrary);
  end;
end;

end.
