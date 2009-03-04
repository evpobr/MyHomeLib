
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}

unit frm_main;

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
  Dialogs,
  VirtualTrees,
  StdCtrls,
  ComCtrls,
  RzSplit,
  RzLabel,
  RzDBLbl,
  Mask,
  RzEdit,
  RzTabs,
  ExtCtrls,
  RzPanel,
  ToolWin,
  ImgList,
  Menus,
  ABSMain,
  DB,
  ShellAPI,
  ZipMstr,
  inifiles,
  RzButton,
  unit_globals,
  XPMan,
  RzCommon,
  RzSelDir,
  RzStatus,
  RzTray,
  idComponent,
  IdBaseComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  xmldom,
  XMLIntf,
  msxmldom,
  XMLDoc,
  IdAntiFreezeBase,
  IdAntiFreeze,
  pngimage,
  jpeg,
  IdCookieManager,
  unit_database,
  oxmldom,
  DBTables,
  Clipbrd,
  RzCmboBx, RzBHints, unit_CoverPanel, unit_InfoPanel, unit_Columns, ZipForge;

type

  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    miBook: TMenuItem;
    miQuitApp: TMenuItem;
    rpLang: TRzPanel;
    RusBar: TToolBar;
    tbtnStar: TToolButton;
    EngBar: TToolBar;
    ToolButton2: TToolButton;
    pmMain: TPopupMenu;
    pmiReadBook: TMenuItem;
    pmiSendToDevice: TMenuItem;
    N19: TMenuItem;
    miAddFavorites: TMenuItem;
    miDelFavorites: TMenuItem;
    miRate: TMenuItem;
    miSetRate: TMenuItem;
    miSetRate2: TMenuItem;
    miSetRate3: TMenuItem;
    miSetRate4: TMenuItem;
    miSetRate5: TMenuItem;
    N11: TMenuItem;
    miClearRate: TMenuItem;
    N20: TMenuItem;
    pmiSelectAll: TMenuItem;
    pmiDeselectAll: TMenuItem;
    N23: TMenuItem;
    miCopyClBrd: TMenuItem;
    miBookInfo: TMenuItem;
    N2: TMenuItem;
    miTools: TMenuItem;
    miSettings: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    miSaveUser: TMenuItem;
    miLoadUser: TMenuItem;
    N9: TMenuItem;
    miCollSelect: TMenuItem;
    N14: TMenuItem;
    miDeleteCol: TMenuItem;
    N18: TMenuItem;
    miStat: TMenuItem;
    N28: TMenuItem;
    miRead: TMenuItem;
    miDevice: TMenuItem;
    dlgFolder: TRzSelDirDialog;
    N31: TMenuItem;
    miRepairUser: TMenuItem;
    miEditBook: TMenuItem;
    N7: TMenuItem;
    StatusBar: TRzStatusBar;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    spStatus: TRzStatusPane;
    VersionInfo: TRzVersionInfo;
    spProgress: TRzProgressStatus;
    miCollsettings: TMenuItem;
    N16: TMenuItem;
    miCopyToCollection: TMenuItem;
    CopyToCollection: TMenuItem;
    miDeleteBook: TMenuItem;
    miImport: TMenuItem;
    miFb2ZipImport: TMenuItem;
    N26: TMenuItem;
    miFb2Import: TMenuItem;
    miAbout: TMenuItem;
    miCheckUpdates: TMenuItem;
    N30: TMenuItem;
    miShowHelp: TMenuItem;
    RzStatusPane1: TRzStatusPane;
    IdAntiFreeze1: TIdAntiFreeze;
    N17: TMenuItem;
    pmAuthor: TPopupMenu;
    miCopyAuthor: TMenuItem;
    miPdfdjvu: TMenuItem;
    miCollectionExport: TMenuItem;
    miCollectionImport: TMenuItem;
    miBookEdit: TMenuItem;
    N24: TMenuItem;
    miRefreshGenres: TMenuItem;
    miDownloadBooks: TMenuItem;
    pmiDownloadBooks: TMenuItem;
    miEdit: TMenuItem;
    miEditAuthor: TMenuItem;
    miEditSeries: TMenuItem;
    miEditGenres: TMenuItem;
    ilToolBar: TImageList;
    ilMainMenu: TImageList;
    MenuController: TRzMenuController;
    pmCollection: TPopupMenu;
    miUpdate: TMenuItem;
    miGoToAuthor: TMenuItem;
    tlbrMain: TToolBar;
    tbtnRead: TToolButton;
    tbSendToDevice: TToolButton;
    tbtnRus: TToolButton;
    tbtnEng1: TToolButton;
    tbSelectAll: TToolButton;
    tbCollapse: TToolButton;
    btnRefreshCollection: TToolButton;
    tbtnShowCover: TToolButton;
    tbtnShowDeleted: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    BtnFav_add: TToolButton;
    ToolButton5: TToolButton;
    tbtnSettings: TToolButton;
    tbtnSelect: TToolButton;
    pmScripts: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    pmiScripts: TMenuItem;
    mmiScripts: TMenuItem;
    miSyncOnline: TMenuItem;
    btnSwitchTreeMode: TToolButton;
    tbtnWizard: TToolButton;
    tbtnShowLocalOnly: TToolButton;
    tbtnDownloadBooks: TToolButton;
    N1: TMenuItem;
    miGoDonate: TMenuItem;
    miGoSite: TMenuItem;
    miGoForum: TMenuItem;
    RzURLLabel1: TRzURLLabel;
    pgControl: TRzPageControl;
    TabSheet4: TRzTabSheet;
    RzPanel9: TRzPanel;
    RzPanel10: TRzPanel;
    tvBooksSR: TVirtualStringTree;
    RichEdit2: TRichEdit;
    RzPanel11: TRzPanel;
    Label10: TLabel;
    Label12: TLabel;
    lblTotalBooksSR: TRzLabel;
    edTitle: TRzEdit;
    btnSearch: TRzBitBtn;
    cbFullText: TCheckBox;
    edAuth: TRzEdit;
    ipnlSearch: TMHLInfoPanel;
    cpCoverSR: TMHLCoverPanel;
    TabSheet5: TRzTabSheet;
    RzPanel20: TRzPanel;
    RzPanel21: TRzPanel;
    tvBooksF: TVirtualStringTree;
    ipnlFavorites: TMHLInfoPanel;
    lblTotalBooksF: TRzLabel;
    btnClearFavorites: TRzBitBtn;
    cpCoverF: TMHLCoverPanel;
    TabSheet6: TRzTabSheet;
    RzPanel29: TRzPanel;
    RichEdit5: TRichEdit;
    pnlFilters: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edFExt: TRzEdit;
    edFFolder: TRzEdit;
    edFFile: TRzEdit;
    cbDeleted: TCheckBox;
    cbDownloaded: TRzComboBox;
    cbDate: TRzComboBox;
    RzGroupBox3: TRzGroupBox;
    Label24: TLabel;
    Label26: TLabel;
    Label23: TLabel;
    edFSeries: TRzEdit;
    edFTitle: TRzEdit;
    edFFullName: TRzEdit;
    RzGroupBox4: TRzGroupBox;
    btnInsertFilterTemplate: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzToolButton6: TRzToolButton;
    RzToolButton5: TRzToolButton;
    RzToolButton4: TRzToolButton;
    RzToolButton7: TRzToolButton;
    RzToolButton8: TRzToolButton;
    RzToolButton9: TRzToolButton;
    lblTotalBooksFL: TRzLabel;
    RzToolButton1: TRzToolButton;
    btnApplyFilter: TRzBitBtn;
    btnClearFilterEdits: TRzBitBtn;
    tvBooksFL: TVirtualStringTree;
    ipnlFilter: TMHLInfoPanel;
    cpCoverFL: TMHLCoverPanel;
    ilFileTypes: TImageList;
    TabSheet1: TRzTabSheet;
    rzsSplitterA: TRzSplitter;
    RzPanel13: TRzPanel;
    tvAuthors: TVirtualStringTree;
    RzPanel16: TRzPanel;
    Label19: TLabel;
    tbClearEdAuthor: TRzToolButton;
    edLocateAuthor: TRzEdit;
    RzPanel15: TRzPanel;
    RzPanel17: TRzPanel;
    RzPanel18: TRzPanel;
    lblAuthor: TRzDBLabel;
    lblBooksTotalA: TRzLabel;
    RzPanel23: TRzPanel;
    tvBooksA: TVirtualStringTree;
    ipnlAuthors: TMHLInfoPanel;
    cpCoverA: TMHLCoverPanel;
    pmHeaders: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N25: TMenuItem;
    N27: TMenuItem;
    TabSheet2: TRzTabSheet;
    rzsSplitterS: TRzSplitter;
    RzPanel1: TRzPanel;
    tvSeries: TVirtualStringTree;
    RzPanel19: TRzPanel;
    Label11: TLabel;
    btnClearEdSeries: TRzToolButton;
    edLocateSeries: TRzEdit;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    lblSeries: TRzDBLabel;
    lblBooksTotalS: TRzLabel;
    tvBooksS: TVirtualStringTree;
    RichEdit1: TRichEdit;
    ipnlSeries: TMHLInfoPanel;
    cpCoverS: TMHLCoverPanel;
    TabSheet3: TRzTabSheet;
    rzsSplitterG: TRzSplitter;
    RzPanel25: TRzPanel;
    tvGenres: TVirtualStringTree;
    RzPanel27: TRzPanel;
    RzPanel28: TRzPanel;
    tvBooksG: TVirtualStringTree;
    RichEdit4: TRichEdit;
    RzPanel26: TRzPanel;
    lblBooksTotalG: TRzLabel;
    lblGenreTitle: TRzLabel;
    ipnlGenres: TMHLInfoPanel;
    cpCoverG: TMHLCoverPanel;
    btnClearSerach: TRzBitBtn;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    TrayIcon: TTrayIcon;
    pmTray: TPopupMenu;
    N29: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;

    //
    // События формы
    //
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    //
    //
    //
    procedure tvAuthorsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure tvBooksAGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure tvBooksGGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure tvBooksSGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure tvBooksFGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure tvBooksSRGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure tvGenresGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);

    //
    //
    //
    procedure tvAuthorsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvSeriesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvGenresChange(Sender: TBaseVirtualTree; Node: PVirtualNode);

    //
    // Код следующих 4-х методов совпадает с точностью до названия объектов
    // НО! внутри обрабатываются разные наборы контролов
    //
    procedure tvAuthorsPaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType);

    //
    //
    //
    procedure tvBooksTreeBeforeCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure tvBooksTreeAfterCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellRect: TRect);

    //
    //
    //
    procedure tvBooksAGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure tvAuthorsGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure tvBooksGGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);

    //
    //
    //
    procedure miQuitAppClick(Sender: TObject);
    procedure tbtnStarClick(Sender: TObject);
    procedure tbtbnReadClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miAddFavoritesClick(Sender: TObject);
    procedure btnClearFavoritesClick(Sender: TObject);
    procedure tbtnRusClick(Sender: TObject);
    procedure tbtnEngClick(Sender: TObject);
    procedure tbSelectAllClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure tbSendToDeviceClick(Sender: TObject);
    procedure pmiSelectAllClick(Sender: TObject);
    procedure pmiDeselectAllClick(Sender: TObject);
    procedure miCopyClBrdClick(Sender: TObject);

    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);


    procedure miDelFavoritesClick(Sender: TObject);
    procedure miSetRateClick(Sender: TObject);
    procedure miClearRateClick(Sender: TObject);
    procedure tbCollapseClick(Sender: TObject);
    procedure edLocateAuthorChange(Sender: TObject);
    procedure edLocateSeriesChange(Sender: TObject);
    procedure miStatClick(Sender: TObject);
    procedure miCollsettingsClick(Sender: TObject);
    procedure miActiveCollectionClick(Sender: TObject);
    procedure miDeleteColClick(Sender: TObject);
    procedure CopyToCollectionClick(Sender: TObject);
    procedure miDeleteBookClick(Sender: TObject);
    procedure miFb2ZipImportClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miCheckUpdatesClick(Sender: TObject);
    procedure miGoForumClick(Sender: TObject);
    procedure miGoSiteClick(Sender: TObject);
    procedure miShowHelpClick(Sender: TObject);
    procedure miGoToAuthorClick(Sender: TObject);
    procedure miFb2ImportClick(Sender: TObject);
    procedure miBookInfoClick(Sender: TObject);
    procedure tbtnShowCoverClick(Sender: TObject);
    procedure miCopyAuthorClick(Sender: TObject);
    procedure tbtnShowDeletedClick(Sender: TObject);
    procedure pgControlChange(Sender: TObject);
    procedure miPdfdjvuClick(Sender: TObject);
    procedure miCollectionExportClick(Sender: TObject);
    procedure miCollectionImportClick(Sender: TObject);
    procedure miEditBookClick(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);

    procedure miRefreshGenresClick(Sender: TObject);
    procedure miDownloadBooksClick(Sender: TObject);
    procedure miEditAuthorClick(Sender: TObject);
    procedure miEditSeriesClick(Sender: TObject);
    procedure miEditGenresClick(Sender: TObject);
    procedure miUpdateClick(Sender: TObject);
    procedure BtnFav_addClick(Sender: TObject);
    procedure miSyncOnlineClick(Sender: TObject);
    procedure btnSwitchTreeModeClick(Sender: TObject);
    //
    //
    //
    procedure tvBooksTreeHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvBooksTreeCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure tvBooksTreePaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType);
    procedure tbtnShowLocalOnlyClick(Sender: TObject);
    procedure ShowNewCollectionWizard(Sender: TObject);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure btnApplyFilterClick(Sender: TObject);
    procedure btnClearFilterEditsClick(Sender: TObject);
    procedure btnInsertFilterTemplateClick(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvBooksTreeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvBooksTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAuthKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFFullNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure miGoDonateClick(Sender: TObject);
    procedure tbClearEdAuthorClick(Sender: TObject);
    procedure btnClearEdSeriesClick(Sender: TObject);
    procedure tvBooksTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvBooksTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure HeaderPopupItemClick(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure btnClearSerachClick(Sender: TObject);
    procedure CoverPanelResize(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure N33Click(Sender: TObject);

  private

    // посик аторов, серий

    FSimulateAlphabetClick: Boolean;
    FIgnoreChange : boolean;

    //
    // Построение деревьев
    //
    procedure FillAuthorTree;
    procedure FillSeriesTree;
    procedure FillBooksTree(
      const ParentID: Integer;
      const Tree: TVirtualStringTree;
      const Master: TAbsTable;
      const Detail: TAbsTable;
      ShowAuth: Boolean;
      ShowSer: Boolean
      );

    //
    // TODO -oNickR -cRefactoring : вынести эти методы в соответствующие датамодули
    //
    procedure SetTableStatus(Status: boolean);
    procedure SetUserTableStatus(Status: boolean);
    procedure SetUtilTableStatus(Status: boolean);

    procedure ReadINIData;

    procedure GetActiveTree(var Tree: TVirtualStringTree);
    procedure Selection(SelState: boolean);
    procedure LocateBookList(const text: String; Tree: TVirtualStringTree);
    procedure InitCollection(ApplyAuthorFilter: Boolean);

    procedure CreateCollectionMenu;
    procedure CreateScriptMenu;
    procedure SetColors;
    procedure CreateAlphabet;

    procedure GetBookRecord(const ID: integer; var R: TBookRecord);

    function IsLibRusecEdit(ID: integer): boolean;

    procedure ClearInfoPanel;
    procedure WMGetSysCommand(var Message :TMessage); message WM_SYSCOMMAND;
  public
    procedure FillGenresTree(Tree: TVirtualStringTree);
    procedure DisableControls(State: boolean);
    procedure DisableMainMenu(State: boolean);

  private
    FShowingInfo: Boolean;
    FSelectionState: boolean;
    FCollectionRoot: string;

    FAutoCheck: boolean;
    FFormBusy: boolean;

    FFileOpMode: (fmFb2Zip, fmFb2);
    FDoNotLocate: Boolean;

    FLastLetter: TToolButton;
    ALetter: TToolButton;
    BookTreeStatus: (bsFree, bsBusy);
    Res: Integer;
    FDownloadSize: Integer;

    FSortSettings: array [0..5] of record
                     Column: TColumnIndex;
                     Direction:TSortDirection;
                   end;  

    procedure FillBookIdList(const Tree: TVirtualStringTree;
      var BookIDList: TBookIdList);
    function GetActiveBookTable(tag: integer): TAbsTable;
    procedure ClearLabels(Tag: integer);
    procedure CreateColumns(Tree: TVirtualStringTree; Properties: array of TColumnData);
    procedure SetBooksFilter;
    procedure FillAllBooksTree;
    procedure ChangeLetterButton(S: string);
    function DoCheckUpdatesOnStart: Boolean;
    procedure GetActiveViewComponents(var Tree: TVirtualStringTree;
      var Panel: TMHLInfoPanel; var Cover: TMHLCoverPanel);
    procedure SetCoversVisible(State: boolean);
    procedure RefreshBooksState(Tree: TVirtualStringTree;
      BookIDList: TBookIdList);
    procedure SetColumns;
    procedure SaveColumns;
    function GetTreeTag(const Sender: TBaseVirtualTree;
      const Column: integer): integer;
    function GetText(Tag: integer; Data: PBookData): string;
    procedure SetHeaderPopUp;
    procedure RestorePositions;
    type
      TView = (ByAuthorView, BySeriesView, ByGenreView, SearchView, FavoritesView,FilterView);

    function GetActiveView: TView;
    property ActiveView: TView read GetActiveView;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  dm_main,
  dm_user,
  frm_statistic,
  frm_splash,
  frm_settings,
  frm_genre_tree,
  frm_edit_reader,
  frm_edit_book_info,
  frm_edit_author,
  frm_book_info,
  frm_bases,
  frm_add_nonfb2,
  frm_about,
  fictionbook_21,
  unit_TreeUtils,
  unit_MHL_xml,
  unit_MHL_strings,
  StrUtils,
  unit_Settings,
  unit_Import,
  unit_Consts,
  unit_Export,
  unit_Utils,
  unit_ExportToDevice,
  unit_ExportToDeviceThread,
  unit_Helpers,
  frm_NCWizard,
  DateUtils,
  idStack,
  idException;

resourcestring
  rstrFileNotFoundMsg = 'Файл %s не найден!'#13'Проверьте настройки коллекции!';

{$R *.dfm}
//
// Helpers
//

const
  TreeIcons : array [0 .. 1] of integer = (10,11);
  TreeHints : array [0 .. 1] of string =(
                                    'Переключится в режим "Таблица"',
                                    'Переключится в режим "Дерево"'
                                    );



procedure TfrmMain.WMGetSysCommand(var Message : TMessage) ;
begin
  if (Message.wParam = SC_MINIMIZE) and Settings.MinimizeToTray then
  begin
    TrayIcon.Visible := True;
    Hide;
  end
  else inherited;
end;

procedure TfrmMain.RestorePositions;
begin
  // восстанавливаем последнего автора, серию и отмеченные книги
  // порядок зависит от авктивной вкладки.


  FSimulateAlphabetClick := False;

  case ActiveView of
    ByAuthorView,
    ByGenreView,
    FavoritesView,
    SearchView,
    FilterView:begin
                    edLocateSeries.Text := Settings.LastSeries;
                    FSimulateAlphabetClick := True;

                    SelectBookById(tvBooksF,Settings.LastBookInFavorites);
                    SelectBookById(tvBooksS,Settings.LastBookInSeries);

                    edLocateAuthor.Text := Settings.LastAuthor;
                    SelectBookById(tvBooksA,Settings.LastBookInAuthors);
                  end;
    BySeriesView: begin
                    edLocateAuthor.Text := Settings.LastAuthor;
                    FSimulateAlphabetClick := True;

                    SelectBookById(tvBooksA,Settings.LastBookInAuthors);
                    SelectBookById(tvBooksF,Settings.LastBookInFavorites);

                    edLocateSeries.Text := Settings.LastSeries;
                    SelectBookById(tvBooksS,Settings.LastBookInSeries);
                  end;
    end; // Case

  FIgnoreChange := True;
  edLocateAuthor.Text := '';
  edLocateSeries.Text := '';
  FIgnoreChange := False;
end;

procedure TfrmMain.SetColumns;
var
  Columns : TColumns;

begin
  Columns := TColumns.Create(Settings.WorkPath + 'columns.ini');
  try

    if Settings.TreeModes[PAGE_AUTHORS] = tmTree then
      Columns.Load(SECTION_A_TREE,tmTree)
    else
      Columns.Load(SECTION_A_FLAT,tmFlat);
    Columns.SetColumns(tvBooksA.Header.Columns);


    if Settings.TreeModes[PAGE_SERIES] = tmTree then
      Columns.Load(SECTION_S_TREE,tmTree)
    else
      Columns.Load(SECTION_S_FLAT,tmFlat);
    Columns.SetColumns(tvBooksS.Header.Columns);


    if Settings.TreeModes[PAGE_GENRES] = tmTree then
      Columns.Load(SECTION_G_TREE,tmTree)
    else
      Columns.Load(SECTION_G_FLAT,tmFlat);
    Columns.SetColumns(tvBooksG.Header.Columns);


    if Settings.TreeModes[PAGE_FAVORITES] = tmTree then
      Columns.Load(SECTION_F_TREE,tmTree)
    else
      Columns.Load(SECTION_F_FLAT,tmFlat);
    Columns.SetColumns(tvBooksF.Header.Columns);


    if Settings.TreeModes[PAGE_SEARCH] = tmTree then
      Columns.Load(SECTION_SR_TREE,tmTree)
    else
      Columns.Load(SECTION_SR_FLAT,tmFlat);
    Columns.SetColumns(tvBooksSR.Header.Columns);


    if Settings.TreeModes[PAGE_FILTER] = tmTree then
      Columns.Load(SECTION_FL_TREE,tmTree)
    else
      Columns.Load(SECTION_FL_FLAT,tmFlat);
    Columns.SetColumns(tvBooksFL.Header.Columns);


    //-------------------------------------------------------------------------
    tvBooksA.Header.MainColumn := 1;
    tvBooksS.Header.MainColumn := 1;
    tvBooksG.Header.MainColumn := 1;
    tvBooksF.Header.MainColumn := 1;
    tvBooksSR.Header.MainColumn := 1;
    tvBooksFL.Header.MainColumn := 1;

  finally
    Columns.Free;
  end;
end;

procedure TfrmMain.SaveColumns;
var
  Columns: TColumns;

begin
  Columns := TColumns.Create(Settings.WorkPath + 'columns.ini');
  try

    Columns.GetColumns(tvBooksA.Header.Columns);
    if Settings.TreeModes[PAGE_AUTHORS] = tmTree then
      Columns.Save(SECTION_A_TREE)
    else
      Columns.Save(SECTION_A_FLAT);

    Columns.GetColumns(tvBooksS.Header.Columns);
    if Settings.TreeModes[PAGE_SERIES] = tmTree then
      Columns.Save(SECTION_S_TREE)
    else
      Columns.Save(SECTION_S_FLAT);

    Columns.GetColumns(tvBooksG.Header.Columns);
    if Settings.TreeModes[PAGE_Genres] = tmTree then
      Columns.Save(SECTION_G_TREE)
    else
      Columns.Save(SECTION_G_FLAT);

    Columns.GetColumns(tvBooksF.Header.Columns);
    if Settings.TreeModes[PAGE_FAVORITES] = tmTree then
      Columns.Save(SECTION_F_TREE)
    else
      Columns.Save(SECTION_F_FLAT);

    Columns.GetColumns(tvBooksFL.Header.Columns);
    if Settings.TreeModes[PAGE_FILTER] = tmTree then
      Columns.Save(SECTION_FL_TREE)
    else
      Columns.Save(SECTION_FL_FLAT);

    Columns.GetColumns(tvBooksSR.Header.Columns);
    if Settings.TreeModes[PAGE_SEARCH] = tmTree then
      Columns.Save(SECTION_SR_TREE)
    else
      Columns.Save(SECTION_SR_FLAT);

  finally
    Columns.Free;
  end;
end;


procedure TfrmMain.ChangeLetterButton(S: string);
var
  i: integer;
begin
  for I := 0 to RusBar.ControlCount - 1 do
    if RusBar.Controls[i] is TToolButton then
      if (RusBar.Controls[i] as TToolButton).Caption = S then
      begin
        tbtnStarClick(RusBar.Controls[i] as TToolButton);
        Exit;
      end;
  for I := 0 to EngBar.ControlCount - 1 do
    if EngBar.Controls[i] is TToolButton then
      if (EngBar.Controls[i] as TToolButton).Caption = S then
      begin
        tbtnStarClick(EngBar.Controls[i] as TToolButton);
        Exit;
      end;
end;

procedure TfrmMain.CreateColumns(Tree: TVirtualStringTree; Properties: array of TColumnData);
var
  Column: TVirtualTreeColumn;
  i: integer;
begin
  Tree.Header.Columns.Clear;
  for I := 0 to High(Properties) do
  begin
    Column := TVirtualTreeColumn.Create(Tree.Header.Columns);
    Column.Text  := Properties[i].Text;
    Column.Position :=  Properties[i].Position;
    Column.Width :=  Properties[i].Width;
    Column.MaxWidth := Properties[i].MaxWidth;
    Column.MinWidth := Properties[i].MinWidth;
    Column.Alignment := Properties[i].Alignment;
    Column.Options := Properties[i].Options;
  end;
  Tree.Header.MainColumn := 0;
end;

procedure TfrmMain.SetColors;
var
  BGColor: TColor;
  TreeFontSize: Integer;
  FontColor: TColor;

  procedure SetTreeViewColor(AControl: TVirtualStringTree);
  begin
    AControl.Color := BGColor;
    AControl.Font.Size := TreeFontSize;
    AControl.Font.Color := FontColor;
  end;

  procedure SetEditColor(AControl: TRzEdit);
  begin
    AControl.Color := BGColor;
    AControl.Font.Color := FontColor;
  end;

begin
  BGColor := Settings.BGColor;
  TreeFontSize := Settings.TreeFontSize;
  FontColor := Settings.FontColor;

  cpCoverA.FontSize := Settings.ShortFontSize;
  cpCoverS.FontSize := Settings.ShortFontSize;
  cpCoverG.FontSize := Settings.ShortFontSize;
  cpCoverF.FontSize := Settings.ShortFontSize;
  cpCoverSR.FontSize := Settings.ShortFontSize;
  cpCoverFL.FontSize := Settings.ShortFontSize;


  SetTreeViewColor(tvAuthors);
  SetTreeViewColor(tvBooksA);
  SetTreeViewColor(tvBooksS);
  SetTreeViewColor(tvBooksG);
  SetTreeViewColor(tvBooksSR);
  SetTreeViewColor(tvBooksF);
  SetTreeViewColor(tvSeries);
  SetTreeViewColor(tvGenres);
  SetTreeViewColor(tvBooksFL);

  SetEditColor(edLocateAuthor);
  SetEditColor(edLocateSeries);
  SetEditColor(edAuth);
  SetEditColor(edTitle);
end;

procedure TfrmMain.ReadINIData;
begin
  cbFullText.Checked := Settings.FullTextSearch;



  SetColors;

  RusBar.Visible := Settings.ShowRusBar;
  EngBar.Visible := Settings.ShowEngBar;

  tbtnShowDeleted.Down := Settings.DoNotShowDeleted ;
  tbtnShowLocalOnly.Down := Settings.ShowLocalOnly ;

  CreateScriptMenu;
  if Settings.DefaultScript <> 0 then
  begin
    tbSendToDevice.Tag := 900 + Settings.DefaultScript;
    pmiSendToDevice.Tag := 900 + Settings.DefaultScript;
    miDevice.Tag := 900 + Settings.DefaultScript;
  end
  else
  begin
    tbSendToDevice.Tag := 0;
    pmiSendToDevice.Tag := 0;
    miDevice.Tag := 0;
  end;

  pgControl.ActivePageIndex := Settings.ActivePage;

  cpCoverA.TmpFolder := Settings.TempPath;
  cpCoverS.TmpFolder := Settings.TempPath;
  cpCoverG.TmpFolder := Settings.TempPath;
  cpCoverF.TmpFolder := Settings.TempPath;
  cpCoverSR.TmpFolder := Settings.TempPath;
  cpCoverFL.TmpFolder := Settings.TempPath;

  cpCoverA.Fb2InfoVisible := Settings.ShowFb2Info;
  cpCoverS.Fb2InfoVisible := Settings.ShowFb2Info;
  cpCoverG.Fb2InfoVisible := Settings.ShowFb2Info;
  cpCoverF.Fb2InfoVisible := Settings.ShowFb2Info;
  cpCoverSR.Fb2InfoVisible := Settings.ShowFb2Info;
  cpCoverFL.Fb2InfoVisible := Settings.ShowFb2Info;

end;

procedure TfrmMain.btnApplyFilterClick(Sender: TObject);
var FilterString: String;
    SeriesFilter: String;
    OldFilter: String;
    Filtered: boolean;

    procedure AddToFilter(Field,Value:String);
    begin
      if Value = '' then Exit;
      Value := trim(AnsiUpperCase(Value));

      StrReplace('NOT LIKE', 'NOT#LIKE',Value);
      StrReplace(' LIKE', ' ' + Field + '#LIKE',Value);
      StrReplace(' =', ' ' + Field + '#=',Value);
      StrReplace(' <>', ' ' + Field + '#<>',Value);
      StrReplace(' <', ' ' + Field + '#<',Value);
      StrReplace(' >', ' ' + Field + '#>',Value);

      StrReplace('#',' ',Value);

      if FilterString <> '' then
        FilterString := FilterString + ' and (' + Field + ' ' + Value + ')'
      else
        FilterString := '(' + Field + ' ' + Value + ')';
    end;

    procedure AddSeriesToFilter(Value:string);
    begin
      if SeriesFilter <> '' then
        SeriesFilter := SeriesFilter + ' or (`SerID` ="' + Value + '")'
      else
        SeriesFilter := '(`SerID` ="' +  Value + '")';
    end;

begin
  Screen.Cursor := crSQLWAit;
  spStatus.Caption := 'Подготовка фильтра ...'; spStatus.Repaint;
  tvBooksFL.Clear;
  lblTotalBooksFL.Caption := '(0)';
  FilterString := '';
  ClearLabels(tvBooksFL.Tag);
  try
    try

      // Сначала создаем фильтр по сериям
      if edFSeries.Text <> '' then
      begin
        OldFilter := DMMain.tblSeries.Filter;
        Filtered :=  DMMain.tblSeries.Filtered;

        FilterString := '';

        AddToFilter('Title',edFSeries.Text);
        DMMain.tblSeries.Filter := FilterString;
        DMMain.tblSeries.Filtered := True;

        SeriesFilter := '';
        DMMain.tblSeries.First;
        while not DMMain.tblSeries.Eof do
        begin
          AddSeriesToFilter(DMMain.tblSeries.FieldByName('Id').AsString);
          DMMain.tblSeries.Next;
        end;
        DMMain.tblSeries.Filter := OldFilter;
        DMMain.tblSeries.Filtered := Filtered;
      end;

      // Собираем фильтры в кучу

      if (SeriesFilter <> '') then
        FilterString := '( ' + SeriesFilter + ')';

      // Добавляем фильтры по таблице Books

      OldFilter := DMMain.tblBooks.Filter;
      Filtered :=  DMMain.tblBooks.Filtered;

      AddToFilter('`FullName`',edFFullName.Text);
      AddToFilter('`Title`',edFTitle.Text);
      AddToFilter('`FileName`',edFFile.Text);
      AddToFilter('`Folder`',edFFolder.Text);
      AddToFilter('`ext`',edFExt.Text);

      if cbDate.ItemIndex = -1 then
        AddToFilter('`Date`',cbDate.Text)
      else
        case cbDate.ItemIndex of
          0:AddToFilter('`Date`',Format('> "%s"',[DateToStr(IncDay(Now,- 7))]));
          1:AddToFilter('`Date`',Format('> "%s"',[DateToStr(IncDay(Now,- 14))]));
          2:AddToFilter('`Date`',Format('> "%s"',[DateToStr(IncDay(Now,- 30))]));
          3:AddToFilter('`Date`',Format('> "%s"',[DateToStr(IncDay(Now,- 90))]));
        end;

      case cbDownloaded.ItemIndex of
        1:if (FilterString = '') then
            FilterString := '(`Local` = True)'
          else
            FilterString := FilterString + ' AND (`Local` = True)';
        2:if (FilterString = '') then
            FilterString := '(`Local` = False)'
          else
            FilterString := FilterString + ' AND (`Local` = False)';
      end;

      if cbDeleted.Checked then
        if (FilterString = '') then
          FilterString := '(`Deleted` = False)'
      else
          FilterString := FilterString + ' AND (`Deleted`= False)';

      if FilterString = '' then Exit;

      // Ставим фильтр
      spStatus.Caption := 'Применяем фильтр ...'; spStatus.Repaint;

      if FilterString = '' then
        raise Exception.Create('Проверьте параметры фильтра');
      
      DMMain.tblBooks.Filter := FilterString;

      DMMain.tblBooks.Filtered := True;
      FillBooksTree(0, tvBooksFL, nil, DMmain.tblBooks, True, True);
    except
      on E: Exception do
        ShowMessage('Синтаксическая ошибка. Проверьте параметры фильтра');
    end;
  finally
    DMMain.tblBooks.Filtered := False;
    DMMain.tblBooks.Filter := OldFilter;
    DMMain.tblBooks.Filtered := Filtered;

    Screen.Cursor := crDefault;
    spStatus.Caption := 'Готово.';
    ClearLabels(PAGE_FILTER);
  end;
end;

procedure TfrmMain.btnClearFilterEditsClick(Sender: TObject);
begin
  edFFullName.Text :='';
  edFSeries.Text :='';
  edFTitle.Text  := '';
  edFFile.Text   := '';
  edFFolder.Text := '';
  edFExt.Text    := '';
  cbDate.Text   := '';
  cbDownloaded.ItemIndex := 0;
  tvBooksFL.Clear;
  ClearLabels(PAGE_FILTER);
end;

procedure TfrmMain.btnClearSerachClick(Sender: TObject);
begin
  edAuth.Text    := '';
  edTitle.Text   := '';
  tvBooksSR.Clear;
  ClearLabels(PAGE_SEARCH);
end;

procedure TfrmMain.btnInsertFilterTemplateClick(Sender: TObject);
var
   I: integer;
   OldText: string;
   p: integer;
   AddText: string;
   Offset : integer;
begin
  if not (frmMain.ActiveControl is TRzEdit)
    and not (frmMain.ActiveControl is TRzComboBox)
    then
      Exit;
   if frmMain.ActiveControl is TRzEdit then
   begin
     OldText := (frmMain.ActiveControl as TRzEdit).Text;
     p := (frmMain.ActiveControl as TRzEdit).SelStart;
   end
   else
   begin
     OldText := (frmMain.ActiveControl as TRzComboBox).Text;
     p := (frmMain.ActiveControl as TRzComboBox).SelStart;
   end;

    case (Sender as TrzToolButton).Tag of
      50: begin
            AddText := 'LIKE "%%"';
            OffSet  := P + 7;
          end;
      51: begin
            AddText := '=""';
            OffSet  := P + 2;
          end;
      52: begin
            AddText := '<> ""';
            OffSet  := P + 4;
          end;
      53: begin
            AddText := '<""';
            OffSet  := P + 2;
          end;
      54: begin
            AddText := '>""';
            OffSet  := P + 2;
          end;
      55: begin
            AddText := '("")';
            OffSet  := P + 2;
          end;
      56: begin
            AddText := ' AND ';
            OffSet  := P + 5;
          end;
      57: begin
            AddText := ' OR ';
            OffSet  := P + 4;
          end;
       58: begin
            AddText := ' NOT ';
            OffSet  := P + 5;
          end;
       59: begin
            AddText := '""';
            OffSet  := P + 1;
          end;
    end;

    Insert(AddText + ' ',OldText, P + 1);
   if frmMain.ActiveControl is TRzEdit then
   begin
    (frmMain.ActiveControl as TRzEdit).Text := OldText;
    (frmMain.ActiveControl as TRzEdit).SelStart := Offset;
    (frmMain.ActiveControl as TRzEdit).SelLength := 0;
   end
   else
   begin
    (frmMain.ActiveControl as TRzComboBox).Text := OldText;
    (frmMain.ActiveControl as TRzComboBox).SelStart := Offset;
    (frmMain.ActiveControl as TRzComboBox).SelLength := 0;
   end;
end;

function TfrmMain.GetActiveView: TView;
const
  //
  // ВНИМАНИЕ!!! Порядок и количество элементов массива views должно совпадать с порядком и количеством закладок
  //
  views: array[0..5] of TView = (
    ByAuthorView,
    BySeriesView,
    ByGenreView,
    SearchView,
    FavoritesView,
    FilterView
    );

begin
  Assert((Low(views) <= pgControl.ActivePageIndex) and (pgControl.ActivePageIndex <= High(views)));

  Result := views[pgControl.ActivePageIndex];
end;

procedure TfrmMain.DisableMainMenu(State: boolean);
var
  i: integer;
begin
  for I := 0 to MainMenu.Items.Count - 1 do
    MainMenu.Items[i].Enabled := State;
end;

procedure TfrmMain.DisableControls(State: boolean);
var
  i: integer;
begin
  miCollsettings.Enabled := State;
  miDeleteCol.Enabled := State;
  miStat.Enabled := State;
  miRead.Enabled := State;
  miDevice.Enabled := State;
  btnSearch.Enabled := State;
  btnClearFavorites.Enabled := State;
  edAuth.Enabled := State;
  edTitle.Enabled := State;
  edLocateAuthor.Enabled := State;
  edLocateSeries.Enabled := State;
  pmMain.AutoPopup := State;
  miImport.Enabled := State;
  miRead.Enabled := State;
  miDevice.Enabled := State;
  pgControl.Enabled := State;
  miCollectionExport.Enabled := State;
  miCollectionImport.Enabled := State;
  miRefreshGenres.Enabled := State;
  miDeleteBook.Enabled := State;
  miEdit.Enabled := State;
  btnRefreshCollection.Enabled := State;
  tbtnSelect.Enabled := State;
  miTools.Enabled := State;
  pmiScripts.Enabled := State;
  miDownloadBooks.Enabled := State;

  for I := 0 to RusBar.ControlCount - 1 do
    RusBar.Controls[i].Enabled := State;
  for I := 0 to EngBar.ControlCount - 1 do
    EngBar.Controls[i].Enabled := State;
  for I := 0 to tlbrMain.ControlCount - 1 do
    tlbrMain.Controls[i].Enabled := State;

  tbtnSettings.Enabled := True;  

  tbtnWizard.Enabled := True;
end;

procedure TfrmMain.InitCollection(ApplyAuthorFilter: Boolean);
var
  CollectionType: Integer;
  IsPrivate: Boolean;
  IsOnline: Boolean;
  IsLocal: Boolean;
  IsFB2: Boolean;
  IsNonFB2: Boolean;
begin
  FDoNotLocate := True;
  Screen.Cursor := crHourGlass;

  ClearLabels(PAGE_ALL);
  SetTableStatus(False);
  tvGenres.Clear;
  tvbooksG.Clear;
  DMMain.DBMain.Connected := False;

  edLocateAuthor.Text := '';
  edLocateSeries.Text := '';

  if DMUser.tblBases.IsEmpty then
  begin
    DisableControls(False);
    frmMain.Caption := 'MyHomeLib';
    tvAuthors.Clear;
    tvSeries.Clear;
    tvBooksA.Clear;
    tvBooksS.Clear;
    tvBooksG.Clear;
    tvBooksSR.Clear;
    tvBooksF.Clear;
    Screen.Cursor := crDefault;
    Exit;
  end;

  DMMain.DBMain.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
  DMMain.DBMain.Connected := True;
  frmMain.Caption := 'MyHomeLib - ' + DMUser.ActiveCollection.Name;


  CreateCollectionMenu;
  SetTableStatus(True);

  DisableControls(True);

  { TODO -oNickR -cRefactoring : проверить использование }
  FCollectionRoot := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  CollectionType := DMUser.ActiveCollection.CollectionType;
  IsPrivate := isPrivateCollection(CollectionType);
  IsOnline := isOnlineCollection(CollectionType);
  IsLocal := isLocalCollection(CollectionType);
  IsFB2 := isFB2Collection(CollectionType);
  IsNonFB2 := isNonFB2Collection(CollectionType);

  miFb2ZipImport.Visible := IsPrivate and IsFB2;
  miFb2Import.Visible := IsPrivate and IsFB2;
  miPdfdjvu.Visible := IsPrivate and IsNonFB2;


  tbtnShowCover.Visible := not IsNonFB2;
  miBookInfo.Visible := IsLocal and IsFB2;

  tbtnShowLocalOnly.Visible := IsOnline;
  miDownloadBooks.Visible := IsOnline;
  tbtnDownloadBooks.Visible := IsOnline;
  pmiDownloadBooks.Visible := IsOnline;
  miSyncOnline.Visible := IsOnline or IsNonFb2;

  tbtnShowDeleted.Visible := not IsPrivate;

  miImport.Visible := IsPrivate;
  miEditAuthor.Visible := IsPrivate;
  miEditGenres.Visible := IsPrivate;
  miEditSeries.Visible := IsPrivate;
  miBookEdit.Visible := IsPrivate;
  miDeleteBook.Visible := IsPrivate; // DMUser.ActiveCollection.AllowDelete;

  if Assigned(FLastLetter) then
    FLastLetter.Down := False;

  DMMain.tblAuthors.Filtered := False;
  if ApplyAuthorFilter then
    if DMMain.tblAuthors.RecordCount > 500 then
    begin
      DMMain.tblAuthors.Filter := 'Family="А*"';
      DMMain.tblAuthors.Filtered := True;
      ALetter.Down := True;
      FLastLetter := ALetter;
      edLocateAuthor.Text := 'А';
    end
    else
    begin
      DMMain.tblAuthors.Filtered := False;
      tbtnStar.Down := True;
      FLastLetter := tbtnStar;
      edLocateAuthor.Text := '';
    end;

  SetCoversVisible(not IsNonFB2 and Settings.ShowInfoPanel);
    

  SetBooksFilter;

  FillAuthorTree;
  FillSeriesTree;
  FillGenresTree(tvGenres);

  FillAllBooksTree;

  tvBooksSR.Clear;

  Screen.Cursor := crDefault;
  DMUser.ActivateCollection(Settings.ActiveCollection);
  FDoNotLocate := False;
  CreateScriptMenu;
  FIgnoreChange := False;

end;

procedure TfrmMain.GetBookRecord(const ID: integer; var R: TBookRecord);
begin
  DMMain.tblBooks.Locate('ID', ID, []);

  DMMain.GetCurrentBook(R);
end;

procedure TfrmMain.CreateAlphabet;
const
  E : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  R : string = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЭЮЯ';
var
  i: integer;
  B: TToolButton;
begin
  for I := 1 to Length(E) do
  begin
    B := TToolButton.Create(EngBar);
    B.Caption := E[i];
    B.Left := 100 + i * 27;
    B.Width := 25;
    B.Height := 25;
    B.Style := tbsTextButton;
    B.OnClick := tbtnStarClick;
    EngBar.InsertControl(B);
  end;

  for I := 1 to Length(R) do
  begin
    B := TToolButton.Create(RusBar);
    B.Caption := R[i];
    B.Left := 100 + i * 27;
    B.Width := 25;
    B.Height := 25;
    B.Style := tbsTextButton;
    B.OnClick := tbtnStarClick;
    RusBar.InsertControl(B);
    if R[i] = 'А' then
      ALetter := B;
  end;
end;

procedure TfrmMain.CreateCollectionMenu;
var
  ItemL, ItemC, ItemP: TMenuItem;
  i, j, k: integer;
  CollectionType: COLLECTION_TYPE;
  Active: integer;

  function GetCollectionTypeImageIndex: Integer;
  begin
    case DMUser.ActiveCollection.CollectionType of
      CT_PRIVATE_FB: Result := 18;
      CT_PRIVATE_NONFB: Result := 8;
      CT_LIBRUSEC_LOCAL_FB: Result := 14;
      CT_LIBRUSEC_ONLINE_FB: Result := 4;
      CT_GENESIS_LOCAL_NONFB: Result := 8;    { TODO -oNickR -cUsability : нарисовать иконку }
      CT_GENESIS_ONLINE_NONFB: Result := 8;   { TODO -oNickR -cUsability : нарисовать иконку }
    else
      Assert(False);
      Result := 8;                             { TODO -oNickR -cUsability : нарисовать иконку }
    end;
  end;

begin
  CollectionType := DMUser.ActiveCollection.CollectionType;
  Active := DMUser.ActiveCollection.ID;
  miCollSelect.Clear;
  miCopyToCollection.Clear;
  pmCollection.Items.Clear;
  DMUser.tblBases.First;
  i := 0; j := 0; k := 0;
  while not DMUser.tblBases.Eof do
  begin
    //----------------------------
    ItemL := TMenuItem.Create(miCollSelect);
    ItemL.Caption := DMUser.ActiveCollection.Name;
    ItemL.Tag := DMUser.ActiveCollection.ID;
    ItemL.OnClick := miActiveCollectionClick;
    ItemL.ImageIndex := GetCollectionTypeImageIndex;

    if ItemL.Tag <> Active then
    begin
      miCollSelect.Insert(i, ItemL);
      inc(i);
    end;

    //----------------------------
    ItemP := TMenuItem.Create(pmCollection);
    ItemP.Caption := DMUser.ActiveCollection.Name;
    ItemP.Tag := DMUser.ActiveCollection.ID;
    ItemP.OnClick := miActiveCollectionClick;
    ItemP.ImageIndex := GetCollectionTypeImageIndex;

    if ItemP.Tag <> Active then
    begin
      pmCollection.Items.Insert(k, ItemP);
      Inc(k);
    end;

    //----------------------------------
    ItemC := TMenuItem.Create(miCopyToCollection);
    ItemC.Caption := DMUser.ActiveCollection.Name;
    ItemC.Tag := DMUser.ActiveCollection.ID;
    ItemC.OnClick := CopyToCollectionClick;
    ItemC.ImageIndex := GetCollectionTypeImageIndex;

    if
      (ItemC.Tag <> Active) and
      isPrivateCollection(DMUser.ActiveCollection.CollectionType) and
      (DMUser.ActiveCollection.CollectionType = CollectionType)
    then
    begin
      miCopyToCollection.Insert(j, ItemC);
      Inc(j);
    end;

    //----------------------------------------------------------------------
    DMUser.tblBases.Next;
  end;

  miCopyToCollection.Enabled := (j > 0);
  miCollSelect.Enabled := (i > 0);

  DMUser.ActivateCollection(Active);
end;

procedure TfrmMain.CreateScriptMenu;
const
    ExpTypes : array [0..3] of string = ('  fb2','  fb2.zip','  LRF','  txt');
    Icons: array [0..3] of integer = (18,19,20,21);
var
  Item, ItemP, ItemM: TMenuItem;
  F:integer;
  i: Integer;
begin
  pmScripts.Items.Clear;
  pmiScripts.Clear;
  mmiScripts.Clear;


  if isFB2Collection(DMUser.ActiveCollection.CollectionType) then
  begin
    for I := 0 to 3 do
    begin
      Item := TMenuItem.Create(pmScripts);
      Item.Caption := ExpTypes[i];
      Item.Tag := 850 + i;
      Item.OnClick := tbSendToDeviceClick;
      Item.ImageIndex := i;
      pmScripts.Items.Insert(i, Item);
    end;

    if Settings.Scripts.Count > 0 then
    begin
      Item := TMenuItem.Create(pmScripts);
      Item.Caption := '-';
      Item.Tag := 0;
      pmScripts.Items.Insert(4, Item);
    end;

    tbSendToDevice.ImageIndex := Icons[ord(Settings.ExportMode)];
//    pmScripts.Items[i].Caption := '>> ' + ExpTypes[i] + ' <<';
    F := 5;
  end
  else
  begin
    F := 0;
    tbSendToDevice.ImageIndex := 1;
  end;
  

  { TODO 1 -oNickR -cRefactoring :заменить этот код на создание TFileRun}
  for i := 0 to Settings.Scripts.Count - 1 do
  begin
    //----  dropdown ----------------
    Item := TMenuItem.Create(pmScripts);
    Item.Caption := Settings.Scripts[i].Title;
    Item.Tag := 901 + i;
    Item.OnClick := tbSendToDeviceClick;
    Item.ImageIndex := 4;
    pmScripts.Items.Insert(i + F, Item);

    //------ context -----------------
    ItemP := TMenuItem.Create(pmMain);
    ItemP.Caption := Settings.Scripts[i].Title;
    ItemP.Tag := 901 + i;
    ItemP.OnClick := tbSendToDeviceClick;
    pmiScripts.Insert(i, ItemP);

    //------ main -----------------
    ItemM := TMenuItem.Create(MainMenu);
    ItemM.Caption := Settings.Scripts[i].Title;
    ItemM.Tag := 901 + i;
    ItemM.OnClick := tbSendToDeviceClick;
    mmiScripts.Insert(i, ItemM);
  end;

  if pmScripts.Items.Count > 0 then
  begin
    mmiScripts.Enabled := True;
    pmiScripts.Enabled := True;
  end
  else
  begin
    mmiScripts.Enabled := False;
    pmiScripts.Enabled := False;
  end
end;

procedure TfrmMain.SetTableStatus(Status: boolean);
begin
  DMMain.tblAuthors.Active := Status;
  DMMain.tblAuthor_List.Active := Status;
  DMMain.tblSeries.Active := Status;
  DMMain.tblBooksA.Active := Status;
  DMMain.tblBooksS.Active := Status;
  DMMain.tblGenres.Active := Status;
  DMMain.tblBooks_Genre_List.Active := Status;
  DMMain.tblBooks_Genres.Active := Status;
  DMMain.tblGenre_List.Active := Status;
  DMMain.tblBooksG.Active := Status;
  DMMain.tblBooks.Active := Status;
  DMMain.tblSeriesA.Active := Status;
end;

procedure TfrmMain.SetUtilTableStatus(Status: boolean);
begin
  DMMain.tblAuthor_Master.Active := Status;
  DMMain.tblAuthor_Detail.Active := Status;
end;

procedure TfrmMain.ShowNewCollectionWizard(Sender: TObject);
var
  frmNCWizard: TfrmNCWizard;
begin
  frmNCWizard := TfrmNCWizard.Create(Application);
  try
    if frmNCWizard.ShowModal = mrOk then
    begin
      Settings.ActiveCollection := DMUser.ActiveCollection.ID;
      CreateCollectionMenu;
      InitCollection(True);
    end;
  finally
    frmNCWizard.Free;
  end;
end;

procedure TfrmMain.SetUserTableStatus(Status: boolean);
begin
  DMUser.tblFavorites.Active := Status;
  DMUser.tblRates.Active := Status;
  DMUser.tblBases.Active := Status;
end;

procedure TfrmMain.btnSwitchTreeModeClick(Sender: TObject);
var
  Page: integer;
begin
  SaveColumns;

  Page := pgControl.ActivePageIndex;

  if Settings.TreeModes[Page] = tmFlat then
    Settings.TreeModes[Page] := tmTree
  else
    Settings.TreeModes[Page] := tmFlat;

  btnSwitchTreeMode.ImageIndex := TreeIcons[ord(Settings.TreeModes[pgControl.ActivePageIndex])];
  btnSwitchTreeMode.Hint := TreeHints[ord(Settings.TreeModes[pgControl.ActivePageIndex])];
  
  SetColumns;

  case Page of
    0: FillBooksTree(0, tvBooksA, DMMain.tblAuthor_List, DMMain.tblBooksA,    False, True); // авторы
    1: FillBooksTree(0, tvBooksS,                   nil, DMMain.tblBooksS,    False, False); // серии
    2: FillBooksTree(0, tvBooksG,  DMMain.tblGenre_List, DMMain.tblBooksG,    True,  True); // жанры
    3: btnSearchClick(Self);
    4: FillBooksTree(0, tvBooksF,                   nil, DMUser.tblFavorites, True,  True); // избранное
    5: btnApplyFilterClick(Self);
  end;

  SetHeaderPopUp;
end;


procedure TfrmMain.ClearLabels(Tag: integer);
begin
  case Tag of
    PAGE_AUTHORS:
    begin
      ipnlAuthors.Clear;
      cpCoverA.Clear;
    end;

    PAGE_SERIES:
    begin
      ipnlSeries.Clear;
      cpCoverS.Clear;
    end;

    PAGE_GENRES:
    begin
      ipnlGenres.Clear;
      cpCoverG.Clear;
    end;

    PAGE_FAVORITES:
    begin
      ipnlFAVORITES.Clear;
      cpCoverF.Clear;
    end;

    PAGE_SEARCH:
    begin
      ipnlSearch.Clear;
      cpCoverSR.Clear;
    end;

    PAGE_FILTER:
    begin
      ipnlFilter.Clear;
      cpCoverFL.Clear;
    end;

    PAGE_ALL:
    begin
      ClearLabels(PAGE_AUTHORS);
      ClearLabels(PAGE_SERIES);
      ClearLabels(PAGE_GENRES);
      ClearLabels(PAGE_FAVORITES);
      ClearLabels(PAGE_FILTER);
      ClearLabels(PAGE_SEARCH);
    end;
  end;
end;

procedure  TfrmMain.SetBooksFilter;
const
   flLocal = '`Local` = True';
   flNotShowDeleted = '`Deleted` <> True';


      procedure SwitchFilter(Filter: string);
      var
        State : boolean;
      begin
        State := (Filter <> '');

        DMMain.tblBooksA.Filter := Filter;
        DMMain.tblBooksG.Filter := Filter;
        DMMain.tblBooksS.Filter := Filter;
        DMUser.tblFavorites.Filter := Filter;

        DMMain.tblBooksA.Filtered := State;
        DMMain.tblBooksG.Filtered := State;
        DMMain.tblBooksS.Filtered := State;
        DMUser.tblFavorites.Filtered := State;
      end;

begin
  if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
  begin
    if Settings.DoNotShowDeleted and Settings.ShowLocalOnly then
      SwitchFilter(flLocal + ' and ' + flNotShowDeleted)
    else if Settings.DoNotShowDeleted and not Settings.ShowLocalOnly then
      SwitchFilter(flNotShowDeleted)
    else if not Settings.DoNotShowDeleted and Settings.ShowLocalOnly then
      SwitchFilter(flLocal)
    else if not Settings.DoNotShowDeleted and not Settings.ShowLocalOnly then
      SwitchFilter('') ;
  end
  else
    if Settings.DoNotShowDeleted then
      SwitchFilter(flNotShowDeleted)
    else
      SwitchFilter('');
end;


procedure  TfrmMain.FillAllBooksTree;
begin
  FillBooksTree(0, tvBooksA, DMMain.tblAuthor_List, DMMain.tblBooksA,    False, True); // авторы
  FillBooksTree(0, tvBooksS,                   nil, DMMain.tblBooksS,    False, False); // серии
  FillBooksTree(0, tvBooksG,  DMMain.tblGenre_List, DMMain.tblBooksG,    True,  True); // жанры
  FillBooksTree(0, tvBooksF,                   nil, DMUser.tblFavorites, True,  True); // избранное
end;

function TfrmMain.DoCheckUpdatesOnStart: Boolean;
var
  LocalVersion: Integer;
  RemoteVersion: Integer;
begin
  Result := False;

  if not DMUser.FindFirstExternalCollection then
    Exit;

  LocalVersion := DMUser.ActiveCollection.Version;
  try
    Result := CheckLibVersion(LocalVersion, RemoteVersion);
  except
    // ignore all errors
  end;
end;



//
// События формы
//

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // событие OnGetNodeDataSize почему-то не обрабатывается, инициализируем вручную

  tvBooksA.NodeDataSize := SizeOf(TBookData);
  tvBooksG.NodeDataSize := SizeOf(TBookData);
  tvBooksF.NodeDataSize := SizeOf(TBookData);
  tvBooksS.NodeDataSize := SizeOf(TBookData);
  tvBooksSR.NodeDataSize := SizeOf(TBookData);
  tvBooksFL.NodeDataSize := SizeOf(TBookData);

//-----------------------------

  FSelectionState := False;
  FAutoCheck := False;
  FFormBusy := False;

  FFileOpMode := fmFb2Zip;
  
  FLastLetter := nil;

  CreateAlphabet;

  CreateSettings;
  Settings.LoadSettings;

  ReadINIData;


  CreateDir(Settings.TempDir);
  CreateDir(Settings.DataDir);


  frmSplash.lblState.Caption := main_connecttodb;

  DMUser.DBUser.DatabaseFileName := Settings.SystemFileName[sfSystemDB];
  if not FileExists(DMUser.DBUser.DatabaseFileName) then
    TMHLLibrary.CreateSystemTables(DMUser.DBUser.DatabaseFileName);

  DMUser.DBUser.Connected := True;
  DMUser.tblBases.Active := True;

  if DMUser.tblBases.IndexDefs.IndexOf('Name_Index') = -1 then
    DMUser.tblBases.AddIndex('Name_Index','Name',[]);
  DMUser.tblBases.IndexName := 'Name_Index';

  DMUser.ActivateCollection(Settings.ActiveCollection);
  SetUserTableStatus(True);

  frmSplash.lblState.Caption := main_loading_collection;
  InitCollection(False);

  SetColumns;

  frmSplash.lblState.Caption := main_check_updates;
  if Settings.CheckUpdate then
  begin
    FAutoCheck := True;
    frmMain.miCheckUpdatesClick(nil);
  end
  else
    FAutoCheck := False;

  if Settings.CheckExternalLibUpdate then
    if DoCheckUpdatesOnStart then
      if MessageDlg('Доступно обновление для коллекций "lib.rus.ec".' + #13 + ' Начать обновление ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
        miUpdateClick(Sender);

  Application.HelpFile := Settings.SystemFileName[sfAppHelp];
  pgControlChange(Self);
  SetHeaderPopUp;

  rzsSplitterA.Position := Settings.Splitters[0];
  rzsSplitterS.Position := Settings.Splitters[1];
  rzsSplitterG.Position := Settings.Splitters[2];
  cpCoverA.Width := Settings.Splitters[3];

  if not DMUser.tblBases.IsEmpty then  RestorePositions;

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  SaveColumns;

  ClearDir(Settings.TempDir);

  Settings.LastAuthor := lblAuthor.Caption;
  Settings.LastSeries := lblSeries.Caption;
  Settings.LastBookInAuthors := GetSelectedBookData(tvBooksA).ID;
  Settings.LastBookInSeries := GetSelectedBookData(tvBooksS).ID;
  Settings.LastBookInFavorites := GetSelectedBookData(tvBooksF).ID;

  Settings.Splitters[0] := rzsSplitterA.Position;
  Settings.Splitters[1] := rzsSplitterS.Position;
  Settings.Splitters[2] := rzsSplitterG.Position;
  Settings.Splitters[3] := cpCoverA.Width;

  Settings.SaveSettings;
  FreeSettings;
end;

procedure TfrmMain.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  
end;

//
// Список книг
//
function TfrmMain.GetText(Tag: integer; Data: PBookData):string;
begin
    case Tag  of
      COL_AUTHOR : Result := Data.FullName;
      COL_TITLE  : Result := Data.Title;
      COL_SERIES : Result := Data.Series;
      COL_NO     : if Data.No <> 0 then
                      Result := IntToStr(Data.No);
      COL_SIZE   : Result := IntToStr(Data.Size);
      COL_DATE   : Result := DateToStr(Data.Date);
      COL_GENRE  : Result := Data.Genre;
      COL_COLLECTION: Result := Data.ColName;
    end;
end;



procedure TfrmMain.tvAuthorsGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: String);
var
  Data: PAuthorData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := Data.Text;
end;

procedure TfrmMain.tvBooksAGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
var
  Data: PBookData;
begin
  Data := Sender.GetNodeData(Node);
  if SizeOf(TBookData) = 0 then
    Exit;

  CellText := ' ';
  if Settings.TreeModes[PAGE_AUTHORS] = tmTree then
  begin
    if Node.ChildCount > 0 then
      case GetTreeTag(Sender, Column)  of
        COL_TITLE: CellText := Data.Series;
      end
    else
      CellText := GetText(GetTreeTag(Sender, Column), Data);
  end
  else
    CellText := GetText(GetTreeTag(Sender, Column), Data);
end;

procedure TfrmMain.tvBooksTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.CheckType := ctTriStateCheckBox;
  Sender.CheckState[Node] := csUncheckedNormal;
end;

procedure TfrmMain.tvBooksTreeHeaderClick(Sender: TVTHeader; Column: TColumnIndex;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Tree:TVirtualStringTree;
begin
  if (Button = mbLeft) then
  begin
    GetActiveTree(Tree);
    if (Settings.TreeModes[Tree.Tag] = tmTree) then Exit;
    // Меняем индекс сортирующей колонки на индекс колонки,
    // которая была нажата.
    Tree.Header.SortColumn := Column;
    // Сортируем всё дерево относительно этой колонки
    // и изменяем порядок сортировки на противополжный
    if Tree.Header.SortDirection = sdAscending then
    begin
      Tree.Header.SortDirection := sdDescending;
      Tree.SortTree(Column, Tree.Header.SortDirection);
    end
    else begin
      Tree.Header.SortDirection := sdAscending;
      Tree.SortTree(Column, Tree.Header.SortDirection);
    end;

    // запоминаем параметры для активного дерева
    FSortSettings[Tree.Tag].Column := Column;
    FSortSettings[Tree.Tag].Direction := Tree.Header.SortDirection;
  end;
end;

procedure TfrmMain.tvBooksGGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
var
  Data: PBookData;

  Tag: integer;
begin
  Data := Sender.GetNodeData(Node);
  CellText := ' ';
  Tag := GetTreeTag(Sender, Column);
  if Settings.TreeModes[PAGE_GENRES] = tmTree then
  case Data.nodeType of
    ntAuthorInfo: if Tag = COL_TITLE then
                     CellText := Data.FullName;
    ntSeriesInfo: if Tag = COL_TITLE then
                     CellText := 'Серия: ' + Data.Series;
    ntBookInfo:
      case Tag of
        COL_TITLE : CellText := Data.Title;
        COL_NO    : if Data.No <> 0 then
                        CellText := IntToStr(Data.No);
        COL_SIZE  : CellText := IntToStr(Data.Size);
        COL_GENRE : CellText := Data.Genre;
      end;
  end
  else
    CellText := GetText(GetTreeTag(Sender, Column), Data);
end;

procedure TfrmMain.tvBooksSGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
var
  Data: PBookData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := ' ';
  CellText := GetText(GetTreeTag(Sender, Column), Data);
end;

procedure TfrmMain.tvBooksFGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
var
  Data: PBookData;
  Page: integer;

begin
  Page := Sender.Tag;
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := ' ';
  if Settings.TreeModes[Page] = tmTree then
  case Data.nodeType of
    ntAuthorInfo:
      begin
        case GetTreeTag(Sender, Column)  of
          COL_TITLE : CellText := Data.FullName;
          COL_COLLECTION : CellText := Data.ColName;
        end;
      end;

    ntSeriesInfo:
      begin
        if GetTreeTag(Sender, Column)  = COL_TITLE then
          CellText := 'Серия: ' + Data.Series;
      end;

    ntBookInfo: if GetTreeTag(Sender, Column)  <> COL_COLLECTION
     then CellText := GetText(GetTreeTag(Sender, Column), Data);

  end
  else
    CellText := GetText(GetTreeTag(Sender, Column), Data);
end;


procedure TfrmMain.tvBooksSRGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: String);
var
  Data: PBookData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := ' ';
  case Column of
    0: CellText := Data.FullName;
    1: CellText := Data.Title;
    2: CellText := Data.Series;
    3: if Data.No <> 0 then
        CellText := IntToStr(Data.No);
    4: CellText := IntToStr(Data.Size);
    6: CellText := Data.Genre;
    7: CellText := DateToStr(Data.Date);
  end;
end;

procedure TfrmMain.tvGenresGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
var
  Data: PGenreData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := Data.Text;
end;

procedure TfrmMain.tvAuthorsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PAuthorData;
  ID: integer;
begin
  Data := tvAuthors.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;
  ClearLabels(PAGE_AUTHORS);
  ID := Data^.ID;
  DMMain.tblAuthors.Locate('ID', ID, []);
  FillBooksTree(ID, tvBooksA, DMMain.tblAuthor_List, DMMain.tblBooksA, False, True); // авторы
end;

procedure TfrmMain.tvSeriesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PAuthorData;
  ID: integer;
begin
  Data := tvSeries.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;
  ClearLabels(PAGE_SERIES);
  ID := Data^.ID;
  DMMain.tblSeries.Locate('ID', ID, []);
  FillBooksTree(ID, tvBooksS, nil, DMMain.tblBooksS, False, False); // авторы
end;

procedure TfrmMain.tvGenresChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PGenreData;
  ID: string;
begin
  Data := tvGenres.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;
  ClearLabels(PAGE_GENRES);
  ID := Data^.Code;
  if IsFB2Collection(DMUser.ActiveCollection.CollectionType) or
     not Settings.ShowSubGenreBooks
  then
  begin
    DMMain.tblGenres.Locate('Code', ID, []);
    FillBooksTree(0, tvBooksG, DMMain.tblGenre_List, DMMain.tblBooksG, True, True); // жанры
  end
  else 
  begin
    DMMain.tblGenre_List.MasterSource := nil;
    DMMain.tblGenre_List.Filter := '`GenreCode` Like ' + QuotedStr(ID + '%');
    DMMain.tblGenre_List.Filtered := True;
    FillBooksTree(0, tvBooksG, DMMain.tblGenre_List, DMMain.tblBooksG, True, True); // жанры
    DMMain.tblGenre_List.Filtered := False;
    DMMain.tblGenre_List.MasterSource := DMMain.dsGenres;
  end;
  lblGenreTitle.Caption := Data.Text;
end;

procedure TfrmMain.GetActiveViewComponents(var Tree : TVirtualStringTree;
                        var Panel: TMHLInfoPanel;
                        var Cover: TMHLCoverPanel);
begin
  case ActiveView of
    ByAuthorView:begin
                   Tree := tvBooksA;
                   Panel:= ipnlAuthors;
                   Cover:= cpCoverA;
                 end;
    BySeriesView: begin
                   Tree := tvBooksS;
                   Panel:= ipnlSeries;
                   Cover:= cpCoverS;
                 end;
    ByGenreView: begin
                   Tree := tvBooksG;
                   Panel:= ipnlGenres;
                   Cover:= cpCoverG;
                 end;
    SearchView: begin
                   Tree := tvBooksSR;
                   Panel:= ipnlSearch;
                   Cover:= cpCoverSR;
                 end;
    FavoritesView: begin
                   Tree := tvBooksF;
                   Panel:= ipnlFavorites;
                   Cover:= cpCoverF;
                 end;
    FilterView: begin
                   Tree := tvBooksFL;
                   Panel:= ipnlFilter;
                   Cover:= cpCoverFL;
                 end;
  end;
end;

procedure TfrmMain.tvBooksTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PBookData;
  Tree: TVirtualStringTree;
  InfoPanel: TMHLInfoPanel;
  Cover: TMHLCoverPanel;
  Folder: string;
  FileName: string;
  No: integer;
begin
  if BookTreeStatus = bsBusy then
    Exit;

  GetActiveViewComponents(Tree,InfoPanel,Cover);

  Data := Tree.GetNodeData(Tree.GetFirstSelected);
  if not Assigned(Data) then
    Exit;

  if Data.nodeType <> ntBookInfo then
  begin
    ClearLabels(Tree.Tag);
    Exit;
  end;

  DMMain.GetBookFileName(Data.ID, FileName, Folder, No);


  InfoPanel.Title := Data.Title;
  InfoPanel.Author := Data.FullName;
  InfoPanel.Genre := Data.Genre;
  InfoPanel.FileName := FileName;

  InfoPanel.HideFileInfo := not (isOnlineCollection(DMUser.ActiveCollection.CollectionType) and not Data.Locale);


  if ActiveView <> FavoritesView then
    if (Folder = '') then
       InfoPanel.Folder := FCollectionRoot
     else
       InfoPanel.Folder := FCollectionRoot + Folder
    else
      InfoPanel.Folder := Folder;
  Cover.Show(InfoPanel.Folder,InfoPanel.FileName,No);

end;

procedure TfrmMain.tvBooksTreeCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PBookData;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);
  case (Sender as TVirtualStringTree).Header.Columns[Column].Tag of
    COL_AUTHOR : Result := CompareStr(Data1.FullName, Data2.FullName);
    COL_TITLE  : Result := CompareStr(Data1.Title, Data2.Title);
    COL_SERIES : Result := CompareStr(Data1.Series, Data2.Series);
    COL_NO     : Result := CompareInt(Data1.No, Data2.No);
    COL_SIZE   : Result := CompareInt(Data1.Size, Data2.Size);
    COL_RATE   : Result := CompareInt(Data1.Rate, Data2.Rate);
    COL_GENRE  : Result := CompareStr(Data1.Genre, Data2.Genre);
    COL_DATE   : Result := CompareDate(Data1.Date, Data2.Date);
  end;
end;

procedure TfrmMain.tvAuthorsPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
begin
  if Sender.Selected[Node] then
    TargetCanvas.Font.Color := clWhite;
end;

procedure TfrmMain.tvBooksTreeBeforeCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
var
  Data: PBookData;
  Color: TColor;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  Color := Settings.BGColor;
  case Data.nodeType of
    ntAuthorInfo: Color := Settings.AuthorColor;
    ntSeriesInfo: Color := Settings.SeriesColor;
    ntBookInfo: Color := Settings.BookColor;
  end;

  if (Data.nodeType = ntBookInfo) and (Data.Series <> '') then
    Color := Settings.SeriesBookColor;

  TargetCanvas.Brush.Color := Color;
  TargetCanvas.FillRect(CellRect);
end;

function TfrmMain.GetTreeTag(const Sender: TBaseVirtualTree; const Column: integer):integer;
begin
  if Column < 0 then Result := -1
    else
      Result := (Sender as TVirtualStringTree).Header.Columns[Column].Tag;
end;


procedure TfrmMain.tvBooksTreeAfterCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellRect: TRect);
var
  Data: PBookData;
  X, i: integer;
  Tag : integer;
begin

  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  Tag := GetTreeTag(Sender, Column);

  X := (Sender as TvirtualStringTree).Header.Columns.Items[Column].Left;

  if (Tag = COL_STATE) and
     isOnlineCollection(DMUser.ActiveCollection.CollectionType)
     and (Data.nodeType = ntBookInfo) and (Data.Locale)
     then
  begin
    ilFileTypes.Draw(TargetCanvas,X,CellRect.Top + 2,5);
  end;

  { TODO -oAlex : Заменить на звездочки }
  if (Data.nodeType = ntBookInfo) and (Tag= COL_RATE) then
  begin
    inc(X,3);
    with TargetCanvas do
    begin
      Pen.Color := clTeal;
      Brush.Style := bsSolid;
      Brush.Color := $0046CBEC;
      Refresh;
      for I := 1 to Data.Rate do
        RoundRect(X + i * 10 - 9, 4, X + i * 10, 13, 1, 1);
     end;
  end;
end;

procedure TfrmMain.tvBooksTreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Node : PVirtualNode;
  Tree : TVirtualStringTree;
  Data : PBookData;
begin
  if Key = vk_Insert then
  begin
    Tree := (Sender as TVirtualStringTree);
    Node := Tree.GetFirstSelected;
    if Node <> nil then
    begin
      BookTreeStatus := bsBusy ;
      Data := Tree.GetNodeData(Node);
      if Data.nodeType = ntBookInfo then
        if Tree.CheckState[Node] = csCheckedNormal then
          Tree.CheckState[Node] := csUnCheckedNormal
        else Tree.CheckState[Node] := csCheckedNormal;
      Tree.Selected[Node] := False;
      Node := Tree.GetNext(Node);
      BookTreeStatus := bsFree ;
      if Node <> nil then Tree.Selected[Node] := True;
    end;
  end;
end;

procedure TfrmMain.tvBooksAGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TBookData);
end;

procedure TfrmMain.tvAuthorsGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TAuthorData);
end;

procedure TfrmMain.tvBooksGGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TBookData);
end;

procedure TfrmMain.tvBooksTreeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Node: PVirtualNode;
  Data: PBookData;
  Tree: TVirtualStringTree;
  Selected: PVirtualNode;
begin
  if (Button = mbLeft) and (ssShift in Shift) then
  begin
    BookTreeStatus := bsBusy ;
    try
      Tree := Sender as TVirtualStringTree;
      ClearLabels(Tree.Tag);
      Node := Tree.GetFirstSelected;
      Selected := Node;
      while Node <> nil do
      begin
        Data := Tree.GetNodeData(Node);
        if Data.nodeType = ntBookInfo  then
        begin
          Tree.CheckState[Node] := csCheckedNormal;
          Tree.Selected[Node] := False;
        end;
        Node := Tree.GetNextSelected(Node);
      end; //while
    finally
      BookTreeStatus := bsFree ;
      Tree.Selected[Selected] := True;
    end;
  end; // if
end;

procedure TfrmMain.tvBooksTreePaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
var
  Data: PBookData;
begin
  Data := Sender.GetNodeData(Node);
  if Data.nodeType <> ntBookInfo then
    TargetCanvas.Font.Style := [fsBold];
end;

//
// Menu handlers
//
procedure TfrmMain.btnClearEdSeriesClick(Sender: TObject);
begin
  edLocateSeries.Clear;
  frmMain.ActiveControl := edLocateSeries;
end;

procedure TfrmMain.btnClearFavoritesClick(Sender: TObject);
begin
  ClearLabels(PAGE_FAVORITES);

  DMUser.tblFavorites.Active := False;
  DMUser.tblFavorites.EmptyTable;
  DMUser.tblFavorites.Active := True;

  FillBooksTree(0, tvBooksF, nil, DMUser.tblFavorites, True, True); // избранное
end;

procedure TfrmMain.BtnFav_addClick(Sender: TObject);
begin
  if ActiveView = FavoritesView then
    miDelFavoritesClick(Sender)
  else
    miAddFavoritesClick(Sender);
end;

procedure TfrmMain.CopyToCollectionClick(Sender: TObject);
var
  R: TbookRecord;
  ID: integer;
  Tree: TVirtualStringTree;
  Data: PBookData;
  Node: PVirtualNode;
  ALibrary: TMHLLibrary;
begin
  Screen.Cursor := crHourGlass;

  if ActiveView = FavoritesView then
  begin
    MessageDlg(main_unable_to_copy, mtWarning, [mbOk], 0);
    Exit;
  end;

  GetActiveTree(Tree);
  ID := (Sender as TMenuItem).Tag;
  if not DMUser.ActivateCollection(ID) then
    Exit;
  SetUtilTableStatus(True);
  ALibrary := TMHLLibrary.Create(nil);
  try
    ALibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
    ALibrary.Active := True;

    Node := Tree.GetFirst;
    while Assigned(Node) do
    begin
      Data := Tree.GetNodeData(Node);
      if (Data.nodeType = ntBookInfo) and ((Tree.CheckState[Node] = csCheckedNormal) or (Tree.Selected[Node])) then
      begin
        Data := Tree.GetNodeData(Node);
        GetBookRecord(Data.ID, R);
        ALibrary.InsertBook(R);
      end;

      Node := Tree.GetNext(Node);
    end;
  finally
    ALibrary.Free;
  end;
  SetUtilTableStatus(False);
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.CoverPanelResize(Sender: TObject);
var
  NewSize: integer;
begin
  NewSize := (Sender as TWinControl).Width;
  if NewSize < 150 then NewSize := 150;
  
  cpCoverA.Width := NewSize;
  cpCoverS.Width := NewSize;
  cpCoverG.Width := NewSize;
  cpCoverF.Width := NewSize;
  cpCoverFL.Width := NewSize;
  cpCoverSR.Width := NewSize;
end;

procedure TfrmMain.TabSheet1Show(Sender: TObject);
begin
  miGotoAuthor.Visible := False;
  miDelFavorites.Visible := False;
  miAddFavorites.Visible := True;
  btnFav_add.Hint := 'Добавить в избранное';
  btnFav_add.ImageIndex := 15;
end;

procedure TfrmMain.TabSheet2Show(Sender: TObject);
begin
  TabSheet1Show(Sender);
  miGotoAuthor.Visible := True;
end;

procedure TfrmMain.TabSheet5Show(Sender: TObject);
begin
  miGotoAuthor.Visible := True;
  miDelFavorites.Visible := True;
  miAddFavorites.Visible := False;
  btnFav_add.Hint := 'Удалить из избранного';
  btnFav_add.ImageIndex := 16;
end;

procedure TfrmMain.FillBookIdList(const Tree: TVirtualStringTree; var BookIDList: TBookIdList );
var
  i: integer;
  Data: PBookData;
  Node: PVirtualNode;
begin
  Node := Tree.GetFirst;
  i := 0;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if (Data.nodeType = ntBookInfo) and ((Tree.CheckState[Node] = csCheckedNormal) or (Tree.Selected[Node])) then
    begin
      SetLength(BookIdList, i + 1);
      BookIdList[i].ID := Data.ID;
      Inc(i);
      Tree.CheckState[Node] := csUnCheckedNormal;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

procedure TfrmMain.tbSendToDeviceClick(Sender: TObject);
var
  SaveDeviceDir: string;
  SaveFolderTemplate: string;
  TMPParams: String;
  ScriptID: Integer;
  BookIDList: TBookIdList;
  Files : string;
  p:integer;
  S: string;
  Tree: TVirtualStringTree;
  ExportMode: TExportMode;
begin
  SaveDeviceDir := Settings.DeviceDir;
  SaveFolderTemplate := Settings.FolderTemplate;
  //  dlgFolder.Directory := Settings.DeviceDir;
  ScriptID := (Sender as TComponent).Tag;

  if isFB2Collection(DMUser.ActiveCollection.CollectionType) then
  case ScriptID of
    850: ExportMode := emFb2;
    851: ExportMode := emFb2Zip;
    852: ExportMode := emLrf;
    853: ExportMode := emTxt;
    else ExportMode := Settings.ExportMode;
  end
  else
    ExportMode := emFb2;


  Dec(ScriptID,901);

  if ScriptID >= 0 then
  begin
    TMPParams := Settings.Scripts[ScriptID].Params;
    if Pos('%NFT%', Settings.Scripts[ScriptID].Params) <> 0 then
    begin
      Settings.FolderTemplate := '';
      StrReplace('%NFT%', '', TMPParams);
    end;
    if Pos('%TMP%', Settings.Scripts[ScriptID].Params) <> 0 then
      StrReplace('%TMP%',Settings.TempPath, TMPParams);
    if Pos('%DEST%', Settings.Scripts[ScriptID].Params) <> 0 then
      StrReplace('%DEST%',Settings.DeviceDir, TMPParams);
    if Pos('%FOLDER ', Settings.Scripts[ScriptID].Params) <> 0 then
    begin
      StrReplace('%FOLDER ','', TMPParams);
      p := pos('%',TMPParams);
      S := copy(TMPParams,1,p-1);
      Settings.DeviceDir := S;
      Delete(TMPParams,1,p);
    end;
    if (Settings.Scripts[ScriptID].Path = '%COPY%') and
       (trim(TMPParams) <> '') then Settings.DeviceDir := trim(TMPParams);
    Settings.Scripts[ScriptID].TmpParams := TMPParams;   
  end;

  if Settings.PromptDevicePath then
    if not dlgFolder.Execute then
      Exit
    else
      { TODO -oNickR -cRefactoring : это временное изменение в настройках и оно не должно сохраняться при закрытии программы
                             Это изменение нужно только для работы функций ZipToDevice/FileToDevice и решается
                             параметрами этих функций
      }
      Settings.DeviceDir := dlgFolder.Directory;

  GetActiveTree(Tree);

  FillBookIdList(Tree, BookIDList);

  if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
  begin
    unit_exporttodevice.DownloadBooks(DMMain.ActiveTable,  BookIdList);
    RefreshBooksState(Tree, BookIDList);
  end;

  unit_exporttodevice.ExportToDevice(DMMain.ActiveTable, BookIdList, ExportMode, Files);

  if (ScriptID >= 0 ) and (Settings.Scripts[ScriptID].Path <> '%COPY%') then
  begin
    if Pos('%FILENAME%', Settings.Scripts[ScriptID].Params) <> 0 then
    begin
      StrReplace('%FILENAME%', Files, TMPParams);
      Settings.Scripts[ScriptID].TmpParams := TMPParams;
    end;
    Settings.Scripts[ScriptID].Run;
  end;

  Settings.DeviceDir := SaveDeviceDir;
  Settings.FolderTemplate := SaveFolderTemplate;

end;


procedure TfrmMain.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  spStatus.Caption := 'Готово';
  spProgress.Percent := 100;
end;


procedure TfrmMain.tbtbnReadClick(Sender: TObject);
var
  WorkFile: String;
  FileName: String;
  Tree: TVirtualStringTree;
  Cover: TMHLCoverPanel;
  Panel: TMHLInfoPanel;
  No: integer;
  Data: PBookData;

  fs: TMemoryStream;
  Zip: TZipForge;

begin
  GetActiveViewComponents(Tree,Panel,Cover);

  Data := Tree.GetNodeData(Tree.GetFirstSelected);
  if (not Assigned(Data)) then
    Exit;

  if Data.nodeType <> ntBookInfo then
  begin
    ClearLabels(Tree.Tag);
    Exit;
  end;

  Screen.Cursor := crHourGlass;

  try
    if ExtractFileExt(Panel.Folder) = ZIP_EXTENSION then
    begin
      if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
      begin
        miDownloadBooksClick(Sender);
        if not FileExists(Panel.Folder) then
          Exit; // если файла нет, значит закачка не удалась, и юзер об  этом уже знает
      end;

      if not FileExists(Panel.Folder) then
          raise EInvalidOp.Create('Архив ' + Panel.Folder + ' не найден!');


      DMMain.FieldByName(0,'InsideNo',No);

      Zip := TZipForge.Create(nil);
      FS := TMemoryStream.Create;
      try
        Zip.FileName := Panel.Folder;
        Zip.BaseDir := Settings.TempPath;
        Zip.OpenArchive;
        Zip.ExtractToStream(GetFileNameZip(Zip,No),FS);
        WorkFile := Settings.ReadPath + Format('%s - %s.fb2',[Panel.Author,Panel.Title]);
        fs.SaveToFile(WorkFile);
      finally
        FS.Free;
        Zip.Free;
      end;
    end
    else
      WorkFile := Panel.Folder + Panel.FileName;
    Settings.Readers.RunReader(WorkFile);

    Tree.RepaintNode(Tree.GetFirstSelected);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.tbtnEngClick(Sender: TObject);
begin
  Settings.ShowEngBar := not Settings.ShowEngBar;
  EngBar.Visible := Settings.ShowEngBar;
end;

procedure TfrmMain.tbtnRusClick(Sender: TObject);
begin
  Settings.ShowRusBar := not Settings.ShowRusBar;
  RusBar.Visible := Settings.ShowRusBar;
end;


procedure TfrmMain.tbtnShowDeletedClick(Sender: TObject);
begin
  Settings.DoNotShowDeleted := not Settings.DoNotShowDeleted;
  tbtnShowDeleted.Down := Settings.DoNotShowDeleted;

  SetBooksFilter;
  FillAllBooksTree;
end;

procedure TfrmMain.tbtnStarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if Assigned(FLastLetter) then
    FLastLetter.Down := False;
  FLastLetter := (Sender as TToolButton);
  (Sender as TToolButton).Down := True;
//  ClearLabels;
  case ActiveView of
    ByAuthorView:
      begin
        if (Sender as TToolButton).Tag > 90 then
        case (Sender as TToolButton).Tag of
          91: DMMain.tblAuthors.Filter := 'Family > "а*"';
          92: DMMain.tblAuthors.Filter := 'Family < "а*"';
        end
        else
        begin
          edLocateAuthor.Text := (Sender as TToolButton).Caption;
          DMMain.tblAuthors.Filter := 'Family=' + QuotedStr((Sender as TToolButton).Caption + '*');
        end;
        DMMain.tblAuthors.Filtered := (Sender as TToolButton).Tag <> 90;
        FillAuthorTree;
        tvAuthors.Selected[tvAuthors.GetFirst] := True;
        edLocateAuthor.Perform(WM_KEYDOWN, VK_RIGHT, 0);
      end;
    BySeriesView:
      begin
        if (Sender as TToolButton).Tag > 90 then
        case (Sender as TToolButton).Tag of
          90: DMMain.tblSeries.Filter := 'Title <>' + QuotedStr(NO_SERIES_TITLE);
          91: DMMain.tblSeries.Filter := 'Title > "а*"';
          92: DMMain.tblSeries.Filter := 'Title < "а*" and Title <>' + QuotedStr(NO_SERIES_TITLE);
        end
        else
        begin
          edLocateSeries.Text := (Sender as TToolButton).Caption;
          DMMain.tblSeries.Filter := 'Title =' + QuotedStr((Sender as TToolButton).Caption + '*');
        end;
        DMMain.tblSeries.Filtered := true;
        FillSeriesTree;
        tvSeries.Selected[tvSeries.GetFirst] := True;
        edLocateSeries.Perform(WM_KEYDOWN, VK_RIGHT, 0);
      end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.TrayIconDblClick(Sender: TObject);
begin
  Visible := not Visible;
  TrayIcon.Visible := not Visible;
end;

procedure TfrmMain.tbtnShowLocalOnlyClick(Sender: TObject);
begin
  Settings.ShowLocalOnly := not Settings.ShowLocalOnly;
  tbtnShowLocalOnly.Down := Settings.ShowLocalOnly ;

  SetBooksFilter;
  FillAllBooksTree;
end;

procedure TfrmMain.SetCoversVisible(State: boolean);
begin
  cpCoverA.Visible := State;
  cpCoverS.Visible := State;
  cpCoverG.Visible := State;
  cpCoverF.Visible := State;
  cpCoverFL.Visible := State;
  cpCoverSR.Visible := State;
end;

procedure TfrmMain.tbtnShowCoverClick(Sender: TObject);
var
  Visible: boolean;
begin
  Settings.ShowInfoPanel := not Settings.ShowInfoPanel;
  Visible := Settings.ShowInfoPanel and not isNonFb2Collection(DMUser.ActiveCollection.CollectionType);
  SetCoversVisible(Visible);
  if Visible then
        tvBooksTreeChange(Nil,Nil);
end;

procedure TfrmMain.tbClearEdAuthorClick(Sender: TObject);
begin
  edLocateAuthor.Clear;
  frmMain.ActiveControl := edLocateAuthor;
end;

procedure TfrmMain.tbCollapseClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
begin
  GetActiveTree(Tree);
  if Tree.Expanded[Tree.GetFirst] then
    Tree.FullCollapse(nil)
  else
    Tree.FullExpand(nil);
end;

procedure TfrmMain.GetActiveTree(var Tree: TVirtualStringTree);
begin
  case ActiveView of
    ByAuthorView: Tree := tvBooksA;
    BySeriesView: Tree := tvBooksS;
    ByGenreView: Tree := tvBooksG;
    SearchView: Tree := tvBooksSR;
    FavoritesView: Tree := tvBooksF;
    FilterView: Tree := tvBooksFL;
  end;
end;

procedure TfrmMain.Selection(SelState: boolean);
var
  Node: PVirtualNode;
  tree: TVirtualStringTree;
begin
  GetActiveTree(Tree);
  Tree.BeginUpdate;
  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    if SelState then
      Node.CheckState := csCheckedNormal
    else
      Node.CheckState := csUnCheckedNormal;
    Node := Tree.GetNext(Node);
  end;
  Tree.EndUpdate;
end;

procedure TfrmMain.tbSelectAllClick(Sender: TObject);
begin
  FSelectionState := not FSelectionState;
  Selection(FSelectionState);
end;

//- - - - - - Дерево книг для поиска, серий и избранного - - - - - - - - - - - -

procedure TfrmMain.FillBooksTree(
  const ParentID: Integer;
  const Tree: TVirtualStringTree;
  const Master: TAbsTable;
  const Detail: TAbsTable;
  ShowAuth: Boolean;
  ShowSer: Boolean
  );
var
  Data: PBookData;
  authorNode: PVirtualNode;
  seriesNode: PVirtualNode;
  bookNode: PVirtualNode;
  LastSeries: PVirtualNode;
  Max, i: Integer;
  DBCode: COLLECTION_TYPE;
  TableA: TAbsTable;
  TableB: TAbsTable;
  LastAuth: String;
  CollectionName: String;
  Columns: TColumnSet;

      function GetColumns: TColumnSet;
      var
        i: integer;
      begin
        Result := [];
        for I := 0 to Tree.Header.Columns.Count - 1 do
          Include(Result,Tree.Header.Columns[i].Tag);
      end;


begin
  if Assigned(Master) then
    TableA := Master
  else
    TableA := Detail;

  Columns := GetColumns;
  spProgress.Visible := True;  
  TableB := Detail;

  // Если включен "плоский" режим отображения, принудительно сбрасываем ключи
  // блокировки
  if Settings.TreeModes[Tree.Tag] = tmFlat then
  begin
    ShowAuth := False;
    ShowSer  := False;
  end;

  DBCode := DMUser.ActiveCollection.CollectionType;
  LastAuth := '';
  LastSeries := nil;

  BookTreeStatus := bsBusy;
  try
    Tree.BeginUpdate;
    try
      Tree.Clear;
      Tree.NodeDataSize := SizeOf(TBookData);
      Screen.Cursor := crHourGlass;
      try
        spStatus.Caption := 'Построение списка ...';

        i := 0;
        try
          TableB.DisableControls;
          try
            Max := TableA.RecordCount;

            TableA.First;
            while not TableA.Eof do
            begin
              //
              // для этой записи в мастере нет книг, переходим к следующей записе
              //
              if TableB.IsEmpty then
              begin
                TableA.Next;
                Continue;
              end;

              // обрабатываемое дерево не обязательно находится на активной вкладке!
              // это относится ко всем последующим проверкам
              if Tree.Tag = 4 then
              begin
                DMUser.ActivateCollection(TableB.FieldByName('DatabaseId').AsInteger);
                CollectionName := DMUser.ActiveCollection.Name;
              end;


              if ShowAuth then
              begin
                if LastAuth <> TableB.FieldByName('FullName').AsString then
                begin
                  authorNode := Tree.AddChild(nil);
                  Data := Tree.GetNodeData(authorNode);
                  Data.nodeType := ntAuthorInfo;
                  Data.FullName := TableB.FieldByName('FullName').AsString;
                  LastAuth := TableB.FieldByName('FullName').AsString;
                  LastSeries := nil;
                  if Tree.Tag = 4 then Data.ColName := CollectionName;
                 end;
              end
              else
                authorNode := nil;

              if ShowSer then
              begin
                if TableB.FieldByName('SerID').AsInteger = 1 then
                  seriesNode := authorNode
                else
                begin
                  seriesNode := FindSeriesInTree(Tree, authorNode, TableB.FieldByName('SerID').AsInteger);

                  if not Assigned(seriesNode) then
                  begin
                    if ShowAuth then
                    begin
                      if Assigned(LastSeries) then
                        seriesNode := Tree.InsertNode(LastSeries, amInsertAfter)
                      else
                        seriesNode := Tree.InsertNode(authorNode, amAddChildFirst);
                    end
                    else if not Assigned(LastSeries) then
                      seriesNode := Tree.InsertNode(Tree.GetFirst, amInsertBefore)
                    else
                      seriesNode := Tree.InsertNode(LastSeries, amInsertAfter);

                    Data := Tree.GetNodeData(seriesNode);
                    Data.nodeType := ntSeriesInfo;
                    Data.Series := TableB.FieldByName('Series').AsString;
                    Data.SeriesID := TableB.FieldByName('SerID').AsInteger;

                    LastSeries := seriesNode;
                  end;
                end;
              end
              else
                seriesNode := authorNode;

              bookNode := Tree.AddChild(seriesNode);
              Data := Tree.GetNodeData(bookNode);
              Data.ID := TableB.FieldByName('ID').AsInteger;
              Data.Title := TableB.FieldByName('Title').AsString;

              Data.FullName := TableB.FieldByName('FullName').AsString;

              if (COL_NO) in Columns then Data.No := TableB.FieldByName('SeqNumber').AsInteger;

              if (COL_SIZE in Columns) then Data.Size := TableB.FieldByName('Size').AsInteger;

              if (COL_DATE in Columns) then Data.Date := TableB.FieldByName('Date').AsDateTime;

              if (COL_COLLECTION in Columns) then Data.ColName := CollectionName;

              if Tree.Tag <> 4 then
                  Data.Genre := DMMain.GetBookGenres(TableB.FieldByName('ID').AsInteger,False)
                else
                  Data.Genre := TableB.FieldByName('Genres').AsString;

              if (COL_SERIES in Columns) and (TableB.FieldByName('SerID').AsInteger <> 1) then
                Data.Series := TableB.FieldByName('Series').AsString;

              if isOnlineCollection(DBCode) and not TableB.FieldByName('Local').IsNull then
                Data.Locale := TableB.FieldByName('Local').AsBoolean;

              if (COL_RATE in Columns) and (not TableB.FieldByName('Rate').IsNull) then
                Data.Rate := TableB.FieldByName('Rate').AsInteger;

              Data.nodeType := ntBookInfo;

              Inc(i);
              spProgress.Percent := i * 100 div Max;

              TableA.Next;
            end; //while

            Tree.FullExpand();

            if ShowSer then
            begin
              authorNode := Tree.GetFirst;
              while Assigned(authorNode) do
              begin
                Data := Tree.GetNodeData(authorNode);
                if Data.nodeType = ntSeriesInfo then
                  SortChild(Tree, authorNode);

                if (Data.nodeType = ntAuthorInfo) and (authorNode.ChildCount = 0) then
                  Tree.DeleteNode(authorNode, True); { TODO -oNickR -cBug : при удалении ноды поведение GetNext неочевидно }

                authorNode := Tree.GetNext(authorNode);
              end;
            end;

            case Tree.Tag of
              0: lblBooksTotalA.Caption := Format('(%d)', [i]);
              1: lblBooksTotalS.Caption := Format('(%d)', [i]);
              2: lblBooksTotalG.Caption := Format('(%d)', [i]);
              3: lblTotalBooksSR.Caption := Format('(%d)', [i]);
              4: lblTotalBooksF.Caption := Format('(%d)', [i]);
              5: lblTotalBooksFL.Caption := Format('(%d)', [i]);
            end;

          finally
            spProgress.Percent := 100;
            spProgress.Visible := False;
            spStatus.Caption := 'Готово';
            DMUser.ActivateCollection(Settings.ActiveCollection);

            if (Settings.TreeModes[Tree.Tag] = tmFlat) then
                  Tree.SortTree(FSortSettings[Tree.Tag].Column, FSortSettings[Tree.Tag].Direction);
          end;
        finally
          TableB.EnableControls;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    finally
      Tree.EndUpdate;
    end;
  finally
    BookTreeStatus := bsFree;
  end;
end;

procedure TfrmMain.miCopyAuthorClick(Sender: TObject);
var
  treeView: TVirtualStringTree;
  Data: PAuthorData;
  DataG: PGenreData;
  strText: String;
begin
  case ActiveView of
    ByAuthorView: treeView := tvAuthors;
    BySeriesView: treeView := tvSeries;
    ByGenreView: treeView := tvGenres;
  else
    Assert(False);
  end;

  case ActiveView of
    ByAuthorView, BySeriesView:
      begin
        Data := treeView.GetNodeData(treeView.GetFirstSelected);
        if not Assigned(Data) then
          Exit;

        strText := Data.Text;
      end;

    ByGenreView:
      begin
        DataG := tvGenres.GetNodeData(tvGenres.GetFirstSelected);
        if not Assigned(DataG) then
          Exit;

        strText := DataG.Text;
      end;
  end;
  Clipboard.AsText := strText;
end;

procedure TfrmMain.miCopyClBrdClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  S: String;
  Data: PBookData;
begin
  GetActiveTree(Tree);
  Data := Tree.GetNodeData(Tree.GetFirstSelected);
  if not Assigned(Data) then
    Exit;

  case Data.nodeType of
    ntSeriesInfo:
      S := Data.FullName + '. Серия: ' + Data.Series;

    ntBookInfo:
      if Data.Series = '' then
        S := Data.FullName + '. ' + Data.Title
      else
        S := Data.FullName + '. Серия:' + Data.Series + '. ' + Data.Title;
  end;
  Clipboard.AsText := S;
end;

procedure TfrmMain.miDeleteBookClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Node: PvirtualNode;
  Data: PBookData;
  ALibrary: TMHLLibrary;
  FUpdateFavorites: Boolean;
begin
  FUpdateFavorites := False;

  if ActiveView = FavoritesView then
  begin
    MessageDlg('Для удаления книги перейдите ' + #13 + 'в соответствующую коллекцию', mtWarning, [mbOk], 0);
    Exit;
  end;

  if MessageDlg('Удалить отмеченные книги?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  GetActiveTree(Tree);

  ALibrary := TMHLLibrary.Create(nil);
  try
    ALibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
    ALibrary.Active := True;

    Node := Tree.GetFirst;
    while Assigned(Node) do
    begin
      Data := Tree.GetNodeData(Node);
      Assert(Assigned(Data));

      if (Data.nodeType = ntBookInfo) and ((Tree.CheckState[Node] = csCheckedNormal) or (Tree.Selected[Node])) then
      begin
        ALibrary.BeginBulkOperation;
        try
          ALibrary.DeleteBook(Data.ID);
          ALibrary.EndBulkOperation(True);
        except
          ALibrary.EndBulkOperation(False);
        end;

        if DMUser.tblFavorites.Locate('DatabaseID;InnerID', VarArrayOf([Settings.ActiveCollection, Data.ID]), []) then
        begin
          DMUser.tblFavorites.Delete;
          FUpdateFavorites := True;
        end;
      end;

      Node := Tree.GetNext(Node);
    end;
  finally
    ALibrary.Free;
  end;

  //
  // Перечитать дерево
  //
  case ActiveView of
    ByAuthorView: FillBooksTree(0, tvBooksA, DMMain.tblAuthor_List, DMMain.tblBooksA, False, True);  // авторы
    BySeriesView: FillBooksTree(0, tvBooksS, nil,                   DMMain.tblBooksS, False, False); // серии
    ByGenreView:  FillBooksTree(0, tvBooksG, DMMain.tblGenre_List,  DMMain.tblBooksG, True,  True);  // жанры
  else
    Assert(False);
  end;

  if FUpdateFavorites then
    FillBooksTree(0, tvBooksF, nil, DMUser.tblFavorites, True, True);
end;

procedure TfrmMain.miDeleteColClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);

  { TODO -oNickR -cUsability : Думаю, стоит сделать специальный диалог для этого случая. Тогда мы сможем спросить, удалять файл коллекции или нет. }
  if MessageDlg('Удалить коллекцю "' + DMUser.ActiveCollection.Name + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  DMUser.tblBases.Delete;
  DMUser.tblBases.First;
  Settings.ActiveCollection := DMUser.ActiveCollection.ID;
  InitCollection(True);
end;

procedure TfrmMain.miDelFavoritesClick(Sender: TObject);
var
  Node: PvirtualNode;
  Data: PBookData;
begin
  Node := tvBooksF.GetFirst;
  while Assigned(Node) do
  begin
    Data := tvBooksF.GetNodeData(Node);
    Assert(Assigned(Data));
    if (Data.nodeType = ntBookInfo) and ((tvBooksF.CheckState[Node] = csCheckedNormal) or (tvBooksF.Selected[Node])) then
    begin
      DMUser.tblFavorites.Locate('ID', Data.ID, []);
      DMUser.tblFavorites.Delete;
    end;
    Node := tvBooksF.GetNext(Node);
  end;
  FillBooksTree(0, tvBooksF, nil, DMUser.tblFavorites, True, True);
end;

function TfrmMain.GetActiveBookTable(tag:integer):TAbsTable;
begin
  if Tag = 4 then
    Result := DMUser.tblFavorites
  else
    Result := DMMain.tblBooks;
end;

procedure  TfrmMain.RefreshBooksState(Tree: TVirtualStringTree; BookIDList: TBookIdList );
var
  i: integer;
  Data: PBookData;
  Node: PVirtualNode;
  Max : integer;
begin
  Node := Tree.GetFirst;
  i := 0; Max := High(BookIDList);
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    if Data.ID = BookIDList[i].ID then
    begin
      Data.Locale := BookIDList[i].Res;
      Tree.RepaintNode(Node);
      Inc(i);
      if i > Max then Break;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

procedure TfrmMain.miDownloadBooksClick(Sender: TObject);
var
  BookIDList: TBookIdList;
  Tree: TVirtualStringTree;
begin
  GetActiveTree(Tree);

  FillBookIdList(Tree, BookIDList);
  unit_exporttodevice.DownloadBooks(DMMain.ActiveTable, BookIdList );

  RefreshBooksState(Tree, BookIDList);
end;

procedure TfrmMain.miEditAuthorClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookData;
  Res: boolean;
begin
  if ActiveView = FavoritesView then
  begin
    MessageDlg('Редактирование книг из избранного невозможно.', mtWarning, [mbOk], 0);
    Exit;
  end;

  if IsLibRusecEdit(0) then
    Exit;
    
  GetActiveTree(Tree);

  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;

  DMMain.tblAuthor_List.Locate('BookId', Data.ID, []);
  DMMain.tblAuthors.Locate('ID', DMMain.tblAuthor_List['AuthID'], []);
  frmEditAuthor.edFamily.Text := DMMain.tblAuthors.FieldByName('Family').AsString;
  frmEditAuthor.edName.Text := DMMain.tblAuthors.FieldByName('Name').AsString;
  frmEditAuthor.edMiddle.Text := DMMain.tblAuthors.FieldByName('Middle').AsString;
  if frmEditAuthor.ShowModal = mrOk then
  begin
    DMMain.tblAuthors.Edit;
    DMMain.tblAuthors.FieldByName('Family').AsString := frmEditAuthor.edFamily.Text;
    DMMain.tblAuthors.FieldByName('Name').AsString := frmEditAuthor.edName.Text;
    DMMain.tblAuthors.FieldByName('Middle').AsString := frmEditAuthor.edMiddle.Text;
    DMMain.tblAuthors.FieldByName('FullName').AsString := frmEditAuthor.edFamily.Text + ' ' +
      frmEditAuthor.edName.Text + ' ' + frmEditAuthor.edMiddle.Text;
    DMMain.tblAuthors.Post;

    repeat
      { TODO -oNickR -cRefactoring : можно заменить на один UPDATE }
      Res := DMMain.tblBooks.Locate('FullName', Data.FullName, []);
      if Res then
      begin
        DMMain.tblBooks.Edit;
        DMMain.tblBooks['FullName'] := DMMain.tblAuthors['FullName'];
        DMMain.tblBooks.Post;
      end;
    until not Res;
  end;
end;

function TfrmMain.IsLibRusecEdit(ID: integer): boolean;
begin
  if isExternalCollection(DMUser.ActiveCollection.CollectionType) then
  begin
    if MessageDlg('Изменения информации о книгах в коллекциях "lib.rus.ec" возможно только на сайте.' + #13 +
      'Перейти на сайт "Электронная библиотека lib.rus.ec"?',
      mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      DMMain.tblBooks.Locate('ID', ID, []);
      ShellExecute(handle, 'open', PChar('http://lib.rus.ec/b/' + IntToStr(DMMain.tblBooks['LibID']) + '/edit'), nil, nil, SW_SHOW);
    end;
    Result := True;
  end
  else
    Result := False;
end;

procedure TfrmMain.miEditBookClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Data: PBookData;
  Node: PVirtualNode;
  i: integer;
  R: TBookRecord;
  Family: TListItem;
  ALibrary: TMHLLibrary;
  Author: TAuthorRecord;
  Genre: TGenreRecord;
begin
  if ActiveView = FavoritesView then
  begin
    MessageDlg('Редактирование книг из избранного невозможно.', mtWarning, [mbOk], 0);
    Exit;
  end;

  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;

  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data.nodeType <> ntBookInfo) then
    Exit;

  if IsLibRusecEdit(Data.Id) then
    Exit;

  SetUtilTableStatus(True);
  GetBookRecord(Data.ID, R);
  SetUtilTableStatus(False);
  frmEditBookInfo.lvAuthors.Items.Clear;
  for Author in R.Authors do
  begin
    Family := frmEditBookInfo.lvAuthors.Items.Add;
    Family.Caption := Author.LastName;
    Family.SubItems.Add(Author.FirstName);
    Family.SubItems.Add(Author.MiddleName);
  end;
  frmEditBookInfo.lblGenre.Caption := '';
  FillGenresTree(frmGenreTree.tvGenresTree);
  for Genre in R.Genres do
  begin
    frmGenreTree.SelectGenres(Genre.GenreCode);
    frmEditBookInfo.lblGenre.Caption := frmEditBookInfo.lblGenre.Caption + Genre.Alias + ';';
  end;
  frmEditBookInfo.edT.Text := R.Title;

  if R.Series = NO_SERIES_TITLE then
    frmEditBookInfo.cbSeries.Text := ''
  else
    frmEditBookInfo.cbSeries.Text := R.Series;

  frmEditBookInfo.edSN.Text := IntToStr(R.SeqNumber);

  if frmEditBookInfo.ShowModal = mrOk then
  begin
    R.ClearAuthors;

    for I := 0 to frmEditBookInfo.lvAuthors.Items.Count - 1 do
      R.AddAuthor(
        frmEditBookInfo.lvAuthors.Items[i].Caption,
        frmEditBookInfo.lvAuthors.Items[i].SubItems[0],
        frmEditBookInfo.lvAuthors.Items[i].SubItems[1]
        );

    frmGenreTree.GetSelectedGenres(R);
    R.Title := frmEditBookInfo.edT.Text;
    R.Series := frmEditBookInfo.cbSeries.Text;

    R.SeqNumber := Round(frmEditBookInfo.edSN.Value);

    ALibrary := TMHLLibrary.Create(nil);
    try
      ALibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
      ALibrary.Active := True;

      ALibrary.BeginBulkOperation;
      try
        ALibrary.DeleteBook(Data.ID);
        ALibrary.InsertBook(R);

        ALibrary.EndBulkOperation(True);
      except
        ALibrary.EndBulkOperation(False);
      end;

      Data.Title := frmEditBookInfo.edT.Text;
      Data.Genre := frmEditBookInfo.lblGenre.Caption;
      Data.No := Round(frmEditBookInfo.edSN.Value);
      Tree.RepaintNode(Node);
    finally
      ALibrary.Free;
    end;
  end;
end;

procedure TfrmMain.miEditGenresClick(Sender: TObject);
var
  NodeB, NodeG: PvirtualNode;
  DataG: PGenreData;
  DataB: PBookData;
  Tree: TVirtualStringTree;
  ALibrary: TMHLLibrary;
begin
  if ActiveView = FavoritesView then
  begin
    MessageDlg('Редактирование книг из избранного невозможно.', mtWarning, [mbOk], 0);
    Exit;
  end;

  if IsLibRusecEdit(0) then
    Exit;

  GetActiveTree(Tree);

  FillGenresTree(frmGenreTree.tvGenresTree);

  if frmGenreTree.ShowModal = mrOk then
  begin
    ALibrary := TMHLLibrary.Create(nil);
    try
      ALibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
      ALibrary.Active := True;

      NodeB := Tree.GetFirst;
      while Assigned(NodeB) do
      begin
        DataB := Tree.GetNodeData(NodeB);
        if (DataB.nodeType = ntBookInfo) and ((Tree.CheckState[NodeB] = csCheckedNormal) or (Tree.Selected[NodeB])) then
        begin
          ALibrary.CleanBookGenres(DataB.ID);

          DataB.Genre := '';
          NodeG := frmGenreTree.tvGenresTree.GetFirstSelected;
          while Assigned(NodeG) do
          begin
            DataG := frmGenreTree.tvGenresTree.GetNodeData(NodeG);

            ALibrary.AddBookGenre(DataB.ID, DataG.Code);

            DataB.Genre := DataB.Genre + DataG.Text + ' / ';
            NodeG := frmGenreTree.tvGenresTree.GetNextSelected(NodeG);
          end;

          Delete(DataB.Genre, length(DataB.Genre) - 2, 3);
        end;
        Tree.RepaintNode(NodeB);
        NodeB := Tree.GetNext(NodeB);
      end;
    finally
      ALibrary.Free;
    end;
  end;
end;

procedure TfrmMain.miEditSeriesClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Data: PBookData;
  Node: PVirtualNode;
  S: string;
begin
  if ActiveView = FavoritesView then
  begin
    MessageDlg('Редактирование книг из избранного невозможно.', mtWarning, [mbOk], 0);
    Exit;
  end;

  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;

  if IsLibRusecEdit(Data.ID) then
    Exit;

  S := Data.Series;
  if S = '' then
    Exit;
  if InputQuery('Редактирование серии', 'Название:', S) then
  begin
    DMMain.tblSeries.Locate('ID', Data.SeriesID, []);
    DMMain.tblSeries.Edit;
    DMMain.tblSeries['Title'] := S;
    DMMain.tblSeries.Post;
    Data.Series := S;
    Tree.RepaintNode(Node);
  end;
end;

procedure TfrmMain.miAddFavoritesClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  i, ID, Max: integer;
  Data: PBookData;
  Node: PVirtualNode;
begin
  GetActiveTree(Tree);
  if Tree = tvBooksF then
    Exit;

  Max := Tree.TotalCount;
  if Max = 0 then
    Exit;
  spProgress.Visible := True;
  spStatus.Caption := 'Добавляем в избранное...';
  Screen.Cursor := crHourglass;
  DMMain.tblBooks.DisableControls;
  DMUser.tblFavorites.DisableControls;
  Max := Tree.TotalCount;
  Node := Tree.GetFirst;
  i := 0;

  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    if (Data.nodeType = ntBookInfo) and ((Tree.CheckState[Node] = csCheckedNormal) or (Tree.Selected[Node])) then
    begin
      ID := Data.ID;
      DMMain.tblBooks.Locate('ID', ID, []);
      if not DMUser.tblFavorites.Locate('FileName', DMMain.tblBooksFileName.Value, []) then
      begin
        DMUser.tblFavorites.Insert;
        DMUser.tblFavoritesInnerID.Value := DMMain.tblBooksID.Value;
        DMUser.tblFavoritesDataBaseID.Value := Settings.ActiveCollection;
        DMUser.tblFavoritesSerID.Value := DMMain.tblBooksSerID.Value;
        DMUser.tblFavoritesTitle.Value := DMMain.tblBooksTitle.Value;
        if ActiveView = ByAuthorView then
          DMUser.tblFavoritesFullName.Value := DMMain.tblAuthorsFullName.Value
        else
          DMUser.tblFavoritesFullName.Value := DMMain.tblBooksFullName.Value;
        DMUser.tblFavoritesSeqNumber.Value := DMMain.tblBooksSeqNumber.Value;
        DMUser.tblFavoritesLibID.Value := DMMain.tblBooksLibID.Value;
        DMUser.tblFavoritesSize.Value := DMMain.tblBooksSize.Value;
        DMUser.tblFavoritesDeleted.Value := DMMain.tblBooksDeleted.Value;
        if not DMMain.tblBooksFolder.IsNull then
          DMUser.tblFavoritesFolder.Value := FCollectionRoot + CheckSymbols(DMMain.tblBooksFolder.Value)
        else
          DMUser.tblFavoritesFolder.Value := FCollectionRoot;
        DMUser.tblFavoritesFileName.Value := DMMain.tblBooksFileName.Value;
        DMUser.tblFavoritesExt.Value := DMMain.tblBooksExt.Value;
        DMUser.tblFavoritesInsideNo.Value := DMMain.tblBooksInsideNo.Value;
        DMUser.tblFavoritesGenres.Value := Data.Genre;
        DMUser.tblFavoritesRate.Value := DMMain.tblBooksRate.Value;
        DMUser.tblFavoritesDate.Value := DMMain.tblBooksDate.Value;
        if DMMain.tblBooksSeries.IsNull then
          DMUser.tblFavoritesSeries.Value := NO_SERIES_TITLE
        else
          DMUser.tblFavoritesSeries.Value := DMMain.tblBooksSeries.Value;

        DMUser.tblFavorites.Post;
      end;
    end;

    // Tree.CheckState[Node]:=csUnCheckedNormal;
    Inc(i);
    spProgress.Percent := i * 100 div Max;
    spProgress.Repaint;

    Node := Tree.GetNext(Node);
  end;
  spProgress.Visible := False;
  Selection(False);
  DMMain.tblBooks.EnableControls;
  DMUser.tblFavorites.EnableControls;
  Screen.Cursor := crDefault;
  FillBooksTree(0, tvBooksF, nil, DMUser.tblFavorites, True, True); // жанры
end;

procedure TfrmMain.miFb2ImportClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);
  DMMain.DBMain.Connected := False;

  unit_Import.ImportFB2(DMUser.ActiveCollection);

  InitCollection(True);
end;

procedure TfrmMain.miFb2ZipImportClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);
  DMMain.DBMain.Connected := False;

  unit_Import.ImportFB2ZIP(DMUser.ActiveCollection);

  InitCollection(True);
end;

procedure TfrmMain.miSetRateClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Data: PBookData;
  Node: PVirtualNode;
begin
  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data.nodeType <> ntBookInfo) then
    exit;
  Data.Rate := (Sender as TMenuItem).Tag;
  BookTreeStatus := bsBusy;
  if GetActiveView <> FavoritesView then
  begin
    if not DMUser.tblRates.Locate('ID', Data.ID, []) then
    begin
      DMUser.tblRates.Insert;
      DMUser.tblRates['ID'] := Data.ID;
      DMUser.tblRates['Rate'] := Data.Rate;
      DMUser.tblRates['DataBaseID'] := DMUser.ActiveCollection.ID;
      DMUser.tblRates['Date'] := Now;
      DMUser.tblRates.Post;
    end
    else
    begin
      DMUser.tblRates.Edit;
      DMUser.tblRates['Rate'] := Data.Rate;
      DMUser.tblRates.Post;
    end;
    //
    //  Синхронизация с избранным
    //
    if (GetActiveView <> FavoritesView ) and
       (DMUser.tblFavorites.Locate('InnerId;DataBaseID',
                                  VarArrayOf([Data.ID,DMUser.ActiveCollection.ID]),[]))
    then
    begin
      DMUser.tblFavorites.Edit;
      DMUser.tblFavoritesRate.Value := Data.Rate;
      DMUser.tblFavorites.Post;
      FillBooksTree(0, tvBooksF, nil, DMUser.tblFavorites, True, True); // избранное
    end;
  end
  else // активная вкладка - избранное
  begin
    DMUser.tblFavorites.Locate('ID',Data.ID,[]);
    DMUser.tblFavorites.Edit;
    DMUser.tblFavoritesRate.Value := Data.Rate;
    DMUser.tblFavorites.Post;

    //
    //  Синхронизация с таблицей рейтингов
    //

    if(DMUser.tblRates.Locate(
        'ID;DataBaseID', VarArrayOf([DMUser.tblFavoritesInnerID.Value,DMUser.tblFavoritesDatabaseID.Value]),[]))
    then
    begin
      DMUser.tblRates.Edit;
      DMUser.tblRates['Rate'] := Data.Rate;
      DMUser.tblRates.Post;
    end
    else begin
      DMUser.tblRates.Insert;
      DMUser.tblRates['ID'] := DMUser.tblFavoritesInnerID.Value;
      DMUser.tblRates['Rate'] := Data.Rate;
      DMUser.tblRates['DataBaseID'] := DMUser.tblFavoritesDatabaseID.Value;
      DMUser.tblRates['Date'] := Now;
      DMUser.tblRates.Post;
    end;
    FillBooksTree(0, tvBooksA, DMMain.tblAuthor_List, DMMain.tblBooksA, False, True); // авторы
    FillBooksTree(0, tvBooksS, nil, DMMain.tblBooksS, False, False); // серии
  end;

  Tree.RepaintNode(Node);
  BookTreeStatus := bsFree;
end;

procedure TfrmMain.ClearInfoPanel;
begin
//  Img.Visible := False;
//  mmShort.Clear;
//  pnlInfo.Refresh;
end;



procedure TfrmMain.btnSearchClick(Sender: TObject);
var
  S: String;
  I1: String;
  I2: String;
  nIndex: Integer;
const
  Filters: array[Boolean, 1..3] of string = (
    (
      'Title="%1:s*"',                                          // I1 = ''  I2 <> ''
      'FullName="%0:s*"',                                       // I1 <> '' I2 = ''
      '(FullName="%0:s*") and (Title="%1:s*")'                  // I1 <> '' I2 <> ''
    ),
    (
      'Title LIKE "%%%1:s%%"',                                  // I1 = ''  I2 <> ''
      'FullName LIKE "%%%0:s%%"',                               // I1 <> '' I2 = ''
      '(FullName LIKE "%%%0:s%%") and (Title LIKE "%%%1:s%%")'  // I1 <> '' I2 <> ''
    )
  );

begin
  I1 := Trim(edAuth.Text);
  I2 := Trim(edTitle.Text);

  nIndex := 0;
  if I1 <> '' then nIndex := nIndex or $02;
  if I2 <> '' then nIndex := nIndex or $01;

  if nIndex = 0 then
    Exit;

  spStatus.Caption := 'Ищем ...';
  StatusBar.Repaint;

  S := Format(Filters[cbFulltext.Checked, nIndex], [I1, I2]);
  Assert(S <> '');

  Screen.Cursor := crHourGlass;
  try
    if Settings.DoNotShowDeleted then
      DMMain.tblBooks.Filter := S + ' and Deleted<>1'
    else
      DMMain.tblBooks.Filter := S;
    DMMain.tblBooks.Filtered := True;
    FillBooksTree(0, tvBooksSR, nil, DMmain.tblBooks, True, True);
  finally
    Screen.Cursor := crDefault;
  end;

  spStatus.Caption := 'Готово';
  DMMain.tblBooks.Filtered := False;

  ClearLabels(PAGE_SEARCH);
end;

procedure TfrmMain.edAuthKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSearchClick(Sender);
end;

procedure TfrmMain.LocateBookList(const text: String; Tree: TVirtualStringTree);
var
  Node: PVirtualNode;
  Data: PAuthorData;
begin
  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if Data.Text = text then
    begin
      Tree.Selected[Node] := True;
      Tree.FocusedNode := Node;
      Exit;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

procedure TfrmMain.edLocateAuthorChange(Sender: TObject);
var
  S : string;
  OldText:string;
begin
  if FIgnoreChange then Exit;
  S := AnsiUpperCase(copy(edLocateAuthor.Text,1,1));
  if S <> FLastLetter.Caption then
  begin
    OldText := edLocateAuthor.Text;
    if FSimulateAlphabetClick then ChangeLetterButton(S);
    edLocateAuthor.Text := OldText;
    edLocateAuthor.Perform(WM_KEYDOWN, VK_RIGHT, 0);
  end;
  if not FDoNotLocate and DMMain.tblAuthors.Locate('FullName', edLocateAuthor.Text, [loPartialKey, loCaseInsensitive]) then
    LocateBookList(DMMain.tblAuthorsFullName.Value, tvAuthors);
end;

procedure TfrmMain.edFFullNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnApplyFilterClick(Sender);
end;

procedure TfrmMain.edLocateSeriesChange(Sender: TObject);
var
  S : string;
  OldText:string;
begin
  if FIgnoreChange or (Length(edLocateSeries.Text)=0) then Exit;
  S := AnsiUpperCase(edLocateSeries.Text);
  if S[1] <> FLastLetter.Caption then
  begin
    OldText := edLocateSeries.Text;
    if FSimulateAlphabetClick then ChangeLetterButton(S[1]);
    edLocateSeries.Text := OldText;
    edLocateSeries.Perform(WM_KEYDOWN, VK_RIGHT, 0);
  end;
  if not FDoNotLocate and DMMain.tblSeries.Locate('Title', edLocateSeries.Text, [loPartialKey, loCaseInsensitive]) then
    LocateBookList(DMMain.tblSeriesTitle.Value, tvSeries);
end;

procedure TfrmMain.FillAuthorTree;
var
  Node: PVirtualNode;
  NodeData: PAuthorData;
begin
  tvAuthors.NodeDataSize := Sizeof(TAuthorData);

  tvAuthors.BeginUpdate;
  try
    tvAuthors.Clear;

    DMMain.tblAuthors.DisableControls;
    try
      DMMain.tblAuthors.First;

      if DMMain.tblAuthorsFullName.IsNull then
        tvBooksA.Clear;

      while not DMMain.tblAuthors.Eof do
      begin
        Node := tvAuthors.AddChild(nil);
        NodeData := tvAuthors.GetNodeData(Node);
        NodeData.ID := DMMain.tblAuthorsID.AsInteger;
        NodeData.Text := DMMain.tblAuthorsFullName.AsString;

        DMMain.tblAuthors.Next;
      end;
    finally
      DMMain.tblAuthors.EnableControls;
    end;
    ///DMMain.tblAuthors.First;

    tvAuthors.Selected[tvAuthors.GetFirst] := True;
  finally
    tvAuthors.EndUpdate;
  end;
end;

procedure TfrmMain.FillSeriesTree;
var
  Node: PVirtualNode;
  NodeData: PAuthorData;
begin
  tvSeries.NodeDataSize := Sizeof(TAuthorData);

  tvSeries.BeginUpdate;
  try
    tvSeries.Clear;

    DMMain.tblSeries.DisableControls;
    try
      DMMain.tblSeries.First;

      if DMMain.tblSeriesTitle.IsNull then
        tvBooksS.Clear;

      while not DMMain.tblSeries.Eof do
      begin
        Node := tvSeries.AddChild(nil);
        NodeData := tvSeries.GetNodeData(Node);
        NodeData.ID := DMMain.tblSeriesID.AsInteger;
        NodeData.Text := DMMain.tblSeriesTitle.AsString;
        DMMain.tblSeries.Next;
      end;
    finally
      DMMain.tblSeries.EnableControls;
    end;
    ///DMMain.tblSeries.First;
  finally
    tvSeries.EndUpdate;
  end;
end;

procedure TfrmMain.FillGenresTree(Tree: TVirtualStringTree);
var
  genreNode: PVirtualNode;
  genreData: PGenreData;
  Nodes: TStringList;
  strParentCode: string;
  nParentIndex: Integer;
  ParentNode: PVirtualNode;
begin
  Nodes := TStringList.Create;
  Nodes.Sorted := True;
  try
    Tree.NodeDataSize := SizeOf(TGenreData);

    Tree.BeginUpdate;
    try
      Tree.Clear;

      DMMain.tblGenres.First;
      while not DMMain.tblGenres.Eof do
      begin
        strParentCode := DMMain.tblGenresParentCode.Value;

        ParentNode := nil;
        if (strParentCode <> '0') and Nodes.Find(strParentCode, nParentIndex) then
          ParentNode := PVirtualNode(Nodes.Objects[nParentIndex]);

        genreNode := Tree.AddChild(ParentNode);

        genreData := Tree.GetNodeData(genreNode);
        genreData.id := DMMain.tblGenresID.Value;
        genreData.Text := DMMain.tblGenresAlias.Value;
        genreData.Code := DMMain.tblGenresCode.Value;
        genreData.ParentCode := strParentCode;

        Nodes.AddObject(genreData.Code, TObject(genreNode));

        DMMain.tblGenres.Next;
      end;
    finally
      Tree.EndUpdate;
    end;
  finally
    Nodes.Free;
  end;
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
var
  frmAbout: TfrmAbout;
begin
  frmAbout := TfrmAbout.Create(Application);
  try
    frmAbout.ShowModal;
  finally
    frmAbout.Free;
  end;
end;

procedure TfrmMain.miActiveCollectionClick(Sender: TObject);
var
  I: integer;
begin
  I := (Sender as TMenuItem).Tag;
  if DMUser.ActivateCollection(I) then
  begin
    (Sender as TMenuItem).Checked := True;
    Settings.ActiveCollection := I;
    InitCollection(True);
  end;
end;

procedure TfrmMain.miBookInfoClick(Sender: TObject);
var
  UA, US: AnsiString;
  Tree: TVirtualStringTree;
  CR: string;
  Data: PBookData;
  Table: TAbsTable;
  frmBookDetails: TfrmBookDetails;

  Zip: TZipForge;
  FS : TMemoryStream;

begin
  if not isLocalCollection(DMUser.ActiveCollection.CollectionType) then
    Exit;

  if not isFB2Collection(DMUser.ActiveCollection.CollectionType) then
    Exit;

  try
    GetActiveTree(Tree);

    Table := GetActiveBookTable(Tree.Tag);

    if Tree.GetFirstSelected = nil then
      Exit;

    Data := Tree.GetNodeData(Tree.GetFirstSelected);
    if not Assigned(Data) then
      Exit;

    if Data.nodeType <> ntBookInfo then
      Exit;

    Table.Locate('ID', Data.ID, []);
    FFormBusy := True;

    CR := GetFullBookPath(Table,FCollectionRoot);
    if Table.IsEmpty then
      Exit;

    FS := TMemoryStream.Create;
    try
      if ExtractFileExt(CR) = ZIP_EXTENSION then
      begin
        if not FileExists(CR) then
        begin
          ShowMessage('Архив ' + CR + ' не найден!');
          Exit;
        end;

      Zip := TZipForge.Create(Self);
      try
        Zip.FileName := CR;
        Zip.OpenArchive;
        Zip.ExtractToStream(GetFileNameZip(Zip,Table['InsideNo']),FS);
        Zip.CloseArchive;
      finally
        Zip.Free;
      end;
      end
      else
      begin
        FS.LoadFromFile(CR + Table['FileName'] + Table['Ext']);
      end;

      frmBookDetails := TfrmBookDetails.Create(Application);
      try
        frmBookDetails.ShowBookInfo(FS);
        frmBookDetails.mmInfo.Lines.Add('Добавлено: ' + Table.FieldByName('Date').AsString);
        frmBookDetails.ShowModal;
      finally
        frmBookDetails.Free;
      end;
    finally
      FS.Free;
    end;
  except
    FFormBusy := False;
  end;
end;

procedure TfrmMain.miClearRateClick(Sender: TObject);
var
  Tree: TVirtualstringTree;
  Data: PbookData;
  Node: PVirtualNode;
begin
  GetactiveTree(Tree);
  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data.nodeType <> ntBookInfo) then
    Exit;
    
  Data.Rate := 0;
  BookTreeStatus := bsBusy;
  if GetActiveView <> FavoritesView then
  begin
    if DMUser.tblRates.Locate('ID;DataBaseID',
          VarArrayOf([Data.ID,DMUser.ActiveCollection.ID]), [])
      then DMUser.tblRates.Delete;
    if DMUser.tblFavorites.Locate('InnerID;DataBaseID',
       VarArrayOf([Data.ID,DMUser.ActiveCollection.ID]),[]) then
    begin
      DMUser.tblFavorites.Edit;
      DMUser.tblFavoritesRate.Value := 0;
      DMUser.tblFavorites.Post;

      FillBooksTree(0, tvBooksF, nil, DMUser.tblFavorites, True, True); // избранное
    end;
  end
  else if DMUser.tblFavorites.Locate('ID',Data.ID,[]) then
    begin
      DMUser.tblFavorites.Edit;
      DMUser.tblFavoritesRate.Value := 0;
      DMUser.tblFavorites.Post;

      if DMUser.tblRates.Locate('ID;DataBaseID',
          VarArrayOf([DMUser.tblFavoritesInnerID.Value,DMUser.tblFavoritesDatabaseID.Value]), [])
        then begin
          DMUser.tblRates.Delete;

          FillBooksTree(0, tvBooksA, DMMain.tblAuthor_List, DMMain.tblBooksA, False, True); // авторы
          FillBooksTree(0, tvBooksS, nil, DMMain.tblBooksS, False, False); // серии
        end;
    end;

  Tree.RepaintNode(Node);
  BookTreeStatus := bsFree;
end;

procedure TfrmMain.miQuitAppClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.pmiSelectAllClick(Sender: TObject);
begin
  Selection(True);
end;

procedure TfrmMain.pmiDeselectAllClick(Sender: TObject);
begin
  Selection(False);
end;

procedure TfrmMain.miGoForumClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', '"http://forum.home-lib.net/"', nil, nil, SW_SHOW);
end;

procedure TfrmMain.miGoSiteClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', 'http://home-lib.net/', nil, nil, SW_SHOW);
end;

procedure TfrmMain.miGoToAuthorClick(Sender: TObject);
var
  I: integer;
  Data: PBookData;
  Node: PvirtualNode;
  Tree: TVirtualstringTree;
  FN: string;
begin
  GetActiveTree(Tree);

  Node := Tree.GetFirstSelected;
  Assert(Assigned(Node));

  Data := Tree.GetNodeData(Node);
  Assert(Assigned(Data));
  if not Assigned(Data) or (Data.nodeType <> ntBookInfo) then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    if ActiveView = FavoritesView then
    begin
      I := DMUser.tblFavoritesDatabaseID.Value;
      if I <> Settings.ActiveCollection then
      begin
        if DMUser.ActivateCollection(I) then
        begin
          Settings.ActiveCollection := I;
          InitCollection(True);
          CreateCollectionMenu;
        end;
      end;
      DMUser.tblFavorites.Locate('ID', Data.ID, []);
      FN := DMUser.tblFavoritesFullName.Value;
    end
    else
    begin
      DMMain.tblBooks.Locate('ID', Data.ID, []);
      FN := DMMain.tblBooksFullName.Value;
    end;
    pgControl.ActivePageIndex := 0;
    edLocateAuthor.Text := FN;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.miCheckUpdatesClick(Sender: TObject);
var
  SL: TStringList;
  LF: TMemoryStream;
  i: integer;
  S: string;
  HTTP: TidHTTP;
begin
  LF := TMemoryStream.Create;
  try
    SL := TStringList.Create;
    try
      HTTP := TidHTTP.Create;
      SetProxySettings(HTTP);
      try
        Http.Get(InclideUrlSlash(Settings.UpdateURL)+PROGRAM_VERINFO_FILENAME, LF);
      except
          on E: EIdSocketError do
            if E.LastError = 11001 then
              ShowMessage('Проверка обновления не удалось! Сервер не найден.'+
                           #13+'Код ошибки: '+IntToStr(E.LastError))
            else
              ShowMessage('Проверка обновления не удалось! Ошибка подключения.'+
                           #13+'Код ошибки: '+IntToStr(E.LastError));
           on E: Exception do
             ShowMessage('Проверка обновления не удалось! Сервер сообщает об ошибке '+
                          #13+'Код ошибки: '+IntToStr(HTTP.ResponseCode));
      end;
      { TODO -oNickR -cRefactoring : проверить использование файла last_version.info. Возможно он больше нигде не нужен и можно не сохранять его на диск }
      LF.SaveToFile(Settings.SystemFileName[sfAppVerInfo]);
      SL.LoadFromFile(Settings.SystemFileName[sfAppVerInfo]);
      if SL.Count > 0 then
        if CompareStr(VersionInfo.FileVersion, SL[0]) < 0 then
        begin
          S := #13;
          for I := 1 to SL.Count - 1 do
            S := S + '  ' + SL[i] + #13;

          ShowMessage('Доступна новая версия - ' + SL[0] + #13 + S + #13 +
            'Посетите сайт программы для загрузки обновлений.');
        end
        else if not FAutoCheck then
          ShowMessage('У вас самая свежая версия.');
      FAutoCheck := False;
    finally
      HTTP.Free;
      SL.Free;
    end;
  finally
    LF.Free;
  end;
end;

procedure TfrmMain.miStatClick(Sender: TObject);
var
  frmStat: TfrmStat;
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);

  frmStat := TfrmStat.Create(Application);
  try
    frmStat.ShowInfo;
    frmStat.ShowModal;
  finally
    frmStat.Free;
  end;
end;

procedure TfrmMain.miSyncOnlineClick(Sender: TObject);
begin
  if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
      unit_Utils.SyncOnLineFiles
    else
      unit_Utils.SyncFolders;
  InitCollection(True);
end;

procedure TfrmMain.miUpdateClick(Sender: TObject);
begin
  unit_utils.LibrusecUpdate;
  InitCollection(True);
end;

procedure TfrmMain.N27Click(Sender: TObject);
begin
  DeleteFile(Settings.WorkPath + 'columns.ini');
  SetColumns;
  SetHeaderPopUp;
end;

procedure TfrmMain.N33Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.HeaderPopupItemClick(Sender: TObject);
var
  i: integer;
  Tree : TVirtualstringTree;
  Tag: integer;
  Column: TVirtualTreeColumn;

  S: string;
  MinWidth, MaxWidth : integer;
  Options: TVTColumnOptions;
  Alignment: TAlignment;

begin
  GetActiveTree(Tree);

  Tag := (Sender as TMenuItem).Tag;

  if (Sender as TMenuItem).Checked then
  begin           // удаляем
    for I := 0 to Tree.Header.Columns.Count - 1 do
      if Tree.Header.Columns[i].Tag = Tag then
      begin
        Tree.Header.Columns.Delete(i);
        (Sender as TMenuItem).Checked := False;
        Break;
      end;
  end
  else
  begin           // добавляем
    Column := TVirtualTreeColumn.Create(Tree.Header.Columns);

    GetDefaultColumnProperties(Settings.TreeModes[Tree.Tag],Tag,
                         S,
                         MinWidth,
                         MaxWidth,
                         Alignment,
                         Options
                         );
    Column.Tag := Tag;
    Column.Text := S;
    Column.MinWidth := MinWidth;
    Column.MaxWidth := MaxWidth;
    Column.Alignment:= Alignment;
    Column.Options  := Options;
    (Sender as TMenuItem).Checked := True;
  end;
  SaveColumns;
end;

procedure TfrmMain.miGoDonateClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', '"http://home-lib.net/help_us"', nil, nil, SW_SHOW);
end;

procedure TfrmMain.miCollectionExportClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);
  unit_Export.Export2XML;
end;

procedure TfrmMain.miCollectionImportClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);
  DMMain.DBMain.Connected := False;

  unit_Import.ImportXML(DMUser.ActiveCollection);

  InitCollection(True);
end;

procedure TfrmMain.miCollsettingsClick(Sender: TObject);
var
  frmBases: TfrmBases;
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);

  frmBases := TfrmBases.Create(Application);
  try
    if frmBases.ShowModal = mrOk then
    begin
      Assert(Settings.ActiveCollection = DMUser.ActiveCollection.ID);
      CreateCollectionMenu;
      InitCollection(True);
    end;
  finally
    frmBases.Free;
  end;
end;

procedure TfrmMain.miRefreshClick(Sender: TObject);
begin
  InitCollection(True);
end;

procedure TfrmMain.miRefreshGenresClick(Sender: TObject);
var
  ALibrary: TMHLLibrary;
  AFileName: string;
begin
  DMMain.DBMain.Connected := False;
  ALibrary := TMHLLibrary.Create(nil);
  try
    ALibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
    ALibrary.Active := True;

    if isFB2Collection(DMUser.ActiveCollection.CollectionType) then
      ALibrary.ReloadDefaultGenres(Settings.SystemFileName[sfGenresFB2])
    else if unit_Helpers.GetFileName(fnGenreList, AFileName) then
      ALibrary.ReloadDefaultGenres(AFileName);
  finally
    ALibrary.Free;
  end;
  InitCollection(True);
end;

procedure TfrmMain.miSettingsClick(Sender: TObject);
var
  frmSettings: TfrmSettings;
begin
  frmSettings := TfrmSettings.Create(Application);
  try
    frmSettings.LoadSetting;
    frmSettings.ShowModal;
  finally
    frmSettings.Free;
  end;
  ReadINIData;
end;

procedure TfrmMain.SetHeaderPopUp;
var
  Tree: TVirtualStringTree;
  i: integer;
begin
  GetActiveTree(Tree);

  for I := 0 to pmHeaders.Items.Count - 1 do
  begin
    pmHeaders.Items[i].Checked := False;
    pmHeaders.Items[i].Tag := ColumnTags[i];
  end;

  for I := 0 to Tree.Header.Columns.Count - 1 do
  begin
    case Tree.Header.Columns[i].Tag of
      COL_AUTHOR:      pmHeaders.Items[0].Checked := True;
      COL_TITLE:       pmHeaders.Items[1].Checked := True;
      COL_SERIES:      pmHeaders.Items[2].Checked := True;
      COL_NO:          pmHeaders.Items[3].Checked := True;
      COL_GENRE:       pmHeaders.Items[4].Checked := True;
      COL_SIZE :       pmHeaders.Items[5].Checked := True;
      COL_RATE :       pmHeaders.Items[6].Checked := True;
      COL_DATE :       pmHeaders.Items[7].Checked := True;
      COL_COLLECTION:  pmHeaders.Items[8].Checked := True;
    end;
  end;
end;

procedure TfrmMain.pgControlChange(Sender: TObject);
begin
  SetHeaderPopUp;

  DMMain.SetActiveTable(pgControl.ActivePageIndex);
  tvBooksTreeChange(Nil,Nil);

  btnSwitchTreeMode.ImageIndex := TreeIcons[ord(Settings.TreeModes[pgControl.ActivePageIndex])];
  btnSwitchTreeMode.Hint := TreeHints[ord(Settings.TreeModes[pgControl.ActivePageIndex])];
  btnSwitchTreeMode.Enabled := pgControl.ActivePageIndex <> PAGE_SERIES;

  Settings.ActivePage := pgControl.ActivePageIndex;
end;

procedure TfrmMain.miShowHelpClick(Sender: TObject);
begin
 // Application.HelpSystem.ShowTableOfContents;
  ShellExecute(handle, 'open',PChar(Settings.SystemFileName[sfAppHelp]), nil, nil, SW_SHOW);
end;

procedure TfrmMain.miPdfdjvuClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);
  frmAddNonFb2.ShowModal;
end;

end.

