unit unit_Downloader;

interface

uses
  Classes,
  SysUtils,
  Dialogs,
  IdHTTP,
  IdComponent,
  IdStack,
  IdStackConsts,
  IdMultipartFormData,
  DateUtils;

type

  TQueryKind = (qkGet, qkPost);
  EInvalidLogin = class (Exception);


  TCommand = record
               Code: integer;
               Params: array [1..5] of string;
             end;

  TSetCommentEvent = procedure(const Current, Total: string) of object;
  TProgressEvent = procedure(Current, Total: Integer) of object;

  TDownloader = class
  private
    FidHTTP : TidHttp;
    FParams: TIdMultiPartFormDataStream;
    FResponce: TMemoryStream;

    FSetProgress: TProgressEvent;
    FSetComment: TSetCommentEvent;

    FNewURL: string;
    FNoProgress: boolean;
    Canceled: boolean;
    FDownloadSize: integer;

    FStartDate : TDateTime;
    FIgnoreErrors: boolean;
    FCatchRedirect: boolean;

    FFile: string;

    function CalcURI(Template: string):string;
    function Main: boolean;
    function Query(Kind: TQueryKind; URL: string):boolean;
    procedure AddParam(Name, Value: string);
    function CheckResponce: boolean;
    function CheckRedirect: boolean;
    function Pause(Time: integer):boolean;

    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure HTTPRedirect(Sender: TObject; var dest: string; var NumRedirect: Integer; var Handled: Boolean; var VMethod: string);

    procedure Set_OnSetComment(const Value: TSetCommentEvent);
    procedure Set_OnProgress(const Value: TProgressEvent);

    procedure ProcessError(const LongMsg, ShortMsg, AFileName: string);

    procedure ParseCommand(S: string; out Command: TCommand);
  public
    constructor Create;
    destructor Free;
    function Download(ID: integer):boolean;
    procedure Stop;
    property IgnoreErrors: boolean read FIgnoreErrors write FIgnoreErrors;

    property OnSetComment:TSetCommentEvent write Set_OnSetComment;
    property OnProgress:TProgressEvent write Set_OnProgress;
  end;

implementation

uses
  Forms,
  unit_globals,
  unit_settings,
  dm_collection,
  dm_user,
  unit_Consts;

const
   CommandList: array [0..5] of string = ('ADD','GET','POST','REDIR', 'CHECK', 'PAUSE');
   Params :     array [0..2] of string = ('%USER%', '%PASS%', '%RESURL%');

{ TDownloader }

procedure TDownloader.AddParam(Name, Value: string);
begin
  FParams.AddFormField(Name, Value);
end;

function TDownloader.CalcURI(Template: string):string;
var
  S: string;
begin
  dmCollection.FieldByName(0, 'LibId', S);
  StrReplace('%LIBID%', S, Template);
  Result := Template;
end;

function TDownloader.CheckRedirect: boolean;
begin
  Result := (FNewURL <> '');
  if not Result then raise EInvalidLogin.Create('Неправильный логин/пароль');
end;

function TDownloader.CheckResponce: boolean;
var
  Path: string;
  Str: TStringList;
begin
  Path := ExtractFileDir(FFile);
  CreateFolders('', Path);
  FResponce.Position := 0;
  Str := TstringList.Create;
  try
    Str.LoadFromStream(FResponce);
    if Str.Count > 0 then
    begin
      if (Pos('<!DOCTYPE', Str[0]) <> 0)
         or (Pos('overload', Str[0]) <> 0)
         or (Pos('not found', Str[0]) <> 0) then
      begin
        ProcessError(
              'Загрузка файла заблокирована сервером!' + #13 + ' Ответ сервера можно посмотреть в файле "server_error.html"',
              'Заблокировано сервером',
              FFile
              );
        Str.SaveToFile(Settings.SystemFileName[sfServerErrorLog]);
      end
      else
      begin
        FResponce.SaveToFile(FFile);
        Result := TestArchive(FFile);
        if not Result then DeleteFile(PChar(FFile));
      end;
    end;
  finally
    Str.Free;
  end;
end;

constructor TDownloader.Create;
begin
  FidHTTP := TIdHTTP.Create;
  FidHTTP.OnWork := HTTPWork;
  FidHTTP.OnWorkBegin := HTTPWorkBegin;
  FidHTTP.OnWorkEnd := HTTPWorkEnd;
  FidHTTP.OnRedirect := HTTPRedirect;
  FidHTTP.HandleRedirects := True;

  SetProxySettings(FidHTTP);
  FIgnoreErrors := False;
end;

function TDownloader.Download(ID: integer): boolean;
var
  Ext: string;
  FN: string;
  Folder: string;
  No: integer;
begin
  Result := False;
  dmCollection.GetBookFileName(ID, FN, Folder, Ext, No);
  if Ext = FB2_EXTENSION then
    dmCollection.GetBookFolder(ID, FFile)
  else
  begin
    Folder := StringReplace(Folder, '.fb2.zip', Ext, []);
    FFile := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder) + Folder;
  end;

  if FileExists(FFile) then
  begin
    dmCollection.SetLocalStatus(ID, True);
    Result := True;
  end
  else
    if Main then
    begin
      dmCollection.SetLocalStatus(ID, True);
      Result := True;
    end;
end;

destructor TDownloader.Free;
begin
  FidHTTP.Free;
end;

procedure TDownloader.HTTPRedirect(Sender: TObject; var dest: string;
  var NumRedirect: Integer; var Handled: Boolean; var VMethod: string);
begin
  if pos('fb2.zip', dest) <> 0 then
    FNewURL := dest
  else
    FNewURL := '';
end;

procedure TDownloader.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  ElapsedTime: Cardinal;
  Speed: string;
begin
  if FNoProgress then Exit;

  if Canceled then
  begin
    FidHTTP.Disconnect;
    Exit;
  end;

  if FDownloadSize <> 0 then
    FSetProgress(AWorkCount * 100 div FDownloadSize, -1);

  ElapsedTime := SecondsBetween(Now, FStartDate);
  if ElapsedTime > 0 then
  begin
    Speed := FormatFloat('0.00', AWorkCount / 1024 / ElapsedTime);
    FSetComment(Format('Загрузка: %s Kb/s', [Speed]), '');
  end;
end;

procedure TDownloader.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  if FNoProgress then Exit;
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
  FSetProgress(1, -1);
end;

procedure TDownloader.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  if FNoProgress then Exit;
  FSetProgress(100, -1);
  FSetComment('Готово', '');
end;

function TDownloader.Main: boolean;
var
  URL: string;
  CL: TStringList;
  Commands : array of TCommand;
  Command: TCommand;
  I: Integer;
begin
  CL := TStringList.Create;
  try
    CL.Text := DMUser.ActiveCollection.Script;
    SetLength(Commands, CL.Count);
    FParams := TIdMultiPartFormDataStream.Create;
    FResponce := TMemoryStream.Create;
    for I := 0 to CL.Count - 1 do
    begin
      if Canceled then Break;
      ParseCommand(CL[i], Commands[i]);
      with Commands[i] do
        case Code of
          0: begin
               AddParam(Params[1], Params[2]);
               Result := True;
             end;
          1: Result := Query(qkGet, Params[1]);
          2: Result := Query(qkPost, Params[1]);
          3: Result := CheckRedirect;
          4: Result := CheckResponce;
          5: Result := Pause(StrToInt(Params[1]));
        end;
      if not Result then Break;
    end;
  finally
    FParams.Free;
    FResponce.Free;
    CL.Free;
  end;
end;

procedure TDownloader.ParseCommand;
var
  p, i: integer;
  s1, s2: string;

  t: string;
begin
  Command.Code := -1;

  dmCollection.FieldByName(0, 'LibId', t);
  StrReplace('%LIBID%', t, S);

  StrReplace('%USER%', DMUser.ActiveCollection.User, S);
  StrReplace('%PASS%', DMUser.ActiveCollection.Password, S);

  StrReplace('%URL%',  DMUser.ActiveCollection.URL, S);
  StrReplace('%RESURL%', FNewURL, S);

  p := pos(' ', S);
  if p <> 0 then
  begin
    s1 := copy(S,1, p - 1);
    Delete(S, 1, p);
  end
  else
    s1 := S;

  for I := 0 to 5 do
    if CommandList[i] = s1 then
    begin
      Command.Code := i;
      Break;
    end;

  p := pos(' ', S); i := 1;
  while p <> 0 do
  begin
    s1 := copy(S,1, p - 1);
    Command.Params[i] := s1;
    inc(i);
    Delete(S, 1, p);
    p := pos(' ', S);
  end;
  if S <> '' then Command.Params[i] := S
end;

function TDownloader.Pause(Time: integer): boolean;
begin
  Sleep(Time);
  Result := True;
end;

procedure TDownloader.ProcessError(const LongMsg, ShortMsg, AFileName: string);
var
  F: Text;
  FileName: string;
begin
  if Settings.ErrorLog then
  begin
    FileName := Settings.SystemFileName[sfDownloadErrorLog];
    AssignFile(F, FileName);
    if FileExists(FileName) then
      Append(F)
    else
      Rewrite(F);
    Writeln(F, Format('%s %s >> %s', [DateTimeToStr(Now), ShortMsg, AFileName]));
    CloseFile(F);
  end;
  if not FIgnoreErrors then
    Application.MessageBox(PChar(LongMsg), 'Ошибка закачки');
end;

function TDownloader.Query(Kind: TQueryKind; URL: string):boolean;
begin
  Result := False;
  try
    case Kind of
      qkGet : begin
                FNoProgress := False;
                FidHTTP.Get(URL, FResponce);
              end;

      qkPost: begin
                FNoProgress := True;
                FidHTTP.Post(URL, FParams,FResponce);
              end;
    end;
    Result := True;
  except
    on E: EIdSocketError do
    begin
      case E.LastError of
        11001: ProcessError('Закачка не удалась! Сервер не найден.', 'Ошибка ' + IntToStr(E.LastError), FFile);
        Id_WSAETIMEDOUT: ProcessError('Закачка не удалась! Превышено время ожидания.', 'Ошибка ' + IntToStr(E.LastError), FFile);
        else
          ProcessError('Закачка не удалась! Ошибка подключения.', 'Ошибка ' + IntToStr(E.LastError), FFile);
      end; // case
    end;
    on E: Exception do
      if (FidHTTP.ResponseCode <> 405) and  not ((FidHTTP.ResponseCode = 404) and (FNewURL <> ''))
      then
        ProcessError('Закачка не удалась! Сервер сообщает об ошибке "' + E.Message + '".' + #10#13, 'Код Ошибки ' + IntToStr(FidHTTP.ResponseCode), FFile)
      else
        Result := True;
  end; // try ... except
end;

procedure TDownloader.Set_OnProgress(const Value: TProgressEvent);
begin
  FSetProgress := Value;
end;

procedure TDownloader.Set_OnSetComment(const Value: TSetCommentEvent);
begin
  FSetComment := Value;
end;

procedure TDownloader.Stop;
begin
  try
    FidHTTP.Disconnect;
  except
    //
  end;
end;

end.
