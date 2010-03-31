unit unit_Downloader;

interface

uses
  Windows,
  Classes,
  SysUtils,
  Dialogs,
  IdHTTP,
  IdComponent,
  IdStack,
  IdStackConsts,
  IdWinsock2,
  IdMultipartFormData,
  DateUtils;

type
  TQueryKind = (qkGet, qkPost);

  EInvalidLogin = class(Exception);

  TCommand = record
    Code: Integer;
    Params: array [1 .. 5] of string;
  end;

  TSetCommentEvent = procedure(const Current, Total: string) of object;
  TProgressEvent = procedure(Current, Total: Integer) of object;

  TDownloader = class
  private
    FidHTTP: TidHttp;
    FParams: TIdMultiPartFormDataStream;
    FResponce: TMemoryStream;

    FOnSetProgress: TProgressEvent;
    FOnSetComment: TSetCommentEvent;

    FNewURL: string;
    FNoProgress: boolean;
    Canceled: boolean;
    FDownloadSize: Integer;

    FStartDate: TDateTime;
    FIgnoreErrors: boolean;

    FFile: string;

    // function CalcURI(Template: string):string;
    function DoDownload: boolean;
    function Query(Kind: TQueryKind; const URL: string): boolean;
    procedure AddParam(const Name: string; const Value: string);
    function CheckResponce: boolean;
    function CheckRedirect: boolean;
    function Pause(Time: Integer): boolean;

    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure HTTPRedirect(Sender: TObject; var dest: string; var NumRedirect: Integer; var Handled: boolean; var VMethod: string);

    procedure ProcessError(const LongMsg, ShortMsg, AFileName: string);

    procedure ParseCommand(S: string; out Command: TCommand);

  public
    constructor Create;
    destructor Destroy; override;

    function Download(BookID: Integer; DatabaseID: Integer): boolean;
    procedure Stop;

    property IgnoreErrors: boolean read FIgnoreErrors write FIgnoreErrors;

    property OnProgress: TProgressEvent read FOnSetProgress write FOnSetProgress;
    property OnSetComment: TSetCommentEvent read FOnSetComment write FOnSetComment;
  end;

implementation

uses
  Forms,
  unit_Globals,
  unit_Settings,
  dm_collection,
  dm_user,
  unit_Consts,
  unit_MHL_strings,
  unit_Messages;

const
  CommandList: array [0 .. 5] of string = ('ADD', 'GET', 'POST', 'REDIR', 'CHECK', 'PAUSE');
  Params: array [0 .. 2] of string = ('%USER%', '%PASS%', '%RESURL%');

  { TDownloader }

procedure TDownloader.AddParam(const Name: string; const Value: string);
begin
  FParams.AddFormField(Name, Value);
end;

{
  function TDownloader.CalcURI(Template: string):string;
  var
  S: string;
  begin
  dmCollection.FieldByName(0, LIB_ID_FIELD, S);
  StrReplace('%LIBID%', S, Template);
  Result := Template;
  end;
}

function TDownloader.CheckRedirect: boolean;
begin
  Result := (FNewURL <> '');
  if not Result then
    raise EInvalidLogin.Create('Неправильный логин/пароль');
end;

function TDownloader.CheckResponce: boolean;
var
  Path: string;
  Str: TStringList;
begin
  Path := ExtractFileDir(FFile);
  CreateFolders('', Path);
  FResponce.Position := 0;

  Str := TStringList.Create;
  try
    Str.LoadFromStream(FResponce);
    if Str.Count > 0 then
    begin
      if (Pos('<!DOCTYPE', Str[0]) <> 0) or (Pos('overload', Str[0]) <> 0) or (Pos('not found', Str[0]) <> 0) then
      begin
        ProcessError('Загрузка файла заблокирована сервером!' + #13 + ' Ответ сервера можно посмотреть в файле "server_error.html"', 'Заблокировано сервером', FFile);
        Str.SaveToFile(Settings.SystemFileName[sfServerErrorLog]);
      end
      else
      begin
        FResponce.SaveToFile(FFile);
        Result := TestArchive(FFile);
        if not Result then
          DeleteFile(PChar(FFile));
      end;
    end;
  finally
    Str.Free;
  end;
end;

constructor TDownloader.Create;
begin
  inherited Create;

  FidHTTP := TidHttp.Create;
  FidHTTP.OnWork := HTTPWork;
  FidHTTP.OnWorkBegin := HTTPWorkBegin;
  FidHTTP.OnWorkEnd := HTTPWorkEnd;
  FidHTTP.OnRedirect := HTTPRedirect;
  FidHTTP.HandleRedirects := True;

  SetProxySettings(FidHTTP);

  FIgnoreErrors := False;
end;

destructor TDownloader.Destroy;
begin
  FreeAndNil(FidHTTP);

  inherited Destroy;
end;

function TDownloader.Download(BookID: Integer; DatabaseID: Integer): boolean;
var
  Ext: string;
  FN: string;
  Folder: string;
  No: Integer;
begin
  Result := False;

  dmCollection.GetBookFileName(BookID, FN, Folder, Ext, No);

  if Ext = FB2_EXTENSION then
    dmCollection.GetBookFolder(BookID, FFile)
  else
  begin
    Folder := StringReplace(Folder, FB2ZIP_EXTENSION, Ext, []);
    FFile := DMUser.ActiveCollection.RootPath + Folder;
  end;

  if FileExists(FFile) or DoDownload then
  begin
    unit_Messages.BookLocalStatusChanged(BookID, DatabaseID, True);
    Result := True;
  end;
end;

procedure TDownloader.HTTPRedirect(Sender: TObject; var dest: string; var NumRedirect: Integer; var Handled: boolean; var VMethod: string);
begin
  if Pos('fb2.zip', dest) <> 0 then
    FNewURL := dest
  else
    FNewURL := '';
end;

procedure TDownloader.HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
var
  ElapsedTime: Cardinal;
  Speed: string;
begin
  if FNoProgress then
    Exit;

  if Canceled then
  begin
    FidHTTP.Disconnect;
    Exit;
  end;

  if FDownloadSize <> 0 then
    FOnSetProgress(AWorkCount * 100 div FDownloadSize, -1);

  ElapsedTime := SecondsBetween(Now, FStartDate);
  if ElapsedTime > 0 then
  begin
    Speed := FormatFloat('0.00', AWorkCount / 1024 / ElapsedTime);
    FOnSetComment(Format('Загрузка: %s Kb/s', [Speed]), '');
  end;
end;

procedure TDownloader.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  if FNoProgress then
    Exit;
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
  FOnSetProgress(1, -1);
end;

procedure TDownloader.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  if FNoProgress then
    Exit;
  FOnSetProgress(100, -1);
  FOnSetComment(rstrReadyMessage, '');
end;

function TDownloader.DoDownload: Boolean;
var
  CL: TStringList;
  Commands: array of TCommand;
  i: Integer;
begin
  CL := TStringList.Create;
  try
    CL.Text := DMUser.ActiveCollection.Script;
    SetLength(Commands, CL.Count);

    FParams := TIdMultiPartFormDataStream.Create;
    try
      FResponce := TMemoryStream.Create;
      try
        for i := 0 to CL.Count - 1 do
        begin
          if Canceled then
            Break;

          ParseCommand(CL[i], Commands[i]);
          case Commands[i].Code of
            0:
              begin
                AddParam(Commands[i].Params[1], Commands[i].Params[2]);
                Result := True;
              end;

            1:
              Result := Query(qkGet, Commands[i].Params[1]);

            2:
              Result := Query(qkPost, Commands[i].Params[1]);

            3:
              Result := CheckRedirect;

            4:
              Result := CheckResponce;

            5:
              Result := Pause(StrToInt(Commands[i].Params[1]));
          end;

          if not Result then
            Break;
        end;
      finally
        FResponce.Free;
      end;
    finally
      FParams.Free;
    end;
  finally
    CL.Free;
  end;
end;

procedure TDownloader.ParseCommand(S: string; out Command: TCommand);
var
  p, I: Integer;
  s1: string;

  t: string;
begin
  Command.Code := -1;

  dmCollection.CurrentLibID(t);
  StrReplace('%LIBID%', t, S);

  StrReplace('%USER%', DMUser.ActiveCollection.User, S);
  StrReplace('%PASS%', DMUser.ActiveCollection.Password, S);

  StrReplace('%URL%', DMUser.ActiveCollection.URL, S);
  StrReplace('%RESURL%', FNewURL, S);

  p := Pos(' ', S);
  if p <> 0 then
  begin
    s1 := Copy(S, 1, p - 1);
    Delete(S, 1, p);
  end
  else
    s1 := S;

  for I := 0 to 5 do
    if CommandList[I] = s1 then
    begin
      Command.Code := I;
      Break;
    end;

  p := Pos(' ', S);
  I := 1;
  while p <> 0 do
  begin
    s1 := Copy(S, 1, p - 1);
    Command.Params[I] := s1;
    Inc(I);
    Delete(S, 1, p);
    p := Pos(' ', S);
  end;

  if S <> '' then
    Command.Params[I] := S
end;

function TDownloader.Pause(Time: Integer): boolean;
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

function TDownloader.Query(Kind: TQueryKind; const URL: string): boolean;
begin
  Result := False;
  try
    case Kind of
      qkGet:
        begin
          FNoProgress := False;
          FidHTTP.Get(URL, FResponce);
        end;

      qkPost:
        begin
          FNoProgress := True;
          FidHTTP.Post(URL, FParams, FResponce);
        end;
    end;
    Result := True;
  except
    on E: EIdSocketError do
    begin
      case E.LastError of
        WSAHOST_NOT_FOUND:
          ProcessError('Закачка не удалась! Сервер не найден.', 'Ошибка ' + IntToStr(E.LastError), FFile);

        Id_WSAETIMEDOUT:
          ProcessError('Закачка не удалась! Превышено время ожидания.', 'Ошибка ' + IntToStr(E.LastError), FFile);
      else
        ProcessError('Закачка не удалась! Ошибка подключения.', 'Ошибка ' + IntToStr(E.LastError), FFile);
      end; // case
    end;

    on E: Exception do
      if (FidHTTP.ResponseCode <> 405) and not((FidHTTP.ResponseCode = 404) and (FNewURL <> '')) then
        ProcessError('Закачка не удалась! Сервер сообщает об ошибке "' + E.Message + '".' + #10#13, 'Код Ошибки ' + IntToStr(FidHTTP.ResponseCode), FFile)
      else
        Result := True;
  end; // try ... except
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
