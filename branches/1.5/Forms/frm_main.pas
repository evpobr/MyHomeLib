
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
  inifiles,
  RzButton,
  unit_Globals,
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
  RzCmboBx,
  RzBHints,
  unit_CoverPanel,
  unit_InfoPanel,
  unit_Columns,
  ZipForge,
  RzPrgres,
  unit_DownloadManagerThread,
  unit_Messages,
  RzBtnEdt, files_list, ActiveX;

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
    N9: TMenuItem;
    miCollSelect: TMenuItem;
    miDeleteCol: TMenuItem;
    N18: TMenuItem;
    miStat: TMenuItem;
    miRead: TMenuItem;
    miDevice: TMenuItem;
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
    tbtnEng: TToolButton;
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
    tbtnDownloadList_Add: TToolButton;
    N1: TMenuItem;
    miGoDonate: TMenuItem;
    miGoSite: TMenuItem;
    miGoForum: TMenuItem;
    pgControl: TRzPageControl;
    TabSheet4: TRzTabSheet;
    tvBooksF: TVirtualStringTree;
    TabSheet5: TRzTabSheet;
    cpCoverF: TMHLCoverPanel;
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
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    TrayIcon: TTrayIcon;
    pmTray: TPopupMenu;
    N29: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    TabSheet7: TRzTabSheet;
    pmDownloadList: TPopupMenu;
    mi_dwnl_LocateAuthor: TMenuItem;
    N35: TMenuItem;
    mi_dwnl_Delete: TMenuItem;
    ilToolBar_Disabled: TImageList;
    N26: TMenuItem;
    N34: TMenuItem;
    N36: TMenuItem;
    tlbrDownloadList: TRzToolbar;
    RzSpacer1: TRzSpacer;
    ilDownloadToolBar: TImageList;
    BtnDwnldUp: TRzToolButton;
    BtnDwnldDown: TRzToolButton;
    BtnDelete: TRzToolButton;
    BtnFirstRecord: TRzToolButton;
    BtnLastRecord: TRzToolButton;
    RzSpacer2: TRzSpacer;
    ToolButton7: TToolButton;
    lblAuthor: TRzLabel;
    lblSeries: TRzLabel;
    btnStartDownload: TRzToolButton;
    btnPauseDownload: TRzToolButton;
    Panel1: TPanel;
    RzPanel2: TRzPanel;
    pbDownloadProgress: TRzProgressBar;
    lblDownloadState: TLabel;
    lblDnldAuthor: TLabel;
    lblDnldTitle: TLabel;
    lblDownloadCount: TRzLabel;
    btnClearDownload: TRzBitBtn;
    tvDownloadList: TVirtualStringTree;
    BtnSave: TRzToolButton;
    RzSpacer3: TRzSpacer;
    IdCookieManager: TIdCookieManager;
    N28: TMenuItem;
    FilesList: TFilesList;
    N37: TMenuItem;
    miAddToSearch: TMenuItem;
    miINPXCollectionExport: TMenuItem;
    N38: TMenuItem;
    rzsSplitterF: TRzSplitter;
    RzPanel7: TRzPanel;
    tvGroups: TVirtualStringTree;
    RzPanel8: TRzPanel;
    RzToolButton2: TRzToolButton;
    RzPanel20: TRzPanel;
    RzPanel21: TRzPanel;
    ipnlFavorites: TMHLInfoPanel;
    lblTotalBooksF: TRzLabel;
    btnClearFavorites: TRzBitBtn;
    pmGroups: TPopupMenu;
    GroupMenuItem: TMenuItem;
    btnAddGroup: TRzBitBtn;
    btnDeleteGroup: TRzBitBtn;
    btnClearGroup: TRzBitBtn;
    pmiGroups: TMenuItem;
    RzPanel6: TRzPanel;
    lblBooksTotalF: TRzLabel;
    lblGroups: TRzLabel;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N14: TMenuItem;
    miImportUserData: TMenuItem;
    miExportUserData: TMenuItem;
    miReaded: TMenuItem;
    N44: TMenuItem;
    N42: TMenuItem;
    N45: TMenuItem;
    rzsSplitterSR: TRzSplitter;
    CategoryPanelGroup1: TCategoryPanelGroup;
    ctpOther: TCategoryPanel;
    Label30: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbDate: TRzComboBox;
    cbLang: TRzComboBox;
    cbDownloaded: TRzComboBox;
    edFKeyWords: TRzButtonEdit;
    cbDeleted: TCheckBox;
    ctpFile: TCategoryPanel;
    Label27: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    edFFile: TRzButtonEdit;
    edFFolder: TRzButtonEdit;
    edFExt: TRzButtonEdit;
    cpCoverSR: TMHLCoverPanel;
    RzPanel9: TRzPanel;
    RzPanel10: TRzPanel;
    tvBooksSR: TVirtualStringTree;
    RichEdit2: TRichEdit;
    ipnlSearch: TMHLInfoPanel;
    pnlFullSearch: TPanel;
    RzGroupBox2: TRzGroupBox;
    lblTotalBooksFL: TRzLabel;
    Label1: TLabel;
    cbPresetName: TRzComboBox;
    btnDeletePreset: TRzBitBtn;
    btnSavePreset: TRzBitBtn;
    RzGroupBox5: TRzGroupBox;
    btnClearFilterEdits: TRzBitBtn;
    btnApplyFilter: TRzBitBtn;
    BalloonHint1: TBalloonHint;
    miRepairDataBase: TMenuItem;
    N6: TMenuItem;
    miCompactDataBase: TMenuItem;
    ctpBook: TCategoryPanel;
    Label5: TLabel;
    edFFullName: TRzButtonEdit;
    Label24: TLabel;
    edFTitle: TRzButtonEdit;
    Label26: TLabel;
    edFSeries: TRzButtonEdit;

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
    procedure tbSendToDeviceClick(Sender: TObject);
    procedure pmiSelectAllClick(Sender: TObject);
    procedure pmiDeselectAllClick(Sender: TObject);
    procedure miCopyClBrdClick(Sender: TObject);


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
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvBooksTreeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvBooksTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure CoverPanelResize(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure btnStartDownloadClick(Sender: TObject);
    procedure btnPauseDownloadClick(Sender: TObject);
    procedure tvDownloadListGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: string);
    procedure btnDeleteDownloadClick(Sender: TObject);
    procedure mi_dwnl_LocateAuthorClick(Sender: TObject);
    procedure btnClearDownloadClick(Sender: TObject);
    procedure tvDownloadListSaveNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Stream: TStream);
    procedure tvDownloadListLoadNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Stream: TStream);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N34Click(Sender: TObject);
    procedure MoveDwnldListNodes(Sender: TObject);
    procedure BtnFav_addClick(Sender: TObject);
    procedure tvDownloadListPaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType);
    procedure BtnSaveClick(Sender: TObject);
    procedure edLocateAuthorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSavePresetClick(Sender: TObject);
    procedure edFFullNameButtonClick(Sender: TObject);
    procedure cbPresetNameChange(Sender: TObject);
    procedure cbPresetNameSelect(Sender: TObject);
    procedure FilesListFile(Sender: TObject; const F: TSearchRec);
    procedure btnDeletePresetClick(Sender: TObject);
    procedure miAddToSearchClick(Sender: TObject);
    procedure miINPXCollectionExportClick(Sender: TObject);
    procedure pmAuthorPopup(Sender: TObject);
    procedure tvGroupsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvGroupsGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure tvGroupsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GroupMenuItemClick(Sender: TObject);
    procedure btnAddGroupClick(Sender: TObject);
    procedure btnDeleteGroupClick(Sender: TObject);
    procedure tvGroupsDragOver(Sender: TBaseVirtualTree; Source: TObject;
      Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode;
      var Effect: Integer; var Accept: Boolean);
    procedure tvGroupsDragDrop(Sender: TBaseVirtualTree; Source: TObject;
      DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState;
      Pt: TPoint; var Effect: Integer; Mode: TDropMode);
    procedure miImportUserDataClick(Sender: TObject);
    procedure miReadedClick(Sender: TObject);
    procedure miExportUserDataClick(Sender: TObject);
    procedure miRepairDataBaseClick(Sender: TObject);
    procedure miCompactDataBaseClick(Sender: TObject);

  protected
    procedure OnBookDownloadComplete(var Message: TDownloadCompleteMessage); message WM_MHL_DOWNLOAD_COMPLETE;

  private
    type
      TView = (ByAuthorView, BySeriesView, ByGenreView, SearchView, FavoritesView, DownloadView);

  private
    FDMThread: TDownloadManagerThread;

    // поиск аторов, серий
    FIgnoreChange : boolean;

    //
    // Построение деревьев
    //
    procedure FillAuthorTree;
    procedure FillSeriesTree;
    procedure FillBooksTree(
      const ParentID: Integer;
      const Tree: TVirtualStringTree;
      const Master: TDataset;
      const Detail: TDataSet;
      ShowAuth: Boolean;
      ShowSer: Boolean
      );

    procedure FillGroupsList;

    //
    // TODO -oNickR -cRefactoring : вынести эти методы в соответствующие датамодули
    //

    procedure ReadINIData;

    function GetViewTree(view: TView): TVirtualStringTree;
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

    procedure WMGetSysCommand(var Message :TMessage); message WM_SYSCOMMAND;

  public
    procedure FillGenresTree(Tree: TVirtualStringTree);
    procedure DisableControls(State: boolean);
    procedure DisableMainMenu(State: boolean);

  private
    FSelectionState: boolean;
    FCollectionRoot: string;

    FAutoCheck: boolean;
    FFormBusy: boolean;

    FFileOpMode: (fmFb2Zip, fmFb2);
    FDoNotLocate: Boolean;

    FLastLetterA: TToolButton;
    FLastLetterS: TToolButton;

    ALetter: TToolButton;
    BookTreeStatus: (bsFree, bsBusy);

    FSortSettings: array [0..5] of record
      Column: TColumnIndex;
      Direction: TSortDirection;
    end;

    FStarImage: TPngImage;
    FEmptyStarImage: TPngImage;

    //
    function GetBookNode(const Tree: TVirtualStringTree; bookID: Integer): PVirtualNode;

    procedure FillBookIdList(const Tree: TVirtualStringTree; var BookIDList: TBookIdList);
    function GetActiveBookTable(tag: integer): TAbsTable;
    procedure ClearLabels(Tag: integer);
    procedure SetAuthorsShowLocalOnly;
    procedure SetSeriesShowLocalOnly;
    procedure SetBooksFilter;
    procedure FillAllBooksTree;
    procedure ChangeLetterButton(S: string);
    function CheckLibUpdates(Auto: boolean): Boolean;
    procedure GetActiveViewComponents(var Tree: TVirtualStringTree; var Panel: TMHLInfoPanel; var Cover: TMHLCoverPanel);
    procedure SetCoversVisible(State: boolean);
    procedure RefreshBooksState(Tree: TVirtualStringTree; BookIDList: TBookIdList);
    procedure SetColumns;
    procedure SaveColumns;
    function GetTreeTag(const Sender: TBaseVirtualTree; const Column: integer): integer;
    function GetText(Tag: integer; Data: PBookData): string;
    procedure SetHeaderPopUp;
    procedure RestorePositions;
    procedure DownloadBooks;
    function CheckActiveDownloads:boolean;
    procedure SetLangBarSize;
    procedure TheFirstRun;

    function GetActiveView: TView;
    procedure StartLibUpdate;
    procedure LoadSearchPreset(FN: string);
    procedure CreateGroupsMenu;
    procedure SaveMainFormSettings;
    procedure SavePositions;
    property ActiveView: TView read GetActiveView;
  end;

var
  frmMain: TfrmMain;

const CHECK_FILE = 'TheFirstRun.check';

implementation

uses
  dm_collection,
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
  unit_MHLHelpers,
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
  idException, frm_editor, unit_SearchUtils;

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


function TfrmMain.CheckActiveDownloads:boolean;
var
  Data : PDownloadData;
  Node : PVirtualNode;
begin
  Result := False;
  Node := tvDownloadList.GetFirst;
  while Node <> nil do
  begin
    Data := tvDownloadList.GetNodeData(Node);
    if Data.State = dsRun then
    begin
      Result := True;
      Break;
    end;
    Node := tvDownloadList.GetNext(Node);
  end;
end;


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
var
  APage: integer;
begin
  APage := Settings.ActivePage;

  pgControl.ActivePageIndex := PAGE_AUTHORS;
  edLocateAuthor.Text := Settings.LastAuthor;
  SelectBookById(tvBooksA,Settings.LastBookInAuthors);

  pgControl.ActivePageIndex := PAGE_SERIES;
  edLocateSeries.Text := Settings.LastSeries;
  SelectBookById(tvBooksS,Settings.LastBookInSeries);


  SelectBookById(tvBooksF,Settings.LastBookInFavorites);


  FIgnoreChange := True;
  edLocateAuthor.Text := '';
  edLocateSeries.Text := '';

  FIgnoreChange := False;

  pgControl.ActivePageIndex := APage;

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

    //-------------------------------------------------------------------------
    tvBooksA.Header.MainColumn := 1;
    tvBooksS.Header.MainColumn := 1;
    tvBooksG.Header.MainColumn := 1;
    tvBooksF.Header.MainColumn := 1;
    tvBooksSR.Header.MainColumn := 1;

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
  cpCoverA.AnnotationColor := BGColor;

  cpCoverS.FontSize := Settings.ShortFontSize;
  cpCoverS.AnnotationColor := BGColor;

  cpCoverG.FontSize := Settings.ShortFontSize;
  cpCoverG.AnnotationColor := BGColor;

  cpCoverF.FontSize := Settings.ShortFontSize;
  cpCoverF.AnnotationColor := BGColor;

  cpCoverSR.FontSize := Settings.ShortFontSize;
  cpCoverSR.AnnotationColor := BGColor;


  SetTreeViewColor(tvAuthors);
  SetTreeViewColor(tvBooksA);
  SetTreeViewColor(tvBooksS);
  SetTreeViewColor(tvBooksG);
  SetTreeViewColor(tvBooksSR);
  SetTreeViewColor(tvBooksF);
  SetTreeViewColor(tvSeries);
  SetTreeViewColor(tvGenres);
  SetTreeViewColor(tvGroups);
  SetTreeViewColor(tvDownloadList);

  SetEditColor(edLocateAuthor);
  SetEditColor(edLocateSeries);

  SetEditColor(edFFullName);
  SetEditColor(edFTitle);
  SetEditColor(edFSeries);
  SetEditColor(edFFile);
  SetEditColor(edFFolder);
  SetEditColor(edFExt);

  cbDate.Color := BGColor;
  cbDownloaded.Color := BGColor;
end;

procedure TfrmMain.ReadINIData;
const CHECK_FILE = 'TheFirstRun.check';
     ROOT = 'HKEY_CURRENT_USER';
     Key  = '\Software\Microsoft\Windows\CurrentVersion\Internet Settings';
var
 regini : TRzRegIniFile;
 IETempStr, IEProxy, IEPort : String;
 i, colonpos : integer;

begin

  CreateSettings;
  Settings.LoadSettings;

  WindowState := Settings.WindowState;

  if WindowState = wsNormal then
  begin
    Width := Settings.FormWidth;
    Height := Settings.FormHeight;
  end;


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

  cpCoverA.TmpFolder := Settings.TempPath;
  cpCoverS.TmpFolder := Settings.TempPath;
  cpCoverG.TmpFolder := Settings.TempPath;
  cpCoverF.TmpFolder := Settings.TempPath;
  cpCoverSR.TmpFolder := Settings.TempPath;

  cpCoverA.Fb2InfoVisible := Settings.ShowFb2Info;
  cpCoverS.Fb2InfoVisible := Settings.ShowFb2Info;
  cpCoverG.Fb2InfoVisible := Settings.ShowFb2Info;
  cpCoverF.Fb2InfoVisible := Settings.ShowFb2Info;
  cpCoverSR.Fb2InfoVisible := Settings.ShowFb2Info;

  rzsSplitterA.Position := Settings.Splitters[0];
  rzsSplitterS.Position := Settings.Splitters[1];
  rzsSplitterG.Position := Settings.Splitters[2];
  rzsSplitterSR.Position := Settings.Splitters[3];

  ctpBook.Collapsed := Settings.BookSRCollapsed;
  ctpFile.Collapsed := Settings.FileSRCollapsed;
  ctpOther.Collapsed := Settings.OtherSRCollapsed;

  cpCoverA.Width := Settings.CoverWidth;


   // Check IE Proxy settings   (by Goblin)
  regini := TRzRegIniFile.Create(self);
  regini.PathType := ptRegistry;
  regini.Path := ROOT;
  if regini.ReadInteger(Key, 'ProxyEnable', 0) = 1 then begin
    IETempStr := regini.ReadString(Key, 'ProxyServer', '');
    if IETempStr <> '' then
      for i := 1 to Length(IETempStr) do
       if IETempStr[i] = ':' then colonpos := i;
    IEProxy := ANSILeftStr(IETempStr, colonpos-1);
    IEPort := ANSIRightStr(IETempStr, Length(IETempStr)-colonpos);

    Settings.IEProxyServer := IEProxy;
    Settings.IEProxyPort := StrToInt(IEPort);
  end;
  // End check IE Proxy settings
end;

procedure TfrmMain.btnApplyFilterClick(Sender: TObject);
var FilterString: String;
    SeriesFilter: String;
    OldFilter: String;
    Filtered: boolean;
begin
  Screen.Cursor := crSQLWAit;
  spStatus.Caption := 'Подготовка фильтра ...'; spStatus.Repaint;
  tvBooksSR.Clear;
  lblTotalBooksFL.Caption := '(0)';
  FilterString := '';
  ClearLabels(tvBooksSR.Tag);

  dmCollection.sqlBooks.SQL.Clear;

  try
    try

      OldFilter := dmCollection.tblBooks.Filter;
      Filtered :=  dmCollection.tblBooks.Filtered;


      //------------------------ серия -----------------------------------------

      FilterString := Query(edFSeries.Text);

      if FilterString <> '' then
           FilterString := 'Select * FROM Books WHERE SerID IN ' +
                           '(Select `ID` FROM `Series` WHERE Upper(`Title`) ' + FilterString + ')';

      if (dmCollection.sqlBooks.SQL.Count > 0) and (FilterString <> '') then
      begin
        dmCollection.sqlBooks.SQL.Add('INTERSECT');
        dmCollection.sqlBooks.SQL.Add(FilterString);
      end
      else
      if FilterString <> '' then
           dmCollection.sqlBooks.SQL.Add(FilterString);

      FilterString := '';
      //-------------------------- жанр ----------------------------------------
//      FilterString := Query(edFGenre.Text);
//
//      if FilterString <> '' then
//           FilterString := 'Select * FROM Books WHERE SerID IN ' +
//                           '(Select `ID` FROM `Series` WHERE Upper(`Title`) ' + FilterString + ')';
//
//      if (dmCollection.sqlBooks.SQL.Count > 0) and (FilterString <> '') then
//      begin
//        dmCollection.sqlBooks.SQL.Add('INTERSECT');
//        dmCollection.sqlBooks.SQL.Add(FilterString);
//      end
//      else
//      if FilterString <> '' then
//           dmCollection.sqlBooks.SQL.Add(FilterString);
//
//      FilterString := '';

      //-------------------  все остальное   -----------------------------------
      AddToFilter('`FullName`', Query(edFFullName.Text), False, FilterString);
      AddToFilter('`Title`', Query(edFTitle.Text), True, FilterString);
      AddToFilter('`FileName`', Query(edFFile.Text),False, FilterString);
      AddToFilter('`Folder`', Query(edFFolder.Text), False, FilterString);
      AddToFilter('`ext`', Query(edFExt.Text), False,FilterString);
      AddToFilter('`Lang`', Query(cbLang.Text), False, FilterString);
      AddToFilter('`KeyWords`', Query(edFKeyWords.Text), False, FilterString);
//
      if cbDate.ItemIndex = -1 then
        AddToFilter('`Date`',Query(cbDate.Text),False, FilterString)
      else
        case cbDate.ItemIndex of
          0:AddToFilter('`Date`',Format('> "%s"',[DateToStr(IncDay(Now,- 3))]),False, FilterString);
          1:AddToFilter('`Date`',Format('> "%s"',[DateToStr(IncDay(Now,- 7))]),False, FilterString);
          2:AddToFilter('`Date`',Format('> "%s"',[DateToStr(IncDay(Now,- 14))]),False, FilterString);
          3:AddToFilter('`Date`',Format('> "%s"',[DateToStr(IncDay(Now,- 30))]),False, FilterString);
          4:AddToFilter('`Date`',Format('> "%s"',[DateToStr(IncDay(Now,- 90))]),False, FilterString);
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

      // Ставим фильтр
      spStatus.Caption := 'Применяем фильтр ...'; spStatus.Repaint;

      if (dmCollection.sqlBooks.SQL.Count > 0) and (FilterString <> '') then
      begin
        dmCollection.sqlBooks.SQL.Add('INTERSECT');
        dmCollection.sqlBooks.SQL.Add('SELECT * FROM Books WHERE ' + FilterString);
      end
      else
      if FilterString <> '' then
           dmCollection.sqlBooks.SQL.Add('SELECT * FROM Books WHERE ' + FilterString);

      if (dmCollection.sqlBooks.SQL.Count)=0 then
            raise Exception.Create('Проверьте параметры фильтра');

      dmCollection.sqlBooks.ExecSQL;

      dmCollection.sqlBooks.Active := True;
      FillBooksTree(0, tvBooksSR, nil, dmCollection.sqlBooks, True, True);
      dmCollection.sqlBooks.Active := False;
    except
      on E: Exception do
        ShowMessage('Синтаксическая ошибка. Проверьте параметры фильтра');
    end;
  finally
    dmCollection.tblBooks.Filtered := False;
    dmCollection.tblBooks.Filter := OldFilter;
    dmCollection.tblBooks.Filtered := Filtered;

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
  cbDate.ItemIndex := -1;
  cbDownloaded.ItemIndex := 0;
  tvBooksSR.Clear;
  ClearLabels(PAGE_SEARCH);
  cbPresetName.Text := '';
  cbDeleted.Checked := False;
  cbLang.Text := '';
  edFKeyWords.Text := '';
end;

procedure TfrmMain.LoadSearchPreset(FN: string);
var
  SL : TStringList;
  HL : TStringList;
begin
  SL := TStringList.Create;
  HL := TStringList.Create;
  try
    HL.Delimiter := ';';
    HL.QuoteChar := '~';

    SL.LoadFromFile(Settings.PresetPath + FN + '.mhlf');
    HL.DelimitedText := SL.Text;

    edFFullName.Text := HL[0];
    edFTitle.Text := HL[1];
    edFSeries.Text := HL[2];
    edFFile.Text := HL[3];
    edFFolder.Text := HL[4];
    edFExt.Text := HL[5];
    cbDate.Text := HL[6];
    cbDownloaded.Text := HL[7];
    cbDeleted.Checked := StrToBool(HL[8]);
    cbLang.Text := HL[9];
    edFKeyWords.Text := HL[10];
  finally
    HL.Free;
    SL.Free;
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
    DownloadView
    );

begin
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
  btnClearFavorites.Enabled := State;
  edLocateAuthor.Enabled := State;
  edLocateSeries.Enabled := State;
  pmMain.AutoPopup := State;
  miImport.Enabled := State;
  miRead.Enabled := State;
  miDevice.Enabled := State;
  pgControl.Enabled := State;
  miCollectionExport.Enabled := State;
  miCollectionImport.Enabled := State;
  miINPXCollectionExport.Enabled := State;
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
  dmCollection.SetTableState(False);
  tvGenres.Clear;
  tvbooksG.Clear;
  dmCollection.DBCollection.Connected := False;

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
    ShowNewCollectionWizard(Nil);
    DeleteFile(Settings.WorkPath + CHECK_FILE);
    Exit;
  end;

  dmCollection.DBCollection.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
  dmCollection.DBCollection.Connected := True;
  frmMain.Caption := 'MyHomeLib - ' + DMUser.ActiveCollection.Name;


  CreateCollectionMenu;
  dmCollection.SetTableState(True);

  DisableControls(True);

  { TODO -oNickR -cRefactoring : проверить использование }
  FCollectionRoot := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  CollectionType := DMUser.ActiveCollection.CollectionType;
  IsPrivate := isPrivateCollection(CollectionType);
  IsOnline := isOnlineCollection(CollectionType);
  IsLocal := isLocalCollection(CollectionType);
  IsFB2 := isFB2Collection(CollectionType);
  IsNonFB2 := isNonFB2Collection(CollectionType);

  miFb2ZipImport.Visible := (IsPrivate and IsFB2) or (IsPrivate and IsNonFB2 and Settings.AllowMixed);
  miFb2Import.Visible := (IsPrivate and IsFB2) or (IsPrivate and IsNonFB2 and Settings.AllowMixed);
  miPdfdjvu.Visible := IsPrivate and IsNonFB2;

  TabSheet7.TabVisible := IsOnline;

  tbtnShowCover.Visible := not IsNonFB2 or (IsPrivate and IsNonFB2 and Settings.AllowMixed);

  miBookInfo.Visible := IsLocal and IsFB2;

  tbtnShowLocalOnly.Visible := IsOnline;
  miDownloadBooks.Visible := IsOnline;
  tbtnDownloadList_Add.Visible := IsOnline;
  pmiDownloadBooks.Visible := IsOnline;
  miSyncOnline.Visible := IsOnline or IsNonFb2;

  tbtnShowDeleted.Visible := not IsPrivate;

  miImport.Visible := IsPrivate;
  miEditAuthor.Visible := IsPrivate;
  miEditGenres.Visible := IsPrivate;
  miEditSeries.Visible := IsPrivate;
  miBookEdit.Visible := IsPrivate;
  miDeleteBook.Visible := IsPrivate; // DMUser.ActiveCollection.AllowDelete;

  if Assigned(FLastLetterA) then
    FLastLetterA.Down := False;

  dmCollection.tblAuthors.Filtered := False;
  if ApplyAuthorFilter then
    if dmCollection.tblAuthors.RecordCount > 500 then
    begin
      dmCollection.tblAuthors.Filter := 'Family="А*"';
      dmCollection.tblAuthors.Filtered := True;
      ALetter.Down := True;
      FLastLetterA := ALetter;
      edLocateAuthor.Text := 'А';
    end
    else
    begin
      dmCollection.tblAuthors.Filtered := False;
      tbtnStar.Down := True;
      FLastLetterA := tbtnStar;
      edLocateAuthor.Text := '';
    end;

  SetCoversVisible((not IsNonFB2 and Settings.ShowInfoPanel)
                   or (Settings.AllowMixed and Settings.ShowInfoPanel));
    

  SetAuthorsShowLocalOnly;
  SetSeriesShowLocalOnly;
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

  if not IsOnline and (ActiveView = DownloadView) then
    pgControl.ActivePageIndex := PAGE_AUTHORS;

end;

procedure TfrmMain.GetBookRecord(const ID: integer; var R: TBookRecord);
begin
  dmCollection.tblBooks.Locate('ID', ID, []);

  dmCollection.GetCurrentBook(R);
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
      CT_LIBRUSEC_USR: Result := 8;
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

procedure TfrmMain.CreateGroupsMenu;
var
  Item, ItemP : TMenuItem;
  i: integer;
begin
  pmGroups.Items.Clear;
  pmiGroups.Clear;

  i := 0;
  DMUser.tblGroupList.First;
  DMUser.tblGroupList.Next; // пропускаем "Избранное"
  while not DMUser.tblGroupList.Eof do
  begin
    // меню для кнопки
    Item := TMenuItem.Create(pmGroups);
    Item.Caption := DMUser.tblGroupListName.Value;
    Item.Tag := DMUser.tblGroupListID.Value;
    Item.OnClick := GroupMenuItemClick;
    pmGroups.Items.Insert(i, Item);

    // подменю для контекстного
    ItemP := TMenuItem.Create(pmMain);
    ItemP.Caption := DMUser.tblGroupListName.Value;
    ItemP.Tag := DMUser.tblGroupListID.Value;
    ItemP.OnClick := GroupMenuItemClick;
    pmiGroups.Insert(i, ItemP);
    inc(i);
    DMUser.tblGroupList.Next;
  end;
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

  if pmiScripts.Count > 0 then
  begin
    mmiScripts.Visible := True;
    pmiScripts.Visible := True;
  end
  else
  begin
    mmiScripts.Visible := False;
    pmiScripts.Visible := False;
  end
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
    0: FillBooksTree(0, tvBooksA, dmCollection.tblAuthor_List, dmCollection.tblBooksA,    False, True); // авторы
    1: FillBooksTree(0, tvBooksS,                   nil, dmCollection.tblBooksS,    False, False); // серии
    2: FillBooksTree(0, tvBooksG,  dmCollection.tblGenre_List, dmCollection.tblBooksG,    True,  True); // жанры
    3: ;
    4: FillBooksTree(0, tvBooksF,                   nil, DMUser.tblGrouppedBooks, True,  True); // избранное
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
      lblAuthor.Caption := '';
    end;

    PAGE_SERIES:
    begin
      ipnlSeries.Clear;
      cpCoverS.Clear;
      lblSeries.Caption := '';
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
      lblTotalBooksFL.Caption := '()';
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

procedure  TfrmMain.SetAuthorsShowLocalOnly;
begin
  if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
    begin
      if Settings.ShowLocalOnly then
        dmCollection.tblAuthors.ParamByName('All').AsInteger := 1
      else
        dmCollection.tblAuthors.ParamByName('All').AsInteger := 0;
      dmCollection.tblAuthors.Close;
      Screen.Cursor := crHourGlass;
      dmCollection.tblAuthors.Open;
      Screen.Cursor := crDefault;
    end
  else
    begin
      dmCollection.tblAuthors.ParamByName('All').AsInteger := 0;
      dmCollection.tblAuthors.Close;
      Screen.Cursor := crHourGlass;
      dmCollection.tblAuthors.Open;
      Screen.Cursor := crDefault;
    end;
end;

procedure  TfrmMain.SetSeriesShowLocalOnly;
begin
  if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
    begin
      if Settings.ShowLocalOnly then
        dmCollection.tblSeries.ParamByName('All').AsInteger := 1
      else
        dmCollection.tblSeries.ParamByName('All').AsInteger := 0;
      dmCollection.tblSeries.Close;
      Screen.Cursor := crHourGlass;
      dmCollection.tblSeries.Open;
      Screen.Cursor := crDefault;
    end
  else
    begin
      dmCollection.tblSeries.ParamByName('All').AsInteger := 0;
      dmCollection.tblSeries.Close;
      Screen.Cursor := crHourGlass;
      dmCollection.tblSeries.Open;
      Screen.Cursor := crDefault;
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

        dmCollection.tblBooksA.Filter := Filter;
        dmCollection.tblBooksG.Filter := Filter;
        dmCollection.tblBooksS.Filter := Filter;
        DMUser.tblGrouppedBooks.Filter := Filter;

        dmCollection.tblBooksA.Filtered := State;
        dmCollection.tblBooksG.Filtered := State;
        dmCollection.tblBooksS.Filtered := State;
        DMUser.tblGrouppedBooks.Filtered := State;
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


procedure TfrmMain.FilesListFile(Sender: TObject; const F: TSearchRec);
var
  S: string;
begin
  if ExtractFileExt(F.Name) = '.mhlf' then
  begin
    S := ExtractFileName(F.Name);
    Delete(S, Length(S) - 4 , 5);
    cbPresetName.Items.Add(S);
  end;
end;

procedure  TfrmMain.FillAllBooksTree;
begin
  FillBooksTree(0, tvBooksA, dmCollection.tblAuthor_List, dmCollection.tblBooksA,    False, True); // авторы
  FillBooksTree(0, tvBooksS,                   nil, dmCollection.tblBooksS,    False, False); // серии
  FillBooksTree(0, tvBooksG,  dmCollection.tblGenre_List, dmCollection.tblBooksG,    True,  True); // жанры
//  FillBooksTree(0, tvBooksF,                   nil, DMUser.tblGrouppedBooks, True,  True); // избранное
end;

function TfrmMain.CheckLibUpdates(Auto: boolean): Boolean;
var
  Active: Integer;
  i: integer;
begin

  if not Auto then ShowPopup('Проверка обновлений ...');

  Result := False;

  Active := DMUser.ActiveCollection.ID;

  Settings.Updates.CheckVersions;

  DMUser.FindFirstCollection;
  repeat
    for I := 0 to Settings.Updates.Count - 1 do
      if Settings.Updates.Items[i].CheckCodes(DMUser.ActiveCollection.Name,
                                              DMUser.ActiveCollection.CollectionType,
                                              DMUser.ActiveCollection.ID)
      then
        if Settings.Updates.Items[i].CheckVersion(Settings.WorkPath, DMUser.ActiveCollection.Version) then
        begin
          Result := True;
          Break;
        end;
  until not DMUser.FindNextCollection;
  DMUser.ActivateCollection(Active);

  if not Auto then
  begin
    HidePopup;
    if not Result then ShowMessage('Нет доступных обновлений');
  end;
end;

procedure TfrmMain.SetLangBarSize;
begin
    // исправляем косяк с алфавитными панелями
  rpLang.Visible := rusBar.Visible or engBar.Visible;
  if (rusBar.Visible and not engBar.Visible) or
     (not rusBar.Visible and engBar.Visible)
  then
    rpLang.Height := rusBar.Height + 5
  else
    rpLang.Height := 2 * rusBar.Height + 10;
end;

procedure TfrmMain.TheFirstRun;
begin
  if  DMUser.tblBases.IsEmpty then
    DeleteFile(Settings.WorkPath + CHECK_FILE)
  else
  if FileExists(Settings.WorkPath + CHECK_FILE) and
     (Application.MessageBox('Вы успешно обновили программу. Для нормальной работы необходимо' + #13 +
                'обновить струткуру таблиц БД. Сделать это прямо сейчас?',
                'MyHomeLib - первый запуск',mb_YesNo) = mrYes) then
  begin
    RenameFile(Settings.SystemFileName[sfLibRusEcinpx],Settings.SystemFileName[sfLibRusEcUpdate]);
    DeleteFile(Settings.WorkPath + CHECK_FILE);
    if unit_utils.LibrusecUpdate then
      InitCollection(True);
  end;
end;

//
// События формы
//

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if CheckActiveDownloads then
    if MessageDlg('В списке есть незавершенные закачки!' + #13 +
                  'Вы все еще хотите выйти из программы?', mtWarning, mbYesNo, 0) = mrYes then
      begin
        if Assigned(FDMThread) then FDMThread.TerminateNow;
      end
    else
      CanClose := False;
end;

procedure TfrmMain.StartLibUpdate;
begin
  if unit_utils.LibrusecUpdate then
    InitCollection(True);
end;


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  UseLatestCommonDialogs := True;

  // событие OnGetNodeDataSize почему-то не обрабатывается, инициализируем вручную

  tvBooksA.NodeDataSize := SizeOf(TBookData);
  tvBooksG.NodeDataSize := SizeOf(TBookData);
  tvBooksF.NodeDataSize := SizeOf(TBookData);
  tvBooksS.NodeDataSize := SizeOf(TBookData);
  tvBooksSR.NodeDataSize := SizeOf(TBookData);

  tvDownloadList.NodeDataSize := SizeOf(TDownloadData);

//-----------------------------

  FSelectionState := False;
  FAutoCheck := False;
  FFormBusy := False;

  FFileOpMode := fmFb2Zip;
  
  FLastLetterA := tbtnStar;
  FLastLetterS := tbtnStar;

  CreateAlphabet;

  ReadINIData;

  CreateDir(Settings.TempDir);
  CreateDir(Settings.DataDir);

  frmSplash.lblState.Caption := main_connecttodb;

  DMUser.DBUser.DatabaseFileName := Settings.SystemFileName[sfSystemDB];
  if not FileExists(DMUser.DBUser.DatabaseFileName) then
    TMHLLibrary.CreateSystemTables(DMUser.DBUser.DatabaseFileName);

  DMUser.DBUser.Connected := True;
  DMUser.SetUserTableState(True);

 //------------------------------------------------------------------------------
 //  Проверка обновлений
 //------------------------------------------------------------------------------

  frmSplash.lblState.Caption := main_check_updates;
  if Settings.CheckUpdate then
  begin
    FAutoCheck := True;
    frmMain.miCheckUpdatesClick(nil);
  end
  else
    FAutoCheck := False;

  if Settings.CheckExternalLibUpdate then
    if CheckLibUpdates(True) then
      if Settings.AutoRunUpdate then
          StartLibUpdate
      else
        if MessageDlg('Доступно обновление для коллекций "lib.rus.ec".' + #13 + ' Начать обновление ?', mtWarning, [mbYes, mbNo], 0) = mrYes then
           StartLibUpdate;

//------------------------------------------------------------------------------

  DMUser.ActivateCollection(Settings.ActiveCollection);

  FillGroupsList;
  CreateGroupsMenu;

  SetColumns;
  SetHeaderPopUp;

  frmSplash.lblState.Caption := main_loading_collection;

  InitCollection(False);
  dmCollection.SetActiveTable(pgControl.ActivePageIndex);


  TheFirstRun;

  if not DMUser.tblBases.IsEmpty then
    RestorePositions;

  if FileExists(Settings.WorkPath + 'downloads.sav') then
  begin
    tvDownloadList.LoadFromfile(Settings.WorkPath + 'downloads.sav');
    lblDownloadCount.Caption := Format('(%d)',[tvDownloadList.ChildCount[Nil]]);
  end;

//------------------------------------------------------------------------------

  SetLangBarSize;

  frmSplash.lblState.Caption := 'Старт ...';

  //
  // Create & Load "star" images from resources
  //
  FStarImage := CreateImageFromResource(TPngImage, 'smallStar') as TPngImage;
  FEmptyStarImage := CreateImageFromResource(TPngImage, 'smallStarEmpty') as TPngImage;

  // костыль
  frmMain.Visible := True;

  if frmMain.WindowState = wsMinimized then
     frmMain.WindowState := wsNormal;
  // конец костыля


  // загрузка списка пресетов для поиска
  CreateDir(Settings.PresetDir);
  FilesList.TargetPath := Settings.PresetPath;
  FilesList.Process;

  if Settings.AutoStartDwnld then
    btnStartDownloadClick(Sender);

end;

procedure TfrmMain.SavePositions;
begin
  Settings.LastAuthor := lblAuthor.Caption;
  Settings.LastSeries := lblSeries.Caption;
  Settings.LastBookInAuthors := GetSelectedBookData(tvBooksA).ID;
  Settings.LastBookInSeries := GetSelectedBookData(tvBooksS).ID;
  Settings.LastBookInFavorites := GetSelectedBookData(tvBooksF).ID;
end;


procedure TfrmMain.SaveMainFormSettings;
begin
  SaveColumns;

  SavePositions;

  Settings.Splitters[0] := rzsSplitterA.Position;
  Settings.Splitters[1] := rzsSplitterS.Position;
  Settings.Splitters[2] := rzsSplitterG.Position;
  Settings.Splitters[3] := rzsSplitterSR.Position;

  Settings.BookSRCollapsed := ctpBook.Collapsed;
  Settings.FileSRCollapsed := ctpFile.Collapsed;
  Settings.OtherSRCollapsed := ctpOther.Collapsed;

  Settings.CoverWidth := cpCoverA.Width;

  Settings.WindowState := WindowState;
  Settings.FullSearchMode := pnlFullSearch.Visible;

  if WindowState = wsNormal then
  begin
    Settings.FormWidth := Width;
    Settings.FormHeight := Height;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FStarImage);
  FreeAndNil(FEmptyStarImage);


  tvDownloadList.SaveToFile(Settings.WorkPath + 'downloads.sav');

  if DirectoryExists(Settings.TempDir) then ClearDir(Settings.TempDir);

  SaveMainFormSettings;


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
      COL_TYPE   : Result := Data.FileType;
      COL_LANG   : Result := Data.Lang;
      COL_LIBRATE   : Result := IntToStr(Data.LibRate);
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

procedure TfrmMain.tvGroupsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PGroupData;

begin
  Data := tvGroups.GetNodeData(Node);
  if Data = Nil then Exit;

  DMUser.ActivateGroup(Data.ID);

  lblGroups.Caption := DMUser.tblGroupListName.Value;

  FillBooksTree(0,tvBooksF,Nil,DMUser.tblGrouppedBooks,true, true);

end;

procedure TfrmMain.tvGroupsDragDrop(Sender: TBaseVirtualTree; Source: TObject;
  DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState;
  Pt: TPoint; var Effect: Integer; Mode: TDropMode);

var
  Nodes: TNodeArray;
  i: Integer;
  Node, LastNode : PvirtualNode;
  Data: PGenreData;
  BookData: PBookData;

          procedure SelectChildNodes(ParentNode: PVirtualNode);
          var
            Node: PVirtualNode;
          begin
            if ParentNode.ChildCount = 0 then Exit;
            Node := ParentNode.FirstChild;
            while Node <> Nil do
            begin
              SelectChildNodes(Node);
              tvBooksF.Selected[Node] := True;
              Node := tvBooksF.GetNextSibling(Node);
            end;
          end;

begin
  Nodes := nil;
  Data := tvGroups.GetNodeData(tvGroups.DropTargetNode);
  Nodes := tvBooksF.GetSortedSelection(False);

  // сканируем выделенные ноды.
  // если есть потомки, выделяем их тоже
  for i := 0 to High(Nodes) do
    SelectChildNodes(Nodes[i]);

  // составляем новый список выделенных
  Nodes := tvBooksF.GetSortedSelection(False);

  // переносим данные
  for i := 0 to High(Nodes) do
  begin
    BookData := tvBooksF.GetNodeData(Nodes[i]);
    if (BookData.nodeType = ntBookInfo) and
       (DMUser.tblGrouppedBooks.Locate('ID',BookData.ID,[])) then
    begin
      DMUser.tblGrouppedBooks.Edit;
      DMUser.tblGrouppedBooksGroupID.Value := Data.ID;
      DMUser.tblGrouppedBooks.Post;
    end;
  end;
  FillBooksTree(0,tvBooksF,Nil,DMUser.tblGrouppedBooks,true, true);
end;

procedure TfrmMain.tvGroupsDragOver(Sender: TBaseVirtualTree; Source: TObject;
  Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode;
  var Effect: Integer; var Accept: Boolean);
var
  Data : PGroupData;
begin
  Data := tvGroups.GetNodeData(tvGroups.DropTargetNode);
  if Data <> nil then
    if Data.ID <> DMUser.tblGroupListID.Value then
      Accept := True;
end;

procedure TfrmMain.tvGroupsGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := sizeof(TGroupData);
end;

procedure TfrmMain.tvGroupsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PGroupData;
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
  dmCollection.tblAuthors.Locate('ID', ID, []);
  lblAuthor.Caption := Data.Text;
  FillBooksTree(ID, tvBooksA, dmCollection.tblAuthor_List, dmCollection.tblBooksA, False, True); // авторы
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
  dmCollection.tblSeries.Locate('ID', ID, []);
  lblSeries.Caption := Data.Text;
  FillBooksTree(ID, tvBooksS, nil, dmCollection.tblBooksS, False, False); // авторы
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
    dmCollection.tblGenres.Locate('Code', ID, []);
    FillBooksTree(0, tvBooksG, dmCollection.tblGenre_List, dmCollection.tblBooksG, True, True); // жанры
  end
  else 
  begin
    dmCollection.tblGenre_List.MasterSource := nil;
    dmCollection.tblGenre_List.Filter := '`GenreCode` Like ' + QuotedStr(ID + '%');
    dmCollection.tblGenre_List.Filtered := True;
    FillBooksTree(0, tvBooksG, dmCollection.tblGenre_List, dmCollection.tblBooksG, True, True); // жанры
    dmCollection.tblGenre_List.Filtered := False;
    dmCollection.tblGenre_List.MasterSource := dmCollection.dsGenres;
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
  Ext: string;

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

  dmCollection.GetBookFileName(Data.ID, FileName, Folder, Ext, No);


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
  Application.ProcessMessages;
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
    COL_LANG   : Result := CompareSTR(Data1.Lang, Data2.Lang);
    COL_LibRate: Result := CompareInt(Data1.LibRate, Data2.LibRate);
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
    ntBookInfo:begin
                 if Data.Series <> '' then
                   Color := Settings.SeriesBookColor
                 else
                   Color := Settings.BookColor;
               end;
  end;



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
  Tag : integer;
  i: integer;
  x, y: integer;
  w, h: integer;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  if Data.nodeType <> ntBookInfo then
    Exit;

  Tag := GetTreeTag(Sender, Column);

  X := (Sender as TvirtualStringTree).Header.Columns.Items[Column].Left;

  if (Tag = COL_STATE) then
  begin
    if isOnlineCollection(DMUser.ActiveCollection.CollectionType)
        and (Data.Locale)
    then
      ilFileTypes.Draw(TargetCanvas, X, CellRect.Top + 2, 5);
    if Data.Progress = 100 then
      ilFileTypes.Draw(TargetCanvas, X + 14, CellRect.Top + 1, 6);
  end;


  { DONE -oNickR :Заменить на звездочки }
  if (Tag = COL_RATE) then
  begin
    w := FStarImage.Width;
    h := FStarImage.Height;
    x := CellRect.Left (*+ (CellRect.Right - CellRect.Left - 10 {w} * 5) div 2*);
    y := CellRect.Top + (CellRect.Bottom - CellRect.Top - h) div 2;

    for i := 0 to 4 do
    begin
      if Data.Rate > i then
        FStarImage.Draw(TargetCanvas, Rect(x, y, x + w, y + h))
      else
        FEmptyStarImage.Draw(TargetCanvas, Rect(x, y, x + w, y + h));

      Inc(x, {w} 10);
    end;
  end;
end;

procedure TfrmMain.tvBooksTreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Node : PVirtualNode;
  Tree, Left : TVirtualStringTree;
  Data : PBookData;
begin
  if Key = vk_Insert then
  begin
    Tree := (Sender as TVirtualStringTree);
    Node := Tree.FocusedNode;
    if Node <> nil then
    begin
      BookTreeStatus := bsBusy ;
      Data := Tree.GetNodeData(Node);
      if Data.nodeType = ntBookInfo then
        if Tree.CheckState[Node] = csCheckedNormal then
          Tree.CheckState[Node] := csUnCheckedNormal
        else
          Tree.CheckState[Node] := csCheckedNormal;

      Tree.Selected[Node] := False;
      Node := Tree.GetNext(Node);
      BookTreeStatus := bsFree ;
      if Node <> nil then Tree.Selected[Node] := True;
    end;
  end;
  if ((Key = vk_Right) or  (Key = vk_Left))and (ssCtrl in Shift) then
  begin
    Tree := (Sender as TVirtualStringTree);
    case ActiveView of
      ByAuthorView: Left := tvAuthors;
      BySeriesView: Left := tvSeries;
      ByGenreView: Left := tvGenres;
      FavoritesView: Left := tvGroups;
      SearchView: Exit;
    end;

    Node := Left.FocusedNode;
    Left.Selected[Node] := False;

    if (Key = vk_Right) then
           Node := Left.GetNext(Node)
     else
           Node := Left.GetPrevious(Node);

    if Node <> Nil then
    begin
      Left.Selected[Node] := True;
      Left.FocusedNode := Node;
    end;

    Node := Tree.GetFirst;
    if Node <> Nil then
         Tree.Selected[Node] := True;
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
          if Tree.CheckState[Node] = csCheckedNormal then
             Tree.CheckState[Node] := csUnCheckedNormal
          else
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
      TargetCanvas.Font.Style := [fsBold]
    else
      if not Sender.Selected[Node] then
      begin
        if Data.Locale then TargetCanvas.Font.Color := Settings.LocalColor;
        if Data.Deleted then TargetCanvas.Font.Color := Settings.DeletedColor;
      end;
end;

procedure TfrmMain.tvDownloadListGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
const
  States : array [0..3] of string = ('Ожидание','Закачка','Готово','Ошибка');
var
  Data : PDownloadData;
begin
  Data := tvDownloadList.GetNodeData(Node);
  case Column of
    0: CellText := Data.Author;
    1: CellText := Data.Title;
    2: CellText := IntToStr(Data.Size);
    3: CellText := States[ord(Data.State)];
  end;
end;

procedure TfrmMain.tvDownloadListLoadNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Stream: TStream);
var
  Data: PDownloadData;
  size: Integer;
  StrBuffer: PChar;

    function GetString:string;
    begin
      Stream.Read(Size, SizeOf(Size));
      StrBuffer := AllocMem(Size);
      Stream.Read(StrBuffer^, Size);
      Result := (StrBuffer);
      FreeMem(StrBuffer);
    end;

begin
  Data := Sender.GetNodeData(Node);
  // ID
  Stream.Read(Data.ID, SizeOf(Data.ID));

  Data.Title := GetString;
  Data.Author := GetString;

  // Size
  Stream.Read(Data.Size, SizeOf(Data.Size));

  Data.FileName := GetString;
  Data.URL := GetString;

  // State
  Stream.Read(Data.State, SizeOf(Data.State));
end;

procedure TfrmMain.tvDownloadListPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
var
  Data : PDownloadData;
begin
  Data := Sender.GetNodeData(Node);
  if (Data <> nil) and not Sender.Selected[Node] then
    case Data.State of
      dsRun  : TargetCanvas.Font.Color := clGreen;
      dsError: TargetCanvas.Font.Color := clRed;
    end;
end;

procedure TfrmMain.tvDownloadListSaveNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Stream: TStream);
var
  Data: PDownloadData;
  size: Integer;

  procedure WriteString(const S: string);
  begin
    Size := ByteLength(S) + 1;
    Stream.Write(Size, SizeOf(Size));
    Stream.Write(PChar(S)^, Size);
  end;

begin
  Data := Sender.GetNodeData(Node);

  if Data = Nil then Exit;

  //  ID
  Stream.Write(Data.ID, SizeOf(Data.ID));

  WriteString(Data.Title);
  WriteString(Data.Author);

  // Size
  Stream.Write(Data.Size, SizeOf(Data.Size));

  WriteString(Data.FileName);
  WriteString(Data.URL);

  // State
  Stream.Write(Data.State, SizeOf(Data.State));
end;

//
// Menu handlers
//
procedure TfrmMain.btnClearDownloadClick(Sender: TObject);
begin
  tvDownloadList.Clear;
  lblDownloadCount.Caption := '(0)';
end;

procedure TfrmMain.btnClearEdSeriesClick(Sender: TObject);
begin
  edLocateSeries.Clear;
  frmMain.ActiveControl := edLocateSeries;
end;

procedure TfrmMain.btnClearFavoritesClick(Sender: TObject);
begin
  ClearLabels(PAGE_FAVORITES);

  DMUser.tblGrouppedBooks.First;
  while not DMUser.tblGrouppedBooks.Eof do
    DMUser.tblGrouppedBooks.Delete;

  FillBooksTree(0, tvBooksF, nil, DMUser.tblGrouppedBooks, True, True); // избранное
end;

procedure TfrmMain.MoveDwnldListNodes(Sender: TObject);
var
  i: integer;
  List: TSelectionList;
begin
  GetSeelections(tvDownloadList,List);
  for I := 0 to tvDownloadList.SelectedCount - 1 do
    case (Sender as TrzToolButton).Tag of
      20: tvDownloadList.MoveTo(List[tvDownloadList.SelectedCount - i - 1],tvDownloadList.GetFirst,amInsertBefore,False);
      21: tvDownloadList.MoveTo(List[i],tvDownloadList.GetPrevious(List[i]),amInsertBefore,False);
      22: tvDownloadList.MoveTo(List[tvDownloadList.SelectedCount - i - 1],tvDownloadList.GetNext(List[tvDownloadList.SelectedCount - i - 1]),amInsertAfter,False);
      23: tvDownloadList.MoveTo(List[i],tvDownloadList.GetLast,amInsertAfter,False);
    end;
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
  cpCoverSR.Width := NewSize;
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
  AFolder: string;
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

  Dec(ScriptID, 901);

  if (ScriptID < 1 ) and (Settings.PromptDevicePath) then
    //if not dlgFolder.Execute then
    if not GetFolderName(Handle, 'Укажите путь', AFolder) then
      Exit
    else
      { TODO -oNickR -cRefactoring : это временное изменение в настройках и оно не должно сохраняться при закрытии программы
                             Это изменение нужно только для работы функций ZipToDevice/FileToDevice и решается
                             параметрами этих функций
      }
      Settings.DeviceDir := AFolder;

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


  GetActiveTree(Tree);

  FillBookIdList(Tree, BookIDList);

  if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
  begin
    unit_ExportToDevice.DownloadBooks(dmCollection.ActiveTable, BookIdList);
    RefreshBooksState(Tree, BookIDList);
  end;

  if ActiveView <> FavoritesView then
       unit_ExportToDevice.ExportToDevice(dmCollection.ActiveTable, BookIdList, ExportMode, Files)
  else
       unit_ExportToDevice.ExportToDevice(dmUser.tblGrouppedBooks, BookIdList, ExportMode, Files);

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

procedure TfrmMain.DownloadBooks;
var
  BookIDList: TBookIdList;
  Tree: TVirtualStringTree;
begin
  GetActiveTree(Tree);

  FillBookIdList(Tree, BookIDList);
  unit_ExportToDevice.DownloadBooks(dmCollection.ActiveTable, BookIdList );

  RefreshBooksState(Tree, BookIDList);
end;

procedure TfrmMain.tbtbnReadClick(Sender: TObject);
var
  WorkFile: String;
  Tree: TVirtualStringTree;
  Cover: TMHLCoverPanel;
  Panel: TMHLInfoPanel;
  No: integer;
  Data: PBookData;

  fs: TMemoryStream;
  Zip: TZipForge;
  I: integer;

  FileName,Folder,Ext: string;

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
      //
      if ActiveView = FavoritesView then
      begin
        I := DMUser.tblGrouppedBooksDatabaseID.Value;
        DMUser.tblBases.Locate('ID',I,[]);
        if isOnlineCollection(DMUser.tblBasesCode.Value) then
        begin
          DownloadBooks;
          if not FileExists(Panel.Folder) then
            Exit;
        end;
       end
       else
         if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
         begin
           DownloadBooks;
           if not FileExists(Panel.Folder) then
            Exit; // если файла нет, значит закачка не удалась, и юзер об  этом уже знает
         end;

      if not FileExists(Panel.Folder) then
          raise EInvalidOp.Create('Архив ' + Panel.Folder + ' не найден!');


      dmCollection.GetBookFileName(Data.ID, FileName, Folder, Ext, No);

      WorkFile := Settings.ReadPath + Format('%s - %s.%d%s',
                                              [CheckSymbols(Panel.Author),
                                               CheckSymbols(Panel.Title),No,Ext]);

      if not FileExists(WorkFile) then
      begin
        Zip := TZipForge.Create(nil);
        FS := TMemoryStream.Create;
        try
          Zip.FileName := Panel.Folder;
          Zip.BaseDir := Settings.ReadPath;
          Zip.OpenArchive;
          Zip.ExtractToStream(GetFileNameZip(Zip,No),FS);
          fs.SaveToFile(WorkFile);
        finally
          FS.Free;
          Zip.Free;
        end;
      end; // if Exists
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

  SetLangBarSize;
end;

procedure TfrmMain.tbtnRusClick(Sender: TObject);
begin
  Settings.ShowRusBar := not Settings.ShowRusBar;
  RusBar.Visible := Settings.ShowRusBar;

  SetLangBarSize;
end;


procedure TfrmMain.tbtnShowDeletedClick(Sender: TObject);
begin
  SavePositions;

  Settings.DoNotShowDeleted := not Settings.DoNotShowDeleted;
  tbtnShowDeleted.Down := Settings.DoNotShowDeleted;

  SetBooksFilter;
  FillAllBooksTree;

  RestorePositions;
end;

procedure TfrmMain.tbtnStarClick(Sender: TObject);

begin

  if (pgControl.ActivePageIndex <> PAGE_AUTHORS) and
     (pgControl.ActivePageIndex <> PAGE_SERIES)
  then Exit;

  Screen.Cursor := crHourGlass;
  case ActiveView of
    ByAuthorView:
      begin

        ClearLabels(PAGE_AUTHORS);
        if Assigned(FLastLetterA) then
            FLastLetterA.Down := False;

        FLastLetterA := (Sender as TToolButton);
        (Sender as TToolButton).Down := True;
        if (Sender as TToolButton).Tag >= 90 then
        case (Sender as TToolButton).Tag of
          91: dmCollection.tblAuthors.Filter := 'Family > "а*"';
          92: dmCollection.tblAuthors.Filter := 'Family < "а*"';
        end
        else
        begin
          edLocateAuthor.Text := (Sender as TToolButton).Caption;
          dmCollection.tblAuthors.Filter := '(Family=' + QuotedStr((Sender as TToolButton).Caption + '*') +
               ') OR (Family=' + QuotedStr(AnsiLowercase((Sender as TToolButton).Caption) + '*') + ')';
        end;
        dmCollection.tblAuthors.Filtered := (Sender as TToolButton).Tag <> 90;
        FillAuthorTree;

        //tvAuthors.Selected[tvAuthors.GetFirst] := True;
        edLocateAuthor.Perform(WM_KEYDOWN, VK_RIGHT, 0);
      end;
    BySeriesView:
      begin
        ClearLabels(PAGE_SERIES);
        if Assigned(FLastLetterS) then
          FLastLetterS.Down := False;
        FLastLetterS := (Sender as TToolButton);
        (Sender as TToolButton).Down := True;

        if (Sender as TToolButton).Tag >= 90 then
        case (Sender as TToolButton).Tag of
          90: dmCollection.tblSeries.Filter := 'Title <>' + QuotedStr(NO_SERIES_TITLE);
          91: dmCollection.tblSeries.Filter := 'Title > "а*"';
          92: dmCollection.tblSeries.Filter := 'Title < "а*" and Title <>' + QuotedStr(NO_SERIES_TITLE);
        end
        else
        begin
          edLocateSeries.Text := (Sender as TToolButton).Caption;
          dmCollection.tblSeries.Filter := '(Title=' + QuotedStr((Sender as TToolButton).Caption + '*') +
               ') OR (Title=' + QuotedStr(AnsiLowercase((Sender as TToolButton).Caption) + '*') + ')';
        end;
        dmCollection.tblSeries.Filtered := true;
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

  SavePositions;

  Settings.ShowLocalOnly := not Settings.ShowLocalOnly;
  tbtnShowLocalOnly.Down := Settings.ShowLocalOnly ;

  SetAuthorsShowLocalOnly;
  SetSeriesShowLocalOnly;
  SetBooksFilter;

  FillAuthorTree;
  FillSeriesTree;
  FillAllBooksTree;

  RestorePositions;
end;

procedure TfrmMain.SetCoversVisible(State: boolean);
begin
  cpCoverA.Visible := State;
  cpCoverS.Visible := State;
  cpCoverG.Visible := State;
  cpCoverF.Visible := State;
  cpCoverSR.Visible := State;
end;

procedure TfrmMain.tbtnShowCoverClick(Sender: TObject);
var
  Visible: boolean;
begin
  Settings.ShowInfoPanel := not Settings.ShowInfoPanel;

  Visible := (Settings.ShowInfoPanel and not isNonFb2Collection(DMUser.ActiveCollection.CollectionType)
             or (Settings.ShowInfoPanel and isNonFB2Collection(DMUser.ActiveCollection.CollectionType)
                 and Settings.AllowMixed));

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

function TfrmMain.GetViewTree(view: TView): TVirtualStringTree;
begin
  case view of
    ByAuthorView: Result := tvBooksA;
    BySeriesView: Result := tvBooksS;
    ByGenreView: Result := tvBooksG;
    SearchView: Result := tvBooksSR;
    FavoritesView: Result := tvBooksF;
  else
    begin
      Assert(False, 'Проверить использование, возможна ошибка');
      Result := nil;
    end;
  end;
end;

procedure TfrmMain.GroupMenuItemClick(Sender: TObject);
begin
  if DMUser.ActivateGroup((Sender as TMenuItem).Tag) then
        miAddFavoritesClick(Sender);
end;

procedure TfrmMain.GetActiveTree(var Tree: TVirtualStringTree);
begin
  Tree := GetViewTree(ActiveView);
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
  const Master: TDataset;
  const Detail: TDataset;
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
  TableA: TDataSet;
  TableB: TDataSet;
  Auth, LastAuth: String;
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

              if Tree.Tag <> 4 then
                  Auth := dmCollection.FullName(TableB.FieldByName('Id').AsInteger)
              else
                  Auth := TableB.FieldByName('FullName').AsString;

              if ShowAuth then
              begin
                if LastAuth <> Auth then
                begin
                  authorNode := Tree.AddChild(nil);
                  Data := Tree.GetNodeData(authorNode);
                  Data.nodeType := ntAuthorInfo;
                  Data.FullName := Auth;
                  LastAuth := Auth;
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
              Data.Series := TableB.FieldByName('Series').AsString;

              Data.FullName := Auth;
              Data.Progress := TableB.FieldByName('Progress').AsInteger;


              if (COL_NO) in Columns then Data.No := TableB.FieldByName('SeqNumber').AsInteger;

              if (COL_SIZE in Columns) then Data.Size := TableB.FieldByName('Size').AsInteger;

              if (COL_DATE in Columns) then Data.Date := TableB.FieldByName('Date').AsDateTime;

              if (COL_TYPE in Columns) then
              begin
                Data.FileType := TableB.FieldByName('Ext').AsString;
                Delete(Data.FileType,1,1);
              end;

              if (COL_COLLECTION in Columns) then Data.ColName := CollectionName;

              if Tree.Tag <> 4 then
                  Data.Genre := dmCollection.GetBookGenres(TableB.FieldByName('ID').AsInteger,False)
                else
                  Data.Genre := TableB.FieldByName('Genres').AsString;

              if (COL_SERIES in Columns) and (TableB.FieldByName('SerID').AsInteger <> 1) then
                Data.Series := TableB.FieldByName('Series').AsString;

              if isOnlineCollection(DBCode) and not TableB.FieldByName('Local').IsNull then
                Data.Locale := TableB.FieldByName('Local').AsBoolean;

              if (COL_RATE in Columns) and (not TableB.FieldByName('Rate').IsNull) then
                Data.Rate := TableB.FieldByName('Rate').AsInteger;

              if (COL_LANG in Columns) and (not TableB.FieldByName('Lang').IsNull) then
                Data.Lang := TableB.FieldByName('Lang').AsString;

              if (COL_LIBRATE in Columns) and (not TableB.FieldByName('LibRate').IsNull) then
                Data.LibRate := TableB.FieldByName('LibRate').AsInteger;

              Data.Deleted := TableB.FieldByName('Deleted').Value;

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
              4: lblBooksTotalF.Caption := Format('(%d)', [i]);
              3: lblTotalBooksFL.Caption := Format('(%d)', [i]);
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

  Node: PVirtualNode;

begin
  case ActiveView of
    ByAuthorView: treeView := tvAuthors;
    BySeriesView: treeView := tvSeries;
    ByGenreView: treeView := tvGenres;
  else
    Assert(False);
  end;

  strText := '';

  case ActiveView of
    ByAuthorView, BySeriesView:
      begin
        Node := treeView.GetFirstSelected;
        while Node <> nil do
        begin
          Data := treeView.GetNodeData(Node);
          if strText = '' then
            strText := Data.Text
          else
            strText := strText + #13#10+ Data.Text;
          Node := treeView.GetNextSelected(Node);
        end;
      end;

    ByGenreView:
      begin
        Node := treeView.GetFirstSelected;
        while Node <> nil do
        begin
          DataG := treeView.GetNodeData(Node);
          if strText = '' then
            strText := DataG.Text
          else
            strText := strText + #13#10+ DataG.Text;
          Node := treeView.GetNextSelected(Node);
        end;
      end;
  end;


  Clipboard.AsText := trim(strText);
end;

procedure TfrmMain.miCopyClBrdClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  S,R: String;
  Data: PBookData;
  Node: PVirtualNode;

begin
  GetActiveTree(Tree);

  S := ''; R := '';

  Node := Tree.GetFirstSelected;
  while Node <> Nil do
  begin
    Data := Tree.GetNodeData(Node);

    case Data.nodeType of
      ntSeriesInfo:
        S := Data.FullName + '. Серия: ' + Data.Series;

      ntBookInfo:
        if Data.Series = '' then
          S := Data.FullName + '. ' + Data.Title
        else
          S := Data.FullName + '. Серия:' + Data.Series + '. ' + Data.Title;
    end;
    if S = '' then
        R := S
      else
        R := R + #13#10 + S;

    Node := Tree.GetNextSelected(Node);
  end;
  Clipboard.AsText := trim(R);
end;

procedure TfrmMain.miDeleteBookClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Node: PvirtualNode;
  Data: PBookData;
  ALibrary: TMHLLibrary;
  FUpdateFavorites: Boolean;

  FileName,Folder, Ext: string;
  No: integer;


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
        if isOnlineCollection(DMUser.ActiveCollection.CollectionType) and Data.Locale then
        begin
          dmCollection.GetBookFileName(Data.ID, FileName, Folder, Ext, No);
          if DeleteFile(FCollectionRoot + Folder) then
            dmCollection.SetLocalStatus(Data.ID,False);
        end
        else
        begin

          ALibrary.BeginBulkOperation;
          try
            ALibrary.DeleteBook(Data.ID);
            ALibrary.EndBulkOperation(True);
          except
            ALibrary.EndBulkOperation(False);
          end;

          if DMUser.tblGrouppedBooks.Locate('DatabaseID;OuterID', VarArrayOf([Settings.ActiveCollection, Data.ID]), []) then
          begin
            DMUser.tblGrouppedBooks.Delete;
            FUpdateFavorites := True;
          end;
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
    ByAuthorView: FillBooksTree(0, tvBooksA, dmCollection.tblAuthor_List, dmCollection.tblBooksA, False, True);  // авторы
    BySeriesView: FillBooksTree(0, tvBooksS, nil,                   dmCollection.tblBooksS, False, False); // серии
    ByGenreView:  FillBooksTree(0, tvBooksG, dmCollection.tblGenre_List,  dmCollection.tblBooksG, True,  True);  // жанры
  else
    Assert(False);
  end;

  if FUpdateFavorites then
    FillBooksTree(0, tvBooksF, nil, DMUser.tblGrouppedBooks, True, True);
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
    if (Data.nodeType = ntBookInfo) and ((tvBooksG.CheckState[Node] = csCheckedNormal) or (tvBooksG.Selected[Node])) then
    begin
      DMUser.tblGrouppedBooks.Locate('ID', Data.ID, []);
      DMUser.tblGrouppedBooks.Delete;
    end;
    Node := tvBooksF.GetNext(Node);
  end;
  FillBooksTree(0, tvBooksF, nil, DMUser.tblGrouppedBooks, True, True);
  ClearLabels(PAGE_FAVORITES);
end;

function TfrmMain.GetActiveBookTable(tag:integer):TAbsTable;
begin
  if Tag = 4 then
    Result := DMUser.tblGrouppedBooks
  else
    Result := dmCollection.tblBooks;
end;

procedure  TfrmMain.RefreshBooksState(Tree: TVirtualStringTree; BookIDList: TBookIdList );
var
  i: integer;
  Data: PBookData;
  Node: PVirtualNode;
  Max : integer;
begin
  //
  // NickR - надеюсь, больше не нужна
  // { TODO -oNickR -cunused code : удалить }
  //
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

  i: integer;
  Folder: string;

  LibID : integer;

  Node: PVirtualNode;
  Data: PDownloadData;

    function CheckID(ID: integer):boolean;
    var
      Node: PVirtualNode;
      Data: PDownloadData;
    begin
      Result := False;
      Node := tvDownloadList.GetFirst;
      while Node <> nil do
      begin
        Data := tvDownloadList.GetNodeData(Node);
        if Data.ID = ID then
        begin
          Result := True;
          Break;
        end;

        Node := tvDownloadList.GetNext(Node);
      end;
    end;

begin
  if ActiveView = DownloadView then
  begin
    btnDeleteDownloadClick(Sender);
    Exit;
  end;

  GetActiveTree(Tree);

  FillBookIdList(Tree, BookIDList);

  for I := 0 to High(BookIDList) do
  begin
    if ActiveView = FavoritesView then
    begin
      DMUser.tblGrouppedBooks.Locate('ID', BookIDList[i].ID, []);
      if DMUser.tblGrouppedBooksDataBaseId.Value <> DMUser.ActiveCollection.ID then
         Continue;
    end;

    if CheckID(BookIDList[i].ID) then
      Continue;

    dmCollection.GetBookFolder(BookIDList[i].ID,Folder);
    Node := tvDownloadList.AddChild(nil);
    Data := tvDownloadList.GetNodeData(Node);
    Data.Author := dmCollection.FullName(BookIDList[i].ID);

    dmCollection.FieldByName(BookIDList[i].ID, 'Title', Data.Title);
    dmCollection.FieldByName(BookIDList[i].ID, 'Size', Data.Size);
    dmCollection.FieldByName(BookIDList[i].ID, 'LibID', LibID);
    Data.ID := BookIDList[i].ID;
    Data.State := dsWait;
    Data.FileName := Folder;
    Data.URL := Format(Settings.DownloadURL + 'b/%d/download', [LibID]);
  end;

  lblDownloadCount.Caption := Format('(%d)',[tvDownloadList.ChildCount[Nil]]);

  if Settings.AutoStartDwnld then
    btnStartDownloadClick(Sender);
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

  dmCollection.tblAuthor_List.Locate('BookId', Data.ID, []);
  dmCollection.tblAuthors.Locate('ID', dmCollection.tblAuthor_List['AuthID'], []);
  frmEditAuthor.edFamily.Text := dmCollection.tblAuthors.FieldByName('Family').AsString;
  frmEditAuthor.edName.Text := dmCollection.tblAuthors.FieldByName('Name').AsString;
  frmEditAuthor.edMiddle.Text := dmCollection.tblAuthors.FieldByName('Middle').AsString;
  if frmEditAuthor.ShowModal = mrOk then
  begin
    dmCollection.tblAuthors.Edit;
    dmCollection.tblAuthors.FieldByName('Family').AsString := frmEditAuthor.edFamily.Text;
    dmCollection.tblAuthors.FieldByName('Name').AsString := frmEditAuthor.edName.Text;
    dmCollection.tblAuthors.FieldByName('Middle').AsString := frmEditAuthor.edMiddle.Text;
    dmCollection.tblAuthors.FieldByName('FullName').AsString := frmEditAuthor.edFamily.Text + ' ' +
      frmEditAuthor.edName.Text + ' ' + frmEditAuthor.edMiddle.Text;
    dmCollection.tblAuthors.Post;

    repeat
      { TODO -oNickR -cRefactoring : можно заменить на один UPDATE }
      Res := dmCollection.tblBooks.Locate('FullName', Data.FullName, []);
      if Res then
      begin
        dmCollection.tblBooks.Edit;
        dmCollection.tblBooks['FullName'] := dmCollection.tblAuthors['FullName'];
        dmCollection.tblBooks.Post;
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
      dmCollection.tblBooks.Locate('ID', ID, []);
      ShellExecute(handle, 'open', PChar('http://lib.rus.ec/b/' + IntToStr(dmCollection.tblBooks['LibID']) + '/edit'), nil, nil, SW_SHOW);
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
  if (ActiveView = FavoritesView) or (ActiveView = DownloadView) then
  begin
    MessageDlg('Редактирование книг из избранного или списка закачек невозможно.', mtWarning, [mbOk], 0);
    Exit;
  end;

  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;

  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data.nodeType <> ntBookInfo) then
    Exit;

  if IsLibRusecEdit(Data.Id) then
    Exit;

  GetBookRecord(Data.ID, R);
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
  frmEditBookInfo.edKeyWords.Text := R.KeyWords;
  frmEditBookInfo.cbLang.Text := R.Lang;

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
    R.KeyWords := frmEditBookInfo.edKeyWords.Text;
    R.Lang := frmEditBookInfo.cbLang.Text;

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
    dmCollection.tblSeries.Locate('ID', Data.SeriesID, []);
    dmCollection.tblSeries.Edit;
    dmCollection.tblSeries['Title'] := S;
    dmCollection.tblSeries.Post;
    Data.Series := S;
    Tree.RepaintNode(Node);
  end;
end;

procedure TfrmMain.miAddFavoritesClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  i, ID, Max: integer;
  Data: PBookData;
  GroupData: PGroupData;

  Node: PVirtualNode;
begin
  GetActiveTree(Tree);
  Max := Tree.TotalCount;

  if Max = 0 then Exit;

  if Sender is TMenuItem then
       DMUser.ActivateGroup((Sender as TMenuItem).Tag)
  else
       DMUser.ActivateGroup(1);

  spProgress.Visible := True;
  spStatus.Caption := 'Добавляем в избранное...';
  Screen.Cursor := crHourglass;
  dmCollection.tblBooks.DisableControls;
  DMUser.tblGrouppedBooks.DisableControls;


  Node := Tree.GetFirst;
  i := 0;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    if (Data.nodeType = ntBookInfo) and ((Tree.CheckState[Node] = csCheckedNormal) or (Tree.Selected[Node])) then
      DMUser.InsertToGroupTable(Data.ID, Data.Genre);

    // Tree.CheckState[Node]:=csUnCheckedNormal;
    Inc(i);
    spProgress.Percent := i * 100 div Max;
    spProgress.Repaint;

    Node := Tree.GetNext(Node);
  end;
  spProgress.Visible := False;
  Selection(False);
  dmCollection.tblBooks.EnableControls;
  DMUser.tblGrouppedBooks.EnableControls;
  Screen.Cursor := crDefault;

  // если выделенная группа совпадает с той, куда добавляем книги, нужно перерисовать список
  if (tvGroups.SelectedCount > 0) then
  begin
    GroupData := tvGroups.GetNodeData(tvGroups.FocusedNode);
    if GroupData.ID = DMUser.tblGroupListID.Value then
      FillBooksTree(0, tvBooksF, nil, DMUser.tblGrouppedBooks, True, True); // жанры
  end;


end;

procedure TfrmMain.miAddToSearchClick(Sender: TObject);
var
  Edit: TRzButtonEdit;
  treeView: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PAuthorData;
begin
  case ActiveView of
    ByAuthorView: begin
                    treeView := tvAuthors;
                    Edit := edFFullName;
                  end;
    BySeriesView: begin
                    treeView := tvSeries;
                    Edit := edFSeries;
                  end
  else
    Assert(False);
  end;

  Node := treeView.GetFirstSelected;
  while Node <> nil do
  begin
    Data := treeView.GetNodeData(Node);
    if Edit.Text = '' then
         Edit.Text := Format('="%s"',[Data.Text])
    else
         Edit.Text := Format('%s OR%s="%s"',[Edit.Text,#13#10,Data.Text]);
    Node := treeView.GetNextSelected(Node);
  end;

end;

procedure TfrmMain.miFb2ImportClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);
  dmCollection.DBCollection.Connected := False;

  unit_Import.ImportFB2(DMUser.ActiveCollection);

  InitCollection(True);
end;

procedure TfrmMain.miFb2ZipImportClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);
  dmCollection.DBCollection.Connected := False;

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

    DMUser.SetRate(Data.ID, Data.Rate);

    //
    //  Синхронизация с избранным
    //
    if (DMUser.tblGrouppedBooks.Locate('DataBaseID;OuterID',
                                  VarArrayOf([DMUser.ActiveCollection.ID,Data.ID]),[]))
    then
    begin
      DMUser.tblGrouppedBooks.Edit;
      DMUser.tblGrouppedBooksRate.Value := Data.Rate;
      DMUser.tblGrouppedBooks.Post;
      FillBooksTree(0, tvBooksF, nil, DMUser.tblGrouppedBooks, True, True); // избранное
    end;
  end
  else // активная вкладка - избранное
  begin
    DMUser.tblGrouppedBooks.Locate('DataBaseID;OuterID;',
                                    VarArrayOf([DMUser.ActiveCollection.ID,Data.ID]),[]);
    DMUser.tblGrouppedBooks.Edit;
    DMUser.tblGrouppedBooksRate.Value := Data.Rate;
    DMUser.tblGrouppedBooks.Post;

    //
    //  Синхронизация с таблицей рейтингов
    //

    DMUser.SetRate(DMUser.tblGrouppedBooksOuterID.Value, Data.Rate);

    FillBooksTree(0, tvBooksA, dmCollection.tblAuthor_List, dmCollection.tblBooksA, False, True); // авторы
    FillBooksTree(0, tvBooksS, nil, dmCollection.tblBooksS, False, False); // серии
  end;

  Tree.RepaintNode(Node);
  BookTreeStatus := bsFree;
end;

procedure TfrmMain.btnSavePresetClick(Sender: TObject);
const d='~;~';
var
  SL : TStringList;
  S  : String;
  FN: string;

begin
  if cbPresetName.Text = '' then Exit;

  FN := cbPresetName.Text + '.mhlf';

  if not FileExists(Settings.PresetPath + FN) then
    cbPresetName.Items.Add(cbPresetName.Text);

  SL := TStringList.Create;
  try
    S := '~' + edFFullName.Text + d +
         edFTitle.Text + d +
         edFSeries.Text + d +
         edFFile.Text + d +
         edFFolder.Text + d +
         edFExt.Text + d +
         cbDate.Text + d +
         cbDownloaded.Text + d +
         BoolToStr(cbDeleted.Checked) + d +
         cbLang.Text + d +
         edFKeyWords.Text + '~';

    SL.Add(S);
    SL.SaveToFile(Settings.PresetPath + FN,TEncoding.UTF8);

    btnDeletePreset.Enabled := True;
  finally
    SL.Free;
  end;
end;

procedure TfrmMain.LocateBookList(const text: String; Tree: TVirtualStringTree);
var
  Node: PVirtualNode;
  Data: PAuthorData;
begin
  Tree.ClearSelection;
  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if pos(AnsiUpperCase(text),AnsiUpperCase(Data.Text)) <> 0 then
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
  if S <> FLastLetterA.Caption then
  begin
    OldText := edLocateAuthor.Text;
    ChangeLetterButton(S);
    edLocateAuthor.Text := OldText;
    edLocateAuthor.Perform(WM_KEYDOWN, VK_RIGHT, 0);
  end;
//  if not FDoNotLocate and dmCollection.tblAuthors.Locate('Family', edLocateAuthor.Text, [loPartialKey, loCaseInsensitive]) then
//    LocateBookList(dmCollection.tblAuthorsFamily.Value, tvAuthors);
  if not FDoNotLocate then
    LocateBookList(edLocateAuthor.Text, tvAuthors);
end;

procedure TfrmMain.edLocateAuthorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  if ActiveView = ByAuthorView then
    if Key = VK_UP then
      tvAuthors.Perform(WM_KEYDOWN, VK_UP, 0);
    if Key = VK_DOWN  then
      tvAuthors.Perform(WM_KEYDOWN, VK_DOWN, 0);

  if ActiveView = BySeriesView then
    if Key = VK_UP then
      tvSeries.Perform(WM_KEYDOWN, VK_UP, 0);
    if Key = VK_DOWN  then
      tvSeries.Perform(WM_KEYDOWN, VK_DOWN, 0);
end;

procedure TfrmMain.edFFullNameButtonClick(Sender: TObject);
begin
  frmEditor.Text := (Sender as TrzButtonEdit).Text;
  frmEditor.ShowModal;
  (Sender as TrzButtonEdit).Text := frmEditor.Text;
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
  if S[1] <> FLastLetterS.Caption then
  begin
    OldText := edLocateSeries.Text;
    ChangeLetterButton(S[1]);
    edLocateSeries.Text := OldText;
    edLocateSeries.Perform(WM_KEYDOWN, VK_RIGHT, 0);
  end;
  if not FDoNotLocate and dmCollection.tblSeries.Locate('Title', edLocateSeries.Text, [loPartialKey, loCaseInsensitive]) then
    LocateBookList(dmCollection.tblSeriesTitle.Value, tvSeries);
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

    dmCollection.tblAuthors.DisableControls;
    try
      dmCollection.tblAuthors.First;

      if dmCollection.tblAuthorsFamily.IsNull then
        tvBooksA.Clear;

      while not dmCollection.tblAuthors.Eof do
      begin
        Node := tvAuthors.AddChild(nil);
        NodeData := tvAuthors.GetNodeData(Node);
        NodeData.ID := dmCollection.tblAuthorsID.Value;
        NodeData.Text := trim(dmCollection.tblAuthorsFamily.Value + ' ' +
                              dmCollection.tblAuthorsName.Value +  ' ' +
                              dmCollection.tblAuthorsMiddle.Value);

        dmCollection.tblAuthors.Next;
      end;
    finally
      dmCollection.tblAuthors.EnableControls;
    end;
    ///dmCollection.tblAuthors.First;

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

    dmCollection.tblSeries.DisableControls;
    try
      dmCollection.tblSeries.First;

      if dmCollection.tblSeriesTitle.IsNull then
        tvBooksS.Clear;

      while not dmCollection.tblSeries.Eof do
      begin
        Node := tvSeries.AddChild(nil);
        NodeData := tvSeries.GetNodeData(Node);
        NodeData.ID := dmCollection.tblSeriesID.AsInteger;
        NodeData.Text := dmCollection.tblSeriesTitle.AsString;
        dmCollection.tblSeries.Next;
      end;
    finally
      dmCollection.tblSeries.EnableControls;
    end;
    ///dmCollection.tblSeries.First;
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

      dmCollection.tblGenres.First;
      while not dmCollection.tblGenres.Eof do
      begin
        strParentCode := dmCollection.tblGenresParentCode.Value;

        ParentNode := nil;
        if (strParentCode <> '0') and Nodes.Find(strParentCode, nParentIndex) then
          ParentNode := PVirtualNode(Nodes.Objects[nParentIndex]);

        genreNode := Tree.AddChild(ParentNode);

        genreData := Tree.GetNodeData(genreNode);
        genreData.id := dmCollection.tblGenresID.Value;
        genreData.Text := dmCollection.tblGenresAlias.Value;
        genreData.Code := dmCollection.tblGenresCode.Value;
        genreData.ParentCode := strParentCode;

        Nodes.AddObject(genreData.Code, TObject(genreNode));

        dmCollection.tblGenres.Next;
      end;
    finally
      Tree.EndUpdate;
    end;
  finally
    Nodes.Free;
  end;
end;

procedure TfrmMain.FillGroupsList;
var
  Node : PVirtualNode;
  Data : PGenreData;
begin
  tvGroups.Clear;

  DMUser.tblGroupList.First;
  while not DMUser.tblGroupList.Eof do
  begin
    Node := tvGroups.AddChild(Nil);
    Data := tvGroups.GetNodeData(Node);

    Data.Text := DMUser.tblGroupListName.Value;
    Data.ID := DMUser.tblGroupListID.Value;

    DMUser.tblGroupList.Next;
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

    if Tree.FocusedNode= nil then
      Exit;

    Data := Tree.GetNodeData(Tree.FocusedNode);
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
  Node := Tree.FocusedNode;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data.nodeType <> ntBookInfo) then
    Exit;
  Data.Rate := 0;
  BookTreeStatus := bsBusy;
  if GetActiveView <> FavoritesView then
  begin

    DMUser.DeleteRate(Data.ID);

    if DMUser.tblGrouppedBooks.Locate('DataBaseID;OuterID',
                                  VarArrayOf([DMUser.ActiveCollection.ID,Data.ID]),[]) then
    begin
      DMUser.tblGrouppedBooks.Edit;
      DMUser.tblGrouppedBooksRate.Value := 0;
      DMUser.tblGrouppedBooks.Post;

      FillBooksTree(0, tvBooksF, nil, DMUser.tblGrouppedBooks, True, True); // избранное
    end;
  end
  else if DMUser.tblGrouppedBooks.Locate('ID',Data.ID,[]) then
    begin
      DMUser.tblGrouppedBooks.Edit;
      DMUser.tblGrouppedBooksRate.Value := 0;
      DMUser.tblGrouppedBooks.Post;

      DMUser.DeleteRate(DMUser.tblGrouppedBooksOuterID.Value, DMUser.tblGrouppedBooksDatabaseID.Value);

      FillBooksTree(0, tvBooksA, dmCollection.tblAuthor_List, dmCollection.tblBooksA, False, True); // авторы
      FillBooksTree(0, tvBooksS, nil, dmCollection.tblBooksS, False, False); // серии
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

procedure TfrmMain.pmAuthorPopup(Sender: TObject);
begin
  miAddToSearch.Visible := (ActiveView <>  ByGenreView);
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

  Node := Tree.FocusedNode;
  Assert(Assigned(Node));

  Data := Tree.GetNodeData(Node);

  if not Assigned(Data) then Exit;

  if (Data.nodeType <> ntBookInfo) then
  begin
    if not Tree.HasChildren[Node] then Exit;
    repeat
      Node := Tree.GetFirstChild(Node);
      Data := Tree.GetNodeData(Node);
    until (Data.nodeType = ntBookInfo);
  end;

  Screen.Cursor := crHourGlass;
  try
    if ActiveView = FavoritesView then
    begin
      I := DMUser.tblGrouppedBooksDatabaseID.Value;
      if I <> Settings.ActiveCollection then
      begin
        if DMUser.ActivateCollection(I) then
        begin
          Settings.ActiveCollection := I;
          InitCollection(True);
          CreateCollectionMenu;
        end;
      end;
      DMUser.tblGrouppedBooks.Locate('ID', Data.ID, []);
      FN := DMUser.tblGrouppedBooksFullName.Value;
    end
    else
      FN := dmCollection.FullName(Data.ID);
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
  SavePositions;

  if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
      unit_Utils.SyncOnLineFiles
    else
      unit_Utils.SyncFolders;
  InitCollection(True);

  RestorePositions;
end;

procedure TfrmMain.miUpdateClick(Sender: TObject);
var
  ActiveColIndex:  integer;
begin
  if CheckLibUpdates(False) then
  begin
    SavePositions;

    ActiveColIndex := DMUser.ActiveCollection.ID;
    StartLibUpdate;
    Settings.ActiveCollection := ActiveColIndex;
    DMUser.ActivateCollection(ActiveColIndex);
    InitCollection(True);

    RestorePositions;
  end;
end;

procedure TfrmMain.mi_dwnl_LocateAuthorClick(Sender: TObject);
var
  Data: PDownloadData;
begin
  Data := tvDownloadList.GetNodeData(tvDownloadList.FocusedNode);
  if Data <> nil then
  begin
    pgControl.ActivePageIndex := 0;
    edLocateAuthor.Text := Data.Author;
  end;
end;

procedure TfrmMain.N27Click(Sender: TObject);
begin
  DeleteFile(Settings.WorkPath + 'columns.ini');
  SetColumns;
  SetHeaderPopUp;
end;

procedure TfrmMain.miCompactDataBaseClick(Sender: TObject);
begin
  dmCollection.DBCollection.Close;
  dmCollection.DBCollection.CompactDatabase;
  dmCollection.DBCollection.Open;

  dmUser.SetTableState(True);
  dmCollection.SetTableState(True);
end;

procedure TfrmMain.N33Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.N34Click(Sender: TObject);
begin
  if DirectoryExists(Settings.ReadDir) then ClearDir(Settings.ReadDir);
end;

procedure TfrmMain.miExportUserDataClick(Sender: TObject);
var
  SL: TStringList;
  FN: string;

begin
  SL := TStringList.Create;
  try

    // Группы
    SL.Add('# Группы');
    DMUser.tblGroupList.First;
    while not DMUser.tblGroupList.Eof do
    begin
      SL.Add(Format('%s',[DMUser.tblGroupListName.Value]));
      DMUser.tblGroupList.Next;
    end;

    //  Рейтинги

    SL.Add('# Рейтинги');
    DMUser.tblRates.Filter := 'DataBaseID =' + QuotedStr(IntToStr(DMUser.ActiveCollection.ID));
    DMUser.tblRates.Filtered := True;
    DMUser.tblRates.First;
    while not DMUser.tblRates.Eof do
    begin
      SL.Add(Format('%d %d',[DMUser.tblRatesBookID.Value, DMUser.tblRatesRate.Value]));
      DMUser.tblRates.Next;
    end;
    DMUser.tblRates.Filtered := False;

    //  Прочитанное

    SL.Add('# Прочитанное');
    DMUser.tblFinished.Filter := 'DataBaseID =' + QuotedStr(IntToStr(DMUser.ActiveCollection.ID));
    DMUser.tblFinished.Filtered := True;
    DMUser.tblFinished.First;
    while not DMUser.tblFinished.Eof do
    begin
      SL.Add(Format('%d %d',[DMUser.tblFinishedBookID.Value, DMUser.tblFinishedProgress.Value]));
      DMUser.tblFinished.Next;
    end;
    DMUser.tblFinished.Filtered := False;


    //  избранное

    SL.Add('# Избранное');

    DMUser.tblGroupList.First;
    while not DMUser.tblGroupList.Eof do
    begin
      DMUser.tblGrouppedBooks.Filter := 'DataBaseID =' + QuotedStr(IntToStr(DMUser.ActiveCollection.ID));
      DMUser.tblGrouppedBooks.Filtered := True;
      DMUser.tblGrouppedBooks.First;
      while not DMUser.tblGrouppedBooks.Eof do
      begin
        SL.Add(Format('%d %d',[DMUser.tblGrouppedBooksOuterID.Value, DMUser.tblGroupList.RecNo]));
        DMUser.tblGrouppedBooks.Next;
      end;
      DMUser.tblGroupList.Next;
    end;

    DMUser.tblGrouppedBooks.MasterSource := DMUser.dsGroupList;

    if GetFileName(fnSaveUserData, FN) then
          SL.SaveToFile(FN);

  finally
    SL.Free;
  end;
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
  dmCollection.DBCollection.Connected := False;

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

procedure TfrmMain.miReadedClick(Sender: TObject);
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

  //  заглушка
  if Data.Progress = 100 then
        Data.Progress := 0
    else
        Data.Progress := 100;

  BookTreeStatus := bsBusy;
  if GetActiveView <> FavoritesView then
  begin

    if Data.Progress <> 0 then
          DMUser.SetFinished(Data.ID, Data.Progress)
      else
          DMUser.DeleteFinished(Data.ID);
    //
    //  Синхронизация с избранным
    //
    if (DMUser.tblGrouppedBooks.Locate('DataBaseID;OuterID;',
                                  VarArrayOf([DMUser.ActiveCollection.ID,Data.ID]),[]))
    then
    begin
      DMUser.tblGrouppedBooks.Edit;
      DMUser.tblGrouppedBooksProgress.Value := Data.Progress;
      DMUser.tblGrouppedBooks.Post;
      FillBooksTree(0, tvBooksF, nil, DMUser.tblGrouppedBooks, True, True); // избранное
    end;
  end
  else // активная вкладка - избранное
  begin
    DMUser.tblGrouppedBooks.Locate('DataBaseID;OuterID;',
                                    VarArrayOf([DMUser.ActiveCollection.ID,Data.ID]),[]);
    DMUser.tblGrouppedBooks.Edit;
    DMUser.tblGrouppedBooksProgress.Value := Data.Progress;
    DMUser.tblGrouppedBooks.Post;

    //
    //  Синхронизация с таблицей рейтингов
    //

    if Data.Progress <> 0 then
          DMUser.SetFinished(DMUser.tblGrouppedBooksOuterID.Value, Data.Progress, DMUser.tblGrouppedBooksDatabaseID.Value)
      else
          DMUser.DeleteFinished(DMUser.tblGrouppedBooksOuterID.Value, DMUser.tblGrouppedBooksDatabaseID.Value);

    FillBooksTree(0, tvBooksA, dmCollection.tblAuthor_List, dmCollection.tblBooksA, False, True); // авторы
    FillBooksTree(0, tvBooksS, nil, dmCollection.tblBooksS, False, False); // серии
  end;
  Tree.RepaintNode(Node);
  BookTreeStatus := bsFree;
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
  dmCollection.DBCollection.Connected := False;
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

procedure TfrmMain.miRepairDataBaseClick(Sender: TObject);
begin
  dmCollection.DBCollection.Close;
  dmCollection.DBCollection.RepairDatabase;
  dmCollection.DBCollection.Open;

  dmUser.SetTableState(True);
  dmCollection.SetTableState(True);
end;

procedure TfrmMain.miSettingsClick(Sender: TObject);
var
  frmSettings: TfrmSettings;
begin
  SaveMainFormSettings;

  frmSettings := TfrmSettings.Create(Application);
  try
    frmSettings.LoadSetting;
    frmSettings.ShowModal;

    Settings.SaveSettings;
    FreeSettings;
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
  if ActiveView = DownloadView then Exit;

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
      COL_TYPE :       pmHeaders.Items[8].Checked := True;
      COL_COLLECTION:  pmHeaders.Items[9].Checked := True;
      COL_LANG :       pmHeaders.Items[10].Checked := True;
      COL_LIBRATE:     pmHeaders.Items[11].Checked := True;
    end;
  end;
  pmHeaders.Items[9].Visible := (Tree.Tag = PAGE_FAVORITES);
end;

procedure TfrmMain.pgControlChange(Sender: TObject);
var
  ToolBuutonVisible: boolean;
begin

 // tbtnDownloadList_Add.Enabled := (ActiveView <> FavoritesView);
  ToolBuutonVisible := (ActiveView <> DownloadView);

  btnFav_add.Enabled := ToolBuutonVisible;
  tbSelectAll.Enabled := ToolBuutonVisible;
  tbCollapse.Enabled := ToolBuutonVisible;
  tbtnShowCover.Enabled := ToolBuutonVisible;
  tbtnRead.Enabled := ToolBuutonVisible;
  tbtnRus.Enabled := ToolBuutonVisible;
  tbtnEng.Enabled := ToolBuutonVisible;
  btnRefreshCollection.Enabled := ToolBuutonVisible;
  tbtnShowDeleted.Enabled := ToolBuutonVisible;
  tbtnShowLocalOnly.Enabled := ToolBuutonVisible;

  tbSendToDevice.Enabled := ToolBuutonVisible;
  btnSwitchTreeMode.Enabled :=  not ((ActiveView = BySeriesView) or
                                     (ActiveView = DownloadView));

  case ActiveView  of
    ByAuthorView:begin
                   FLastLetterA.Down := True;
                   if FLastLetterA = FLastLetterS then
                     FLastLetterS.Down := True
                   else
                     FLastLetterS.Down := False;
                 end;
    BySeriesView :begin
                   FLastLetterS.Down := True;
                   if FLastLetterA = FLastLetterS then
                     FLastLetterA.Down := True
                   else
                     FLastLetterA.Down := False;
                 end;
    else begin
                   FLastLetterA.Down := False;
                   FLastLetterS.Down := False;
                 end;
  end;




  case ActiveView of
    FavoritesView:begin
                    miGotoAuthor.Visible := True;
                    miDelFavorites.Visible := True;
                    miAddFavorites.Visible := False;
                    btnFav_add.Hint := 'Удалить из группы';
                    btnFav_add.DropdownMenu := Nil;
                    btnFav_add.Style := ComCtrls.tbsButton;
                    btnFav_add.ImageIndex := 16;
                    pmiGroups.Visible := False;
                  end;
    DownloadView: begin
                    tbtnDownloadList_Add.ImageIndex := 23;
                    tbtnDownloadList_Add.Hint := 'Удалить из списка'+#13+'закачек';
                    btnSwitchTreeMode.Enabled := False;
                    Exit;
                  end;
    else
                 begin
                    miGotoAuthor.Visible := False;
                    miDelFavorites.Visible := False;
                    miAddFavorites.Visible := True;
                    btnFav_add.Hint := 'Добавить в избранное';
                    btnFav_add.DropdownMenu := pmGroups;
                    btnFav_add.Style := ComCtrls.tbsDropDown;
                    btnFav_add.ImageIndex := 15;
                    pmiGroups.Visible := True;
                  end;

  end;

  tbtnDownloadList_Add.ImageIndex := 2;
  tbtnDownloadList_Add.Hint := 'Добавить в список'+#13+'закачек';

  dmCollection.SetActiveTable(ord(ActiveView));


  miGotoAuthor.Visible := (ActiveView <> ByAuthorView);

  SetHeaderPopUp;

  tvBooksTreeChange(Nil,Nil);

  btnSwitchTreeMode.ImageIndex := TreeIcons[ord(Settings.TreeModes[pgControl.ActivePageIndex])];
  btnSwitchTreeMode.Hint := TreeHints[ord(Settings.TreeModes[pgControl.ActivePageIndex])];

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

procedure TfrmMain.OnBookDownloadComplete(var Message: TDownloadCompleteMessage);
var
  Tree: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookData;
  i: TView;
begin
  if Message.Downloaded then
  begin
    for i := ByAuthorView to FavoritesView do
    begin
      Tree := GetViewTree(i);
      Assert(Assigned(Tree));

      Node := GetBookNode(Tree, Message.BookID);
      if Assigned(Node) then
      begin
        Data := Tree.GetNodeData(Node);
        Assert(Assigned(Data));
        if Assigned(Data) then
        begin
          Data^.Locale := True;
          Tree.RepaintNode(Node);
        end;
      end;
    end;
  end;
end;

function TfrmMain.GetBookNode(const Tree: TVirtualStringTree; bookID: Integer): PVirtualNode;
var
  Data: PBookData;
  Node: PVirtualNode;
begin
  Assert(Assigned(Tree));

  Result := nil;

  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if (Data.nodeType = ntBookInfo) and (Data.ID = bookID) then
    begin
      Result := Node;
      Exit;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

procedure TfrmMain.miImportUserDataClick(Sender: TObject);
var
  SL: TStringList;
  FN: string;
   I: integer;
   p: integer;


begin
  if not GetFileName(fnOpenUserData, FN) then Exit;

  try
    SL := TStringList.Create;
    SL.LoadFromFile(FN);
    i:= 0;
    while (i < SL.Count) do
    begin
      if pos('#',SL[i]) <> 0 then
      begin
        if SL[i] = '# Группы' then DMUser.LoadGroups(SL,i)
        else
          if SL[i] = '# Рейтинги' then DMUser.LoadRates(SL,i)
          else
            if SL[i] = '# Прочитанное' then DMUser.LoadFinished(SL,i)
            else
              if SL[i] = '# Избранное' then DMUser.LoadGroupedBooks(SL,i)
              else
                inc(i);
      end;
    end;
    FillGroupsList;
  finally
    SL.Free;
  end;
end;

procedure TfrmMain.miINPXCollectionExportClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);
  unit_Export.Export2INPX;
end;

procedure TfrmMain.btnAddGroupClick(Sender: TObject);
var
  Name : string;
begin
  Name := InputBox('Добавление группы','Название группы','');
  if Name <> '' then
  begin
    DMUser.AddGroup(Name);

    FillGroupsList;
    CreateGroupsMenu;
    FillBooksTree(0,tvBooksF,Nil,DMUser.tblGrouppedBooks,true, true);
  end;
end;

procedure TfrmMain.btnDeleteGroupClick(Sender: TObject);
var
  Data: PGroupData;
begin
  Data := tvGroups.GetNodeData(tvGroups.FocusedNode);
  if Data = Nil then Exit;
  if DMUser.ActivateGroup(Data.ID) and
     DMUser.tblGroupListAllowDelete.Value then
  begin
    btnClearFavoritesClick(Sender);
    DMUser.tblGroupList.Delete;

    FillGroupsList;
    CreateGroupsMenu;
    FillBooksTree(0,tvBooksF,Nil,DMUser.tblGrouppedBooks,true, true);
  end
  else
    ShowMessage('Нельзя удалить встроенную группу!');
end;

procedure TfrmMain.cbPresetNameChange(Sender: TObject);
begin
  btnSavePreset.Enabled  := ( cbPresetName.Text <> '' );
end;

procedure TfrmMain.cbPresetNameSelect(Sender: TObject);
begin
  btnDeletePreset.Enabled := cbPresetName.ItemIndex >= 0;
  btnSavePreset.Enabled := True;
  LoadSearchPreset(cbPresetName.Text);
end;

procedure TfrmMain.btnStartDownloadClick(Sender: TObject);
begin
  if tvDownloadList.GetFirst = nil then Exit;

  btnPauseDownload.Enabled := True;
  btnStartDownload.Enabled := False;

  FDMThread := TDownloadManagerThread.Create(False);
end;

procedure TfrmMain.btnPauseDownloadClick(Sender: TObject);
begin
  btnPauseDownload.Enabled := False;
  btnStartDownload.Enabled := True;
  if Assigned(FDMThread) then FDMThread.Stop;
end;

procedure TfrmMain.BtnSaveClick(Sender: TObject);
begin
  tvDownloadList.SaveToFile(Settings.WorkPath + 'downloads.sav');
end;

procedure TfrmMain.btnDeleteDownloadClick(Sender: TObject);
var
  Data: PDownloadData;
  i: integer;
  List: TSelectionList;
begin
  GetSeelections(tvDownloadList,List);
  for I := 0 to tvDownloadList.SelectedCount - 1 do
  begin
    Data := tvDownloadList.GetNodeData(List[i]);
    if Data.State <> dsRun then
      tvDownloadList.DeleteNode(List[i],True);
  end;
end;

procedure TfrmMain.btnDeletePresetClick(Sender: TObject);
begin
  with cbPresetName do
  begin
    if Text = Items[ItemIndex] then
    begin
      DeleteFile(Settings.PresetPath + Text + '.mhlf');
      Delete(ItemIndex);
      Text := '';
    end;
  end;
  btnDeletePreset.Enabled := cbPresetName.ItemIndex >= 0;
  btnSavePreset.Enabled := cbPresetName.ItemIndex >= 0;
end;

procedure TfrmMain.BtnFav_addClick(Sender: TObject);
begin
 if ActiveView = FavoritesView then
    miDelFavoritesClick(Sender)
  else
    begin
      if DMUser.ActivateGroup(1) then
          miAddFavoritesClick(Sender);
    end;
end;



end.

