unit unit_DownloadManagerThread;

interface

uses
  Classes,
  Forms,
  VirtualTrees,
  unit_Globals,
  unit_Downloader;

type
  TDownloadManagerThread = class(TThread)
  private
    FDownloader : TDownloader;

    FCanceled : boolean;
    FFinished : boolean;
    FIgnoreErrors : boolean;

    FProcessed: integer;
    FTotal: integer;

    FBookID: Integer;
    FDatabaseID: Integer;

    FCurrentNode : PVirtualNode;
    FCurrentData : PDownloadData;

    FError : boolean;
    FControlState: boolean;

  protected
    procedure SetComment(const Current, Total: string);
    procedure SetProgress(Current, Total: Integer);
    procedure GetCurrentFile;
    procedure Finished;
    procedure Canceled;
    procedure Execute; override;
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
  dm_collection,
  IdStack,
  IdStackConsts,
  IdException,
  Windows,
  unit_Settings,
  IdMultipartFormData;


procedure TDownloadManagerThread.TerminateNow;
begin
  try
    FDownloader.Stop;
    Terminate;
  except
    // подавляем ETreminate
  end;
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

procedure TDownloadManagerThread.Execute;
begin
  WorkFunction;
end;

procedure TDownloadManagerThread.Finished;
begin
  if FCurrentData <> nil then
    if Not FError then
    begin
      FCurrentData.State := dsOk ;
      frmMain.tvDownloadList.DeleteNode(FCurrentNode);
      FCurrentNode := nil;
      FCurrentData := nil;
      inc(FProcessed);
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
    if FCurrentData.State <> dsOk then
    begin
      FBookID := FCurrentData^.BookID;
      FDatabaseID := FCurrentData^.DataBaseID;

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
                                             CRLF]);
      frmMain.btnPauseDownload.Enabled := True;
      frmMain.btnStartDownload.Enabled := False;

      frmMain.TrayIcon.Hint := 'MyHomeLib';

      FFinished := False;
      Break;
    end;
    FCurrentNode := frmMain.tvDownloadList.GetNext(FCurrentNode);
  end;
end;


procedure TDownloadManagerThread.SetComment(const Current, Total: string);
begin
  frmMain.lblDownloadState.Caption := Current;
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

procedure TDownloadManagerThread.SetProgress(Current, Total: Integer);
begin
  if frmMain.Visible then
  begin
    frmMain.pbDownloadProgress.Percent := Current;
  end
  else
    frmMain.TrayIcon.Hint := Format('%s. %s %s Загрузка: %s Kb/s    %d %%',
                                    [FCurrentData.Author,
                                     FCurrentData.Title,
                                     CRLF,
                                     '',
                                     Current])

end;

procedure TDownloadManagerThread.Stop;
begin
  FCanceled := True;
  Synchronize(Canceled);
  FControlState := True;
  Synchronize(SetControlsState);
  Terminate;
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

  FProcessed := 0;
  FTotal := frmMain.tvDownloadList.AbsoluteIndex(frmMain.tvDownloadList.GetLast);

  FDownloader := TDownloader.Create;
  FDownloader.OnSetComment := SetComment;
  FDownloader.OnProgress := SetProgress;

  try
    Synchronize(GetCurrentFile);
    repeat
      if FError then
        Sleep(30000);
      Sleep(Settings.DwnldInterval);
      FError := not FDownloader.Download(FBookID, FDatabaseID);
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
    FControlState := True;
    Synchronize(SetControlsState);
  end;

end;

end.
