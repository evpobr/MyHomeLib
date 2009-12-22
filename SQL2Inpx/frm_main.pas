unit frm_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask, ComCtrls,
  ActnList, Menus, ZipForge, IdHTTP, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, DADump,
  MyDump;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Fb21: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    USR1: TMenuItem;
    Online1: TMenuItem;
    Extra1: TMenuItem;
    ExtraFTP1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Pages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    tsParams: TTabSheet;
    mmLog: TMemo;
    Bar: TProgressBar;
    lblS1: TLabel;
    lblS2: TLabel;
    aopFB2: TAction;
    Zip: TZipForge;
    dlgOpen: TOpenDialog;
    idFTP: TIdFTP;
    HTTP: TIdHTTP;
    edTitle: TLabeledEdit;
    edInpxName: TLabeledEdit;
    edUpdateName: TLabeledEdit;
    edExtraName: TLabeledEdit;
    edShort: TLabeledEdit;
    edURL: TLabeledEdit;
    edSQLUrl: TLabeledEdit;
    edBDName: TLabeledEdit;
    mmTables: TMemo;
    mmScript: TMemo;
    N13: TMenuItem;
    N14: TMenuItem;
    dbImport: TAction;
    edStartID: TLabeledEdit;
    edCode: TLabeledEdit;
    edDescr: TLabeledEdit;
    edExtraInfo: TLabeledEdit;
    aopExtra: TAction;
    aopExtraFTP: TAction;
    apSave: TAction;
    apLoad: TAction;
    dbConnect: TAction;
    N15: TMenuItem;
    aopOnLine: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aopFB2Execute(Sender: TObject);
    procedure dbImportExecute(Sender: TObject);
    procedure DumpRestoreProgress(Sender: TObject; Percent: Integer);
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure aopExtraExecute(Sender: TObject);
    procedure aopExtraFTPExecute(Sender: TObject);
    procedure apSaveExecute(Sender: TObject);
    procedure apLoadExecute(Sender: TObject);
    procedure dbConnectExecute(Sender: TObject);
    procedure aopOnLineExecute(Sender: TObject);
  private
    { Private declarations }
    FAppPath : string;
    FBasesPath: string;
    FInpPath: string;
    FOutPath: string;

    FFileList: TStringList;
    FDownloadSize: Int64;
    FStartDate: Extended;
    FFTPDir: string;

    procedure SetTableState(State: boolean);
    procedure EnableControls;
    procedure Disablecontrols;
    procedure Log(S: string);
    procedure Pack(FN: string;  Level: integer);
    procedure UploadToFTP;
    procedure Extra;
    procedure Online;

    procedure ReadINI;
    procedure SaveINI;
    procedure LoadProfile(FN: string);
    procedure SaveProfile(FN: string);
    function ExecAndWait(const FileName, Params: String; const WinState: Word): boolean;
    procedure Version;
    procedure Connect;
  public
    { Public declarations }
    procedure Commands;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  DateUtils,
  IniFiles,
  dm_librusec;

{$R *.dfm}

procedure TfrmMain.aopExtraExecute(Sender: TObject);
var
  i, j, Max: integer;
  S: string;
  Res: TStringList;
begin
  j := 0;
  DisableControls;
  Screen.Cursor := crHourGlass;
  Pages.ActivePageIndex := 2;
  Max := Lib.LastBookID;
  try
    Res := TStringList.Create;
    Log('Extra');
    Log('-------------------------');
    for I := StrToInt(edStartID.Text) to Max do
    begin
      S := Lib.GetBookRecord(i);
      if S <> '' then
      begin
        Res.Add(S);
        inc(j);
      end;
      if (j mod 100) = 0 then
      begin
        lblS1.Caption := 'Добавленно ' + IntToStr(j);
        Application.ProcessMessages;
      end;
    end;
    Res.SaveToFile(FInpPath + 'extra.inp', TEncoding.UTF8);
    Version;
    Log(TimeToStr(Now) + ' Упаковка ... ');
    Zip.CompressionLevel := clMax;

    Zip.FileName := FOutPath + edExtraName.Text + '.zip';
    Zip.OpenArchive(fmCreate);
    Zip.BaseDir := FInpPath;
    Zip.AddFiles(FInpPath + 'extra.inp');
    Zip.AddFiles(FInpPath + 'version.info');
    Zip.CloseArchive;
    Log(TimeToStr(Now) + 'Готово');
  finally
    Screen.Cursor := crDefault;
    EnableControls;
    Res.Free;
  end;
end;

procedure TfrmMain.aopExtraFTPExecute(Sender: TObject);
begin
  aopExtraExecute(Sender);
  UploadToFtp;
end;

procedure TfrmMain.aopFB2Execute(Sender: TObject);
const
   Filter = 'zip|*.zip';
var
  i, j : integer;
  ArchItem: TZFArchiveItem;
  FN: string;
  BookID: integer;
  S: string;
  Result : TStringList;
begin
  if not dlgOpen.Execute then  Exit;
  dlgOpen.Filter := Filter;

  DisableControls;
  Pages.ActivePageIndex := 2;
  Result := TStringList.Create;
  Screen.Cursor := crHourGlass;
  FFileList.Clear;
  Log('FB2');
  Log('---------------------------------');
  try
    for I := 0 to dlgOpen.Files.Count - 1 do
    begin
      FN:=ExtractFileName(dlgOpen.Files[i]);
      Log(TimeToStr(Now) + ' ' + FN);
      Zip.FileName:=dlgOpen.Files[i];
      Zip.OpenArchive;
      Result.Clear;
      j := 0;
      if (Zip.FindFirst('*.*',ArchItem,faAnyFile-faDirectory)) then
      repeat
        BookID := StrToInt(copy(ArchItem.FileName,1,Length(ArchItem.FileName) - 4));
        S := Lib.GetBookRecord(BookID);
        if S <> '' then Result.Add(S);
        inc(j);
        if (j mod 100) = 0 then
        begin
          lblS1.Caption := 'Обработано ' + IntToStr(j);
          Application.ProcessMessages;
        end;
      until (not Zip.FindNext(ArchItem));
      FN := copy(FN,1,Length(FN)-4);
      Result.SaveToFile(FInpPath + FN + '.inp', TEncoding.UTF8);
      FFileList.Add(FN + '.inp');
      Bar.Position := round((i + 1) / dlgOpen.Files.Count * 100);
    end;
    FFileList.Add('extra.inp');
    Log(TimeToStr(Now) + ' ' + 'Упаковка ...');
    Version;
    Pack(edInpxName.Text + '.inpx', 0);
    Pack(edUpdateName.Text + '.zip', 9);
    Log(TimeToStr(Now) + ' ' + 'Готово');
  finally
    EnableControls;
    Screen.Cursor := crDefault;
    Result.Free;
  end;
end;

procedure TfrmMain.aopOnLineExecute(Sender: TObject);
var
  i, j, Max: integer;
  S: string;
  Window: integer;
  FN: string;
  Res: TStringList;
begin
  i := 1; Window := 9999;
  DisableControls;
  Screen.Cursor := crHourGlass;
  Pages.ActivePageIndex := 2;
  Max := Lib.LastBookID;
  FFileList.Clear;
  try
    Res := TStringList.Create;
    Log('Extra');
    Log('-------------------------');
    while i < Max do
    begin
      if (i + Window) > Max then
        Window := Max - i;
      FN := Format('%.6d-%.6d.inp',[ i, i + Window]);
      Log(FN);
      Res.Clear;
      for j := i to i + Window do
      begin
        S := Lib.GetBookRecord(j, True);
        if S <> '' then Res.Add(S);
        if ((j - 1) mod 100) = 0 then
        begin
          lblS1.Caption := 'Добавленно ' + IntToStr(j - i);
          Application.ProcessMessages;
        end;
      end;
      Res.SaveToFile(FInpPath + FN, TEncoding.UTF8);
      FFileList.Add(FN);
      inc(i, Window + 1);
      Bar.Position := round((i + 1)/Max * 100);
      Bar.Repaint;
    end; // main for
    Log(TimeToStr(Now) + ' ' + 'Упаковка ...');
    Version;
    Pack(edInpxName.Text + '.inpx', 9);
    Log(TimeToStr(Now) + 'Готово');
  finally
    Screen.Cursor := crDefault;
    EnableControls;
    Res.Free;
  end;
end;

procedure TfrmMain.apLoadExecute(Sender: TObject);
const
  Filter = 'Profile|*.profile';
begin
  dlgOpen.Filter := Filter;
  if not dlgOpen.Execute then Exit;
  LoadProfile(dlgOpen.FileName);
  Connect;
end;

procedure TfrmMain.apSaveExecute(Sender: TObject);
begin
  SaveProfile(edShort.text);
end;

procedure TfrmMain.Commands;
var
  i : integer;
begin
  if ParamCount = 0 then Exit;
  i := 1;
  while I <= ParamCount do
  begin
    if ParamStr(i) = '-dump' then dbImportExecute(nil);
    if ParamStr(i) = '-extra' then aopExtraExecute(nil);
    if ParamStr(i) = '-ftp' then UploadToFtp;
    if Paramstr(i) = '-p' then
    begin
      LoadProfile(FAppPath + Paramstr(i + 1) + '.profile');
      Connect;
      inc(i);
    end;
    if ParamStr(i) = '-c' then Close;
    inc(i);
  end;
end;

procedure TfrmMain.Connect;
begin
  Lib.Connection.Connected := False;
  Lib.Connection.Database := edBDName.Text;
  Lib.Connection.Connect;
  SetTableState(True);
end;

procedure TfrmMain.dbConnectExecute(Sender: TObject);
begin
  Connect;
end;

procedure TfrmMain.dbImportExecute(Sender: TObject);
var
  i: integer;
  ArchName, DumpName: string;
  Responce: TMemoryStream;
  Params: string;

  CMD: TStringList;
begin
  Pages.ActivePageIndex := 2;
  Screen.Cursor := crHourGlass;
  try
    Responce := TMemoryStream.Create;
    CMD := TStringList.Create;
    Log('Импорт ');
    Log('---------------------------------');
    for I := 0 to mmTables.Lines.Count - 1 do
    begin
      DumpName := FBasesPath + copy(mmTables.Lines[i],1,Length(mmTables.Lines[i]) - 3);
      ArchName := FBasesPath + mmTables.Lines[i];
      Log(TimeToStr(Now) + ' ' + mmTables.Lines[i] + ' : Загрузка ...');
      Responce.Clear;
      HTTP.Get(edSQLUrl.Text + mmTables.Lines[i], Responce);
      Responce.SaveToFile(ArchName);
      Log(TimeToStr(Now) + ' Распаковка ...');
      ExecAndWait(FAppPath + '7za.exe','e -y ' + ArchName + ' -o' + FBasesPath, 0);
      CMD.Add('mysql.exe -h localhost -u lib ' + edShort.Text + ' < ' + DumpName + '');
    end;
    CMD.SaveToFile(FAppPath + 'import.bat');
    Log(TimeToStr(Now) + ' Импорт ...');
    ExecAndWait(FAppPath + 'import.bat', '', 0);
  finally
    Responce.Free;
    CMD.Free;
    Log(TimeToStr(Now) + ' ' + 'Готово');
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.Disablecontrols;
begin
  Lib.Book.DisableControls;
  Lib.Genre.DisableControls;
  Lib.Series.DisableControls;
  Lib.Avtor.DisableControls;
end;

procedure TfrmMain.DumpRestoreProgress(Sender: TObject; Percent: Integer);
begin
  Bar.Position := Percent;
end;

procedure TfrmMain.EnableControls;
begin
  Lib.Book.EnableControls;
  Lib.Genre.EnableControls;
  Lib.Series.EnableControls;
  Lib.Avtor.EnableControls;
end;

procedure TfrmMain.Extra;
begin

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetTableState(False);
  FFileList.Free;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FAppPath := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  FInpPath := FAppPath + 'LIBRUSEC_INP\';
  FBasesPath := FAppPath + 'BASES\';
  FOutPath := FAppPath + 'ARCH\';

  ReadINI;
  FFileList := TStringList.Create;
end;

procedure TfrmMain.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  ElapsedTime: Cardinal;
  Speed: string;
begin
//  if not   FOnDownload  then exit;

  Application.ProcessMessages;

  if FDownloadSize <> 0 then
    Bar.Position := AWorkCount * 100 div FDownloadSize;

  ElapsedTime := SecondsBetween(Now, FStartDate);
  if ElapsedTime > 0 then
  begin
    Speed := FormatFloat('0.00', AWorkCount / 1024 / ElapsedTime);
    lblS1.Caption := Format('Загрузка: %s Kb/s', [Speed]);
  end;
end;

procedure TfrmMain.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
//  if not FOnDownload then Exit;
  Bar.Position := 0;
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
end;

procedure TfrmMain.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
//  if not FOnDownload then Exit;
  Bar.Position := 0;
  lblS1.Caption := '';
end;

procedure TfrmMain.LoadProfile(FN: string);
var
  F : TIniFile;
begin
  try
    F := TIniFile.Create(FN);
    mmScript.Text := StringReplace(F.ReadString('DATA','Script', ''), #4, #13#10, [rfReplaceAll]);
    mmTables.Text := StringReplace(F.ReadString('DATA','Tables', ''), #4, #13#10, [rfReplaceAll]);
    edBDName.Text := F.ReadString('DATA','DBName', '');
    edSQLUrl.Text := F.ReadString('DATA','SQLUtrl', '');
    edURL.Text := F.ReadString('DATA','URL', '');
    edInpxName.Text := F.ReadString('DATA','INPxName', '');
    edUpdateName.Text := F.ReadString('DATA','UpdateName','');
    edExtraName.Text := F.ReadString('DATA','ExtraName','');
    edExtraInfo.Text := F.ReadString('DATA','ExtraInfo','');
    edStartID.Text := F.ReadString('DATA','StartID','');
    edCode.Text := F.ReadString('DATA','Code','');
    edDescr.Text := F.ReadString('DATA','Descr', '');
    edTitle.Text := F.ReadString('DATA','Title', '');
    edShort.Text := F.ReadString('DATA','Short', '');

    frmMain.Caption := 'SQL2Inpx: ' + edShort.Text;
  finally
    F.Free;
  end;
end;

procedure TfrmMain.Log(S: string);
begin
  mmLog.Lines.Add(S);
end;

procedure TfrmMain.Online;
begin

end;

procedure TfrmMain.Pack(FN: string; Level: integer);
var
  i: integer;
  Comment: string;
begin
  if FileExists(FOutPath + FN) then
    DeleteFile(FOutPath + FN);

  if Level = 0 then
      Zip.CompressionLevel := clNone
    else
      Zip.CompressionLevel := clMax;

  Zip.FileName := FOutPath + FN;
  Zip.OpenArchive(fmCreate);
  Zip.BaseDir := FInpPath;
  for I := 0 to FFileList.Count - 1 do
    Zip.AddFiles( FFileList[i]);

  Comment := edTitle.Text + #13#10 +
             edInpxName.Text + #13#10 +
             edCode.Text + #13#10 +
             edDescr.Text +  #13#10 +
             edURL.Text +  #13#10 + mmScript.Text;

  Zip.Comment := Comment;
  Zip.CloseArchive;
end;

procedure TfrmMain.ReadINI;
var
  INF:TIniFile;
begin
  INF:=TIniFile.Create(FAppPath+'\sql2inpx.ini');
  try
    dlgOpen.InitialDir := INF.ReadString('SYSTEM','FOLDER','');
    idFTP.Host := INF.ReadString('FTP','HOST','');
    idFTP.Username := INF.ReadString('FTP','USERNAME','');
    idFTP.Password := INF.ReadString('FTP','PASSWORD','');
    FFTPDir := INF.ReadString('FTP','DIR','/');
  finally
    INF.Free;
  end;
end;

procedure TfrmMain.SaveINI;
begin
end;

procedure TfrmMain.SaveProfile(FN: string);
var
  F : TIniFile;
begin
  try
    F := TIniFile.Create(FAppPath + edShort.Text + '.profile');
    F.WriteString('DATA','Script', StringReplace(mmScript.Text, #13#10, #4, [rfReplaceAll]));
    F.WriteString('DATA','Tables', StringReplace(mmTables.Text, #13#10, #4, [rfReplaceAll]));
    F.WriteString('DATA','DBName',edBDName.Text);
    F.WriteString('DATA','SQLUtrl',edSQLUrl.Text);
    F.WriteString('DATA','URL',edURL.Text);
    F.WriteString('DATA','INPxName',edInpxName.Text);
    F.WriteString('DATA','UpdateName',edUpdateName.Text);
    F.WriteString('DATA','ExtraName',edExtraName.Text);
    F.WriteString('DATA','ExtraInfo',edExtraInfo.Text);
    F.WriteString('DATA','StartID',edStartID.Text);
    F.WriteString('DATA','Code',edCode.Text);
    F.WriteString('DATA','Descr',edDescr.Text);
    F.WriteString('DATA','Title',edTitle.Text);
    F.WriteString('DATA','Short',edShort.Text);
  finally
    F.Free;
  end;
end;

procedure TfrmMain.SetTableState(State: boolean);
begin
  Lib.Connection.Connected := State;
  Lib.Book.Active := State;
  Lib.Genre.Active := State;
  Lib.Series.Active := State;
  Lib.Avtor.Active := State;
end;

procedure TfrmMain.UploadToFTP;
begin
  Log('Upload to FTP');
  Log('--------------------------------------');
  idFTP.Connect;
  idFTP.ChangeDir(FFTPDir);
  Log(TimeToStr(Now) + ' Загрузка extra_update ...');
  idFTP.Put(FOutPath + edExtraName.Text + '.zip');
  Log(TimeToStr(Now) + ' Загрузка last_extra.info ...');
  idFTP.Put(FOutPath + edExtraInfo.Text);
  Log(TimeToStr(Now) + ' Готово');
end;

procedure TfrmMain.Version;
var
  L: TStringList;
  Year,Month,Day: word;
begin
  L := TStringList.Create;
  try
    DecodeDate(Now,Year,Month,Day);
    L.Add(Format('%d%.2d%.2d',[Year,Month,Day]));
    L.SaveToFile(FAppPath+'\LIBRUSEC_INP\version.info');
    L.SaveToFile(FAppPath+'\ARCH\last_' + edShort.Text + '.info');
    L.SaveToFile(FAppPath+'\ARCH\' + edExtraInfo.Text);
    L.SaveToFile(FAppPath+'\ARCH\last_usr.info');
  finally
    L.Free;
  end;
  FFileList.Add('version.info');
end;

function TfrmMain.ExecAndWait(const FileName,Params: String; const WinState: Word): boolean;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: String;
begin
  CmdLine := '' + Filename + ' ' + Params;
  FillChar(StartInfo, SizeOf(StartInfo), #0);
  with StartInfo do
  begin
    cb := SizeOf(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
  CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
  PChar(ExtractFilePath(Filename)),StartInfo,ProcInfo);
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Free the Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end
  else
    Application.MessageBox(PChar(Format(' Не удалось запустить %s ! ',[FileName])),'',mb_IconExclamation)
end;



end.
