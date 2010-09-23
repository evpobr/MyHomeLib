(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  *                     Aleksey Penkov alex.penkov@gmail.com
  * Created             20.08.2008
  * Description
  *
  * $Id$
  *
  * History
  * NickR 03.09.2010    Импорт из XML больше не поддерживается. Удалил соответствующую страницу визарда.
  *
  ****************************************************************************** *)

unit frm_NCWizard;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  StdCtrls,
  ExtCtrls,
  Dialogs,
  frame_WizardPageBase,
  frame_DecorativePageBase,
  frame_InteriorPageBase,
  unit_NCWParams,
  frame_NCWWelcom,
  frame_NCWOperation,
  frame_NCWInpxSource,
  frame_NCWCollectionNameAndLocation,
  frame_NCWCollectionFileTypes,
  frame_NCWSelectGenreFile,
  frame_NCWProgress,
  frame_NCWFinish,
  frame_NCWDownload,
  unit_WorkerThread;

type
  TfrmNCWizard = class(TForm)
    pnButtons: TPanel;
    btnForward: TButton;
    btnBackward: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DoChangePage(Sender: TObject);
    procedure OnCancel(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    procedure PMWorkerDone(var Message: TMessage); message PM_WORKERDONE;

  strict private
    FParams: TNCWParams;

    FWelcomPage: TframeNCWWelcom;
    FCollectionTypePage: TframeNCWOperation;
    FInpxSourcePage: TframeNCWInpxSource;
    FDownloadPage: TframeNCWDownload;
    FNameAndLocationPage: TframeNCWNameAndLocation;
    FFileTypesPage: TframeNCWCollectionFileTypes;
    FSelectGenreFilePage: TframeNCWSelectGenreFile;
    FProgressPage: TframeNCWProgress;
    FFinishPage: TframeNCWFinish;

    FPages: array of TWizardPageBase;
    FCurrentPage: Integer;

    FWorker: TWorker;
    FModalResult: TModalResult;

    procedure AdjustButtons(VisibleButtons: TWizardButtons; EnabledButtons: TWizardButtons);
    function AddPage(pageClass: TWizardPageClass): TWizardPageBase;
    procedure ShowPage(PageIndex: Integer);
    function GetPageIndex(goNext: Boolean): Integer;
    function IsPageVisible(PageIndex: Integer): Boolean;
    function IsValidPageIndex(PageIndex: Integer): Boolean; inline;

    function ActivePage: TWizardPageBase;

    procedure AfterShowPage;

    procedure CorrectParams;
    function CreateCollection: Boolean;
    function StartImportData: Boolean;
    procedure RegisterCollection;

    procedure CloseWorker;
    procedure CancelWorker;

    function ShowMessage(const Text: string; Flags: Longint = MB_OK): Integer;

  public
    destructor Destroy; override;
  end;

var
  frmNCWizard: TfrmNCWizard;

implementation

uses
  Math,
  unit_Settings,
  unit_globals,
  unit_ImportInpxThread,
  unit_Consts,
  unit_mhl_strings,
  unit_Interfaces,
  unit_SystemDatabase;

resourcestring
  rstrCaptionCancel = 'Отмена';
  rstrCaptionClose = 'Закрыть';
  rstrCreationCollection = 'Создание коллекции';
  rstrDataImport = 'Импорт данныx';
  rstrDataImporting = 'Импортируем данные';
  rstrRegistration = 'Регистрируем коллекцию';
  rstrDownloadFailed = 'Закачка не удалась. Сервер сообщает об ошибке.';
  rstrImportDoneWithErrors = 'Импорт закончен с ошибками. Продолжить регистрацию коллекции ?';

{$R *.dfm}

const
  NO_ACTIVE_PAGE = -1;

  WELCOM_PAGE_ID = 0;
  OPERATION_PAGE_ID = 1;
  INPXSOURCE_PAGE_ID = 2;
  DOWNLOAD_PAGE_ID = 3;
  NAMEANDLOCATION_PAGE_ID = 4;
  FILETYPES_PAGE_ID = 5;
  GENREFILE_PAGE_ID = 6;
  PROGRESS_PAGE_ID = 7;
  FINISH_PAGE_ID = 8;

destructor TfrmNCWizard.Destroy;
begin
  CloseWorker;
  inherited;
end;

function TfrmNCWizard.AddPage(pageClass: TWizardPageClass): TWizardPageBase;
var
  n: Integer;
begin
  Result := pageClass.Create(Self);
  Result.Parent := Self;

  n := Length(FPages);
  SetLength(FPages, n + 1);
  FPages[n] := Result;
end;

function TfrmNCWizard.GetPageIndex(goNext: Boolean): Integer;
begin
  Result := FCurrentPage;
  while IsValidPageIndex(Result) do
  begin
    if goNext then
      Inc(Result)
    else
      Dec(Result);

    if IsPageVisible(Result) then
      Break;
  end;
end;

function TfrmNCWizard.IsValidPageIndex(PageIndex: Integer): Boolean;
begin
  Result := (Low(FPages) <= PageIndex) and (PageIndex <= High(FPages));
end;

function TfrmNCWizard.IsPageVisible(PageIndex: Integer): Boolean;
begin
  case PageIndex of
    WELCOM_PAGE_ID:
      Result := True;

    OPERATION_PAGE_ID:
      Result := True;

    INPXSOURCE_PAGE_ID:
      Result := (FParams.Operation = otInpx);

    DOWNLOAD_PAGE_ID:
      Result := (FParams.Operation = otInpxDownload);

    NAMEANDLOCATION_PAGE_ID:
      Result := True;

    FILETYPES_PAGE_ID:
      Result := (FParams.Operation = otNew);

    GENREFILE_PAGE_ID:
      Result := (FParams.Operation = otNew) and (FParams.FileTypes = ftAny);

    PROGRESS_PAGE_ID:
      Result := True;

    FINISH_PAGE_ID:
      Result := True;
  else
    Assert(False);
    Result := True;
  end;
end;

procedure TfrmNCWizard.AdjustButtons(VisibleButtons: TWizardButtons; EnabledButtons: TWizardButtons);
begin
  btnBackward.Enabled := wbGoPrev in EnabledButtons;
  btnForward.Enabled := wbGoNext in EnabledButtons;
  btnCancel.Enabled := (wbCancel in EnabledButtons) or (wbFinish in EnabledButtons);

  if wbCancel in EnabledButtons then
  begin
    btnCancel.Caption := rstrCaptionCancel;
    FModalResult := mrCancel;
  end
  else
  begin
    btnCancel.Caption := rstrCaptionClose;
    FModalResult := mrOk;
  end;
end;

procedure TfrmNCWizard.ShowPage(PageIndex: Integer);
var
  Buttons: TWizardButtons;
begin
  Assert(IsValidPageIndex(PageIndex));

  FPages[PageIndex].Enabled := True;
  FPages[PageIndex].Visible := True;
  FPages[PageIndex].BringToFront;

  if IsValidPageIndex(FCurrentPage) then
  begin
    FPages[FCurrentPage].Enabled := False;
    FPages[FCurrentPage].Visible := False;
  end;

  FCurrentPage := PageIndex;

  Assert(nil <> ActivePage);
  AfterShowPage;

  Buttons := ActivePage.PageButtons;
  AdjustButtons(Buttons, Buttons);
end;

function TfrmNCWizard.ActivePage: TWizardPageBase;
begin
  Assert(IsValidPageIndex(FCurrentPage));

  if IsValidPageIndex(FCurrentPage) then
    Result := FPages[FCurrentPage]
  else
    Result := nil;
end;

procedure TfrmNCWizard.DoChangePage(Sender: TObject);
var
  goForward: Boolean;
  pageIndex: Integer;
begin
  goForward := (Sender = btnForward);

  if IsValidPageIndex(FCurrentPage) and ActivePage.Deactivate(goForward) then
  begin
    pageIndex := GetPageIndex(goForward);

    if not FPages[pageIndex].Activate(goForward) then
      Exit;

    ShowPage(pageIndex);
  end;
end;

procedure TfrmNCWizard.CancelWorker;
begin
  if Assigned(FWorker) then
  begin
    if FWorker.Finished then
      Exit;

    if not FWorker.Canceled then
      if ShowMessage(rstrCancelOperationWarningMsg, MB_OKCANCEL or MB_ICONEXCLAMATION) = IDCANCEL then
        Exit;

    FWorker.Cancel;
    AdjustButtons([], []);
  end;
end;

procedure TfrmNCWizard.CloseWorker;
begin
  if Assigned(FWorker) then
  begin
    FWorker.WaitFor;
    FreeAndNil(FWorker);
  end;
end;

procedure TfrmNCWizard.OnCancel(Sender: TObject);
begin
  if DOWNLOAD_PAGE_ID = FCurrentPage then
  begin
    FDownloadPage.Stop;
  end;

  if Assigned(FWorker) then
  begin
    //
    // Запущен рабочий поток -> остановим его.
    //
    CancelWorker;
    Exit;
  end;

  ModalResult := FModalResult;
end;

procedure TfrmNCWizard.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //
  // необходимо останавливать закачку INPX если она активна
  //

  if Assigned(FWorker) and not FWorker.Finished then
  begin
    //
    // Запущен рабочий поток -> остановим его.
    //
    CancelWorker;
    CanClose := False;
  end;
end;

procedure TfrmNCWizard.FormCreate(Sender: TObject);
var
  frame: TWizardPageBase;
begin
  FModalResult := mrCancel;

  //
  // Проинициализируем параметры по умолчанию
  //
  FParams.Operation := otNew;
  FParams.CollectionType := ltUser;
  FParams.FileTypes := ftFB2;
  FParams.DefaultGenres := True;

  FWelcomPage := AddPage(TframeNCWWelcom) as TframeNCWWelcom;
  FCollectionTypePage := AddPage(TframeNCWOperation) as TframeNCWOperation;
  FInpxSourcePage := AddPage(TframeNCWInpxSource) as TframeNCWInpxSource;
  FDownloadPage := AddPage(TframeNCWDownload) as TframeNCWDownload;
  FNameAndLocationPage := AddPage(TframeNCWNameAndLocation) as TframeNCWNameAndLocation;
  FFileTypesPage := AddPage(TframeNCWCollectionFileTypes) as TframeNCWCollectionFileTypes;
  FSelectGenreFilePage := AddPage(TframeNCWSelectGenreFile) as TframeNCWSelectGenreFile;
  FProgressPage := AddPage(TframeNCWProgress) as TframeNCWProgress;
  FFinishPage := AddPage(TframeNCWFinish) as TframeNCWFinish;

  for frame in FPages do
  begin
    frame.Align := alClient;
    //
    // Constraints необходимо проверять _ДО_ скрытия страницы
    //
    if Constraints.MinHeight < frame.Constraints.MinHeight then
      Constraints.MinHeight := frame.Constraints.MinHeight;
    if Constraints.MinWidth < frame.Constraints.MinWidth then
      Constraints.MinWidth := frame.Constraints.MinWidth;

    frame.Enabled := False;
    frame.Visible := False;
    frame.Initialize(@FParams);
  end;

  { TODO -oAlex -cRefactoring : Костыль! может быть его пристроить в другое место? }

  FFinishPage.lblPageHint.Caption := '';

  SetProxySettings(FDownloadPage.HTTP);

  FCurrentPage := NO_ACTIVE_PAGE;
  ShowPage(0);
end;

procedure TfrmNCWizard.AfterShowPage;
begin
  Assert(IsValidPageIndex(FCurrentPage));

  if DOWNLOAD_PAGE_ID = FCurrentPage then
  begin
    AdjustButtons([wbCancel], [wbCancel]);
    try
      if FDownloadPage.Download then
        DoChangePage(btnForward);
    except
      on E: Exception do
      begin
        MessageDlg(rstrDownloadFailed, mtError, [mbOK], 0);
        DoChangePage(btnBackward);
      end;
    end;
  end
  else if PROGRESS_PAGE_ID = FCurrentPage then
  begin
    CorrectParams;

    if not CreateCollection then
    begin
      //
      // мы не смогли создать/зарегистрировать коллекцию,
      // CancelToClose и никакого продолжения
      //
      FProgressPage.ShowSaveLogPanel(True);
      AdjustButtons([wbFinish], [wbFinish]);
      Exit;
    end;

    FModalResult := mrOk;

    if not StartImportData then
    begin
      //
      // ничего ждать не нужно, нечего импортировать
      // можно переходить на следующую страницу
      //
      RegisterCollection;
      DoChangePage(btnForward);
    end;
  end;
end;

procedure TfrmNCWizard.CorrectParams;
begin
  //
  // TODO -oNickR: интересно, почему каталог для книг и коллекции создается только в случае относительных путей?
  //
  if '' = ExtractFileExt(FParams.CollectionFile) then
    FParams.CollectionFile := ChangeFileExt(FParams.CollectionFile, COLLECTION_EXTENSION);

  if FParams.RelativePaths then
  begin
    //
    // TODO -oNickR: на мой взгляд, определение относительных путей тут неправильное
    //
    if ExtractFilePath(FParams.CollectionFile) = '' then
    begin
      FParams.CollectionFile := IncludeTrailingPathDelimiter(DATA_DIR_NAME) + FParams.CollectionFile;
      CreateFolders(Settings.AppPath, DATA_DIR_NAME);
    end;

    FParams.CollectionRoot := ExcludeTrailingPathDelimiter(FParams.CollectionRoot);

    if not DirectoryExists(FParams.CollectionRoot) then
      CreateDir(FParams.CollectionRoot);
  end
  else
  begin
    //
    // DONE -oNickR -cBug: в качестве базового каталого необходимо использовать DataPath
    //
    if ExtractFilePath(FParams.CollectionFile) = '' then
      FParams.CollectionFile := Settings.DataPath + FParams.CollectionFile;
    FParams.CollectionFile := ExpandFileName(FParams.CollectionFile);

    FParams.CollectionRoot := ExcludeTrailingPathDelimiter(ExpandFileName(FParams.CollectionRoot));
  end;

  //
  // определим реальный код коллекции
  //
  if FParams.CollectionCode = 0 then
  begin
    case FParams.CollectionType of
      ltUser:              FParams.CollectionCode := IfThen(FParams.FileTypes = ftFB2, CT_PRIVATE_FB, CT_PRIVATE_NONFB);
      ltUserFB:            FParams.CollectionCode := CT_PRIVATE_FB;
      ltUserAny:           FParams.CollectionCode := CT_PRIVATE_NONFB;
      ltExternalLocalFB:   FParams.CollectionCode := CT_EXTERNAL_LOCAL_FB;
      ltExternalOnlineFB:  FParams.CollectionCode := CT_EXTERNAL_ONLINE_FB;
      ltExternalLocalAny:  FParams.CollectionCode := CT_EXTERNAL_LOCAL_NONFB;
      ltExternalOnlineAny: FParams.CollectionCode := CT_EXTERNAL_ONLINE_NONFB;
    end;
  end;

  //
  // для специальных коллекций установим некоторые параметры по умолчанию
  //
  case FParams.CollectionType of
    ltUser: ; // ничего не трогаем, все должен задать пользователь

    ltUserFB, ltExternalLocalFB, ltExternalOnlineFB:
    begin
      FParams.DefaultGenres := True;
      FParams.FileTypes := ftFB2;
    end;

    ltUserAny, ltExternalLocalAny, ltExternalOnlineAny:
    begin
      FParams.FileTypes := ftAny;
    end;
  end;

  //
  // заполним файл жанров
  //
  if FParams.DefaultGenres then
  begin
    if FParams.FileTypes = ftFB2 then
      FParams.GenreFile := Settings.SystemFileName[sfGenresFB2]
    else
      FParams.GenreFile := Settings.SystemFileName[sfGenresNonFB2];
  end
  else
  begin
    //
    // относительно текущего каталога
    //
    FParams.GenreFile := ExpandFileName(FParams.GenreFile);
  end;

  Assert(FileExists(FParams.GenreFile));
end;

function TfrmNCWizard.CreateCollection: Boolean;
//var
//  Collection: IBookCollection;
begin
  Assert(Assigned(FProgressPage));

  Result := False;

  FProgressPage.OpenProgress;
  FProgressPage.SetComment(rstrCreationCollection);

  try
    //
    // Создаем коллекцию
    //
    if FParams.Operation <> otExisting then
    begin
      FProgressPage.ShowTeletype(rstrCreationCollection, tsInfo);
      { TODO -oNickR -cUsability : проверять существование на соответствующей странице с выдачей предупреждения }
      //Assert(not FileExists(FParams.CollectionFile));
      Assert(FileExists(FParams.GenreFile));
      {* FParams.CollectionID := *} GetSystemData.CreateCollectionDatabase(FParams.CollectionFile, FParams.GenreFile);

      //
      // Установить свойства коллекции
      //
      //Collection := GetSystemData.GetBookCollection(FParams.CollectionFile);
      //Collection.SetStringProperty(SETTING_NOTES, FParams.Notes);
      //Collection.SetIntProperty(SETTING_DATA_VERSION, UNVERSIONED_COLLECTION);
      //Collection.SetIntProperty(SETTING_CODE, FParams.CollectionCode);
      //Collection.SetStringProperty(SETTING_URL, FParams.URL);
      //Collection.SetStringProperty(SETTING_DOWNLOAD_SCRIPT, FParams.Script);
      //FProgressPage.ShowProgress(60);
    end;

    FProgressPage.ShowProgress(100);

    Result := True;
  except
    on e: Exception do
    begin
      FProgressPage.ShowTeletype(e.Message, tsError);
      if FileExists(FParams.CollectionFile) then
        DeleteFile(FParams.CollectionFile);
    end;
  end;
end;

function TfrmNCWizard.StartImportData: Boolean;
begin
  Assert(Assigned(FProgressPage));

  if FParams.Operation in [otNew, otExisting] then
  begin
    Result := False;
    Exit;
  end;

  Assert(FParams.CollectionType <> ltUser);
  Assert(FParams.INPXFile <> '');

  Assert(not Assigned(FWorker));
  FWorker := nil;

  FWorker := TImportInpxThread.Create;
  with FWorker as TImportInpxThread do
  begin
    {* CollectionID := FParams.CollectionID; *}
    DBFileName := FParams.CollectionFile;
    CollectionRoot := FParams.CollectionRoot;
    CollectionType := FParams.CollectionCode;
    InpxFileName := FParams.INPXFile;

    case FParams.CollectionType of
      ltUserFB, ltExternalLocalFB, ltExternalOnlineFB:
        GenresType := gtFb2;

      ltUserAny, ltExternalLocalAny, ltExternalOnlineAny:
        GenresType := gtAny;

      else
        Assert(False);
    end;
  end;

  Assert(Assigned(FWorker));

  FProgressPage.SetComment(rstrDataImport);
  FProgressPage.ShowTeletype(rstrDataImporting, tsInfo);

  //
  // подключить и запустить импортер
  //
  FWorker.OnOpenProgress := FProgressPage.OpenProgress;
  FWorker.OnProgress := FProgressPage.ShowProgress;
  FWorker.OnCloseProgress := FProgressPage.CloseProgress;
  FWorker.OnTeletype := FProgressPage.ShowTeletype;
  FWorker.OnSetComment := FProgressPage.SetComment;
  FWorker.OnShowMessage := ShowMessage;

  FWorker.Start;

  Result := True;
end;

procedure TfrmNCWizard.RegisterCollection;
var
  FVersion: Integer;
begin
  FProgressPage.ShowTeletype(rstrRegistration, tsInfo);

  //
  // TODO -oNickR: BUG версия коллекции больше не храниться в этом файле.
  // Версия данных коллекции должна устанавливаться при импорте из INPX или при обновлении коллекции
  //
  FVersion := 0; // GetLibUpdateVersion(True);

  //
  // TODO -oNickR -cRO Mode Support: сохранять относительные пути
  //
  GetSystemData.RegisterCollection(
    FParams.DisplayName,
    FParams.CollectionRoot,
    FParams.CollectionFile,
    FParams.CollectionCode,
    FVersion,
    FParams.Notes,
    FParams.URL,
    FParams.Script
  );
end;

function TfrmNCWizard.ShowMessage(const Text: string; Flags: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(Text), PChar(Application.Title), Flags);
end;

//
// Рабочий поток завершил свою работу
//
procedure TfrmNCWizard.PMWorkerDone(var Message: TMessage);
var
  DontChangePage: Boolean;
  IgnoreErrors : Boolean;
begin
  //
  // Если во время работы небыло ошибок и поток небыл остановлен пользователем
  //
  if FProgressPage.HasErrors then
    IgnoreErrors := (MessageDlg(rstrImportDoneWithErrors, mtWarning, [mbYes,mbNo], 0) = mrYes);

  DontChangePage := (not IgnoreErrors) or FWorker.Canceled;

  //
  // Закрыть и уничтожить рабочий поток
  //
  CloseWorker;

  //
  // все в порядке -> переходим на следующую страницу
  //
  if DontChangePage then
  begin
    //
    // TODO: пользователь отказался от продолжения, надо уничтожить _созданную_ коллекцию
    //
    if FProgressPage.HasErrors then
    begin
      FProgressPage.ShowSaveLogPanel(True);
      AdjustButtons([wbFinish], [wbFinish]);
    end
    else
    begin
      //
      // Рабочий поток был остановлен пользователем, ошибок нет -> закрываем форму
      //
      ModalResult := FModalResult;
    end;
  end
  else
  begin
    RegisterCollection;
    DoChangePage(btnForward);
  end;
end;

end.

