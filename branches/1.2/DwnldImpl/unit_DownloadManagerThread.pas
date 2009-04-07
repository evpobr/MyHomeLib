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
    FIgnoreErrors : boolean;

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

    FControlState: boolean;

  protected
    procedure UpdateProgress;
    procedure GetCurrentFile;
    procedure Finished;
    procedure Download;
    procedure Canceled;
    procedure Execute; override;
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax:Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure WorkFunction;

    procedure SetControlsState;

  public
    procedure Stop;
    procedure TerminateNow;
   end;

implementation

uses
  frm_main,
  SysUtils,
  DateUtils,
  dm_main,
  IdStack,
  Windows,
  unit_Settings;


procedure TDownloadManagerThread.TerminateNow;
begin
  FidHTTP.Disconnect;
  Terminate;
end;

procedure TDownloadManagerThread.Canceled;
begin
  FCurrentData.State := dsError;
  frmMain.tvDownloadList.RepaintNode(FCurrentNode);

  frmMain.pbDownloadProgress.Percent := 0;
  frmMain.lblDownloadState.Caption := 'Готово';
  frmMain.lblDnldAuthor.Caption := '';
  frmMain.lblDnldTitle.Caption :=  '';

  frmMain.btnPauseDownload.Enabled := False;
  frmMain.btnStartDownload.Enabled := True;
end;

procedure TDownloadManagerThread.Download;
var
  FS: TMemoryStream;
  SL: TStringList;
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

      SetProxySettings(FidHTTP);

      FidHTTP.Get(FCurrentURL, FS);

      if FCanceled then
        Exit;
      CreateFolders('', ExtractFileDir(FCurrentFile));

      FS.Position := 0;

      SL := TStringList.Create;
      try
        SL.LoadFromStream(FS);
        if SL.Count > 0 then
        begin
          if
              (Pos('DOCTYPE', SL[0]) <> 0)
              or (Pos('overload', SL[0]) <> 0)
              or (Pos('not found', SL[0]) <> 0) then
          begin
             if not FIgnoreErrors then Application.MessageBox('Загрузка файла заблокирована сервером!'
                             + #13 +
                             ' Ответ сервера можно посмотреть в файле "server_error.html"'
                             ,'',MB_OK);
            SL.SaveToFile(Settings.SystemFileName[sfServerErrorLog]);
            FError := True;
          end
          else
          begin
            FS.SaveToFile(FCurrentFile);
            FError := not TestArchive(FCurrentFile);
          end;
        end;
      finally
        SL.Free;
      end;


      except
        on E: EIdSocketError do

            if E.LastError = 11001 then
              if not FIgnoreErrors then Application.MessageBox(PChar('Закачка не удалось! Сервер не найден.'+
                           #13+'Код ошибки: '+IntToStr(E.LastError)),'',mb_IconExclamation)
            else
              if not FIgnoreErrors then Application.MessageBox(PChar('Закачка не удалось! Ошибка подключения.'+
                           #13+'Код ошибки: '+IntToStr(E.LastError)),'',mb_IconExclamation);
        on E: Exception do
             if not FIgnoreErrors then Application.MessageBox(PChar('Закачка не удалось! Сервер сообщает об ошибке '+
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
    if Not FError then
    begin
      FCurrentData.State := dsOK ;
      DMMain.SetLocalStatus(FID,True);
      frmMain.tvDownloadList.DeleteNode(FCurrentNode);
      FCurrentNode := nil;
      FCurrentData := nil;
    end
    else
    begin
      FCurrentData.State := dsError;
      frmMain.tvDownloadList.RepaintNode(FCurrentNode);
    end;

  frmMain.pbDownloadProgress.Percent := 0;
  frmMain.lblDownloadState.Caption := 'Готово';
  frmMain.lblDnldAuthor.Caption := '';
  frmMain.lblDnldTitle.Caption :=  '';

  frmMain.lblDownloadCount.Caption := Format('(%d)',[frmMain.tvDownloadList.ChildCount[Nil]]);

  frmMain.pbDownloadProgress.Visible := False;
  frmMain.btnPauseDownload.Enabled := False;
  frmMain.btnStartDownload.Enabled := True;
end;

procedure TDownloadManagerThread.GetCurrentFile;
var
  ErrorCount : integer;
begin
  FFinished := True;
  if FCanceled then Exit;

  if FCurrentNode <> nil then
    FCurrentNode := frmMain.tvDownloadList.GetNext(FCurrentNode);
  if FCurrentNode = nil then
  begin
    ErrorCount := 0;
    FCurrentNode := frmMain.tvDownloadList.GetFirst;
    FCurrentData := frmMain.tvDownloadList.GetNodeData(FCurrentNode);
    while (FCurrentData <> nil) and
          ((FCurrentData.State = dsError) and (FCurrentNode <> nil)) do
    begin
      FCurrentNode := frmMain.tvDownloadList.GetNext(FCurrentNode);
      FCurrentData := frmMain.tvDownloadList.GetNodeData(FCurrentNode);
      Inc(ErrorCount);
    end;

    if (ErrorCount > 0) and (FCurrentNode = Nil) then
        FCurrentNode := frmMain.tvDownloadList.GetFirst;

  end;

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

      if frmMain.Visible then
      begin
        frmMain.lblDownloadState.Caption := 'Подключение ...';
        frmMain.lblDnldAuthor.Caption := FCurrentData.Author;
        frmMain.lblDnldTitle.Caption := FCurrentData.Title;
        frmMain.pbDownloadProgress.Visible := True;
      end
      else
        frmMain.TrayIcon.Hint := Format('%s %s %s Подключение ...',
                                            [FCurrentData.Author,
                                             FCurrentData.Title,
                                             #13]);
      frmMain.btnPauseDownload.Enabled := True;
      frmMain.btnStartDownload.Enabled := False;

      frmMain.TrayIcon.Hint := 'MyHomeLib';

      FFinished := False;
      Break;
    end;
    FCurrentNode := frmMain.tvDownloadList.GetNext(FCurrentNode);
  end;
end;

procedure TDownloadManagerThread.HTTPWork(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  if FCanceled then
  begin
    FidHTTP.Disconnect;
    Exit;
  end;


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


procedure TDownloadManagerThread.SetControlsState;
begin
  frmMain.BtnFirstRecord.Enabled := FControlState;
  frmMain.BtnDwnldUP.Enabled := FControlState;
  frmMain.BtnDwnldDown.Enabled := FControlState;
  frmMain.BtnLastRecord.Enabled := FControlState;

//  frmMain.BtnDelete.Enabled := FControlState;
  frmMain.BtnSave.Enabled := FControlState;

  frmMain.mi_dwnl_Delete.Enabled := FControlState;
end;

procedure TDownloadManagerThread.Stop;
begin
  FCanceled := True;
  Synchronize(Canceled);
  FControlState := True;
  Synchronize(SetControlsState);
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
    if frmMain.Visible then
    begin
      frmMain.lblDownloadState.Caption := Format('Загрузка: %s Kb/s',[Speed]);
      frmMain.pbDownloadProgress.Percent := FProgress;
    end
    else
     frmMain.TrayIcon.Hint := Format('%s. %s %s Загрузка: %s Kb/s    %d %%',
                                    [FCurrentData.Author,
                                     FCurrentData.Title,
                                     #13,
                                     Speed,FProgress])
  end;
end;

procedure TDownloadManagerThread.WorkFunction;
var
  Res: integer;
begin
  FControlState := False;
  Synchronize(SetControlsState);

  FCanceled := False;
  FIgnoreErrors := False;
  FError := False;

  FidHTTP := TidHTTP.Create(nil);
  SetProxySettings(FidHTTP);

  FidHTTP.OnWork := HTTPWork;
  FidHTTP.OnWorkBegin := HTTPWorkBegin;
  FidHTTP.OnWorkEnd := HTTPWorkEnd;
  FidHTTP.HandleRedirects := True;

  try
    Synchronize(GetCurrentFile);
    repeat
      if FError then Sleep(30000);
      Download;
      Synchronize(Finished);
      Synchronize(GetCurrentFile);
      if FError and not FIgnoreErrors and not FCanceled then
      begin
        Res := Application.MessageBox('Игнорировать ошибки загрузки ?','', MB_YESNOCANCEL);
        FCanceled := (Res = IDCANCEL);
        FIgnoreErrors := (Res = IDYES);
      end;
    until FFinished or FCanceled;
    Synchronize(Finished);
  finally
    FidHTTP.Free;
    FControlState := True;
    Synchronize(SetControlsState);
  end;

end;

end.
