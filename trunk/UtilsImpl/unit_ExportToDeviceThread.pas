{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit unit_ExportToDeviceThread;

interface

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_globals,
  Dialogs,
  ABSMain,
  IdHTTP,
  ZipForge;

type

  TExportToDeviceThread = class(TWorker)
  private
    FZipper: TZipForge;

    FFileOprecord: record
      SArch, FileName, Folder: String;
      SNo: integer;
    end;

    FFileOpMode: (fmFb2Zip, fmFb2);
    FBookIdList: TBookIdList;
    FTable: TAbsTable;
    FCollectionRoot: string;
    FExportMode: TExportMode;
    FIsTmp: boolean;
    FProcessedFiles: string;
    procedure ShowZipErrorMessage(Sender: TObject; ErrCode: Integer; Message: string);

    function fb2Lrf(InpFile,OutFile:string):boolean;

    procedure SetTable(ATable: TAbsTable);
  protected
    procedure WorkFunction; override;
    function PrepareFile(ID: integer):boolean;
    function SendFileToDevice:boolean;

  public
    property BookIdList: TBookIdList write FBookIdList;
    property Table: TAbsTable write SetTable;
    property ProcessedFiles:string read FProcessedFiles;
    property ExportMode :TExportMode read FExportMode write FExportMode;
  end;

implementation

uses
  Windows,
  dm_main,
  dm_user,
  unit_database,
  unit_Consts,
  unit_Settings,
  frm_main,
  StrUtils,
  ShellAPI;

{ TExportToDeviceThread }

procedure TExportToDeviceThread.ShowZipErrorMessage(Sender: TObject; ErrCode: Integer; Message: string);
begin
  if ErrCode <> 0 then
    Teletype(Format('Ошибка распаковки архива %s, Код: %d', [FZipper.FileName,0]), tsError);
end;

//
// Определяем имя файла, если нужно - предварительно распаковываем
// формируем названия папок и файла
//

function TExportToDeviceThread.PrepareFile(ID: integer):boolean;
var
  z: integer;
  CR: string;
  FS: TMemoryStream;
  p1,p2: integer;
  FullName: String;
begin
  FIsTmp := False;
  FTable.Locate('ID', ID, []);
  Result := False;
  CR := GetFullBookPath(FTable, FCollectionRoot);

  with FFileOpRecord do
  begin
    //
    // Сформируем имя файла в соответствии с заданным темплейтом
    //
    FileName := Settings.FileNameTemplate;
    FullName := Trim(FTable.FieldByName('FullName').AsString);


    StrReplace('%fl', copy(FullName,1,1), Folder);

    StrReplace('%f', FullName , FileName);

    StrReplace('%t', Trim(FTable.FieldByName('Title').AsString), FileName);

    StrReplace('%id', Trim(FTable.FieldByName('LibID').AsString), FileName);

    StrReplace('%g', Trim(DMMain.GetBookGenres(FTable.FieldByName('ID').AsInteger,True)), FileName);

    if FTable.FieldByName('Series').AsString <> NO_SERIES_TITLE then
      StrReplace('%s', Trim(FTable.FieldByName('Series').AsString), FileName)
    else
      StrReplace('%s','',FileName);

    p1 := PosChr('[',FileName);
    p2 := PosChr(']',FileName);
    if Settings.RemoveSquarebrackets and (p1 <> 0) and (p2 <> 0)  then
      Delete(FileName,p1,p2);

    z := FTable.FieldbyName('SeqNumber').AsInteger;
    if z > 0 then
      StrReplace('%n',Format('%.2d - ',[FTable.FieldByName('SeqNumber').AsInteger]), FileName)
    else
      StrReplace('%n', '', FileName);

    if ExtractFileExt(CR) <> ZIP_EXTENSION then
      FFileOpMode := fmFb2;

    //
    // Сформируем имя каталога в соответствии с заданным темплейтом
    //
    Folder := Settings.FolderTemplate;
    StrReplace('%fl', copy(FullName,1,1), Folder);

    StrReplace('%f', FullName , Folder);

    StrReplace('%t', trim(FTable.FieldByName('Title').AsString), Folder);

    StrReplace('%g', Trim(DMMain.GetBookGenres(FTable.FieldByName('ID').AsInteger,True)), Folder);

    if FTable.FieldByName('Series').AsString <> NO_SERIES_TITLE then
      StrReplace('%s', Trim(FTable.FieldByName('Series').AsString), Folder)
    else
      StrReplace('%s','',Folder);

    case FFileOpMode of
      fmFB2Zip: SArch := CR;
      fmFB2: SArch := CR + FTable['FileName'] + FTable['Ext'];
    end;
    SNo := FTable['InsideNo'];

    Folder := IncludeTrailingPathDelimiter(trim(CheckSymbols(Folder)));
    FileName := Trim(CheckSymbols(FileName));
    if Settings.TransliterateFileName then
    begin
      Folder := Transliterate(Folder);
      FileName := Transliterate(FileName);
    end;
    FileName := FileName + DMMain.tblBooks['Ext'];
  end;

  //
  // Если файл в архиве - распаковываем в $tmp
  //
  if FFileOpMode = fmFb2Zip then
  begin
    if not FileExists(CR) then
    begin
      ShowMessage('Архив ' + CR + ' не найден!', MB_ICONERROR or MB_OK);
      Exit;
    end;

    fs := TMemoryStream.Create;
    try
      FZipper.FileName := FFileOpRecord.SArch;
      FZipper.OpenArchive;
      FZipper.ExtractToStream(GetFileNameZip(FZipper,FFileOpRecord.SNo),FS);
      FFileOprecord.SArch := Settings.TempPath + Format('%.6d.fb2',[Random(999999)]);
      fs.SaveToFile(FFileopRecord.SArch);
      FIsTmp := True;
    finally
      fs.Free;
    end;
  end;
  
  Result := True;
end;

function TExportToDeviceThread.SendFileToDevice:boolean;
var
  DestFileName: string;
begin
  if not FileExists(FFileOpRecord.SArch) then
  begin
    ShowMessage(Format('File "%s" not found', [FFileOpRecord.SArch]), MB_ICONERROR or MB_OK);
    Result := False;
    Exit;
  end;

  CreateFolders(Settings.DeviceDir, FFileOpRecord.Folder);
  DestFileName := Settings.DevicePath + FFileOpRecord.Folder + FFileOpRecord.FileName;

  Result := True;

  case FExportMode of
    emFB2:unit_globals.CopyFile(FFileOpRecord.SArch, DestFileName);
    emFb2Zip:ZipFile(FFileOpRecord.SArch, DestFileName + ZIP_EXTENSION);
    emTxt:unit_globals.ConvertToTxt(FFileOpRecord.SArch, DestFileName);
    emLrf:Result := fb2Lrf(FFileOpRecord.SArch,DestFileName);
  end;

//  if FIsTmp then
//    SysUtils.DeleteFile(FFileOpRecord.SArch);
end;

function TExportToDeviceThread.fb2Lrf(InpFile,OutFile:string):boolean;
var
  params: string;
  Res: integer;
  msg: string;
begin
  params := Format('-i "%s" -o "%s"',[InpFile,ChangeFileExt(OutFile, '.lrf')]);
  Result := ExecAndWait(Settings.AppPath + 'fb2lrf\fb2lrf_c.exe',params, SW_HIDE)
end;


procedure TExportToDeviceThread.SetTable(ATable: TAbsTable);
begin
  if Assigned(ATable) then
    FTable := ATable;
end;

procedure TExportToDeviceThread.WorkFunction;
var
  i: Integer;
  totalBooks: Integer;
  Res: boolean;
begin
  FCollectionRoot := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  FZipper := TZipForge.Create(nil);
  try
//    FZipper.OnMessage := ShowZipErrorMessage;

    totalBooks := High(FBookIdList) + 1;

    for i := 0 to totalBooks - 1 do
    begin
      Res := PrepareFile(FBookIdList[i].ID);
      if Res then
      begin
         if i = 0 then
           FProcessedFiles := FFileOpRecord.SArch;

        Res := SendFileToDevice;
      end;
      if not Res and (i < totalBooks - 1) then
        Canceled := (ShowMessage('Обрабатывать оставшиеся файлы ?', MB_YESNO) = IDNO);

      SetComment(Format('Записано файлов: %u из %u', [i+1, totalBooks]));
      SetProgress(i * 100 div totalBooks);

      if Canceled then
      begin
        SetComment('Завершение операции ...');
        Break;
      end;
    end;

    SetComment(Format('Записано файлов: %u из %u', [i+1, totalBooks]));
  finally
    FreeAndNil(FZipper);
  end;
end;

end.

