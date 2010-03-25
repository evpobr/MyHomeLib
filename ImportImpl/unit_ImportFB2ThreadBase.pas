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
  * NickR 02.03.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_ImportFB2ThreadBase;

interface

uses
  Windows,
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_globals,
  FictionBook_21,
  unit_database,
  files_list,
  unit_Templater;

type
  TImportFB2ThreadBase = class(TWorker)
  private
    FFullNameSearch: Boolean;

  protected
    FDBFileName: string;
    FLibrary: TMHLLibrary;
    FTemplater: TTemplater;
    FFiles: TStringList;
    FRootPath: string;
    FFilesList: TFilesList;

    FTargetExt: string;
    FZipFolder: Boolean;

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
    property TargetExt: string write FTargetExt;
    property ZipFolder: Boolean write FZipFolder;
    property FullNameSearch: Boolean write FFullNameSearch default False;
  end;

implementation

uses
  dm_user,
  unit_Settings,
  unit_Consts,
  Dialogs;

{ TImportFB2Thread }

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

procedure TImportFB2ThreadBase.GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);
var
  i: Integer;
begin
  with book.Description.Titleinfo do
  begin
    for i := 0 to Author.Count - 1 do
      R.AddAuthor(Author[i].Lastname.Text, Author[i].Firstname.Text, Author[i].MiddleName.Text);

    if Booktitle.IsTextElement then
      R.Title := Booktitle.Text;

    for i := 0 to Genre.Count - 1 do
      R.AddGenreFB2('', Genre[i], '');

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
        R.Annotation := R.Annotation + #10#13 + Annotation.P.Items[i].OnlyText;

    R.RootGenre.Alias := Trim(FLibrary.GetTopGenreAlias(R.Genres[0].GenreFb2Code));
  end;
end;

procedure TImportFB2ThreadBase.ShowCurrentDir(Sender: TObject; const Dir: string);
begin
  SetComment(Format('Сканируем %s', [Dir]));
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
    Dialogs.ShowMessage('Проверьте правильность шаблона');
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
    Dialogs.ShowMessage('Проверьте правильность шаблона');
    Exit;
  end;

  Folder := CheckSymbols(Trim(Folder));
  if Folder <> '' then
    Result := IncludeTrailingPathDelimiter(Folder)
  else
    Result := '';
end;

procedure TImportFB2ThreadBase.ScanFolder;
begin
  SetProgress(0);
  SetComment('Сканируем...');
  Teletype('Сканирование папок...');

  FCheckExistsFiles := Settings.CheckExistsFiles;

  FFilesList := TFilesList.Create(nil);
  FFilesList.OnFile := AddFile2List;
  try
    if not Settings.EnableSort then
      FFilesList.TargetPath := DMUser.ActiveCollection.RootPath
    else
      FFilesList.TargetPath := Settings.ImportPath;

    FFilesList.OnDirectory := ShowCurrentDir;
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
