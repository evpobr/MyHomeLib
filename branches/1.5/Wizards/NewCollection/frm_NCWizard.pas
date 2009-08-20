{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit frm_NCWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, Dialogs,
  dm_user,
  frame_WizardPageBase,
  frame_DecorativePageBase,
  frame_InteriorPageBase,
  unit_NCWParams,
  frame_NCWWelcom,
  frame_NCWOperation,
  frame_NCWCollectionType,
  frame_NCWCollectionNameAndLocation,
  frame_NCWCollectionFileTypes,
  frame_NCWSelectGenreFile,
  frame_NCWImport,
  frame_NCWProgress,
  frame_NCWFinish,
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

  private
    FParams: TNCWParams;

    FWelcomPage: TframeNCWWelcom;
    FCollectionTypePage: TframeNCWOperation;
    FLibRusEcTypePage: TframeNCWCollectionType;
    FNameAndLocationPage: TframeNCWNameAndLocation;
    FFileTypesPage: TframeNCWCollectionFileTypes;
    FSelectGenreFilePage: TframeNCWSelectGenreFile;
    FImportPage: TframeNCWImport;
    FProgressPage: TframeNCWProgress;
    FFinishPage: TframeNCWFinish;

    FPages: array of TWizardPageBase;
    FCurrentPage: Integer;

    FWorker: TWorker;
    FVersion: Integer;
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

resourcestring
  CAPTIONCANCEL = 'Отмена';
  CAPTIONCLOSE = 'Закрыть';
  CREATIONCOLLECTION = 'Создание коллекции';
  DATAIMPORT = 'Импорт данныx';
  DATAIMPORTING = 'Импортируем данные';
  REGISTRATION = 'Регистрируем коллекцию';

implementation

uses
  unit_database,
  unit_Settings,
  unit_globals,
  unit_ImportXMLThread,
  unit_ImportInpxThread,
  unit_Consts,
  unit_mhl_strings;

{$R *.dfm}

const
  NO_ACTIVE_PAGE = -1;

  WELCOM_PAGE_ID = 0;
  OPERATION_PAGE_ID = 1;
  COLLECTIONTYPE_PAGE_ID = 2;
  NAMEANDLOCATION_PAGE_ID = 3;
  FILETYPES_PAGE_ID = 4;
  GENREFILE_PAGE_ID = 5;
  IMPORT_PAGE_ID = 6;
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

    COLLECTIONTYPE_PAGE_ID:
      Result := (FParams.Operation = otNew);

    NAMEANDLOCATION_PAGE_ID:
      Result := True;

    FILETYPES_PAGE_ID:
      Result := (FParams.CollectionType = ltEmpty);

    GENREFILE_PAGE_ID:
      Result := ((FParams.Operation = otNew) and (FParams.CollectionType = ltEmpty) and
                (FParams.FileTypes = ftAny)) or
                ((FParams.Operation = otNew) and (FParams.CollectionType = ltUserAny));

    IMPORT_PAGE_ID:
      Result := (FParams.Operation = otNew) and (FParams.CollectionType = ltEmpty);

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
    btnCancel.Caption := CAPTIONCANCEL;
    FModalResult := mrCancel;
  end
  else
  begin
    btnCancel.Caption := CAPTIONCLOSE;
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

    if not FPages[PageIndex].Activate(goForward) then
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
//  FParams.CollectionType := ltEmpty;

  FParams.CollectionType := ltLRELocal;

  FParams.UseDefaultName := True;
  FParams.UseDefaultLocation := True;
  FParams.FileTypes := ftFB2;
  FParams.DefaultGenres := True;
  FParams.DoImport := False;

  FWelcomPage := AddPage(TframeNCWWelcom) as TframeNCWWelcom;
  FCollectionTypePage := AddPage(TframeNCWOperation) as TframeNCWOperation;
  FLibRusEcTypePage := AddPage(TframeNCWCollectionType) as TframeNCWCollectionType;
  FNameAndLocationPage := AddPage(TframeNCWNameAndLocation) as TframeNCWNameAndLocation;
  FFileTypesPage := AddPage(TframeNCWCollectionFileTypes) as TframeNCWCollectionFileTypes;
  FSelectGenreFilePage := AddPage(TframeNCWSelectGenreFile) as TframeNCWSelectGenreFile;
  FImportPage := AddPage(TframeNCWImport) as TframeNCWImport;
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

  FCurrentPage := NO_ACTIVE_PAGE;
  ShowPage(0);
end;

procedure TfrmNCWizard.AfterShowPage;
begin
  Assert(IsValidPageIndex(FCurrentPage));
  if PROGRESS_PAGE_ID = FCurrentPage then
  begin
    CorrectParams;

    if not CreateCollection then
    begin
      //
      // мы не смогли создать/зарегистрировать коллекцию
      // DONE: CancelToClose и никакого продолжения
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
    end;
  end;
end;

procedure TfrmNCWizard.CorrectParams;
begin
  if not FParams.RelativePaths then
  begin
    //
    // DONE -oNickR -cBug: в качестве базового каталого необходимо использовать DataPath
    //
    if ExtractFilePath(FParams.CollectionFile) = '' then
      FParams.CollectionFile := Settings.DataPath + FParams.CollectionFile;
    FParams.CollectionFile := ExpandFileName(FParams.CollectionFile);

    if '' = ExtractFileExt(FParams.CollectionFile) then
      FParams.CollectionFile := ChangeFileExt(FParams.CollectionFile, COLLECTION_EXTENSION);

    FParams.CollectionRoot := ExcludeTrailingPathDelimiter(ExpandFileName(FParams.CollectionRoot));
  end
  else
  begin
    if ExtractFilePath(FParams.CollectionFile) = '' then
    begin
      FParams.CollectionFile := IncludeTrailingPathDelimiter(DATA_DIR_NAME) + FParams.CollectionFile;
      CreateFolders(Settings.AppPath, DATA_DIR_NAME);
    end;

    if '' = ExtractFileExt(FParams.CollectionFile) then
      FParams.CollectionFile := ChangeFileExt(FParams.CollectionFile, COLLECTION_EXTENSION);

    FParams.CollectionRoot := ExcludeTrailingPathDelimiter(FParams.CollectionRoot);

    if not DirectoryExists(FParams.CollectionRoot) then
      CreateDir(FParams.CollectionRoot);
  end;

  //
  // определим реальный код коллекции
  //
  if FParams.CollectionCode = 0 then
    if FParams.CollectionType = ltLREOnline then
      FParams.CollectionCode := CT_LIBRUSEC_ONLINE_FB
    else if FParams.CollectionType = ltLRELocal then
        FParams.CollectionCode := CT_LIBRUSEC_LOCAL_FB
    else { if FParams.CollectionType = ltEmpty then}
    begin
      if FParams.FileTypes = ftFB2 then
        FParams.CollectionCode := CT_PRIVATE_FB
      else
        FParams.CollectionCode := CT_PRIVATE_NONFB;
    end;

  //
  // для специальных коллекций установим некоторые параметры по умолчанию
  //
  case FParams.CollectionType of
    ltEmpty: ; // ничего не трогаем, все должен задать пользователь

    ltLRELocal, ltLREOnline, ltUserFB2:
    begin
      FParams.DefaultGenres := True;
      FParams.FileTypes := ftFB2;
    end;

    ltUserAny:
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

  //
  // относительно текущего каталога
  //
  if FParams.DoImport then
    FParams.ImportFile := ExpandFileName(FParams.ImportFile);

  Assert(FileExists(FParams.GenreFile));
end;

function TfrmNCWizard.CreateCollection: Boolean;
var
  ALibrary: TMHLLibrary;
begin
  Assert(Assigned(FProgressPage));

  Result := False;

  FProgressPage.OpenProgress;
  FProgressPage.SetComment(CREATIONCOLLECTION);

  try
    //
    // Создаем коллекцию
    //
    ALibrary := TMHLLibrary.Create(nil);
    try
      if FParams.Operation = otNew then
      begin
        FProgressPage.ShowTeletype(CREATIONCOLLECTION, tsInfo);
        { TODO -oNickR -cUsability : проверять существование на соответствующей странице с выдачей предупреждения }
        //Assert(not FileExists(FParams.CollectionFile));
        Assert(FileExists(FParams.GenreFile));
        ALibrary.CreateCollectionTables(FParams.CollectionFile, FParams.GenreFile);
      end;

      FProgressPage.ShowProgress(60);
    finally
      ALibrary.Free;
    end;

    FProgressPage.ShowProgress(100);

    Result := True;
  except
    //on e: EABSException do
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

  {
  1. Если подключаем существующую коллекцию, то ничего делать не надо
  2. При создании пустой импортируем данные
  3. При создании lib.rus.ec-коллекции импортируем список
  4. При создании Genesis импортируем ???
  }
  if FParams.Operation = otExisting then
  begin
    Result := False;
    Exit;
  end;

  Assert(not Assigned(FWorker));
  FWorker := nil;

  case FParams.CollectionType of
    ltEmpty:
    begin
      if FParams.DoImport then
      begin
        Assert(FileExists(FParams.ImportFile));
        FWorker := TImportXMLThread.Create;
        with FWorker as TImportXMLThread do
        begin
          XMLFileName := FParams.ImportFile;
          DBFileName := FParams.CollectionFile;
          CollectionName := FParams.DisplayName;

          //ctFBLocal = 0, ctNonFBLocal = 1
          if FParams.FileTypes = ftFB2 then
            CollectionType := CT_PRIVATE_FB
          else
            CollectionType := CT_PRIVATE_NONFB;
        end;
      end;
    end;

    ltLRELocal, ltLREOnline:
    begin
      FWorker := TImportLibRusEcThread.Create;
      with FWorker as TImportLibRusEcThread do
      begin
        DBFileName := FParams.CollectionFile;
        CollectionRoot := FParams.CollectionRoot;
        CollectionType := FParams.CollectionCode;
        InpxFileName := Settings.SystemFileName[sfLibRusEcinpx];
      end;
    end;

    ltUserFB2:
    begin
      FWorker := TImportLibRusEcThread.Create;
      with FWorker as TImportLibRusEcThread do
      begin
        DBFileName := FParams.CollectionFile;
        CollectionRoot := FParams.CollectionRoot;
        CollectionType := CT_PRIVATE_FB;
        InpxFileName := FParams.INPXFile;
        GenresType := gtFb2;
      end;
    end;

    ltUserAny:
    begin
      FWorker := TImportLibRusEcThread.Create;
      with FWorker as TImportLibRusEcThread do
      begin
        DBFileName := FParams.CollectionFile;
        CollectionRoot := FParams.CollectionRoot;
        CollectionType := CT_PRIVATE_NONFB;
        InpxFileName := FParams.INPXFile;
        GenresType := gtAny;
      end;
    end;


  end;

  if not Assigned(FWorker) then
  begin
    Result := False;
    Exit;
  end;

  FProgressPage.SetComment(DATAIMPORT);
  FProgressPage.ShowTeletype(DATAIMPORTING, tsInfo);

  //
  // подключить и запустить импортер
  //
  FWorker.OnOpenProgress := FProgressPage.OpenProgress;
  FWorker.OnProgress := FProgressPage.ShowProgress;
  FWorker.OnCloseProgress := FProgressPage.CloseProgress;
  FWorker.OnTeletype := FProgressPage.ShowTeletype;
  FWorker.OnSetComment := FProgressPage.SetComment;
  FWorker.OnShowMessage := ShowMessage;

  FWorker.Resume;

  Result := True;
end;

procedure TfrmNCWizard.RegisterCollection;
begin
  FProgressPage.ShowTeletype(REGISTRATION, tsInfo);

  FVersion := GetLibUpdateVersion(True);

  //
  // TODO -oNickR -cRO Mode Support: сохранять относительные пути
  //
  DMUser.RegisterCollection(
    FParams.DisplayName,
    FParams.CollectionRoot,
    FParams.CollectionFile,
    FParams.CollectionCode,
    isPrivateCollection(FParams.CollectionCode),
    FVersion,
    FParams.Notes
  );

  DoChangePage(btnForward);
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
  ANoChangePage: Boolean;
  IgnoreErrors : Boolean;
begin
  //
  // Если во время работы небыло ошибок и поток небыл остановлен пользователем
  //

  if FProgressPage.HasErrors then
    IgnoreErrors := ( MessageDlg('Импорт закончен с ошибками. Продолджить регистрацию коллекции ?',
                  mtWarning,[mbYes,mbNo],0) = mrYes);

  ANoChangePage := (not IgnoreErrors) or FWorker.Canceled;

  //
  // Закрыть и уничтожить рабочий поток
  //
  CloseWorker;

  //
  // все в порядке -> переходим на следующую страницу
  //
  if ANoChangePage then
  begin
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
    RegisterCollection;
end;

end.

