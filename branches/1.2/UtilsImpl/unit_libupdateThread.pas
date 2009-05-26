unit unit_libupdateThread;
interface

uses
  Classes,
  SysUtils,
  unit_ImportLibRusEcThread,
  unit_Globals,
  Dialogs,
  ABSMain,
  IdHTTP,
  Forms,
  IdComponent,
  IdHTTPHeaderInfo;



type

  TDownloadProgressEvent = procedure (Current,Total: Integer) of object;
  TDownloadSetCommentEvent = procedure (const Current, Total: string) of object;

  TLibUpdateThread = class(TImportLibRusEcThread)
  private
    FidHTTP:TidHTTP;

    FDownloadSize: integer;

    FOnSetProgress: TDownloadProgressEvent;
    FOnSetComment: TDownloadSetCommentEvent;

    FCurrentComment: string;
    FTotalComment: string;
    FCurrentProgress: Integer;
    FTotalProgress: Integer;

    FStartDate : TDateTime;
    FIgnoreErrors: boolean;

    FUpdated: boolean;

    function DownloadUpdate(Full: boolean):boolean;
    function ReplaceFiles:boolean;
    function CheckUpdate(ver: integer; Full: boolean): boolean;


  protected
    procedure WorkFunction; override;
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
  public
    property Updated: boolean read FUpdated;
  end;

resourcestring
  rstrDownloadProgress = 'Загружено: %u%% из %u байт';
  rstrCheckingUpdate = 'Проверяем наличие обновлений основной базы ...';
  rstrCheckingExtraUpdate = 'Проверяем наличие обновлений для on-line ...';
  rstrErrorCheckingUpdate = 'ОШИБКА. Не удалось проверить обновление.';
  rstrErrorDownloadUpdate = 'ОШИБКА. Не удалось скачать обновление.';
  rstrReady = 'Готово';
  rstrDownloadingUpdates = 'Загрузка обновлений ...';
  rstrYouHaveLatestListsVersion = 'У вас самая свежая версия списков.';
  rstrUpdatingFromLocalArchive = 'Обновление из локального архива';
  rstrListsUpdateIsAvailable = 'Доступно обновление списков до версии %d';
  rstrListsExtraUpdateIsAvailable = 'Доступно обновление on-line списков до версии %d';
  rstrNothingToUpdate = 'Нечего обновлять!';
  rstrUpdateComplete = 'Обновление завершено.';
  rstrRemovingOldCollection = 'Удаление старой коллекции "%s"...';
  rstrCreatingCollection = 'Создание новой коллекции  "%s"...';


implementation

uses DateUtils, dm_main, dm_user, unit_Consts, unit_Settings, unit_WorkerThread,
  unit_Database, StrUtils;

{ TDownloadBooksThread }

function TLibUpdateThread.CheckUpdate(ver: integer; Full:boolean): boolean;
var
  RemoteVersion: Integer;
  URL: string;

begin
  Result := False;

  if Full then
      Teletype(rstrCheckingUpdate,tsInfo)
    else
      Teletype(rstrCheckingExtraUpdate,tsInfo);

  //
  // Проверим наличие файла ${ApplicationPath}\librusec_update.zip.
  //
  if FileExists(Settings.SystemFileName[sfLibRusEcUpdate]) then
  begin
    Teletype(rstrUpdatingFromLocalArchive,tsInfo);
    Result := True;
    FUpdated := Result;
    Exit;
  end;

  //
  // предварительно скачанного апдейта нет, проверяем онлайн апдейт ${UpdateURL}/last_collection.info
  //
  try
    Result := CheckLibVersion(Ver, Full, RemoteVersion);
    FUpdated := Result;
    if Result then
      if Full then
         Teletype(Format(rstrListsUpdateIsAvailable, [RemoteVersion]),tsInfo)
      else
         Teletype(Format(rstrListsExtraUpdateIsAvailable, [RemoteVersion]),tsInfo)
    else
      Teletype(rstrYouHaveLatestListsVersion,tsInfo);
  except
    Teletype(rstrErrorCheckingUpdate,tsInfo)
  end;
end;

function TLibUpdateThread.DownloadUpdate(Full: boolean): boolean;
var
  MS: TMemoryStream;

  URL: string;
  FileName: string;

begin
  Canceled := False;
  FIgnoreErrors := False;

  URL := IfThen(Full,
                InclideUrlSlash(settings.UpdateURL) + LIBRUSEC_UPDATE_FILENAME,
                InclideUrlSlash(settings.UpdateURL) + EXTRA_UPDATE_FILENAME);

  FileName := IfThen(Full,
                     Settings.SystemFileName[sfLibRusEcUpdate],
                     Settings.SystemFileName[sfExtraUpdateInfo]);

  FidHTTP := TidHTTP.Create(nil);
  FidHTTP.OnWork := HTTPWork;
  FidHTTP.OnWorkBegin := HTTPWorkBegin;
  FidHTTP.OnWorkEnd := HTTPWorkEnd;
  FidHTTP.HandleRedirects := True;

  SetProxySettings(FidHTTP);

  Result := False;

  Teletype(rstrDownloadingUpdates,tsInfo);

  MS := TMemoryStream.Create;
  try
    try
        //
        // Возможно, файл уже был скачан. Если нет - скачать.
        //
        if not FileExists(FileName) then
        begin
          FIdHTTP.Get(URL, MS);
          MS.SaveToFile(FileName);
        end;

        Teletype(rstrReady,tsInfo);

        Result := True;
      except
        Teletype(rstrErrorDownloadUpdate,tsInfo)
      end;
  finally
    MS.Free;
  end;
end;

procedure TLibUpdateThread.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
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
    SetProgress(AWorkCount * 100 div FDownloadSize);

  ElapsedTime := SecondsBetween(Now,FStartDate);
  if ElapsedTime>0 then
  begin
    Speed := FormatFloat('0.00',AWorkCount/1024/ElapsedTime);
    SetComment(Format('Загрузка: %s Kb/s',[Speed]));
  end;
end;

procedure TLibUpdateThread.HTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
  SetProgress(0);
end;

procedure TLibUpdateThread.HTTPWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
  SetProgress(100);
  SetComment(rstrReady);
end;

function TLibUpdateThread.ReplaceFiles: boolean;
begin
  DeleteFile(Settings.SystemFileName[sfLibRusEcinpx]);
  RenameFile(Settings.SystemFileName[sfLibRusEcUpdate],Settings.SystemFileName[sfLibRusEcinpx]);
end;

procedure TLibUpdateThread.WorkFunction;
var
  i: integer;
  CollList: array of record
    ID: integer;
    Name: string;
    DBFileName: string;
    Folder: string;
    Code: COLLECTION_TYPE;
  end;
  ActiveIndex: Integer;
  Version : integer;
  DelOld: boolean;

  ALibrary: TMHLLibrary;

  Full: boolean;

begin
  ActiveIndex := DMUser.ActiveCollection.ID;
  SetComment(rstrCheckingUpdate);

  Full := true;

  try
    if
      not DMUser.FindFirstExternalCollection or
      (DMUser.ActiveCollection.Version = UNVERSIONED_COLLECTION) or
      not CheckUpdate(DMUser.ActiveCollection.Version,True) or
      not DownloadUpdate(True)
    then
      if not DMUser.FindOnLineCollection or
         not CheckUpdate(DMUser.ActiveCollection.Version,False) or
         not DownloadUpdate(False)
      then
      begin
        Teletype(rstrNothingToUpdate,tsInfo);
        DelOld := False;
        raise EInvalidOp.Create('');
      end
      else
        Full := False;

    DelOld := True;

    SetComment(rstrDownloadingUpdates);

    i := 0;

    repeat
      if Canceled then
            Break;
      SetLength(CollList, i + 1);
      CollList[i].ID := DMUser.ActiveCollection.ID;
      CollList[i].Name := DMUser.ActiveCollection.Name;
      CollList[i].DBFileName := DMUser.ActiveCollection.DBFileName;
      CollList[i].Folder := DMUser.ActiveCollection.RootFolder;
      CollList[i].Code := DMUser.ActiveCollection.CollectionType;
      Inc(i);
    until not DMUser.FindNextExternalCollection;

    InpxFileName := IfThen(Full,Settings.SystemFileName[sfLibRusEcUpdate],
                                Settings.SystemFileName[sfExtraUpdateInfo]);

    for i := 0 to High(CollList) do
    begin

      if Canceled then
            Break;

      DMUser.ActivateCollection(CollList[i].ID);

      DBFileName := CollList[i].DBFileName;
      CollectionRoot := IncludeTrailingPathDelimiter(CollList[i].Folder);
      CollectionType := CollList[i].Code;

      Teletype(Format(rstrRemovingOldCollection, [CollList[i].Name]),tsInfo);

      if Full then
      begin
        // удаляем старый файл коллекции
        DMMain.DBMain.Close;
        DMMain.DBMain.DatabaseFileName := DBFileName;
        DMMain.DBMain.DeleteDatabase;

        // создаем его заново
        Teletype(Format(rstrCreatingCollection, [CollList[i].Name]),tsInfo);

        ALibrary := TMHLLibrary.Create(nil);
        try
           ALibrary.CreateCollectionTables(DBFileName, GENRES_FB2_FILENAME);
        finally
          ALibrary.Free;
        end;
      end;
      //  импортирум данные
      Teletype('Импорт ...',tsInfo);

      Import;

      DMUser.ActiveCollection.Version := GetLibUpdateVersion(True);

      Teletype(rstrReady,tsInfo);
    end;
    Teletype(rstrUpdateComplete,tsInfo);

    finally
      if Full then
      begin
        if not Canceled then
          ReplaceFiles;
      end
      else
        DeleteFile(Settings.SystemFileName[sfExtraUpdateInfo]);
      DMUser.ActivateCollection(ActiveIndex);
      Settings.ActiveCollection := ActiveIndex;
      SetComment(rstrReady);
    end;

end;

end.
