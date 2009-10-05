unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzShellDialogs, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, RzPrgres, StdCtrls,IdMultipartFormData,Inifiles,
  ZipForge, ExtCtrls, RzPanel, RzTabs, IdExplicitTLSClientServerBase,
  IdFTP, IdIntercept, IdLogBase, IdLogFile, RzEdit, RzButton, ImgList, RzLabel;

type
  TfrmMain = class(TForm)
    IdAntiFreeze1: TIdAntiFreeze;
    HTTP: TIdHTTP;
    dlgOpen: TRzOpenDialog;
    IdFTP: TIdFTP;
    RzPanel1: TRzPanel;
    pbProgress: TRzProgressBar;
    Button2: TButton;
    btnStop: TButton;
    RzPanel2: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    ImageList: TImageList;
    btnExtra: TRzToolButton;
    btnSettings: TRzToolButton;
    btnFb2: TRzToolButton;
    btnUsr: TRzToolButton;
    btnDownload: TRzToolButton;
    mmLog: TRzMemo;
    lblStatus: TRzLabel;
    Zip: TZipForge;
    procedure Button2Click(Sender: TObject);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnStopClick(Sender: TObject);

    procedure DownloadSQL;
    procedure GetExtra;
    procedure GetVersion;

    procedure Pack_Extra;
    procedure Pack_FB2;
    procedure Pack_USR;

    procedure Pack(FN, Comment: string);
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormDestroy(Sender: TObject);
    procedure IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure btnDownloadClick(Sender: TObject);
    procedure btnFb2Click(Sender: TObject);
    procedure btnExtraClick(Sender: TObject);
    procedure btnUsrClick(Sender: TObject);

  private
    FileList : TStringList;
    FStartExtraID: Integer;

    procedure CreateINP(URL: string; USR: boolean; SaveResult: boolean);
    procedure Log(S: string);

    function ExecAndWait(const FileName, Params: String;
      const WinState: Word): boolean;
    procedure UploadToFtp;
    { Private declarations }
  public
    { Public declarations }


    FOnProgress: boolean;
    FDoStop: boolean;
    FDownloadSize : integer;
    FStartDate: TDateTime;
    FFTPDir: string;

    FUsrScriptURL : string;
    FFb2ScriptURL : string;
    FExtraScriptURL : string;

    FOnDownload : boolean;

    procedure CommandLine;

  end;

var
  frmMain: TfrmMain;
  AppPath:string;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmMain.CommandLine;
var
  i: integer;
begin
  if ParamCount > 0 then
    for I := 1 to ParamCount do
    begin
      if ParamStr(i) = '-dump' then btnDownloadClick(nil);
      if ParamStr(i) = '-extra' then btnExtraClick(nil);
      if ParamStr(i) = '-ftp' then UploadToFtp;
    end;
end;

procedure TfrmMain.CreateINP(URL: string; USR: boolean; SaveResult: boolean);
const
  Window = 2000;
var
  FN:string;
  S : UTF8String;
  ResultsList:TStringList;
  i,j,k:integer;
  Response:TStringStream;
  mpfds: TIdMultiPartFormDataStream;
  Max: integer;
  Zip: TZipForge;
  ArchItem: TZFArchiveItem;
  Ext : String;
begin
  if not dlgOpen.Execute then  Exit;
  FOnProgress := True;
  FileList.Clear;
  btnStop.Enabled := True;
  FDoStop := False;
  pbProgress.Percent:=0;
  pbProgress.Repaint;
  try
    AppPath:=ExtractFileDir(Application.ExeName);
    ResultsList:=TStringList.Create;
    GetVersion;
    for I:=0 to dlgOpen.Files.Count - 1 do
    begin
      //-----------------------------------------------------------
      //             Подготовка запроса
      //-----------------------------------------------------------
      lblStatus.Caption:='Формирование запроса ...';

      Zip := TZipForge.Create(self);

      Zip.FileName:=dlgOpen.Files[i];
      Zip.OpenArchive;
      FN:=ExtractFileName(dlgOpen.Files[i]);
      Log(FN);
      k := 0; j := 0;
      ResultsList.Clear;

      if FDoStop then Break;
      mpfds:=TIdMultiPartFormDataStream.Create;
      try

       Zip.Options.OEMFileNames := False;

        if (Zip.FindFirst('*.*',ArchItem,faAnyFile-faDirectory)) then
        repeat
          mpfds.AddFormField('Folder',copy(FN,1,Length(FN)-4));
          Ext := ExtractFileExt(ArchItem.FileName);
          S := UTF8Encode(copy(ArchItem.FileName,1,Length(ArchItem.FileName) - Length(Ext)));
          if S <>'' then
               mpfds.AddFormField('files['+IntToStr(j)+']',S);
          if USR then
          begin
            Delete(Ext,1,1); // удаляем точку в начале
            mpfds.AddFormField('extentions['+IntToStr(j)+']',UTF8Encode(Ext));
          end;
          inc(j);
        until (not Zip.FindNext(ArchItem));
          //  отправка запроса
        lblStatus.Caption:='Отправка запроса ...';
        lblStatus.Repaint;
        response:=TstringStream.Create('');
        try
          HTTP.Post(URL,mpfds,Response);
          ResultsList.Clear;
          ResultsList.Add(Response.DataString);
        finally
          response.Free;
        end;
      finally
        mpfds.Free;
      end;

      pbProgress.Percent:=round(i/(dlgOpen.Files.Count)*100);
      pbProgress.Repaint;
      if SaveResult then
        ResultsList.SaveToFile(AppPath+'\LIBRUSEC_INP\'+copy(FN,1,Length(FN)-4)+'.inp');

      lblStatus.Caption:='Готово';lblStatus.Repaint;
      FileList.Add(copy(FN,1,Length(FN)-4)+'.inp');

      pbProgress.Percent:=round((i + 1)/(dlgOpen.Files.Count)*100);
      pbProgress.Repaint;
    end; // main for

    if not USR then FileList.Add('extra.inp');
    FileList.Add('structure.info');

  finally
    pbProgress.Percent:=100;
    FOnProgress := False;
    lblStatus.Caption:='Готово';
    FDoStop := False;
    btnStop.Enabled := False;
    FreeAndNil(Zip);
  end;
end;


procedure TfrmMain.DownloadSQL;
var
  List: TStringList;
  i: integer;
  Response:TMemoryStream;
  FileName: string;

begin
  List := TStringList.Create;
  mmLog.Lines.Add('Скачивание базы.');
  try
    List.LoadFromFile(AppPath + '\lib.rus.ec.txt');
    Response := TMemoryStream.Create;
    try
      for I := 0 to List.Count - 1 do
      begin
        Log(Format('%s (%d из %d):',[List[i], i + 1, List.Count]));
        Response.Clear;
        Log('Скачивание ...');
        HTTP.Get(List[i],Response);
        FileName := Format('%s\Bases\%d.sql.gz',[AppPath,i]);
        Response.SaveToFile(FileName);

        Log('Распаковка  ...');
        ExecAndWait(AppPath + '\7za.exe','e ' + FileName,0);

      end;
    finally
      Response.Free;
    end;

    mmLog.Lines.Add('Импорт дампа ...');
    ExecAndWait(AppPath + '\import.bat','',0);
    mmLog.Lines.Add('Готово');

    for i := 0 to List.Count - 1 do
      DeleteFile(Format('%s\%d.sql',[AppPath,i]));

  finally
    List.Free;
  end;
end;

procedure TfrmMain.btnDownloadClick(Sender: TObject);
begin
  FOnDownload := True;
  DownloadSQL;
  FOnDownload := False;
end;

procedure TfrmMain.btnExtraClick(Sender: TObject);
var
  S: string;
begin
  if FStartExtraID = 0 then
  begin
    S := InputBox('Extra', 'Смещение', IntToStr(FStartExtraID));
    if S = '' then Exit
      else FStartExtraID := StrToInt(S);
  end;

  Log('Создание extra  ...');
  GetExtra;
  GetVersion;
  Log('Готово  ...');
  Pack_Extra;
end;

procedure TfrmMain.btnFb2Click(Sender: TObject);
begin
  CreateINP(FFb2ScriptURL, False, True);
  Pack_FB2;
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  FDoStop := True;
end;

procedure TfrmMain.btnUsrClick(Sender: TObject);
begin
  Log('Создание Librusec_USR');
  Log('Обработка архивов:');
  CreateINP(FUsrScriptURL, True, True);
  Log('Упаковка inpx ... ');
  Pack_USR;
  Log('Готово ');
end;

procedure TfrmMain.UploadToFtp;
begin
  idFTP.Connect;
  idFTP.ChangeDir(FFTPDir);
  Log('Загрузка extra_update ...');
  idFTP.Put(AppPath+'\ARCH\extra_update.zip');
  Log('Загрузка last_extra.info ...');
  idFTP.Put(AppPath+'\ARCH\last_extra.info');
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  INF:TIniFile;
begin
  INF:=TIniFile.Create(AppPath+'\libfilelist.ini');
  INF.WriteString('SYSTEM','URL_FB2',FFb2ScriptURL);
  INF.WriteString('SYSTEM','URL_USR',FUsrScriptURL);
  INF.WriteString('SYSTEM','URL_EXTRA',FExtraScriptURL);
  INF.WriteInteger('EXTRA','START_ID',FStartExtraID);
  INF.WriteString('SYSTEM','FOLDER',ExtractFilePath(dlgOpen.FileName));
  INF.Free;
  Close;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  GetExtra;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  INF:TIniFile;
  i: integer;
begin
  AppPath:=ExtractFileDir(Application.ExeName);
  INF:=TIniFile.Create(AppPath+'\libfilelist.ini');
  try
    FFb2ScriptURL := INF.ReadString('SYSTEM','URL_FB2','http://localhost/get_inp_fb2.php');
    FUSRScriptURL:= INF.ReadString('SYSTEM','URL_USR','http://localhost/get_inp_usr.php');
    FExtraScriptURL:= INF.ReadString('SYSTEM','URL_EXTRA','http://localhost/get_extra.php');
    FStartExtraID := INF.ReadInteger('EXTRA','START_ID',0);
    dlgOpen.InitialDir := INF.ReadString('SYSTEM','FOLDER','');

    idFTP.Host := INF.ReadString('FTP','HOST','');
    idFTP.Username := INF.ReadString('FTP','USERNAME','');
    idFTP.Password := INF.ReadString('FTP','PASSWORD','');
    FFTPDir := INF.ReadString('FTP','DIR','/');

  finally
    INF.Free;
  end;
  FileList := TStringList.Create;
  FOnDownload := False;

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FileList.Free;
end;

procedure TfrmMain.GetExtra;
var
  Result : TStringList;
  Response:TStringStream;
begin
  Response := TStringStream.Create;
  Result := TStringList.Create;
  try
    lblStatus.Caption:='Отправка запроса ... ';lblStatus.Repaint;
    HTTP.Get(FExtraScriptURL + '?Start=' + IntToStr(FStartExtraID),Response);
    Result.Add(UTF8Decode(Response.DataString));
    lblStatus.Caption:='Сохранение ... ';lblStatus.Repaint;
    Result.SaveToFile(AppPath+'\LIBRUSEC_INP\extra.inp',TEncoding.UTF8);
    lblStatus.Caption:='Готово';lblStatus.Repaint;
  finally
    Response.Free;
    Result.Free;
  end;
end;

procedure TfrmMain.GetVersion;
var
  L: TStringList;
  Year,Month,Day: word;
begin
  L := TStringList.Create;
  try
    DecodeDate(Now,Year,Month,Day);
    L.Add(Format('%d%.2d%.2d',[Year,Month,Day]));
    L.SaveToFile(AppPath+'\LIBRUSEC_INP\version.info');
    L.SaveToFile(AppPath+'\ARCH\last_librusec.info');
    L.SaveToFile(AppPath+'\ARCH\last_extra.info');
    L.SaveToFile(AppPath+'\ARCH\last_usr.info');
  finally
    L.Free;
  end;

  FileList.Add(AppPath+'\LIBRUSEC_INP\version.info');

end;



procedure TfrmMain.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  ElapsedTime: Cardinal;
  Speed: string;
begin
  if not   FOnDownload  then exit;

  Application.ProcessMessages;

  if FDownloadSize <> 0 then
    pbProgress.Percent := AWorkCount * 100 div FDownloadSize;

  ElapsedTime := SecondsBetween(Now, FStartDate);
  if ElapsedTime > 0 then
  begin
    Speed := FormatFloat('0.00', AWorkCount / 1024 / ElapsedTime);
    lblStatus.Caption := Format('Загрузка: %s Kb/s', [Speed]);
  end;

end;

procedure TfrmMain.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  if not FOnDownload then Exit;
  pbProgress.Percent := 0;
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
end;

procedure TfrmMain.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  if not FOnDownload then Exit;
  pbProgress.Percent := 0;
  lblStatus.Caption := '';
end;

procedure TfrmMain.IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  Log('Подключение к FTP');
end;

procedure TfrmMain.IdFTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Log('Передача завершена');
end;

procedure TfrmMain.Log(S: string);
begin
  mmLog.Lines.Add(S);
end;

procedure TfrmMain.Pack(FN, Comment: string);
var i: integer;

begin
  if FileExists(AppPath + '\ARCH\' + FN) then
    DeleteFile(AppPath + '\ARCH\' + FN);

  Zip.FileName := AppPath + '\ARCH\' + FN;
  Zip.OpenArchive(fmCreate);
  Zip.BaseDir := AppPath + '\LIBRUSEC_INP\';
  for I := 0 to FileList.Count - 1 do
    Zip.AddFiles( FileList[i]);

  Zip.Comment := Comment;
  Zip.CloseArchive;

end;

procedure TfrmMain.Pack_Extra;
begin
  FileList.Clear;
  FileList.Add('extra.inp');
  FileList.Add('version.info');
  FileList.Add('structure.info');
  Pack('extra_update.zip','');
end;

procedure TfrmMain.Pack_FB2;
begin
  Pack('librusec_update.zip','');
  Zip.CompressionLevel := clNone;
  Pack('librusec.inpx','');
  Zip.CompressionLevel := clMax;
end;

procedure TfrmMain.Pack_USR;
begin
  Pack('usr_update.zip','');
  Pack('librusec_usr.inpx', 'lib.rus.ec USR'+ #13#10 +
                            'librusec_usr' +  #13#10 +
                            '65537' +  #13#10 +
                            'Архивы библиотеки lib.rus.ec (не-FB2)');
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
