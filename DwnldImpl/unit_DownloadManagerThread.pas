unit unit_DownloadManagerThread;

interface

uses
  Classes,
  IdHTTP,
  Forms,
  IdComponent,
  IdHTTPHeaderInfo,
  VirtualTrees,
  unit_Globals;

type
  TDownloadManagerThread = class(TThread)
  private
    FidHTTP:TidHTTP;

    FCanceled : boolean;
    FFinished : boolean;

    FDownloadSize : integer;
    FProgress: integer;
    FWorkCount: integer;

    FStartDate : TDateTime;

    FCurrentFile: string;
    FCurrentUrl: string;
    FID: integer;
    FCurrentNode : PVirtualNode;
    FCurrentData : PDownloadData;

    FError : boolean;

  protected
    procedure UpdateProgress;
    procedure GetCurrentFile;
    procedure Started;
    procedure Finished;
    procedure Download;
    procedure Execute; override;
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax:Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure WorkFunction;
  public
    procedure Stop;

  end;

implementation

uses
  frm_main,
  SysUtils,
  DateUtils,
  dm_main,
  IdStack,
  Windows;


procedure TDownloadManagerThread.Download;
var
  FS: TMemoryStream;
begin
  FError := True;
  FS := TMemoryStream.Create;
  try
//    if FileExists(FN) then
//    begin
//      FS.LoadFromFile(FN);
//      FS.Position := FS.Size;
//      //FidHTTP.Request.Range := IntToStr(FS.Position);
//      FidHTTP.Request.ContentRangeStart := FS.Size;
//      FidHTTP.Request.ContentRangeEnd := 0;
//      FWorkCount := FS.Size;
//    end;
    try
      FidHTTP.Get(FCurrentURL, FS);
      CreateFolders('', ExtractFileDir(FCurrentFile));
      FS.SaveToFile(FCurrentFile);
      FError := False;
      except
        on E: EIdSocketError do

            if E.LastError = 11001 then
              Application.MessageBox(PChar('Проверка обновления не удалось! Сервер не найден.'+
                           #13+'Код ошибки: '+IntToStr(E.LastError)),'',mb_IconExclamation)
            else
              Application.MessageBox(PChar('Проверка обновления не удалось! Ошибка подключения.'+
                           #13+'Код ошибки: '+IntToStr(E.LastError)),'',mb_IconExclamation);
        on E: Exception do
             Application.MessageBox(PChar('Проверка обновления не удалось! Сервер сообщает об ошибке '+
                          #13+'Код ошибки: '+IntToStr(FidHTTP.ResponseCode)),'',mb_IconExclamation);

      end;
  finally
    FS.Free;
  end;
end;

procedure TDownloadManagerThread.Execute;
begin
  WorkFunction;
end;

procedure TDownloadManagerThread.Finished;
begin
  if FCurrentData <> nil then
  begin
    if Not Ferror then
      FCurrentData.State := dsOK
    else
      FCurrentData.State := dsError;
    frmMain.tvDownloadList.RepaintNode(FCurrentNode);
  end;
  DMMain.SetLocalStatus(FID,True);
  frmMain.pbDownloadProgress.Percent := 0;
  frmMain.lblDownloadState.Caption := 'Готово';
  frmMain.lblDnldAuthor.Caption := '';
  frmMain.lblDnldTitle.Caption :=  '';

  frmMain.btnPauseDownload.Enabled := False;
  frmMain.btnStartDownload.Enabled := True;
end;

procedure TDownloadManagerThread.GetCurrentFile;
begin
  FFinished := True;
  FCurrentNode := frmMain.tvDownloadList.GetFirst;

  while FCurrentNode <> nil do
  begin
    FCurrentData := frmMain.tvDownloadList.GetNodeData(FCurrentNode);
    if FCurrentData.State <> dsOK then
    begin
      FCurrentUrl := FCurrentData.URL;
      FCurrentFile := FCurrentData.FileName;
      FID := FCurrentData.ID;

      FCurrentData.State := dsRun;
      frmMain.tvDownloadList.RepaintNode(FCurrentNode);

      frmMain.lblDownloadState.Caption := 'Подключение ...';
      frmMain.lblDnldAuthor.Caption := FCurrentData.Author;
      frmMain.lblDnldTitle.Caption := FCurrentData.Title;

      FFinished := False;
      Break;
    end;
    FCurrentNode := frmMain.tvDownloadList.GetNext(FCurrentNode);
  end;
end;

procedure TDownloadManagerThread.HTTPWork(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  if FDownloadSize <> 0 then
  begin
    FWorkCount := AWorkCount;
    FProgress := AWorkCount * 100 div FDownloadSize;
    Synchronize(UpdateProgress);
  end;
end;

procedure TDownloadManagerThread.HTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);

begin
  FDownloadSize := AWorkCountMax;
  FProgress := FWorkCount * 100 div FDownloadSize;
  FStartDate := Now;
  Synchronize(UpdateProgress);
end;

procedure TDownloadManagerThread.HTTPWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
end;

procedure TDownloadManagerThread.Started;
begin

end;

procedure TDownloadManagerThread.Stop;
begin
  FidHTTP.Disconnect;
  Terminate;
end;

procedure TDownloadManagerThread.UpdateProgress;
var
  ElapsedTime : Cardinal;
  Speed: string;
begin
  ElapsedTime := SecondsBetween(Now,FStartDate);
  if ElapsedTime>0 then
  begin
    Speed := FormatFloat('0.00', FWorkCount/1024/ElapsedTime);
    frmMain.lblDownloadState.Caption := Format('Загрузка: %s Kb/s',[Speed]);
  end;
  frmMain.pbDownloadProgress.Percent := FProgress;
end;

procedure TDownloadManagerThread.WorkFunction;
begin
  FidHTTP := TidHTTP.Create(nil);
  SetProxySettings(FidHTTP);

  FidHTTP.OnWork := HTTPWork;
  FidHTTP.OnWorkBegin := HTTPWorkBegin;
  FidHTTP.OnWorkEnd := HTTPWorkEnd;
  FidHTTP.HandleRedirects := True;
  try
    Synchronize(GetCurrentFile);
    repeat
      Download;
      Synchronize(Finished);
      Synchronize(GetCurrentFile);
    until FFinished;
  finally
    FidHTTP.Free;
  end;

end;

end.
