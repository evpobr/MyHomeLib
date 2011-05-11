unit frm_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask, ComCtrls,
  ActnList, Menus, ZipForge, IdHTTP, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, RzShellDialogs, RzEdit, RzBtnEdt, RzStatus, RzPanel, files_list,
  XPMan, DBXCommon;

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
    Online1: TMenuItem;
    Extra1: TMenuItem;
    ExtraFTP1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
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
    aopFB2: TAction;
    Zip: TZipForge;
    dlgOpen: TOpenDialog;
    IdFTP: TIdFTP;
    HTTP: TIdHTTP;
    N13: TMenuItem;
    N14: TMenuItem;
    dbImport: TAction;
    aopExtra: TAction;
    aopExtraFTP: TAction;
    apSaveAs: TAction;
    apLoad: TAction;
    dbConnect: TAction;
    N15: TMenuItem;
    aopOnLine: TAction;
    dlgSave: TSaveDialog;
    N16: TMenuItem;
    apSave: TAction;
    GroupBox1: TGroupBox;
    edTitle: TLabeledEdit;
    edDescr: TLabeledEdit;
    edCode: TLabeledEdit;
    GroupBox2: TGroupBox;
    cbFb2Only: TCheckBox;
    cbOldFormat: TCheckBox;
    GroupBox3: TGroupBox;
    edInpxName: TLabeledEdit;
    edUpdateName: TLabeledEdit;
    edInfoName: TLabeledEdit;
    cbMaxCompress: TCheckBox;
    GroupBox4: TGroupBox;
    edExtraInfo: TLabeledEdit;
    edExtraName: TLabeledEdit;
    edStartID: TLabeledEdit;
    Описание: TGroupBox;
    edURL: TLabeledEdit;
    mmScript: TMemo;
    GroupBox5: TGroupBox;
    edFolder: TRzButtonEdit;
    dlgFolder: TRzSelectFolderDialog;
    RzVersionInfo1: TRzVersionInfo;
    RzStatusBar1: TRzStatusBar;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    FilesFinder: TFilesList;
    Label1: TLabel;
    edFileMask: TLabeledEdit;
    edIDSearch: TEdit;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    TabSheet3: TTabSheet;
    edSQLUrl: TLabeledEdit;
    edDBName: TLabeledEdit;
    GroupBox7: TGroupBox;
    mmTables: TMemo;
    GroupBox8: TGroupBox;
    mmQuery: TMemo;
    edMySQL: TLabeledEdit;
    dbImportExt: TAction;
    N17: TMenuItem;
    N18: TMenuItem;
    cbUseRole: TCheckBox;
    XPManifest1: TXPManifest;
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
    procedure apSaveAsExecute(Sender: TObject);
    procedure apLoadExecute(Sender: TObject);
    procedure dbConnectExecute(Sender: TObject);
    procedure aopOnLineExecute(Sender: TObject);
    procedure apSaveExecute(Sender: TObject);
    procedure edFolderButtonClick(Sender: TObject);
    procedure FilesFinderFile(Sender: TObject; const F: TSearchRec);
    procedure edIDSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbImportExtExecute(Sender: TObject);
    procedure cbUseRoleClick(Sender: TObject);
    procedure PagesChange(Sender: TObject);
  private
    { Private declarations }
    FAppPath: string;
    FBasesPath: string;
    FInpPath: string;
    FOutPath: string;

    FFileList: TStringList;
    FDownloadSize: Int64;
    FStartDate: Extended;
    FFTPDir: string;
    FProfileName: string;
    FMySQLPath: string;

    FZipList: TStringList;
    FUseInternal: Boolean;

    procedure SetTableState(State: Boolean);
    procedure EnableControls;
    procedure Disablecontrols;
    procedure Log(S: string; header: Boolean = false);
    procedure Pack(FN: string; Level: Integer);
    procedure UploadToFTP;

    procedure ReadINI;
    procedure SaveINI;
    procedure LoadProfile(FN: string);
    procedure SaveProfile(FN: string);
    function ExecAndWait(const FileName, Params: String;
      const WinState: Word): Boolean;
    procedure Version;
    procedure Connect;

    function ShortName(const FN: string): string;
    procedure OK;
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
  i, j, Max: Integer;
  S: string;
  Res: TStringList;
begin
  j := 0;
  Disablecontrols;
  Screen.Cursor := crHourGlass;
  Pages.ActivePageIndex := 3;
  Max := Lib.LastBookID;
  try
    Res := TStringList.Create;
    Log('Extra', true);
    for i := StrToInt(edStartID.Text) to Max do
    begin
      S := Lib.GetBookRecord(i, cbFb2Only.Checked);
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
    OK;
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
  UploadToFTP;
end;

procedure TfrmMain.aopFB2Execute(Sender: TObject);
const
  Filter = 'zip|*.zip';
var
  i, j: Integer;
  ArchItem: TZFArchiveItem;
  FN: string;
  BookID: Integer;
  S: string;
  Result: TStringList;
  EOF: boolean;
begin
  FZipList.Clear;
  if edFolder.Text = '' then
  begin
    dlgOpen.Filter := Filter;
    if not dlgOpen.Execute then
      Exit;
    FZipList.AddStrings(dlgOpen.Files);
  end
  else if FZipList.Count = 0 then
  begin
    FilesFinder.TargetPath := edFolder.Text;
    FilesFinder.Mask := edFileMask.Text;
    FilesFinder.Process;
  end;

  Disablecontrols;
  Pages.ActivePageIndex := 3;
  Result := TStringList.Create;
  Screen.Cursor := crHourGlass;
  FFileList.Clear;
  Log('Zip', true);
  try
    for i := 0 to FZipList.Count - 1 do
    begin
      FN := ExtractFileName(FZipList[i]);
      Log(TimeToStr(Now) + ' ' + FN + '...');
      Zip.FileName := FZipList[i];
      Zip.OpenArchive;
      Result.Clear;
      j := 0;
      if (Zip.FindFirst('*.*', ArchItem, faAnyFile - faDirectory)) then
        repeat
          try
            S := '';
            if (ExtractFileExt(ArchItem.FileName) = '.fb2') then
            begin
              try
                BookID := StrToInt(ShortName(ArchItem.FileName));
                S := Lib.GetBookRecord(BookID);
              except
                on E: Exception do
                  if cbOldFormat.Checked then
                    S := Lib.GetBookRecord(ShortName(ArchItem.FileName), true,
                      true)
                  else
                    S := Lib.GetBookRecord(ArchItem.FileName, true, false);
              end;
              if S = '' then
                S := 'неизвестный,автор,:other:0' + ShortName
                  (ArchItem.FileName) + 'fb21899-12-30';
            end
            else // не фб2
              if not cbFb2Only.Checked then
            begin
              try
                BookID := StrToInt(ShortName(ArchItem.FileName));
                S := Lib.GetBookRecord(BookID);
              except
                on E: Exception do
                  if cbOldFormat.Checked then
                    S := Lib.GetBookRecord(ShortName(ArchItem.FileName), true,
                      true)
                  else
                    S := Lib.GetBookRecord(ArchItem.FileName, true, false);
              end;
              if S = '' then
                S := 'неизвестный,автор,:other:0' + ShortName
                  (ArchItem.FileName) + '' + ExtractFileExt
                  (ArchItem.FileName) + '1899-12-30';
            end
            else // если только fb2
              S := 'неизвестный,автор,:other:01899-12-30';

            Result.Add(S);
            inc(j);
            if (j mod 100) = 0 then
            begin
              lblS1.Caption := 'Обработано ' + IntToStr(j);
              Application.ProcessMessages;
              //Result.SaveToFile(FInpPath + FN + '.inp', TEncoding.UTF8);
            end;
            EOF := Zip.FindNext(ArchItem);
          except
//            on TDBXError do
//            begin
//              Sleep(20000);
//              Connect;
//            end;
          end;
        until (not EOF);
        FN := ShortName(FN);
      Result.SaveToFile(FInpPath + FN + '.inp', TEncoding.UTF8);
      FFileList.Add(FN + '.inp');
      Bar.Position := round((i + 1) / FZipList.Count * 100);
      OK;
    end;
    // FFileList.Add('extra.inp');
    Log(TimeToStr(Now) + ' ' + 'Упаковка ...');
    Version;

    if edInpxName.Text <> '' then
      if cbMaxCompress.Checked then
        Pack(edInpxName.Text + '.inpx', 9)
      else
        Pack(edInpxName.Text + '.inpx', 0);

    if edUpdateName.Text <> '' then
      Pack(edUpdateName.Text + '.zip', 9);
    OK;
    Log(TimeToStr(Now) + ' ' + 'Готово');
  finally
    EnableControls;
    Screen.Cursor := crDefault;
    Result.Free;
  end;
end;

procedure TfrmMain.aopOnLineExecute(Sender: TObject);
var
  i, j, Max: Integer;
  S: string;
  Window: Integer;
  FN: string;
  Res: TStringList;
begin
  i := 1;
  Window := 999;
  Disablecontrols;
  Screen.Cursor := crHourGlass;
  Pages.ActivePageIndex := 3;
  Max := StrToInt(edStartID.Text);
  FFileList.Clear;
  try
    Res := TStringList.Create;
    Log('OnLine', true);
    while i < Max do
    begin
      if (i + Window) > Max then
        Window := Max - i;
      FN := Format('%.6d-%.6d.inp', [i, i + Window]);
      Log(FN + '...');
      Res.Clear;
      for j := i to i + Window do
      begin
        S := Lib.GetBookRecord(j, cbFb2Only.Checked);
        if S <> '' then
          Res.Add(S);
        if ((j - 1) mod 100) = 0 then
        begin
          lblS1.Caption := 'Добавленно ' + IntToStr(j - i);
          Application.ProcessMessages;
        end;
      end;
      Res.SaveToFile(FInpPath + FN, TEncoding.UTF8);
      FFileList.Add(FN);
      inc(i, Window + 1);
      Bar.Position := round((i + 1) / Max * 100);
      Bar.Repaint;
      OK;
    end; // main for
    Log(TimeToStr(Now) + ' ' + 'Упаковка ...');
    Version;
    Pack(edInpxName.Text + '.inpx', 9);
    OK;
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
  dlgOpen.InitialDir := FAppPath;
  dlgOpen.Filter := Filter;
  if not dlgOpen.Execute then
    Exit;
  LoadProfile(dlgOpen.FileName);
  FProfileName := dlgOpen.FileName;
  frmMain.Caption := 'SQL2Inpx: ' + ShortName(ExtractFileName(FProfileName));
  Connect;
end;

procedure TfrmMain.apSaveAsExecute(Sender: TObject);
begin
  dlgSave.InitialDir := FAppPath;
  if dlgSave.Execute then
  begin
    SaveProfile(dlgSave.FileName);
    FProfileName := dlgSave.FileName;
    frmMain.Caption := 'SQL2Inpx: ' + ShortName(ExtractFileName(FProfileName));
  end;
end;

procedure TfrmMain.apSaveExecute(Sender: TObject);
begin
  SaveProfile(FProfileName);
end;

procedure TfrmMain.cbUseRoleClick(Sender: TObject);
begin
  Lib.UseAuthorRole := cbUseRole.Checked;
end;

procedure TfrmMain.Commands;
var
  i: Integer;
begin
  FUseInternal := true;
  if ParamCount = 0 then
    Exit;
  i := 1;
  while i <= ParamCount do
  begin
    if ParamStr(i) = '-mysql' then
      FUseInternal := false;
    if ParamStr(i) = '-dump' then
      dbImportExecute(nil);
    if ParamStr(i) = '-extra' then
      aopExtraExecute(nil);
    if ParamStr(i) = '-ftp' then
      UploadToFTP;
    if ParamStr(i) = '-arch' then
      aopFB2Execute(frmMain);
    if ParamStr(i) = '-l' then
    begin
      FZipList.LoadFromFile(FAppPath + ParamStr(i + 1));
      inc(i);
    end;
    if ParamStr(i) = '-p' then
    begin
      FProfileName := FAppPath + ParamStr(i + 1) + '.profile';
      try
        LoadProfile(FProfileName);
        Connect;
        frmMain.Caption := 'SQL2Inpx: ' + ParamStr(i + 1);
      except
        Log('Ошибка загрузки профиля ' + FProfileName);
      end;
      inc(i);
    end;
    if ParamStr(i) = '-c' then Close;
    inc(i);
  end;
end;

procedure TfrmMain.Connect;
begin
  Lib.Connection.Connected := false;
  Lib.Connection.Params.Values['Database']:= edDBName.Text;
  Disablecontrols;
  SetTableState(True);
end;

procedure TfrmMain.dbConnectExecute(Sender: TObject);
begin
  Connect;
end;

procedure TfrmMain.dbImportExecute(Sender: TObject);
var
  i: Integer;
  ArchName, DumpName: string;
  Responce: TMemoryStream;
  Params: string;

  CMD: TStringList;
begin
  Pages.ActivePageIndex := 3;
  Screen.Cursor := crHourGlass;
  try
    Responce := TMemoryStream.Create;
    CMD := TStringList.Create;
    Log('Загрузка и импорт дампа БД', true);
    for i := 0 to mmTables.Lines.Count - 1 do
    begin
      DumpName := FBasesPath + copy(mmTables.Lines[i], 1,
        Length(mmTables.Lines[i]) - 3);
      ArchName := FBasesPath + mmTables.Lines[i];
      Log(' Архив ' + mmTables.Lines[i] + ':');
      Log(TimeToStr(Now) + ' Загрузка ...');
      Responce.Clear;
      HTTP.Get(edSQLUrl.Text + mmTables.Lines[i], Responce);
      Responce.SaveToFile(ArchName);
      OK;
      Log(TimeToStr(Now) + ' Распаковка ...');
      ExecAndWait(FAppPath + '7za.exe', Format('e -y "%s" -o"%s"', [ArchName,
          FBasesPath]), 0);
      OK;
      Log(TimeToStr(Now) + ' Импорт ...');
      Responce.Clear;
      if FUseInternal then
      begin
        CMD.LoadFromFile(DumpName, TEncoding.UTF8);
        CMD.SaveToStream(Responce);
        Responce.Seek(0, soFromBeginning);
      end
      else
        CMD.Clear;
      CMD.Add(Format('"%s" -h localhost --user=%s --password=%s %s < "%s"', [edMySQL.Text,
          Lib.Connection.Params.Values['UserName'], Lib.Connection.Params.Values['Password'], edDBName.Text, DumpName]));
      CMD.SaveToFile(FAppPath + 'import.bat');
      ExecAndWait(FAppPath + 'import.bat', '', 0);
      OK;
    end;
    if mmQuery.Lines.Count > 0 then
      try
        Log(TimeToStr(Now) + ' ' + 'Постобработка ...');
        Lib.Query.SQL.Clear;
        Lib.Query.SQL.AddStrings(mmQuery.Lines);
        Lib.Query.ExecSQl;
      except
        Log('Ошибка постобработки');
      end;
    Log(TimeToStr(Now) + ' ' + 'Готово');
  finally
    Responce.Free;
    CMD.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.dbImportExtExecute(Sender: TObject);
begin
  FUseInternal := false;
  dbImportExecute(Sender);
  FUseInternal := true;
end;

procedure TfrmMain.Disablecontrols;
begin
  Lib.Book.Disablecontrols;
  Lib.Genre.Disablecontrols;
  Lib.Series.Disablecontrols;
  Lib.Avtor.Disablecontrols;
end;


procedure TfrmMain.DumpRestoreProgress(Sender: TObject; Percent: Integer);
begin
  Bar.Position := Percent;
end;

procedure TfrmMain.edIDSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if edIDSearch.Text <> '' then
      Lib.GetBookRecord(StrToInt(edIDSearch.Text))
    else
      Lib.ShowAll;
end;

procedure TfrmMain.EnableControls;
begin
  Lib.Book.EnableControls;
  Lib.Genre.EnableControls;
  Lib.Series.EnableControls;
  Lib.Avtor.EnableControls;
end;

procedure TfrmMain.FilesFinderFile(Sender: TObject; const F: TSearchRec);
begin
  if ExtractFileExt(F.Name) = '.zip' then
    FZipList.Add(IncludeTrailingPathdelimiter(edFolder.Text) + F.Name);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetTableState(false);
  FFileList.Free;
  FZipList.Free;
  SaveINI;
  mmLog.Lines.SaveToFile(FProfileName + '.log');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FAppPath := IncludeTrailingPathdelimiter
    (ExtractFilePath(Application.ExeName));
  FInpPath := FAppPath + 'LIBRUSEC_INP\';
  FBasesPath := FAppPath + 'BASES\';
  FOutPath := FAppPath + 'ARCH\';
  ReadINI;
  FFileList := TStringList.Create;
  FZipList := TStringList.Create;
  FUseInternal := true;
  Pages.ActivePageIndex := 0;
end;

procedure TfrmMain.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  ElapsedTime: Cardinal;
  Speed: string;
begin
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
  Bar.Position := 0;
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
end;

procedure TfrmMain.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Bar.Position := 0;
  lblS1.Caption := '';
end;

procedure TfrmMain.LoadProfile(FN: string);
var
  F: TMemIniFile;
begin
  try
    F := TMemIniFile.Create(FN);
    F.Encoding := TEncoding.UTF8;
    mmScript.Text := StringReplace(F.ReadString('DATA', 'Script', ''), #4,
      #13#10, [rfReplaceAll]);
    mmTables.Text := StringReplace(F.ReadString('DATA', 'Tables', ''), #4,
      #13#10, [rfReplaceAll]);
    mmQuery.Text := StringReplace(F.ReadString('DATA', 'Post-Query', ''), #4,
      #13#10, [rfReplaceAll]);
    edDBName.Text := F.ReadString('DATA', 'DBName', '');
    edSQLUrl.Text := F.ReadString('DATA', 'SQLUtrl', '');
    edURL.Text := F.ReadString('DATA', 'URL', '');
    edInpxName.Text := F.ReadString('DATA', 'INPxName', '');
    edUpdateName.Text := F.ReadString('DATA', 'UpdateName', '');
    edExtraName.Text := F.ReadString('DATA', 'ExtraName', '');
    edExtraInfo.Text := F.ReadString('DATA', 'ExtraInfo', '');
    edStartID.Text := F.ReadString('DATA', 'StartID', '');
    edCode.Text := F.ReadString('DATA', 'Code', '');
    edDescr.Text := F.ReadString('DATA', 'Descr', '');
    edTitle.Text := F.ReadString('DATA', 'Title', '');
    edFolder.Text := F.ReadString('DATA', 'Folder', '');
    edFileMask.Text := F.ReadString('DATA', 'FileMask', '*.zip');
    edInfoName.Text := F.ReadString('DATA', 'Info name', '');
    cbFb2Only.Checked := F.ReadBool('DATA', 'Fb2Only', true);
    cbMaxCompress.Checked := F.ReadBool('DATA', 'MaxCompress', false);
    cbOldFormat.Checked := F.ReadBool('DATA', 'oldFormat', false);
    cbUseRole.Checked := F.ReadBool('DATA', 'UseRole', false);

    Lib.UseAuthorRole := cbUseRole.Checked;
  finally
    F.Free;
  end;
end;

procedure TfrmMain.Log(S: string; header: Boolean);
const
  hr = '+-----------------------------------------------------------------------+';
begin
  if header then
  begin
    mmLog.Lines.Add(hr);
    S := '                                    ' + S;
    mmLog.Lines.Add(S);
    mmLog.Lines.Add(hr);
  end
  else
    mmLog.Lines.Add(S);
end;

procedure TfrmMain.OK;
begin
  mmLog.Lines[mmLog.Lines.Count - 1] := mmLog.Lines[mmLog.Lines.Count - 1]
    + 'OK';
end;

procedure TfrmMain.Pack(FN: string; Level: Integer);
var
  i: Integer;
  Comment: string;
  SL: TStringList;
begin

  Comment := edTitle.Text + #13#10 + edInpxName.Text + #13#10 + edCode.Text +
    #13#10 + edDescr.Text + #13#10 + edURL.Text + #13#10 + mmScript.Text;

  SL := TStringList.Create;
  try
    SL.Text := Comment;
    SL.SaveToFile(FInpPath + 'collection.info', TEncoding.UTF8);
    FFileList.Add('collection.info');
  finally
    SL.Free;
  end;

  if FileExists(FOutPath + FN) then
    DeleteFile(FOutPath + FN);



  if Level = 0 then
    Zip.CompressionLevel := clNone
  else
    Zip.CompressionLevel := clMax;

  Zip.FileName := FOutPath + FN;
  Zip.OpenArchive(fmCreate);
  Zip.BaseDir := FInpPath;
  for i := 0 to FFileList.Count - 1 do
    Zip.AddFiles(FFileList[i]);


  Zip.Comment := String(Comment);
  Zip.CloseArchive;
end;

procedure TfrmMain.PagesChange(Sender: TObject);
begin
  if Pages.ActivePageIndex = 1 then
      Lib.AllowScrool := True
    else Lib.AllowScrool := False;
end;

procedure TfrmMain.ReadINI;
var
  INF: TIniFile;
begin
  INF := TIniFile.Create(FAppPath + 'sql2inpx.ini');
  try
    dlgOpen.InitialDir := INF.ReadString('SYSTEM', 'FOLDER', '');
    IdFTP.Host := INF.ReadString('FTP', 'HOST', '');
    IdFTP.Username := INF.ReadString('FTP', 'USERNAME', '');
    IdFTP.Password := INF.ReadString('FTP', 'PASSWORD', '');
    FFTPDir := INF.ReadString('FTP', 'DIR', '/');

    edMySQL.Text := INF.ReadString('SYSTEM', 'MYSQL', edMySQL.Text);

    Lib.Connection.Params.Values['UserName']:= INF.ReadString('MySQL', 'User', 'lib');
    Lib.Connection.Params.Values['Password'] := INF.ReadString('MySQL', 'Pass', 'lib');
  finally
    INF.Free;
  end;
end;

procedure TfrmMain.edFolderButtonClick(Sender: TObject);
begin
  if dlgFolder.Execute then
    edFolder.Text := dlgFolder.SelectedPathName;
end;

procedure TfrmMain.SaveINI;
var
  F: TIniFile;
begin
  F := TIniFile.Create(FAppPath + 'sql2inpx.ini');
  try
    F.WriteString('SYSTEM', 'FOLDER', ExtractFilePath(dlgOpen.FileName));
    F.WriteString('SYSTEM', 'MYSQL', edMySQL.Text);
    F.WriteString('MySQL', 'User', Lib.Connection.Params.Values['UserName']);
    F.WriteString('MySQL', 'Pass', Lib.Connection.Params.Values['Password']);
  finally
    F.Free;
  end;
end;

procedure TfrmMain.SaveProfile(FN: string);
var
  F: TMemIniFile;
begin
  try
    F := TMemIniFile.Create(FN);
    F.Encoding := TEncoding.UTF8;
    F.WriteString('DATA', 'Script', StringReplace(mmScript.Text, #13#10, #4,
        [rfReplaceAll]));
    F.WriteString('DATA', 'Tables', StringReplace(mmTables.Text, #13#10, #4,
        [rfReplaceAll]));
    F.WriteString('DATA', 'Post-Query', StringReplace(mmQuery.Text, #13#10, #4,
        [rfReplaceAll]));
    F.WriteString('DATA', 'DBName', edDBName.Text);
    F.WriteString('DATA', 'SQLUtrl', edSQLUrl.Text);
    F.WriteString('DATA', 'URL', edURL.Text);
    F.WriteString('DATA', 'INPxName', edInpxName.Text);
    F.WriteString('DATA', 'UpdateName', edUpdateName.Text);
    F.WriteString('DATA', 'ExtraName', edExtraName.Text);
    F.WriteString('DATA', 'ExtraInfo', edExtraInfo.Text);
    F.WriteString('DATA', 'StartID', edStartID.Text);
    F.WriteString('DATA', 'Code', edCode.Text);
    F.WriteString('DATA', 'Descr', edDescr.Text);
    F.WriteString('DATA', 'Title', edTitle.Text);
    F.WriteString('DATA', 'Info name', edInfoName.Text);
    F.WriteString('DATA', 'Folder', edFolder.Text);
    F.WriteString('DATA', 'FileMask', edFileMask.Text);
    F.WriteBool('DATA', 'Fb2Only', cbFb2Only.Checked);
    F.WriteBool('DATA', 'MaxCompress', cbMaxCompress.Checked);
    F.WriteBool('DATA', 'oldFormat', cbOldFormat.Checked);
    F.WriteBool('DATA', 'UseRole', cbUseRole.Checked);
    F.UpdateFile;

  finally
    F.Free;
  end;
end;

procedure TfrmMain.SetTableState(State: Boolean);
begin
  Lib.Connection.Connected := State;

  Lib.Query.SQL.Text := 'SELECT B.BookId, B.Title, B.FileSize, B.FileType, B.Deleted, B.Time, B.Lang, B.KeyWords FROM libbook B';
  Lib.Query.Active := State;

  Lib.Book.Active := State;
  Lib.cdsLibBook.Active := State;

  Lib.Genre.Active := State;
  Lib.cdsGenre.Active := State;

  Lib.Series.Active := State;
  Lib.cdsSeries.Active := State;

  Lib.Avtor.Active := State;
  Lib.cdsAvtor.Active := State;
end;

function TfrmMain.ShortName(const FN: string): string;
var
  p: Integer;
  Ext: string;
begin
  Ext := ExtractFileExt(FN);
  Result := copy(FN, 1, Length(FN) - Length(Ext));
end;

procedure TfrmMain.UploadToFTP;
begin
  Log('Upload to FTP', true);
  IdFTP.Connect;
  IdFTP.ChangeDir(FFTPDir);
  Log(TimeToStr(Now) + ' Загрузка ' + edExtraName.Text + ' ...');
  IdFTP.Put(FOutPath + edExtraName.Text + '.zip');
  OK;
  Log(TimeToStr(Now) + ' Загрузка ' + edExtraInfo.Text + ' ...');
  IdFTP.Put(FOutPath + edExtraInfo.Text);
  OK;
  Log(TimeToStr(Now) + ' Готово');
  IdFTP.Disconnect;
end;

procedure TfrmMain.Version;
var
  L: TStringList;
  Year, Month, Day: Word;
begin
  L := TStringList.Create;
  try
    DecodeDate(Now, Year, Month, Day);
    L.Add(Format('%d%.2d%.2d', [Year, Month, Day]));
    L.SaveToFile(FAppPath + '\LIBRUSEC_INP\version.info');
    if edInfoName.Text <> '' then
      L.SaveToFile(FAppPath + '\ARCH\' + edInfoName.Text);
    if edExtraInfo.Text <> '' then
      L.SaveToFile(FAppPath + '\ARCH\' + edExtraInfo.Text);
  finally
    L.Free;
  end;
  FFileList.Add('version.info');
end;

function TfrmMain.ExecAndWait(const FileName, Params: String;
  const WinState: Word): Boolean;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: String;

begin
  CmdLine := '"' + FileName + '" ' + Params;

  FillChar(StartInfo, SizeOf(StartInfo), #0);
  with StartInfo do
  begin
    cb := SizeOf(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    PChar(ExtractFilePath(FileName)), StartInfo, ProcInfo);
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Free the Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end
  else
    Application.MessageBox(PChar(Format(' Не удалось запустить %s ! ',
          [FileName])), '', mb_IconExclamation)
end;

end.
