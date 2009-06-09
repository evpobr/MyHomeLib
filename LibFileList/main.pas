unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzShellDialogs, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, RzPrgres, StdCtrls,IdMultipartFormData,Inifiles,
  ZipForge, ExtCtrls, RzPanel, RzTabs, ZipMstr, IdExplicitTLSClientServerBase,
  IdFTP, IdIntercept, IdLogBase, IdLogFile;

type
  TfrmMain = class(TForm)
    IdAntiFreeze1: TIdAntiFreeze;
    HTTP: TIdHTTP;
    dlgOpen: TRzOpenDialog;
    Zip: TZipMaster;
    Panel1: TPanel;
    pcPages: TRzPageControl;
    TabSheet1: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    Label3: TLabel;
    edURLfb2: TEdit;
    TabSheet2: TRzTabSheet;
    mmLog: TMemo;
    RzGroupBox4: TRzGroupBox;
    edExtraURL: TEdit;
    edExtra: TEdit;
    TabSheet3: TRzTabSheet;
    pbProgress: TRzProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    btnStart: TButton;
    btnStop: TButton;
    Button2: TButton;
    edURLUSR: TEdit;
    pbDownload: TRzProgressBar;
    Label4: TLabel;
    IdFTP: TIdFTP;
    cbFTP: TCheckBox;
    procedure btnStartClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnStopClick(Sender: TObject);

    procedure DownloadSQL;
    procedure GetExtra;
    procedure GetVersion;
    procedure Extra;

    procedure Pack_Extra;
    procedure Pack_FB2;
    procedure Pack_USR;

    procedure Pack(FN, Comment: string);
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);

  private
    FileList : TStringList;

    procedure CreateINP(URL: string; USR: boolean);
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
  end;

var
  frmMain: TfrmMain;
  AppPath:string;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmMain.CreateINP(URL: string; USR: boolean);
var
  FN, S:string;
  PostParams:TStringList;
  i,j:integer;
  Response:TStringStream;
  mpfds: TIdMultiPartFormDataStream;


begin
  if not dlgOpen.Execute then  Exit;

  FOnProgress := True;

  FileList.Clear;

  btnStart.Enabled := False;
  btnStop.Enabled := True;

  FDoStop := False;

  pbProgress.Percent:=0;
  pbProgress.Repaint;

  try
    AppPath:=ExtractFileDir(Application.ExeName);
    PostParams:=TStringList.Create;

    GetVersion;

    //-----------------------------------------------------------
    //             Подготовка запрос
    //-----------------------------------------------------------

    Label1.Caption:='Формирование запроса ...';
    for I:=0 to dlgOpen.Files.Count - 1 do
    begin
      if FDoStop then Break;

      mpfds:=TIdMultiPartFormDataStream.Create;

      try
        Zip.ZipFileName:=dlgOpen.Files[i];
        FN:=ExtractFileName(dlgOpen.Files[i]);

        Label2.Caption:=FN; Label2.Repaint;

        mpfds.AddFormField('Folder',copy(FN,1,Length(FN)-4));
        for j:=0 to Zip.Count-1 do
        begin
          with ZipDirEntry(Zip.ZipContents[j]^) do
          begin
            if not USR then
              S := copy(FileName,1,Length(FileName)-4)
            else
              S := FileName;
            if S <>'' then
              mpfds.AddFormField('files['+IntToStr(j)+']',S);
          end;
        end;

      //  отправка

      Label1.Caption:='Отправка запроса ...';
      Label1.Repaint;
      response:=TstringStream.Create('');
      HTTP.Post(URL,mpfds,Response);
      PostParams.Clear;

      // обработка результата

      PostParams.Add(Response.DataString);
      PostParams.SaveToFile(AppPath+'\LIBRUSEC_INP\'+copy(FN,1,Length(FN)-4)+'.inp');
      Label1.Caption:='Готово';Label1.Repaint;

      FileList.Add(AppPath+'\LIBRUSEC_INP\'+copy(FN,1,Length(FN)-4)+'.inp');

      finally
        mpfds.Free;
      end;
      pbProgress.Percent:=round((i)/(dlgOpen.Files.Count)*100);
      pbProgress.Repaint;
    end;
  finally
    pbProgress.Percent:=100;
    FOnProgress := False;
    btnStop.Caption := 'Выйти';
    Label1.Caption:='Готово';
    FDoStop := False;

    btnStart.Enabled := True;
    btnStop.Enabled := False;

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
  mmLog.Lines.Add('Скачивание базы ...');
  try
    List.LoadFromFile(AppPath + '\lib.rus.ec.txt');
    Response := TMemoryStream.Create;
    try
      for I := 0 to List.Count - 1 do
      begin
        mmLog.Lines.Add(List[i] + ' ...');
        Response.Clear;
        HTTP.Get(List[i],Response);
        FileName := Format('%s\Bases\%d.sql.gz',[AppPath,i]);
        Response.SaveToFile(FileName);

        mmLog.Lines.Add('Распаковка  ...');
        ExecAndWait(AppPath + '\7za.exe','e ' + FileName,0);

      end;
    finally
      Response.Free;
    end;

    mmLog.Lines.Add('Импорт  ...');
    ExecAndWait(AppPath + '\import.bat','',0);
    mmLog.Lines.Add('Готово');

    for i := 0 to List.Count - 1 do
      DeleteFile(Format('%s\%d.sql',[AppPath,i]));

  finally
    List.Free;
  end;


end;

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  case pcPages.ActivePageIndex of
    0: begin
         CreateINP(edURLFb2.Text, False);
         Pack_FB2;
       end;
    1: begin
         Extra;
         Pack_Extra;
         if  cbFTP.Checked then UPloadToFtp;
       end;
    2: begin
         CreateINP(edURLUSR.Text, True);
         Pack_USR;
       end;
  end;
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  FDoStop := True;
end;

procedure TfrmMain.UploadToFtp;
begin
  idFTP.Connect;
  idFTP.ChangeDir(FFTPDir);
  idFTP.Put(AppPath+'\ARCH\extra_update.zip');
  idFTP.Put(AppPath+'\ARCH\last_extra.info');
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  UploadToFTP;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  INF:TIniFile;
begin
  INF:=TIniFile.Create(AppPath+'\libfilelist.ini');
  INF.WriteString('SYSTEM','URL_FB2',edURLFB2.Text);
  INF.WriteString('SYSTEM','URL_USR',edURLUSR.Text);
  INF.WriteString('SYSTEM','ID',edExtra.Text);
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
begin
  AppPath:=ExtractFileDir(Application.ExeName);
  INF:=TIniFile.Create(AppPath+'\libfilelist.ini');
  try
    edURLFB2.Text := INF.ReadString('SYSTEM','URL_FB2','http://localhost');
    edURLUSR.Text := INF.ReadString('SYSTEM','URL_USR','http://localhost');
    edExtra.Text := INF.ReadString('SYSTEM','ID','0');
    dlgOpen.InitialDir := INF.ReadString('SYSTEM','FOLDER','');

    idFTP.Host := INF.ReadString('FTP','HOST','');
    idFTP.Username := INF.ReadString('FTP','USERNAME','');
    idFTP.Password := INF.ReadString('FTP','PASSWORD','');
    FFTPDir := INF.ReadString('FTP','DIR','home-lib.net/test/');

  finally
    INF.Free;
  end;
  FileList := TStringList.Create;
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
    Label1.Caption:='Отправка запроса ... ';Label1.Repaint;
    HTTP.Get(edExtraURL.Text + '?Start=' + edExtra.Text,Response);
    Result.Add(UTF8Decode(Response.DataString));
    Label1.Caption:='Сохранение ... ';Label1.Repaint;
    Result.SaveToFile(AppPath+'\LIBRUSEC_INP\extra.inp',TEncoding.UTF8);
    Label1.Caption:='Готово';Label1.Repaint;
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
  Application.ProcessMessages;

  if FDownloadSize <> 0 then
    pbDownload.Percent := AWorkCount * 100 div FDownloadSize;

  ElapsedTime := SecondsBetween(Now, FStartDate);
  if ElapsedTime > 0 then
  begin
    Speed := FormatFloat('0.00', AWorkCount / 1024 / ElapsedTime);
    Label4.Caption := Format('Загрузка: %s Kb/s', [Speed]);
  end;

end;

procedure TfrmMain.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  pbDownload.Percent := 0;
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
end;

procedure TfrmMain.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  pbDownload.Percent := 0;
  Label4.Caption := '';
end;

procedure TfrmMain.IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  mmLog.Lines.Add('Подключение к FTP');
end;

procedure TfrmMain.IdFTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  mmLog.Lines.Add('Передача завершена');
end;

procedure TfrmMain.Pack(FN, Comment: string);
begin
  if FileExists(AppPath + '\ARCH\' + FN) then
    DeleteFile(AppPath + '\ARCH\' + FN);

  Zip.ZipFileName := AppPath + '\ARCH\' + FN;
  Zip.FSpecArgs.Assign(FileList);

  Zip.ZipComment := Comment;

  Zip.Add;
end;

procedure TfrmMain.Pack_Extra;
begin
  FileList.Clear;
  FileList.Add(AppPath + '\LIBRUSEC_INP\extra.inp');
  FileList.Add(AppPath + '\LIBRUSEC_INP\version.info');
  Pack('extra_update.zip','');
end;

procedure TfrmMain.Pack_FB2;
begin
  Pack('librusec_update.zip','');

  Zip.AddCompLevel := 0;
  Pack('librusec.inpx','');
  Zip.AddCompLevel := 9;
end;

procedure TfrmMain.Pack_USR;
begin
  Pack('usr_update.zip','');
  Pack('librusec_usr.inpx', 'lib.rus.ec USR'+ #13#10 +
                            'librusec_usr' +  #13#10 +
                            '65537');
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


procedure TfrmMain.Extra;
begin
  mmLog.Clear;
  DownloadSQL;
  mmLog.Lines.Add('Создание extra  ...');
  GetExtra;
  GetVersion;
  mmLog.Lines.Add('Готово  ...');
end;

end.
