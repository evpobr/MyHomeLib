unit unit_libupdateThread;

interface

uses
  Windows,
  Classes,
  SysUtils,
  unit_ImportInpxThread,
  ABSMain,
  IdHTTP,
  IdComponent,
  UserData;

type
  TDownloadProgressEvent = procedure (Current, Total: Integer) of object;
  TDownloadSetCommentEvent = procedure (const Current, Total: string) of object;

  TLibUpdateThread = class(TImportInpxThread)
  private
    FidHTTP: TidHTTP;
    FDownloadSize: Integer;
    FStartDate : TDateTime;
    FUpdated: Boolean;
    FOnImportUserData: TOnImportUserDataEvent;

    function ReplaceFiles: Boolean;

  protected
    procedure WorkFunction; override;
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);

  public
    constructor Create(OnImportUserData: TOnImportUserDataEvent);
    property Updated: Boolean read FUpdated;
  end;

implementation

uses
  DateUtils,
  unit_Globals,
  dm_user,
  unit_Consts,
  unit_Settings,
  unit_WorkerThread,
  unit_Database,
  unit_Interfaces,
  unit_SystemDatabase;

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
  rstrUpdateFailed = 'Обновление не удалось.';
  rstrBackupUserData = 'Сохранение резервной копии пользовательских данных ...';
  rstrRestoreUserData = 'Восстановление пользовательских данных ...';
  rstrRemovingOldCollection = 'Удаление всех записей старой коллекции "%s" ...';
  rstrCreatingCollection = 'Создание новой коллекции  "%s"...';
  rstrSpeed = 'Загрузка: %s Kb/s';
  rstrConnectingToServer = 'Подключение к серверу ...';
  rstrCollectionUpdate = 'Обновление коллекции "%s" до версии %d:';
  rstrUpdateFailedDownload = 'Загрузка обновлений не удалась.';
  rstrCancelledByUser = 'Операция отменена пользователем.';
  rstrImportIntoCollection = 'Импорт данных в коллекцию:';

{ TLibUpdateThread }

constructor TLibUpdateThread.Create(OnImportUserData: TOnImportUserDataEvent);
begin
  inherited Create;
  Assert(Assigned(OnImportUserData));
  FOnImportUserData := OnImportUserData;
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
  BookCollection: IBookCollection;
  i: integer;
  UserDataBackup: TUserData;
  CollectionInfo: TCollectionInfo;
begin
  UserDataBackup := nil;
  FidHTTP := TidHTTP.Create(nil);
  try
    FidHTTP.OnWork := HTTPWork;
    FidHTTP.OnWorkBegin := HTTPWorkBegin;
    FidHTTP.OnWorkEnd := HTTPWorkEnd;
    FidHTTP.HandleRedirects := True;
    SetProxySettings(FidHTTP);

    SetComment(rstrCheckingUpdate);

    try
      CollectionInfo := TCollectionInfo.Create;
      try
        for i := 0 to Settings.Updates.Count - 1 do
        begin
          if not Settings.Updates[i].Available then
            Continue;

          GetSystemData.ActivateCollection(Settings.Updates[i].CollectionID);
          GetSystemData.GetCollectionInfo(Settings.Updates[i].CollectionID, CollectionInfo);
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

          DBFileName := CollectionInfo.DBFileName;
          CollectionRoot := CollectionInfo.RootPath;
          CollectionType := CollectionInfo.CollectionType;

          //Truncate won't work with TBookCollection.Create(DBFileName, False)
          BookCollection := GetBookCollection(DBFileName);
          BookCollection.BeginBulkOperation;
          try
            if Settings.Updates[i].Full then
            begin
              // Backup user data:
              Teletype(Format(rstrBackupUserData, [Settings.Updates[i].Name]),tsInfo);
              UserDataBackup := TUserData.Create;
              BookCollection.ExportUserData(UserDataBackup);

              // clear most tables in a collection
              Teletype(Format(rstrRemovingOldCollection, [Settings.Updates[i].Name]),tsInfo);
              BookCollection.TruncateTablesBeforeImport;
            end; //if FULL

            //  импортирум данные
            Teletype(rstrImportIntoCollection, tsInfo);
            Import(not Settings.Updates[i].Full, BookCollection);

            if (UserDataBackup <> nil) then // a full import mode, had a backup before the process
            begin
              // Restore user data:
              Teletype(Format(rstrRestoreUserData, [Settings.Updates[i].Name]),tsInfo);
              FOnImportUserData(UserDataBackup);
            end;

            BookCollection.EndBulkOperation(True);
          except
            BookCollection.EndBulkOperation(False);
            raise;
          end;

          CollectionInfo.Version := GetLibUpdateVersion(True);
          GetSystemData.UpdateCollectionInfo(CollectionInfo);

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
      finally
        FreeAndNil(CollectionInfo);
      end;
    except
      on E: Exception do
      begin
        Teletype(rstrUpdateFailed, tsError);
        DeleteFile(Settings.WorkPath + Settings.Updates.Items[i].UpdateFile);
      end;
    end;
  finally
    FreeAndNil(FidHTTP);
    FreeAndNil(UserDataBackup);
  end;
end;

end.
