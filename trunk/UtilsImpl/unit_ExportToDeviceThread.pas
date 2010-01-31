{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov    alex.penkov@gmail.com                        }
{               Matvienko Sergei  matv84@mail.ru                               }
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

    FFileOpMode: (fmFb2Zip, fmFb2, fmFBD);
    FBookIdList: TBookIdList;
    FTable: TAbsTable;
    FCollectionRoot: string;
    FExportMode: TExportMode;
    FIsTmp: boolean;
    FProcessedFiles: string;
    procedure ShowZipErrorMessage(Sender: TObject; ErrCode: Integer; Message: string);

    function fb2Lrf(InpFile,OutFile:string):boolean;
    function fb2EPUB(InpFile,OutFile:string):boolean;
    function fb2PDF(InpFile,OutFile:string):boolean;

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
  dm_collection,
  dm_user,
  unit_database,
  unit_Consts,
  unit_Settings,
  frm_main,
  StrUtils,
  ShellAPI,
  unit_MHLHelpers, unit_WriteFb2Info,
  unit_Templater;

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
  InsideFileName: string;

  Templater: TTemplater;

  function RemoveSquareBrackets(S: string):string;
  begin
    p1 := PosChr('[',S);
    p2 := PosChr(']',S);
    if Settings.RemoveSquarebrackets and (p1 <> 0) and (p2 <> 0)  then
      Delete(S,p1,p2);
    Result := Trim(S);
  end;

begin

   { TODO -oalex :
рефакторинг: разобрать на отдельные модули
разобраться с логикой }

  FIsTmp := False;
  FTable.Locate('ID', ID, []);
  Result := False;

  CR := GetFullBookPath(FTable, FCollectionRoot);

  with FFileOpRecord do
  begin
    //
    // Сформируем имя файла в соответствии с заданным темплейтом
    Templater:= TTemplater.Create;
    if Templater.SetTemplate(Settings.FileNameTemplate) = ErFine then
    begin
      Templater.ParseTemplate(DMCollection);
      FileName := Templater.GetParsedString;
    end;


{    Эти строки мне немного непонятны, поэтому убирать я их не стал,
     посмотрите логику работы моего шаблонизатора и может они уже не нужны.
     Ещё мне не совсем понятен RemoveSquareBrackets, зачем он и куда его цеплять?

   FileName := Settings.FileNameTemplate;



    if FTable.Name <> 'tblGrouppedBooks' then
        FullName := dmCollection.FullName(FTable.FieldByName('Id').AsInteger)
    else
        FullName := FTable.FieldByName('FullName').AsString;

    z := FTable.FieldbyName('SeqNumber').AsInteger;
    if z > 0 then
      StrReplace('%n',Format('%.2d',[z]), FileName)
    else begin
      p1 := pos('%n',FileName);
      StrReplace('%n', '#n', FileName);
      p2 := pos('%', FileName);
      if p2 > 3 then
        Delete(FileName, p1, p2 - p1 - 1)
      else
        StrReplace('#n', '', FileName);
    end;

    StrReplace('%fl', copy(FullName,1,1), Folder);
    StrReplace('%f', FullName , FileName);

    StrReplace('%t', RemoveSquareBrackets(FTable.FieldByName('Title').AsString), FileName);

    StrReplace('%id', Trim(FTable.FieldByName('LibID').AsString), FileName);
    StrReplace('%g', Trim(dmCollection.GetBookGenres(FTable.FieldByName('ID').AsInteger,True)), FileName);
    StrReplace('%rg', Trim(dmCollection.GetRootGenre(FTable.FieldByName('ID').AsInteger)), FileName);
    if FTable.FieldByName('Series').AsString <> NO_SERIES_TITLE then
      StrReplace('%s', RemoveSquareBrackets(FTable.FieldByName('Series').AsString), FileName)
    else
      StrReplace('%s','',FileName);
}
   if (ExtractFileExt(FTable['FileName']) = ZIP_EXTENSION) and
           (FTable['Ext'] <> ZIP_EXTENSION) then FFileOpMode := fmFBD
      else
        if ExtractFileExt(CR) <> ZIP_EXTENSION then
            FFileOpMode := fmFb2;


    //
    // Сформируем имя каталога в соответствии с заданным темплейтом
    if Templater.SetTemplate(Settings.FolderTemplate) = ErFine then
    begin
      Templater.ParseTemplate(DMCollection);
      Folder := Templater.GetParsedString;
    end;
    Templater.Free;

    { Здесь та же ситуация

      Folder := Settings.FolderTemplate;
    StrReplace('%fl', copy(FullName,1,1), Folder);
    StrReplace('%f', FullName , Folder);
    StrReplace('%t', trim(FTable.FieldByName('Title').AsString), Folder);
    StrReplace('%g', Trim(dmCollection.GetBookGenres(FTable.FieldByName('ID').AsInteger,True)), Folder);
    StrReplace('%rg', Trim(dmCollection.GetRootGenre(FTable.FieldByName('ID').AsInteger)), Folder);
    if FTable.FieldByName('Series').AsString <> NO_SERIES_TITLE then
      StrReplace('%s', RemoveSquareBrackets(FTable.FieldByName('Series').AsString), Folder)
    else
      StrReplace('%s','',Folder);
}
    case FFileOpMode of
      fmFB2Zip: SArch := CR;
      fmFB2: SArch := CR + FTable['FileName'] + FTable['Ext'];
      fmFBD: begin
               CR := CR + FTable['FileName'];
               SArch := CR;
             end;
    end;
    SNo := FTable['InsideNo'];

    Folder := IncludeTrailingPathDelimiter(trim(CheckSymbols(Folder)));
    FileName := Trim(CheckSymbols(FileName));

    InsideFileName := FullName + ' - ' + FTable.FieldByName('Title').AsString;

    if Settings.TransliterateFileName then
    begin
      InsideFileName := Transliterate(InsideFileName);
      Folder := Transliterate(Folder);
      FileName := Transliterate(FileName);
    end;

    FileName := FileName + dmCollection.tblBooks['Ext'];
  end;

  //
  // Если файл в архиве - распаковываем в $tmp
  //
  if (FFileOpMode = fmFb2Zip) OR (FFileOpMode = fmFBD)
  then
  begin
    if not FileExists(CR) then
    begin
      ShowMessage('Архив ' + CR + ' не найден!', MB_ICONERROR or MB_OK);
      Exit;
    end;

    InsideFileName := Trim(CheckSymbols(InsideFileName)) + dmCollection.tblBooks['Ext'];

    fs := TMemoryStream.Create;
    try
      FZipper.FileName := FFileOpRecord.SArch;
      FZipper.OpenArchive;
      FZipper.ExtractToStream(GetFileNameZip(FZipper,FFileOpRecord.SNo),FS);
      FFileOprecord.SArch := Settings.TempPath + InsideFileName;
      fs.SaveToFile(FFileopRecord.SArch);
      FIsTmp := True;
    finally
      fs.Free;
    end;
  end;
  if (dmCollection.tblBooks['Ext'] = FB2_EXTENSION) and Settings.OverwriteFB2Info
     then WriteFb2InfoToFile(FFileopRecord.SArch);

  Result := True;
end;

function TExportToDeviceThread.SendFileToDevice: Boolean;
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
    emTxt:unit_globals.ConvertToTxt(FFileOpRecord.SArch, DestFileName, Settings.TXTEncoding);
    emLrf:Result := fb2Lrf(FFileOpRecord.SArch,DestFileName);
    emEpub:Result := fb2EPUB(FFileOpRecord.SArch,DestFileName);
    emPDF:Result := fb2PDF(FFileOpRecord.SArch,DestFileName);
  end;

//  if FIsTmp then
//    SysUtils.DeleteFile(FFileOpRecord.SArch);
end;

function TExportToDeviceThread.fb2Lrf(InpFile,OutFile:string):boolean;
var
  params: string;
begin
  params := Format('-i "%s" -o "%s"',[InpFile,ChangeFileExt(OutFile, '.lrf')]);
  Result := ExecAndWait(Settings.AppPath + 'converters\fb2lrf\fb2lrf_c.exe',params, SW_HIDE)
end;

function TExportToDeviceThread.fb2EPUB(InpFile,OutFile:string):boolean;
var
  params: string;
begin
  params := Format('"%s" "%s"',[InpFile,ChangeFileExt(OutFile, '.epub')]);
  Result := ExecAndWait(Settings.AppPath + 'converters\fb2epub\fb2epub.exe',params, SW_HIDE)
end;

function TExportToDeviceThread.fb2PDF(InpFile,OutFile:string):boolean;
var
  params: string;
begin
  params := Format('"%s" "%s"',[InpFile,ChangeFileExt(OutFile, '.pdf')]);
  Result := ExecAndWait(Settings.AppPath + 'converters\fb2pdf\fb2pdf.cmd',params, SW_HIDE)
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

  if FTable <> DMUser.tblGrouppedBooks then     // хреново как-то получилось ...
    FCollectionRoot := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder)
  else
    FCollectionRoot := '';

  FZipper := TZipForge.Create(nil);
  try
    // FZipper.OnMessage := ShowZipErrorMessage;

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
        Canceled := (ShowMessage('Обрабатывать оставшиеся файлы ?', MB_ICONQUESTION or MB_YESNO) = IDNO);

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
