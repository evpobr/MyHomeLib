unit unit_libupdateThread;

interface

uses
  Windows,
  Classes,
  SysUtils,
  unit_ImportInpxThread,
  ABSMain,
  IdHTTP,
  IdComponent;

type
  TDownloadProgressEvent = procedure (Current, Total: Integer) of object;
  TDownloadSetCommentEvent = procedure (const Current, Total: string) of object;

  TLibUpdateThread = class(TImportInpxThread)
  private
    FidHTTP: TidHTTP;
    FDownloadSize: Integer;
    FStartDate : TDateTime;
    FUpdated: Boolean;

    function ReplaceFiles: Boolean;

  protected
    procedure WorkFunction; override;
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);

  public
    property Updated: Boolean read FUpdated;
  end;

implementation

uses
  DateUtils,
  unit_Globals,
  dm_collection,
  dm_user,
  unit_Consts,
  unit_Settings,
  unit_WorkerThread,
  unit_Database;

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
  rstrSpeed = 'Загрузка: %s Kb/s';
  rstrConnectingToServer = 'Подключение к серверу ...';
  rstrCollectionUpdate = 'Обновление коллекции "%s" до версии %d:';
  rstrUpdateFailedDownload = 'Загрузка обновлений не удалась.';
  rstrCancelledByUser = 'Операция отменена пользователем.';
  rstrImportIntoCollection = 'Импорт данных в коллекцию:';

{ TDownloadBooksThread }


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
    SetComment(Format(rstrSpeed,[Speed]));
  end;
end;

procedure TLibUpdateThread.HTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  SetComment(rstrConnectingToServer);
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
  DeleteFile(Settings.SystemFileName[sfLibRusEcInpx]);
  CopyFile(Settings.SystemFileName[sfLibRusEcUpdate], Settings.SystemFileName[sfLibRusEcInpx]);
  DeleteFile(Settings.SystemFileName[sfLibRusEcUpdate]);
end;

procedure TLibUpdateThread.WorkFunction;
var
  ALibrary: TMHLLibrary;
  i: integer;
begin
  FidHTTP := TidHTTP.Create(nil);
  try
    FidHTTP.OnWork := HTTPWork;
    FidHTTP.OnWorkBegin := HTTPWorkBegin;
    FidHTTP.OnWorkEnd := HTTPWorkEnd;
    FidHTTP.HandleRedirects := True;
    SetProxySettings(FidHTTP);

    SetComment(rstrCheckingUpdate);

    try
      for i := 0 to Settings.Updates.Count - 1 do
      begin
        if not Settings.Updates[i].Available then
          Continue;

        DMUser.ActivateCollection(Settings.Updates[i].CollectionID);
        Teletype(Format(rstrCollectionUpdate, [Settings.Updates[i].Name, Settings.Updates[i].ExternalVersion]), tsInfo);

        if Settings.Updates[i].Local then
          Teletype(rstrUpdatingFromLocalArchive, tsInfo)
        else
        begin
          Teletype(rstrDownloadingUpdates, tsInfo);
          if not Settings.Updates.DownloadUpdate(i, FidHTTP) then
          begin
            Teletype(rstrUpdateFailedDownload, tsInfo);
            Continue;
          end;
        end;

        if Canceled then
        begin
          DeleteFile(Settings.WorkPath + Settings.Updates.Items[i].UpdateFile);
          Teletype(rstrCancelledByUser, tsInfo);
          Exit;
        end;

        InpxFileName := Settings.UpdatePath + Settings.Updates[i].UpdateFile;

        DBFileName := DMUser.CurrentCollection.DBFileName;
        CollectionRoot :=  IncludeTrailingPathDelimiter(DMUser.CurrentCollection.RootFolder);
        CollectionType := DMUser.CurrentCollection.CollectionType;

        if Settings.Updates[i].Full then
        begin
          //
          // TODO : по хорошему, это полная фигня.
          // Жанры зачитываем неправильные, группы не чистим...
          //
          Teletype(Format(rstrRemovingOldCollection, [Settings.Updates[i].Name]),tsInfo);

          // удаляем старый файл коллекции
          DMCollection.DBCollection.Close;
          DMCollection.DBCollection.DatabaseFileName := DBFileName;
          DMCollection.DBCollection.DeleteDatabase;

          // создаем его заново
          Teletype(Format(rstrCreatingCollection, [Settings.Updates[i].Name]),tsInfo);
          TMHLLibrary.CreateCollectionTables(DBFileName, GENRES_FB2_FILENAME);
        end; //if FULL

        //  импортирум данные
        Teletype(rstrImportIntoCollection, tsInfo);

        Import(not Settings.Updates[i].Full);

        DMUser.CurrentCollection.Edit;
        try
          DMUser.CurrentCollection.Version := GetLibUpdateVersion(True);
          DMUser.CurrentCollection.Save;
        except
          DMUser.CurrentCollection.Cancel;
          raise;
        end;

        Teletype(rstrReady,tsInfo);
      end; //for .. with

      Teletype(rstrUpdateComplete,tsInfo);
      for i := 0 to Settings.Updates.Count - 1 do
      begin
        if FileExists(Settings.UpdatePath + Settings.Updates[i].UpdateFile) then
          if Settings.Updates[i].UpdateFile <> 'librusec_update.zip' then
            DeleteFile(Settings.UpdatePath + Settings.Updates[i].UpdateFile)
          else
            ReplaceFiles;
       end;

       SetComment(rstrReady);
    except
      on E: Exception do
        DeleteFile(Settings.WorkPath + Settings.Updates.Items[i].UpdateFile);
    end;
  finally
    FreeAndNil(FidHTTP);
  end;
end;

end.
