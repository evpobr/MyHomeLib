{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit unit_DownloadBooksThread;

interface

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_globals,
  Dialogs,
  ZipMstr,
  ABSMain,
  IdHTTP,
  Forms,
  IdComponent,
  IdHTTPHeaderInfo;

type

  TURLParams = record
                 Param: String;
                 Field: String;
  end;

  TDownloadProgressEvent = procedure (Current,Total: Integer) of object;
  TDownloadSetCommentEvent = procedure (const Current, Total: string) of object;

  TDownloadBooksThread = class(TWorker)
  private
    FidHTTP:TidHTTP;

    FBookIdList: TBookIdList;
    FCollectionRoot: string;
    FDownloadSize: integer;

    FOnSetProgress: TDownloadProgressEvent;
    FOnSetComment: TDownloadSetCommentEvent;

    FCurrentComment: string;
    FTotalComment: string;
    FCurrentProgress: Integer;
    FTotalProgress: Integer;

    FStartDate : TDateTime;
    FIgnoreErrors: boolean;

    function DownloadBook(ID:integer): Boolean;

    procedure SetComment(const Current, Total: string);
    procedure DoSetComment;
    procedure DoSetProgress;
    procedure SetProgress(Current, Total: integer);

    procedure ProcessError(const LongMsg, ShortMsg, AFileName: string);
    function CalculateURL:String;

    function Get_HTTP:TidHTTP;

  protected
    procedure WorkFunction; override;
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax:Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);

  public
    property BookIdList: TBookIdList read FBookIdList write FBookIdList;

    property HTTP:TidHTTP read Get_HTTP;

    property OnProgress: TDownloadProgressEvent read FOnSetProgress write FOnSetProgress;
    property OnSetComment: TDownloadSetCommentEvent read FOnSetComment write FOnSetComment;

  end;

implementation

uses
  Windows,
  dm_user,
  dm_main,
  unit_database,
  unit_Consts,
  unit_Settings,
  frm_main,
  StrUtils,
  idStack,
  idException,
  DateUtils;

procedure TDownloadBooksThread.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  ElapsedTime : Cardinal;
  Speed: string;

begin

  if Canceled then
  begin
    FidHTTP.Disconnect;
    Exit;
  end;

  if FDownloadSize <> 0 then
    SetProgress(AWorkCount * 100 div FDownloadSize, -1);

  ElapsedTime := SecondsBetween(Now,FStartDate);
  if ElapsedTime>0 then
  begin
    Speed := FormatFloat('0.00',AWorkCount/1024/ElapsedTime);
    SetComment(Format('Загрузка: %s Kb/s',[Speed]),'');
  end;
end;

procedure TDownloadBooksThread.HTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
  SetProgress(1,-1);
end;

procedure TDownloadBooksThread.HTTPWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
  SetProgress(100,-1);
  SetComment('Готово','');
end;

procedure TDownloadBooksThread.ProcessError(const LongMsg, ShortMsg, AFileName: string);
var
  F: Text;
  FileName: string;
begin
  if Settings.ErrorLog then
  begin
    FileName := Settings.AppPath + 'download_errors.log';
    Assign(F,FileName);
    if FileExists(FileName) then
      Append(F)
    else
      Rewrite(F);
    Writeln(F,Format('%s %s >> %s',[DateTimeToStr(Now), ShortMsg,AFileName]));
    CloseFile(F);
  end
  else
    if not FIgnoreErrors then ShowMessage(LongMsg,0);
end;

procedure TDownloadBooksThread.WorkFunction;
var
  i: Integer;
  totalBooks: Integer;
  Res : integer;

begin
  Canceled := False;
  FIgnoreErrors := False;

  FidHTTP := TidHTTP.Create(nil);
  FidHTTP.OnWork := HTTPWork;
  FidHTTP.OnWorkBegin := HTTPWorkBegin;
  FidHTTP.OnWorkEnd := HTTPWorkEnd;
  FidHTTP.HandleRedirects := True;

  with FidHTTP.ProxyParams do
  begin
    ProxyServer := Settings.ProxyServer;
    ProxyPort := Settings.ProxyPort;
    ProxyUsername := Settings.ProxyUsername;
    ProxyPassword := Settings.ProxyPassword;
  end;


  FCollectionRoot := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);
  try

    totalBooks := High(FBookIdList) + 1;
    SetComment(' ',Format('Скачано файлов: %u из %u', [0, totalBooks]));
    for i := 0 to totalBooks - 1 do
    begin
      SetComment('Подключение ...','');

      FBookIdList[i].Res := DownloadBook(FBookIdList[i].ID);
      if (not FBookIdList[i].Res) and (i < totalBooks - 1)
        and (not Settings.ErrorLog) and not FIgnoreErrors then
      begin
        Res := ShowMessage('Игнорировать ошибки загрузки ?' , MB_YESNOCANCEL);
        Canceled := (Res = IDCANCEL);
        FIgnoreErrors := (Res = IDYES);
      end;

      SetComment('Готово',Format('Скачано файлов: %u из %u', [i + 1, totalBooks]));
      SetProgress(100,(i + 1) * 100 div totalBooks);

      if Canceled then
      begin
        SetComment(' ','Завершение операции ...');
        Break;
      end;
    end;
  finally
    FidHTTP.Free;
  end;
end;

function TDownloadBooksThread.DownloadBook(ID:integer): Boolean;
var
  LibID: Integer;
  FS: TMemoryStream;
  loginInfo: TStringList;
  response: TStringStream;
  Path: String;
  Folder: String;
  URL: String;
begin
  Result := False;

  DMMain.GetBookFolder(ID,Folder);

  if FileExists(Folder) then
  begin
    DMMain.SetLocalStatus(ID,True);
    Result := True;
    Exit;
  end
  else Result := False;

  loginInfo := TStringList.Create;
  try
    response := TStringStream.Create('');
    try
      FS := TMemoryStream.Create;
      try

        try

         URL := CalculateURL; // Locate по таблице был сделан при вызове GetBookFileName,
                              // так что ID можно не передавать

          FidHTTP.Get(URL, FS);


          { TODO -oAlex : В зависимости от типа файла (zip или нет)
                          имя должно формироваться по разному! }

          if Canceled then
          begin
            Result := False;
            Exit;
          end;

          Path := ExtractFileDir(Folder);
          CreateFolders('', Path);

          FS.Position := 0;
          loginInfo.LoadFromStream(FS);

          { TODO : можно попробовать проверять размер файла. проблема в том, что база содержит размер неархивированного файла }

          if loginInfo.Count > 0 then
          begin
            if
              (Pos('DOCTYPE', loginInfo[0]) <> 0)
              or (Pos('overload', loginInfo[0]) <> 0)
              or (Pos('not found', loginInfo[0]) <> 0) then
            begin
              ProcessError('Загрузка файла заблокирована сервером!'
                             + #13 +
                             ' Ответ сервера можно посмотреть в файле "server_error.html"',
                             'Заблокировано сервером',Folder);
              logininfo.SaveToFile(Settings.SystemFileName[sfServerErrorLog]);
            end
            else
            begin
              FS.SaveToFile(Folder);

              DMMain.SetLocalStatus(ID,True);

              Result := True;
            end;
          end;
        except
          on E: EIdSocketError do
            if E.LastError = 11001 then
              ProcessError('Закачка не удалась! Сервер не найден.',
                           'Ошибка ' + IntToStr(E.LastError) ,Folder)
            else
              ProcessError('Закачка не удалась! Ошибка подключения.',
                            'Ошибка ' + IntToStr(E.LastError),Folder);
           on E: Exception do
             ProcessError('Закачка не удалась! Сервер сообщает об ошибке '+
                                    IntToStr(FidHTTP.ResponseCode)+'.',
                          'Ошибка ' + IntToStr(FidHTTP.ResponseCode), Folder);
        end;
      finally
        FS.Free;
      end;
    finally
      Response.Free;
    end;
  finally
    LoginInfo.Free;
  end;
end;

function TDownloadBooksThread.Get_HTTP: TidHTTP;
begin
  if Assigned(FidHTTP) then
     Result := FidHTTP;
end;

function TDownloadBooksThread.CalculateURL: String;
const
  Params: array [0..1] of TURLParams = (
                  (Param: '%ID%'; Field: 'LibID'),
                  (Param: '%FileName%'; Field: 'FileName')
                  );
var

  S:String;
  Template: String;
  Current: TURLParams;

begin
  Result := '';


  Template := 'http://lib.rus.ec/b/%ID%/download'; { TODO -oAlex : Заглушка! }

  DMMain.FieldByName(0,'LibId',S);
  StrReplace('%ID%',S,Template);
  Result := Template;
end;

//------------------------------------------------------------------------------

procedure TDownloadBooksThread.SetComment(const Current, Total: string);
begin
  FCurrentComment := Current;
  FTotalComment := Total;
  Synchronize(DoSetComment);
end;

procedure TDownloadBooksThread.SetProgress(Current,Total: integer);
begin
  FCurrentProgress := Current;
  FTotalProgress := Total;
  Synchronize(DoSetProgress);
end;


procedure TDownloadBooksThread.DoSetComment;
begin
  if Assigned(FOnSetComment) then
    FOnSetComment(FCurrentComment,FTotalComment);
end;

procedure TDownloadBooksThread.DoSetProgress;
begin
  if Assigned(FOnSetProgress) then
    FOnSetProgress(FCurrentProgress,FTotalProgress);
end;

end.

