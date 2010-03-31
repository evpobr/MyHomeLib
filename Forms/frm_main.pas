(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
  *
  ****************************************************************************** *)

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
  Mask,
  ExtCtrls,
  ToolWin,
  ImgList,
  Clipbrd,
  Menus,
  ABSMain,
  ShellAPI,
  unit_Globals,
  XMLIntf,
  XMLDoc,
  pngimage,
  jpeg,
  DB,
  DBTables,
  unit_CoverPanel,
  unit_InfoPanel,
  ZipForge,
  unit_DownloadManagerThread,
  unit_Messages,
  files_list,
  ActiveX,
  htmlhlp,

  RzCommon,
  RzButton,
  RzStatus,
  RzPrgres,
  RzPanel,
  RzBtnEdt,
  RzCmboBx,
  RzSplit,
  RzLabel,
  RzEdit,
  RzTabs,

  idStack,
  idComponent,
  IdBaseComponent,
  IdHTTP,
  IdAntiFreezeBase,
  IdAntiFreeze;

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
    miSetRate1: TMenuItem;
    miSetRate2: TMenuItem;
    miSetRate3: TMenuItem;
    miSetRate4: TMenuItem;
    miSetRate5: TMenuItem;
    N11: TMenuItem;
    miClearRate: TMenuItem;
    N20: TMenuItem;
    pmiCheckAll: TMenuItem;
    pmiDeselectAll: TMenuItem;
    N23: TMenuItem;
    miCopyClBrd: TMenuItem;
    pmiBookInfo: TMenuItem;
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
    miGoSite: TMenuItem;
    miGoForum: TMenuItem;
    pgControl: TRzPageControl;
    tsSearch: TRzTabSheet;
    tvBooksF: TVirtualStringTree;
    tsByGroup: TRzTabSheet;
    cpCoverF: TMHLCoverPanel;
    ilFileTypes: TImageList;
    tsByAuthor: TRzTabSheet;
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
    tsBySerie: TRzTabSheet;
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
    tsByGenre: TRzTabSheet;
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
    tsDownload: TRzTabSheet;
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
    lblDownloadState: TLabel;
    lblDnldAuthor: TLabel;
    lblDnldTitle: TLabel;
    lblDownloadCount: TRzLabel;
    btnClearDownload: TRzBitBtn;
    tvDownloadList: TVirtualStringTree;
    BtnSave: TRzToolButton;
    RzSpacer3: TRzSpacer;
    N28: TMenuItem;
    N37: TMenuItem;
    miAddToSearch: TMenuItem;
    miINPXCollectionExport: TMenuItem;
    N38: TMenuItem;
    rzsSplitterF: TRzSplitter;
    RzPanel7: TRzPanel;
    tvGroups: TVirtualStringTree;
    RzPanel8: TRzPanel;
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
    edFGenre: TRzButtonEdit;
    Label6: TLabel;
    N31: TMenuItem;
    miDeleteFiles: TMenuItem;
    miFastBookSearch: TMenuItem;
    pmiSelectAll: TMenuItem;
    pbDownloadProgress: TRzProgressBar;
    cpCoverA: TMHLCoverPanel;
    miFBDImport: TMenuItem;
    miConverToFBD: TMenuItem;
    miEditToolbarVisible: TMenuItem;
    tlbrEdit: TToolBar;
    tbtnEditAuthor: TToolButton;
    tbtnEditSeries: TToolButton;
    tbtnEditGenre: TToolButton;
    tbtnEditBook: TToolButton;
    ToolButton14: TToolButton;
    tbtnFBD: TToolButton;
    N43: TMenuItem;
    ToolButton16: TToolButton;
    tbtnDeleteBook: TToolButton;
    tbtnAutoFBD: TToolButton;
    FilesList: TFilesList;
    tbtnHelp: TToolButton;
    N46: TMenuItem;
    miExportToHTML: TMenuItem;
    txt1: TMenuItem;
    RTF1: TMenuItem;
    spExecTime: TRzStatusPane;
    ToolButton5: TToolButton;
    edFAnnotation: TRzButtonEdit;
    Label7: TLabel;

    //
    // События формы
    //
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    //
    //
    //
    procedure tvAuthorsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvBooksAGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvBooksGGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvBooksSGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvBooksFGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvBooksSRGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvGenresGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);

    //
    //
    //
    procedure tvAuthorsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvSeriesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvGenresChange(Sender: TBaseVirtualTree; Node: PVirtualNode);

    //
    //
    //
    procedure tvBooksTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure tvBooksTreeAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellRect: TRect);

    //
    //
    //
    procedure GetBookNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure GetAuthorNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);

    //
    //
    //
    procedure miQuitAppClick(Sender: TObject);
    procedure tbtnStarClick(Sender: TObject);
    procedure tbtbnReadClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure tbtnRusClick(Sender: TObject);
    procedure tbtnEngClick(Sender: TObject);
    procedure tbSelectAllClick(Sender: TObject);
    procedure tbSendToDeviceClick(Sender: TObject);
    procedure pmiCheckAllClick(Sender: TObject);
    procedure pmiDeselectAllClick(Sender: TObject);
    procedure miCopyClBrdClick(Sender: TObject);

    //
    // Работа с группами
    //
    procedure AddGroup(Sender: TObject);
    procedure DeleteGroup(Sender: TObject);
    procedure AddBookToGroup(Sender: TObject);
    procedure DeleteBookFromGroup(Sender: TObject);
    procedure ClearGroup(Sender: TObject);

    procedure SetBookRate(Sender: TObject);
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
    procedure ShowBookInfo(Sender: TObject);
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
    procedure tvBooksTreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
    procedure tvBooksTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure tvBooksTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure tbtnShowLocalOnlyClick(Sender: TObject);
    procedure ShowNewCollectionWizard(Sender: TObject);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure btnApplyFilterClick(Sender: TObject);
    procedure btnClearFilterEditsClick(Sender: TObject);
    procedure tvBooksTreeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvBooksTreeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFFullNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbClearEdAuthorClick(Sender: TObject);
    procedure btnClearEdSeriesClick(Sender: TObject);
    procedure tvBooksTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvBooksTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure HeaderPopupItemClick(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure CoverPanelResize(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure btnStartDownloadClick(Sender: TObject);
    procedure btnPauseDownloadClick(Sender: TObject);
    procedure tvDownloadListGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure btnDeleteDownloadClick(Sender: TObject);
    procedure mi_dwnl_LocateAuthorClick(Sender: TObject);
    procedure btnClearDownloadClick(Sender: TObject);
    procedure tvDownloadListSaveNode(Sender: TBaseVirtualTree; Node: PVirtualNode; Stream: TStream);
    procedure tvDownloadListLoadNode(Sender: TBaseVirtualTree; Node: PVirtualNode; Stream: TStream);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N34Click(Sender: TObject);
    procedure MoveDwnldListNodes(Sender: TObject);
    procedure BtnFav_addClick(Sender: TObject);
    procedure tvDownloadListPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure BtnSaveClick(Sender: TObject);
    procedure edLocateAuthorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSavePresetClick(Sender: TObject);
    procedure edFFullNameButtonClick(Sender: TObject);
    procedure cbPresetNameChange(Sender: TObject);
    procedure cbPresetNameSelect(Sender: TObject);
    procedure FilesListFile(Sender: TObject; const F: TSearchRec);
    procedure btnDeletePresetClick(Sender: TObject);
    procedure miAddToSearchClick(Sender: TObject);
    procedure miINPXCollectionExportClick(Sender: TObject);
    procedure pmAuthorPopup(Sender: TObject);
    procedure tvGroupsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure GetGroupNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure tvGroupsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GroupMenuItemClick(Sender: TObject);
    procedure tvGroupsDragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
    procedure tvGroupsDragDrop(Sender: TBaseVirtualTree; Source: TObject; DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);
    procedure miImportUserDataClick(Sender: TObject);
    procedure miReadedClick(Sender: TObject);
    procedure miExportUserDataClick(Sender: TObject);
    procedure miRepairDataBaseClick(Sender: TObject);
    procedure miCompactDataBaseClick(Sender: TObject);
    procedure edFGenreButtonClick(Sender: TObject);
    procedure edFGenreKeyPress(Sender: TObject; var Key: Char);
    procedure miDeleteFilesClick(Sender: TObject);
    procedure miFastBookSearchClick(Sender: TObject);
    procedure pmiSelectAllClick(Sender: TObject);
    procedure miFBDImportClick(Sender: TObject);
    procedure miConverToFBDClick(Sender: TObject);
    procedure miEditToolbarVisibleClick(Sender: TObject);
    procedure tbtnAutoFBDClick(Sender: TObject);
    procedure miExportToHTMLClick(Sender: TObject);
    procedure tvAuthorsClick(Sender: TObject);
    procedure tvSeriesClick(Sender: TObject);
    procedure tvGenresClick(Sender: TObject);
    procedure tvGroupsClick(Sender: TObject);
    procedure tvAuthorsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvSeriesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvGenresKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvGroupsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FreeBookNodeDate(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FreeAuthorNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FreeSerieNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GetSerieNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure FreeGenreNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FreeGroupNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GetGenreNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure GetDownloadNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure FreeDownloadNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvSeriesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType; var CellText: string);

  protected
    procedure WMGetSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure OnChangeLocalStatus(var Message: TLocalStatusChangedMessage); message WM_MHL_CHANGELOCALSTATUS;

  private type
    TView = (ByAuthorView, BySeriesView, ByGenreView, SearchView, FavoritesView, DownloadView);

    TSortSetting = record
      Column: TColumnIndex;
      Direction: TSortDirection;
    end;

  private
    FDMThread: TDownloadManagerThread;

    FLastActiveBookID: Integer;

    // поиск аторов, серий
    FIgnoreChange: Boolean;

    function IsSelectedBookNode(Node: PVirtualNode; Data: PBookData): Boolean;

    //
    // Построение деревьев
    //
    procedure FillSeriesTree;

    procedure FillBooksTree(
      const Tree: TVirtualStringTree;
      const Master: TDataset;
      const Detail: TDataset;
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
    procedure Selection(SelState: Boolean);
    procedure LocateAuthor(const Text: string);
    procedure LocateSerie(const Text: string);
    procedure InitCollection(ApplyAuthorFilter: Boolean);

    procedure CreateCollectionMenu;
    procedure CreateScriptMenu;
    procedure SetColors;
    procedure CreateAlphabet;

  private type
    TNodeUpdateProc = reference to procedure(Data: PBookData);

  strict private
    //
    // Проверяет возможность редактирования информации (о книге, если задано).
    // В случае если книга из онлайн коллекции предлагает перейти на сайт для изменения информации там
    //
    function IsLibRusecEdit(BookID: Integer): Boolean;

    //
    // Обновить во всех деревьях ноду BookID:DatabaseID (если есть).
    // Обновления не должны менять положение ноды в дереве.
    //
    procedure UpdateNodes(BookID: Integer; DatabaseID: Integer; UpdateProc: TNodeUpdateProc);

    //
    // Обновить статус книги (присутствует локально)
    //
    procedure SetBookLocalStatus(BookID: Integer; DatabaseID: Integer; IsLocal: Boolean);

  public
    procedure FillAuthorTree(Tree: TVirtualStringTree; FullMode: Boolean = False);
    procedure FillGenresTree(Tree: TVirtualStringTree; FillFB2: Boolean = False);

    procedure DisableControls(State: Boolean);

    function HH(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
    procedure LocateBook(Text: string; Next: Boolean);

    procedure SelectNextBook(Changed, Frwrd: Boolean);

    property LastActiveBookID: Integer read FLastActiveBookID;

    procedure SetFormState;

  private
    FSelectionState: Boolean;
    FCollectionRoot: string;

    FAutoCheck: Boolean;
    FFormBusy: Boolean;

    FFileOpMode: (fmFb2Zip, fmFb2);
    FDoNotLocate: Boolean;

    FLastLetterA: TToolButton;
    FLastLetterS: TToolButton;

    ALetter: TToolButton;
    BookTreeStatus: (bsFree, bsBusy);

    FSortSettings: array [0 .. 5] of TSortSetting;

    FStarImage: TPngImage;
    FEmptyStarImage: TPngImage;

    FLastFoundBook: PVirtualNode;
    FFirstFoundBook: PVirtualNode;
    FLastBookRecord: TBookRecord;

    //
    function GetBookNode(const Tree: TVirtualStringTree; BookID: Integer; DatabaseID: Integer): PVirtualNode; overload;

    procedure FillBookIdList(const Tree: TVirtualStringTree; var BookIDList: TBookIdList);
    function GetActiveBookTable(Tag: Integer): TAbsTable;
    procedure ClearLabels(Tag: Integer; Full: Boolean);
    procedure SetAuthorsShowLocalOnly;
    procedure SetSeriesShowLocalOnly;
    procedure SetBooksFilter;
    procedure FillAllBooksTree;
    procedure ChangeLetterButton(const S: string);
    function CheckLibUpdates(Auto: Boolean): Boolean;
    procedure GetActiveViewComponents(var Tree: TVirtualStringTree; var Panel: TMHLInfoPanel; var Cover: TMHLCoverPanel);
    procedure SetCoversVisible(State: Boolean);
    procedure SetColumns;
    procedure SaveColumns;
    function GetTreeTag(const Sender: TBaseVirtualTree; const Column: Integer): Integer;
    function GetText(Tag: Integer; Data: PBookData): string;
    procedure SetHeaderPopUp;
    procedure RestorePositions;
    procedure DownloadBooks;
    function CheckActiveDownloads: Boolean;
    procedure SetLangBarSize;
    procedure TheFirstRun;

    function GetActiveView: TView;
    procedure StartLibUpdate;
    procedure LoadSearchPreset(const fileName: string);
    procedure CreateGroupsMenu;
    procedure SaveMainFormSettings;
    procedure SavePositions;
    procedure PrepareFb2EditData(Data: PBookData; var R: TBookRecord);
    procedure SaveFb2DataAfterEdit(R: TBookRecord);
    function ShowNCWizard: Boolean;
    procedure LoadLastCollection;
    procedure ExtractBookToStream(const BookRecord: TBookRecord; var FS: TMemoryStream);
    property ActiveView: TView read GetActiveView;
  end;

var
  frmMain: TfrmMain;

const
  CHECK_FILE = 'TheFirstRun.check';

implementation

uses
  StrUtils,
  DateUtils,
  IOUtils,
  Math,
  dm_collection,
  dm_user,
  unit_Columns,
  unit_Database,
  frm_statistic,
  frm_splash,
  frm_settings,
  frm_genre_tree,
  frm_edit_book_info,
  frm_edit_author,
  frm_book_info,
  frm_bases,
  frm_add_nonfb2,
  frm_about,
  unit_MHLHelpers,
  unit_TreeUtils,
  unit_MHL_strings,
  unit_Settings,
  unit_Import,
  unit_Consts,
  unit_Export,
  unit_Utils,
  unit_ExportToDevice,
  unit_Helpers,
  frm_NCWizard,
  frm_editor,
  unit_SearchUtils,
  unit_WriteFb2Info,
  frm_ConverToFBD,
  frmEditAuthorEx,
  unit_Lib_Updates;

resourcestring
  rstrFileNotFoundMsg = 'Файл %s не найден!'#13'Проверьте настройки коллекции!';

{$R *.dfm}

//
// Helpers
//

var
  IsPrivate: Boolean;
  IsOnline: Boolean;
  IsLocal: Boolean;
  IsFB2: Boolean;
  IsNonFB2: Boolean;

const
  TreeIcons: array [0 .. 1] of Integer = (10, 11);
  TreeHints: array [0 .. 1] of string = ('Переключится в режим "Таблица"', 'Переключится в режим "Дерево"');

function TfrmMain.CheckActiveDownloads: Boolean;
var
  Data: PDownloadData;
  Node: PVirtualNode;
begin
  Result := False;
  Node := tvDownloadList.GetFirst;
  while Assigned(Node) do
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

procedure TfrmMain.WMGetSysCommand(var message: TMessage);
begin
  if message.Msg = WM_Destroy then
  begin
    ShowMessage('отключаемся');
    inherited;
  end;

  if (message.wParam = SC_MINIMIZE) and Settings.MinimizeToTray then
  begin
    TrayIcon.Visible := True;
    Hide;
  end
  else
    inherited;
end;

procedure TfrmMain.RestorePositions;
var
  APage: Integer;
begin
  APage := Settings.ActivePage;

  pgControl.ActivePageIndex := PAGE_AUTHORS;
  edLocateAuthor.Text := Settings.LastAuthor;
  SelectBookById(tvBooksA, Settings.LastBookInAuthors);

  pgControl.ActivePageIndex := PAGE_SERIES;
  edLocateSeries.Text := Settings.LastSeries;
  SelectBookById(tvBooksS, Settings.LastBookInSeries);

  SelectBookById(tvBooksF, Settings.LastBookInFavorites);

  FIgnoreChange := True;
  edLocateAuthor.Text := '';
  edLocateSeries.Text := '';

  FIgnoreChange := False;

  pgControl.ActivePageIndex := APage;
end;

procedure TfrmMain.SetColumns;
var
  Columns: TColumns;
begin
  Columns := TColumns.Create(Settings.SystemFileName[sfColumnsStore]);
  try

    if Settings.TreeModes[PAGE_AUTHORS] = tmTree then
      Columns.Load(SECTION_A_TREE, tmTree)
    else
      Columns.Load(SECTION_A_FLAT, tmFlat);
    Columns.SetColumns(tvBooksA.Header.Columns);

    if Settings.TreeModes[PAGE_SERIES] = tmTree then
      Columns.Load(SECTION_S_TREE, tmTree)
    else
      Columns.Load(SECTION_S_FLAT, tmFlat);
    Columns.SetColumns(tvBooksS.Header.Columns);

    if Settings.TreeModes[PAGE_GENRES] = tmTree then
      Columns.Load(SECTION_G_TREE, tmTree)
    else
      Columns.Load(SECTION_G_FLAT, tmFlat);
    Columns.SetColumns(tvBooksG.Header.Columns);

    if Settings.TreeModes[PAGE_FAVORITES] = tmTree then
      Columns.Load(SECTION_F_TREE, tmTree)
    else
      Columns.Load(SECTION_F_FLAT, tmFlat);
    Columns.SetColumns(tvBooksF.Header.Columns);

    if Settings.TreeModes[PAGE_SEARCH] = tmTree then
      Columns.Load(SECTION_SR_TREE, tmTree)
    else
      Columns.Load(SECTION_SR_FLAT, tmFlat);
    Columns.SetColumns(tvBooksSR.Header.Columns);

    if Settings.TreeModes[PAGE_FILTER] = tmTree then
      Columns.Load(SECTION_FL_TREE, tmTree)
    else
      Columns.Load(SECTION_FL_FLAT, tmFlat);

    // -------------------------------------------------------------------------
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
  Columns := TColumns.Create(Settings.SystemFileName[sfColumnsStore]);
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
    if Settings.TreeModes[PAGE_GENRES] = tmTree then
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

procedure TfrmMain.ChangeLetterButton(const S: string);
var
  i: Integer;
begin
  for i := 0 to RusBar.ControlCount - 1 do
    if RusBar.Controls[i] is TToolButton then
      if (RusBar.Controls[i] as TToolButton).Caption = S then
      begin
        tbtnStarClick(RusBar.Controls[i] as TToolButton);
        Exit;
      end;

  for i := 0 to EngBar.ControlCount - 1 do
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

  procedure SetCBColor(AControl: TRzComboBox);
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
  SetEditColor(edFGenre);
  SetEditColor(edFFile);
  SetEditColor(edFFolder);
  SetEditColor(edFExt);
  SetEditColor(edFKeyWords);
  SetEditColor(edFAnnotation);

  SetCBColor(cbDownloaded);
  SetCBColor(cbDate);
  SetCBColor(cbLang);

end;

procedure TfrmMain.ReadINIData;
begin
  CreateSettings;
  Settings.LoadSettings;

  SetColors;

  tlbrEdit.Visible := Settings.EditToolbarVisible;
  miEditToolbarVisible.Checked := tlbrEdit.Visible;

  RusBar.Visible := Settings.ShowRusBar;
  EngBar.Visible := Settings.ShowEngBar;

  tbtnShowDeleted.Down := Settings.DoNotShowDeleted;
  tbtnShowLocalOnly.Down := Settings.ShowLocalOnly;

  cbDeleted.Checked := Settings.DoNotShowDeleted;

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
end;

procedure TfrmMain.btnApplyFilterClick(Sender: TObject);
var
  FilterString: string;
  OldFilter: string;
  Filtered: Boolean;
  Time: TTime;
const
  SQLStartStr = 'SELECT distinct b.*';
begin
  Screen.Cursor := crSQLWAit;
  spStatus.Caption := 'Подготовка фильтра ...';
  spStatus.Repaint;
  tvBooksSR.Clear;
  lblTotalBooksFL.Caption := '(0)';
  FilterString := '';
  ClearLabels(tvBooksSR.Tag, True);
  dmCollection.sqlBooks.SQL.Clear;
  try
    try
      OldFilter := dmCollection.tblBooks.Filter;
      Filtered := dmCollection.tblBooks.Filtered;

      // ------------------------ серия -----------------------------------------
      FilterString := '';
      AddToFilter('`S_Title`', PrepareQuery(edFSeries.Text, True), True, FilterString);

      if FilterString <> '' then
        FilterString := SQLStartStr + #13#10 + 'FROM Series s ' + #13#10 + 'JOIN books b on b.SerieID = s.SerieID ' + #13#10 + 'WHERE ' + FilterString + '';

      if FilterString <> '' then
        dmCollection.sqlBooks.SQL.Add(FilterString);

      // ------------------------ аннотация -----------------------------------------
      FilterString := '';
      AddToFilter('`Annotation`', PrepareQuery(edFAnnotation.Text, True), True, FilterString);

      if FilterString <> '' then
        FilterString := SQLStartStr + #13#10 + 'FROM Extra e ' + #13#10 + 'JOIN books b on b.id = e.BookID ' + #13#10 + 'WHERE ' + FilterString + '';

      if (dmCollection.sqlBooks.SQL.Count = 0) and (FilterString <> '') then
        dmCollection.sqlBooks.SQL.Add(FilterString)
      else if FilterString <> '' then
      begin
        dmCollection.sqlBooks.SQL.Add('INTERSECT');
        dmCollection.sqlBooks.SQL.Add(FilterString);
      end;
      // -------------------------- жанр ----------------------------------------
      FilterString := '';
      if (edFGenre.Hint <> '') then
        FilterString := SQLStartStr + #13#10 + 'FROM Genre_List g ' + #13#10 + 'JOIN books b on b.id = g.BookID ' + #13#10 + 'WHERE (' + edFGenre.Hint + ')';

      if (dmCollection.sqlBooks.SQL.Count = 0) and (FilterString <> '') then
        dmCollection.sqlBooks.SQL.Add(FilterString)
      else if FilterString <> '' then
      begin
        dmCollection.sqlBooks.SQL.Add('INTERSECT');
        dmCollection.sqlBooks.SQL.Add(FilterString);
      end;
      FilterString := '';
      // -------------------  все остальное   -----------------------------------
      AddToFilter('`FullName`', PrepareQuery(edFFullName.Text, True), True, FilterString);
      AddToFilter('`Title`', PrepareQuery(edFTitle.Text, True), True, FilterString);
      AddToFilter('`FileName`', PrepareQuery(edFFile.Text, False), False, FilterString);
      AddToFilter('`Folder`', PrepareQuery(edFFolder.Text, False), False, FilterString);
      AddToFilter('`ext`', PrepareQuery(edFExt.Text, False), False, FilterString);
      AddToFilter('`Lang`', PrepareQuery(AnsiUpperCase(cbLang.Text), True, False), True, FilterString);
      AddToFilter('`KeyWords`', PrepareQuery(edFKeyWords.Text, True), True, FilterString);
      //
      if cbDate.ItemIndex = -1 then
        AddToFilter('`Date`', PrepareQuery(cbDate.Text, False), False, FilterString)
      else
        case cbDate.ItemIndex of
          0: AddToFilter('`Date`', Format('> "%s"', [DateToStr(IncDay(Now, -1))]), False, FilterString);
          1: AddToFilter('`Date`', Format('> "%s"', [DateToStr(IncDay(Now, -3))]), False, FilterString);
          2: AddToFilter('`Date`', Format('> "%s"', [DateToStr(IncDay(Now, -7))]), False, FilterString);
          3: AddToFilter('`Date`', Format('> "%s"', [DateToStr(IncDay(Now, -14))]), False, FilterString);
          4: AddToFilter('`Date`', Format('> "%s"', [DateToStr(IncDay(Now, -30))]), False, FilterString);
          5: AddToFilter('`Date`', Format('> "%s"', [DateToStr(IncDay(Now, -90))]), False, FilterString);
        end;

      case cbDownloaded.ItemIndex of
        1:
          if (FilterString = '') then
            FilterString := '(`Local` = True)'
          else
            FilterString := FilterString + ' AND (`Local` = True)';
        2:
          if (FilterString = '') then
            FilterString := '(`Local` = False)'
          else
            FilterString := FilterString + ' AND (`Local` = False)';
      end;

      if True then
        if cbDeleted.Checked then
          if (FilterString = '') then
            FilterString := '(`Deleted` = False)'
          else
            FilterString := FilterString + ' AND (`Deleted`= False)';

      // Ставим фильтр
      spStatus.Caption := 'Применяем фильтр ...';
      spStatus.Repaint;

      if (dmCollection.sqlBooks.SQL.Count > 0) and (FilterString <> '') then
        dmCollection.sqlBooks.SQL.Add('AND' + FilterString)
      else if FilterString <> '' then
        dmCollection.sqlBooks.SQL.Add('SELECT ' + BOOK_ID_FIELD + ',' + SERIE_ID_FIELD + ' FROM Books WHERE ' + FilterString);

      if (dmCollection.sqlBooks.SQL.Count) = 0 then
        raise Exception.Create('Проверьте параметры фильтра');
{$IFDEF DEBUG}
      dmCollection.sqlBooks.SQL.SaveToFile(Settings.AppPath + 'Last.sql');
{$ENDIF}
      Time := Now;

      dmCollection.sqlBooks.Active := False;
      dmCollection.sqlBooks.ExecSQL;
      dmCollection.sqlBooks.Active := True;
      spExecTime.Caption := FloatToStrF(MilliSecondsBetween(Now, Time) / 1000, FFFixed, 3, 2) + ' сек.';

      FillBooksTree(tvBooksSR, nil, dmCollection.sqlBooks, True, True);
    except
      on E: Exception do
        ShowMessage('Синтаксическая ошибка. Проверьте параметры фильтра');
    end;
  finally
    dmCollection.tblBooks.Filtered := False;
    dmCollection.tblBooks.Filter := OldFilter;
    dmCollection.tblBooks.Filtered := Filtered;

    Screen.Cursor := crDefault;
    spStatus.Caption := rstrReadyMessage;
    ClearLabels(PAGE_FILTER, True);
  end;
end;

procedure TfrmMain.btnClearFilterEditsClick(Sender: TObject);
begin
  edFFullName.Text := '';
  edFSeries.Text := '';
  edFTitle.Text := '';
  edFGenre.Text := '';
  edFGenre.Hint := '';
  edFFile.Text := '';
  edFFolder.Text := '';
  edFExt.Text := '';
  edFAnnotation.Text := '';

  cbDate.Text := '';
  cbDate.ItemIndex := -1;

  cbPresetName.Text := '';
  cbDeleted.Checked := False;
  cbLang.Text := '';
  edFKeyWords.Text := '';
  cbDownloaded.ItemIndex := 0;
  tvBooksSR.Clear;
  ClearLabels(PAGE_SEARCH, True);
end;

procedure TfrmMain.LoadSearchPreset(const fileName: string);
var
  SL: TStringList;
  HL: TStringList;
begin
  SL := TStringList.Create;
  try
    HL := TStringList.Create;
    try
      HL.Delimiter := ';';
      HL.QuoteChar := '~';

      SL.LoadFromFile(Settings.PresetPath + fileName + '.mhlf');
      HL.DelimitedText := SL.Text;

      edFFullName.Text := HL[0];
      edFTitle.Text := HL[1];
      edFSeries.Text := HL[2];
      edFGenre.Text := HL[3];
      edFGenre.Hint := HL[4];
      edFAnnotation.Text := HL[5];
      edFFile.Text := HL[6];
      edFFolder.Text := HL[7];
      edFExt.Text := HL[8];
      cbDate.Text := HL[9];
      cbDownloaded.Text := HL[10];
      cbDeleted.Checked := StrToBool(HL[11]);
      cbLang.Text := HL[12];
      edFKeyWords.Text := HL[13];
    finally
      HL.Free;
    end;
  finally
    SL.Free;
  end;
end;

function TfrmMain.GetActiveView: TView;
const
  //
  // ВНИМАНИЕ!!! Порядок и количество элементов массива views должно совпадать с порядком и количеством закладок
  //
  views: array [0 .. 5] of TView = (ByAuthorView, BySeriesView, ByGenreView, SearchView, FavoritesView, DownloadView);

begin
  Result := views[pgControl.ActivePageIndex];
end;

procedure TfrmMain.DisableControls(State: Boolean);
begin
  frmMain.Enabled := State;
end;

procedure TfrmMain.InitCollection(ApplyAuthorFilter: Boolean);
var
  CollectionType: Integer;
begin
  FDoNotLocate := True;
  Screen.Cursor := crHourGlass;

  ClearLabels(PAGE_ALL, True);
  dmCollection.SetTableState(False);
  tvGenres.Clear;
  tvBooksG.Clear;
  tvBooksSR.Clear;

  dmCollection.DBCollection.Connected := False;

  edLocateAuthor.Text := '';
  edLocateSeries.Text := '';

  if DMUser.tblBases.IsEmpty then
  begin
    frmMain.Caption := 'MyHomeLib';
    tvAuthors.Clear;
    tvSeries.Clear;
    tvBooksA.Clear;
    tvBooksS.Clear;
    tvBooksG.Clear;
    tvBooksF.Clear;
    Screen.Cursor := crDefault;

    if not ShowNCWizard then
      Application.Terminate;

    DeleteFile(Settings.WorkPath + CHECK_FILE);
    Exit;
  end;

  DMUser.ActivateCollection(Settings.ActiveCollection);

  dmCollection.DBCollection.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
  dmCollection.DBCollection.Connected := True;
  frmMain.Caption := 'MyHomeLib - ' + DMUser.ActiveCollection.Name;

  { TODO -oNickR -cRefactoring : проверить использование }
  FCollectionRoot := DMUser.ActiveCollection.RootPath;

  // определяем типы коллекции
  CollectionType := DMUser.ActiveCollection.CollectionType;
  IsPrivate := isPrivateCollection(CollectionType);
  IsOnline := isOnlineCollection(CollectionType);
  IsLocal := isLocalCollection(CollectionType);
  IsFB2 := isFB2Collection(CollectionType);
  IsNonFB2 := isNonFB2Collection(CollectionType);

  // ----------------------------------------------------------------------------
  // высталяем видимость пунктов меню в завичимости от типа коллекции
  // ----------------------------------------------------------------------------

  // ------    Главное меню   ---------------------------------------------------

  // Книга

  miFb2ZipImport.Visible := (IsPrivate and IsFB2) or (IsPrivate and IsNonFB2 and Settings.AllowMixed);
  miFb2Import.Visible := (IsPrivate and IsFB2) or (IsPrivate and IsNonFB2 and Settings.AllowMixed);
  miPdfdjvu.Visible := IsPrivate and IsNonFB2;
  miFBDImport.Visible := IsPrivate and IsNonFB2;
  miConverToFBD.Visible := False;

  miImport.Visible := IsPrivate;
  miEditAuthor.Visible := IsPrivate;
  miEditGenres.Visible := IsPrivate;
  miEditSeries.Visible := IsPrivate;
  miBookEdit.Visible := IsPrivate;
  miConverToFBD.Visible := IsPrivate and not IsFB2;
  miDeleteBook.Visible := IsPrivate; // DMUser.ActiveCollection.AllowDelete;
  miDeleteFiles.Visible := IsOnline and (ActiveView <> FavoritesView);

  miDownloadBooks.Visible := IsOnline;

  // Коллекция

  // Инструменты

  miSyncOnline.Visible := IsOnline or IsNonFB2;

  // -------- Контекстное меню --------------------------------------------------

  // pmiBookInfo.Visible := IsFB2;
  pmiDownloadBooks.Visible := IsOnline;

  // --------- Панели онструментов ----------------------------------------------
  tbtnShowLocalOnly.Visible := IsOnline;
  tbtnDownloadList_Add.Visible := IsOnline;
  tbtnShowDeleted.Visible := not IsPrivate;

  tbtnFBD.Visible := IsPrivate and not IsFB2;
  tbtnAutoFBD.Visible := IsPrivate and not IsFB2;

  tbtnDeleteBook.Visible := IsPrivate;
  tbtnEditSeries.Visible := IsPrivate;
  tbtnEditGenre.Visible := IsPrivate;
  tbtnEditAuthor.Visible := IsPrivate;

  edFAnnotation.Enabled := IsPrivate;

  // --------- Вкладки, прочее  -------------------------------------------------

  tsDownload.TabVisible := IsOnline;

  // ----------------------------------------------------------------------------

  dmCollection.SetTableState(True);

  if Assigned(FLastLetterA) then
    FLastLetterA.Down := False;

  dmCollection.Authors.Filtered := False;
  if ApplyAuthorFilter then
    if dmCollection.Authors.RecordCount > 500 then
    begin
      dmCollection.Authors.Filter := 'LastName="А*"';
      dmCollection.Authors.Filtered := True;
      ALetter.Down := True;
      FLastLetterA := ALetter;
      edLocateAuthor.Text := 'А';
    end
    else
    begin
      dmCollection.Authors.Filtered := False;
      tbtnStar.Down := True;
      FLastLetterA := tbtnStar;
      edLocateAuthor.Text := '';
    end;

  // SetCoversVisible((not IsNonFB2 and Settings.ShowInfoPanel)
  // or (Settings.AllowMixed and Settings.ShowInfoPanel));

  if IsNonFB2 and not IsPrivate then
    SetCoversVisible(False)
  else
    SetCoversVisible(Settings.ShowInfoPanel);

  SetAuthorsShowLocalOnly;
  SetSeriesShowLocalOnly;
  SetBooksFilter;

  FillAuthorTree(tvAuthors);
  FillSeriesTree;
  FillGenresTree(tvGenres);

  FillAllBooksTree;

  CreateCollectionMenu;
  CreateScriptMenu;

  Screen.Cursor := crDefault;
  FDoNotLocate := False;
  FIgnoreChange := False;

  if not IsOnline and (ActiveView = DownloadView) then
    pgControl.ActivePageIndex := PAGE_AUTHORS;
end;

procedure TfrmMain.CreateAlphabet;
const
  E: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  R: string = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЭЮЯ';
var
  i: Integer;
  B: TToolButton;
begin
  for i := 1 to Length(E) do
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

  for i := 1 to Length(R) do
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
  SubItem: TMenuItem;
  ActiveCollectionID: Integer;

  function GetCollectionTypeImageIndex: Integer;
  begin
    case DMUser.CurrentCollection.CollectionType of
      CT_PRIVATE_FB: Result := 18;
      CT_PRIVATE_NONFB: Result := 8;
      CT_LIBRUSEC_LOCAL_FB: Result := 14;
      CT_LIBRUSEC_ONLINE_FB: Result := 4;
      CT_GENESIS_LOCAL_NONFB: Result := 8; { TODO -oNickR -cUsability : нарисовать иконку }
      CT_GENESIS_ONLINE_NONFB: Result := 8; { TODO -oNickR -cUsability : нарисовать иконку }
      CT_LIBRUSEC_USR: Result := 8;
    else
      // Assert(False);
      Result := 8; { TODO -oNickR -cUsability : нарисовать иконку }
    end;
  end;

begin
  ActiveCollectionID := DMUser.ActiveCollection.ID;

  miCollSelect.Clear;
  miCopyToCollection.Clear;
  pmCollection.Items.Clear;

  DMUser.tblBases.First;
  while not DMUser.tblBases.Eof do
  begin
    if ActiveCollectionID <> DMUser.CurrentCollection.ID then
    begin
      // ----------------------------
      SubItem := TMenuItem.Create(miCollSelect);
      SubItem.Caption := DMUser.CurrentCollection.Name;
      SubItem.Tag := DMUser.CurrentCollection.ID;
      SubItem.OnClick := miActiveCollectionClick;
      SubItem.ImageIndex := GetCollectionTypeImageIndex;
      miCollSelect.Add(SubItem);

      // ----------------------------
      SubItem := TMenuItem.Create(pmCollection);
      SubItem.Caption := DMUser.CurrentCollection.Name;
      SubItem.Tag := DMUser.CurrentCollection.ID;
      SubItem.OnClick := miActiveCollectionClick;
      SubItem.ImageIndex := GetCollectionTypeImageIndex;
      pmCollection.Items.Add(SubItem);

      // ----------------------------------
      if
        isPrivateCollection(DMUser.CurrentCollection.CollectionType) and
        isFB2Collection(DMUser.CurrentCollection.CollectionType) and
        IsFB2
      then
      begin
        SubItem := TMenuItem.Create(miCopyToCollection);
        SubItem.Caption := DMUser.CurrentCollection.Name;
        SubItem.Tag := DMUser.CurrentCollection.ID;
        SubItem.OnClick := CopyToCollectionClick;
        SubItem.ImageIndex := GetCollectionTypeImageIndex;

        miCopyToCollection.Add(SubItem);
      end;
    end;
    DMUser.tblBases.Next;
  end;

  miCopyToCollection.Enabled := (miCopyToCollection.Count > 0);
  miCollSelect.Enabled := (miCollSelect.Count > 0);
end;

procedure TfrmMain.CreateGroupsMenu;
var
  Item, ItemP: TMenuItem;
  i: Integer;
begin
  pmGroups.Items.Clear;
  pmiGroups.Clear;

  i := 0;
  DMUser.Groups.First;
  DMUser.Groups.Next; // пропускаем "Избранное"
  while not DMUser.Groups.Eof do
  begin
    // меню для кнопки
    Item := TMenuItem.Create(pmGroups);
    Item.Caption := DMUser.GroupsName.Value;
    Item.Tag := DMUser.GroupsGroupID.Value;
    Item.OnClick := GroupMenuItemClick;
    pmGroups.Items.Insert(i, Item);

    // подменю для контекстного
    ItemP := TMenuItem.Create(pmMain);
    ItemP.Caption := DMUser.GroupsName.Value;
    ItemP.Tag := DMUser.GroupsGroupID.Value;
    ItemP.OnClick := GroupMenuItemClick;
    pmiGroups.Insert(i, ItemP);

    Inc(i);
    DMUser.Groups.Next;
  end;
end;

procedure TfrmMain.CreateScriptMenu;
const
  ExpTypes: array [0 .. 5] of string = ('  fb2', '  fb2.zip', '  LRF', '  txt', ' epub', '  pdf');
  Icons: array [0 .. 5] of Integer = (18, 19, 20, 21, 24, 25);
var
  Item, ItemP, ItemM: TMenuItem;
  F: Integer;
  i: Integer;
begin
  pmScripts.Items.Clear;
  pmiScripts.Clear;
  mmiScripts.Clear;

  if isFB2Collection(DMUser.ActiveCollection.CollectionType) then
  begin
    for i := 0 to 5 do
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
      pmScripts.Items.Insert(6, Item);
    end;

    tbSendToDevice.ImageIndex := Icons[ord(Settings.ExportMode)];
    // pmScripts.Items[i].Caption := '>> ' + ExpTypes[i] + ' <<';
    F := 7;
  end
  else
  begin
    F := 0;
    tbSendToDevice.ImageIndex := 1;
  end;

  { TODO 1 -oNickR -cRefactoring :заменить этот код на создание TFileRun }
  for i := 0 to Settings.Scripts.Count - 1 do
  begin
    // ----  dropdown ----------------
    Item := TMenuItem.Create(pmScripts);
    Item.Caption := Settings.Scripts[i].Title;
    Item.Tag := 901 + i;
    Item.OnClick := tbSendToDeviceClick;
    Item.ImageIndex := 6;
    pmScripts.Items.Insert(i + F, Item);

    // ------ context -----------------
    ItemP := TMenuItem.Create(pmMain);
    ItemP.Caption := Settings.Scripts[i].Title;
    ItemP.Tag := 901 + i;
    ItemP.OnClick := tbSendToDeviceClick;
    pmiScripts.Insert(i, ItemP);

    // ------ main -----------------
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

function TfrmMain.ShowNCWizard: Boolean;
var
  frmNCWizard: TfrmNCWizard;
begin
  frmNCWizard := TfrmNCWizard.Create(Application);
  try
    if frmNCWizard.ShowModal = mrOk then
    begin
      Settings.ActiveCollection := DMUser.CurrentCollection.ID;
      InitCollection(True);
      Result := True;
    end
    else
      Result := False;
  finally
    frmNCWizard.Free;
  end;
end;

procedure TfrmMain.ShowNewCollectionWizard(Sender: TObject);
begin
  ShowNCWizard;
end;

procedure TfrmMain.SetFormState;
begin
  frmMain.WindowState := TWindowState(Settings.WindowState);
  if frmMain.WindowState = wsNormal then
  begin
    frmMain.Top := Settings.FormTop;
    frmMain.Left := Settings.FormLeft;
    frmMain.Width := Settings.FormWidth;
    frmMain.Height := Settings.FormHeight;
  end;

  // костыль
  frmMain.Visible := True;
  if frmMain.WindowState = wsMinimized then
    frmMain.WindowState := wsNormal;
  // конец костыля
end;

procedure TfrmMain.btnSwitchTreeModeClick(Sender: TObject);
var
  Page: Integer;
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
    0: FillBooksTree(tvBooksA, dmCollection.AuthorBooks, dmCollection.BooksByAuthor, False, True); // авторы
    1: FillBooksTree(tvBooksS, nil, dmCollection.BooksBySerie, False, False); // серии
    2: FillBooksTree(tvBooksG, dmCollection.GenreBooks, dmCollection.BooksByGenre, True, True); // жанры
    3: FillBooksTree(tvBooksSR, nil, dmCollection.sqlBooks, True, True);
    4: FillBooksTree(tvBooksF, DMUser.GroupBooks, DMUser.BooksByGroup, True, True); // избранное
    5: btnApplyFilterClick(self);
  end;

  SetHeaderPopUp;
end;

procedure TfrmMain.ClearLabels(Tag: Integer; Full: Boolean);
begin
  case Tag of
    PAGE_AUTHORS:
      begin
        ipnlAuthors.Clear;
        cpCoverA.Clear;
        if Full then
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
        ipnlFavorites.Clear;
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
        ClearLabels(PAGE_AUTHORS, True);
        ClearLabels(PAGE_SERIES, True);
        ClearLabels(PAGE_GENRES, True);
        ClearLabels(PAGE_FAVORITES, True);
        ClearLabels(PAGE_FILTER, True);
        ClearLabels(PAGE_SEARCH, True);
      end;
  end;
end;

procedure TfrmMain.SetAuthorsShowLocalOnly;
var
  SaveCursor: TCursor;
begin
  SaveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    dmCollection.Authors.Close;
    if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
    begin
      if Settings.ShowLocalOnly then
        dmCollection.Authors.ParamByName('All').AsInteger := 1
      else
        dmCollection.Authors.ParamByName('All').AsInteger := 0;
    end
    else
    begin
      dmCollection.Authors.ParamByName('All').AsInteger := 0;
    end;
    dmCollection.Authors.Open;
  finally
    Screen.Cursor := SaveCursor;
  end;
end;

procedure TfrmMain.SetSeriesShowLocalOnly;
var
  SaveCursor: TCursor;
begin
  SaveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    dmCollection.Series.Close;
    if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
    begin
      if Settings.ShowLocalOnly then
        dmCollection.Series.ParamByName('All').AsInteger := 1
      else
        dmCollection.Series.ParamByName('All').AsInteger := 0;
    end
    else
    begin
      dmCollection.Series.ParamByName('All').AsInteger := 0;
    end;
    dmCollection.Series.Open;
  finally
    Screen.Cursor := SaveCursor;
  end;
end;

procedure TfrmMain.SetBooksFilter;
const
  flLocal = '`Local` = True';
  flNotShowDeleted = '`Deleted` <> True';

  procedure SwitchFilter(const Filter: string);
  var
    State: Boolean;
  begin
    State := (Filter <> '');

    dmCollection.BooksByAuthor.Filter := Filter;
    dmCollection.BooksByGenre.Filter := Filter;
    dmCollection.BooksBySerie.Filter := Filter;
    DMUser.BooksByGroup.Filter := Filter;

    dmCollection.BooksByAuthor.Filtered := State;
    dmCollection.BooksByGenre.Filtered := State;
    dmCollection.BooksBySerie.Filtered := State;
    DMUser.BooksByGroup.Filtered := State;
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
      SwitchFilter('');
  end
  else if Settings.DoNotShowDeleted then
    SwitchFilter(flNotShowDeleted)
  else
    SwitchFilter('');
end;

procedure TfrmMain.FilesListFile(Sender: TObject; const F: TSearchRec);
var
  S: string;
begin
  if ExtractFileExt(F.name) = '.mhlf' then
  begin
    S := ExtractFileName(F.name);
    Delete(S, Length(S) - 4, 5);
    cbPresetName.Items.Add(S);
  end;
end;

procedure TfrmMain.FillAllBooksTree;
begin
  FillBooksTree(tvBooksA, dmCollection.AuthorBooks, dmCollection.BooksByAuthor, False, True); // авторы
  FillBooksTree(tvBooksS, nil, dmCollection.BooksBySerie, False, False); // серии
  FillBooksTree(tvBooksG, dmCollection.GenreBooks, dmCollection.BooksByGenre, True, True); // жанры
  FillBooksTree(tvBooksF, DMUser.GroupBooks, DMUser.BooksByGroup, True, True); // избранное

  // if DMCollection.sqlBooks.Active then
  // FillBooksTree(0, tvBooksSR, nil, dmCollection.sqlBooks, True, True);
end;

function TfrmMain.CheckLibUpdates(Auto: Boolean): Boolean;
var
  i: Integer;
  UpdatesInfo: TUpdateInfoList;
begin
  if not Auto then
    ShowPopup('Проверка обновлений ...');

  Result := False;

  UpdatesInfo := Settings.Updates;

  UpdatesInfo.UpdateExternalVersions;

  DMUser.FindFirstCollection;
  repeat
    for i := 0 to UpdatesInfo.Count - 1 do
      if UpdatesInfo[i].CheckCodes(DMUser.CurrentCollection.Name, DMUser.CurrentCollection.CollectionType, DMUser.CurrentCollection.ID) then
        if UpdatesInfo[i].CheckVersion(Settings.UpdatePath, DMUser.CurrentCollection.Version) then
        begin
          Result := True;
          Break;
        end;
  until not DMUser.FindNextCollection;

  if not Auto then
  begin
    HidePopup;
    if not Result then
      ShowMessage('Нет доступных обновлений');
  end;
end;

procedure TfrmMain.SetLangBarSize;
begin
  // исправляем косяк с алфавитными панелями
  rpLang.Visible := RusBar.Visible or EngBar.Visible;
  if (RusBar.Visible and not EngBar.Visible) or (not RusBar.Visible and EngBar.Visible) then
    rpLang.Height := RusBar.Height + 5
  else
    rpLang.Height := 2 * RusBar.Height + 10;
end;

procedure TfrmMain.TheFirstRun;
begin
  if DMUser.tblBases.IsEmpty then
    DeleteFile(Settings.WorkPath + CHECK_FILE)
  else if FileExists(Settings.WorkPath + CHECK_FILE) and (Application.MessageBox('Вы успешно обновили программу. Для нормальной работы необходимо' + #13 + 'обновить струткуру таблиц БД. Сделать это прямо сейчас?', 'MyHomeLib - первый запуск', mb_YesNo) = mrYes) then
  begin
    RenameFile(Settings.SystemFileName[sfLibRusEcinpx], Settings.SystemFileName[sfLibRusEcUpdate]);
    DeleteFile(Settings.WorkPath + CHECK_FILE);
    if unit_Utils.LibrusecUpdate then
      InitCollection(True);
  end;
end;

procedure TfrmMain.tbtnAutoFBDClick(Sender: TObject);
begin
  if (ActiveView = FavoritesView) or (ActiveView = DownloadView) then
  begin
    MessageDlg('Для конвертации книги перейдите ' + #13 + 'в соответствующую коллекцию', mtWarning, [mbOk], 0);
    Exit;
  end;

  DisableControls(False);
  try
    frmConvertToFBD.AutoMode;
  finally
    DisableControls(True);
    ///Show;
  end;
end;

//
// События формы
//

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if CheckActiveDownloads then
    if MessageDlg('В списке есть незавершенные закачки!' + #13 + 'Вы все еще хотите выйти из программы?', mtWarning, mbYesNo, 0) = mrYes then
    begin
      if Assigned(FDMThread) then
        FDMThread.TerminateNow;
    end
    else
      CanClose := False;
end;

procedure TfrmMain.StartLibUpdate;
begin
  if unit_Utils.LibrusecUpdate then
    InitCollection(True);
end;

procedure TfrmMain.LoadLastCollection;
begin
  if not DMUser.tblBases.IsEmpty then
  begin
    DMUser.ActivateCollection(Settings.ActiveCollection);
    if not FileExists(DMUser.ActiveCollection.DBFileName) then
    begin
      MessageDlg('Файл коллекции "' + DMUser.ActiveCollection.DBFileName + '" не найден.' + #13 + 'Невозможно запустить программу.', mtError, [mbOk], 0);
      Application.Terminate;
    end;

    frmSplash.lblState.Caption := main_loading_collection;
  end;
  InitCollection(False);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Application.OnHelp := HH;
  UseLatestCommonDialogs := True;

  //
  // событие OnGetNodeDataSize почему-то не обрабатывается, инициализируем вручную
  //
  tvBooksA.NodeDataSize := SizeOf(TBookData);
  tvBooksS.NodeDataSize := SizeOf(TBookData);
  tvBooksG.NodeDataSize := SizeOf(TBookData);
  tvBooksSR.NodeDataSize := SizeOf(TBookData);
  tvBooksF.NodeDataSize := SizeOf(TBookData);
  tvDownloadList.NodeDataSize := SizeOf(TDownloadData);

  // -----------------------------

  FSelectionState := False;
  FAutoCheck := False;
  FFormBusy := False;

  FFileOpMode := fmFb2Zip;

  FLastLetterA := tbtnStar;
  FLastLetterS := tbtnStar;

  CreateAlphabet;

  ReadINIData;

  TDirectory.CreateDirectory(Settings.TempDir);
  TDirectory.CreateDirectory(Settings.DataDir);
  TDirectory.CreateDirectory(Settings.PresetDir);

  SetColumns;
  SetHeaderPopUp;

  // ------------------------ чистка папки дата если нужно ----------------------
  if (ParamCount > 0) and (ParamStr(1) = '/clear') then
    ClearDir(Settings.DataDir);

  frmSplash.lblState.Caption := main_connecttodb;

  DMUser.DBUser.DatabaseFileName := Settings.SystemFileName[sfSystemDB];
  if not FileExists(DMUser.DBUser.DatabaseFileName) then
    TMHLLibrary.CreateSystemTables(DMUser.DBUser.DatabaseFileName);

  DMUser.DBUser.Connected := True;
  DMUser.SetTableState(True);

  // ------------------------------------------------------------------------------
  // Проверка обновлений
  // ------------------------------------------------------------------------------

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
      else if MessageDlg('Доступно обновление для коллекций "lib.rus.ec".' + #13 + ' Начать обновление ?', mtInformation, mbYesNo, 0) = mrYes then
        StartLibUpdate;

  // ------------------------------------------------------------------------------

  LoadLastCollection;
  dmCollection.SetActiveTable(pgControl.ActivePageIndex);

  FillGroupsList;
  CreateGroupsMenu;

  TheFirstRun;

  // ------------------------------------------------------------------------------

  SetLangBarSize;
  frmSplash.lblState.Caption := 'Старт ...';

  //
  // Create & Load "star" images from resources
  //
  FStarImage := CreateImageFromResource(TPngImage, 'smallStar') as TPngImage;
  FEmptyStarImage := CreateImageFromResource(TPngImage, 'smallStarEmpty') as TPngImage;

  // загрузка списка пресетов для поиска
  FilesList.TargetPath := Settings.PresetPath;
  FilesList.Process;

  if not DMUser.tblBases.IsEmpty then
    RestorePositions;

  // загрузка списка закачек
  if FileExists(Settings.SystemFileName[sfDownloadsStore]) then
  begin
    tvDownloadList.LoadFromFile(Settings.SystemFileName[sfDownloadsStore]);
    lblDownloadCount.Caption := Format('(%d)', [tvDownloadList.ChildCount[nil]]);
  end;

  if Settings.AutoStartDwnld then
    btnStartDownloadClick(Sender);

  SetFormState;
end;

procedure TfrmMain.SavePositions;
begin
  Settings.LastAuthor := lblAuthor.Caption;
  Settings.LastSeries := lblSeries.Caption;
  Settings.LastBookInAuthors := GetSelectedBookData(tvBooksA).BookID;
  Settings.LastBookInSeries := GetSelectedBookData(tvBooksS).BookID;
  Settings.LastBookInFavorites := GetSelectedBookData(tvBooksF).BookID;
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

  Settings.WindowState := Ord(Self.WindowState);
  if WindowState = wsNormal then
  begin
    Settings.FormWidth := Width;
    Settings.FormHeight := Height;

    Settings.FormTop := Top;
    Settings.FormLeft := Left;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FStarImage);
  FreeAndNil(FEmptyStarImage);

  tvDownloadList.SaveToFile(Settings.SystemFileName[sfDownloadsStore]);

  if DirectoryExists(Settings.TempDir) then
    ClearDir(Settings.TempDir);

  SaveMainFormSettings;

  Settings.SaveSettings;
  FreeSettings;
end;

//
// Список книг
//
function TfrmMain.GetText(Tag: Integer; Data: PBookData): string;
begin
  Assert(Assigned(Data));
  case Tag of
    COL_AUTHOR:
      Result := Data^.GetAuthors;
    COL_TITLE:
      Result := Data^.Title;
    COL_SERIES:
      Result := Data^.Serie;
    COL_NO:
      Result := IfThen(Data^.SeqNumber = 0, '', IntToStr(Data^.SeqNumber));
    COL_SIZE:
      Result := GetFormattedSize(Data^.Size);
    COL_DATE:
      Result := DateToStr(Data^.Date);
    COL_GENRE:
      Result := Data^.GetGenres;
    COL_TYPE:
      Result := Data^.FileType;
    COL_LANG:
      Result := Data^.Lang;
    // COL_LIBRATE   : Result := IntToStr(Data^.LibRate);
    COL_COLLECTION:
      Result := Data^.CollectionName;
  end;
end;

procedure TfrmMain.tvAuthorsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PAuthorData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := Data^.GetFullName;
end;

procedure TfrmMain.tvAuthorsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    tvAuthorsClick(Sender);
    frmMain.ActiveControl := tvBooksA;
  end;
end;

procedure TfrmMain.tvBooksAGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PBookData;
begin
  Data := Sender.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;

  CellText := ' ';
  if Settings.TreeModes[PAGE_AUTHORS] = tmTree then
  begin
    if Node.ChildCount > 0 then
      case GetTreeTag(Sender, Column) of
        COL_TITLE:
          CellText := Data^.Serie;
      end
    else
      CellText := GetText(GetTreeTag(Sender, Column), Data);
  end
  else
    CellText := GetText(GetTreeTag(Sender, Column), Data);
end;

procedure TfrmMain.tvBooksTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.CheckType := ctTriStateCheckBox;
  Sender.CheckState[Node] := csUncheckedNormal;
end;

procedure TfrmMain.tvBooksTreeHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
var
  Tree: TVirtualStringTree;
begin
  if (HitInfo.Button = mbLeft) then
  begin
    GetActiveTree(Tree);
    if (Settings.TreeModes[Tree.Tag] = tmTree) or (HitInfo.Column < 0) then
      Exit;

    //
    // Меняем индекс сортирующей колонки на индекс колонки, которая была нажата.
    //
    Tree.Header.SortColumn := HitInfo.Column;

    //
    // Сортируем всё дерево относительно этой колонки и изменяем порядок сортировки на противополжный
    //
    if Tree.Header.SortDirection = sdAscending then
      Tree.Header.SortDirection := sdDescending
    else
      Tree.Header.SortDirection := sdAscending;
    Tree.SortTree(HitInfo.Column, Tree.Header.SortDirection);

    // запоминаем параметры для активного дерева
    FSortSettings[Tree.Tag].Column := HitInfo.Column;
    FSortSettings[Tree.Tag].Direction := Tree.Header.SortDirection;
  end;
end;

procedure TfrmMain.tvBooksGGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PBookData;
  Tag: Integer;
begin
  Data := Sender.GetNodeData(Node);
  CellText := ' ';
  Tag := GetTreeTag(Sender, Column);
  if Settings.TreeModes[PAGE_GENRES] = tmTree then
    case Data^.nodeType of
      ntAuthorInfo:
        if Tag = COL_TITLE then
          CellText := Data^.GetAuthors;
      ntSeriesInfo:
        if Tag = COL_TITLE then
          CellText := 'Серия: ' + Data^.Serie;
      ntBookInfo:
        case Tag of
          COL_TITLE:
            CellText := Data^.Title;
          COL_NO:
            if Data^.SeqNumber <> 0 then
              CellText := IntToStr(Data^.SeqNumber);
          COL_SIZE:
            CellText := GetFormattedSize(Data^.Size);
          COL_GENRE:
            CellText := Data^.GetGenres;
        end;
    end
  else
    CellText := GetText(GetTreeTag(Sender, Column), Data);
end;

procedure TfrmMain.tvBooksSGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PBookData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := ' ';
  CellText := GetText(GetTreeTag(Sender, Column), Data);
end;

procedure TfrmMain.tvBooksFGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PBookData;
  Page: Integer;

begin
  Page := Sender.Tag;
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := '';
  if Settings.TreeModes[Page] = tmTree then
    case Data^.nodeType of
      ntAuthorInfo:
        begin
          case GetTreeTag(Sender, Column) of
            COL_TITLE:
              CellText := Data^.GetAuthors;
          end;
        end;

      ntSeriesInfo:
        begin
          if GetTreeTag(Sender, Column) = COL_TITLE then
            CellText := 'Серия: ' + Data^.Serie;
        end;

      ntBookInfo:
        begin
          CellText := GetText(GetTreeTag(Sender, Column), Data);
        end;
    end
  else
    CellText := GetText(GetTreeTag(Sender, Column), Data);
end;

procedure TfrmMain.tvBooksSRGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PBookData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := ' ';
  case Column of
    0:
      CellText := Data^.GetAuthors;
    1:
      CellText := Data.Title;
    2:
      CellText := Data.Serie;
    3:
      if Data.SeqNumber <> 0 then
        CellText := IntToStr(Data^.SeqNumber);
    4:
      CellText := GetFormattedSize(Data.Size);
    6:
      CellText := Data^.GetGenres;
    7:
      CellText := DateToStr(Data.Date);
  end;
end;

procedure TfrmMain.tvGenresGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PGenreData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := Data.GenreAlias;
end;

procedure TfrmMain.tvGenresKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    tvGenresClick(Sender);
    frmMain.ActiveControl := tvBooksG;
  end;
end;

procedure TfrmMain.tvGroupsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PGroupData;
begin
  Data := tvGroups.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;

  DMUser.ActivateGroup(Data.GroupID);

  lblGroups.Caption := DMUser.GroupsName.Value;

  FillBooksTree(tvBooksF, DMUser.GroupBooks, DMUser.BooksByGroup, True, True);
end;

procedure TfrmMain.tvGroupsClick(Sender: TObject);
var
  BNode: PVirtualNode;
begin
  BNode := tvBooksF.GetFirst;
  if Assigned(BNode) and Assigned(BNode.FirstChild) then
    BNode := tvBooksF.GetFirstChild(BNode);
  if Assigned(BNode) then
    tvBooksF.Selected[BNode] := True;
end;

procedure TfrmMain.tvGroupsDragDrop(
  Sender: TBaseVirtualTree;
  Source: TObject;
  DataObject: IDataObject;
  Formats: TFormatArray;
  Shift: TShiftState;
  Pt: TPoint;
  var Effect: Integer;
  Mode: TDropMode
  );
var
  Nodes: TNodeArray;
  i: Integer;
  GroupData: PGroupData;
  SourceGroupID: Integer;
  TargetGroupID: Integer;
  BookData: PBookData;

  procedure SelectChildNodes(ParentNode: PVirtualNode);
  var
    Node: PVirtualNode;
  begin
    if ParentNode.ChildCount = 0 then
      Exit;
    Node := ParentNode.FirstChild;
    while Assigned(Node) do
    begin
      SelectChildNodes(Node);
      tvBooksF.Selected[Node] := True;
      Node := tvBooksF.GetNextSibling(Node);
    end;
  end;

begin
  SourceGroupID := DMUser.GroupsGroupID.Value;

  GroupData := tvGroups.GetNodeData(tvGroups.DropTargetNode);
  Assert(Assigned(GroupData));
  TargetGroupID := GroupData^.GroupID;

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
    if BookData^.nodeType = ntBookInfo then
    begin
      DMUser.CopyBookToGroup(
        BookData^.BookID, BookData^.DatabaseID,
        SourceGroupID, TargetGroupID,
        ssShift in Shift
        );
    end;
  end;
  FillBooksTree(tvBooksF, DMUser.GroupBooks, DMUser.BooksByGroup, True, True);
end;

procedure TfrmMain.tvGroupsDragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
var
  Data: PGroupData;
begin
  Data := tvGroups.GetNodeData(tvGroups.DropTargetNode);
  if Assigned(Data) then
    if Data^.GroupID <> DMUser.GroupsGroupID.Value then
      Accept := True;
end;

procedure TfrmMain.tvGroupsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PGroupData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));
  CellText := Data.Text;
end;

procedure TfrmMain.tvGroupsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    tvGroupsClick(Sender);
    frmMain.ActiveControl := tvBooksF;
  end;
end;

procedure TfrmMain.tvAuthorsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PAuthorData;
begin
  Data := tvAuthors.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;

  ClearLabels(PAGE_AUTHORS, True);

  dmCollection.Authors.Locate(AUTHOR_ID_FIELD, Data^.AuthorID, []);
  lblAuthor.Caption := Data^.GetFullName;
  FillBooksTree(tvBooksA, dmCollection.AuthorBooks, dmCollection.BooksByAuthor, False, True); // авторы
end;

procedure TfrmMain.tvAuthorsClick(Sender: TObject);
var
  Node: PVirtualNode;
begin
  Node := tvBooksA.GetFirst;
  if Assigned(Node) and Assigned(Node.FirstChild) then
    Node := tvBooksA.GetFirstChild(Node);
  if Assigned(Node) then
    tvBooksA.Selected[Node] := True;
end;

procedure TfrmMain.tvSeriesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PSerieData;
begin
  Data := tvSeries.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;

  ClearLabels(PAGE_SERIES, True);

  dmCollection.Series.Locate(SERIE_ID_FIELD, Data^.SerieID, []);
  lblSeries.Caption := Data^.SerieTitle;
  FillBooksTree(tvBooksS, nil, dmCollection.BooksBySerie, False, False); // авторы
end;

procedure TfrmMain.tvSeriesClick(Sender: TObject);
var
  Node: PVirtualNode;
begin
  Node := tvBooksS.GetFirst;
  if Assigned(Node) then
    tvBooksS.Selected[Node] := True;
end;

procedure TfrmMain.tvSeriesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PSerieData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := Data^.SerieTitle;
end;

procedure TfrmMain.tvSeriesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    tvSeriesClick(Sender);
    frmMain.ActiveControl := tvBooksS;
  end;
end;

procedure TfrmMain.tvGenresChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PGenreData;
  ID: string;
begin
  Data := tvGenres.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;
  ClearLabels(PAGE_GENRES, True);
  ID := Data^.GenreCode;
  if isFB2Collection(DMUser.ActiveCollection.CollectionType) or not Settings.ShowSubGenreBooks then
  begin
    dmCollection.Genres.Locate(GENRE_CODE_FIELD, ID, []);
    FillBooksTree(tvBooksG, dmCollection.GenreBooks, dmCollection.BooksByGenre, True, True); // жанры
  end
  else
  begin
    dmCollection.GenreBooks.MasterSource := nil;
    if Node.ChildCount > 0 then
      dmCollection.GenreBooks.Filter := '`GenreCode` Like ' + QuotedStr(ID + '.%')
    else
      dmCollection.GenreBooks.Filter := '`GenreCode` Like ' + QuotedStr(ID + '%');
    dmCollection.GenreBooks.Filtered := True;
    FillBooksTree(tvBooksG, dmCollection.GenreBooks, dmCollection.BooksByGenre, True, True); // жанры
    dmCollection.GenreBooks.Filtered := False;
    dmCollection.GenreBooks.MasterSource := dmCollection.dsGenres;
  end;
  lblGenreTitle.Caption := Data.GenreAlias;
end;

procedure TfrmMain.tvGenresClick(Sender: TObject);
var
  BNode: PVirtualNode;
begin
  BNode := tvBooksG.GetFirst;
  if Assigned(BNode) and Assigned(BNode.FirstChild) then
    BNode := tvBooksG.GetFirstChild(BNode);
  if Assigned(BNode) then
    tvBooksG.Selected[BNode] := True;
end;

procedure TfrmMain.GetActiveViewComponents(var Tree: TVirtualStringTree; var Panel: TMHLInfoPanel; var Cover: TMHLCoverPanel);
begin
  case ActiveView of
    ByAuthorView:
      begin
        Tree := tvBooksA;
        Panel := ipnlAuthors;
        Cover := cpCoverA;
      end;
    BySeriesView:
      begin
        Tree := tvBooksS;
        Panel := ipnlSeries;
        Cover := cpCoverS;
      end;
    ByGenreView:
      begin
        Tree := tvBooksG;
        Panel := ipnlGenres;
        Cover := cpCoverG;
      end;
    SearchView:
      begin
        Tree := tvBooksSR;
        Panel := ipnlSearch;
        Cover := cpCoverSR;
      end;
    FavoritesView:
      begin
        Tree := tvBooksF;
        Panel := ipnlFavorites;
        Cover := cpCoverF;
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

  CoverOK: Boolean;

  No: Integer;
begin
  if BookTreeStatus = bsBusy then
    Exit;

  GetActiveViewComponents(Tree, InfoPanel, Cover);

  Data := Tree.GetNodeData(Tree.GetFirstSelected);
  if not Assigned(Data) then
    Exit;

  if Data^.nodeType <> ntBookInfo then
  begin
    //
    // TODO : Может стоит показывать какую-нибудь информацию и в этом случае?
    //
    ClearLabels(Tree.Tag, False);
    Exit;
  end;

  dmCollection.GetBookFileName(Data^.BookID, FileName, Folder, Ext, No);

  Folder := TPath.Combine(FCollectionRoot, Folder);

  InfoPanel.Author := Data^.GetAuthors;
  InfoPanel.Title := Data^.Title;
  InfoPanel.Genre := Data^.GetGenres;
  if Data^.Local or not isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
  begin
    InfoPanel.FileName := FileName;
    InfoPanel.Folder := Folder;
    InfoPanel.ShowFileInfo := True;
  end
  else
    InfoPanel.ShowFileInfo := False;

  CoverOK := Cover.Show(Folder, FileName, No);

  if IsPrivate and IsNonFB2 then
  begin
    miConverToFBD.Visible := True;
    miConverToFBD.Tag := IfThen(CoverOK, 999, 0);
    miConverToFBD.Caption := IfThen(CoverOK, 'Редактировать FBD', 'Преобразовать FBD');

    if Assigned(frmConvertToFBD) then
    begin
      frmConvertToFBD.EditorMode := CoverOK;
      frmConvertToFBD.Caption := IfThen(CoverOK, 'Редактирование FBD', 'Преобразование в FBD');
    end;
  end;

  Application.ProcessMessages;
end;

procedure TfrmMain.tvBooksTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PBookData;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);
  case (Sender as TVirtualStringTree).Header.Columns[Column].Tag of
    COL_AUTHOR:  Result := CompareStr(Data1^.GetAuthors, Data2^.GetAuthors);
    COL_TITLE:   Result := CompareStr(Data1.Title, Data2.Title);
    COL_SERIES:  Result := CompareStr(Data1.Serie, Data2.Serie);
    COL_NO:      Result := CompareInt(Data1^.SeqNumber, Data2^.SeqNumber);
    COL_SIZE:    Result := CompareInt(Data1.Size, Data2.Size);
    COL_RATE:    Result := CompareInt(Data1.Rate, Data2.Rate);
    COL_GENRE:   Result := CompareStr(Data1^.GetGenres, Data2^.GetGenres);
    COL_DATE:    Result := CompareDate(Data1.Date, Data2.Date);
    COL_LANG:    Result := CompareStr(Data1.Lang, Data2.Lang);
    COL_LIBRATE: Result := CompareInt(Data1.LibRate, Data2.LibRate);
  end;
end;

procedure TfrmMain.tvBooksTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
var
  Data: PBookData;
  Color: TColor;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  Color := Settings.BGColor;
  case Data^.nodeType of
    ntAuthorInfo:
      Color := Settings.AuthorColor;
    ntSeriesInfo:
      Color := Settings.SeriesColor;
    ntBookInfo:
      begin
        if Data^.Serie = '' then
          Color := Settings.BookColor
        else
          Color := Settings.SeriesBookColor;
      end;
  end;

  TargetCanvas.Brush.Color := Color;
  TargetCanvas.FillRect(CellRect);
end;

function TfrmMain.GetTreeTag(const Sender: TBaseVirtualTree; const Column: Integer): Integer;
begin
  if Column < 0 then
    Result := -1
  else
    Result := (Sender as TVirtualStringTree).Header.Columns[Column].Tag;
end;

procedure TfrmMain.tvBooksTreeAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellRect: TRect);
var
  Data: PBookData;
  Tag: Integer;
  X: Integer;

  procedure Stars(Value: Integer);
  var
    i: Integer;
    X, Y: Integer;
    w, h: Integer;
  begin
    w := FStarImage.Width;
    h := FStarImage.Height;
    X := CellRect.Left (* + (CellRect.Right - CellRect.Left - 10 {w} * 5) div 2 *) ;
    Y := CellRect.Top + (CellRect.Bottom - CellRect.Top - h) div 2;
    for i := 0 to 4 do
    begin
      if Value > i then
        FStarImage.Draw(TargetCanvas, Rect(X, Y, X + w, Y + h))
      else
        FEmptyStarImage.Draw(TargetCanvas, Rect(X, Y, X + w, Y + h));
      Inc(X, { w } 10);
    end;
  end;

begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  if Data.nodeType <> ntBookInfo then
    Exit;

  Tag := GetTreeTag(Sender, Column);

  X := (Sender as TVirtualStringTree).Header.Columns.Items[Column].Left;

  if (Tag = COL_STATE) then
  begin
    if isOnlineCollection(DMUser.ActiveCollection.CollectionType) and (Data^.Local) then
      ilFileTypes.Draw(TargetCanvas, X, CellRect.Top + 1, 7);
    if Data.Progress = 100 then
      ilFileTypes.Draw(TargetCanvas, X + 10, CellRect.Top, 8);

    if Data.Code = 1 then
      ilFileTypes.Draw(TargetCanvas, X + 25, CellRect.Top + 1, 9);
  end;

  if (Tag = COL_RATE) then
    Stars(Data.Rate);

  if (Tag = COL_LIBRATE) then
    if Data.LibRate <= 5 then
      Stars(Data.LibRate)
    else
      Stars(0);
end;

procedure TfrmMain.tvBooksTreeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Node: PVirtualNode;
  Tree, Left: TVirtualStringTree;
  Data: PBookData;
begin
  if Key = vk_Insert then
  begin
    Tree := (Sender as TVirtualStringTree);
    Node := Tree.FocusedNode;
    if Assigned(Node) then
    begin
      BookTreeStatus := bsBusy;
      Data := Tree.GetNodeData(Node);
      if Data^.nodeType = ntBookInfo then
        if Tree.CheckState[Node] = csCheckedNormal then
          Tree.CheckState[Node] := csUncheckedNormal
        else
          Tree.CheckState[Node] := csCheckedNormal;

      Tree.Selected[Node] := False;
      Node := Tree.GetNext(Node);
      BookTreeStatus := bsFree;
      if Assigned(Node) then
        Tree.Selected[Node] := True;
    end;
  end;
  if ((Key = vk_Right) or (Key = vk_Left)) and (ssCtrl in Shift) then
  begin
    Tree := (Sender as TVirtualStringTree);
    case ActiveView of
      ByAuthorView:
        Left := tvAuthors;
      BySeriesView:
        Left := tvSeries;
      ByGenreView:
        Left := tvGenres;
      FavoritesView:
        Left := tvGroups;
      SearchView:
        Exit;
    end;

    Node := Left.FocusedNode;
    Left.Selected[Node] := False;

    if (Key = vk_Right) then
      Node := Left.GetNext(Node)
    else
      Node := Left.GetPrevious(Node);

    if Assigned(Node) then
    begin
      Left.Selected[Node] := True;
      Left.FocusedNode := Node;
    end;

    Node := Tree.GetFirst;
    if Assigned(Node) then
      Tree.Selected[Node] := True;
  end;
end;

procedure TfrmMain.FreeBookNodeDate(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PBookData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.FreeAuthorNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PAuthorData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.FreeSerieNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PSerieData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.FreeGenreNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PGenreData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.FreeGroupNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PGroupData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.FreeDownloadNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PDownloadData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.GetBookNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TBookData);
end;

procedure TfrmMain.GetAuthorNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TAuthorData);
end;

procedure TfrmMain.GetSerieNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TSerieData);
end;

procedure TfrmMain.GetGenreNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TGenreData);
end;

procedure TfrmMain.GetGroupNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TGroupData);
end;

procedure TfrmMain.GetDownloadNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TDownloadData);
end;

procedure TfrmMain.tvBooksTreeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: PVirtualNode;
  Data: PBookData;
  Tree: TVirtualStringTree;
  Selected: PVirtualNode;
begin
  if (Button = mbLeft) and (ssShift in Shift) then
  begin
    BookTreeStatus := bsBusy;
    try
      Tree := Sender as TVirtualStringTree;
      ClearLabels(Tree.Tag, True);
      Node := Tree.GetFirstSelected;
      Selected := Node;
      while Assigned(Node) do
      begin
        Data := Tree.GetNodeData(Node);
        if Data^.nodeType = ntBookInfo then
        begin
          if Tree.CheckState[Node] = csCheckedNormal then
            Tree.CheckState[Node] := csUncheckedNormal
          else
            Tree.CheckState[Node] := csCheckedNormal;
          Tree.Selected[Node] := False;
        end;
        Node := Tree.GetNextSelected(Node);
      end; // while
    finally
      BookTreeStatus := bsFree;
      Tree.Selected[Selected] := True;
    end;
  end; // if
end;

procedure TfrmMain.tvBooksTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  Data: PBookData;
begin
  Data := Sender.GetNodeData(Node);
  if Data.nodeType <> ntBookInfo then
    TargetCanvas.Font.Style := [fsBold]
  else if not Sender.Selected[Node] then
  begin
    if Data^.Local then
      TargetCanvas.Font.Color := Settings.LocalColor;
    if Data.Deleted then
      TargetCanvas.Font.Color := Settings.DeletedColor;
  end;
end;

procedure TfrmMain.tvDownloadListGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
const
  States: array [0 .. 3] of string = ('Ожидание', 'Закачка', 'Готово', 'Ошибка');
var
  Data: PDownloadData;
begin
  Data := tvDownloadList.GetNodeData(Node);
  case Column of
    0: CellText := Data.Author;
    1: CellText := Data.Title;
    2: CellText := GetFormattedSize(Data.Size);
    3: CellText := States[Ord(Data.State)];
  end;
end;

procedure TfrmMain.tvDownloadListLoadNode(Sender: TBaseVirtualTree; Node: PVirtualNode; Stream: TStream);
var
  Data: PDownloadData;
  Size: Integer;
  StrBuffer: PChar;

  function GetString: string;
  begin
    Stream.read(Size, SizeOf(Size));
    StrBuffer := AllocMem(Size);
    Stream.read(StrBuffer^, Size);
    Result := (StrBuffer);
    FreeMem(StrBuffer);
  end;

begin
  Data := Sender.GetNodeData(Node);
  // ID
  Stream.read(Data^.BookID, SizeOf(Data^.BookID));

  Data.Title := GetString;
  Data.Author := GetString;

  // Size
  Stream.read(Data.Size, SizeOf(Data.Size));

  Data.FileName := GetString;
  Data.URL := GetString;

  // State
  Stream.read(Data.State, SizeOf(Data.State));
end;

procedure TfrmMain.tvDownloadListPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  Data: PDownloadData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) and not Sender.Selected[Node] then
    case Data.State of
      dsRun: TargetCanvas.Font.Color := clGreen;
      dsError: TargetCanvas.Font.Color := clRed;
    end;
end;

procedure TfrmMain.tvDownloadListSaveNode(Sender: TBaseVirtualTree; Node: PVirtualNode; Stream: TStream);
var
  Data: PDownloadData;
  Size: Integer;

  procedure WriteString(const S: string);
  begin
    Size := ByteLength(S) + 1;
    Stream.write(Size, SizeOf(Size));
    Stream.write(PChar(S)^, Size);
  end;

begin
  Data := Sender.GetNodeData(Node);

  if not Assigned(Data) then
    Exit;

  // ID
  Stream.Write(Data^.BookID, SizeOf(Data^.BookID));

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
  btnPauseDownloadClick(Sender);
  tvDownloadList.Clear;
  lblDownloadCount.Caption := '(0)';
end;

procedure TfrmMain.btnClearEdSeriesClick(Sender: TObject);
begin
  edLocateSeries.Clear;
  frmMain.ActiveControl := edLocateSeries;
end;

procedure TfrmMain.MoveDwnldListNodes(Sender: TObject);
var
  i: Integer;
  List: TSelectionList;
begin
  GetSeelections(tvDownloadList, List);
  for i := 0 to tvDownloadList.SelectedCount - 1 do
    case (Sender as TRzToolButton).Tag of
      20: tvDownloadList.MoveTo(List[tvDownloadList.SelectedCount - i - 1], tvDownloadList.GetFirst, amInsertBefore, False);
      21: tvDownloadList.MoveTo(List[i], tvDownloadList.GetPrevious(List[i]), amInsertBefore, False);
      22: tvDownloadList.MoveTo(List[tvDownloadList.SelectedCount - i - 1], tvDownloadList.GetNext(List[tvDownloadList.SelectedCount - i - 1]), amInsertAfter, False);
      23: tvDownloadList.MoveTo(List[i], tvDownloadList.GetLast, amInsertAfter, False);
    end;
end;

procedure TfrmMain.CopyToCollectionClick(Sender: TObject);
var
  R: TBookRecord;
  ID: Integer;
  Tree: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookData;
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
  if not DMUser.SelectCollection(ID) then
    Exit;

  ALibrary := TMHLLibrary.Create(nil);
  try
    ALibrary.DatabaseFileName := DMUser.CurrentCollection.DBFileName;
    ALibrary.Active := True;

    Node := Tree.GetFirst;
    while Assigned(Node) do
    begin
      Data := Tree.GetNodeData(Node);
      if IsSelectedBookNode(Node, Data) then
      begin
        DMCollection.GetBookRecord(Data^.BookID, Data^.DatabaseID, R, True);
        ALibrary.InsertBook(R, True, True);
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
  NewSize: Integer;
begin
  NewSize := (Sender as TWinControl).Width;
  if NewSize < 150 then
    NewSize := 150;

  cpCoverA.Width := NewSize;
  cpCoverS.Width := NewSize;
  cpCoverG.Width := NewSize;
  cpCoverF.Width := NewSize;
  cpCoverSR.Width := NewSize;
end;

procedure TfrmMain.FillBookIdList(const Tree: TVirtualStringTree; var BookIDList: TBookIdList);
var
  i: Integer;
  Node: PVirtualNode;
  Data: PBookData;
begin
  i := 0;
  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if IsSelectedBookNode(Node, Data) then
    begin
      SetLength(BookIDList, i + 1);
      BookIDList[i].BookID := Data^.BookID;
      BookIDList[i].DatabaseID := Data^.DatabaseID;
      Inc(i);
      Tree.CheckState[Node] := csUncheckedNormal;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

procedure TfrmMain.tbSendToDeviceClick(Sender: TObject);
var
  AFolder: string;
  SaveDeviceDir: string;
  SaveFolderTemplate: string;
  TMPParams: string;
  ScriptID: Integer;
  BookIDList: TBookIdList;
  Files: string;
  p: Integer;
  S: string;
  Tree: TVirtualStringTree;
  ExportMode: TExportMode;
begin
  GetActiveTree(Tree);
  FillBookIdList(Tree, BookIDList);

  if Length(BookIDList) = 0 then
  begin
    ShowMessage('Ни одной книги не выбрано!');
    Exit;
  end;

  SaveDeviceDir := Settings.DeviceDir;
  SaveFolderTemplate := Settings.FolderTemplate;
  ScriptID := (Sender as TComponent).Tag;

  if isFB2Collection(DMUser.ActiveCollection.CollectionType) then
  begin
    case ScriptID of
      850: ExportMode := emFB2;
      851: ExportMode := emFB2Zip;
      852: ExportMode := emLrf;
      853: ExportMode := emTxt;
      854: ExportMode := emEpub;
      855: ExportMode := emPDF;
    else
      ExportMode := Settings.ExportMode;
    end
  end
  else
    ExportMode := emFB2;

  Dec(ScriptID, 901);

  if (ScriptID < 1) and (Settings.PromptDevicePath) then
  begin
    if not GetFolderName(Handle, 'Укажите путь', AFolder) then
      Exit
    else
      { TODO -oNickR -cRefactoring : это временное изменение в настройках и оно не должно сохраняться при закрытии программы
        Это изменение нужно только для работы функций ZipToDevice/FileToDevice и решается
        параметрами этих функций
      }
      Settings.DeviceDir := AFolder;
  end;

  if ScriptID >= 0 then
  begin
    TMPParams := Settings.Scripts[ScriptID].Params;
    if Pos('%NFT%', Settings.Scripts[ScriptID].Params) <> 0 then
    begin
      Settings.FolderTemplate := '';
      StrReplace('%NFT%', '', TMPParams);
    end;

    if Pos('%TMP%', Settings.Scripts[ScriptID].Params) <> 0 then
      StrReplace('%TMP%', Settings.TempPath, TMPParams);

    if Pos('%DEST%', Settings.Scripts[ScriptID].Params) <> 0 then
      StrReplace('%DEST%', Settings.DeviceDir, TMPParams);

    if Pos('%FOLDER ', Settings.Scripts[ScriptID].Params) <> 0 then
    begin
      StrReplace('%FOLDER ', '', TMPParams);
      p := Pos('%', TMPParams);
      S := Copy(TMPParams, 1, p - 1);
      Settings.DeviceDir := S;
      Delete(TMPParams, 1, p);
    end;

    if (Settings.Scripts[ScriptID].Path = '%COPY%') and (Trim(TMPParams) <> '') then
      Settings.DeviceDir := Trim(TMPParams);

    Settings.Scripts[ScriptID].TMPParams := TMPParams;
  end;

  if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
    unit_ExportToDevice.DownloadBooks(BookIDList);
  unit_ExportToDevice.ExportToDevice(Settings.DeviceDir, BookIDList, ExportMode, Files);

  if (ScriptID >= 0) and (Settings.Scripts[ScriptID].Path <> '%COPY%') then
  begin
    if Pos('%FILENAME%', Settings.Scripts[ScriptID].Params) <> 0 then
    begin
      StrReplace('%FILENAME%', Files, TMPParams);
      Settings.Scripts[ScriptID].TMPParams := TMPParams;
    end;
    Settings.Scripts[ScriptID].Run;
  end;

  Settings.DeviceDir := SaveDeviceDir;
  Settings.FolderTemplate := SaveFolderTemplate;
end;

procedure TfrmMain.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  spStatus.Caption := rstrReadyMessage;
  spProgress.Percent := 100;
end;

procedure TfrmMain.DownloadBooks;
var
  BookIDList: TBookIdList;
  Tree: TVirtualStringTree;
begin
  GetActiveTree(Tree);

  FillBookIdList(Tree, BookIDList);
  unit_ExportToDevice.DownloadBooks(BookIDList);
end;

procedure TfrmMain.tbtbnReadClick(Sender: TObject);
var
  WorkFile: string;
  Tree: TVirtualStringTree;
  Cover: TMHLCoverPanel;
  Panel: TMHLInfoPanel;
  No: Integer;
  Data: PBookData;

  FS: TMemoryStream;
  Zip: TZipForge;
  ID, i: Integer;

  FileName, Folder, Ext: string;

begin
  GetActiveViewComponents(Tree, Panel, Cover);

  Data := Tree.GetNodeData(Tree.GetFirstSelected);
  if not Assigned(Data) then
    Exit;

  if Data.nodeType <> ntBookInfo then
  begin
    ClearLabels(Tree.Tag, True);
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
    if ExtractFileExt(Panel.Folder) = ZIP_EXTENSION then
    begin
      //
      if ActiveView = FavoritesView then
      begin
        i := DMUser.BooksByGroupDatabaseID.Value;
        DMUser.tblBases.Locate(ID_FIELD, i, []);
        if isOnlineCollection(DMUser.tblBasesCode.Value) then
        begin
          DownloadBooks;
          if not FileExists(Panel.Folder) then
            Exit;
        end;
        ID := DMUser.BooksByGroupBookID.Value;
      end // if ActiveView
      else
      begin
        if isOnlineCollection(DMUser.ActiveCollection.CollectionType) then
        begin
          DownloadBooks;
          if not FileExists(Panel.Folder) then
            Exit; // если файла нет, значит закачка не удалась, и юзер об  этом уже знает
        end;
        ID := Data^.BookID;
      end; // if .. else

      if not FileExists(Panel.Folder) then
        raise EInvalidOp.Create('Архив ' + Panel.Folder + ' не найден!');

      dmCollection.GetBookFileName(Data^.BookID, FileName, Folder, Ext, No);

      Assert(Length(Data^.Authors) > 0);
      WorkFile :=
        Settings.ReadPath +
        Format('%s - %s.%d%s', [CheckSymbols(Data^.Authors[0].GetFullName), CheckSymbols(Data^.Title), ID, Ext]);

      if not FileExists(WorkFile) then
      begin
        Zip := TZipForge.Create(nil);
        FS := TMemoryStream.Create;
        try
          Zip.FileName := Panel.Folder;
          Zip.BaseDir := Settings.ReadPath;
          Zip.OpenArchive;
          Zip.ExtractToStream(GetFileNameZip(Zip, No), FS);
          FS.SaveToFile(WorkFile);
        finally
          FS.Free;
          Zip.Free;
        end;
      end; // if Exists
    end
    else if ExtractFileExt(Panel.FileName) = ZIP_EXTENSION then
    begin
      dmCollection.GetBookFileName(Data.BookID, FileName, Folder, Ext, No);

      WorkFile := Settings.ReadPath + Format('%s - %s.%d%s', [CheckSymbols(Panel.Author), CheckSymbols(Panel.Title), ID, Ext]);

      if not FileExists(WorkFile) then
      begin
        Zip := TZipForge.Create(nil);
        FS := TMemoryStream.Create;
        try
          Zip.FileName := Panel.Folder + Panel.FileName;
          Zip.BaseDir := Settings.ReadPath;
          Zip.OpenArchive;
          WorkFile := GetFileNameZip(Zip, No);
          Zip.ExtractToStream(WorkFile, FS);
          WorkFile := Settings.ReadPath + WorkFile;
          FS.SaveToFile(WorkFile);
        finally
          FS.Free;
          Zip.Free;
        end;
      end; // if Exists

    end
    else
      WorkFile := Panel.Folder + Panel.FileName;

    if Settings.OverwriteFB2Info and (Ext = FB2_EXTENSION) then
      WriteFb2InfoToFile(WorkFile);

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

  cbDeleted.Checked := Settings.DoNotShowDeleted;

  SetAuthorsShowLocalOnly;
  SetSeriesShowLocalOnly;
  SetBooksFilter;

  FillAuthorTree(tvAuthors);
  FillSeriesTree;
  FillAllBooksTree;

  RestorePositions;
end;

procedure TfrmMain.tbtnStarClick(Sender: TObject);
begin
  if (pgControl.ActivePageIndex <> PAGE_AUTHORS) and (pgControl.ActivePageIndex <> PAGE_SERIES) then
    Exit;

  Screen.Cursor := crHourGlass;
  case ActiveView of
    ByAuthorView:
      begin
        ClearLabels(PAGE_AUTHORS, True);
        if Assigned(FLastLetterA) then
          FLastLetterA.Down := False;

        FLastLetterA := (Sender as TToolButton);
        (Sender as TToolButton).Down := True;
        if (Sender as TToolButton).Tag >= 90 then
          case (Sender as TToolButton).Tag of
            91: dmCollection.Authors.Filter := 'UPPER(LastName) >= "А*"';
            92: dmCollection.Authors.Filter := 'UPPER(LastName) < "А*"';
          end
        else
        begin
          edLocateAuthor.Text := (Sender as TToolButton).Caption;
          dmCollection.Authors.Filter := '(LastName=' + QuotedStr((Sender as TToolButton).Caption + '*') + ') OR (LastName=' + QuotedStr(AnsiLowercase((Sender as TToolButton).Caption) + '*') + ')';
        end;
        dmCollection.Authors.Filtered := (Sender as TToolButton).Tag <> 90;
        FillAuthorTree(tvAuthors);

        // tvAuthors.Selected[tvAuthors.GetFirst] := True;
        edLocateAuthor.Perform(WM_KEYDOWN, vk_Right, 0);
      end;

    BySeriesView:
      begin
        ClearLabels(PAGE_SERIES, True);
        if Assigned(FLastLetterS) then
          FLastLetterS.Down := False;
        FLastLetterS := (Sender as TToolButton);
        (Sender as TToolButton).Down := True;

        if (Sender as TToolButton).Tag >= 90 then
          case (Sender as TToolButton).Tag of
            90: dmCollection.Series.Filter := 'S_Title <>' + QuotedStr(NO_SERIES_TITLE);
            91: dmCollection.Series.Filter := 'UPPER(S_Title) >= "А*"';
            92: dmCollection.Series.Filter := 'UPPER(S_Title) < "A*" and S_Title <>' + QuotedStr(NO_SERIES_TITLE);
          end
        else
        begin
          edLocateSeries.Text := (Sender as TToolButton).Caption;
          dmCollection.Series.Filter := '(S_Title=' + QuotedStr((Sender as TToolButton).Caption + '*') + ') OR (S_Title=' + QuotedStr(AnsiLowercase((Sender as TToolButton).Caption) + '*') + ')';
        end;
        dmCollection.Series.Filtered := True;
        FillSeriesTree;
        tvSeries.Selected[tvSeries.GetFirst] := True;
        edLocateSeries.Perform(WM_KEYDOWN, vk_Right, 0);
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
  tbtnShowLocalOnly.Down := Settings.ShowLocalOnly;

  SetAuthorsShowLocalOnly;
  SetSeriesShowLocalOnly;
  SetBooksFilter;

  FillAuthorTree(tvAuthors);
  FillSeriesTree;
  FillAllBooksTree;

  RestorePositions;
end;

procedure TfrmMain.SetCoversVisible(State: Boolean);
begin
  cpCoverA.Visible := State;
  cpCoverS.Visible := State;
  cpCoverG.Visible := State;
  cpCoverF.Visible := State;
  cpCoverSR.Visible := State;
end;

procedure TfrmMain.tbtnShowCoverClick(Sender: TObject);
var
  ShowCover: Boolean;
begin
  Settings.ShowInfoPanel := not Settings.ShowInfoPanel;

  // Visible := (Settings.ShowInfoPanel and not isNonFb2Collection(DMUser.ActiveCollection.CollectionType)
  // or (Settings.ShowInfoPanel and isNonFB2Collection(DMUser.ActiveCollection.CollectionType)
  // and Settings.AllowMixed));

  ShowCover := Settings.ShowInfoPanel;

  SetCoversVisible(ShowCover);
  if ShowCover then
    tvBooksTreeChange(nil, nil);
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
    ByAuthorView:
      Result := tvBooksA;
    BySeriesView:
      Result := tvBooksS;
    ByGenreView:
      Result := tvBooksG;
    SearchView:
      Result := tvBooksSR;
    FavoritesView:
      Result := tvBooksF;
  else
    begin
      Assert(False, 'Проверить использование, возможна ошибка');
      Result := nil;
    end;
  end;
end;

procedure TfrmMain.GroupMenuItemClick(Sender: TObject);
begin
  AddBookToGroup(Sender);
end;

procedure TfrmMain.GetActiveTree(var Tree: TVirtualStringTree);
begin
  Tree := GetViewTree(ActiveView);
end;

procedure TfrmMain.Selection(SelState: Boolean);
var
  Node: PVirtualNode;
  Tree: TVirtualStringTree;
begin
  GetActiveTree(Tree);
  Tree.BeginUpdate;
  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    if SelState then
      Node.CheckState := csCheckedNormal
    else
      Node.CheckState := csUncheckedNormal;
    Node := Tree.GetNext(Node);
  end;
  Tree.EndUpdate;
end;

procedure TfrmMain.SelectNextBook(Changed, Frwrd: Boolean);
var
  Tree: TVirtualStringTree;
  NewNode, OldNode: PVirtualNode;
  Data: PBookData;
begin
  if Changed then
    SaveFb2DataAfterEdit(FLastBookRecord);

  GetActiveTree(Tree);
  repeat
    OldNode := Tree.GetFirstSelected;
    if Frwrd then
    begin
      NewNode := Tree.GetNext(OldNode);
      if not Assigned(NewNode) then
        NewNode := Tree.GetFirst;
    end
    else
    begin
      NewNode := Tree.GetPrevious(OldNode);
      if not Assigned(NewNode) then
        NewNode := Tree.GetLast;
    end;
    Tree.Selected[OldNode] := False;
    Tree.Selected[NewNode] := True;
    Data := Tree.GetNodeData(NewNode);
    FLastActiveBookID := Data^.BookID;
  until Data^.nodeType = ntBookInfo;

  PrepareFb2EditData(Data, FLastBookRecord);
end;

procedure TfrmMain.tbSelectAllClick(Sender: TObject);
begin
  FSelectionState := not FSelectionState;
  Selection(FSelectionState);
end;

// - - - - - - Дерево книг для поиска, серий и избранного - - - - - - - - - - - -

procedure TfrmMain.FillBooksTree(
  const Tree: TVirtualStringTree;
  const Master: TDataset;
  const Detail: TDataset;
  ShowAuth: Boolean;
  ShowSer: Boolean
);
var
  MasterTable: TDataset;
  DetailTable: TDataset;

  Data: PBookData;
  authorNode: PVirtualNode;
  seriesNode: PVirtualNode;
  bookNode: PVirtualNode;
  LastSeries: PVirtualNode;
  Max, i: Integer;
  //DBCode: COLLECTION_TYPE;
  Author: string;
  LastAuthor: string;
  Columns: TColumnSet;

  IsGroupView: Boolean;

  BookIDField: TField;
  DatabaseIDField: TField;

  BookID: Integer;
  SerieID: Integer;
  DatabaseID: Integer;
  BookRecord: TBookRecord;

  function GetColumns: TColumnSet;
  var
    i: Integer;
  begin
    Result := [];
    for i := 0 to Tree.Header.Columns.Count - 1 do
      Include(Result, Tree.Header.Columns[i].Tag);
  end;

begin
  Assert(Assigned(Tree));
  Assert(Assigned(Detail));

  if Assigned(Master) then
    MasterTable := Master
  else
    MasterTable := Detail;
  DetailTable := Detail;

  Columns := GetColumns;

  //DBCode := DMUser.ActiveCollection.CollectionType;
  LastAuthor := '';
  LastSeries := nil;

  IsGroupView := (Tree.Tag = 4);

  //
  // Если включен "плоский" режим отображения, принудительно сбрасываем ключи блокировки
  //
  if Settings.TreeModes[Tree.Tag] = tmFlat then
  begin
    ShowAuth := False;
    ShowSer := False;
  end;

  //
  // Мастер таблица должна содержать следующие поля
  //  1. BOOK_ID_FIELD
  // для просмотра книг в группе нужны поля
  //  2. DB_ID_FIELD
  //

  //
  // найдем и запомним наиболее часто используемые поля
  //
  BookIDField := DetailTable.FieldByName(BOOK_ID_FIELD);
  Assert(Assigned(BookIDField) and (BookIDField is TIntegerField));

  if IsGroupView then
  begin
    DatabaseIDField := DetailTable.FieldByName(DB_ID_FIELD);
    Assert(Assigned(DatabaseIDField) and (DatabaseIDField is TIntegerField));
  end
  else
    DatabaseIDField := nil;

  DatabaseID := DMUser.ActiveCollection.ID;

  spProgress.Visible := True;

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
          DetailTable.DisableControls;
          try
            Max := MasterTable.RecordCount;

            MasterTable.First;
            while not MasterTable.Eof do
            begin
              //
              // для этой записи в мастере нет книг, переходим к следующей записе
              //
              if DetailTable.IsEmpty then
              begin
                MasterTable.Next;
                Continue;
              end;

              //
              //
              //
              BookID := BookIDField.AsInteger;
              if IsGroupView then
                DatabaseID := DatabaseIDField.AsInteger;

              DMCollection.GetBookRecord(BookID, DatabaseID, BookRecord, True);

              SerieID := BookRecord.SerieID;

              // обрабатываемое дерево не обязательно находится на активной вкладке!
              // это относится ко всем последующим проверкам
              if ShowAuth then
              begin
                Author := BookRecord.GetAutorsList;

                if LastAuthor <> Author then
                begin
                  authorNode := Tree.AddChild(nil);
                  Data := Tree.GetNodeData(authorNode);

                  Initialize(Data^);
                  Data^.nodeType := ntAuthorInfo;
                  Data^.Authors := BookRecord.Authors;
                  Include(authorNode.States, vsInitialUserData);

                  LastAuthor := Author;
                  LastSeries := nil;
                end;
              end
              else
                authorNode := nil;

              if ShowSer then
              begin
                if SerieID = NO_SERIE_ID then
                begin
                  //
                  // книга без серии
                  //
                  seriesNode := authorNode;
                end
                else
                begin
                  seriesNode := FindSeriesInTree(Tree, authorNode, SerieID);

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

                    //
                    // заполним данные о серии
                    //
                    Data := Tree.GetNodeData(seriesNode);
                    Data^.nodeType := ntSeriesInfo;
                    Data^.SerieID := SerieID;
                    Data^.Serie := BookRecord.Serie;

                    LastSeries := seriesNode;
                  end;
                end;
              end
              else
                seriesNode := authorNode;

              //
              // заполним данные о книге
              //
              bookNode := Tree.AddChild(seriesNode);
              Data := Tree.GetNodeData(bookNode);

              Initialize(Data^);
              BookRecord.FillBookData(Data);
              Data^.BookID := BookID;
              Data^.DatabaseID := DatabaseID;
              Include(bookNode.States, vsInitialUserData);

              Inc(i);
              spProgress.Percent := i * 100 div Max;

              MasterTable.Next;
            end; // while

            Tree.FullExpand;

            if ShowSer then
            begin
              authorNode := Tree.GetFirst;
              while Assigned(authorNode) do
              begin
                Data := Tree.GetNodeData(authorNode);
                if Data^.nodeType = ntSeriesInfo then
                  SortChild(Tree, authorNode);

                if (Data^.nodeType = ntAuthorInfo) and (authorNode.ChildCount = 0) then
                  Tree.DeleteNode(authorNode, True); { TODO -oNickR -cBug : при удалении ноды поведение GetNext неочевидно }

                authorNode := Tree.GetNext(authorNode);
              end;
            end;

            case Tree.Tag of
              0: lblBooksTotalA.Caption := Format('(%d)', [i]);
              1: lblBooksTotalS.Caption := Format('(%d)', [i]);
              2: lblBooksTotalG.Caption := Format('(%d)', [i]);
              3: lblTotalBooksFL.Caption := Format('(%d)', [i]);
              4: lblBooksTotalF.Caption := Format('(%d)', [i]);
            end;

          finally
            spProgress.Percent := 100;
            spProgress.Visible := False;
            spStatus.Caption := rstrReadyMessage;
            DMUser.ActivateCollection(Settings.ActiveCollection);

            if (Settings.TreeModes[Tree.Tag] = tmFlat) then
              Tree.SortTree(FSortSettings[Tree.Tag].Column, FSortSettings[Tree.Tag].Direction);
          end;
        finally
          DetailTable.EnableControls;
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
  AuthorData: PAuthorData;
  SerieData: PSerieData;
  GenreData: PGenreData;
  strText: string;

  Node: PVirtualNode;

begin
  strText := '';

  case ActiveView of
    ByAuthorView:
      begin
        Node := tvAuthors.GetFirstSelected;
        while Assigned(Node) do
        begin
          AuthorData := tvAuthors.GetNodeData(Node);
          if strText = '' then
            strText := AuthorData^.GetFullName
          else
            strText := strText + #13#10 + AuthorData^.GetFullName;
          Node := tvAuthors.GetNextSelected(Node);
        end;
      end;

    BySeriesView:
      begin
        Node := tvSeries.GetFirstSelected;
        while Assigned(Node) do
        begin
          SerieData := tvSeries.GetNodeData(Node);
          if strText = '' then
            strText := SerieData^.SerieTitle
          else
            strText := strText + #13#10 + SerieData^.SerieTitle;
          Node := tvSeries.GetNextSelected(Node);
        end;
      end;

    ByGenreView:
      begin
        Node := tvGenres.GetFirstSelected;
        while Assigned(Node) do
        begin
          GenreData := tvGenres.GetNodeData(Node);
          if strText = '' then
            strText := GenreData.GenreAlias
          else
            strText := strText + #13#10 + GenreData.GenreAlias;
          Node := tvGenres.GetNextSelected(Node);
        end;
      end;
  end;

  Clipboard.AsText := Trim(strText);
end;

procedure TfrmMain.miCopyClBrdClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  S, R: string;
  Data: PBookData;
  Node: PVirtualNode;

begin
  GetActiveTree(Tree);

  S := '';
  R := '';

  Node := Tree.GetFirstSelected;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);

    case Data^.nodeType of
      ntSeriesInfo:
        S := Data.GetAuthors + '. Серия: ' + Data^.Serie;

      ntBookInfo:
        if (Data^.Serie = NO_SERIES_TITLE) or (Data^.Serie = '') then
          S := Data.GetAuthors + '. ' + Data.Title
        else
          S := Data.GetAuthors + '. Серия: ' + Data^.Serie + '. ' + Data.Title;
    end;
    if S = '' then
      R := S
    else
      R := R + #13#10 + S;

    Node := Tree.GetNextSelected(Node);
  end;
  Clipboard.AsText := Trim(R);
end;

procedure TfrmMain.miDeleteBookClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Node, OldNode: PVirtualNode;
  Data: PBookData;
  ALibrary: TMHLLibrary;
  FileName, Folder, Ext: string;
  No: Integer;

begin
  if ActiveView = FavoritesView then
  begin
    MessageDlg('Для удаления книги перейдите ' + #13 + 'в соответствующую коллекцию', mtWarning, [mbOk], 0);
    Exit;
  end;

  if MessageDlg('Удалить отмеченные книги?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  Screen.Cursor := crHourGlass;
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

      if IsSelectedBookNode(Node, Data) then
      begin
        dmCollection.GetBookFileName(Data.BookID, FileName, Folder, Ext, No);
        if (IsOnline and Data^.Local) and DeleteFile(FCollectionRoot + Folder) then
          SetBookLocalStatus(Data^.BookID, Data^.DatabaseID, False)
        else
        begin
          if Settings.DeleteFiles then
          begin
            if not IsFB2 then
            begin
              if (ExtractFileExt(FileName) = ZIP_EXTENSION) then
                DeleteFile(FCollectionRoot + Folder + FileName)
              else
                DeleteFile(FCollectionRoot + Folder + FileName + Ext);
            end;

            if IsFB2 and IsPrivate then
            begin
              if (ExtractFileExt(Folder) = ZIP_EXTENSION) then
                DeleteFile(FCollectionRoot + Folder)
              else
                DeleteFile(FCollectionRoot + Folder + FileName + Ext);
            end;
          end;

          ALibrary.BeginBulkOperation;
          try
            ALibrary.DeleteBook(Data.BookID);
            ALibrary.EndBulkOperation(True);
          except
            ALibrary.EndBulkOperation(False);
          end;

          if DMUser.BooksByGroup.Locate(BOOK_DB_FIELDS, VarArrayOf([Data.BookID, Settings.ActiveCollection]), []) then
          begin
            DMUser.BooksByGroup.Delete;
          end;
          ///DMUser.DeleteExtra(Data.BookID);
        end;

        OldNode := Node;
        Node := Tree.GetNext(Node);
        Tree.DeleteNode(OldNode);
        ClearLabels(Tree.Tag, False);

      end
      else
        Node := Tree.GetNext(Node);
    end;
  finally
    ALibrary.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.miDeleteColClick(Sender: TObject);
begin
  { TODO -oNickR -cUsability : Думаю, стоит сделать специальный диалог для этого случая. Тогда мы сможем спросить, удалять файл коллекции или нет. }
  if MessageDlg('Удалить коллекцию "' + DMUser.ActiveCollection.Name + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  //
  // TODO : перенести в метод датамодуля
  //
  DMUser.ActivateCollection(Settings.ActiveCollection);
  DMUser.tblBases.Delete;
  DMUser.tblBases.First;

  Settings.ActiveCollection := DMUser.CurrentCollection.ID;
  InitCollection(True);
end;

procedure TfrmMain.miDeleteFilesClick(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PBookData;
  Tree: TVirtualStringTree;
begin
  GetActiveTree(Tree);
  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);

    if (Data^.nodeType = ntBookInfo) and ((tvBooksG.CheckState[Node] = csCheckedNormal) or (tvBooksG.Selected[Node])) and Data^.Local then
    begin
      if dmCollection.tblBooks.Locate(BOOK_ID_FIELD, Data.BookID, []) then
      begin
        // только для online-коллекции. поэтому получаем путь к файлу по упрощенной схеме
        try
          DeleteFile(FCollectionRoot + dmCollection.tblBooksFolder.Value);
        except

        end;

        dmCollection.tblBooks.Edit;
        dmCollection.tblBooksLocal.Value := False;
        dmCollection.tblBooks.Post;

        Data^.Local := False;
        tvBooksG.CheckState[Node] := csUncheckedNormal;
        Tree.RepaintNode(Node);

        // синхронизация с избранным
        DMUser.SetLocal(Data^.BookID, Data^.DatabaseID, False);
      end;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

function TfrmMain.GetActiveBookTable(Tag: Integer): TAbsTable;
begin
  if Tag = 4 then
    Result := DMUser.BooksByGroup
  else
    Result := dmCollection.tblBooks;
end;

procedure TfrmMain.miDownloadBooksClick(Sender: TObject);
var
  Tree: TVirtualStringTree;

  BookNode: PVirtualNode;
  BookData: PBookData;
  BookRecord: TBookRecord;

  DownloadNode: PVirtualNode;
  DownloadData: PDownloadData;

  function BookInDownloadList(BookID: Integer; DatabaseID: Integer): Boolean;
  var
    Node: PVirtualNode;
    Data: PDownloadData;
  begin
    Result := False;

    Node := tvDownloadList.GetFirst;
    while Assigned(Node) do
    begin
      Data := tvDownloadList.GetNodeData(Node);
      if (Data^.BookID = BookID) and (Data^.DataBaseID = DatabaseID) then
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

  BookNode := Tree.GetFirst;
  while Assigned(BookNode) do
  begin
    BookData := Tree.GetNodeData(BookNode);
    Assert(Assigned(BookData));
    if IsSelectedBookNode(BookNode, BookData) then
    begin
      if not BookData^.Local and (BookData^.DatabaseID = DMUser.ActiveCollection.ID) then
      begin
        if not BookInDownloadList(BookData^.BookID, BookData^.DatabaseID) then
        begin
          //
          // TODO : избавиться от необходимости получать BookRecord
          //
          DMCollection.GetBookRecord(BookData^.BookID, BookData^.DatabaseID, BookRecord, False);

          DownloadNode := tvDownloadList.AddChild(nil);
          DownloadData := tvDownloadList.GetNodeData(DownloadNode);

          Initialize(DownloadData^);
          DownloadData^.BookID := BookData^.BookID;
          DownloadData^.DataBaseID := BookData^.DatabaseID;
          DownloadData^.Author := BookRecord.GetAutorsList;
          DownloadData^.Title := BookData^.Title;
          DownloadData^.Size := BookData^.Size;
          DownloadData^.FileName := TPath.Combine(DMUser.ActiveCollection.RootPath, BookRecord.Folder);
          DownloadData^.URL := Format(Settings.InpxURL + 'b/%d/get', [BookRecord.LibID]);
          DownloadData^.State := dsWait;
          Include(DownloadNode.States, vsInitialUserData);
        end;
      end;

      Tree.CheckState[BookNode] := csUncheckedNormal;
    end;
    BookNode := Tree.GetNext(BookNode);
  end;

  lblDownloadCount.Caption := Format('(%d)', [tvDownloadList.ChildCount[nil]]);

  if Settings.AutoStartDwnld then
    btnStartDownloadClick(Sender);
end;

procedure TfrmMain.miEditAuthorClick(Sender: TObject);
(*
var
  Tree: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookData;
  Res: Boolean;
  S: string;

  old_AiD: Integer;
  new_AiD: Integer;

  frmEditAuthor: TfrmEditAuthorDataEx;
*)
begin
  Assert(False, 'Not implementd yet!');

  (*
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

  dmCollection.AuthorBooks.Locate(BOOK_ID_FIELD, Data.BookID, []);
  dmCollection.Authors.Locate(AUTHOR_ID_FIELD, dmCollection.AuthorBooks[AUTHOR_ID_FIELD], []);
  old_AiD := dmCollection.AuthorBooks[AUTHOR_ID_FIELD];

  frmEditAuthor := TfrmEditAuthorDataEx.Create(self);
  try
    frmEditAuthor.LastName := dmCollection.AuthorsFamily.Value;
    frmEditAuthor.FirstName := dmCollection.AuthorsName.Value;
    frmEditAuthor.MidName := dmCollection.AuthorsMiddle.Value;

    if frmEditAuthor.ShowModal = mrOk then
    begin
      S := Trim(AnsiUpperCase(frmEditAuthor.LastName + ' ' + frmEditAuthor.FirstName + ' ' + frmEditAuthor.MidName));

      if (not frmEditAuthor.AddNew) and (not frmEditAuthor.SaveLinks) then
      begin
        // меняем только данные об авторе, все ссылки остаются на месте
        if dmCollection.Authors.Locate(AUTHOR_FULLNAME_FIELDS, VarArrayOf([frmEditAuthor.LastName, frmEditAuthor.FirstName, frmEditAuthor.MidName]), [loCaseInsensitive]) then
        begin
          // если новый автор уже есть, меняем сслыки на него  (объединение)
          new_AiD := dmCollection.AuthorsID.Value;
          repeat
            // меняем старые Id на новые
            { TODO -oNickR -cRefactoring : можно заменить на один UPDATE }
            dmCollection.AuthorBooks.MasterSource := nil;

            Res := dmCollection.AuthorBooks.Locate(AUTHOR_ID_FIELD, old_AiD, []);
            if Res then
            begin
              dmCollection.AuthorBooks.Edit;
              dmCollection.AuthorBooksAuthorID.Value := new_AiD;
              dmCollection.AuthorBooks.Post;
            end;
          until not Res;

          // обновляем индексное поле
          { TODO -oNickR -cRefactoring : можно заменить на один UPDATE }
          repeat
            // TODO -cBug: в поле FullName должен записываться только первый автор
            Res := dmCollection.tblBooks.Locate('FullName', AnsiUpperCase(Data^.GetAuthors), [loCaseInsensitive]);
            if Res then
            begin
              dmCollection.tblBooks.Edit;
              dmCollection.tblBooksFullName.Value := S;
              dmCollection.tblBooks.Post;
            end;
          until not Res;

          // старого автора удаляем
          if dmCollection.Authors.Locate(AUTHOR_ID_FIELD, old_AiD, []) then
            dmCollection.Authors.Delete;

          dmCollection.AuthorBooks.MasterSource := dmCollection.dsAuthors;
        end // if Locate
        else // если нет - просто редактируем ФИО
        begin
          dmCollection.Authors.Edit;
          dmCollection.AuthorsFamily.Value := frmEditAuthor.LastName;
          dmCollection.AuthorsName.Value := frmEditAuthor.FirstName;
          dmCollection.AuthorsMiddle.Value := frmEditAuthor.MidName;
          dmCollection.Authors.Post;
        end;

        repeat
          { TODO -oNickR -cRefactoring : можно заменить на один UPDATE }
          Res := dmCollection.tblBooks.Locate('FullName', AnsiUpperCase(Data^.GetAuthors), [loCaseInsensitive]);
          if Res then
          begin
            dmCollection.tblBooks.Edit;
            dmCollection.tblBooksFullName.Value := S;
            dmCollection.tblBooks.Post;
          end;
        until not Res;
      end;

      if (frmEditAuthor.AddNew) then
      begin // заменяем автора на нового
        // добавляем нового автора
        if not dmCollection.Authors.Locate(AUTHOR_FULLNAME_FIELDS, VarArrayOf([frmEditAuthor.LastName, frmEditAuthor.FirstName, frmEditAuthor.MidName]), [loCaseInsensitive]) then
        begin
          dmCollection.Authors.Insert;
          dmCollection.AuthorsFamily.Value := frmEditAuthor.LastName;
          dmCollection.AuthorsName.Value := frmEditAuthor.FirstName;
          dmCollection.AuthorsMiddle.Value := frmEditAuthor.MidName;
          dmCollection.Authors.Post;
        end;

        // меняем ссылки
        dmCollection.AuthorBooks.MasterSource := nil;

        Node := Tree.GetFirst;
        while Assigned(Node) do
        begin
          Data := Tree.GetNodeData(Node);
          if IsSelectedBookNode(Node, Data) then
          begin
            if not frmEditAuthor.SaveLinks then // заменяем ссылки
            begin
              if dmCollection.AuthorBooks.Locate(BOOK_ID_FIELD, Data.BookID, []) then
              begin
                dmCollection.AuthorBooks.Edit;
                dmCollection.AuthorBooksAuthorID.Value := dmCollection.AuthorsID.Value;
                dmCollection.AuthorBooks.Post;
              end
            end
            else
            begin // добавляем второго автора
              dmCollection.AuthorBooks.Insert;
              dmCollection.AuthorBooksAuthorID.Value := dmCollection.AuthorsID.Value;
              dmCollection.AuthorBooksBookID.Value := Data.BookID;

              dmCollection.AuthorBooksAL_Series.Value := Copy(Data^.Serie, 1, INDEXSIZE);
              dmCollection.AuthorBooksAL_Title.Value := Copy(Data.Title, 1, INDEXSIZE);

              dmCollection.AuthorBooks.Post;
            end;
            dmCollection.tblBooks.Locate(BOOK_ID_FIELD, Data.BookID, []);
            dmCollection.tblBooks.Edit;
            dmCollection.tblBooksFullName.Value := S;
            dmCollection.tblBooks.Post;
          end;
          Node := Tree.GetNext(Node, False);
        end;
        dmCollection.AuthorBooks.MasterSource := dmCollection.dsAuthors;
      end;
      InitCollection(True);
    end;
  finally
    frmEditAuthor.Free;
  end;
  *)
end;

function TfrmMain.IsLibRusecEdit(BookID: Integer): Boolean;
begin
  if isExternalCollection(DMUser.ActiveCollection.CollectionType) then
  begin
    if MessageDlg('Изменения информации о книгах в онлайн-коллекциях возможно только на сайте.' + #13 + 'Перейти на сайт "Электронная библиотека lib.rus.ec"?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      dmCollection.tblBooks.Locate(BOOK_ID_FIELD, BookID, []);
      { TODO -oNickR -cLibDesc : этот URL должен формироваться обвязкой библиотеки, т к его формат может меняться }
      ShellExecute(Handle, 'open', PChar('http://lib.rus.ec/b/' + IntToStr(dmCollection.tblBooks[LIB_ID_FIELD]) + '/edit'), nil, nil, SW_SHOW);
    end;
    Result := True;
  end
  else
    Result := False;
end;

procedure TfrmMain.PrepareFb2EditData(Data: PBookData; var R: TBookRecord);
var
  Family: TListItem;
  Author: TAuthorData;
  Genre: TGenreData;
begin
  //
  // TODO : избавиться от необходимости получать BookRecord
  //
  DMCollection.GetBookRecord(Data^.BookID, Data^.DatabaseID, R, False);

  frmEditBookInfo.lvAuthors.Items.Clear;
  for Author in Data^.Authors do
  begin
    Family := frmEditBookInfo.lvAuthors.Items.Add;
    Family.Caption := Author.LastName;
    Family.SubItems.Add(Author.FirstName);
    Family.SubItems.Add(Author.MiddleName);
  end;

  frmEditBookInfo.lblGenre.Text := '';
  FillGenresTree(frmGenreTree.tvGenresTree);
  for Genre in Data^.Genres do
  begin
    frmGenreTree.SelectGenres(Genre.GenreCode);
    frmEditBookInfo.lblGenre.Text := frmEditBookInfo.lblGenre.Text + Genre.GenreAlias + ';';
  end;

  frmEditBookInfo.edT.Text := Data^.Title;

  if R.Serie = NO_SERIES_TITLE then
    frmEditBookInfo.cbSeries.Text := ''
  else
    frmEditBookInfo.cbSeries.Text := Data^.Serie;

  frmEditBookInfo.edSN.Text := IntToStr(Data^.SeqNumber);
  frmEditBookInfo.edKeyWords.Text := R.KeyWords;
  frmEditBookInfo.cbLang.Text := Data^.Lang;
end;

procedure TfrmMain.SaveFb2DataAfterEdit(R: TBookRecord);
var
  Tree: TVirtualStringTree;
  Data: PBookData;
  Node: PVirtualNode;
  i: Integer;
  ALibrary: TMHLLibrary;

  OldID: Integer;
begin
  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;

  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data^.nodeType <> ntBookInfo) then
    Exit;

  R.ClearAuthors;

  for i := 0 to frmEditBookInfo.lvAuthors.Items.Count - 1 do
    R.AddAuthor(frmEditBookInfo.lvAuthors.Items[i].Caption, frmEditBookInfo.lvAuthors.Items[i].SubItems[0], frmEditBookInfo.lvAuthors.Items[i].SubItems[1]);

  frmGenreTree.GetSelectedGenres(R);
  R.Title := frmEditBookInfo.edT.Text;
  R.Serie := frmEditBookInfo.cbSeries.Text;

  R.SeqNumber := StrToIntDef(frmEditBookInfo.edSN.Text, 0);
  R.KeyWords := frmEditBookInfo.edKeyWords.Text;
  R.Lang := frmEditBookInfo.cbLang.Text;

  OldID := Data.BookID;

  ALibrary := TMHLLibrary.Create(nil);
  try
    ALibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
    ALibrary.Active := True;

    ALibrary.BeginBulkOperation;
    try
      ALibrary.DeleteBook(Data^.BookID, False);
      Data^.BookID := ALibrary.InsertBook(R, False, False);
      ALibrary.CorrectExtra(OldID, Data^.BookID);
      ALibrary.EndBulkOperation(True);
    except
      ALibrary.EndBulkOperation(False);
    end;

    DMUser.CorrectExtra(OldID, Data^.BookID);

    Data^.Title := frmEditBookInfo.edT.Text;
    //
    // TODO : restore this code
    //
    // Data^.Genre := frmEditBookInfo.lblGenre.Text;
    Assert(False, 'Not implemented yet!');
    Data^.SeqNumber := StrToIntDef(frmEditBookInfo.edSN.Text, 0);
    Data^.Lang := frmEditBookInfo.cbLang.Text;
    Tree.RepaintNode(Node);
  finally
    ALibrary.Free;
  end;
end;

procedure TfrmMain.miEditBookClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Data: PBookData;
  Node: PVirtualNode;
begin
  if (ActiveView = FavoritesView) or (ActiveView = DownloadView) then
  begin
    MessageDlg('Редактирование книг из избранного или списка закачек невозможно.', mtWarning, [mbOk], 0);
    Exit;
  end;

  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data^.nodeType <> ntBookInfo) then
    Exit;

  if IsLibRusecEdit(Data.BookID) then
    Exit;

  PrepareFb2EditData(Data, FLastBookRecord);

  if frmEditBookInfo.ShowModal = mrOk then
  begin
    SaveFb2DataAfterEdit(FLastBookRecord);
    SavePositions;
    InitCollection(True);
    RestorePositions;
  end;
end;

procedure TfrmMain.miEditGenresClick(Sender: TObject);
var
  NodeB, NodeG: PVirtualNode;
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
        if (DataB^.nodeType = ntBookInfo) and ((Tree.CheckState[NodeB] = csCheckedNormal) or (Tree.Selected[NodeB])) then
        begin
          ALibrary.CleanBookGenres(DataB.BookID);

          Assert(False, 'Not implemented yet!');
          //
          // TODO : restore this code
          //
          {
          DataB.Genre := '';
          NodeG := frmGenreTree.tvGenresTree.GetFirstSelected;
          while Assigned(NodeG) do
          begin
            DataG := frmGenreTree.tvGenresTree.GetNodeData(NodeG);

            ALibrary.AddBookGenre(DataB.BookID, DataG.Code);

            DataB.Genre := DataB.Genre + DataG.Text + ' / ';
            NodeG := frmGenreTree.tvGenresTree.GetNextSelected(NodeG);
          end;

          Delete(DataB.Genre, Length(DataB.Genre) - 2, 3);
          }
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
  AuthID: Integer;
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

  if IsLibRusecEdit(Data.BookID) then
    Exit;

  S := Data^.Serie;

  if Data^.nodeType = ntBookInfo then // добавляем новую серию
  begin
    Assert(Length(Data^.Authors) > 0);
    AuthID := Data^.Authors[0].AuthorID;

    if InputQuery('Создание серии / Перенос в серию', 'Название:', S) then
    begin
      if S = '' then
        S := NO_SERIES_TITLE;

      if not dmCollection.tblSeriesB1.Locate('S_Title;AuthorID', VarArrayOf([S, AuthID]), []) then
      begin
        dmCollection.tblSeriesB1.Insert;
        dmCollection.tblSeriesB1S_Title.Value := S;
        dmCollection.tblSeriesB1AuthorID.Value := AuthID;
        Assert(Length(Data^.Genres) > 0);
        dmCollection.tblSeriesB1GenreCode.Value := Data^.Genres[0].GenreCode;
        dmCollection.tblSeriesB1.Post;
      end;

      Node := Tree.GetFirst;
      while Assigned(Node) do
      begin
        Data := Tree.GetNodeData(Node);
        if ((Tree.CheckState[Node] = csCheckedNormal) or (Tree.Selected[Node])) then
        begin
          dmCollection.tblBooks.Locate(BOOK_ID_FIELD, Data.BookID, []);
          dmCollection.tblBooks.Edit;
          dmCollection.tblBooksSerieID.Value := dmCollection.tblSeriesB1SerieID.Value;
          dmCollection.tblBooks.Post;
        end;
        Node := Tree.GetNext(Node);
      end;

      FillAllBooksTree;
    end;
  end
  else // редактирукм название существующей
  if InputQuery('Редактирование серии', 'Название:', S) then
  begin
    if S = '' then { TODO : заменить на один update }
    begin
      while dmCollection.tblBooks.Locate(SERIE_ID_FIELD, Data.SerieID, []) do
      begin
        dmCollection.tblBooks.Edit;
        dmCollection.tblBooksSerieID.Value := NO_SERIE_ID;
        dmCollection.tblBooks.Post;
      end;
      FillAllBooksTree;
    end
    else
    begin
      dmCollection.tblSeriesB1.Locate(SERIE_ID_FIELD, Data.SerieID, []);
      dmCollection.tblSeriesB1.Edit;
      dmCollection.tblSeriesB1S_Title.Value := S;
      dmCollection.tblSeriesB1.Post;
      Data^.Serie := S;
      Tree.RepaintNode(Node);
    end;
  end;

end;

procedure TfrmMain.AddGroup(Sender: TObject);
var
  GroupName: string;
begin
  GroupName := Trim(InputBox('Добавление группы', 'Название группы', ''));
  if GroupName <> '' then
  begin
    if DMUser.AddGroup(GroupName) then
    begin
      FillGroupsList;
      CreateGroupsMenu;
      FillBooksTree(tvBooksF, DMUser.GroupBooks, DMUser.BooksByGroup, True, True);
    end
    else
      ShowMessage('Группа с таким именем уже существует!');
  end;
end;

procedure TfrmMain.DeleteGroup(Sender: TObject);
var
  Data: PGroupData;
begin
  Data := tvGroups.GetNodeData(tvGroups.FocusedNode);
  if not Assigned(Data) then
    Exit;

  if Data^.CanDelete then
  begin
    DMUser.DeleteGroup(Data^.GroupID);

    FillGroupsList;
    CreateGroupsMenu;
    FillBooksTree(tvBooksF, DMUser.GroupBooks, DMUser.BooksByGroup, True, True);
  end
  else
    ShowMessage('Нельзя удалить встроенную группу!');
end;

procedure TfrmMain.AddBookToGroup(Sender: TObject);
var
  Tree: TVirtualStringTree;
  i, Max: Integer;
  Data: PBookData;
  GroupID: Integer;
  GroupData: PGroupData;

  Node: PVirtualNode;
begin
  GetActiveTree(Tree);
  Max := Tree.TotalCount;

  if Max = 0 then
    Exit;

  if Sender is TMenuItem then
    GroupID := (Sender as TMenuItem).Tag
  else
    GroupID := FAVORITES_GROUP_ID;

  Screen.Cursor := crHourGlass;
  try
    spProgress.Visible := True;
    spStatus.Caption := 'Добавляем в избранное...';
    spProgress.Percent := 0;
    ///dmCollection.tblBooks.DisableControls;
    ///DMUser.GroupedBooks.DisableControls;

    Node := Tree.GetFirst;
    i := 0;
    while Assigned(Node) do
    begin
      Data := Tree.GetNodeData(Node);
      Assert(Assigned(Data));
      if IsSelectedBookNode(Node, Data) then
        DMCollection.AddBookToGroup(Data^.BookID, Data^.DatabaseID, GroupID);

      Inc(i);
      spProgress.Percent := i * 100 div Max;
      spProgress.Repaint;

      Node := Tree.GetNext(Node);
    end;

    spProgress.Visible := False;
    Selection(False);
    ///dmCollection.tblBooks.EnableControls;
    ///DMUser.GroupedBooks.EnableControls;
  finally
    Screen.Cursor := crDefault;
  end;

  //
  // если выделенная группа совпадает с той, куда добавляем книги, нужно перерисовать список
  //
  if (tvGroups.SelectedCount > 0) then
  begin
    GroupData := tvGroups.GetNodeData(tvGroups.GetFirstSelected);
    if GroupData.GroupID = GroupID then
      FillBooksTree(tvBooksF, DMUser.GroupBooks, DMUser.BooksByGroup, True, True); // Группы
  end;
end;

procedure TfrmMain.DeleteBookFromGroup(Sender: TObject);
var
  Node: PVirtualNode;
  GroupData: PGroupData;
  Data: PBookData;
begin
  GroupData := tvGroups.GetNodeData(tvGroups.GetFirstSelected);
  if not Assigned(GroupData) then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    Node := tvBooksF.GetFirst;
    while Assigned(Node) do
    begin
      Data := tvBooksF.GetNodeData(Node);
      Assert(Assigned(Data));
      if (Data^.nodeType = ntBookInfo) and ((tvBooksG.CheckState[Node] = csCheckedNormal) or (tvBooksG.Selected[Node])) then
        DMUser.DeleteFromGroup(Data.BookID, Data^.DatabaseID, GroupData^.GroupID);

      Node := tvBooksF.GetNext(Node);
    end;

    DMUser.RemoveUnusedBooks;

    ClearLabels(PAGE_FAVORITES, True);
    FillBooksTree(tvBooksF, DMUser.GroupBooks, DMUser.BooksByGroup, True, True);
  finally
    Screen.Cursor := crDefault;
  end;
end;

//
// Очистить выделенную группу
//
procedure TfrmMain.ClearGroup(Sender: TObject);
var
  GroupData: PGroupData;
begin
  GroupData := tvGroups.GetNodeData(tvGroups.GetFirstSelected);
  if not Assigned(GroupData) then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    DMUser.ClearGroup(GroupData^.GroupID);

    ClearLabels(PAGE_FAVORITES, True);
    FillBooksTree(tvBooksF, DMUser.GroupBooks, DMUser.BooksByGroup, True, True); // избранное
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.miAddToSearchClick(Sender: TObject);
var
  Edit: TRzButtonEdit;
  treeView: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PAuthorData;
  // TODO : отдельный тип данных для серии
begin
  case ActiveView of
    ByAuthorView:
      begin
        treeView := tvAuthors;
        Edit := edFFullName;
      end;
    BySeriesView:
      begin
        Assert(False, 'Необходимо использовать отдельный тип данных для серии');
        Exit;
        treeView := tvSeries;
        Edit := edFSeries;
      end
    else
      Assert(False);
  end;

  Node := treeView.GetFirstSelected;
  while Assigned(Node) do
  begin
    Data := treeView.GetNodeData(Node);
    if Edit.Text = '' then
      Edit.Text := Format('="%s"', [Data^.GetFullName])
    else
      Edit.Text := Format('%s OR%s="%s"', [Edit.Text, #13#10, Data^.GetFullName]);
    Node := treeView.GetNextSelected(Node);
  end;
end;

procedure TfrmMain.miFastBookSearchClick(Sender: TObject);
begin
  unit_Utils.LocateBook;
end;

procedure TfrmMain.miFb2ImportClick(Sender: TObject);
begin
  dmCollection.DBCollection.Connected := False;

  unit_Import.ImportFB2(DMUser.ActiveCollection);

  InitCollection(True);
end;

procedure TfrmMain.miFb2ZipImportClick(Sender: TObject);
begin
  dmCollection.DBCollection.Connected := False;

  unit_Import.ImportFB2ZIP(DMUser.ActiveCollection);

  InitCollection(True);
end;

procedure TfrmMain.miFBDImportClick(Sender: TObject);
begin
  dmCollection.DBCollection.Connected := False;

  unit_Import.ImportFBD(DMUser.ActiveCollection);

  InitCollection(True);
end;

procedure TfrmMain.SetBookRate(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookData;
  NewRate: Integer;
begin
  if Sender = miSetRate1 then
    NewRate := 1
  else if Sender = miSetRate2 then
    NewRate := 2
  else if Sender = miSetRate3 then
    NewRate := 3
  else if Sender = miSetRate4 then
    NewRate := 4
  else if Sender = miSetRate5 then
    NewRate := 5
  else
    NewRate := 0;

  GetActiveTree(Tree);
  Assert(Assigned(Tree));
  Node := Tree.GetFirstSelected;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    if Assigned(Data) and (Data^.nodeType = ntBookInfo) then
    begin
      DMCollection.SetRate(Data^.BookID, Data^.DatabaseID, NewRate);
      UpdateNodes(
        Data^.BookID, Data^.DatabaseID,
        procedure(BookData: PBookData)
        begin
          Assert(Assigned(BookData));
          BookData^.Rate := NewRate;
        end
      );
    end;

    Node := Tree.GetNextSelected(Node);
  end;
end;

procedure TfrmMain.btnSavePresetClick(Sender: TObject);
const
  d = '~;~';
var
  SL: TStringList;
  S: string;
  FN: string;

begin
  if cbPresetName.Text = '' then
    Exit;

  FN := cbPresetName.Text + '.mhlf';

  if not FileExists(Settings.PresetPath + FN) then
    cbPresetName.Items.Add(cbPresetName.Text);

  SL := TStringList.Create;
  try
    S := '~' +
      edFFullName.Text + d +
      edFTitle.Text + d +
      edFSeries.Text + d +
      edFGenre.Text + d +
      edFGenre.Hint + d +
      edFAnnotation.Text + d +
      edFFile.Text + d +
      edFFolder.Text + d +
      edFExt.Text + d +
      cbDate.Text + d +
      cbDownloaded.Text + d +
      BoolToStr(cbDeleted.Checked) + d +
      cbLang.Text + d +
      edFKeyWords.Text + '~';

    SL.Add(S);
    SL.SaveToFile(Settings.PresetPath + FN, TEncoding.UTF8);

    btnDeletePreset.Enabled := True;
  finally
    SL.Free;
  end;
end;

procedure TfrmMain.LocateAuthor(const Text: string);
var
  Node: PVirtualNode;
  Data: PAuthorData;
begin
  tvAuthors.ClearSelection;
  Node := tvAuthors.GetFirst;

  while Assigned(Node) do
  begin
    Data := tvAuthors.GetNodeData(Node);
    Assert(Assigned(Data));
    if StartsText(Text, Data^.GetFullName) then
    begin
      tvAuthors.Selected[Node] := True;
      tvAuthors.FocusedNode := Node;
      Exit;
    end;
    Node := tvAuthors.GetNext(Node);
  end;
end;

procedure TfrmMain.LocateSerie(const Text: string);
var
  Node: PVirtualNode;
  Data: PSerieData;
begin
  tvSeries.ClearSelection;
  Node := tvSeries.GetFirst;

  while Assigned(Node) do
  begin
    Data := tvSeries.GetNodeData(Node);
    Assert(Assigned(Data));
    if StartsText(Text, Data^.SerieTitle) then
    begin
      tvSeries.Selected[Node] := True;
      tvSeries.FocusedNode := Node;
      Exit;
    end;
    Node := tvSeries.GetNext(Node);
  end;
end;

procedure TfrmMain.LocateBook(Text: string; Next: Boolean);
var
  Node: PVirtualNode;
  Data: PBookData;
  L: Integer;
  Tree: TVirtualStringTree;
begin
  GetActiveTree(Tree);

  Tree.ClearSelection;

  if not Next then
    FLastFoundBook := nil;

  if Next and Assigned(FLastFoundBook) then
    Node := Tree.GetNext(FLastFoundBook)
  else
    Node := Tree.GetFirst;

  L := Length(Text);
  Text := AnsiUpperCase(Text);

  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if Text = Copy(AnsiUpperCase(Data.Title), 1, L) then
    begin
      Tree.Selected[Node] := True;
      Tree.FocusedNode := Node;

      if not Next then
        FFirstFoundBook := Node;

      FLastFoundBook := Node;

      Exit;
    end;
    Node := Tree.GetNext(Node);
  end;

  if Assigned(FFirstFoundBook) then
  begin
    FLastFoundBook := FFirstFoundBook;

    Tree.FocusedNode := FLastFoundBook;
    Tree.Selected[FLastFoundBook] := True;
  end;

end;

procedure TfrmMain.edLocateAuthorChange(Sender: TObject);
var
  S: string;
  OldText: string;
begin
  if FIgnoreChange then
    Exit;
  S := AnsiUpperCase(Copy(edLocateAuthor.Text, 1, 1));
  if S <> FLastLetterA.Caption then
  begin
    OldText := edLocateAuthor.Text;
    ChangeLetterButton(S);
    edLocateAuthor.Text := OldText;
    edLocateAuthor.Perform(WM_KEYDOWN, vk_Right, 0);
  end;
  if not FDoNotLocate then
    LocateAuthor(edLocateAuthor.Text);
end;

procedure TfrmMain.edLocateAuthorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  if ActiveView = ByAuthorView then
  begin
    if Key = VK_UP then
      tvAuthors.Perform(WM_KEYDOWN, VK_UP, 0);
    if Key = VK_DOWN then
      tvAuthors.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if Key = VK_RETURN then
    begin
      tvAuthorsClick(Sender);
      frmMain.ActiveControl := tvBooksA;
    end;
  end;

  if ActiveView = BySeriesView then
  begin
    if Key = VK_UP then
      tvSeries.Perform(WM_KEYDOWN, VK_UP, 0);
    if Key = VK_DOWN then
      tvSeries.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if Key = VK_RETURN then
      if Key = VK_RETURN then
      begin
        tvSeriesClick(Sender);
        frmMain.ActiveControl := tvBooksS;
      end;
  end;
end;

procedure TfrmMain.edFFullNameButtonClick(Sender: TObject);
var
  frmEditor: TfrmEditor;
begin
  frmEditor := TfrmEditor.Create(self);
  try
    frmEditor.Text := (Sender as TRzButtonEdit).Text;
    if frmEditor.ShowModal = mrOk then
      (Sender as TRzButtonEdit).Text := frmEditor.Text;
  finally
    frmEditor.Free;
  end;
end;

procedure TfrmMain.edFFullNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnApplyFilterClick(Sender);
end;

procedure TfrmMain.edFGenreButtonClick(Sender: TObject);
var
  Data: PGenreData;
  Node: PVirtualNode;
begin
  FillGenresTree(frmGenreTree.tvGenresTree);
  if frmGenreTree.ShowModal = mrOk then
  begin
    edFGenre.Text := '';
    edFGenre.Hint := '';
    with frmGenreTree.tvGenresTree do
    begin
      Node := GetFirstSelected;
      while Assigned(Node) do
      begin
        Data := GetNodeData(Node);
        if edFGenre.Text = '' then
        begin
          edFGenre.Text := Data.GenreAlias;
          edFGenre.Hint := Format('(g.GenreCode = "%s")', [Data^.GenreCode]);
        end
        else
        begin
          edFGenre.Text := edFGenre.Text + '/' + Data.GenreAlias;
          edFGenre.Hint := Format('%s OR (g.GenreCode = "%s")', [edFGenre.Hint, Data^.GenreCode]);
        end;
        Node := GetNextSelected(Node, False);
      end;
    end;
  end;
end;

procedure TfrmMain.edFGenreKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(8) then
  begin
    edFGenre.Text := '';
    edFGenre.Hint := '';
  end;
  Key := chr(0);
end;

procedure TfrmMain.edLocateSeriesChange(Sender: TObject);
var
  S: string;
  OldText: string;
begin
  if FIgnoreChange or (Length(edLocateSeries.Text) = 0) then
    Exit;
  S := AnsiUpperCase(Copy(edLocateSeries.Text, 1, 1));
  if S <> FLastLetterS.Caption then
  begin
    OldText := edLocateSeries.Text;
    ChangeLetterButton(S);
    edLocateSeries.Text := OldText;
    edLocateSeries.Perform(WM_KEYDOWN, vk_Right, 0);
  end;
  if not FDoNotLocate then
    LocateSerie(edLocateSeries.Text);
end;

procedure TfrmMain.FillAuthorTree(Tree: TVirtualStringTree; FullMode: Boolean);
var
  Node: PVirtualNode;
  Data: PAuthorData;
begin
  Tree.NodeDataSize := SizeOf(TAuthorData);

  Tree.BeginUpdate;
  try
    Tree.Clear;
    dmCollection.Authors.DisableControls;

    if FullMode then
      dmCollection.Authors.Filtered := False;

    try
      dmCollection.Authors.First;

      while not dmCollection.Authors.Eof do
      begin
        Node := Tree.AddChild(nil);
        Data := Tree.GetNodeData(Node);

        Initialize(Data^);
        Data^.AuthorID := dmCollection.AuthorsID.Value;
        Data^.FirstName := dmCollection.AuthorsName.Value;
        Data^.LastName := dmCollection.AuthorsFamily.Value;
        Data^.MiddleName := dmCollection.AuthorsMiddle.Value;
        Include(Node.States, vsInitialUserData);

        dmCollection.Authors.Next;
      end;
    finally
      dmCollection.Authors.EnableControls;
    end;

    Tree.Selected[Tree.GetFirst] := True;
  finally
    Tree.EndUpdate;
    if FullMode then
      dmCollection.Authors.Filtered := True;
  end;
end;

procedure TfrmMain.FillSeriesTree;
var
  Node: PVirtualNode;
  Data: PSerieData;
begin
  tvSeries.NodeDataSize := SizeOf(TSerieData);

  tvSeries.BeginUpdate;
  try
    tvSeries.Clear;

    dmCollection.Series.DisableControls;
    try
      dmCollection.Series.First;

      if dmCollection.SeriesTitle.IsNull then
        tvBooksS.Clear;

      while not dmCollection.Series.Eof do
      begin
        Node := tvSeries.AddChild(nil);
        Data := tvSeries.GetNodeData(Node);

        Initialize(Data^);
        Data^.SerieID := dmCollection.SeriesSerieID.AsInteger;
        Data^.SerieTitle := dmCollection.SeriesTitle.AsString;
        Include(Node.States, vsInitialUserData);

        dmCollection.Series.Next;
      end;
    finally
      dmCollection.Series.EnableControls;
    end;
  finally
    tvSeries.EndUpdate;
  end;
end;

procedure TfrmMain.FillGenresTree(Tree: TVirtualStringTree; FillFB2: Boolean);
var
  genreNode: PVirtualNode;
  Data: PGenreData;
  Nodes: TStringList;
  strParentCode: string;
  nParentIndex: Integer;
  ParentNode: PVirtualNode;
begin
  Tree.NodeDataSize := SizeOf(TGenreData);

  Nodes := TStringList.Create;
  try
    Nodes.Sorted := True;

    Tree.BeginUpdate;
    try
      Tree.Clear;

      dmCollection.Genres.First;
      while not dmCollection.Genres.Eof do
      begin
        strParentCode := dmCollection.GenresParentCode.Value;

        ParentNode := nil;
        if (strParentCode <> '0') and Nodes.Find(strParentCode, nParentIndex) then
          ParentNode := PVirtualNode(Nodes.Objects[nParentIndex]);

        genreNode := Tree.AddChild(ParentNode);
        Data := Tree.GetNodeData(genreNode);

        Initialize(Data^);
        Data^.GenreAlias := dmCollection.GenresGenreAlias.Value;
        Data^.GenreCode := dmCollection.GenresGenreCode.Value;
        Data^.ParentCode := strParentCode;
        if FillFB2 then
          Data^.FB2GenreCode := dmCollection.GenresFB2Code.Value;
        Include(genreNode.States, vsInitialUserData);

        Nodes.AddObject(Data^.GenreCode, TObject(genreNode));

        dmCollection.Genres.Next;
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
  Node: PVirtualNode;
  Data: PGroupData;
begin
  tvGroups.Clear;

  DMUser.Groups.First;
  while not DMUser.Groups.Eof do
  begin
    Node := tvGroups.AddChild(nil);
    Data := tvGroups.GetNodeData(Node);

    Initialize(Data^);
    Data^.Text := DMUser.GroupsName.Value;
    Data^.GroupID := DMUser.GroupsGroupID.Value;
    Data^.CanDelete := DMUser.GroupsAllowDelete.Value;
    Include(Node.States, vsInitialUserData);

    DMUser.Groups.Next;
  end;

  // активируем последнюю группу в списке
  tvGroups.Selected[tvGroups.GetLast] := True;
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
  i: Integer;
begin
  i := (Sender as TMenuItem).Tag;
  if DMUser.ActivateCollection(i) then
  begin
    (Sender as TMenuItem).Checked := True;
    Settings.ActiveCollection := i;
    InitCollection(True);
  end;
end;

procedure TfrmMain.ExtractBookToStream(const BookRecord: TBookRecord; var FS: TMemoryStream);
var
  BookContainer: string;
  PathLen: Integer;
  FileName: string;
  Zip: TZipForge;
  F: TZFArchiveItem;
begin
  BookContainer := TPath.Combine(DMUser.ActiveCollection.RootFolder, BookRecord.Folder);
  PathLen := Length(BookContainer);

  if
    (PathLen = 0) or                                              // а вот эту строчку я вообще не понимаю :(
    (BookContainer[PathLen] = TPath.DirectorySeparatorChar) or
    (BookContainer[PathLen] = TPath.AltDirectorySeparatorChar) then
  begin
    FileName := TPath.Combine(BookContainer, BookRecord.FileName);

    if ExtractFileExt(FileName) = ZIP_EXTENSION then // fbd
    begin
      //
      // ZIP-ы рассматриваются как контейнеры для fbd
      //
      if not FileExists(FileName) then
      begin
        if IsLocal then
          raise Exception.CreateFmt('Архив "%s" не найден!', [FileName]);
        Exit;
      end;

      Zip := TZipForge.Create(Self);
      try
        Zip.FileName := FileName;
        Zip.OpenArchive;
        if Zip.FindFirst('*' + FBD_EXTENSION, F) then
          Zip.ExtractToStream(F.FileName, FS)
        else
          raise Exception.CreateFmt('В архиве "%s" не найдено описание книги!', [fileName]);
        Zip.CloseArchive;

        Exit;
      finally
        Zip.Free;
      end;
    end;

    //
    // просто файл. в этом случае рассширение хранится отдельно
    //
    FileName := FileName + BookRecord.FileExt;
    if not FileExists(FileName) then
    begin
      if IsLocal then
        raise Exception.CreateFmt('Файл "%s" не найден!', [FileName]);
      Exit;
    end;

    //
    // В настоящее время мы не можем получать никакую информацию из "сырого" файла. Т ч и читать ничего не будем
    //
    ///FS.LoadFromFile(fileName);
    Exit;
  end;

  if ExtractFileExt(BookContainer) = ZIP_EXTENSION then
  begin
    //
    // Книга находится внутри архива. Предполагается, что это fb2
    //
    if not FileExists(BookContainer) then
    begin
      if IsLocal then
        raise Exception.CreateFmt('Архив "%s" не найден!', [BookContainer]);
      Exit;
    end;

    Zip := TZipForge.Create(self);
    try
      Zip.FileName := BookContainer;
      Zip.OpenArchive;
      Zip.ExtractToStream(GetFileNameZip(Zip, BookRecord.InsideNo), FS);
      Zip.CloseArchive;
    finally
      Zip.Free;
    end;
  end;
end;

procedure TfrmMain.ShowBookInfo(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Data: PBookData;
  frmBookDetails: TfrmBookDetails;

  bookStream: TMemoryStream;
  ReviewEditable: Boolean;

  URL: string;

  R: TBookRecord;
  strReview: string;
  NewCode: Integer;
begin
  GetActiveTree(Tree);
  Assert(Assigned(Tree));

  Data := Tree.GetNodeData(Tree.FocusedNode);
  if not Assigned(Data) or (Data^.nodeType <> ntBookInfo) then
    Exit;

  FFormBusy := True;
  try
    DMCollection.GetBookRecord(Data^.BookID, Data^.DatabaseID, R, False);

    //
    // ревью можно изменять только для книг из текущей коллекции
    //
    ReviewEditable := (Data^.DatabaseID = DMUser.ActiveCollection.ID);

    frmBookDetails := TfrmBookDetails.Create(Application);
    try
      //
      // загрузим книгу в стрим и отдадим его форме для чтения из него информации
      // сейчас мы грузим только fb2 или fbd, т к больше ничего разбирать не умеем
      //
      bookStream := TMemoryStream.Create;
      try
        try
          ExtractBookToStream(R, bookStream);
          frmBookDetails.FillBookInfo(R, bookStream);
        except
          on e: Exception do
          begin
            //
            // Скорее всего произошла ошибка при чтении файла (не найден, а должен был быть)
            // или при парсинге книги (загрузили какую-то ерунду).
            // Покажем сообщение об ощибке и загрузим только библиотечную информацию

            //
            // TODO : написать и использовать стандартную функцию для показа сообщений об ошибках
            //
            Application.ShowException(e);
            frmBookDetails.FillBookInfo(R, nil);
          end;
        end;
      finally
        bookStream.Free;
      end;

      frmBookDetails.mmReview.ReadOnly := not ReviewEditable;

      if IsOnline and ReviewEditable then
      begin
        { TODO -oNickR -cLibDesc : этот URL должен формироваться обвязкой библиотеки, т к его формат может меняться }
        if DMUser.ActiveCollection.URL = '' then
          URL := Format('%sb/%d/', [Settings.InpxURL, R.LibID])
        else
          URL := Format('%sb/%d/', [DMUser.ActiveCollection.URL, R.LibID]);

        frmBookDetails.AllowOnlineReview(URL);
      end;

      if R.Code = 1 then
        //
        // ревью уже есть - покажем его
        //
        frmBookDetails.Review := DMCollection.GetReview(Data^.BookID, Data^.DatabaseID)
      else if IsOnline and ReviewEditable and Settings.AutoLoadReview then
        DownloadReview(frmBookDetails, URL);

      frmBookDetails.ShowModal;

      if not frmBookDetails.ReviewChanged then
        Exit;

      strReview := frmBookDetails.Review;
    finally
      FreeAndNil(frmBookDetails);
    end;

    NewCode := DMCollection.SetReview(Data^.BookID, Data^.DatabaseID, strReview);
    UpdateNodes(
      Data^.BookID, Data^.DatabaseID,
      procedure(BookData: PBookData)
      begin
        Assert(Assigned(BookData));
        BookData^.Code := NewCode;
      end
    );
  finally
    FFormBusy := False;
  end;
end;

procedure TfrmMain.miQuitAppClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.pmiCheckAllClick(Sender: TObject);
begin
  Selection(True);
end;

procedure TfrmMain.pmAuthorPopup(Sender: TObject);
begin
  miAddToSearch.Visible := (ActiveView <> ByGenreView);
end;

procedure TfrmMain.pmiDeselectAllClick(Sender: TObject);
begin
  Selection(False);
end;

procedure TfrmMain.pmiSelectAllClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
begin
  GetActiveTree(Tree);
  Tree.SelectAll(False);
end;

procedure TfrmMain.miGoForumClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', '"http://myhomelib.org/"', nil, nil, SW_SHOW);
end;

procedure TfrmMain.miGoSiteClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://home-lib.net/', nil, nil, SW_SHOW);
end;

procedure TfrmMain.miGoToAuthorClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookData;
  BookID: Integer;
  DatabaseID: Integer;
  FullAuthorName: string;
  BookRecord: TBookRecord;
begin
  GetActiveTree(Tree);

  Node := Tree.FocusedNode;
  Assert(Assigned(Node));

  Data := Tree.GetNodeData(Node);

  if not Assigned(Data) then
    Exit;

  if (Data^.nodeType <> ntBookInfo) then
  begin
    if not Tree.HasChildren[Node] then
      Exit;
    repeat
      Node := Tree.GetFirstChild(Node);
      Data := Tree.GetNodeData(Node);
    until (Data^.nodeType = ntBookInfo);
  end;

  Screen.Cursor := crHourGlass;
  try
    if Data^.DatabaseID <> DMUser.ActiveCollection.ID then
    begin
      BookID := Data^.BookID;
      DatabaseID := Data^.DatabaseID;
      if DMUser.SelectCollection(DatabaseID) then
      begin
        Settings.ActiveCollection := DatabaseID;
        InitCollection(True);
      end
      else
      begin
        Screen.Cursor := crDefault;
        ShowMessage('Коллекция не зарегистрирована !');
        Exit;
      end;

      DMCollection.GetBookRecord(BookID, DatabaseID, BookRecord, False);

      Assert(Length(BookRecord.Authors) > 0);
      FullAuthorName := BookRecord.Authors[0].GetFullName;
    end
    else
    begin
      Assert(Length(Data^.Authors) > 0);
      FullAuthorName := Data^.Authors[0].GetFullName;
    end;

    pgControl.ActivePageIndex := 0;
    edLocateAuthor.Text := FullAuthorName;
    LocateBook(Data.Title, False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.miCheckUpdatesClick(Sender: TObject);
var
  SL: TStringList;
  LF: TMemoryStream;
  i: Integer;
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
        HTTP.Get(InclideUrlSlash(Settings.UpdateURL) + PROGRAM_VERINFO_FILENAME, LF);
      except
        on E: EIdSocketError do
          if E.LastError = 11001 then
            ShowMessage('Проверка обновления не удалось! Сервер не найден.' + #13 + 'Код ошибки: ' + IntToStr(E.LastError))
          else
            ShowMessage('Проверка обновления не удалось! Ошибка подключения.' + #13 + 'Код ошибки: ' + IntToStr(E.LastError));
        on E: Exception do
          ShowMessage('Проверка обновления не удалось! Сервер сообщает об ошибке ' + #13 + 'Код ошибки: ' + IntToStr(HTTP.ResponseCode));
      end;
      { TODO -oNickR -cRefactoring : проверить использование файла last_version.info. Возможно он больше нигде не нужен и можно не сохранять его на диск }
      LF.SaveToFile(Settings.SystemFileName[sfAppVerInfo]);
      SL.LoadFromFile(Settings.SystemFileName[sfAppVerInfo]);
      if SL.Count > 0 then
        if CompareStr(VersionInfo.FileVersion, SL[0]) < 0 then
        begin
          S := #13;
          for i := 1 to SL.Count - 1 do
            S := S + '  ' + SL[i] + #13;

          ShowMessage('Доступна новая версия - ' + SL[0] + #13 + S + #13 + 'Посетите сайт программы для загрузки обновлений.');
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
    frmStat.LoadCollectionInfo;
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
  ActiveCollectionID: Integer;
begin
  if CheckLibUpdates(False) then
  begin
    SavePositions;

    ActiveCollectionID := DMUser.ActiveCollection.ID;
    StartLibUpdate;
    Settings.ActiveCollection := ActiveCollectionID;
    DMUser.ActivateCollection(ActiveCollectionID);
    InitCollection(True);

    RestorePositions;
  end;
end;

procedure TfrmMain.mi_dwnl_LocateAuthorClick(Sender: TObject);
var
  Data: PDownloadData;
begin
  Data := tvDownloadList.GetNodeData(tvDownloadList.FocusedNode);
  if Assigned(Data) then
  begin
    pgControl.ActivePageIndex := 0;
    edLocateAuthor.Text := Data.Author;
    LocateBook(Data.Title, False);
  end;
end;

procedure TfrmMain.N27Click(Sender: TObject);
begin
  DeleteFile(Settings.SystemFileName[sfColumnsStore]);
  SetColumns;
  SetHeaderPopUp;
end;

procedure TfrmMain.miCompactDataBaseClick(Sender: TObject);
begin
  try
    dmCollection.DBCollection.Close;
    dmCollection.DBCollection.CompactDatabase;
  except

  end;
  dmCollection.DBCollection.Open;
  DMUser.SetTableState(True);
  dmCollection.SetTableState(True);
end;

procedure TfrmMain.miConverToFBDClick(Sender: TObject);
begin
  if (ActiveView = FavoritesView) or (ActiveView = DownloadView) then
  begin
    MessageDlg('Для конвертации книги перейдите ' + #13 + 'в соответствующую коллекцию', mtWarning, [mbOk], 0);
    Exit;
  end;

  frmConvertToFBD.EditorMode := miConverToFBD.Tag <> 0;
  frmConvertToFBD.ShowModal;
end;

procedure TfrmMain.N33Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.N34Click(Sender: TObject);
var
  dirPath: string;
begin
  dirPath := ExcludeTrailingPathDelimiter(Settings.ReadPath);
  if DirectoryExists(dirPath) then
    ClearDir(dirPath);
end;

procedure TfrmMain.miEditToolbarVisibleClick(Sender: TObject);
begin
  tlbrEdit.Visible := miEditToolbarVisible.Checked;
  Settings.EditToolbarVisible := tlbrEdit.Visible;
end;

procedure TfrmMain.miExportToHTMLClick(Sender: TObject);
const
  HTMLHead = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">'#13#10 + '<html>'#13#10 + '<head>'#13#10 + '  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">'#13#10 + '  <title>MyHomeLib HTML</title>'#13#10 + '</head>'#13#10 + '<body>'#13#10;
  HTMLFoot = '</body>'#13#10 + '</html>' + #13#10;

  Ext: array [351 .. 353] of string = ('html', 'txt', 'rtf');
var
  Tree: TVirtualStringTree;
  FS: TFileStream;
  Str: AnsiString;
  Data: Pointer;
  FileName: string;
begin
  GetActiveTree(Tree);
  FileName := (Settings.TempPath + 'book_list.' + Ext[(Sender as TMenuItem).Tag]);
  FS := TFileStream.Create(FileName, fmCreate);
  try
    case (Sender as TMenuItem).Tag of
      351:
        Str := HTMLHead + Tree.ContentToHTML(tstAll) + HTMLFoot;
      352:
        Str := Tree.ContentToUnicode(tstAll, chr(9));
      353:
        Str := Tree.ContentToRTF(tstAll);
    end;
    Data := PChar(Str);
    FS.WriteBuffer(Data^, Length(Str));
  finally
    FreeAndNil(FS);
  end;
  ShellExecute(Handle, 'open', PChar(FileName), nil, nil, SW_RESTORE);
end;

procedure TfrmMain.miExportUserDataClick(Sender: TObject);
var
  SL: TStringList;
  FN: string;
  ID: Integer;
  S: string;
begin
  SL := TStringList.Create;
  try
    //
    // Группы
    //
    SL.Add('# Группы');
    DMUser.Groups.First;
    while not DMUser.Groups.Eof do
    begin
      SL.Add(Format('%s', [DMUser.GroupsName.Value]));
      DMUser.Groups.Next;
    end;

    //
    // Рейтинги
    //
    {***
    SL.Add('# Рейтинги');
    DMUser.tblRates.Filter := DB_ID_FIELD + '=' + QuotedStr(IntToStr(DMUser.ActiveCollection.ID));
    DMUser.tblRates.Filtered := True;
    DMUser.tblRates.First;
    while not DMUser.tblRates.Eof do
    begin
      dmCollection.tblBooks.Locate(BOOK_ID_FIELD, DMUser.tblRatesBookID.Value, []);
      if dmCollection.tblBooksLibID.Value <> 0 then
        ID := dmCollection.tblBooksLibID.Value
      else
        ID := dmCollection.tblBooksID.Value;

      SL.Add(Format('%d %d', [ID, DMUser.tblRatesRate.Value]));
      DMUser.tblRates.Next;
    end;
    DMUser.tblRates.Filtered := False;
    ***}

    //
    // Прочитанное
    //
    (***
    SL.Add('# Прочитанное');
    DMUser.tblFinished.Filter := DB_ID_FIELD + '=' + QuotedStr(IntToStr(DMUser.ActiveCollection.ID));
    DMUser.tblFinished.Filtered := True;
    DMUser.tblFinished.First;
    while not DMUser.tblFinished.Eof do
    begin
      dmCollection.tblBooks.Locate(BOOK_ID_FIELD, DMUser.tblFinishedBookID.Value, []);
      if dmCollection.tblBooksLibID.Value <> 0 then
        ID := dmCollection.tblBooksLibID.Value
      else
        ID := dmCollection.tblBooksID.Value;

      SL.Add(Format('%d %d', [ID, DMUser.tblFinishedProgress.Value]));
      DMUser.tblFinished.Next;
    end;
    DMUser.tblFinished.Filtered := False;
    ***)

    //
    // Избранное
    //
    SL.Add('# Избранное');

    DMUser.Groups.First;
    while not DMUser.Groups.Eof do
    begin
      DMUser.BooksByGroup.Filter := DB_ID_FIELD + '=' + QuotedStr(IntToStr(DMUser.ActiveCollection.ID));
      DMUser.BooksByGroup.Filtered := True;
      DMUser.BooksByGroup.First;
      while not DMUser.BooksByGroup.Eof do
      begin
        if DMUser.BooksByGroupLibID.Value <> 0 then
          ID := DMUser.BooksByGroupLibID.Value
        else
          ID := DMUser.BooksByGroupBookID.Value;
        SL.Add(Format('%d %s', [ID, DMUser.GroupsName.AsWideString]));
        DMUser.BooksByGroup.Next;
      end;
      DMUser.Groups.Next;
    end;

    DMUser.BooksByGroup.MasterSource := DMUser.dsGroups;

    //
    // избранное
    //
    SL.Add('# Рецензии');
    {
    dmCollection.tblExtra.MasterSource := nil;
    dmCollection.tblExtra.First;
    while not dmCollection.tblExtra.Eof do
    begin
      S := dmCollection.tblExtraReview.Value;
      StrReplace(#13#10, '~', S);
      dmCollection.tblBooks.Locate(BOOK_ID_FIELD, dmCollection.tblExtraBookID.Value, []);
      if dmCollection.tblBooksLibID.Value <> 0 then
        ID := dmCollection.tblBooksLibID.Value
      else
        ID := dmCollection.tblBooksID.Value;

      SL.Add(Format('%d %s', [ID, S]));
      dmCollection.tblExtra.Next;
    end;
    dmCollection.tblExtra.MasterSource := dmCollection.dsBooks;
    }

    if unit_Helpers.GetFileName(fnSaveUserData, FN) then
      SL.SaveToFile(FN, TEncoding.UTF8);
  finally
    SL.Free;
  end;
end;

procedure TfrmMain.HeaderPopupItemClick(Sender: TObject);
var
  i: Integer;
  Tree: TVirtualStringTree;
  Tag: Integer;
  Column: TVirtualTreeColumn;

  S: string;
  MinWidth, MaxWidth: Integer;
  Options: TVTColumnOptions;
  Alignment: TAlignment;

begin
  GetActiveTree(Tree);

  Tag := (Sender as TMenuItem).Tag;

  if (Sender as TMenuItem).Checked then
  begin // удаляем
    for i := 0 to Tree.Header.Columns.Count - 1 do
      if Tree.Header.Columns[i].Tag = Tag then
      begin
        Tree.Header.Columns.Delete(i); (Sender as TMenuItem)
        .Checked := False;
        Break;
      end;
  end
  else
  begin // добавляем
    Column := TVirtualTreeColumn.Create(Tree.Header.Columns);

    GetDefaultColumnProperties(Settings.TreeModes[Tree.Tag], Tag, S, MinWidth, MaxWidth, Alignment, Options);
    Column.Tag := Tag;
    Column.Text := S;
    Column.MinWidth := MinWidth;
    Column.MaxWidth := MaxWidth;
    Column.Alignment := Alignment;
    Column.Options := Options; (Sender as TMenuItem)
    .Checked := True;
  end;
  SaveColumns;
end;

function TfrmMain.HH(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
begin
  if Data = 0 then
    HtmlHelp(Application.Handle, PChar(Settings.SystemFileName[sfAppHelp]), HH_DISPLAY_TOC, 0)
  else
    HtmlHelp(Application.Handle, PChar(Settings.SystemFileName[sfAppHelp]), HH_HELP_CONTEXT, Data);

  CallHelp := False;
end;

procedure TfrmMain.miCollectionExportClick(Sender: TObject);
begin
  if MessageDlg('Экспорт в xml работает в режиме совместимости со старыми версиями.' + #10#13 + 'Не все данные будут сохранены. Рекомендуется использовать экспорт в inpx.' + #10#13 + 'Продолжить?', mtWarning, [mbYes, mbNo], 0) = mrNo then
    Exit;

  DMUser.ActivateCollection(Settings.ActiveCollection);
  unit_Export.Export2XML;
end;

procedure TfrmMain.miCollectionImportClick(Sender: TObject);
begin
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
    frmBases.tsConnectionInfo.TabVisible := IsOnline;
    if frmBases.ShowModal = mrOk then
    begin
      Assert(Settings.ActiveCollection = DMUser.ActiveCollection.ID);
      InitCollection(True);
    end;
  finally
    frmBases.Free;
  end;
end;

procedure TfrmMain.miReadedClick(Sender: TObject);
var
  Tree: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookData;
  NewProgress: Integer;
begin
  GetActiveTree(Tree);
  Assert(Assigned(Tree));

  Node := Tree.GetFirstSelected;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    if Assigned(Data) and (Data^.nodeType = ntBookInfo) then
    begin
      // заглушка
      NewProgress := IfThen(Data^.Progress = 0, 100, 0);

      DMCollection.SetProgress(Data^.BookID, Data^.DatabaseID, NewProgress);
      UpdateNodes(
        Data^.BookID, Data^.DatabaseID,
        procedure(BookData: PBookData)
        begin
          Assert(Assigned(BookData));
          BookData^.Progress := NewProgress;
        end
      );
    end;

    Node := Tree.GetNextSelected(Node);
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

  DMUser.SetTableState(True);
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
  i: Integer;
begin
  if ActiveView = DownloadView then
    Exit;

  GetActiveTree(Tree);

  for i := 0 to pmHeaders.Items.Count - 1 do
  begin
    pmHeaders.Items[i].Checked := False;
    pmHeaders.Items[i].Tag := ColumnTags[i];
  end;

  for i := 0 to Tree.Header.Columns.Count - 1 do
  begin
    case Tree.Header.Columns[i].Tag of
      COL_AUTHOR:
        pmHeaders.Items[0].Checked := True;
      COL_TITLE:
        pmHeaders.Items[1].Checked := True;
      COL_SERIES:
        pmHeaders.Items[2].Checked := True;
      COL_NO:
        pmHeaders.Items[3].Checked := True;
      COL_GENRE:
        pmHeaders.Items[4].Checked := True;
      COL_SIZE:
        pmHeaders.Items[5].Checked := True;
      COL_RATE:
        pmHeaders.Items[6].Checked := True;
      COL_DATE:
        pmHeaders.Items[7].Checked := True;
      COL_TYPE:
        pmHeaders.Items[8].Checked := True;
      COL_COLLECTION:
        pmHeaders.Items[9].Checked := True;
      COL_LANG:
        pmHeaders.Items[10].Checked := True;
      COL_LIBRATE:
        pmHeaders.Items[11].Checked := True;
    end;
  end;
  pmHeaders.Items[9].Visible := (Tree.Tag = PAGE_FAVORITES);
end;

procedure TfrmMain.pgControlChange(Sender: TObject);
var
  ToolBuutonVisible: Boolean;
begin
  // сбрасываем закладки быстрого поиска
  FLastFoundBook := nil;
  FFirstFoundBook := nil;

  // tbtnDownloadList_Add.Enabled := (ActiveView <> FavoritesView);
  ToolBuutonVisible := (ActiveView <> DownloadView);

  BtnFav_add.Enabled := ToolBuutonVisible;
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
  btnSwitchTreeMode.Enabled := not((ActiveView = BySeriesView) or (ActiveView = DownloadView));

  case ActiveView of
    ByAuthorView:
      begin
        FLastLetterA.Down := True;
        if FLastLetterA = FLastLetterS then
          FLastLetterS.Down := True
        else
          FLastLetterS.Down := False;
      end;
    BySeriesView:
      begin
        FLastLetterS.Down := True;
        if FLastLetterA = FLastLetterS then
          FLastLetterA.Down := True
        else
          FLastLetterA.Down := False;
      end;
  else
    begin
      FLastLetterA.Down := False;
      FLastLetterS.Down := False;
    end;
  end;

  case ActiveView of
    FavoritesView:
      begin
        miGoToAuthor.Visible := True;
        miDelFavorites.Visible := True;
        miAddFavorites.Visible := False;
        BtnFav_add.Hint := 'Удалить из группы';
        BtnFav_add.DropdownMenu := nil;
        BtnFav_add.ImageIndex := 16;
        pmiGroups.Visible := False;
        miDeleteFiles.Visible := False;
      end;
    DownloadView:
      begin
        tbtnDownloadList_Add.ImageIndex := 23;
        tbtnDownloadList_Add.Hint := 'Удалить из списка' + #13 + 'закачек';
        btnSwitchTreeMode.Enabled := False;
        Exit;
      end;
  else
    begin
      miGoToAuthor.Visible := False;
      miDelFavorites.Visible := False;
      miAddFavorites.Visible := True;
      BtnFav_add.Hint := 'Добавить в избранное';
      BtnFav_add.DropdownMenu := pmGroups;
      BtnFav_add.ImageIndex := 15;
      pmiGroups.Visible := True;
      miDeleteFiles.Visible := isOnlineCollection(DMUser.ActiveCollection.CollectionType);
    end;

  end;

  tbtnDownloadList_Add.ImageIndex := 2;
  tbtnDownloadList_Add.Hint := 'Добавить в список' + #13 + 'закачек';

  dmCollection.SetActiveTable(Ord(ActiveView));

  miEditAuthor.Enabled := (ActiveView = ByAuthorView);
  miEditSeries.Enabled := (ActiveView = ByAuthorView);

  tbtnEditSeries.Enabled := (ActiveView = ByAuthorView);
  tbtnEditAuthor.Enabled := (ActiveView = ByAuthorView);
  tlbrEdit.Enabled := (ActiveView <> FavoritesView);

  miGoToAuthor.Visible := (ActiveView <> ByAuthorView);

  SetHeaderPopUp;

  tvBooksTreeChange(nil, nil);

  btnSwitchTreeMode.ImageIndex := TreeIcons[ord(Settings.TreeModes[pgControl.ActivePageIndex])];
  btnSwitchTreeMode.Hint := TreeHints[ord(Settings.TreeModes[pgControl.ActivePageIndex])];

  Settings.ActivePage := pgControl.ActivePageIndex;
end;

procedure TfrmMain.miShowHelpClick(Sender: TObject);
var
  dummy: Boolean;
begin
  HH(0, 0, dummy);
end;

procedure TfrmMain.miPdfdjvuClick(Sender: TObject);
begin
  frmAddNonFb2.ShowModal;
  InitCollection(True);
end;

procedure TfrmMain.OnChangeLocalStatus(var Message: TLocalStatusChangedMessage);
begin
  Assert(Assigned(Message.Params));

  SetBookLocalStatus(Message.Params^.BookID, Message.Params^.DatabaseID, Message.Params^.LocalStatus);

  Dispose(Message.Params);
end;

procedure TfrmMain.SetBookLocalStatus(BookID: Integer; DatabaseID: Integer; IsLocal: Boolean);
begin
  DMCollection.SetLocal(BookID, DatabaseID, IsLocal);

  UpdateNodes(
    BookID, DatabaseID,
    procedure(BookData: PBookData)
    begin
      Assert(Assigned(BookData));
      BookData^.Local := IsLocal;
    end
  );
end;

procedure TfrmMain.miImportUserDataClick(Sender: TObject);
var
  SL: TStringList;
  FN: string;
  i: Integer;
begin
  if not GetFileName(fnOpenUserData, FN) then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    SL := TStringList.Create;
    try
      SL.LoadFromFile(FN);
      i := 0;
      while (i < SL.Count) do
      begin
        if Pos('#', SL[i]) <> 0 then
        begin
          if SL[i] = '# Группы' then
            DMUser.LoadGroups(SL, i)
          else if SL[i] = '# Рейтинги' then
            DMUser.LoadRates(SL, i)
          else if SL[i] = '# Прочитанное' then
            DMUser.LoadFinished(SL, i)
          else if SL[i] = '# Рецензии' then
            DMUser.LoadReviews(SL, i)
          else if SL[i] = '# Избранное' then
            DMUser.LoadGroupedBooks(SL, i)
          else
            Inc(i);
        end;
      end;
      FillGroupsList;
      CreateGroupsMenu;
    finally
      SL.Free;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.miINPXCollectionExportClick(Sender: TObject);
begin
  DMUser.ActivateCollection(Settings.ActiveCollection);
  unit_Export.Export2INPX;
  InitCollection(True);
end;

procedure TfrmMain.cbPresetNameChange(Sender: TObject);
begin
  btnSavePreset.Enabled := (cbPresetName.Text <> '');
end;

procedure TfrmMain.cbPresetNameSelect(Sender: TObject);
begin
  btnDeletePreset.Enabled := cbPresetName.ItemIndex >= 0;
  btnSavePreset.Enabled := True;
  LoadSearchPreset(cbPresetName.Text);
end;

procedure TfrmMain.btnStartDownloadClick(Sender: TObject);
begin
  if tvDownloadList.GetFirst = nil then
    Exit;

  btnPauseDownload.Enabled := True;
  btnStartDownload.Enabled := False;

  FDMThread := TDownloadManagerThread.Create(False);
end;

procedure TfrmMain.btnPauseDownloadClick(Sender: TObject);
begin
  btnPauseDownload.Enabled := False;
  btnStartDownload.Enabled := True;
  if Assigned(FDMThread) then
    FDMThread.Stop;
end;

procedure TfrmMain.BtnSaveClick(Sender: TObject);
begin
  tvDownloadList.SaveToFile(Settings.SystemFileName[sfDownloadsStore]);
end;

procedure TfrmMain.btnDeleteDownloadClick(Sender: TObject);
var
  Data: PDownloadData;
  i: Integer;
  List: TSelectionList;
begin
  GetSeelections(tvDownloadList, List);
  for i := 0 to tvDownloadList.SelectedCount - 1 do
  begin
    Data := tvDownloadList.GetNodeData(List[i]);
    if Data.State <> dsRun then
      tvDownloadList.DeleteNode(List[i], True);
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
    DeleteBookFromGroup(Sender)
  else
  begin
    if DMUser.ActivateGroup(1) then
      AddBookToGroup(Sender);
  end;
end;

function TfrmMain.GetBookNode(const Tree: TVirtualStringTree; BookID: Integer; DatabaseID: Integer): PVirtualNode;
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
    if (Data^.nodeType = ntBookInfo) and (Data^.BookID = BookID) and (Data^.DatabaseID = DatabaseID) then
    begin
      Result := Node;
      Exit;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

procedure TfrmMain.UpdateNodes(BookID: Integer; DatabaseID: Integer; UpdateProc: TNodeUpdateProc);
type
  TTreeArray = array of TVirtualStringTree;
var
  BookTrees: TTreeArray;
  Tree: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookData;
begin
  BookTrees := TTreeArray.Create(tvBooksA, tvBooksS, tvBooksG, tvBooksSR, tvBooksF {, tvDownloadList});
  for Tree in BookTrees do
  begin
    Node := GetBookNode(Tree, BookID, DatabaseID);
    if Assigned(Node) then
    begin
      Data := Tree.GetNodeData(Node);
      Assert(Assigned(Data));
      if Assigned(Data) then
      begin
        UpdateProc(Data);
        Tree.RepaintNode(Node);
      end;
    end;
  end;
end;

function TfrmMain.IsSelectedBookNode(Node: PVirtualNode; Data: PBookData): Boolean;
begin
  Result :=
    Assigned(Node) and Assigned(Data) and
   (Data^.nodeType = ntBookInfo) and
   ((Node^.CheckState = csCheckedNormal) or (vsSelected in Node.States));
end;

end.
