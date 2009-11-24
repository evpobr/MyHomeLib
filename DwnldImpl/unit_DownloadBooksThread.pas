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
  ABSMain,
  IdHTTP,
  Forms,
  IdComponent,
  IdHTTPHeaderInfo;

type
  TURLParams = record
    Param: string;
    Field: string;
  end;

  TProgressEvent2 = procedure(Current, Total: Integer) of object;
  TSetCommentEvent2 = procedure(const Current, Total: string) of object;

  TDownloadBooksThread = class(TWorker)
  private
    FidHTTP: TidHTTP;

    FBookIdList: TBookIdList;
    FCollectionRoot: string;
    FDownloadSize: integer;

    FOnSetProgress2: TProgressEvent2;
    FOnSetComment2: TSetCommentEvent2;

    FCurrentComment: string;
    FTotalComment: string;
    FCurrentProgress: Integer;
    FTotalProgress: Integer;

    FStartDate: TDateTime;
    FIgnoreErrors: boolean;

    FNoPause: boolean;

    FNewURL : string;
    FOnPostReq: boolean;

    procedure ProcessError(const LongMsg, ShortMsg, AFileName: string);
    function CalculateURL: string;
    function DownloadBook(ID: integer): Boolean;

    procedure DoSetComment2;
    procedure SetComment2(const Current, Total: string);

    procedure DoSetProgress2;
    procedure SetProgress2(Current, Total: integer);
    procedure SetCancelledOperation;

  protected
    procedure WorkFunction; override;
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure HTTPRedirect(Sender: TObject; var dest: string;
                  var NumRedirect: Integer; var Handled: Boolean; var VMethod: string);

  public
    property BookIdList: TBookIdList read FBookIdList write FBookIdList;

    property OnProgress2: TProgressEvent2 read FOnSetProgress2 write FOnSetProgress2;
    property OnSetComment2: TSetCommentEvent2 read FOnSetComment2 write FOnSetComment2;
  end;

implementation

uses
  Windows,
  dm_user,
  dm_collection,
  unit_database,
  unit_Consts,
  unit_Settings,
  frm_main,
  StrUtils,
  IdStack,
  IdStackConsts,
  IdException,
  DateUtils,
  IdMultipartFormData;

procedure TDownloadBooksThread.HTTPRedirect(Sender: TObject; var dest: string;
  var NumRedirect: Integer; var Handled: Boolean; var VMethod: string);
begin
  if pos('fb2.zip', dest) <> 0 then
    FNewURL := dest
  else
    FNewURL := '';
end;

procedure TDownloadBooksThread.HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
var
  ElapsedTime: Cardinal;
  Speed: string;
begin
  if FOnPostReq then Exit;

  if Canceled then
  begin
    FidHTTP.Disconnect;
    Exit;
  end;

  if FDownloadSize <> 0 then
    SetProgress2(AWorkCount * 100 div FDownloadSize, -1);

  ElapsedTime := SecondsBetween(Now, FStartDate);
  if ElapsedTime > 0 then
  begin
    Speed := FormatFloat('0.00', AWorkCount / 1024 / ElapsedTime);
    SetComment2(Format('Загрузка: %s Kb/s', [Speed]), '');
  end;
end;

procedure TDownloadBooksThread.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
  SetProgress2(1, -1);
end;

procedure TDownloadBooksThread.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  if FOnPostReq then Exit;

  SetProgress2(100, -1);
  SetComment2('Готово', '');
end;

procedure TDownloadBooksThread.ProcessError(const LongMsg, ShortMsg, AFileName: string);
var
  F: Text;
  FileName: string;
begin
  if Settings.ErrorLog then
  begin
    FileName := Settings.WorkPath + 'download_errors.log';
    AssignFile(F, FileName);
    if FileExists(FileName) then
      Append(F)
    else
      Rewrite(F);
    Writeln(F, Format('%s %s >> %s', [DateTimeToStr(Now), ShortMsg, AFileName]));
    CloseFile(F);
  end;
  if not FIgnoreErrors then
    ShowMessage(LongMsg, MB_ICONERROR or MB_OK);
end;

procedure TDownloadBooksThread.WorkFunction;
var
  i: Integer;
  totalBooks: Integer;
  Res: integer;
begin
  Canceled := False;
  FIgnoreErrors := False;

  FCollectionRoot := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  FidHTTP := TidHTTP.Create(nil);
  try
    FidHTTP.OnWork := HTTPWork;
    FidHTTP.OnWorkBegin := HTTPWorkBegin;
    FidHTTP.OnWorkEnd := HTTPWorkEnd;
    FidHTTP.OnRedirect := HTTPRedirect;
    FidHTTP.HandleRedirects := True;

    SetProxySettings(FidHTTP);

    totalBooks := High(FBookIdList) + 1;
    SetComment2(' ', Format('Скачано файлов: %u из %u', [0, totalBooks]));

    for i := 0 to totalBooks - 1 do
    begin
      SetComment2('Подключение ...', '');

      FBookIdList[i].Res := DownloadBook(FBookIdList[i].ID);
      if
        (not Canceled) and                // это реальная ошибка, а не отмена операции пользователем
        (not FBookIdList[i].Res) and      //
        (i < totalBooks - 1) and          // для последней книги вопрос смысла не имеет
        (not Settings.ErrorLog) and       //
        (not FIgnoreErrors)               //
      then
      begin
        Res := ShowMessage('Игнорировать ошибки загрузки ?', MB_ICONQUESTION or MB_YESNO);
        FIgnoreErrors := (Res = IDYES);
      end;

      SetComment2('Готово', Format('Скачано файлов: %u из %u', [i + 1, totalBooks]));
      SetProgress2(100, (i + 1) * 100 div totalBooks);

      if Canceled then
      begin
        SetComment2(' ', 'Завершение операции ...');
        Break;
      end;
      if FNoPause then Sleep(Settings.DwnldInterval);
    end;
  finally
    FidHTTP.Free;
  end;
end;

function TDownloadBooksThread.DownloadBook(ID: Integer): Boolean;
var
  //LibID: Integer;
  FS: TMemoryStream;
  loginInfo: TStringList;
  //response: TStringStream;
  Path: string;
  Folder: string;
  URL: string;
  mpfds: TIdMultiPartFormDataStream;
begin
  Result := False;
  FNoPause := False;

  dmCollection.GetBookFolder(ID, Folder);

  if FileExists(Folder) then
  begin
    dmCollection.SetLocalStatus(ID, True);
    Result := True;
    Exit;
  end;

  loginInfo := TStringList.Create;
  try
    //response := TStringStream.Create('');
    //try
    FS := TMemoryStream.Create;
    try
      try
        URL := CalculateURL; // Locate по таблице был сделан при вызове GetBookFileName,
                             // так что ID можно не передавать

        try
          mpfds:=TIdMultiPartFormDataStream.Create;
          mpfds.AddFormField('name', Settings.LibUsername);
          mpfds.AddFormField('password', Settings.LibPassword);

         FOnPostReq := True;
          try
            FidHTTP.Post(URL, mpfds);
          except
            // тут ничего
          end;
        finally
          mpfds.Free;
        end;
        FOnPostReq := False;

        if FNewURL = '' then raise Exception.Create('Неправильный логин/пароль');

        FidHTTP.Get(FNewURL, FS);

        { TODO -oAlex : В зависимости от типа файла (zip или нет) имя должно формироваться по разному! }

        if Canceled then
        begin
          Result := False;
          Synchronize(SetCancelledOperation);
          FNoPause := True;
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
            (Pos('<!DOCTYPE', loginInfo[0]) <> 0)
            or (Pos('overload', loginInfo[0]) <> 0)
            or (Pos('not found', loginInfo[0]) <> 0) then
          begin
            ProcessError(
              'Загрузка файла заблокирована сервером!' + #13 + ' Ответ сервера можно посмотреть в файле "server_error.html"',
              'Заблокировано сервером',
              Folder
              );
            loginInfo.SaveToFile(Settings.SystemFileName[sfServerErrorLog]);
          end
          else
          begin
            FS.SaveToFile(Folder);
            Result := TestArchive(Folder);
            if Result then
              dmCollection.SetLocalStatus(ID, True)
            else
              DeleteFile(PChar(Folder));
          end;
        end;

      except
        on E: EIdSocketError do
          case E.LastError of
            11001:
              ProcessError(
                'Закачка не удалась! Сервер не найден.',
                'Ошибка ' + IntToStr(E.LastError),
                Folder
                );

            Id_WSAETIMEDOUT:
              ProcessError(
                'Закачка не удалась! Превышено время ожидания.',
                'Ошибка ' + IntToStr(E.LastError),
                Folder
                );

          else
            ProcessError(
              'Закачка не удалась! Ошибка подключения.',
              'Ошибка ' + IntToStr(E.LastError),
              Folder
              );
          end; //case
        on E: Exception do
          ProcessError(
            'Закачка не удалась! Сервер сообщает об ошибке "' + E.Message + '".' + #10#13,
            'Код Ошибки ' + IntToStr(FidHTTP.ResponseCode),
            Folder
            );
      end;
    finally
      FS.Free;
    end;
    //finally
    //  Response.Free;
    //end;
  finally
    LoginInfo.Free;
  end;
end;

function TDownloadBooksThread.CalculateURL: string;
(*
const
  Params: array[0..1] of TURLParams = (
    (Param: '%ID%'; Field: 'LibID'),
    (Param: '%FileName%'; Field: 'FileName')
    );
*)
var
  S: string;
  Template: string;
  //Current: TURLParams;
begin
  Result := '';

  Template := Settings.DownloadURL + 'b/%ID%/get';  { TODO -oAlex : Заглушка! }

  dmCollection.FieldByName(0, 'LibId', S);
  StrReplace('%ID%', S, Template);
  Result := Template;
end;

//------------------------------------------------------------------------------

procedure TDownloadBooksThread.DoSetComment2;
begin
  if Assigned(FOnSetComment2) then
    FOnSetComment2(FCurrentComment, FTotalComment);
end;

procedure TDownloadBooksThread.SetCancelledOperation;
begin
  frmMain.FCancelled := True;
end;

procedure TDownloadBooksThread.SetComment2(const Current, Total: string);
begin
  FCurrentComment := Current;
  FTotalComment := Total;
  Synchronize(DoSetComment2);
end;

procedure TDownloadBooksThread.SetProgress2(Current, Total: integer);
begin
  FCurrentProgress := Current;
  FTotalProgress := Total;
  Synchronize(DoSetProgress2);
end;

procedure TDownloadBooksThread.DoSetProgress2;
begin
  if Assigned(FOnSetProgress2) then
    FOnSetProgress2(FCurrentProgress, FTotalProgress);
end;

end.
