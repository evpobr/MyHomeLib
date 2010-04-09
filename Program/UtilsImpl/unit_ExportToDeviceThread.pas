(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
  *         Matvienko Sergei matv84@mail.ru
  *
  ****************************************************************************** *)

unit unit_ExportToDeviceThread;

interface

uses
  Classes,
  unit_WorkerThread,
  unit_globals,
  Dialogs,
  ABSMain,
  ZipForge,
  unit_Templater;

type
  TExportToDeviceThread = class(TWorker)
  private type
    TFileOprecord = record
      SArch: string;
      SNo: Integer;
      TargetFolder: string;
      TargetFileName: string;
    end;

  private
    FZipper: TZipForge;

    FFileOprecord: TFileOprecord;

    FFileOpMode: (fmFb2Zip, fmFb2, fmFBD);
    FBookIdList: TBookIdList;
    FTemplater: TTemplater;
    FCollectionRoot: string;
    FExportMode: TExportMode;
    ///FIsTmp: Boolean;
    FProcessedFiles: string;
    FDeviceDir: string;

    // procedure ShowZipErrorMessage(Sender: TObject; ErrCode: integer; Message: string);
    function fb2Lrf(const InpFile: string; const OutFile: string): Boolean;
    function fb2EPUB(const InpFile: string; const OutFile: string): Boolean;
    function fb2PDF(const InpFile: string; const OutFile: string): Boolean;

    procedure SetDeviceDir(const Value: string);

  strict private
    function PrepareFile(BookID: Integer; DatabaseID: Integer): Boolean;
    function SendFileToDevice: Boolean;

  protected
    procedure WorkFunction; override;

  public
    property DeviceDir: string read FDeviceDir write SetDeviceDir;
    property BookIdList: TBookIdList read FBookIdList write FBookIdList;
    property ProcessedFiles: string read FProcessedFiles;
    property ExportMode: TExportMode read FExportMode write FExportMode;
  end;

implementation

uses
  Windows,
  SysUtils,
  IOUtils,
  dm_collection,
  dm_user,
  unit_Consts,
  unit_Settings,
  unit_MHLHelpers,
  unit_WriteFb2Info;

{ TExportToDeviceThread }

//
// Определяем имя файла, если нужно - предварительно распаковываем
// формируем названия папок и файла
//
function TExportToDeviceThread.PrepareFile(BookID: Integer; DatabaseID: Integer): Boolean;
var
  CR: string;
  FS: TMemoryStream;
  R: TBookRecord;
begin
  { DONE -oalex : рефакторинг: разобрать на отдельные модули, разобраться с логикой }
  Result := False;

  //
  // TODO : заменить вызов этих методов на потокобезопасные методы, принимающие BookID и DatabaseID
  //
  DMCollection.GetBookRecord(BookID, DatabaseID, R, False);

  CR := TPath.Combine(FCollectionRoot, R.Folder);

  // Сформируем имя каталога в соответствии с заданным темплейтом
  if FTemplater.SetTemplate(Settings.FolderTemplate, TpPath) = ErFine then
    FFileOprecord.TargetFolder := FTemplater.ParseString(R, TpPath)
  else
  begin
    Dialogs.ShowMessage('Проверьте правильность шаблона');
    Exit;
  end;
  FFileOprecord.TargetFolder := IncludeTrailingPathDelimiter(Trim(CheckSymbols(FFileOprecord.TargetFolder)));

  //
  // Сформируем имя файла в соответствии с заданным темплейтом
  //
  if FTemplater.SetTemplate(Settings.FileNameTemplate, TpFile) = ErFine then
    FFileOprecord.TargetFileName := FTemplater.ParseString(R, TpFile)
  else
  begin
    Dialogs.ShowMessage('Проверьте правильность шаблона');
    Exit;
  end;
  FFileOprecord.TargetFileName := Trim(CheckSymbols(FFileOprecord.TargetFileName));
  FFileOprecord.TargetFileName := FFileOprecord.TargetFileName + R.FileExt;

  //
  //
  //
  if (ExtractFileExt(R.FileName) = ZIP_EXTENSION) and (R.FileExt <> ZIP_EXTENSION) then
    FFileOpMode := fmFBD
  else if ExtractFileExt(CR) <> ZIP_EXTENSION then
    FFileOpMode := fmFb2;

  case FFileOpMode of
    fmFb2Zip:
      FFileOprecord.SArch := CR;

    fmFb2:
      FFileOprecord.SArch := CR + R.FileName + R.FileExt;

    fmFBD:
      begin
        CR := CR + R.FileName;
        FFileOprecord.SArch := CR;
      end;
  end;

  FFileOprecord.SNo := R.InsideNo;

  //
  // Если файл в архиве - распаковываем в $tmp
  //
  if FFileOpMode in [fmFb2Zip, fmFBD] then
  begin
    if not FileExists(CR) then
    begin
      ShowMessage('Архив ' + CR + ' не найден!', MB_ICONERROR or MB_OK);
      Exit;
    end;

    FS := TMemoryStream.Create;
    try
      FZipper.FileName := FFileOprecord.SArch;
      FZipper.OpenArchive;
      FZipper.ExtractToStream(GetFileNameZip(FZipper, FFileOprecord.SNo), FS);
      FFileOprecord.SArch := TPath.Combine(Settings.TempPath, FFileOprecord.TargetFileName);
      FS.SaveToFile(FFileOprecord.SArch);
      ///FIsTmp := True;
    finally
      FS.Free;
    end;
  end;

  if (R.FileExt = FB2_EXTENSION) and Settings.OverwriteFB2Info then
    WriteFb2InfoToFile(FFileOprecord.SArch);

  Result := True;
end;

function TExportToDeviceThread.SendFileToDevice: Boolean;
var
  DestFileName: string;
begin
  if not FileExists(FFileOprecord.SArch) then
  begin
    ShowMessage(Format('File "%s" not found', [FFileOprecord.SArch]), MB_ICONERROR or MB_OK);
    Result := False;
    Exit;
  end;

  CreateFolders(DeviceDir, FFileOprecord.TargetFolder);
  DestFileName := TPath.Combine(DeviceDir, FFileOprecord.TargetFolder) + FFileOprecord.TargetFileName;

  Result := True;

  case FExportMode of
    emFB2:
      unit_globals.CopyFile(FFileOprecord.SArch, DestFileName);

    emFB2Zip:
      unit_globals.ZipFile(FFileOprecord.SArch, DestFileName + ZIP_EXTENSION);

    emTxt:
      unit_globals.ConvertToTxt(FFileOprecord.SArch, DestFileName, Settings.TXTEncoding);

    emLrf:
      Result := fb2Lrf(FFileOprecord.SArch, DestFileName);

    emEpub:
      Result := fb2EPUB(FFileOprecord.SArch, DestFileName);

    emPDF:
      Result := fb2PDF(FFileOprecord.SArch, DestFileName);
  end;

  // if FIsTmp then
  // SysUtils.DeleteFile(FFileOpRecord.SArch);
end;

function TExportToDeviceThread.fb2Lrf(const InpFile: string; const OutFile: string): Boolean;
var
  params: string;
begin
  params := Format('-i "%s" -o "%s"', [InpFile, ChangeFileExt(OutFile, '.lrf')]);
  Result := ExecAndWait(Settings.AppPath + 'converters\fb2lrf\fb2lrf_c.exe', params, SW_HIDE)
end;

function TExportToDeviceThread.fb2EPUB(const InpFile: string; const OutFile: string): Boolean;
var
  params: string;
begin
  params := Format('"%s" "%s"', [InpFile, ChangeFileExt(OutFile, '.epub')]);
  Result := ExecAndWait(Settings.AppPath + 'converters\fb2epub\fb2epub.exe', params, SW_HIDE)
end;

function TExportToDeviceThread.fb2PDF(const InpFile: string; const OutFile: string): Boolean;
var
  params: string;
begin
  params := Format('"%s" "%s"', [InpFile, ChangeFileExt(OutFile, '.pdf')]);
  Result := ExecAndWait(Settings.AppPath + 'converters\fb2pdf\fb2pdf.cmd', params, SW_HIDE)
end;

procedure TExportToDeviceThread.SetDeviceDir(const Value: string);
begin
  FDeviceDir := Value;
end;

procedure TExportToDeviceThread.WorkFunction;
var
  i: Integer;
  totalBooks: Integer;
  Res: Boolean;
begin
  FCollectionRoot := DMUser.ActiveCollection.RootPath;

  FZipper := TZipForge.Create(nil);
  try
    FTemplater := TTemplater.Create;
    try
      // FZipper.OnMessage := ShowZipErrorMessage;
      totalBooks := Length(FBookIdList);

      for i := 0 to totalBooks - 1 do
      begin
        Res := PrepareFile(FBookIdList[i].BookID, FBookIdList[i].DatabaseID);
        if Res then
        begin
          if i = 0 then
            FProcessedFiles := FFileOprecord.SArch;

          Res := SendFileToDevice;
        end;

        if not Res and (i < totalBooks - 1) then
        begin
          //
          // TODO -oNickR -cUsability : предусмотреть возможность сказать "да для всех"
          //
          Canceled := (ShowMessage('Обрабатывать оставшиеся файлы ?', MB_ICONQUESTION or MB_YESNO) = IDNO);
        end;

        SetComment(Format('Записано файлов: %u из %u', [i + 1, totalBooks]));
        SetProgress(i * 100 div totalBooks);

        if Canceled then
        begin
          SetComment('Завершение операции ...');
          Break;
        end;
      end;

      SetComment(Format('Записано файлов: %u из %u', [i + 1, totalBooks]));
    finally
      FreeAndNil(FTemplater);
    end;
  finally
    FreeAndNil(FZipper);
  end;
end;

end.
