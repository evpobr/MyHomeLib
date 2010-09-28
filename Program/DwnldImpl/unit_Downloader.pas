(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors             Aleksey Penkov   alex.penkov@gmail.com
  *                     Nick Rymanov     nrymanov@gmail.com
  * Created             
  * Description         
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

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
  unit_Globals;

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

    function DoDownload(const BookRecord: TBookRecord): Boolean;

    function AddParam(const Name: string; const Value: string): Boolean;
    function Query(Kind: TQueryKind; const URL: string): Boolean;
    function CheckRedirect: boolean;
    function CheckResponce: boolean;
    function Pause(Time: Integer): boolean;

    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure HTTPRedirect(Sender: TObject; var dest: string; var NumRedirect: Integer; var Handled: boolean; var VMethod: string);

    procedure ProcessError(const LongMsg, ShortMsg, AFileName: string);

    procedure ParseCommand(ConstParams: TStringList; S: string; out Command: TCommand);

  public
    constructor Create;
    destructor Destroy; override;

    function Download(const BookKey: TBookKey): boolean;
    procedure Stop;

    property IgnoreErrors: Boolean read FIgnoreErrors write FIgnoreErrors;

    property OnProgress: TProgressEvent read FOnSetProgress write FOnSetProgress;
    property OnSetComment: TSetCommentEvent read FOnSetComment write FOnSetComment;
  end;

implementation

uses
  Forms,
  StrUtils,
  DateUtils,
  unit_Settings,
  unit_Consts,
  unit_MHL_strings,
  unit_Messages,
  unit_Helpers,
  unit_SystemDatabase,
  unit_Interfaces;

resourcestring
  rstrWrongCredentials = 'Неправильный логин/пароль';
  rstrDownloadBlockedByServer = 'Загрузка файла заблокирована сервером!' + CRLF + ' Ответ сервера можно посмотреть в файле "server_error.html"';
  rstrBlockedByServer = 'Заблокировано сервером';
  rstrSpeed = 'Загрузка: %s Kb/s';
  rstrDownloadError = 'Ошибка закачки';
  rstrServerNotFound = 'Закачка не удалась! Сервер не найден.';
  rstrError = 'Ошибка ';
  rstrTimeout = 'Закачка не удалась! Превышено время ожидания.';
  rstrConnectionError = 'Закачка не удалась! Ошибка подключения.';
  rstrServerError = 'Закачка не удалась! Сервер сообщает об ошибке "%s".' + CRLF;
  rstrErrorCode = 'Код Ошибки ';

const
  CommandList: array [0 .. 5] of string = ('ADD', 'GET', 'POST', 'REDIR', 'CHECK', 'PAUSE');
  Params: array [0 .. 2] of string = ('%USER%', '%PASS%', '%RESURL%');

{ TDownloader }

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

function TDownloader.AddParam(const Name: string; const Value: string): Boolean;
begin
  FParams.AddFormField(Name, Value);
  Result := True;
end;

function TDownloader.CheckRedirect: boolean;
begin
  Result := (FNewURL <> '');
  if not Result then
    raise EInvalidLogin.Create(rstrWrongCredentials);
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
        ProcessError(rstrDownloadBlockedByServer, rstrBlockedByServer, FFile);
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

function TDownloader.Download(const BookKey: TBookKey): boolean;
var
  BookRecord: TBookRecord;
begin
  Result := False;

  GetSystemData.GetActiveCollection.GetBookRecord(BookKey, BookRecord, False);
  FFile := BookRecord.GetBookFileName;
  if FileExists(FFile) or DoDownload(BookRecord) then
  begin
    GetSystemData.GetActiveCollection.SetLocal(BookKey, True);
    unit_Messages.BookLocalStatusChanged(BookKey, True);
    Result := True;
  end;
end;

procedure TDownloader.HTTPRedirect(Sender: TObject; var dest: string; var NumRedirect: Integer; var Handled: boolean; var VMethod: string);
begin
  if EndsText(FB2ZIP_EXTENSION, dest) then
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
    FOnSetComment(Format(rstrSpeed, [Speed]), '');
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

function TDownloader.DoDownload(const BookRecord: TBookRecord): Boolean;
var
  ConstParams: TStringList;
  CL: TStringList;
  Commands: array of TCommand;
  i: Integer;
  SystemData: ISystemData;
begin
  SystemData := GetSystemData;

  ConstParams := TStringList.Create;
  try
    //
    // TODO: достаточно стремная операция - получение информации из глобальных объектов. Убрать нафиг!!!
    //
    ConstParams.Values['LIBID'] := BookRecord.LibID;
    ConstParams.Values['USER'] := GetSystemData.GetActiveCollectionInfo.User;
    ConstParams.Values['PASS'] := GetSystemData.GetActiveCollectionInfo.Password;
    ConstParams.Values['URL'] := GetSystemData.GetActiveCollectionInfo.URL;

    CL := TStringList.Create;
    try
      CL.Text := GetSystemData.GetActiveCollectionInfo.Script;
      SetLength(Commands, CL.Count);

      FParams := TIdMultiPartFormDataStream.Create;
      try
        FResponce := TMemoryStream.Create;
        try
          for i := 0 to CL.Count - 1 do
          begin
            if Canceled then
              Break;

            ParseCommand(ConstParams, CL[i], Commands[i]);
            case Commands[i].Code of
              0: Result := AddParam(Commands[i].Params[1], Commands[i].Params[2]);
              1: Result := Query(qkGet, Commands[i].Params[1]);
              2: Result := Query(qkPost, Commands[i].Params[1]);
              3: Result := CheckRedirect;
              4: Result := CheckResponce;
              5: Result := Pause(StrToInt(Commands[i].Params[1]));
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
  finally
    ConstParams.Free;
  end;
end;

procedure TDownloader.ParseCommand(ConstParams: TStringList; S: string; out Command: TCommand);
var
  p, i: Integer;
  s1: string;
begin
  Command.Code := -1;

  StrReplace('%LIBID%',  ConstParams.Values['LIBID'], S);
  StrReplace('%USER%',   ConstParams.Values['USER'], S);
  StrReplace('%PASS%',   ConstParams.Values['PASS'], S);
  StrReplace('%URL%',    ConstParams.Values['URL'], S);
  StrReplace('%RESURL%', FNewURL, S);

  p := Pos(' ', S);
  if p <> 0 then
  begin
    s1 := Copy(S, 1, p - 1);
    Delete(S, 1, p);
  end
  else
    s1 := S;

  for i := 0 to 5 do
  begin
    if CommandList[i] = s1 then
    begin
      Command.Code := i;
      Break;
    end;
  end;

  p := Pos(' ', S);
  i := 1;
  while p <> 0 do
  begin
    s1 := Copy(S, 1, p - 1);
    Command.Params[i] := s1;
    Inc(i);
    Delete(S, 1, p);
    p := Pos(' ', S);
  end;

  if S <> '' then
    Command.Params[i] := S
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
    Application.MessageBox(PChar(LongMsg), PChar(rstrDownloadError));
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
          ProcessError(rstrServerNotFound, rstrError + IntToStr(E.LastError), FFile);

        Id_WSAETIMEDOUT:
          ProcessError(rstrTimeout, rstrError + IntToStr(E.LastError), FFile);
      else
        ProcessError(rstrConnectionError, rstrError + IntToStr(E.LastError), FFile);
      end; // case
    end;

    on E: Exception do
      if (FidHTTP.ResponseCode <> 405) and not((FidHTTP.ResponseCode = 404) and (FNewURL <> '')) then
        ProcessError(Format(rstrServerError, [E.Message]), rstrErrorCode + IntToStr(FidHTTP.ResponseCode), FFile)
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
