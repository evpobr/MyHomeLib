(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors             Aleksey Penkov   alex.penkov@gmail.com
  *                     Nick Rymanov     nrymanov@gmail.com
  * Created             20.08.2008
  * Description
  *
  * $Id$
  *
  * History
  * NickR 06.05.2010    Для уменьшения размера dfm и единообразия интерфейса некоторые компоненты
  *                     заменены своими версиями с заранее настроенными свойствами.
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
  unit_Interfaces,
  XMLIntf,
  XMLDoc,
  pngimage,
  jpeg,
  DB,
  DBTables,
  ZipForge,
  unit_DownloadManagerThread,
  unit_Messages,
  files_list,
  ActiveX,
  htmlhlp,
  idStack,
  idComponent,
  IdBaseComponent,
  IdHTTP,
  IdAntiFreezeBase,
  IdAntiFreeze,
  Buttons,
  MHLSplitter,
  ActnList,
  BookInfoPanel,
  ActnMan,
  MHLSimplePanel,
  BookTreeView,
  SearchPresets,
  MHLButtonedEdit,
  UserData;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    miBook: TMenuItem;
    miQuitApp: TMenuItem;
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
    miCollSelect: TMenuItem;
    miDeleteCol: TMenuItem;
    N18: TMenuItem;
    miStat: TMenuItem;
    miRead: TMenuItem;
    miDevice: TMenuItem;
    N7: TMenuItem;
    miCollsettings: TMenuItem;
    miCopyToCollection: TMenuItem;
    miFb2ZipImport: TMenuItem;
    miFb2Import: TMenuItem;
    miAbout: TMenuItem;
    miCheckUpdates: TMenuItem;
    N30: TMenuItem;
    miShowHelp: TMenuItem;
    IdAntiFreeze1: TIdAntiFreeze;
    N17: TMenuItem;
    pmAuthor: TPopupMenu;
    miCopyAuthor: TMenuItem;
    miPdfdjvu: TMenuItem;
    miBookEdit: TMenuItem;
    miRefreshGenres: TMenuItem;
    miDownloadBooks: TMenuItem;
    pmiDownloadBooks: TMenuItem;
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
    pgControl: TPageControl;
    tsSearch: TTabSheet;
    tsByGroup: TTabSheet;
    ilFileTypes: TImageList;
    tsByAuthor: TTabSheet;
    tvAuthors: TVirtualStringTree;
    pnAuthorSearch: TMHLSimplePanel;
    lblAuthorsSearch: TLabel;
    tbClearEdAuthor: TSpeedButton;
    edLocateAuthor: TEdit;
    pnAuthorBooksTitle: TMHLSimplePanel;
    lblBooksTotalA: TLabel;
    ipnlAuthors: TInfoPanel;
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
    tsBySerie: TTabSheet;
    pnSeriesView: TMHLSimplePanel;
    tvSeries: TVirtualStringTree;
    pnSerieSearch: TMHLSimplePanel;
    lblSerieSearch: TLabel;
    btnClearEdSeries: TSpeedButton;
    edLocateSeries: TEdit;
    pnSerieBooksView: TMHLSimplePanel;
    pnSerieBooksTitle: TMHLSimplePanel;
    lblBooksTotalS: TLabel;
    ipnlSeries: TInfoPanel;
    tsByGenre: TTabSheet;
    pnGenresView: TMHLSimplePanel;
    tvGenres: TVirtualStringTree;
    pnGenreBooksView: TMHLSimplePanel;
    pnGenreBooksTitle: TMHLSimplePanel;
    lblBooksTotalG: TLabel;
    lblGenreTitle: TLabel;
    ipnlGenres: TInfoPanel;
    TrayIcon: TTrayIcon;
    pmTray: TPopupMenu;
    N29: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    tsDownload: TTabSheet;
    pmDownloadList: TPopupMenu;
    mi_dwnl_LocateAuthor: TMenuItem;
    N35: TMenuItem;
    mi_dwnl_Delete: TMenuItem;
    ilToolBar_Disabled: TImageList;
    N34: TMenuItem;
    tlbrDownloadList: TToolBar;
    BtnDwnldUp: TToolButton;
    BtnDwnldDown: TToolButton;
    BtnDelete: TToolButton;
    BtnFirstRecord: TToolButton;
    BtnLastRecord: TToolButton;
    RzSpacer2: TToolButton;
    ToolButton7: TToolButton;
    lblAuthor: TLabel;
    lblSeries: TLabel;
    btnStartDownload: TToolButton;
    btnPauseDownload: TToolButton;
    Panel1: TMHLSimplePanel;
    RzPanel2: TMHLSimplePanel;
    lblDownloadState: TLabel;
    lblDnldAuthor: TLabel;
    lblDnldTitle: TLabel;
    lblDownloadCount: TLabel;
    BtnSave: TToolButton;
    N28: TMenuItem;
    N37: TMenuItem;
    miAddToSearch: TMenuItem;
    miINPXCollectionExport: TMenuItem;
    N38: TMenuItem;
    pnGroupsView: TMHLSimplePanel;
    tvGroups: TVirtualStringTree;
    RzPanel8: TMHLSimplePanel;
    pnGroupBooksView: TMHLSimplePanel;
    ipnlFavorites: TInfoPanel;
    lblTotalBooksF: TLabel;
    pmGroups: TPopupMenu;
    GroupMenuItem: TMenuItem;
    btnAddGroup: TButton;
    btnDeleteGroup: TButton;
    btnClearGroup: TButton;
    pmiGroups: TMenuItem;
    pnGroupBooksTitle: TMHLSimplePanel;
    lblBooksTotalF: TLabel;
    lblGroups: TLabel;
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
    SearchParams: TCategoryPanelGroup;
    ctpOther: TCategoryPanel;
    Label30: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbDate: TComboBox;
    cbLang: TComboBox;
    cbDownloaded: TComboBox;
    edFKeyWords: TMHLButtonedEdit;
    cbDeleted: TCheckBox;
    ctpFile: TCategoryPanel;
    Label27: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    edFFile: TMHLButtonedEdit;
    edFFolder: TMHLButtonedEdit;
    edFExt: TMHLButtonedEdit;
    pnSearchBooksView: TMHLSimplePanel;
    ipnlSearch: TInfoPanel;
    pnlFullSearch: TMHLSimplePanel;
    lblTotalBooksFL: TLabel;
    Label1: TLabel;
    cbPresetName: TComboBox;
    btnDeletePreset: TButton;
    btnSavePreset: TButton;
    btnClearFilterEdits: TButton;
    btnApplyFilter: TButton;
    BalloonHint1: TBalloonHint;
    miRepairDataBase: TMenuItem;
    N6: TMenuItem;
    miCompactDataBase: TMenuItem;
    ctpBook: TCategoryPanel;
    Label5: TLabel;
    edFFullName: TMHLButtonedEdit;
    Label24: TLabel;
    edFTitle: TMHLButtonedEdit;
    Label26: TLabel;
    edFSeries: TMHLButtonedEdit;
    edFGenre: TMHLButtonedEdit;
    Label6: TLabel;
    N31: TMenuItem;
    miFastBookSearch: TMenuItem;
    pmiSelectAll: TMenuItem;
    pbDownloadProgress: TProgressBar;
    miFBDImport: TMenuItem;
    miShowEditToolbar: TMenuItem;
    tlbrEdit: TToolBar;
    tbtnEditAuthor: TToolButton;
    tbtnEditSeries: TToolButton;
    tbtnEditGenre: TToolButton;
    tbtnEditBook: TToolButton;
    tbtnSplitter1: TToolButton;
    tbtnFBD: TToolButton;
    tbtnSplitter2: TToolButton;
    tbtnDeleteBook: TToolButton;
    tbtnAutoFBD: TToolButton;
    tbtnHelp: TToolButton;
    N46: TMenuItem;
    miExportToHTML: TMenuItem;
    txt1: TMenuItem;
    RTF1: TMenuItem;
    ToolButton5: TToolButton;
    edFAnnotation: TMHLButtonedEdit;
    Label7: TLabel;
    pnAuthorsView: TMHLSimplePanel;
    pnAuthorBooksView: TMHLSimplePanel;
    AuthorsViewSplitter: TMHLSplitter;
    AuthorBookInfoSplitter: TMHLSplitter;
    ilAlphabetNormal: TImageList;
    ilAlphabetActive: TImageList;
    Actions: TActionList;
    acShowRusAlphabet: TAction;
    acShowEngAlphabet: TAction;
    miShowRusAlphabet: TMenuItem;
    miShowEngAlphabet: TMenuItem;
    acShowEditToolbar: TAction;
    N49: TMenuItem;
    acShowMainToolbar: TAction;
    acShowStatusbar: TAction;
    miShowMainToolbar: TMenuItem;
    miShowStatusbar: TMenuItem;
    miView: TMenuItem;
    acShowBookInfoPanel: TAction;
    miShowBookInfo: TMenuItem;
    SeriesViewSplitter: TMHLSplitter;
    SerieBookInfoSplitter: TMHLSplitter;
    GenresViewSplitter: TMHLSplitter;
    GenreBookInfoSplitter: TMHLSplitter;
    SearchViewSplitter: TMHLSplitter;
    SearchBookInfoSplitter: TMHLSplitter;
    pnSearchView: TMHLSimplePanel;
    pnSearchControl: TMHLSimplePanel;
    GroupsViewSplitter: TMHLSplitter;
    GroupBookInfoSplitter: TMHLSplitter;
    ToolButton2: TToolButton;
    tbtnClear: TToolButton;
    tvBooksA: TBookTree;
    tvBooksS: TBookTree;
    tvBooksG: TBookTree;
    tvBooksSR: TBookTree;
    tvBooksF: TBookTree;
    tvDownloadList: TBookTree;
    acShowBookCover: TAction;
    acShowBookAnnotation: TAction;
    miViewExtra: TMenuItem;
    miShowBookCover: TMenuItem;
    miShowBookAnnotation: TMenuItem;
    acBookSetRate1: TAction;
    acBookSetRate2: TAction;
    acBookSetRate3: TAction;
    acBookSetRate4: TAction;
    acBookSetRate5: TAction;
    acBookSetRateClear: TAction;
    acGroupCreate: TAction;
    acGroupDelete: TAction;
    acGroupClear: TAction;
    StatusBar: TStatusBar;
    ilToolImages: TImageList;
    acSavePreset: TAction;
    acDeletePreset: TAction;
    acApplyPreset: TAction;
    acClearPreset: TAction;
    acEditAuthor: TAction;
    acEditSerie: TAction;
    acEditGenre: TAction;
    acEditBook: TAction;
    acEditConver2FBD: TAction;
    acEditAutoConver2FBD: TAction;
    N36: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    FBD1: TMenuItem;
    FBD2: TMenuItem;
    acGroupEdit: TAction;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    pmGroupActions: TPopupMenu;
    N9: TMenuItem;
    N26: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    tbarAuthorsRus: TToolBar;
    tbarAuthorsEng: TToolBar;
    tbarSeriesEng: TToolBar;
    tbarSeriesRus: TToolBar;
    acBookRead: TAction;
    acBookSend2Device: TAction;
    acBookAdd2DownloadList: TAction;
    acBookMarkAsRead: TAction;
    acBookAdd2Favorites: TAction;
    acBookAdd2Group: TAction;
    acBookRemoveFromGroup: TAction;
    acBookShowInfo: TAction;
    acBookCopy2Collection: TAction;
    acBookDelete: TAction;
    acApplicationExit: TAction;
    acCollectionNew: TAction;
    acCollectionSelect: TAction;
    acCollectionProperties: TAction;
    acCollectionStatistics: TAction;
    acCollectionDelete: TAction;
    acViewTreeView: TAction;
    acViewTableView: TAction;
    acViewHideDeletedBooks: TAction;
    acViewShowLocalOnly: TAction;
    acToolsQuickSearch: TAction;
    acToolsUpdateOnlineCollections: TAction;
    acToolsClearReadFolder: TAction;
    acToolsRunScript: TAction;
    acToolsSettings: TAction;
    acHelpHelp: TAction;
    acHelpCheckUpdates: TAction;
    acHelpProgramSite: TAction;
    acHelpSupportForum: TAction;
    acHelpAbout: TAction;
    N60: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    acViewTreeView1: TMenuItem;
    acViewTableView1: TMenuItem;
    acViewSelectColumns: TAction;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N16: TMenuItem;
    acImportFb2Zip: TAction;
    acImportFb2: TAction;
    acImportNonFB2: TAction;
    acImportFBD: TAction;
    acImportUserData: TAction;
    acExport2HTML: TAction;
    acExport2Txt: TAction;
    acExport2RTF: TAction;
    acExport2INPX: TAction;
    acExportUserData: TAction;
    acCollectionUpdateGenres: TAction;
    acCollectionSyncFiles: TAction;
    acCollectionRepair: TAction;
    acCollectionCompact: TAction;

    //
    // События формы
    //
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);

    //
    // Список авторов
    //
    procedure tvAuthorsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FreeAuthorNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GetAuthorNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure tvAuthorsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvAuthorsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    //
    // Список серий
    //
    procedure tvSeriesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FreeSerieNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GetSerieNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure tvSeriesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvSeriesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    //
    // Список жанров
    //
    procedure tvGenresChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FreeGenreNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GetGenreNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure tvGenresGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvGenresKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    //
    // Список групп
    //
    procedure tvGroupsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvGroupsDragDrop(Sender: TBaseVirtualTree; Source: TObject; DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);
    procedure tvGroupsDragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
    procedure FreeGroupNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GetGroupNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure tvGroupsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvGroupsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    //
    // Список книг
    //
    procedure OnBooksTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure GetBookNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure FreeBookNodeDate(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure OnBooksTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);

    //
    //
    //
    procedure tvBooksTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure tvBooksTreeAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellRect: TRect);

    //
    // Меню "Книга"
    //
    procedure ReadBookExecute(Sender: TObject);
    procedure SendToDeviceExecute(Sender: TObject);
    procedure Add2DownloadListExecute(Sender: TObject);
    procedure MarkAsReadedExecute(Sender: TObject);
    procedure BookSetRateExecute(Sender: TObject);
    procedure DeleteBookExecute(Sender: TObject);
    procedure QuitAppExecute(Sender: TObject);

    //
    // Меню "Коллекция"
    //
    procedure ShowNewCollectionWizard(Sender: TObject);
    procedure ShowCollectionSettingsExecute(Sender: TObject);
    procedure ShowCollectionStatisticsExecute(Sender: TObject);
    procedure ImportFb2ZipExecute(Sender: TObject);
    procedure ImportFb2Execute(Sender: TObject);
    procedure ImportFb2Update(Sender: TObject);
    procedure ImportNonFB2Execute(Sender: TObject);
    procedure ImportFBDExecute(Sender: TObject);
    procedure ImportNonFB2Update(Sender: TObject);
    procedure ImportUserDataExecute(Sender: TObject);
    procedure Export2HTMLExecute(Sender: TObject);
    procedure Export2INPXExecute(Sender: TObject);
    procedure ExportUserDataExecute(Sender: TObject);
    procedure UpdateGenresExecute(Sender: TObject);
    procedure SyncFilesExecute(Sender: TObject);
    procedure RepairDataBaseExecute(Sender: TObject);
    procedure CompactDataBaseExecute(Sender: TObject);
    procedure DeleteCollectionExecute(Sender: TObject);
    procedure AddGroupExecute(Sender: TObject);
    procedure AddGroupUpdate(Sender: TObject);
    procedure RenameGroupExecute(Sender: TObject);
    procedure EditGroupUpdate(Sender: TObject);
    procedure ClearGroupExecute(Sender: TObject);
    procedure ClearGroupUpdate(Sender: TObject);
    procedure DeleteGroupExecute(Sender: TObject);

    //
    // Меню "Редактирование"
    //
    procedure EditBookExecute(Sender: TObject);
    procedure Conver2FBDExecute(Sender: TObject);
    procedure EditAuthorExecute(Sender: TObject);
    procedure EditAuthorUpdate(Sender: TObject);
    procedure EditSeriesExecute(Sender: TObject);
    procedure EditSerieUpdate(Sender: TObject);
    procedure EditGenresExecute(Sender: TObject);
    procedure EditGenreUpdate(Sender: TObject);

    //
    // Меню "Вид"
    //
    procedure ShowMainToolbarExecute(Sender: TObject);
    procedure ShowMainToolbarUpdate(Sender: TObject);
    procedure ShowEditToolbarExecute(Sender: TObject);
    procedure ShowEditToolbarUpdate(Sender: TObject);
    procedure ShowRusAlphabetExecute(Sender: TObject);
    procedure ShowRusAlphabetUpdate(Sender: TObject);
    procedure ShowEngAlphabetExecute(Sender: TObject);
    procedure ShowEngAlphabetUpdate(Sender: TObject);
    procedure ShowStatusbarExecute(Sender: TObject);
    procedure ShowStatusbarUpdate(Sender: TObject);
    procedure ShowBookInfoPanelExecute(Sender: TObject);
    procedure ShowBookInfoPanelUpdate(Sender: TObject);
    procedure ShowBookCoverExecute(Sender: TObject);
    procedure ShowBookCoverUpdate(Sender: TObject);
    procedure ShowBookAnnotationExecute(Sender: TObject);
    procedure ShowBookAnnotationUpdate(Sender: TObject);
    procedure HideDeletedBooksExecute(Sender: TObject);
    procedure HideDeletedBooksUpdate(Sender: TObject);
    procedure ShowLocalOnlyExecute(Sender: TObject);
    procedure ShowLocalOnlyUpdate(Sender: TObject);

    //
    // Меню "Инструменты"
    //
    procedure QuickSearchExecute(Sender: TObject);
    procedure UpdateOnlineCollectionExecute(Sender: TObject);
    procedure ClearReadFolderExecute(Sender: TObject);
    procedure ChangeSettingsExecute(Sender: TObject);

    //
    // Меню "Помощь"
    //
    procedure ShowHelpExecute(Sender: TObject);
    procedure CheckUpdatesExecute(Sender: TObject);
    procedure GoForumExecute(Sender: TObject);
    procedure GoSiteExecute(Sender: TObject);
    procedure ShowAboutExecute(Sender: TObject);

    //
    //
    //
    procedure tbSelectAllClick(Sender: TObject);
    procedure pmiCheckAllClick(Sender: TObject);
    procedure pmiDeselectAllClick(Sender: TObject);
    procedure miCopyClBrdClick(Sender: TObject);

    //
    // Работа с группами
    //
    procedure AddBookToGroup(Sender: TObject);
    procedure DeleteBookFromGroup(Sender: TObject);

    //
    // Работа с Search Preset-ами
    //
    procedure cbPresetNameSelect(Sender: TObject);
    procedure DoClearFilter(Sender: TObject);
    procedure DoApplyFilter(Sender: TObject);
    procedure PresetFieldKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ShowGenreEditor(Sender: TObject);
    procedure edFGenreKeyPress(Sender: TObject; var Key: Char);
    procedure ShowExpressionEditor(Sender: TObject);
    procedure SaveSearchPreset(Sender: TObject);
    procedure DeleteSearchPreset(Sender: TObject);
    procedure SavePresetUpdate(Sender: TObject);
    procedure DeletePresetUpdate(Sender: TObject);

    //
    //
    //
    procedure tbCollapseClick(Sender: TObject);
    procedure edLocateAuthorChange(Sender: TObject);
    procedure edLocateSeriesChange(Sender: TObject);
    procedure miActiveCollectionClick(Sender: TObject);
    procedure CopyToCollectionClick(Sender: TObject);
    procedure miGoToAuthorClick(Sender: TObject);
    procedure ShowBookInfo(Sender: TObject);
    procedure miCopyAuthorClick(Sender: TObject);
    procedure pgControlChange(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);

    procedure btnSwitchTreeModeClick(Sender: TObject);
    //
    //
    //
    procedure tvBooksTreeHeaderClick(Sender: TVTHeader; Column: TColumnIndex; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvBooksTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure tvBooksTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure tvBooksTreeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvBooksTreeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbClearEdAuthorClick(Sender: TObject);
    procedure btnClearEdSeriesClick(Sender: TObject);
    procedure tvBooksTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure HeaderPopupItemClick(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure InfoPanelResize(Sender: TObject);
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
    procedure MoveDwnldListNodes(Sender: TObject);
    procedure BtnFav_addClick(Sender: TObject);
    procedure tvDownloadListPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure BtnSaveClick(Sender: TObject);
    procedure edLocateAuthorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure miAddToSearchClick(Sender: TObject);
    procedure pmAuthorPopup(Sender: TObject);
    procedure GroupMenuItemClick(Sender: TObject);
    procedure miDeleteFilesClick(Sender: TObject);
    procedure pmiSelectAllClick(Sender: TObject);
    procedure tbtnAutoFBDClick(Sender: TObject);
    procedure GetDownloadNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure FreeDownloadNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure AuthorLinkClicked(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure GenreLinkClicked(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure SerieLinkClicked(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure UpdateBookAction(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure StatusBarResize(Sender: TObject);

  protected
    procedure WMGetSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure OnChangeLocalStatus(var Message: TLocalStatusChangedMessage); message WM_MHL_CHANGELOCALSTATUS;

  private type
    TView = (AuthorsView, SeriesView, GenresView, SearchView, FavoritesView, DownloadView);

    TSortSetting = record
      Column: TColumnIndex;
      Direction: TSortDirection;
    end;

  private
    FDMThread: TDownloadManagerThread;

    function IsSelectedBookNode(Node: PVirtualNode; Data: PBookRecord): Boolean;

    //
    // Построение деревьев
    //
    procedure FillBooksTree(
      const Tree: TBookTree;
      const BookIterator: IBookIterator;
      ShowAuth: Boolean;
      ShowSer: Boolean;
      SelectedID: PBookKey
    ); overload;

    //
    // TODO -oNickR -cRefactoring : вынести эти методы в соответствующие датамодули
    //
    procedure ReadINIData;

    function GetViewTree(view: TView): TBookTree;
    procedure GetActiveTree(var Tree: TBookTree);
    procedure Selection(SelState: Boolean);
    procedure LocateAuthor(const Text: string);
    procedure LocateSerie(const Text: string);

    procedure CloseCollection;
    procedure InitCollection(ApplyAuthorFilter: Boolean);

    procedure CreateCollectionMenu;
    procedure CreateScriptMenu;
    procedure SetColors;
    procedure CreateAlphabetToolbar;

    // Handlers:
    procedure OnReadBookHandler(const BookRecord: TBookRecord);
    procedure OnSelectBookHandler(MoveForward: Boolean);
    procedure OnGetBookHandler(var BookRecord: TBookRecord);
    procedure OnUpdateBookHandler(const BookRecord: TBookRecord);
    procedure OnChangeBook2ZipHandler(const BookRecord: TBookRecord);
    function OnHelpHandler(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
    procedure OnImportUserDataHandler(const UserDataSource: TUserData);

  private type
    TNodeProcessProc = reference to procedure(Tree: TBookTree; Node: PVirtualNode);
    TNodeUpdateProc = reference to procedure(Data: PBookRecord);

  strict private
    //
    // Проверяет возможность редактирования информации (о книге, если задано).
    // В случае если книга из онлайн коллекции предлагает перейти на сайт для изменения информации там
    //
    function IsLibRusecEdit(BookID: Integer): Boolean;

    //
    // Применяет операцию ProcessProc ко всем помеченным нодам или (ели ничего не отмечено) к текущей ноде.
    // Note: После применения ноды автоматически не обновляются!!!
    //
    procedure ProcessNodes(ProcessProc: TNodeProcessProc);

    //
    // Обновить во всех деревьях ноду BookID:DatabaseID (если есть).
    // Обновления не должны менять положение ноды в дереве.
    //
    procedure UpdateNodes(const BookKey: TBookKey; UpdateProc: TNodeUpdateProc);

    //
    // Обновить статус книги (присутствует локально)
    //
    procedure SetBookLocalStatus(const BookKey: TBookKey; IsLocal: Boolean);

    //
    // Восстанавить тулбар в правильной позиции
    //
    procedure ChangeToolbarVisability(ToolBars: array of TToolBar; ToolBar: TToolBar; ShowToolbar: Boolean);

    //
    // Проверяет, не является ли текущая коллекция онлайн-коллекцией.
    // Для онлайн-коллекции запрещает и прячет Action.
    // Результат: True - Action был обновлен
    //
    function UpdateEditAction(Action: TAction): Boolean;

    //
    // Проверяет, что текущий режим просмотра "по группа" и соответственно разрешает или запрещает
    //
    function InternalUpdateGroupAction(Action: TAction): Boolean;

    //
    // Возвращает кнопку, соответствующую заданному фильтру.
    //
    function GetFilterButton(ToolBars: array of TToolBar; const Filter: string): TToolButton;

    //
    // Обработчик события для кнопок алфавитного тулбара на странице "Авторы"
    //
    function InternalSetAuthorFilter(Button: TToolButton): string;
    procedure OnSetAuthorFilter(Sender: TObject);

    //
    // Обработчик события для кнопок алфавитного тулбара на странице "Серии"
    //
    function InternalSetSerieFilter(Button: TToolButton): string;
    procedure OnSetSerieFilter(Sender: TObject);

  public
    procedure OnSetControlsStateHandler(State: Boolean);

    procedure LocateBook(const Text: string; MoveForward: Boolean);

    procedure SetFormState;

  private
    FSelectionState: Boolean;

    FAutoCheck: Boolean;
    FFormBusy: Boolean;

    FFileOpMode: (fmFb2Zip, fmFb2);

    FMainBars: array [0 .. 1] of TToolBar;
    FAuthorBars: array [0 .. 1] of TToolBar;
    FSerieBars: array [0 .. 1] of TToolBar;

    FLastLetterA: TToolButton;
    FLastLetterS: TToolButton;

    FSortSettings: array [0 .. 5] of TSortSetting;

    FStarImage: TPngImage;
    FEmptyStarImage: TPngImage;

    FLastFoundBook: PVirtualNode;
    FFirstFoundBook: PVirtualNode;

    //
    // автор и серия, которым _реально_ принадлежат книги, показываемые сейчас в списке
    // т. к. обновление списка происходит с задержкой, значения могут не совпадать в ID выбранных элементов
    //
    FLastAuthorID: Integer;
    FLastAuthorBookID: TBookKey;
    FLastSeriesID: Integer;
    FLastSeriesBookID: TBookKey;
    FLastGenreCode: string;
    FLastGenreIsContainer: Boolean;
    FLastGenreBookID: TBookKey;
    FLastGroupID: Integer;
    FLastGroupBookID: TBookKey;

    // SB
    FStatusProgressBar: TProgressBar;
    // SB

    FPresets: TSearchPresets;

    // Filters for the iterators:
    FSearchCriteria: TBookSearchCriteria;

    function AuthorBookFilter: TFilterValue;
    function SeriesBookFilter: TFilterValue;
    function GenreBookFilter: TFilterValue;
    function GroupBookFilter: string;

    //
    function GetBookNode(const Tree: TBookTree; const BookKey: TBookKey): PVirtualNode; overload;

    procedure FillBookIdList(const Tree: TBookTree; var BookIDList: TBookIdList);
    procedure ClearLabels(Tag: Integer; Full: Boolean);
    procedure FillAllBooksTree;
    procedure ChangeLetterButton(const S: string);
    function CheckLibUpdates(Auto: Boolean): Boolean;
    procedure SetInfoPanelHeight(Height: Integer);
    procedure SetInfoPanelVisible(State: Boolean);
    procedure SetShowBookCover(State: Boolean);
    procedure SetShowBookAnnotation(State: Boolean);
    procedure SetColumns;
    procedure SaveColumns;
    function GetTreeTag(const Sender: TBaseVirtualTree; const Column: Integer): Integer;
    function GetText(Tag: Integer; Data: PBookRecord): string;
    procedure SetHeaderPopUp;
    procedure DownloadBooks;
    function CheckActiveDownloads: Boolean;
    procedure TheFirstRun;

    function GetActiveView: TView;
    procedure StartLibUpdate;
    procedure CreateGroupsMenu;
    procedure SaveMainFormSettings;

    procedure UpdatePositions;

    function ShowNCWizard: Boolean;
    procedure LoadLastCollection;
    procedure SetShowStatusProgress(const Value: Boolean);
    procedure SetStatusProgress(const Value: Integer);
    function GetShowStatusProgress: Boolean;
    function GetStatusProgress: Integer;
    function GetStatusMessage: string;
    procedure SetStatusMessage(const Value: string);
    property ActiveView: TView read GetActiveView;

    property ShowStatusProgress: Boolean read GetShowStatusProgress write SetShowStatusProgress;
    property StatusMessage: string read GetStatusMessage write SetStatusMessage;
    property StatusProgress: Integer read GetStatusProgress write SetStatusProgress;
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
  Character,
  Generics.Collections,
  Math,
  fictionbook_21,
  unit_FB2Utils,
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
  unit_Errors,
  frm_NCWizard,
  frm_editor,
  unit_SearchUtils,
  unit_WriteFb2Info,
  frm_ConverToFBD,
  frmEditAuthorEx,
  unit_Lib_Updates,
  frm_EditGroup,
  unit_SystemDatabase;

resourcestring
  rstrFileNotFoundMsg = 'Файл %s не найден!' + CRLF + 'Проверьте настройки коллекции!';
  rstrCreatingFilter = 'Подготовка фильтра ...';
  rstrApplyingFilter = 'Применяем фильтр ...';
  rstrNoUpdatesAvailable = 'Нет доступных обновлений';
  rstrCannotEditFavoritesError = 'Редактирование книг из избранного или списка закачек невозможно.';
  rstrUnableDeleteBuiltinGroupError = 'Нельзя удалить встроенную группу!';
  rstrCheckingUpdates = 'Проверка обновлений ...';
  rstrGroupAlreadyExists = 'Группа с таким именем уже существует!';
  rstrAdding2GroupMessage = 'Добавляем книги в группу...';
  rstrRemovingFromGroupMessage = 'Удаляем книги из группы...';
  rstrBuildingListMessage = 'Построение списка ...';

  rstrHintTable = 'Переключится в режим "Таблица"';
  rstrHintTree = 'Переключится в режим "Дерево"';
  rstrShuttingDown = 'отключаемся';
  rstrNeedDBUpgrade = 'Вы успешно обновили программу. Для нормальной работы необходимо обновить струткуру таблиц БД. Сделать это прямо сейчас?';
  rstrFirstRun = 'MyHomeLib - первый запуск';
  rstrToConvertChangeCollection = 'Для конвертирования книги перейдите в соответствующую коллекцию';
  rstrCollectionFileNotFound = 'Файл коллекции "%s" не найден.' + CRLF + 'Невозможно запустить программу.';
  // rstrStartCollectionUpdate = 'Доступно обновление коллекций.' + CRLF + ' Начать обновление ?';
  rstrStarting = 'Старт ...';
  rstrUnfinishedDownloads = 'В списке есть незавершенные закачки!' + CRLF + 'Вы все еще хотите выйти из программы?';
  rstrSingleSeries = 'Серия: ';
  rstrDownloadStateWaiting = 'Ожидание';
  rstrDownloadStateDownloading = 'Закачка';
  rstrDownloadStateDone = 'Готово';
  rstrDownloadStateError = 'Ошибка';
  rstrNoBookSelected = 'Ни одной книги не выбрано!';
  rstrProvideThePath = 'Укажите путь';
  rstrCheckUsage = 'Проверить использование, возможна ошибка';
  rstrBuildingTheList = 'Построение списка ...';
  rstrChangeCollectionToRemoveABook = 'Для удаления книги перейдите в соответствующую коллекцию';
  rstrRemoveSelectedBooks = 'Удалить отмеченные книги?';
  rstrRemoveCollection = 'Удалить коллекцию ';
  rstrGoToLibrarySite = 'Изменения информации о книгах в онлайн-коллекциях возможно только на сайте.' + CRLF + 'Перейти на сайт электронной библиотеки "%s"?';
  rstrUnableToEditBooksFromFavourites = 'Редактирование книг из избранного невозможно.';
  rstrCreateMoveSeries = 'Создание серии / Перенос в серию';
  rstrTitle = 'Название:';
  rstrEditSeries = 'Редактирование серии';
  rstrAddingBookToGroup = 'Добавляем книги в группу...';
  rstrRemovingBookFromGroup = 'Удаляем книги из группы...';
  rstrNeedSpecialDataTypeForSeries = 'Необходимо использовать отдельный тип данных для серии';
  rstrBookNotFoundInArchive = 'В архиве "%s" не найдено описание книги!';
  rstrCollectionNotRegistered = 'Коллекция не зарегистрирована !';
  rstrUpdateFailedServerNotFound = 'Проверка обновления не удалось! Сервер не найден.' + CRLF + 'Код ошибки: %d';
  rstrUpdateFailedConnectionError = 'Проверка обновления не удалось! Ошибка подключения.' + CRLF + 'Код ошибки: %d';
  rstrUpdateFailedServerError = 'Проверка обновления не удалось! Сервер сообщает об ошибке ' + CRLF + 'Код ошибки: %d';
  rstrFoundNewAppVersion = 'Доступна новая версия - "%s" Посетите сайт программы для загрузки обновлений.';
  rstrLatestVersion = 'У вас самая свежая версия.';
  rstrRemoveFromGroup = 'Удалить из группы';
  rstrRemoveFromDownloadList = 'Удалить из списка закачек';
  rstrAddToFavorites = 'Добавить в избранное';
  rstrAddToDownloads = 'Добавить в список закачек';
  rstrCollectionUpdateAvailable = 'Доступно обновление для коллекций.' + CRLF + ' Начать обновление ?';
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
  TreeHints: array [0 .. 1] of string = (rstrHintTable, rstrHintTree);

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

procedure TfrmMain.WMGetSysCommand(var Message: TMessage);
begin
  if Message.Msg = WM_Destroy then
  begin
    ShowMessage(rstrShuttingDown);
    inherited;
  end;

  if (Message.wParam = SC_MINIMIZE) and Settings.MinimizeToTray then
  begin
    TrayIcon.Visible := True;
    Hide;
  end
  else
    inherited;
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

    (* REMOVE
    if Settings.TreeModes[PAGE_FILTER] = tmTree then
      Columns.Load(SECTION_FL_TREE, tmTree)
    else
      Columns.Load(SECTION_FL_FLAT, tmFlat);
    *)

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

    (* REMOVE
    if Settings.TreeModes[PAGE_FILTER] = tmTree then
      Columns.Save(SECTION_FL_TREE)
    else
      Columns.Save(SECTION_FL_FLAT);
    *)

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
//var
//  i: Integer;
begin
  {
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
  }
end;

procedure TfrmMain.SetColors;
var
  BGColor: TColor;
  TreeFontSize: Integer;
  FontColor: TColor;

  procedure SetTreeViewColor(AControl: TBookTree);
  begin
    AControl.Color := BGColor;
    AControl.Font.Size := TreeFontSize;
    AControl.Font.Color := FontColor;
  end;

  procedure SetTreeViewColor2(AControl: TVirtualStringTree);
  begin
    AControl.Color := BGColor;
    AControl.Font.Size := TreeFontSize;
    AControl.Font.Color := FontColor;
  end;

  {
  procedure SetEditColor(AControl: TRzEdit);
  begin
    AControl.Color := BGColor;
    AControl.Font.Color := FontColor;
  end;
  }
begin
  BGColor := Settings.BGColor;
  TreeFontSize := Settings.TreeFontSize;
  FontColor := Settings.FontColor;

  SetTreeViewColor2(tvAuthors);
  SetTreeViewColor(tvBooksA);
  SetTreeViewColor2(tvSeries);
  SetTreeViewColor(tvBooksS);
  SetTreeViewColor2(tvGenres);
  SetTreeViewColor(tvBooksG);
  SetTreeViewColor(tvBooksSR);
  SetTreeViewColor2(tvGroups);
  SetTreeViewColor(tvBooksF);
  SetTreeViewColor(tvDownloadList);

  //SetEditColor(edFFullName);
  //SetEditColor(edFTitle);
  //SetEditColor(edFSeries);
  //SetEditColor(edFGenre);
  //SetEditColor(edFFile);
  //SetEditColor(edFFolder);
  //SetEditColor(edFExt);
  //SetEditColor(edFKeyWords);
  //SetEditColor(edFAnnotation);
end;

procedure TfrmMain.ReadINIData;
begin
  Settings.LoadSettings;

  SetColors;

  //
  // Синхронизация с настройками
  //
  tlbrMain.Visible := Settings.ShowToolbar;
  tlbrEdit.Visible := Settings.EditToolBarVisible;
  tbarAuthorsRus.Visible := Settings.ShowRusBar;
  tbarSeriesRus.Visible := Settings.ShowRusBar;
  tbarAuthorsEng.Visible := Settings.ShowEngBar;
  tbarSeriesEng.Visible := Settings.ShowEngBar;
  StatusBar.Visible := Settings.ShowStatusBar;
  SetInfoPanelHeight(Settings.InfoPanelHeight);
  SetInfoPanelVisible(Settings.ShowInfoPanel);
  SetShowBookCover(Settings.ShowBookCover);
  SetShowBookAnnotation(Settings.ShowBookAnnotation);

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

  pnAuthorsView.Width := Settings.Splitters[0];
  pnSeriesView.Width := Settings.Splitters[1];
  pnGenresView.Width := Settings.Splitters[2];
  pnSearchView.Width := Settings.Splitters[3];
  pnGroupsView.Width := Settings.Splitters[4];

  ctpBook.Collapsed := Settings.BookSRCollapsed;
  ctpFile.Collapsed := Settings.FileSRCollapsed;
  ctpOther.Collapsed := Settings.OtherSRCollapsed;
end;

(*

SELECT DISTINCT
   Author_List.BookID
FROM
  Authors a INNER JOIN Author_List b ON (a.AuthorID = b.AuthorID)
WHERE
  UPPER(
    LastName +
    CASE WHEN FirstName IS NULL THEN '' ELSE ' ' END + FirstName +
    CASE WHEN MiddleName IS NULL THEN '' ELSE ' ' END + MiddleName
  ) LIKE "ААРХ%"

intersect

SELECT DISTINCT B1."BookID", B1."SeriesID"
FROM "Books" B1
 INNER JOIN "Genre_List"  G5 ON (B1."BookID" = G5."BookID")
 INNER JOIN "Genres"      G6 ON (G5."GenreCode" = G6."GenreCode")
WHERE
  (G6.GenreCode = "0.3.4")

intersect

SELECT DISTINCT B1."BookID", B1."SeriesID"
FROM "Books" B1
 INNER JOIN "Series"      S7 ON (B1."SeriesID" = S7."SeriesID")
WHERE
  (UPPER(S7.SeriesTitle) LIKE "ИЗ%")

intersect

SELECT DISTINCT B1."BookID", B1."SeriesID"
FROM "Books" B1
WHERE
  (UPPER(b1.Title) LIKE "Д%")

*)

procedure TfrmMain.DoApplyFilter(Sender: TObject);
var
  SavedCursor: TCursor;
  BookIterator: IBookIterator;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    StatusMessage := rstrCreatingFilter;
    try
      tvBooksSR.Clear;
      ClearLabels(tvBooksSR.Tag, True);

      try
        FSearchCriteria.FullName := edFFullName.Text;
        FSearchCriteria.Series := edFSeries.Text;
        FSearchCriteria.Annotation := edFAnnotation.Text;
        FSearchCriteria.Genre := edFGenre.Hint;
        FSearchCriteria.Title := edFTitle.Text;
        FSearchCriteria.FileName := edFFile.Text;
        FSearchCriteria.Folder := edFFolder.Text;
        FSearchCriteria.FileExt := edFExt.Text;
        FSearchCriteria.Lang := cbLang.Text;
        FSearchCriteria.Keyword := edFKeyWords.Text;
        FSearchCriteria.DownloadedIdx := cbDownloaded.ItemIndex;
        FSearchCriteria.Deleted := cbDeleted.Checked;

        FSearchCriteria.DateIdx := cbDate.ItemIndex;
        if FSearchCriteria.DateIdx= -1 then
          FSearchCriteria.DateText := cbDate.Text;

        BookIterator := GetActiveBookCollection.Search(FSearchCriteria, False);

        // Ставим фильтр
        StatusMessage := rstrApplyingFilter;
        FillBooksTree(tvBooksSR, BookIterator, True, True, nil);
      except
        on E: Exception do
          MHLShowError(rstrFilterParamError);
      end;
    finally
      StatusMessage := rstrReadyMessage;
    end;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.DoClearFilter(Sender: TObject);
begin
  edFFullName.Text := '';
  edFTitle.Text := '';
  edFSeries.Text := '';
  edFGenre.Text := '';
  edFGenre.Hint := '';
  edFAnnotation.Text := '';

  edFFile.Text := '';
  edFFolder.Text := '';
  edFExt.Text := '';

  cbDownloaded.ItemIndex := 0;
  edFKeyWords.Text := '';
  cbDeleted.Checked := False;
  cbDate.ItemIndex := -1;
  cbLang.ItemIndex := -1;

  cbPresetName.ItemIndex := -1;

  tvBooksSR.Clear;
  ClearLabels(PAGE_SEARCH, True);
end;

function TfrmMain.GetActiveView: TView;
const
  //
  // ВНИМАНИЕ!!! Порядок и количество элементов массива views должно совпадать с порядком и количеством закладок
  //
  views: array [0 .. 5] of TView = (AuthorsView, SeriesView, GenresView, SearchView, FavoritesView, DownloadView);

begin
  Result := views[pgControl.ActivePageIndex];
end;

procedure TfrmMain.OnSetControlsStateHandler(State: Boolean);
begin
  frmMain.Enabled := State;
end;

procedure TfrmMain.CloseCollection;
var
  FCursor: TCursor;
//  BookCollection: TBookCollection;
begin
  FCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    //
    // TODO : сохранить позиции
    //

    tvAuthors.Clear;
    tvSeries.Clear;
    tvGenres.Clear;
    tvBooksSR.Clear;
    tvBooksF.Clear;

    SetTextNoChange(edLocateAuthor, '');
    SetTextNoChange(edLocateSeries, '');

    FLastAuthorID := MHL_INVALID_ID;
    FLastAuthorBookID.Clear;

    FLastSeriesID := MHL_INVALID_ID;
    FLastSeriesBookID.Clear;

    FLastGenreCode := '';
    FLastGenreIsContainer := False;
    FLastGenreBookID.Clear;

    FLastGroupID := MHL_INVALID_ID;
    FLastGroupBookID.Clear;
  finally
    Screen.Cursor := FCursor;
  end;
end;

procedure TfrmMain.InitCollection(ApplyAuthorFilter: Boolean);
var
  SavedCursor: TCursor;
  CollectionType: Integer;
  EmptySearchCriteria: TBookSearchCriteria;
  BookCollection: IBookCollection;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    FSearchCriteria := EmptySearchCriteria;

    CloseCollection;

    //
    // Если коллекций нет - запустим мастера создания коллекции.
    //
    if not GetSystemData.HasCollections then
    begin
      frmMain.Caption := 'MyHomeLib';
      Screen.Cursor := SavedCursor;

      if not ShowNCWizard then
        Application.Terminate;

      DeleteFile(Settings.WorkPath + CHECK_FILE);
      Exit;
    end;

    //
    // Активировать коллекцию
    //
    GetSystemData.ActivateCollection(Settings.ActiveCollection);

    frmMain.Caption := 'MyHomeLib - ' + GetSystemData.ActiveCollectionInfo.Name;

    // определяем типы коллекции
    CollectionType := GetSystemData.ActiveCollectionInfo.CollectionType;
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

    ///miImport.Visible := IsPrivate;
    ///miBookEdit.Visible := IsPrivate;
    ///tbtnFBD.Enabled := IsPrivate and not IsFB2;
    ///miConverToFBD.Visible := IsPrivate and not IsFB2;
    ///tbtnAutoFBD.Enabled := IsPrivate and not IsFB2;
    ///miDeleteBook.Visible := IsPrivate; // GetSystemData.ActiveCollection.AllowDelete;
    ///tbtnDeleteBook.Enabled := IsPrivate;
    ///miDeleteFiles.Visible := IsOnline and (ActiveView <> FavoritesView);

    ///miDownloadBooks.Visible := IsOnline;

    // Коллекция

    // Инструменты

    ///miSyncOnline.Visible := IsOnline or IsNonFB2;

    // -------- Контекстное меню --------------------------------------------------

    // pmiBookInfo.Visible := IsFB2;
    ///pmiDownloadBooks.Visible := IsOnline;

    // --------- Панели онструментов ----------------------------------------------
    ///tbtnDownloadList_Add.Visible := IsOnline;

    //
    // Поиск
    //
    edFAnnotation.Enabled := IsPrivate;

    // --------- Вкладки, прочее  -------------------------------------------------

    tsDownload.TabVisible := IsOnline;

    if not IsOnline and (ActiveView = DownloadView) then
      pgControl.ActivePageIndex := PAGE_AUTHORS;

    CreateCollectionMenu;
    CreateScriptMenu;

    // SetCoversVisible((not IsNonFB2 and Settings.ShowInfoPanel)
    // or (Settings.AllowMixed and Settings.ShowInfoPanel));

    //if IsNonFB2 and not IsPrivate then
    //  SetInfoPanelVisible(False)
    //else
    //  SetInfoPanelVisible(Settings.ShowInfoPanel);

    // ----------------------------------------------------------------------------

    // DMCollection.SetTableState(True);

    // RESORE if Assigned(FLastLetterA) then
    // RESORE   FLastLetterA.Down := False;

    // RESORE DMCollection.Authors.Filtered := False;
    //if ApplyAuthorFilter then
    //begin
      //if DMCollection.Authors.RecordCount > 500 then
      //begin
        // RESORE DMCollection.Authors.Filter := AUTHOR_LASTTNAME_FIELD + '="А*"';
        // RESORE DMCollection.Authors.Filtered := True;
        // RESORE ALetter.Down := True;
        // RESORE FLastLetterA := ALetter;
        // RESORE edLocateAuthor.Text := 'А';
      //end
      //else
      //begin
        // RESORE DMCollection.Authors.Filtered := False;
        // RESTORE tbtnStar.Down := True;
        // RESTORE FLastLetterA := tbtnStar;
        // RESTORE edLocateAuthor.Text := '';
      //end;
    //end;

    //
    // Действия, видимость которых зависит от типа коллекции и которые доступны через тулбар, необходимо обновить вручную
    //
    HideDeletedBooksUpdate(nil);
    ShowLocalOnlyUpdate(nil);

    BookCollection := GetActiveBookCollection;
    BookCollection.SetShowLocalOnly(IsOnline and Settings.ShowLocalOnly);
    BookCollection.SetHideDeleted((not IsPrivate) and Settings.HideDeletedBooks);
    //BookCollection.SetTableState(True);

    FillAuthorTree(tvAuthors, BookCollection.GetAuthorIterator(amFullFilter), FLastAuthorID);
    FillSeriesTree(tvSeries, BookCollection.GetSeriesIterator(smFullFilter), FLastSeriesID);
    FillGenresTree(tvGenres, False, FLastGenreCode);
    FillGroupsList(tvGroups, FLastGroupID);
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.SerieLinkClicked(Sender: TObject; const Link: string; LinkType: TSysLinkType);
begin
//
end;

procedure TfrmMain.GenreLinkClicked(Sender: TObject; const Link: string; LinkType: TSysLinkType);
begin
//
end;

procedure TfrmMain.AuthorLinkClicked(Sender: TObject; const Link: string; LinkType: TSysLinkType);
begin
//
end;

procedure TfrmMain.CreateAlphabetToolbar;
const
  EngAlphabet: string = ALPHA_FILTER_ALL + ALPHA_FILTER_NON_ALPHA + ENGLISH_ALPHABET;
  RusAlphabet: string = ALPHA_FILTER_ALL + ALPHA_FILTER_NON_ALPHA + RUSSIAN_ALPHABET;

var
  Image: TBitmap;
  ImageCanvas: TCanvas;
  ImageRect: TRect;
  AlphaChar: Char;
  ImageIndex: Integer;
  ButtonPosA: Integer;
  ButtonPosS: Integer;
  Button: TToolButton;
  //s0, s1, s2: TSize;

  function CreateTextImage(ImageText: string): Integer;
  begin
    ImageCanvas.FillRect(ImageRect);
    ImageCanvas.Font.Color := clWindowText;
    ImageCanvas.TextRect(ImageRect, ImageText, [tfCenter, tfSingleLine, tfVerticalCenter]);
    ilAlphabetNormal.AddMasked(Image, clBtnFace);

    ImageCanvas.FillRect(ImageRect);
    ImageCanvas.Font.Color := clHotLight;
    ImageCanvas.TextRect(ImageRect, ImageText, [tfCenter, tfSingleLine, tfVerticalCenter]);
    Result := ilAlphabetActive.AddMasked(Image, clBtnFace);
  end;

  function CreateTextButton(
    ToolBar: TToolBar;
    const ACaption: string;
    ImageIndex: Integer;
    FOnClick: TNotifyEvent;
    Position: Integer
  ): Integer;
  begin
    Button := TToolButton.Create(ToolBar);
    Button.Caption := ACaption;
    Button.ImageIndex := ImageIndex;
    Button.OnClick := FOnClick;
    Button.Left := Position;
    Button.Parent := ToolBar;
    Result := Button.Left + Button.Width;
  end;

begin
  Image := TBitmap.Create;
  try
    ImageCanvas := Image.Canvas;

    ImageCanvas.Brush.Color := clBtnFace;
    ImageCanvas.Font := tbarAuthorsRus.Font;
    ImageCanvas.Font.Style := [fsBold];

    (** )
    s0.cx := ilAlphabetNormal.Width;
    s0.cy := ilAlphabetNormal.Height;
    s1 := ImageCanvas.TextExtent('AZ');
    s2 := ImageCanvas.TextExtent('АЯ');
    ilAlphabetNormal.Width := Max(s0.cx, Max(s1.cx, s2.cx));
    ilAlphabetNormal.Height := Max(s0.cy, Max(s1.cy, s2.cy));
    ( **)

    Image.Width := ilAlphabetNormal.Width;
    Image.Height := ilAlphabetNormal.Height;

    ImageRect := Bounds(0, 0, ilAlphabetNormal.Width, ilAlphabetNormal.Height);

    //
    //
    //
    ButtonPosA := 0;
    ButtonPosS := 0;
    for AlphaChar in RusAlphabet do
    begin
      ImageIndex := CreateTextImage(AlphaChar);
      ButtonPosA := CreateTextButton(tbarAuthorsRus, AlphaChar, ImageIndex, OnSetAuthorFilter, ButtonPosA);
      ButtonPosS := CreateTextButton(tbarSeriesRus, AlphaChar, ImageIndex, OnSetSerieFilter, ButtonPosS);
    end;

    ButtonPosA := 0;
    ButtonPosS := 0;
    for AlphaChar in EngAlphabet do
    begin
      ImageIndex := CreateTextImage(AlphaChar);
      ButtonPosA := CreateTextButton(tbarAuthorsEng, AlphaChar, ImageIndex, OnSetAuthorFilter, ButtonPosA);
      ButtonPosS := CreateTextButton(tbarSeriesEng, AlphaChar, ImageIndex, OnSetSerieFilter, ButtonPosS);
    end;
  finally
    Image.Free;
  end;
end;

procedure TfrmMain.CreateCollectionMenu;
var
  SubItem: TMenuItem;
  ActiveCollectionID: Integer;
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: TCollectionInfo;

  function GetCollectionTypeImageIndex(const CollectionType: COLLECTION_TYPE): Integer;
  begin
    case CollectionType of
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
  ActiveCollectionID := GetSystemData.ActiveCollectionInfo.ID;

  miCollSelect.Clear;
  miCopyToCollection.Clear;
  pmCollection.Items.Clear;

  CollectionInfo := TCollectionInfo.Create;
  try
    CollectionInfoIterator := GetSystemData.GetCollectionInfoIterator;
    while CollectionInfoIterator.Next(CollectionInfo) do
    begin
      if ActiveCollectionID <> CollectionInfo.ID then
      begin
        // ----------------------------
        SubItem := TMenuItem.Create(miCollSelect);
        SubItem.Caption := CollectionInfo.Name;
        SubItem.Tag := CollectionInfo.ID;
        SubItem.OnClick := miActiveCollectionClick;
        SubItem.ImageIndex := GetCollectionTypeImageIndex(CollectionInfo.CollectionType);
        miCollSelect.Add(SubItem);

        // ----------------------------
        SubItem := TMenuItem.Create(pmCollection);
        SubItem.Caption := CollectionInfo.Name;
        SubItem.Tag := CollectionInfo.ID;
        SubItem.OnClick := miActiveCollectionClick;
        SubItem.ImageIndex := GetCollectionTypeImageIndex(CollectionInfo.CollectionType);
        pmCollection.Items.Add(SubItem);

        // ----------------------------------
        if
          isPrivateCollection(CollectionInfo.CollectionType) and
          isFB2Collection(CollectionInfo.CollectionType) and
          IsFB2
        then
        begin
          SubItem := TMenuItem.Create(miCopyToCollection);
          SubItem.Caption := CollectionInfo.Name;
          SubItem.Tag := CollectionInfo.ID;
          SubItem.OnClick := CopyToCollectionClick;
          SubItem.ImageIndex := GetCollectionTypeImageIndex(CollectionInfo.CollectionType);

          miCopyToCollection.Add(SubItem);
        end;
      end;
    end;
  finally
    FreeAndNil(CollectionInfo);
  end;

  miCopyToCollection.Enabled := (miCopyToCollection.Count > 0);
  miCollSelect.Enabled := (miCollSelect.Count > 0);
end;

procedure TfrmMain.CreateGroupsMenu;
var
  Item, ItemP: TMenuItem;
  GroupIterator: IGroupIterator;
  Group: TGroupData;
begin
  pmGroups.Items.Clear;
  pmiGroups.Clear;

  GroupIterator := GetSystemData.GetGroupIterator;
  while GroupIterator.Next(Group) do
  begin
    //
    // пропускаем "Избранное"
    //
    if Group.GroupID <> FAVORITES_GROUP_ID then
    begin
      // меню для кнопки
      Item := TMenuItem.Create(pmGroups);
      Item.Caption := Group.Text;
      Item.Tag := Group.GroupID;
      Item.OnClick := GroupMenuItemClick;
      pmGroups.Items.Add(Item);

      // подменю для контекстного
      ItemP := TMenuItem.Create(pmMain);
      ItemP.Caption := Group.Text;
      ItemP.Tag := Group.GroupID;
      ItemP.OnClick := GroupMenuItemClick;
      pmiGroups.Add(ItemP);
    end;
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
  DBFileName: string;
  fb2Collection: Boolean;
begin
  pmScripts.Items.Clear;
  pmiScripts.Clear;
  mmiScripts.Clear;

  DBFileName := Settings.SystemFileName[sfSystemDB];
  if (FileExists(DBFileName)) then
    // Calculate, only if the system database is already created:
    fb2Collection := isFB2Collection(GetSystemData.ActiveCollectionInfo.CollectionType)
  else
    fb2Collection := False;

  if fb2Collection then
  begin
    for i := 0 to 5 do
    begin
      Item := TMenuItem.Create(pmScripts);
      Item.Caption := ExpTypes[i];
      Item.Tag := 850 + i;
      ///Item.OnClick := tbSendToDeviceClick;
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
    ///Item.OnClick := tbSendToDeviceClick;
    Item.ImageIndex := 6;
    pmScripts.Items.Insert(i + F, Item);

    // ------ context -----------------
    ItemP := TMenuItem.Create(pmMain);
    ItemP.Caption := Settings.Scripts[i].Title;
    ItemP.Tag := 901 + i;
    ///ItemP.OnClick := tbSendToDeviceClick;
    pmiScripts.Insert(i, ItemP);

    // ------ main -----------------
    ItemM := TMenuItem.Create(MainMenu);
    ItemM.Caption := Settings.Scripts[i].Title;
    ItemM.Tag := 901 + i;
    ///ItemM.OnClick := tbSendToDeviceClick;
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
  n: Integer;
begin
  frmNCWizard := TfrmNCWizard.Create(Application);
  try
    if frmNCWizard.ShowModal = mrOk then
    begin
      Settings.ActiveCollection := GetSystemData.ActiveCollectionInfo.ID;
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
  WindowState := TWindowState(Settings.WindowState);
  if WindowState = wsNormal then
  begin
    Top := Settings.FormTop;
    Left := Settings.FormLeft;
    Width := Settings.FormWidth;
    Height := Settings.FormHeight;
  end;

  // костыль
  Visible := True;
  if WindowState = wsMinimized then
    WindowState := wsNormal;
  // конец костыля
end;

procedure TfrmMain.btnSwitchTreeModeClick(Sender: TObject);
var
  SavedCursor: TCursor;
  Page: Integer;
  BookCollection: IBookCollection;
  FilterValue: TFilterValue;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    SaveColumns;

    Page := pgControl.ActivePageIndex;

    if Settings.TreeModes[Page] = tmFlat then
      Settings.TreeModes[Page] := tmTree
    else
      Settings.TreeModes[Page] := tmFlat;

    btnSwitchTreeMode.ImageIndex := TreeIcons[Ord(Settings.TreeModes[pgControl.ActivePageIndex])];
    btnSwitchTreeMode.Hint := TreeHints[Ord(Settings.TreeModes[pgControl.ActivePageIndex])];

    SetColumns;

    BookCollection := GetActiveBookCollection;
    case Page of
      0:
      begin
        FilterValue := AuthorBookFilter;
        FillBooksTree(tvBooksA,  BookCollection.GetBookIterator(bmByAuthor, False, @FilterValue), False, True, @FLastAuthorBookID);  // авторы
      end;

      1:
      begin
        FilterValue := SeriesBookFilter;
        FillBooksTree(tvBooksS,  BookCollection.GetBookIterator(bmBySeries, False, @FilterValue), False, False, @FLastSeriesBookID); // серии
      end;

      2:
      begin
        FilterValue := GenreBookFilter;
        FillBooksTree(tvBooksG,  BookCollection.GetBookIterator(bmByGenre, False, @FilterValue),  True,  True, @FLastGenreBookID);      // жанры
      end;

      3: FillBooksTree(tvBooksSR, BookCollection.Search(FSearchCriteria, False), True,  True, nil);  // поиск
      4: FillBooksTree(tvBooksF,  GetSystemData.GetBookIterator(GroupBookFIlter), True,  True, @FLastGroupBookID);  // избранное
    end;

    SetHeaderPopUp;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.ClearLabels(Tag: Integer; Full: Boolean);
begin
  case Tag of
    PAGE_AUTHORS:
      begin
        ipnlAuthors.Clear;
        if Full then
        begin
          lblAuthor.Caption := '...';
          lblBooksTotalA.Caption := '()';
        end;
      end;

    PAGE_SERIES:
      begin
        ipnlSeries.Clear;
        if Full then
        begin
          lblSeries.Caption := '...';
          lblBooksTotalS.Caption := '()';
        end;
      end;

    PAGE_GENRES:
      begin
        ipnlGenres.Clear;
        if Full then
        begin
          lblGenreTitle.Caption := '...';
          lblBooksTotalG.Caption := '()';
        end;
      end;

    PAGE_FAVORITES:
      begin
        ipnlFavorites.Clear;
        if Full then
        begin
          lblGroups.Caption := '...';
          lblBooksTotalF.Caption := '()';
        end;
      end;

    PAGE_SEARCH:
      begin
        ipnlSearch.Clear;
        if Full then
          lblTotalBooksFL.Caption := '()';
      end;

    PAGE_ALL:
      begin
        ClearLabels(PAGE_AUTHORS, Full);
        ClearLabels(PAGE_SERIES, Full);
        ClearLabels(PAGE_GENRES, Full);
        ClearLabels(PAGE_FAVORITES, Full);
        ClearLabels(PAGE_SEARCH, Full);
      end;
  end;
end;

procedure TfrmMain.FillAllBooksTree;
var
  SavedCursor: TCursor;
  BookCollection: IBookCollection;
  FilterValue: TFilterValue;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    BookCollection := GetActiveBookCollection;

    FilterValue := AuthorBookFilter;
    FillBooksTree(tvBooksA, BookCollection.GetBookIterator(bmByAuthor, False, @FilterValue), False, True, @FLastAuthorBookID);  // авторы

    FilterValue := SeriesBookFilter;
    FillBooksTree(tvBooksS, BookCollection.GetBookIterator(bmBySeries, False, @FilterValue), False, False, @FLastSeriesBookID); // серии

    FilterValue := GenreBookFilter;
    FillBooksTree(tvBooksG, BookCollection.GetBookIterator(bmByGenre, False, @FilterValue),   True,  True, @FLastGenreBookID);  // жанры

    FillBooksTree(tvBooksF, GetSystemData.GetBookIterator(GroupBookFIlter), True,  True, @FLastGroupBookID);  // избранное
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

function TfrmMain.CheckLibUpdates(Auto: Boolean): Boolean;
var
  i: Integer;
  UpdatesInfo: TUpdateInfoList;
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: TCollectionInfo;
begin
  if not Auto then
    ShowPopup(rstrCheckingUpdates);

  Result := False;

  UpdatesInfo := Settings.Updates;

  UpdatesInfo.UpdateExternalVersions;

  CollectionInfo := TCollectionInfo.Create;
  try
    CollectionInfoIterator := GetSystemData.GetCollectionInfoIterator;
    while CollectionInfoIterator.Next(CollectionInfo) do
    begin
      for i := 0 to UpdatesInfo.Count - 1 do
        if UpdatesInfo[i].CheckCodes(CollectionInfo.Name, CollectionInfo.CollectionType, CollectionInfo.ID) then
          if UpdatesInfo[i].CheckVersion(Settings.UpdatePath, CollectionInfo.Version) then
          begin
            Result := True;
            Break;
          end;
    end;
  finally
    FreeAndNil(CollectionInfo);
  end;

  if not Auto then
  begin
    HidePopup;
    if not Result then
      MHLShowInfo(rstrNoUpdatesAvailable);
  end;
end;

procedure TfrmMain.TheFirstRun;
begin
  if not GetSystemData.HasCollections then
    DeleteFile(Settings.WorkPath + CHECK_FILE)
  else if FileExists(Settings.WorkPath + CHECK_FILE) and (Application.MessageBox(PWideChar(rstrNeedDBUpgrade), PWideChar(rstrFirstRun), mb_YesNo) = mrYes) then
  begin
    RenameFile(Settings.SystemFileName[sfLibRusEcInpx], Settings.SystemFileName[sfLibRusEcUpdate]);
    DeleteFile(Settings.WorkPath + CHECK_FILE);
    if unit_Utils.LibrusecUpdate(OnImportUserDataHandler) then
      InitCollection(True);
  end;
end;

procedure TfrmMain.tbtnAutoFBDClick(Sender: TObject);
//var
//  Tree: TBookTree;
//  Node: PVirtualNode;
//  Data: PBookRecord;
begin
  //
  // Очень стремный метод. Режим редактирования\создания FBD для формы не ставиться, форма ничего не проверяет...
  //
  if (ActiveView = FavoritesView) or (ActiveView = DownloadView) then
  begin
    MHLShowWarning(rstrToConvertChangeCollection);
    Exit;
  end;

  Assert(False, 'Not implemented yet');

  (*

  TODO : RESTORE

  OnSetControlsStateHandler(False);
  try
    GetActiveTree(Tree);
    Node := Tree.GetFirstSelected;
    Data := Tree.GetNodeData(Node);
    if not Assigned(Data) or (Data^.nodeType <> ntBookInfo) then
      Exit;

    frmConvertToFBD.AutoMode;
  finally
    OnSetControlsStateHandler(True);
  end;
  *)
end;

//
// События формы
//

procedure TfrmMain.StartLibUpdate;
begin
  if unit_Utils.LibrusecUpdate(OnImportUserDataHandler) then
    InitCollection(True);
end;

function TfrmMain.GetShowStatusProgress: Boolean;
begin
  Result := (psOwnerDraw = StatusBar.Panels[1].Style);
end;

procedure TfrmMain.SetShowStatusProgress(const Value: Boolean);
begin
  if Value then
    StatusBar.Panels[1].Style := psOwnerDraw
  else
    StatusBar.Panels[1].Style := psText;
end;

function TfrmMain.GetStatusMessage: string;
begin
  Result := StatusBar.Panels[0].Text;
end;

procedure TfrmMain.SetStatusMessage(const Value: string);
begin
  StatusBar.Panels[0].Text := Value;
  if StatusBar.Visible then
    StatusBar.Repaint;
end;

function TfrmMain.GetStatusProgress: Integer;
begin
  Result := FStatusProgressBar.Position;
end;

procedure TfrmMain.SetStatusProgress(const Value: Integer);
begin
  if FStatusProgressBar.Position <> Value then
  begin
    FStatusProgressBar.Position := Value;
    if StatusBar.Visible and ShowStatusProgress then
      StatusBar.Repaint;
  end;
end;

procedure TfrmMain.StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel = StatusBar.Panels[1] then
  begin
    FStatusProgressBar.BoundsRect := Rect;
    FStatusProgressBar.PaintTo(StatusBar.Canvas.Handle, Rect.Left, Rect.Top);
  end;
end;

procedure TfrmMain.StatusBarResize(Sender: TObject);
begin
  StatusBar.Panels[0].Width :=
    StatusBar.Width - (StatusBar.Panels[1].Width + StatusBar.Panels[2].Width);
end;

procedure TfrmMain.LoadLastCollection;
var
  CollectionID: Integer;
begin
  //
  // этот метод вызывается и в том случае, если коллекций нет совсем (и никогда небыло)
  // а по смыслу, должен активировать последнюю коллекцию
  //
  // пока оставляю старую логику
  //
  if GetSystemData.HasCollections then
  begin
    CollectionID := GetSystemData.FindFirstExistingCollectionID(Settings.ActiveCollection);
    if CollectionID < 0 then
    begin
      MHLShowError(rstrCollectionFileNotFound, [GetSystemData.ActiveCollectionInfo.DBFileName]);
      //
      // Мне кажется, это очень жестко по отношению к пользователю.
      // Может лучше вернуть ошибку и запустить мастера создания коллекции?
      //
      Application.Terminate;
    end;

    //
    // небольшой хак. Будет правильнее передавать ID коллекции в InitCollection
    //
    Settings.ActiveCollection := CollectionID;

    frmSplash.lblState.Caption := rstrMainLoadingCollection;
  end;

  InitCollection(False);
end;

// ----------------------------------------------------------------------------
//
// События формы
//
// ----------------------------------------------------------------------------
procedure TfrmMain.FormCreate(Sender: TObject);
var
  PresetFile: string;
  preset: TSearchPreset;
  DBFileName: string;
begin
  Application.OnHelp := OnHelpHandler;
  UseLatestCommonDialogs := True;

  //
  // событие OnGetNodeDataSize почему-то не обрабатывается, инициализируем вручную
  //
  tvBooksA.NodeDataSize := SizeOf(TBookRecord);
  tvBooksS.NodeDataSize := SizeOf(TBookRecord);
  tvBooksG.NodeDataSize := SizeOf(TBookRecord);
  tvBooksSR.NodeDataSize := SizeOf(TBookRecord);
  tvBooksF.NodeDataSize := SizeOf(TBookRecord);
  tvDownloadList.NodeDataSize := SizeOf(TDownloadData);

  // -----------------------------

  FSelectionState := False;
  FAutoCheck := False;
  FFormBusy := False;

  FFileOpMode := fmFb2Zip;

  FMainBars[0] := tlbrMain;
  FMainBars[1] := tlbrEdit;

  FAuthorBars[0] := tbarAuthorsRus;
  FAuthorBars[1] := tbarAuthorsEng;

  FSerieBars[0] := tbarSeriesRus;
  FSerieBars[1] := tbarSeriesEng;

  CreateAlphabetToolbar;

  FLastLetterA := tbarAuthorsRus.Buttons[0];
  FLastLetterS := tbarSeriesRus.Buttons[0];

  FLastAuthorID := MHL_INVALID_ID;
  FLastAuthorBookID.Clear;

  FLastSeriesID := MHL_INVALID_ID;
  FLastSeriesBookID.Clear;

  FLastGenreCode := '';
  FLastGenreIsContainer := False;
  FLastGenreBookID.Clear;

  FLastGroupID := MHL_INVALID_ID;
  FLastGroupBookID.Clear;

  // SB
  FStatusProgressBar := TProgressBar.Create(Self);
  FStatusProgressBar.Parent := StatusBar;
  FStatusProgressBar.Visible := False;
  StatusMessage := '';
  ShowStatusProgress := False;
  StatusProgress := 0;

  StatusBar.Panels[2].Text := unit_MHLHelpers.GetFileVersion(Application.ExeName);
  // SB

  ReadINIData;

  TDirectory.CreateDirectory(Settings.TempDir);
  TDirectory.CreateDirectory(Settings.DataDir);

  //
  // загрузка списка пресетов для поиска
  //
  FPresets := TSearchPresets.Create;
  PresetFile := Settings.SystemFileName[sfPresets];
  if TFile.Exists(PresetFile) then
  begin
    try
      FPresets.Load(PresetFile);

      for preset in FPresets do
        cbPresetName.Items.Add(preset.DisplayName);
    except
      on e: Exception do
        Application.ShowException(e);
    end;
  end;

  SetColumns;
  SetHeaderPopUp;

  // ------------------------ чистка папки дата если нужно ----------------------
  if (ParamCount > 0) and (ParamStr(1) = '/clear') then
    ClearDir(Settings.DataDir);

  frmSplash.lblState.Caption := rstrMainConnectToDb;

  DBFileName := Settings.SystemFileName[sfSystemDB];
  if (not FileExists(DBFileName)) then
    CreateSystemTables(DBFileName);

  GetSystemData; // mount

  // ------------------------------------------------------------------------------
  // Проверка обновлений
  // ------------------------------------------------------------------------------

  frmSplash.lblState.Caption := rstrMainCheckUpdates;
  if Settings.CheckUpdate then
  begin
    FAutoCheck := True;
    ///frmMain.miCheckUpdatesClick(nil);
  end
  else
    FAutoCheck := False;

  if Settings.CheckExternalLibUpdate then
    if CheckLibUpdates(True) then
      if Settings.AutoRunUpdate then
        StartLibUpdate
      else if MHLShowInfo(rstrCollectionUpdateAvailable, mbYesNo) = mrYes then
        StartLibUpdate;

  // ------------------------------------------------------------------------------

  LoadLastCollection;

  FillGroupsList(tvGroups, FLastGroupID);
  CreateGroupsMenu;

  TheFirstRun;

  // ------------------------------------------------------------------------------
  frmSplash.lblState.Caption := rstrStarting;

  //
  // Create & Load "star" images from resources
  //
  FStarImage := CreateImageFromResource(TPngImage, 'smallStar') as TPngImage;
  FEmptyStarImage := CreateImageFromResource(TPngImage, 'smallStarEmpty') as TPngImage;

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

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if CheckActiveDownloads then
    if MHLShowWarning(rstrUnfinishedDownloads, mbYesNo) = mrYes then
    begin
      if Assigned(FDMThread) then
        FDMThread.TerminateNow;
    end
    else
      CanClose := False;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  // SQ
  FreeAndNil(FPresets);

  FreeAndNil(FStarImage);
  FreeAndNil(FEmptyStarImage);

  tvDownloadList.SaveToFile(Settings.SystemFileName[sfDownloadsStore]);

  if DirectoryExists(Settings.TempDir) then
    ClearDir(Settings.TempDir);

  SaveMainFormSettings;

  Settings.SaveSettings;
end;

procedure TfrmMain.UpdatePositions;
var
  AuthorData: PAuthorData;
  SerieData: PSeriesData;
  GenreData: PGenreData;
  GroupData: PGroupData;
  //BookData: PBookRecord;
begin
  AuthorData := tvAuthors.GetNodeData(tvAuthors.GetFirstSelected);
  if not Assigned(AuthorData) or (FLastAuthorID <> AuthorData^.AuthorID) then
  begin
    if Assigned(AuthorData) then
      FLastAuthorID := AuthorData^.AuthorID
    else
      FLastAuthorID := MHL_INVALID_ID;
    FLastAuthorBookID.Clear;
  end;

  SerieData := tvSeries.GetNodeData(tvSeries.GetFirstSelected);
  if not Assigned(SerieData) or (FLastSeriesID <> SerieData^.SeriesID) then
  begin
    if Assigned(SerieData) then
      FLastSeriesID := SerieData^.SeriesID
    else
      FLastSeriesID := MHL_INVALID_ID;
    FLastSeriesBookID.Clear;
  end;

  GenreData := tvGenres.GetNodeData(tvGenres.GetFirstSelected);
  if not Assigned(GenreData) or (FLastGenreCode <> GenreData^.GenreCode) then
  begin
    if Assigned(GenreData) then
    begin
      FLastGenreCode := GenreData^.GenreCode;
      Assert(Assigned(tvGenres.GetFirstSelected()));
      FLastGenreIsContainer := (tvGenres.GetFirstSelected^.ChildCount > 0);
    end
    else
    begin
      FLastGenreCode := '';
      FLastGenreIsContainer := False;
    end;
    FLastGenreBookID.Clear;
  end;

  GroupData := tvGroups.GetNodeData(tvGroups.GetFirstSelected);
  if not Assigned(GroupData) or (FLastGroupID <> GroupData^.GroupID) then
  begin
    if Assigned(GroupData) then
      FLastGroupID := GroupData^.GroupID
    else
      FLastGroupID := MHL_INVALID_ID;
    FLastGroupBookID.Clear;
  end;
end;

procedure TfrmMain.SaveMainFormSettings;
begin
  SaveColumns;

  UpdatePositions;

  Settings.Splitters[0] := pnAuthorsView.Width;
  Settings.Splitters[1] := pnSeriesView.Width;
  Settings.Splitters[2] := pnGenresView.Width;
  Settings.Splitters[3] := pnSearchView.Width;
  Settings.Splitters[4] := pnGroupsView.Width;

  Settings.BookSRCollapsed := ctpBook.Collapsed;
  Settings.FileSRCollapsed := ctpFile.Collapsed;
  Settings.OtherSRCollapsed := ctpOther.Collapsed;

  Settings.InfoPanelHeight := ipnlAuthors.Height;

  Settings.WindowState := Ord(Self.WindowState);
  if WindowState = wsNormal then
  begin
    Settings.FormWidth := Width;
    Settings.FormHeight := Height;

    Settings.FormTop := Top;
    Settings.FormLeft := Left;
  end;
end;

//
// Список книг
//
function TfrmMain.GetText(Tag: Integer; Data: PBookRecord): string;
begin
  Assert(Assigned(Data));
  case Tag of
    COL_AUTHOR:
      Result := TAuthorsHelper.GetList(Data^.Authors);
    COL_TITLE:
      Result := Data^.Title;
    COL_SERIES:
      Result := Data^.Series;
    COL_NO:
      Result := IfThen(Data^.SeqNumber = 0, '', IntToStr(Data^.SeqNumber));
    COL_SIZE:
      Result := GetFormattedSize(Data^.Size);
    COL_DATE:
      Result := DateToStr(Data^.Date);
    COL_GENRE:
      Result := TGenresHelper.GetList(Data^.Genres);
    COL_TYPE:
      Result := Data^.GetFileType;
    COL_LANG:
      Result := Data^.Lang;
    // COL_LIBRATE   : Result := IntToStr(Data^.LibRate);
    COL_COLLECTION:
      Result := Data^.CollectionName;
  end;
end;

procedure TfrmMain.OnBooksTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Page: Integer;
  Data: PBookRecord;
begin
  Page := Sender.Tag;
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := '';
  if Settings.TreeModes[Page] = tmTree then
  begin
    case Data^.nodeType of
      ntAuthorInfo:
        begin
          case GetTreeTag(Sender, Column) of
            COL_TITLE:
              CellText := TAuthorsHelper.GetList(Data^.Authors);
          end;
        end;

      ntSeriesInfo:
        begin
          if GetTreeTag(Sender, Column) = COL_TITLE then
            CellText := rstrSingleSeries + Data^.Series;
        end;

      ntBookInfo:
        begin
          CellText := GetText(GetTreeTag(Sender, Column), Data);
        end;
    end
  end
  else
    CellText := GetText(GetTreeTag(Sender, Column), Data);
end;

procedure TfrmMain.GetBookNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TBookRecord);
end;

procedure TfrmMain.FreeBookNodeDate(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PBookRecord;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.OnBooksTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.CheckType := ctTriStateCheckBox;
  Sender.CheckState[Node] := csUncheckedNormal;
end;

procedure TfrmMain.tvBooksTreeHeaderClick(
  Sender: TVTHeader;
  Column: TColumnIndex;
  Button: TMouseButton;
  Shift: TShiftState;
  X, Y: Integer
);
var
  Tree: TBookTree;
begin
  if (Button = mbLeft) then
  begin
    GetActiveTree(Tree);
    if (Settings.TreeModes[Tree.Tag] = tmTree) or (Column < 0) then
      Exit;

    //
    // Меняем индекс сортирующей колонки на индекс колонки, которая была нажата.
    //
    Tree.Header.SortColumn := Column;

    //
    // Сортируем всё дерево относительно этой колонки и изменяем порядок сортировки на противополжный
    //
    if Tree.Header.SortDirection = sdAscending then
      Tree.Header.SortDirection := sdDescending
    else
      Tree.Header.SortDirection := sdAscending;
    Tree.SortTree(Column, Tree.Header.SortDirection);

    // запоминаем параметры для активного дерева
    FSortSettings[Tree.Tag].Column := Column;
    FSortSettings[Tree.Tag].Direction := Tree.Header.SortDirection;
  end;
end;

// ----------------------------------------------------------------------------
//
// Список авторов
//
// ----------------------------------------------------------------------------
procedure TfrmMain.tvAuthorsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  SavedCursor: TCursor;
  Data: PAuthorData;
  FilterValue: TFilterValue;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Data := tvAuthors.GetNodeData(Node);
    if not Assigned(Data) then
    begin
      lblAuthor.Caption := '...';
      lblBooksTotalA.Caption := '()';
      ipnlAuthors.Clear;
      tvBooksA.Clear;
      Exit;
    end;

    if FLastAuthorID <> Data^.AuthorID then
    begin
      lblAuthor.Caption := Data^.GetFullName;
      FLastAuthorID := Data^.AuthorID;
      FLastAuthorBookID.Clear;
    end;

    FilterValue := AuthorBookFilter;
    FillBooksTree(tvBooksA, GetActiveBookCollection.GetBookIterator(bmByAuthor, False, @FilterValue), False, True, @FLastAuthorBookID); // авторы
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.FreeAuthorNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PAuthorData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.GetAuthorNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TAuthorData);
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
    frmMain.ActiveControl := tvBooksA;
  end;
end;

// ----------------------------------------------------------------------------
//
// Список серий
//
// ----------------------------------------------------------------------------
procedure TfrmMain.tvSeriesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  SavedCursor: TCursor;
  Data: PSeriesData;
  FilterValue: TFilterValue;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Data := tvSeries.GetNodeData(Node);
    if not Assigned(Data) then
    begin
      lblSeries.Caption := '...';
      lblBooksTotalS.Caption := '()';
      ipnlSeries.Clear;
      tvBooksS.Clear;
      Exit;
    end;

    if FLastSeriesID <> Data^.SeriesID then
    begin
      lblSeries.Caption := Data^.SeriesTitle;
      FLastSeriesID := Data^.SeriesID;
      FLastSeriesBookID.Clear;
    end;

    FilterValue := SeriesBookFilter;
    FillBooksTree(tvBooksS, GetActiveBookCollection.GetBookIterator(bmBySeries, False, @FilterValue), False, False, @FLastSeriesBookID); // авторы
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.FreeSerieNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PSeriesData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.GetSerieNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TSeriesData);
end;

procedure TfrmMain.tvSeriesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PSeriesData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := Data^.SeriesTitle;
end;

procedure TfrmMain.tvSeriesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    frmMain.ActiveControl := tvBooksS;
  end;
end;

// ----------------------------------------------------------------------------
//
// Список жанров
//
// ----------------------------------------------------------------------------
procedure TfrmMain.tvGenresChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  SavedCursor: TCursor;
  Data: PGenreData;
  FilterValue: TFilterValue;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Data := tvGenres.GetNodeData(Node);
    if not Assigned(Data) then
    begin
      lblGenreTitle.Caption := '...';
      lblBooksTotalG.Caption := '()';
      ipnlGenres.Clear;
      tvBooksG.Clear;
      Exit;
    end;

    if FLastGenreCode <> Data^.GenreCode then
    begin
      lblGenreTitle.Caption := Data^.GenreAlias;
      FLastGenreCode := Data^.GenreCode;
      FLastGenreIsContainer := (Node^.ChildCount > 0);
      FLastGenreBookID.Clear;
    end;

    FilterValue := GenreBookFilter;
    FillBooksTree(tvBooksG, GetActiveBookCollection.GetBookIterator(bmByGenre, False, @FilterValue), True, True, @FLastGenreBookID);
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.FreeGenreNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PGenreData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.GetGenreNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TGenreData);
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
    frmMain.ActiveControl := tvBooksG;
  end;
end;

// ----------------------------------------------------------------------------
//
// Список групп
//
// ----------------------------------------------------------------------------

procedure TfrmMain.tvGroupsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  SavedCursor: TCursor;
  Data: PGroupData;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Data := tvGroups.GetNodeData(Node);
    if not Assigned(Data) then
    begin
      lblGroups.Caption := '...';
      lblBooksTotalF.Caption := '()';
      ipnlFavorites.Clear;
      tvBooksF.Clear;
      Exit;
    end;

    if FLastGroupID <> Data^.GroupID then
    begin
      lblGroups.Caption := GetSystemData.GetGroup(Data^.GroupID).Text;
      FLastGroupID := Data^.GroupID;
      FLastGroupBookID.Clear;
    end;

    FillBooksTree(tvBooksF, GetSystemData.GetBookIterator(GroupBookFIlter), True, True, @FLastGroupBookID);
  finally
    Screen.Cursor := SavedCursor;
  end;
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
  BookData: PBookRecord;

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
// Where can we get a replacement for DMUser.GroupsGroupID.Value ?
  Assert(False, 'Not implemented yet!')

//  SourceGroupID := DMUser.GroupsGroupID.Value;
//
//  GroupData := tvGroups.GetNodeData(tvGroups.DropTargetNode);
//  Assert(Assigned(GroupData));
//  TargetGroupID := GroupData^.GroupID;
//
//  Nodes := tvBooksF.GetSortedSelection(False);
//
//  // сканируем выделенные ноды.
//  // если есть потомки, выделяем их тоже
//  for i := 0 to High(Nodes) do
//    SelectChildNodes(Nodes[i]);
//
//  // составляем новый список выделенных
//  Nodes := tvBooksF.GetSortedSelection(False);
//
//  // переносим данные
//  for i := 0 to High(Nodes) do
//  begin
//    BookData := tvBooksF.GetNodeData(Nodes[i]);
//    if BookData^.nodeType = ntBookInfo then
//    begin
//      GetSystemData.CopyBookToGroup(BookData^.BookKey, SourceGroupID, TargetGroupID, ssShift in Shift);
//    end;
//  end;
//  FillBooksTree(tvBooksF, GetSystemData.GetBookIterator(GroupBookFIlter), True, True, @FLastGroupBookID);
end;

procedure TfrmMain.tvGroupsDragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
var
  Data: PGroupData;
begin
// Where can we get a replacement for DMUser.GroupsGroupID.Value ?
  Assert(False, 'Not implemented yet!')

//  Data := tvGroups.GetNodeData(tvGroups.DropTargetNode);
//  if Assigned(Data) then
//    if Data^.GroupID <> DMUser.GroupsGroupID.Value then
//      Accept := True;
end;

procedure TfrmMain.FreeGroupNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PGroupData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.GetGroupNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TGroupData);
end;

procedure TfrmMain.tvGroupsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PGroupData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));
  CellText := Data^.Text;
end;

procedure TfrmMain.tvGroupsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    frmMain.ActiveControl := tvBooksF;
  end;
end;

procedure TfrmMain.tvBooksTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PBookRecord;
  Tree: TBookTree;
  InfoPanel: TInfoPanel;
  bookStream: TStream;
  book: IXMLFictionBook;
  imgBookCover: TGraphic;
  isFBDDocument: Boolean;
  StoredBookKey: PBookKey;
begin
  Tree := Sender as TBookTree;

  StoredBookKey := nil;

  if Tree = tvBooksA then
  begin
    InfoPanel := ipnlAuthors;
    StoredBookKey := @FLastAuthorBookID;
  end
  else if Tree = tvBooksS then
  begin
    InfoPanel := ipnlSeries;
    StoredBookKey := @FLastSeriesBookID;
  end
  else if Tree = tvBooksG then
  begin
    InfoPanel := ipnlGenres;
    StoredBookKey := @FLastGenreBookID;
  end
  else if Tree = tvBooksSR then
    InfoPanel := ipnlSearch
  else if Tree = tvBooksF then
  begin
    InfoPanel := ipnlFavorites;
    StoredBookKey := @FLastGroupBookID;
  end
  else
  begin
    Assert(False);
    Exit;
  end;

  Data := Tree.GetNodeData(Node);

  if not Assigned(Data) or (Data^.nodeType <> ntBookInfo) then
  begin
    //
    // TODO : Может стоит показывать какую-нибудь информацию и в этом случае?
    //
    InfoPanel.Clear;
    if Assigned(StoredBookKey) then
      StoredBookKey^.Clear;
    Exit;
  end;

  if Assigned(StoredBookKey) then
    StoredBookKey^ := Data^.BookKey;

  if Settings.ShowInfoPanel then
  begin
    InfoPanel.SetBookInfo(
      Data^.Title,
      TAuthorsHelper.GetLinkList(Data^.Authors),
      Data^.Series,
      TGenresHelper.GetLinkList(Data^.Genres)
    );

    if Settings.ShowBookCover or Settings.ShowBookAnnotation then
    begin
      if IsLocal or Data^.IsLocal then
      begin
        try
          bookStream := Data^.GetBookDescriptorStream;
          try
            Assert(Assigned(bookStream));
            book := LoadFictionBook(bookStream);

            //
            // Покажем обложку
            //
            if Settings.ShowBookCover then
            begin
              imgBookCover := GetBookCover(book);
              try
                InfoPanel.SetBookCover(imgBookCover);
              finally
                imgBookCover.Free;
              end;
            end;

            //
            // Покажем аннотацию
            //
            if Settings.ShowBookAnnotation then
            begin
              InfoPanel.SetBookAnnotation(GetBookAnnotation(book));
            end;
          finally
            FreeAndNil(bookStream);
          end;
        except
          InfoPanel.SetBookCover(nil);
          InfoPanel.SetBookAnnotation('');
        end;
      end
      else
      begin
        InfoPanel.SetBookCover(nil);
        InfoPanel.SetBookAnnotation('');
      end;
    end;
  end;

  if IsPrivate and IsNonFB2 then
  begin
    isFBDDocument := Data^.GetBookFormat = bfFbd;

    ///miConverToFBD.Visible := True;
    ///miConverToFBD.Tag := IfThen(isFBDDocument, 999, 0);
    ///miConverToFBD.Caption := IfThen(isFBDDocument, rstrEditFBD, rstrConvert2FBD);
  end;
end;

procedure TfrmMain.tvBooksTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PBookRecord;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);

  if NoColumn = Column then
  begin
    if Data1^.nodeType = Data2^.nodeType then
    begin
      Result := 0;
      if Data1^.nodeType = ntAuthorInfo then
        Result := CompareStr(TAuthorsHelper.GetList(Data1^.Authors), TAuthorsHelper.GetList(Data2^.Authors))
      else if Data1^.nodeType = ntSeriesInfo then
        Result := CompareStr(Data1^.Series, Data2^.Series)
      else
      begin
        Result := CompareSeqNumber(Data1^.SeqNumber, Data2^.SeqNumber);
        if Result = 0 then
          Result := CompareStr(Data1^.Title, Data2^.Title);
        if Result = 0 then
          Result := CompareStr(Data1^.Series, Data2^.Series);
      end;
    end
    else
      Result := Sign(Ord(Data1^.nodeType) - Ord(Data2^.nodeType));
  end
  else
  begin
    case (Sender as TBookTree).Header.Columns[Column].Tag of
      COL_AUTHOR:  Result := CompareStr(TAuthorsHelper.GetList(Data1^.Authors), TAuthorsHelper.GetList(Data2^.Authors));
      COL_TITLE:   Result := CompareStr(Data1^.Title, Data2^.Title);
      COL_SERIES:  Result := CompareStr(Data1^.Series, Data2^.Series);
      COL_NO:      Result := CompareSeqNumber(Data1^.SeqNumber, Data2^.SeqNumber);
      COL_SIZE:    Result := CompareInt(Data1^.Size, Data2^.Size);
      COL_RATE:    Result := CompareInt(Data1^.Rate, Data2^.Rate);
      COL_GENRE:   Result := CompareStr(TGenresHelper.GetList(Data1^.Genres), TGenresHelper.GetList(Data2^.Genres));
      COL_DATE:    Result := CompareDate(Data1^.Date, Data2^.Date);
      COL_LANG:    Result := CompareStr(Data1^.Lang, Data2^.Lang);
      COL_LIBRATE: Result := CompareInt(Data1^.LibRate, Data2^.LibRate);
    end;
  end;
end;

procedure TfrmMain.tvBooksTreeBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
var
  Data: PBookRecord;
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
        if Data^.Series = '' then
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
    Result := (Sender as TBookTree).Header.Columns[Column].Tag;
end;

procedure TfrmMain.tvBooksTreeAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellRect: TRect);
var
  Data: PBookRecord;
  Tag: Integer;
  X: Integer;
  CollectionInfo: TCollectionInfo;
  CollectionType: COLLECTION_TYPE;

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

  if Data^.nodeType <> ntBookInfo then
    Exit;

  Tag := GetTreeTag(Sender, Column);

  X := (Sender as TBookTree).Header.Columns.Items[Column].Left;

  if (Tag = COL_STATE) then
  begin
    //
    // The book belongs to an online collection and is available locally (already downloaded)
    //
    CollectionInfo := TCollectionInfo.Create;
    try
      GetSystemData.GetCollectionInfo(Data^.BookKey.DatabaseID, CollectionInfo);
      CollectionType := CollectionInfo.CollectionType;
    finally
      FreeAndNil(CollectionInfo);
    end;
    if (Data^.IsLocal) and isOnlineCollection(CollectionType) then
      ilFileTypes.Draw(TargetCanvas, X, CellRect.Top + 1, 7);

    //
    // Книга прочитана
    //
    if Data^.Progress = 100 then
      ilFileTypes.Draw(TargetCanvas, X + 10, CellRect.Top, 8);

    //
    // У книги есть аннотация
    //
    if Data^.Code = 1 then
      ilFileTypes.Draw(TargetCanvas, X + 25, CellRect.Top + 1, 9);
  end
  else if (Tag = COL_RATE) then
    Stars(Data^.Rate)
  else if (Tag = COL_LIBRATE) then
  begin
    if Data^.LibRate <= 5 then
      Stars(Data^.LibRate)
    else
      Stars(0);
  end;
end;

procedure TfrmMain.tvBooksTreeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
const
  CheckState: array [Boolean] of TCheckState = (csCheckedNormal, csUncheckedNormal);
var
  Tree: TBookTree;
  Left: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookRecord;
begin
  if Key = VK_INSERT then
  begin
    Tree := (Sender as TBookTree);
    Node := Tree.FocusedNode;
    if Assigned(Node) then
    begin
      Data := Tree.GetNodeData(Node);
      if Data^.nodeType = ntBookInfo then
        Tree.CheckState[Node] := CheckState[Tree.CheckState[Node] = csCheckedNormal];
      Tree.Selected[Node] := False;
      Node := Tree.GetNext(Node);

      if Assigned(Node) then
      begin
        Tree.Selected[Node] := True;
        Tree.FocusedNode := Node;
      end;
    end;
  end
  else if (Key in [VK_RIGHT, VK_LEFT]) and (ssCtrl in Shift) then
  begin
    case ActiveView of
      AuthorsView:
        Left := tvAuthors;
      SeriesView:
        Left := tvSeries;
      GenresView:
        Left := tvGenres;
      FavoritesView:
        Left := tvGroups;
      SearchView:
        Exit;
    end;

    Node := Left.FocusedNode;
    Left.Selected[Node] := False;

    if (Key = VK_RIGHT) then
      Node := Left.GetNext(Node)
    else
      Node := Left.GetPrevious(Node);

    if Assigned(Node) then
    begin
      Left.Selected[Node] := True;
      Left.FocusedNode := Node;
    end;

    Tree := (Sender as TBookTree);
    Node := Tree.GetFirst;
    if Assigned(Node) then
      Tree.Selected[Node] := True;
  end;
end;

procedure TfrmMain.FreeDownloadNodeData(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PDownloadData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TfrmMain.GetDownloadNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TDownloadData);
end;

procedure TfrmMain.tvBooksTreeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: PVirtualNode;
  Data: PBookRecord;
  Tree: TBookTree;
  Selected: PVirtualNode;
begin
  if (Button = mbLeft) and (ssShift in Shift) then
  begin
    try
      Tree := Sender as TBookTree;
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
      Tree.Selected[Selected] := True;
    end;
  end; // if
end;

procedure TfrmMain.tvBooksTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  Data: PBookRecord;
begin
  Data := Sender.GetNodeData(Node);
  if Data^.nodeType <> ntBookInfo then
    TargetCanvas.Font.Style := [fsBold]
  else if not Sender.Selected[Node] then
  begin
    if Data^.IsLocal then
      TargetCanvas.Font.Color := Settings.LocalColor;
    if Data^.IsDeleted then
      TargetCanvas.Font.Color := Settings.DeletedColor;
  end;
end;

procedure TfrmMain.tvDownloadListGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
const
  States: array [TDownloadState] of string = (rstrDownloadStateWaiting, rstrDownloadStateDownloading, rstrDownloadStateDone, rstrDownloadStateError);
var
  Data: PDownloadData;
begin
  Data := tvDownloadList.GetNodeData(Node);
  case Column of
    0: CellText := Data^.Author;
    1: CellText := Data^.Title;
    2: CellText := GetFormattedSize(Data^.Size);
    3: CellText := States[Data^.State];
  end;
end;

procedure TfrmMain.tvDownloadListLoadNode(Sender: TBaseVirtualTree; Node: PVirtualNode; Stream: TStream);
var
  Data: PDownloadData;
  Size: Integer;
  StrBuffer: PChar;

  function GetString: string;
  begin
    Stream.Read(Size, SizeOf(Size));
    StrBuffer := AllocMem(Size);
    Stream.read(StrBuffer^, Size);
    Result := (StrBuffer);
    FreeMem(StrBuffer);
  end;

begin
  Data := Sender.GetNodeData(Node);
  // ID
  Stream.Read(Data^.BookKey, SizeOf(Data^.BookKey));

  Data^.Title := GetString;
  Data^.Author := GetString;

  // Size
  Stream.Read(Data^.Size, SizeOf(Data^.Size));

  Data^.FileName := GetString;
  Data^.URL := GetString;

  // State
  Stream.Read(Data^.State, SizeOf(Data^.State));
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
    Stream.Write(Size, SizeOf(Size));
    Stream.Write(PChar(S)^, Size);
  end;

begin
  Data := Sender.GetNodeData(Node);

  if not Assigned(Data) then
    Exit;

  // ID
  Stream.Write(Data^.BookKey, SizeOf(Data^.BookKey));

  WriteString(Data^.Title);
  WriteString(Data^.Author);

  // Size
  Stream.Write(Data^.Size, SizeOf(Data^.Size));

  WriteString(Data^.FileName);
  WriteString(Data^.URL);

  // State
  Stream.Write(Data^.State, SizeOf(Data^.State));
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
  GetSelections(tvDownloadList, List);
  for i := 0 to tvDownloadList.SelectedCount - 1 do
    case (Sender as TToolButton).Tag of
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
  Tree: TBookTree;
  Node: PVirtualNode;
  Data: PBookRecord;
  BookCollection: IBookCollection;
  SavedCursor: TCursor;
  CollectionInfo: TCollectionInfo;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if ActiveView = FavoritesView then
    begin
      MHLShowWarning(rstrMainUnableToCopy);
      Exit;
    end;

    GetActiveTree(Tree);
    ID := (Sender as TMenuItem).Tag;
    CollectionInfo := TCollectionInfo.Create;
    try
      if not GetSystemData.GetCollectionInfo(ID, CollectionInfo) then
        Exit;
    finally
      FreeAndNil(CollectionInfo);
    end;

    BookCollection := GetBookCollection(GetSystemData.ActiveCollectionInfo.DBFileName);
    Node := Tree.GetFirst;
    while Assigned(Node) do
    begin
      Data := Tree.GetNodeData(Node);
      if IsSelectedBookNode(Node, Data) then
      begin
        BookCollection.GetBookRecord(Data^.BookKey, R, True);
        BookCollection.InsertBook(R, True, True);
      end;

      Node := Tree.GetNext(Node);
    end;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.InfoPanelResize(Sender: TObject);
begin
  SetInfoPanelHeight((Sender as TWinControl).Height);
end;

procedure TfrmMain.FillBookIdList(const Tree: TBookTree; var BookIDList: TBookIdList);
var
  i: Integer;
  Node: PVirtualNode;
  Data: PBookRecord;
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
      BookIDList[i].BookKey := Data^.BookKey;
      Inc(i);
      Tree.CheckState[Node] := csUncheckedNormal;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

procedure TfrmMain.SendToDeviceExecute(Sender: TObject);
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
  Tree: TBookTree;
  ExportMode: TExportMode;
begin
  GetActiveTree(Tree);
  FillBookIdList(Tree, BookIDList);

  if Length(BookIDList) = 0 then
  begin
    MHLShowError(rstrNoBookSelected);
    Exit;
  end;

  SaveDeviceDir := Settings.DeviceDir;
  SaveFolderTemplate := Settings.FolderTemplate;
  ScriptID := (Sender as TComponent).Tag;

  if isFB2Collection(GetSystemData.ActiveCollectionInfo.CollectionType) then
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
    if not GetFolderName(Handle, rstrProvideThePath, AFolder) then
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

  if isOnlineCollection(GetSystemData.ActiveCollectionInfo.CollectionType) then
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
  StatusMessage := rstrReadyMessage;
  ShowStatusProgress := False;
end;

procedure TfrmMain.DownloadBooks;
var
  BookIDList: TBookIdList;
  Tree: TBookTree;
begin
  GetActiveTree(Tree);

  FillBookIdList(Tree, BookIDList);
  unit_ExportToDevice.DownloadBooks(BookIDList);
end;

procedure TfrmMain.ReadBookExecute(Sender: TObject);
var
  Tree: TBookTree;
  Data: PBookRecord;
begin
  GetActiveTree(Tree);

  Data := Tree.GetNodeData(Tree.GetFirstSelected);
  if Assigned(Data) and (Data^.nodeType = ntBookInfo) then
  begin
    OnReadBookHandler(Data^);
  end;
end;

procedure TfrmMain.OnReadBookHandler(const BookRecord: TBookRecord);
var
  SavedCursor: TCursor;
  BookFileName: string;
  BookFormat: TBookFormat;
  WorkFile: string;
  CollectionInfo: TCollectionInfo;
begin
  Assert(BookRecord.nodeType = ntBookInfo);

  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    BookFileName := BookRecord.GetBookFileName;
    BookFormat := BookRecord.GetBookFormat;

    if BookFormat in [bfFb2Zip, bfFbd] then
    begin
      if BookFormat = bfFb2Zip then
      begin
        CollectionInfo := TCollectionInfo.Create;
        try
          if not GetSystemData.GetCollectionInfo(BookRecord.BookKey.DatabaseID, CollectionInfo) then
            Assert(False);

          if (not BookRecord.IsLocal) and isOnlineCollection(CollectionInfo.CollectionType) then
          begin
            // A not-yet-downloaded book of an online collection, can download only if book's collection is selected
            GetActiveBookCollection.VerifyCurrentCollection(BookRecord.BookKey.DatabaseID);
            DownloadBooks;
            /// TODO : RESTORE ??? Tree.RepaintNode(Tree.GetFirstSelected);
            if not FileExists(BookFileName) then
              Exit; // если файла нет, значит закачка не удалась, и юзер об  этом уже знает
          end;
        finally
          FreeAndNil(CollectionInfo);
        end;
      end;

      Assert(Length(BookRecord.Authors) > 0);
      WorkFile := TPath.Combine(
        Settings.ReadPath,
        Format(
          '%s - %s.%d%s',
          [
            CheckSymbols(BookRecord.Authors[0].GetFullName),
            CheckSymbols(BookRecord.Title),
            BookRecord.BookKey.BookID,
            BookRecord.FileExt
          ]
        )
      );

      if not FileExists(WorkFile) then
        BookRecord.SaveBookToFile(WorkFile);
    end
    else // bfFb2 or bfRaw
      WorkFile := BookFileName;

    if Settings.OverwriteFB2Info and (BookFormat = bfFb2) then
      WriteFb2InfoToFile(BookRecord, WorkFile);

    Settings.Readers.RunReader(WorkFile);
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.HideDeletedBooksExecute(Sender: TObject);
var
  SavedCursor: TCursor;
  BookCollection: IBookCollection;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    UpdatePositions;

    Settings.HideDeletedBooks := not Settings.HideDeletedBooks;

    BookCollection := GetActiveBookCollection;
    BookCollection.SetHideDeleted(Settings.HideDeletedBooks);

    FillAuthorTree(tvAuthors, BookCollection.GetAuthorIterator(amFullFilter), FLastAuthorID);
    FillSeriesTree(tvSeries, BookCollection.GetSeriesIterator(smFullFilter), FLastSeriesID);
    FillAllBooksTree;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.HideDeletedBooksUpdate(Sender: TObject);
begin
  acViewHideDeletedBooks.Visible := (not IsPrivate);
  acViewHideDeletedBooks.Checked := Settings.HideDeletedBooks;
end;

function TfrmMain.GetFilterButton(ToolBars: array of TToolBar; const Filter: string): TToolButton;
var
  RealFilter: string;
  barIndex: Integer;
  bar: TToolBar;
  i: Integer;
begin
  Result := nil;

  if Filter = '' then
    Exit;

  RealFilter := TCharacter.ToUpper(Copy(Filter, 1, 1));

  if not TCharacter.IsLetter(RealFilter, 1) then
    RealFilter := ALPHA_FILTER_NON_ALPHA;

  for barIndex := 0 to High(ToolBars) do
  begin
    bar := ToolBars[barIndex];

    for i := 0 to bar.ControlCount - 1 do
    begin
      if (bar.Controls[i] is TToolButton) and ((bar.Controls[i] as TToolButton).Caption = RealFilter) then
      begin
        Result := bar.Controls[i] as TToolButton;
        Exit;
      end;
    end;
  end;

  Assert(False);
end;

function TfrmMain.InternalSetAuthorFilter(Button: TToolButton): string;
var
  BookCollection: IBookCollection;
begin
  if Assigned(FLastLetterA) then
    FLastLetterA.Down := False;
  FLastLetterA := Button;
  FLastLetterA.Down := True;

  Result := TCharacter.ToUpper(Button.Caption);

  BookCollection := GetActiveBookCollection;
  BookCollection.SetAuthorFilterType(Result);

  FillAuthorTree(tvAuthors, BookCollection.GetAuthorIterator(amFullFilter), FLastAuthorID);

  if (Result = ALPHA_FILTER_ALL) or (Result = ALPHA_FILTER_NON_ALPHA) then
  begin
    Result := '';
  end
  else
  begin
    Assert(Length(Result) = 1);
  end;
end;

procedure TfrmMain.OnSetAuthorFilter(Sender: TObject);
var
  SavedCursor: TCursor;
  Button: TToolButton;
  AFilter: string;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    UpdatePositions;

    Assert(Sender is TToolButton);
    Button := Sender as TToolButton;

    AFilter := InternalSetAuthorFilter(Button);

    Assert(Length(AFilter) < 2);
    SetTextNoChange(edLocateAuthor, AFilter);
    if AFilter <> '' then
    begin
      edLocateAuthor.SelStart := 1;
      edLocateAuthor.SelLength := 0;
    end;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

function TfrmMain.InternalSetSerieFilter(Button: TToolButton): string;
begin
  if Assigned(FLastLetterS) then
    FLastLetterS.Down := False;
  FLastLetterS := Button;
  FLastLetterS.Down := True;

  Result := TCharacter.ToUpper(Button.Caption);

  GetActiveBookCollection.SetSeriesFilterType(Result);

  if (Result = ALPHA_FILTER_ALL) or (Result = ALPHA_FILTER_NON_ALPHA) then
  begin
    Result := '';
  end
  else
  begin
    Assert(Length(Result) = 1);
  end;
end;

procedure TfrmMain.OnSetSerieFilter(Sender: TObject);
var
  SaveCursor: TCursor;
  Button: TToolButton;
  AFilter: string;
begin
  SaveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    UpdatePositions;

    Assert(Sender is TToolButton);
    Button := Sender as TToolButton;

    AFilter := InternalSetSerieFilter(Button);

    FillSeriesTree(tvSeries, GetActiveBookCollection.GetSeriesIterator(smFullFilter), FLastSeriesID);

    Assert(Length(AFilter) < 2);
    SetTextNoChange(edLocateSeries, AFilter);
    if AFilter <> '' then
    begin
      edLocateSeries.SelStart := 1;
      edLocateSeries.SelLength := 0;
    end;
  finally
    Screen.Cursor := SaveCursor;
  end;
end;

procedure TfrmMain.TrayIconDblClick(Sender: TObject);
begin
  Visible := not Visible;
  TrayIcon.Visible := not Visible;
end;

procedure TfrmMain.ShowLocalOnlyExecute(Sender: TObject);
var
  SavedCursor: TCursor;
  BookCollection: IBookCollection;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    UpdatePositions;

    Settings.ShowLocalOnly := not Settings.ShowLocalOnly;

    BookCollection := GetActiveBookCollection;
    BookCollection.SetShowLocalOnly(Settings.ShowLocalOnly);

    FillAuthorTree(tvAuthors, BookCollection.GetAuthorIterator(amFullFilter), FLastAuthorID);
    FillSeriesTree(tvSeries, BookCollection.GetSeriesIterator(smFullFilter), FLastSeriesID);
    FillAllBooksTree;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.ShowLocalOnlyUpdate(Sender: TObject);
begin
  acViewShowLocalOnly.Visible := IsOnline;
  acViewShowLocalOnly.Checked := Settings.ShowLocalOnly;
end;

procedure TfrmMain.SetInfoPanelHeight(Height: Integer);
begin
  ipnlAuthors.Height := Height;
  ipnlSeries.Height := Height;
  ipnlGenres.Height := Height;
  ipnlSearch.Height := Height;
  ipnlFavorites.Height := Height;
end;

procedure TfrmMain.SetInfoPanelVisible(State: Boolean);
begin
  ipnlAuthors.Visible := State;
  AuthorBookInfoSplitter.Visible := State;

  ipnlSeries.Visible := State;
  SerieBookInfoSplitter.Visible := State;

  ipnlGenres.Visible := State;
  GenreBookInfoSplitter.Visible := State;

  ipnlSearch.Visible := State;
  SearchBookInfoSplitter.Visible := State;

  ipnlFavorites.Visible := State;
  GroupBookInfoSplitter.Visible := State;
end;

procedure TfrmMain.SetShowBookCover(State: Boolean);
begin
  ipnlAuthors.ShowCover := State;
  ipnlSeries.ShowCover := State;
  ipnlGenres.ShowCover := State;
  ipnlSearch.ShowCover := State;
  ipnlFavorites.ShowCover := State;
end;

procedure TfrmMain.SetShowBookAnnotation(State: Boolean);
begin
  ipnlAuthors.ShowAnnotation := State;
  ipnlSeries.ShowAnnotation := State;
  ipnlGenres.ShowAnnotation := State;
  ipnlSearch.ShowAnnotation := State;
  ipnlFavorites.ShowAnnotation := State;
end;

procedure TfrmMain.tbClearEdAuthorClick(Sender: TObject);
begin
  SetTextNoChange(edLocateAuthor, '');
  frmMain.ActiveControl := edLocateAuthor;
end;

procedure TfrmMain.tbCollapseClick(Sender: TObject);
var
  Tree: TBookTree;
begin
  GetActiveTree(Tree);
  if Tree.Expanded[Tree.GetFirst] then
    Tree.FullCollapse(nil)
  else
    Tree.FullExpand(nil);
end;

function TfrmMain.GetViewTree(view: TView): TBookTree;
begin
  case view of
    AuthorsView:
      Result := tvBooksA;
    SeriesView:
      Result := tvBooksS;
    GenresView:
      Result := tvBooksG;
    SearchView:
      Result := tvBooksSR;
    FavoritesView:
      Result := tvBooksF;
  else
    begin
      Assert(False, rstrCheckUsage);
      Result := nil;
    end;
  end;
end;

procedure TfrmMain.GroupMenuItemClick(Sender: TObject);
begin
  AddBookToGroup(Sender);
end;

procedure TfrmMain.GetActiveTree(var Tree: TBookTree);
begin
  Tree := GetViewTree(ActiveView);
end;

procedure TfrmMain.Selection(SelState: Boolean);
var
  Node: PVirtualNode;
  Tree: TBookTree;
begin
  GetActiveTree(Tree);
  Tree.BeginUpdate;
  try
    Node := Tree.GetFirst;
    while Assigned(Node) do
    begin
      if SelState then
        Node.CheckState := csCheckedNormal
      else
        Node.CheckState := csUncheckedNormal;
      Node := Tree.GetNext(Node);
    end;
  finally
    Tree.EndUpdate;
  end;
end;

procedure TfrmMain.OnSelectBookHandler(MoveForward: Boolean);
var
  Tree: TBookTree;
  NewNode, OldNode: PVirtualNode;
  Data: PBookRecord;
begin
  GetActiveTree(Tree);
  OldNode := Tree.GetFirstSelected;
  NewNode := OldNode;

  repeat
    if MoveForward then
    begin
      NewNode := Tree.GetNext(NewNode);
      if not Assigned(NewNode) then
        NewNode := Tree.GetFirst;
    end
    else
    begin
      NewNode := Tree.GetPrevious(NewNode);
      if not Assigned(NewNode) then
        NewNode := Tree.GetLast;
    end;

    Data := Tree.GetNodeData(NewNode);
  until Data^.nodeType = ntBookInfo;

  Tree.Selected[OldNode] := False;
  Tree.Selected[NewNode] := True;
  Tree.FocusedNode := NewNode;
end;

procedure TfrmMain.tbSelectAllClick(Sender: TObject);
begin
  FSelectionState := not FSelectionState;
  Selection(FSelectionState);
end;

// - - - - - - Дерево книг для поиска, серий и избранного - - - - - - - - - - - -

procedure TfrmMain.FillBooksTree(
  const Tree: TBookTree;
  const BookIterator: IBookIterator;
  ShowAuth: Boolean;
  ShowSer: Boolean;
  SelectedID: PBookKey
);
var
  AuthorNode: PVirtualNode;
  SerieNode: PVirtualNode;
  BookNode: PVirtualNode;
  SelectedNode: PVirtualNode;

  Data: PBookRecord;
  Max, i: Integer;
  Author: string;

  IsGroupView: Boolean;

  AuthorNodes: TDictionary<string, PVirtualNode>;

  SeriesID: Integer;

  BookRecord: TBookRecord;
  SavedCursor: TCursor;

begin
  Assert(Assigned(Tree));
  Assert(Assigned(BookIterator));

  IsGroupView := (Tree.Tag = 4);

  //
  // Если включен "плоский" режим отображения, принудительно сбрасываем ключи блокировки
  //
  if Settings.TreeModes[Tree.Tag] = tmFlat then
  begin
    ShowAuth := False;
    ShowSer := False;
  end;

  ShowStatusProgress := True;
  StatusProgress := 0;

  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Tree.BeginUpdate;
    try
      Tree.Clear;
      Tree.NodeDataSize := SizeOf(TBookRecord);

      SelectedNode := nil;

      StatusMessage := rstrBuildingTheList;

      i := 0;
      try
        AuthorNodes := TDictionary<string, PVirtualNode>.Create;
        try
          Max := BookIterator.RecordCount;

          while BookIterator.Next(BookRecord) do
          begin
            SeriesID := BookRecord.SeriesID;

            AuthorNode := nil;
            if ShowAuth then
            begin
              Author := TAuthorsHelper.GetList(BookRecord.Authors);
              if not AuthorNodes.TryGetValue(Author, AuthorNode) then
              begin
                AuthorNode := Tree.AddChild(nil);
                Data := Tree.GetNodeData(AuthorNode);

                Initialize(Data^);
                Data^.nodeType := ntAuthorInfo;
                Data^.Authors := BookRecord.Authors;
                Include(AuthorNode.States, vsInitialUserData);

                AuthorNodes.Add(Author, AuthorNode);
              end;
            end
            else
              AuthorNode := nil;

            Assert(ShowAuth = Assigned(AuthorNode));

            if ShowSer then
            begin
              if SeriesID = NO_SERIES_ID then
              begin
                //
                // книга без серии
                //
                SerieNode := AuthorNode;
              end
              else
              begin
                SerieNode := FindSeriesInTree(Tree, AuthorNode, SeriesID);
                if not Assigned(SerieNode) then
                begin
                  //
                  // Серия не найдена
                  //
                  //
                  Assert(not Assigned(SerieNode));

                  SerieNode := Tree.AddChild(AuthorNode);

                  //
                  // заполним данные о серии
                  //
                  Data := Tree.GetNodeData(SerieNode);

                  Initialize(Data^);
                  Data^.nodeType := ntSeriesInfo;
                  Data^.SeriesID := SeriesID;
                  Data^.Series := BookRecord.Series;
                  Include(SerieNode.States, vsInitialUserData);
                end;
              end;
            end
            else
              SerieNode := AuthorNode;

            //
            // заполним данные о книге
            //
            BookNode := Tree.AddChild(SerieNode);
            Data := Tree.GetNodeData(BookNode);

            Initialize(Data^);
            Data^ := BookRecord;
            Include(BookNode.States, vsInitialUserData);

            if Assigned(SelectedID) and SelectedID^.IsSameAs(Data^.BookKey) then
              SelectedNode := BookNode;

            Inc(i);
            StatusProgress := i * 100 div Max;
          end; // while

          //
          // Отсортировать дерево
          //
          if (Settings.TreeModes[Tree.Tag] = tmFlat) then
            Tree.SortTree(FSortSettings[Tree.Tag].Column, FSortSettings[Tree.Tag].Direction)
          else
            Tree.SortTree(NoColumn, sdAscending);
        finally
          FreeAndNil(AuthorNodes);
        end;
      finally
        ShowStatusProgress := False;
        StatusMessage := rstrReadyMessage;
      end;

      //
      // Выбрать книгу
      //
      if not Assigned(SelectedNode) then
      begin
        SelectedNode := Tree.GetFirst;
        while Assigned(SelectedNode) do
        begin
          Data := Tree.GetNodeData(SelectedNode);
          if Data^.nodeType = ntBookInfo then
            Break;
          SelectedNode := Tree.GetNext(SelectedNode);
        end;
      end;

      if Assigned(SelectedNode) then
      begin
        Tree.Selected[SelectedNode] := True;
        Tree.FocusedNode := SelectedNode;
        Tree.FullyVisible[SelectedNode] := True;
        Tree.ScrollIntoView(SelectedNode, True);
      end;
    finally
      Tree.EndUpdate;
    end;

    case Tree.Tag of
      0: lblBooksTotalA.Caption := Format('(%d)', [i]);
      1: lblBooksTotalS.Caption := Format('(%d)', [i]);
      2: lblBooksTotalG.Caption := Format('(%d)', [i]);
      3: lblTotalBooksFL.Caption := Format('(%d)', [i]);
      4: lblBooksTotalF.Caption := Format('(%d)', [i]);
    end;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.miCopyAuthorClick(Sender: TObject);
var
  AuthorData: PAuthorData;
  SerieData: PSeriesData;
  GenreData: PGenreData;
  strText: string;

  Node: PVirtualNode;

begin
  strText := '';

  case ActiveView of
    AuthorsView:
      begin
        Node := tvAuthors.GetFirstSelected;
        while Assigned(Node) do
        begin
          AuthorData := tvAuthors.GetNodeData(Node);
          if strText = '' then
            strText := AuthorData^.GetFullName
          else
            strText := strText + CRLF + AuthorData^.GetFullName;
          Node := tvAuthors.GetNextSelected(Node);
        end;
      end;

    SeriesView:
      begin
        Node := tvSeries.GetFirstSelected;
        while Assigned(Node) do
        begin
          SerieData := tvSeries.GetNodeData(Node);
          if strText = '' then
            strText := SerieData^.SeriesTitle
          else
            strText := strText + CRLF + SerieData^.SeriesTitle;
          Node := tvSeries.GetNextSelected(Node);
        end;
      end;

    GenresView:
      begin
        Node := tvGenres.GetFirstSelected;
        while Assigned(Node) do
        begin
          GenreData := tvGenres.GetNodeData(Node);
          if strText = '' then
            strText := GenreData.GenreAlias
          else
            strText := strText + CRLF + GenreData.GenreAlias;
          Node := tvGenres.GetNextSelected(Node);
        end;
      end;
  end;

  Clipboard.AsText := Trim(strText);
end;

procedure TfrmMain.miCopyClBrdClick(Sender: TObject);
var
  Tree: TBookTree;
  S, R: string;
  Data: PBookRecord;
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
        S := TAuthorsHelper.GetList(Data^.Authors) + '. ' + rstrSingleSeries + Data^.Series;

      ntBookInfo:
        if NO_SERIES_TITLE = Data^.Series then
          S := TAuthorsHelper.GetList(Data^.Authors) + '. ' + Data^.Title
        else
          S := TAuthorsHelper.GetList(Data^.Authors) + '. ' + rstrSingleSeries + Data^.Series + '. ' + Data^.Title;
    end;
    if S = '' then
      R := S
    else
      R := R + CRLF + S;

    Node := Tree.GetNextSelected(Node);
  end;
  Clipboard.AsText := Trim(R);
end;

procedure TfrmMain.DeleteBookExecute(Sender: TObject);
var
  Tree: TBookTree;
  Node, OldNode: PVirtualNode;
  Data: PBookRecord;
  ALibrary: IBookCollection;
  BookFileName: string;
  SavedCursor: TCursor;
begin
  if ActiveView = FavoritesView then
  begin
    MHLShowWarning(rstrChangeCollectionToRemoveABook);
    Exit;
  end;

  if MessageDlg(rstrRemoveSelectedBooks, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  GetActiveTree(Tree);

  ALibrary := GetActiveBookCollection;
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Node := Tree.GetFirst;
    while Assigned(Node) do
    begin
      Data := Tree.GetNodeData(Node);
      Assert(Assigned(Data));

      if IsSelectedBookNode(Node, Data) then
      begin
        BookFileName := Data^.GetBookFileName;

        if (IsOnline and Data^.IsLocal) and DeleteFile(BookFileName) then
          SetBookLocalStatus(Data^.BookKey, False)
        else
        begin
          if Settings.DeleteFiles then
          begin
            if not IsFB2 then
              DeleteFile(BookFileName)
            else if IsFB2 and IsPrivate then
              DeleteFile(BookFileName);
          end;

          ALibrary.BeginBulkOperation;
          try
            ALibrary.DeleteBook(Data.BookKey);
            ALibrary.EndBulkOperation(True);
          except
            ALibrary.EndBulkOperation(False);
          end;
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
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.DeleteCollectionExecute(Sender: TObject);
var
  DBFileName: string;
  CollectionInfoIterator: ICollectionInfoIterator;
  CollectionInfo: TCollectionInfo;
begin
  { TODO -oNickR -cUsability : Думаю, стоит сделать специальный диалог для этого случая. Тогда мы сможем спросить, удалять файл коллекции или нет. }
  if MessageDlg(rstrRemoveCollection + '"' + GetSystemData.ActiveCollectionInfo.Name + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Delete current collection and choose another:
  DBFileName := GetSystemData.ActiveCollectionInfo.DBFileName;
  GetSystemData.DeleteCollection(GetSystemData.ActiveCollectionInfo.ID);
  DropCollectionDatabase(DBFileName);

  CollectionInfo := TCollectionInfo.Create;
  try
    CollectionInfoIterator := GetSystemData.GetCollectionInfoIterator;
    if CollectionInfoIterator.Next(CollectionInfo) then
      Settings.ActiveCollection := CollectionInfo.ID
    else
      Settings.ActiveCollection := INVALID_COLLECTION_ID;
  finally
    FreeAndNil(CollectionInfo);
  end;
  InitCollection(True);
end;

procedure TfrmMain.miDeleteFilesClick(Sender: TObject);
var
  DatabaseID: Integer;
  FilePath: string;
  BookCollection: IBookCollection;
begin
  DatabaseID := GetSystemData.ActiveCollectionInfo.ID;
  BookCollection := GetActiveBookCollection;

  ProcessNodes(
    procedure (Tree: TBookTree; Node: PVirtualNode)
    var
      Data: PBookRecord;
    begin
      Data := Tree.GetNodeData(Node);
      if Assigned(Data) and (Data^.nodeType = ntBookInfo) and (Data^.BookKey.DatabaseID = DatabaseID) then
      begin
        FilePath := Data^.GetBookFileName;
        try
          if TFile.Exists(FilePath) then
            TFile.Delete(FilePath);
        except
          // игнорируем все ошибки
        end;

        if Data^.IsLocal then
          BookCollection.SetLocal(Data^.BookKey, False);

        UpdateNodes(
          Data^.BookKey,
          procedure(BookData: PBookRecord)
          begin
            Assert(Assigned(BookData));
            BookData^.IsLocal := False;
          end
        );
      end;
    end
  );
end;

procedure TfrmMain.Add2DownloadListExecute(Sender: TObject);
var
  Tree: TBookTree;

  BookNode: PVirtualNode;
  BookData: PBookRecord;

  DownloadNode: PVirtualNode;
  DownloadData: PDownloadData;

  function BookInDownloadList(const BookKey: TBookKey): Boolean;
  var
    Node: PVirtualNode;
    Data: PDownloadData;
  begin
    Result := False;

    Node := tvDownloadList.GetFirst;
    while Assigned(Node) do
    begin
      Data := tvDownloadList.GetNodeData(Node);
      if (Data^.BookKey.IsSameAs(BookKey)) then
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
      if not BookData^.IsLocal and (BookData^.BookKey.DatabaseID = GetSystemData.ActiveCollectionInfo.ID) then
      begin
        if not BookInDownloadList(BookData^.BookKey) then
        begin
          DownloadNode := tvDownloadList.AddChild(nil);
          DownloadData := tvDownloadList.GetNodeData(DownloadNode);

          Initialize(DownloadData^);
          DownloadData^.BookKey := BookData^.BookKey;
          DownloadData^.Author := TAuthorsHelper.GetList(BookData^.Authors);
          DownloadData^.Title := BookData^.Title;
          DownloadData^.Size := BookData^.Size;
          DownloadData^.FileName := BookData^.GetBookFileName;
          DownloadData^.URL := Format(Settings.InpxURL + 'b/%d/get', [BookData^.LibID]);
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

procedure TfrmMain.EditAuthorExecute(Sender: TObject);
(*
var
  Tree: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PBookRecord;
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
    MessageDlg(rstrUnableToEditBooksFromFavourites, mtWarning, [mbOk], 0);
    Exit;
  end;

  if IsLibRusecEdit(0) then
    Exit;

  GetActiveTree(Tree);

  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;

  DMCollection.AuthorBooks.Locate(BOOK_ID_FIELD, Data.BookID, []);
  DMCollection.Authors.Locate(AUTHOR_ID_FIELD, DMCollection.AuthorBooks[AUTHOR_ID_FIELD], []);
  old_AiD := DMCollection.AuthorBooks[AUTHOR_ID_FIELD];

  frmEditAuthor := TfrmEditAuthorDataEx.Create(self);
  try
    frmEditAuthor.LastName := DMCollection.AuthorsFamily.Value;
    frmEditAuthor.FirstName := DMCollection.AuthorsName.Value;
    frmEditAuthor.MidName := DMCollection.AuthorsMiddle.Value;

    if frmEditAuthor.ShowModal = mrOk then
    begin
      S := Trim(AnsiUpperCase(frmEditAuthor.LastName + ' ' + frmEditAuthor.FirstName + ' ' + frmEditAuthor.MidName));

      if (not frmEditAuthor.AddNew) and (not frmEditAuthor.SaveLinks) then
      begin
        // меняем только данные об авторе, все ссылки остаются на месте
        if DMCollection.Authors.Locate(AUTHOR_FULLNAME_FIELDS, VarArrayOf([frmEditAuthor.LastName, frmEditAuthor.FirstName, frmEditAuthor.MidName]), [loCaseInsensitive]) then
        begin
          // если новый автор уже есть, меняем сслыки на него  (объединение)
          new_AiD := DMCollection.AuthorsID.Value;
          repeat
            // меняем старые Id на новые
            { TODO -oNickR -cRefactoring : можно заменить на один UPDATE }
            DMCollection.AuthorBooks.MasterSource := nil;

            Res := DMCollection.AuthorBooks.Locate(AUTHOR_ID_FIELD, old_AiD, []);
            if Res then
            begin
              DMCollection.AuthorBooks.Edit;
              DMCollection.AuthorBooksAuthorID.Value := new_AiD;
              DMCollection.AuthorBooks.Post;
            end;
          until not Res;

          // обновляем индексное поле
          { TODO -oNickR -cRefactoring : можно заменить на один UPDATE }
          repeat
            // TODO -cBug: в поле FullName должен записываться только первый автор
            Res := DMCollection.tblBooks.Locate(BOOK_FULLNAME_FIELD, AnsiUpperCase(Data^.GetAuthors), [loCaseInsensitive]);
            if Res then
            begin
              DMCollection.tblBooks.Edit;
              DMCollection.tblBooksFullName.Value := S;
              DMCollection.tblBooks.Post;
            end;
          until not Res;

          // старого автора удаляем
          if DMCollection.Authors.Locate(AUTHOR_ID_FIELD, old_AiD, []) then
            DMCollection.Authors.Delete;

          DMCollection.AuthorBooks.MasterSource := DMCollection.dsAuthors;
        end // if Locate
        else // если нет - просто редактируем ФИО
        begin
          DMCollection.Authors.Edit;
          DMCollection.AuthorsFamily.Value := frmEditAuthor.LastName;
          DMCollection.AuthorsName.Value := frmEditAuthor.FirstName;
          DMCollection.AuthorsMiddle.Value := frmEditAuthor.MidName;
          DMCollection.Authors.Post;
        end;

        repeat
          { TODO -oNickR -cRefactoring : можно заменить на один UPDATE }
          Res := DMCollection.tblBooks.Locate(BOOK_FULLNAME_FIELD, AnsiUpperCase(Data^.GetAuthors), [loCaseInsensitive]);
          if Res then
          begin
            DMCollection.tblBooks.Edit;
            DMCollection.tblBooksFullName.Value := S;
            DMCollection.tblBooks.Post;
          end;
        until not Res;
      end;

      if (frmEditAuthor.AddNew) then
      begin // заменяем автора на нового
        // добавляем нового автора
        if not DMCollection.Authors.Locate(AUTHOR_FULLNAME_FIELDS, VarArrayOf([frmEditAuthor.LastName, frmEditAuthor.FirstName, frmEditAuthor.MidName]), [loCaseInsensitive]) then
        begin
          DMCollection.Authors.Insert;
          DMCollection.AuthorsFamily.Value := frmEditAuthor.LastName;
          DMCollection.AuthorsName.Value := frmEditAuthor.FirstName;
          DMCollection.AuthorsMiddle.Value := frmEditAuthor.MidName;
          DMCollection.Authors.Post;
        end;

        // меняем ссылки
        DMCollection.AuthorBooks.MasterSource := nil;

        Node := Tree.GetFirst;
        while Assigned(Node) do
        begin
          Data := Tree.GetNodeData(Node);
          if IsSelectedBookNode(Node, Data) then
          begin
            if not frmEditAuthor.SaveLinks then // заменяем ссылки
            begin
              if DMCollection.AuthorBooks.Locate(BOOK_ID_FIELD, Data.BookID, []) then
              begin
                DMCollection.AuthorBooks.Edit;
                DMCollection.AuthorBooksAuthorID.Value := DMCollection.AuthorsID.Value;
                DMCollection.AuthorBooks.Post;
              end
            end
            else
            begin // добавляем второго автора
              DMCollection.AuthorBooks.Insert;
              DMCollection.AuthorBooksAuthorID.Value := DMCollection.AuthorsID.Value;
              DMCollection.AuthorBooksBookID.Value := Data.BookID;

              DMCollection.AuthorBooks.Post;
            end;
            DMCollection.tblBooks.Locate(BOOK_ID_FIELD, Data.BookID, []);
            DMCollection.tblBooks.Edit;
            DMCollection.tblBooksFullName.Value := S;
            DMCollection.tblBooks.Post;
          end;
          Node := Tree.GetNext(Node, False);
        end;
        DMCollection.AuthorBooks.MasterSource := DMCollection.dsAuthors;
      end;
      InitCollection(True);
    end;
  finally
    frmEditAuthor.Free;
  end;
  *)
end;

function TfrmMain.IsLibRusecEdit(BookID: Integer): Boolean;
var
  BookKey: TBookKey;
  BookRecord: TBookRecord;
  URL: string;
begin
  if isExternalCollection(GetSystemData.ActiveCollectionInfo.CollectionType) then
  begin
    //
    // TODO -oNickR : Думаю, стоит приделать к этому диалогу возможность запоминать выбор пользователя и переходить на сайт без вопроса
    //
    if MHLShowWarning(Format(rstrGoToLibrarySite, [GetSystemData.ActiveCollectionInfo.URL]), mbYesNo) = mrYes then
    begin
      BookKey := CreateBookKey(BookID, GetSystemData.ActiveCollectionInfo.ID);
      GetActiveBookCollection.GetBookRecord(BookKey, BookRecord, False);
      { TODO -oNickR -cLibDesc : этот URL должен формироваться обвязкой библиотеки, т к его формат может меняться }
      URL := Format('%sb/%u/edit', [GetSystemData.ActiveCollectionInfo.URL, BookRecord.LibID]);
      SimpleShellExecute(Handle, URL);
    end;
    Result := True;
  end
  else
    Result := False;
end;

procedure TfrmMain.EditBookExecute(Sender: TObject);
var
  Tree: TBookTree;
  Data: PBookRecord;
  Node: PVirtualNode;
  frmEditBook: TfrmEditBookInfo;
begin
  if (ActiveView = FavoritesView) or (ActiveView = DownloadView) then
  begin
    MHLShowWarning(rstrCannotEditFavoritesError);
    Exit;
  end;

  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data^.nodeType <> ntBookInfo) then
    Exit;

  if IsLibRusecEdit(Data^.BookKey.BookID) then
    Exit;

  frmEditBook := TfrmEditBookInfo.Create(Application);
  try
    frmEditBook.OnGetBook := OnGetBookHandler;
    frmEditBook.OnSelectBook := OnSelectBookHandler;
    frmEditBook.OnUpdateBook := OnUpdateBookHandler;
    frmEditBook.OnHelp := OnHelpHandler;

    if frmEditBook.ShowModal = mrOk then
    begin
      UpdatePositions;
      InitCollection(True);
    end;
  finally
    frmEditBook.Free;
  end;
end;

procedure TfrmMain.EditGenresExecute(Sender: TObject);
var
  NodeB: PVirtualNode;
  DataB: PBookRecord;
  Tree: TBookTree;
  ALibrary: IBookCollection;
begin
  if ActiveView = FavoritesView then
  begin
    MHLShowWarning(rstrUnableToEditBooksFromFavourites);
    Exit;
  end;

  if IsLibRusecEdit(0) then
    Exit;

  GetActiveTree(Tree);

  FillGenresTree(frmGenreTree.tvGenresTree);

  if frmGenreTree.ShowModal = mrOk then
  begin
    ALibrary := GetActiveBookCollection;
    NodeB := Tree.GetFirst;
    while Assigned(NodeB) do
    begin
      DataB := Tree.GetNodeData(NodeB);
      if (DataB^.nodeType = ntBookInfo) and ((Tree.CheckState[NodeB] = csCheckedNormal) or (Tree.Selected[NodeB])) then
      begin
        frmGenreTree.GetSelectedGenres(DataB^);

        ALibrary.BeginBulkOperation;
        try
          ALibrary.CleanBookGenres(DataB.BookKey.BookID);
          ALibrary.InsertBookGenres(DataB.BookKey.BookID, DataB^.Genres);

          ALibrary.EndBulkOperation(True); // commit
        except
          ALibrary.EndBulkOperation(False); // rollback
        end;
      end;
      Tree.RepaintNode(NodeB);
      NodeB := Tree.GetNext(NodeB);
    end;
    UpdatePositions;
    InitCollection(True);
  end;
end;

procedure TfrmMain.EditSeriesExecute(Sender: TObject);
var
  Tree: TBookTree;
  Data: PBookRecord;
  Node: PVirtualNode;
  AuthID: Integer;
  S: string;
  SeriesID: Integer;
  BookCollection: IBookCollection;
begin
  if ActiveView = FavoritesView then
  begin
    MHLShowWarning(rstrUnableToEditBooksFromFavourites);
    Exit;
  end;

  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) then
    Exit;

  if IsLibRusecEdit(Data^.BookKey.BookID) then
    Exit;

  S := Data^.Series;
  BookCollection := GetActiveBookCollection;

  if Data^.nodeType = ntBookInfo then // Standing on a book node, change/add series info
  begin
    if InputQuery(rstrCreateMoveSeries, rstrTitle, S) then
    begin
      SeriesID := BookCollection.FindOrCreateSeries(S);
      Node := Tree.GetFirst;
      while Assigned(Node) do
      begin
        Data := Tree.GetNodeData(Node);
        if ((Tree.CheckState[Node] = csCheckedNormal) or (Tree.Selected[Node])) then
          BookCollection.SetSeriesID(Data^.BookKey, SeriesID);
        Node := Tree.GetNext(Node);
      end;

      FillAllBooksTree;
    end;
  end
  else if InputQuery(rstrEditSeries, rstrTitle, S) then // Change a series node
  begin
    if S = NO_SERIES_TITLE then
    begin
      // Clear the series for all books in DB:
      BookCollection.ChangeBookSeriesID(Data^.SeriesID, NO_SERIES_ID, GetSystemData.ActiveCollectionInfo.ID);
      FillAllBooksTree;
    end
    else
    begin
      BookCollection.SetSeriesTitle(Data^.SeriesID, S);
      Data^.Series := S;
      Tree.RepaintNode(Node);
    end;
  end;

  UpdatePositions;
  InitCollection(True);
end;

procedure TfrmMain.AddGroupExecute(Sender: TObject);
var
  GroupName: string;
begin
  if NewGroup(GroupName) then
  begin
    if GetSystemData.AddGroup(GroupName) then
    begin
      CreateGroupsMenu;
      FillGroupsList(tvGroups, FLastGroupID);
    end
    else
      MHLShowError(rstrGroupAlreadyExists);
  end;
end;

procedure TfrmMain.RenameGroupExecute(Sender: TObject);
var
  Data: PGroupData;
  GroupName: string;
begin
  Data := tvGroups.GetNodeData(tvGroups.GetFirstSelected());
  if not Assigned(Data) or not Data^.CanDelete then
    Exit;

  GroupName := Data^.Text;

  if EditGroup(GroupName) then
  begin
    if GetSystemData.RenameGroup(Data^.GroupID, GroupName) then
    begin
      CreateGroupsMenu;
      FillGroupsList(tvGroups, FLastGroupID);
    end
    else
      MHLShowError(rstrGroupAlreadyExists);
  end;
end;

procedure TfrmMain.DeleteGroupExecute(Sender: TObject);
var
  Data: PGroupData;
begin
  Data := tvGroups.GetNodeData(tvGroups.GetFirstSelected());
  if not Assigned(Data) then
    Exit;

  if Data^.CanDelete then
  begin
    GetSystemData.DeleteGroup(Data^.GroupID);

    CreateGroupsMenu;
    FillGroupsList(tvGroups, FLastGroupID);
  end
  else
    MHLShowError(rstrUnableDeleteBuiltinGroupError);
end;

//
// Очистить выделенную группу
//
procedure TfrmMain.ClearGroupExecute(Sender: TObject);
var
  GroupData: PGroupData;
  SavedCursor: TCursor;
begin
  GroupData := tvGroups.GetNodeData(tvGroups.GetFirstSelected());
  if not Assigned(GroupData) then
    Exit;

  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    GetSystemData.ClearGroup(GroupData^.GroupID);

    FillBooksTree(tvBooksF, GetSystemData.GetBookIterator(GroupBookFIlter), True, True, @FLastGroupBookID); // избранное
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.ChangeToolbarVisability(ToolBars: array of TToolBar; ToolBar: TToolBar; ShowToolbar: Boolean);
var
  BarTop: Integer;
  i: Integer;
begin
  DisableAlign;
  try
    if ShowToolbar then
    begin
      //
      // раздвигаем тулбары для правильного алигна
      // Располагаем текущий тулбар под первым видимым старшим
      // а все видимые младшие сдвигаем на 1 ниже
      //
      BarTop := 0;
      for i := 0 to High(ToolBars) do
      begin
        if ToolBars[i] = ToolBar then
          Break;
        if ToolBars[i].Visible then
          BarTop := ToolBars[i].BoundsRect.Bottom;
      end;

      ToolBar.Top := BarTop;

      for i := High(ToolBars) downto 0 do
      begin
        if ToolBars[i] = ToolBar then
          Break;
        if ToolBars[i].Visible then
          ToolBars[i].Top := ToolBars[i].Top + 1;
      end;
    end;
    ToolBar.Visible := ShowToolbar;
  finally
    EnableAlign;
  end;
end;

procedure TfrmMain.ShowRusAlphabetUpdate(Sender: TObject);
begin
  acShowRusAlphabet.Checked := Settings.ShowRusBar;
end;

procedure TfrmMain.ShowRusAlphabetExecute(Sender: TObject);
begin
  Settings.ShowRusBar := not Settings.ShowRusBar;
  ChangeToolbarVisability(FAuthorBars, tbarAuthorsRus, Settings.ShowRusBar);
  ChangeToolbarVisability(FSerieBars, tbarSeriesRus, Settings.ShowRusBar);
end;

procedure TfrmMain.ShowEngAlphabetUpdate(Sender: TObject);
begin
  acShowEngAlphabet.Checked := Settings.ShowEngBar;
end;

procedure TfrmMain.ShowEngAlphabetExecute(Sender: TObject);
begin
  Settings.ShowEngBar := not Settings.ShowEngBar;
  ChangeToolbarVisability(FAuthorBars, tbarAuthorsEng, Settings.ShowEngBar);
  ChangeToolbarVisability(FSerieBars, tbarSeriesEng, Settings.ShowEngBar);
end;

procedure TfrmMain.ShowEditToolbarUpdate(Sender: TObject);
begin
  acShowEditToolbar.Checked := Settings.EditToolBarVisible;
end;

procedure TfrmMain.ShowEditToolbarExecute(Sender: TObject);
begin
  Settings.EditToolBarVisible := not Settings.EditToolBarVisible;
  ChangeToolbarVisability(FMainBars, tlbrEdit, Settings.EditToolBarVisible);
end;

procedure TfrmMain.ShowMainToolbarUpdate(Sender: TObject);
begin
  acShowMainToolbar.Checked := Settings.ShowToolbar;
end;

procedure TfrmMain.ShowMainToolbarExecute(Sender: TObject);
begin
  Settings.ShowToolbar := not Settings.ShowToolbar;
  ChangeToolbarVisability(FMainBars, tlbrMain, Settings.ShowToolbar);
end;

procedure TfrmMain.ShowStatusbarUpdate(Sender: TObject);
begin
  acShowStatusbar.Checked := Settings.ShowStatusBar;
end;

procedure TfrmMain.ShowStatusbarExecute(Sender: TObject);
begin
  Settings.ShowStatusBar := not Settings.ShowStatusBar;
  StatusBar.Visible := Settings.ShowStatusBar;
end;

procedure TfrmMain.ShowBookInfoPanelUpdate(Sender: TObject);
begin
  acShowBookInfoPanel.Checked := Settings.ShowInfoPanel;
end;

procedure TfrmMain.ShowBookInfoPanelExecute(Sender: TObject);
begin
  Settings.ShowInfoPanel := not Settings.ShowInfoPanel;

  //
  // TODO: Принудительно обновим информацию о книге, т к если она не показывалась, то и не обновлялась
  //
  //if Settings.ShowInfoPanel then
  //  tvBooksTreeChange(nil, nil);

  SetInfoPanelVisible(Settings.ShowInfoPanel);
end;

procedure TfrmMain.ShowBookCoverExecute(Sender: TObject);
begin
  Settings.ShowBookCover := not Settings.ShowBookCover;

  //
  // TODO: Принудительно обновим информацию о книге, т к если она не показывалась, то и не обновлялась
  //
  //if Settings.ShowInfoPanel and Settings.ShowBookCover then
  //  tvBooksTreeChange(nil, nil);

  SetShowBookCover(Settings.ShowBookCover);
end;

procedure TfrmMain.ShowBookCoverUpdate(Sender: TObject);
begin
  acShowBookCover.Checked := Settings.ShowBookCover;
  acShowBookCover.Enabled := Settings.ShowInfoPanel;
end;

procedure TfrmMain.ShowBookAnnotationExecute(Sender: TObject);
begin
  Settings.ShowBookAnnotation := not Settings.ShowBookAnnotation;

  //
  // TODO: Принудительно обновим информацию о книге, т к если она не показывалась, то и не обновлялась
  //
  //if Settings.ShowInfoPanel and Settings.ShowBookAnnotation then
  //  tvBooksTreeChange(nil, nil);

  SetShowBookAnnotation(Settings.ShowBookAnnotation);
end;

procedure TfrmMain.ShowBookAnnotationUpdate(Sender: TObject);
begin
  acShowBookAnnotation.Checked := Settings.ShowBookAnnotation;
  acShowBookAnnotation.Enabled := Settings.ShowInfoPanel;
end;

procedure TfrmMain.BookSetRateExecute(Sender: TObject);
var
  NewRate: Integer;
  BookCollection: IBookCollection;
begin
  if Sender = acBookSetRate1 then
    NewRate := 1
  else if Sender = acBookSetRate2 then
    NewRate := 2
  else if Sender = acBookSetRate3 then
    NewRate := 3
  else if Sender = acBookSetRate4 then
    NewRate := 4
  else if Sender = acBookSetRate5 then
    NewRate := 5
  else
    NewRate := 0;

  BookCollection := GetActiveBookCollection;
  ProcessNodes(
    procedure (Tree: TBookTree; Node: PVirtualNode)
    var
      Data: PBookRecord;
    begin
      Data := Tree.GetNodeData(Node);
      if Assigned(Data) and (Data^.nodeType = ntBookInfo) then
      begin
        BookCollection.SetRate(Data^.BookKey, NewRate);
        UpdateNodes(
          Data^.BookKey,
          procedure(BookData: PBookRecord)
          begin
            Assert(Assigned(BookData));
            BookData^.Rate := NewRate;
          end
        );
      end;
    end
  );
end;

procedure TfrmMain.UpdateBookAction(Sender: TObject);
var
  fBookNodesSelected: Boolean;
begin
  fBookNodesSelected := False;

  ProcessNodes(
    procedure (Tree: TBookTree; Node: PVirtualNode)
    var
      Data: PBookRecord;
    begin
      Data := Tree.GetNodeData(Node);
      if Assigned(Data) and (Data^.nodeType = ntBookInfo) then
      begin
        fBookNodesSelected := True;
      end;
    end
  );

  (Sender as TAction).Enabled := fBookNodesSelected;
end;

procedure TfrmMain.SavePresetUpdate(Sender: TObject);
begin
  acSavePreset.Enabled := (Trim(cbPresetName.Text) <> '');
end;

procedure TfrmMain.DeletePresetUpdate(Sender: TObject);
begin
  acDeletePreset.Enabled := cbPresetName.Items.IndexOf(cbPresetName.Text) <> -1;
end;

function TfrmMain.UpdateEditAction(Action: TAction): Boolean;
begin
  Result := isOnlineCollection(GetSystemData.ActiveCollectionInfo.CollectionType);

  if Result then
    Action.Enabled := False;

  Action.Visible := not Result;
end;

procedure TfrmMain.EditAuthorUpdate(Sender: TObject);
var
  Data: PAuthorData;
begin
  //
  // нельзя редактировать данные из онлайн коллекции
  //
  if UpdateEditAction(acEditAuthor) then
    Exit;

  //
  // только на старанице "по авторам"
  //
  if ActiveView <> AuthorsView then
  begin
    acEditAuthor.Enabled := False;
    Exit;
  end;

  Data := tvAuthors.GetNodeData(tvAuthors.GetFirstSelected);
  acEditAuthor.Enabled := Assigned(Data);
end;

procedure TfrmMain.EditSerieUpdate(Sender: TObject);
var
  Data: PSeriesData;
begin
  //
  // нельзя редактировать данные из онлайн коллекции
  //
  if UpdateEditAction(acEditSerie) then
    Exit;

  //
  // только на старанице "по сериям"
  //
  if ActiveView <> SeriesView then
  begin
    acEditSerie.Enabled := False;
    Exit;
  end;

  Data := tvSeries.GetNodeData(tvSeries.GetFirstSelected);
  acEditSerie.Enabled := Assigned(Data);
end;

procedure TfrmMain.EditGenreUpdate(Sender: TObject);
var
  Data: PGenreData;
begin
  //
  // нельзя редактировать данные из онлайн коллекции
  //
  if UpdateEditAction(acEditGenre) then
    Exit;

  //
  // только на старанице "по жанрам"
  //
  if ActiveView <> GenresView then
  begin
    acEditGenre.Enabled := False;
    Exit;
  end;

  Data := tvGenres.GetNodeData(tvGenres.GetFirstSelected);
  acEditGenre.Enabled := Assigned(Data);
end;

function TfrmMain.InternalUpdateGroupAction(Action: TAction): Boolean;
begin
  Result := ActiveView <> FavoritesView;
  if Result then
    Action.Enabled := False;
end;

procedure TfrmMain.AddGroupUpdate(Sender: TObject);
begin
  //
  // только на старанице "по группам"
  //
  if InternalUpdateGroupAction(acGroupCreate) then
    Exit;

  acGroupCreate.Enabled := True;
end;

procedure TfrmMain.EditGroupUpdate(Sender: TObject);
var
  Data: PGroupData;
begin
  //
  // только на старанице "по группам"
  //
  if InternalUpdateGroupAction(Sender as TAction) then
    Exit;

  Data := tvGroups.GetNodeData(tvGroups.GetFirstSelected);
  (Sender as TAction).Enabled := Assigned(Data) and Data^.CanDelete;
end;

procedure TfrmMain.ClearGroupUpdate(Sender: TObject);
var
  Data: PGroupData;
begin
  //
  // только на старанице "по группам"
  //
  if InternalUpdateGroupAction(acGroupClear) then
    Exit;

  Data := tvGroups.GetNodeData(tvGroups.GetFirstSelected);
  acGroupClear.Enabled := Assigned(Data);
end;

procedure TfrmMain.AddBookToGroup(Sender: TObject);
var
  Tree: TBookTree;
  booksToProcess: Integer;
  booksProcessed: Integer;
  GroupID: Integer;
  GroupData: PGroupData;
  SavedCursor: TCursor;
  BookCollection: IBookCollection;
begin
  GetActiveTree(Tree);
  Assert(Assigned(Tree));

  booksToProcess := Tree.CheckedCount;
  if Assigned(Tree.FocusedNode) and (Tree.CheckState[Tree.FocusedNode] <> csCheckedNormal) then
    Inc(booksToProcess);
  if booksToProcess = 0 then
    Exit;
  booksProcessed := 0;

  if Sender is TMenuItem then
    GroupID := (Sender as TMenuItem).Tag
  else
    GroupID := FAVORITES_GROUP_ID;

  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    StatusMessage := rstrAddingBookToGroup;
    StatusProgress := 0;
    ShowStatusProgress := True;
    try
      BookCollection := GetActiveBookCollection;
      ProcessNodes(
        procedure (Tree: TBookTree; Node: PVirtualNode)
        var
          Data: PBookRecord;
        begin
          Data := Tree.GetNodeData(Node);
          if Assigned(Data) and (Data^.nodeType = ntBookInfo) then
          begin
            BookCollection.AddBookToGroup(Data^.BookKey, GroupID);

            Inc(booksProcessed);
            StatusProgress := booksProcessed * 100 div booksToProcess;
          end;
        end
      );
    finally
      ShowStatusProgress := False;
    end;
  finally
    Screen.Cursor := SavedCursor;
  end;

  //
  // если выделенная группа совпадает с той, куда добавляем книги, нужно перерисовать список
  //
  GroupData := tvGroups.GetNodeData(tvGroups.GetFirstSelected);
  if Assigned(GroupData) and (GroupData^.GroupID = GroupID) then
  begin
    FillBooksTree(tvBooksF, GetSystemData.GetBookIterator(GroupBookFIlter), True, True, @FLastGroupBookID); // Группы
  end;
end;

procedure TfrmMain.DeleteBookFromGroup(Sender: TObject);
var
  GroupData: PGroupData;
  booksToProcess: Integer;
  booksProcessed: Integer;
  SavedCursor: TCursor;
begin
  Assert(ActiveView = FavoritesView);

  booksToProcess := tvBooksF.CheckedCount;
  if Assigned(tvBooksF.FocusedNode) and (tvBooksF.CheckState[tvBooksF.FocusedNode] <> csCheckedNormal) then
    Inc(booksToProcess);
  if booksToProcess = 0 then
    Exit;
  booksProcessed := 0;

  GroupData := tvGroups.GetNodeData(tvGroups.GetFirstSelected);
  if not Assigned(GroupData) then
    Exit;

  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    StatusMessage := rstrRemovingBookFromGroup;
    StatusProgress := 0;
    ShowStatusProgress := True;
    try
      ProcessNodes(
        procedure (Tree: TBookTree; Node: PVirtualNode)
        var
          Data: PBookRecord;
        begin
          Data := Tree.GetNodeData(Node);
          if Assigned(Data) and (Data^.nodeType = ntBookInfo) then
          begin
            GetSystemData.DeleteFromGroup(Data.BookKey, GroupData^.GroupID);

            Inc(booksProcessed);
            StatusProgress := booksProcessed * 100 div booksToProcess;
          end;
        end
      );

      //
      // удалить информацию о книгах, не входящих ни в одну группу
      //
      GetSystemData.RemoveUnusedBooks;

      FillBooksTree(tvBooksF, GetSystemData.GetBookIterator(GroupBookFIlter), True, True, @FLastGroupBookID);
    finally
      ShowStatusProgress := False;
    end;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.miAddToSearchClick(Sender: TObject);
var
  Edit: TMHLButtonedEdit;
  treeView: TVirtualStringTree;
  Node: PVirtualNode;
  Data: PAuthorData;
  // TODO : отдельный тип данных для серии
begin
  case ActiveView of
    AuthorsView:
      begin
        treeView := tvAuthors;
        Edit := edFFullName;
      end;
    SeriesView:
      begin
        Assert(False, rstrNeedSpecialDataTypeForSeries);
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
      Edit.Text := Format('%s OR%s="%s"', [Edit.Text, CRLF, Data^.GetFullName]);
    Node := treeView.GetNextSelected(Node);
  end;
end;

procedure TfrmMain.QuickSearchExecute(Sender: TObject);
begin
  unit_Utils.LocateBook;
end;

procedure TfrmMain.ImportFb2Execute(Sender: TObject);
begin
//  DMCollection.DBCollection.Connected := False;

  unit_Import.ImportFB2(GetSystemData.ActiveCollectionInfo);

  InitCollection(True);
end;

procedure TfrmMain.ImportFb2Update(Sender: TObject);
var
  Action: TAction;
begin
  Assert(Sender is TAction);

  Action := Sender as TAction;
  Action.Visible := IsPrivate and (IsFB2 or Settings.AllowMixed);
  Action.Enabled := Action.Visible;
end;

procedure TfrmMain.ImportFb2ZipExecute(Sender: TObject);
begin
//  DMCollection.DBCollection.Connected := False;

  unit_Import.ImportFB2ZIP(GetSystemData.ActiveCollectionInfo);

  InitCollection(True);
end;

procedure TfrmMain.ImportFBDExecute(Sender: TObject);
begin
//  DMCollection.DBCollection.Connected := False;

  unit_Import.ImportFBD(GetSystemData.ActiveCollectionInfo);

  InitCollection(True);
end;

procedure TfrmMain.SaveSearchPreset(Sender: TObject);
var
  presetName: string;
  preset: TSearchPreset;
begin
  presetName := Trim(cbPresetName.Text);
  if presetName = '' then
    Exit;

  preset := FPresets.GetPreset(presetName);
  preset.Clear;

  preset.AddOrSetValue(SF_AUTHORS, edFFullName.Text);
  preset.AddOrSetValue(SF_TITLE, edFTitle.Text);
  preset.AddOrSetValue(SF_SERIES, edFSeries.Text);
  preset.AddOrSetValue(SF_GENRE_TITLE, edFGenre.Text);
  preset.AddOrSetValue(SF_GENRE_CODES, edFGenre.Hint);
  preset.AddOrSetValue(SF_ANNOTATION, edFAnnotation.Text);

  preset.AddOrSetValue(SF_FILE, edFFile.Text);
  preset.AddOrSetValue(SF_FOLDER, edFFolder.Text);
  preset.AddOrSetValue(SF_EXTENSION, edFExt.Text);

  preset.AddOrSetValue(SF_DOWNLOADED, IntToStr(cbDownloaded.ItemIndex));
  preset.AddOrSetValue(SF_KEYWORDS, edFKeyWords.Text);
  preset.AddOrSetValue(SF_DELETED, BoolToStr(cbDeleted.Checked));
  preset.AddOrSetValue(SF_DATE, IntToStr(cbDate.ItemIndex));
  preset.AddOrSetValue(SF_LANG, IntToStr(cbLang.ItemIndex));

  FPresets.Save(Settings.SystemFileName[sfPresets]);

  if cbPresetName.Items.IndexOf(presetName) = -1 then
    cbPresetName.Items.Add(presetName);
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
  Data: PSeriesData;
begin
  tvSeries.ClearSelection;
  Node := tvSeries.GetFirst;

  while Assigned(Node) do
  begin
    Data := tvSeries.GetNodeData(Node);
    Assert(Assigned(Data));
    if StartsText(Text, Data^.SeriesTitle) then
    begin
      tvSeries.Selected[Node] := True;
      tvSeries.FocusedNode := Node;
      Exit;
    end;
    Node := tvSeries.GetNext(Node);
  end;
end;

procedure TfrmMain.LocateBook(const Text: string; MoveForward: Boolean);
var
  Node: PVirtualNode;
  Data: PBookRecord;
  L: Integer;
  Tree: TBookTree;
  FixedText: string;
begin
  GetActiveTree(Tree);

  Tree.ClearSelection;

  if not MoveForward then
    FLastFoundBook := nil;

  if MoveForward and Assigned(FLastFoundBook) then
    Node := Tree.GetNext(FLastFoundBook)
  else
    Node := Tree.GetFirst;

  L := Length(Text);
  FixedText := AnsiUpperCase(Text);

  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if FixedText = Copy(AnsiUpperCase(Data.Title), 1, L) then
    begin
      Tree.Selected[Node] := True;
      Tree.FocusedNode := Node;

      if not MoveForward then
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
  Button: TToolButton;
begin
  //
  // Проверим текущий фильтр и изменим его если нужо
  //
  Assert(Assigned(FLastLetterA));
  Button := GetFilterButton(FAuthorBars, edLocateAuthor.Text);
  // Assert(Assigned(Button));

  if Assigned(Button) and (Button <> FLastLetterA) then
  begin
    InternalSetAuthorFilter(Button);
  end;

  LocateAuthor(edLocateAuthor.Text);
end;

procedure TfrmMain.edLocateAuthorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ActiveView = AuthorsView then
  begin
    if Key = VK_UP then
      tvAuthors.Perform(WM_KEYDOWN, VK_UP, 0)
    else if Key = VK_DOWN then
      tvAuthors.Perform(WM_KEYDOWN, VK_DOWN, 0)
    else if Key = VK_RETURN then
      frmMain.ActiveControl := tvBooksA;
  end
  else if ActiveView = SeriesView then
  begin
    if Key = VK_UP then
      tvSeries.Perform(WM_KEYDOWN, VK_UP, 0)
    else if Key = VK_DOWN then
      tvSeries.Perform(WM_KEYDOWN, VK_DOWN, 0)
    else if Key = VK_RETURN then
      frmMain.ActiveControl := tvBooksS;
  end;
end;

procedure TfrmMain.ShowExpressionEditor(Sender: TObject);
var
  frmEditor: TfrmEditor;
begin
  frmEditor := TfrmEditor.Create(Self);
  try
    frmEditor.Text := (Sender as TMHLButtonedEdit).Text;
    if frmEditor.ShowModal = mrOk then
      (Sender as TMHLButtonedEdit).Text := frmEditor.Text;
  finally
    frmEditor.Free;
  end;
end;

procedure TfrmMain.PresetFieldKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    acApplyPreset.Execute;
end;

procedure TfrmMain.ShowGenreEditor(Sender: TObject);
var
  frmGenres: TfrmGenreTree;
  Data: PGenreData;
  Node: PVirtualNode;
  Genres: TBookGenres;
begin
  frmGenres := TfrmGenreTree.Create(Application);
  try
    FillGenresTree(frmGenres.tvGenresTree);
    if frmGenres.ShowModal = mrOk then
    begin
      frmGenres.GetSelectedGenres(Genres);

      edFGenre.Text := TArrayUtils.Join<TGenreData>(
        Genres,
        ' / ',
        function(const Genre: TGenreData): string
        begin
          Result := Genre.GenreAlias;
        end
      );

      edFGenre.Hint := TArrayUtils.Join<TGenreData>(
        Genres,
        ' OR ',
        function(const Genre: TGenreData): string
        begin
          Result := Format('(g.GenreCode = "%s")', [Genre.GenreCode]);
        end
      );
    end;
  finally
    frmGenres.Free;
  end;
end;

procedure TfrmMain.edFGenreKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(8) then
  begin
    edFGenre.Text := '';
    edFGenre.Hint := '';
  end;
  Key := Chr(0);
end;

procedure TfrmMain.edLocateSeriesChange(Sender: TObject);
var
  S: string;
  OldText: string;
begin
  if Length(edLocateSeries.Text) = 0 then
    Exit;

  S := AnsiUpperCase(Copy(edLocateSeries.Text, 1, 1));
  if S <> FLastLetterS.Caption then
  begin
    OldText := edLocateSeries.Text;
    ChangeLetterButton(S);
    edLocateSeries.Text := OldText;
    edLocateSeries.Perform(WM_KEYDOWN, VK_RIGHT, 0);
  end;

  LocateSerie(edLocateSeries.Text);
end;

procedure TfrmMain.ShowAboutExecute(Sender: TObject);
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
  CollectionInfo: TCollectionInfo;
begin
  i := (Sender as TMenuItem).Tag;
  CollectionInfo := TCollectionInfo.Create;
  try
    if GetSystemData.GetCollectionInfo(i, CollectionInfo) then
    begin
      (Sender as TMenuItem).Checked := True;
      Settings.ActiveCollection := i;
      InitCollection(True);
    end;
  finally
    FreeAndNil(CollectionInfo);
  end;
end;

procedure TfrmMain.ShowBookInfo(Sender: TObject);
var
  Tree: TBookTree;
  Data: PBookRecord;
  frmBookDetails: TfrmBookDetails;

  bookStream: TStream;
  ReviewEditable: Boolean;

  URL: string;

  strReview: string;
  NewCode: Integer;
  BookCollection: IBookCollection;
begin
  GetActiveTree(Tree);
  Assert(Assigned(Tree));

  Data := Tree.GetNodeData(Tree.FocusedNode);
  if not Assigned(Data) or (Data^.nodeType <> ntBookInfo) then
    Exit;

  FFormBusy := True;
  try
    BookCollection := GetActiveBookCollection;

    //
    // ревью можно изменять только для книг из текущей коллекции
    //
    ReviewEditable := (Data^.BookKey.DatabaseID = GetSystemData.ActiveCollectionInfo.ID);

    frmBookDetails := TfrmBookDetails.Create(Application);
    try
      //
      // загрузим книгу в стрим и отдадим его форме для чтения из него информации
      // сейчас мы грузим только fb2 или fbd, т к больше ничего разбирать не умеем
      //
      try
        bookStream := Data^.GetBookDescriptorStream;
        try
          frmBookDetails.FillBookInfo(Data^, bookStream)
        finally
          FreeAndNil(bookStream);
        end;
      except
        //
        // Скорее всего произошла ошибка при чтении файла (не найден, а должен был быть)
        // или при парсинге книги (загрузили какую-то ерунду).
        // Покажем сообщение об ощибке и загрузим только библиотечную информацию
        //
        on e: Exception do
        begin
          if not (e is ENotSupportedException) then
            MHLShowError(e.Message);
          frmBookDetails.FillBookInfo(Data^, nil);
        end;
      end;

      frmBookDetails.mmReview.ReadOnly := not ReviewEditable;

      if IsOnline and ReviewEditable then
      begin
        { TODO -oNickR -cLibDesc : этот URL должен формироваться обвязкой библиотеки, т к его формат может меняться }
        if GetSystemData.ActiveCollectionInfo.URL = '' then
          URL := Format('%sb/%d/', [Settings.InpxURL, Data^.LibID])
        else
          URL := Format('%sb/%d/', [GetSystemData.ActiveCollectionInfo.URL, Data^.LibID]);

        frmBookDetails.AllowOnlineReview(URL);
      end;

      if Data^.Code = 1 then
        //
        // ревью уже есть - покажем его
        //
        frmBookDetails.Review := BookCollection.GetReview(Data^.BookKey)
      else if IsOnline and ReviewEditable and Settings.AutoLoadReview then
        DownloadReview(frmBookDetails, URL);

      frmBookDetails.ShowModal;

      if not frmBookDetails.ReviewChanged then
        Exit;

      strReview := frmBookDetails.Review;
    finally
      FreeAndNil(frmBookDetails);
    end;

    NewCode := BookCollection.SetReview(Data^.BookKey, strReview);
    UpdateNodes(
      Data^.BookKey,
      procedure(BookData: PBookRecord)
      begin
        Assert(Assigned(BookData));
        BookData^.Code := NewCode;
      end
    );
  finally
    FFormBusy := False;
  end;
end;

procedure TfrmMain.QuitAppExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.pmiCheckAllClick(Sender: TObject);
begin
  Selection(True);
end;

procedure TfrmMain.pmAuthorPopup(Sender: TObject);
begin
  // actions
  miAddToSearch.Visible := (ActiveView <> GenresView);
end;

procedure TfrmMain.pmiDeselectAllClick(Sender: TObject);
begin
  Selection(False);
end;

procedure TfrmMain.pmiSelectAllClick(Sender: TObject);
var
  Tree: TBookTree;
begin
  GetActiveTree(Tree);
  Tree.SelectAll(False);
end;

procedure TfrmMain.GoForumExecute(Sender: TObject);
begin
  SimpleShellExecute(Handle, 'http://myhomelib.org/');
end;

procedure TfrmMain.GoSiteExecute(Sender: TObject);
begin
  SimpleShellExecute(Handle, 'http://home-lib.net/');
end;

procedure TfrmMain.miGoToAuthorClick(Sender: TObject);
var
  Tree: TBookTree;
  Node: PVirtualNode;
  Data: PBookRecord;
  FullAuthorName: string;
  SavedCursor: TCursor;
  CollectionInfo: TCollectionInfo;
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

  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if Data^.BookKey.DatabaseID <> GetSystemData.ActiveCollectionInfo.ID then
    begin
      CollectionInfo := TCollectionInfo.Create;
      try
        if GetSystemData.GetCollectionInfo(Data^.BookKey.DatabaseID, CollectionInfo) then
        begin
          Settings.ActiveCollection := Data^.BookKey.DatabaseID;
          InitCollection(True);
        end
        else
        begin
          Screen.Cursor := SavedCursor;
          MHLShowError(rstrCollectionNotRegistered);
          Exit;
        end;
      finally
        FreeAndNil(CollectionInfo);
      end;

      Assert(Length(Data^.Authors) > 0);
      FullAuthorName := Data^.Authors[0].GetFullName;
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
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.CheckUpdatesExecute(Sender: TObject);
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
            MHLShowError(rstrUpdateFailedServerNotFound, [E.LastError])
          else
            MHLShowError(rstrUpdateFailedConnectionError, [E.LastError]);
        on E: Exception do
          MHLShowError(rstrUpdateFailedServerError, [HTTP.ResponseCode]);
      end;
      { TODO -oNickR -cRefactoring : проверить использование файла last_version.info. Возможно он больше нигде не нужен и можно не сохранять его на диск }
      LF.SaveToFile(Settings.SystemFileName[sfAppVerInfo]);
      SL.LoadFromFile(Settings.SystemFileName[sfAppVerInfo]);
      if SL.Count > 0 then
        if CompareStr(GetFileVersion(Application.ExeName), SL[0]) < 0 then
        begin
          S := CRLF;
          for i := 1 to SL.Count - 1 do
            S := S + '  ' + SL[i] + CRLF;

          MHLShowInfo(Format(rstrFoundNewAppVersion, [SL[0] + CRLF + S + CRLF]));
        end
        else if not FAutoCheck then
          MHLShowInfo(rstrLatestVersion);
      FAutoCheck := False;
    finally
      HTTP.Free;
      SL.Free;
    end;
  finally
    LF.Free;
  end;
end;

procedure TfrmMain.ShowCollectionStatisticsExecute(Sender: TObject);
var
  frmStat: TfrmStat;
begin
  frmStat := TfrmStat.Create(Application);
  try
    frmStat.LoadCollectionInfo;
    frmStat.ShowModal;
  finally
    frmStat.Free;
  end;
end;

procedure TfrmMain.SyncFilesExecute(Sender: TObject);
begin
  UpdatePositions;

  if isOnlineCollection(GetSystemData.ActiveCollectionInfo.CollectionType) then
    unit_Utils.SyncOnLineFiles
  else
    unit_Utils.SyncFolders;

  InitCollection(True);
end;

procedure TfrmMain.UpdateOnlineCollectionExecute(Sender: TObject);
var
  ActiveCollectionID: Integer;
begin
  if CheckLibUpdates(False) then
  begin
    UpdatePositions;

    ActiveCollectionID := GetSystemData.ActiveCollectionInfo.ID;
    StartLibUpdate;
    Settings.ActiveCollection := ActiveCollectionID;
    GetSystemData.ActivateCollection(ActiveCollectionID);
    InitCollection(True);
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

procedure TfrmMain.CompactDataBaseExecute(Sender: TObject);
begin
  GetActiveBookCollection.CompactDatabase;

  //GetSystemData.SetTableState(True);
end;

procedure TfrmMain.Conver2FBDExecute(Sender: TObject);
var
  Tree: TBookTree;
  Node: PVirtualNode;
  Data: PBookRecord;
  frmConvert: TfrmConvertToFBD;
begin
  if (ActiveView = FavoritesView) or (ActiveView = DownloadView) then
  begin
    MHLShowWarning(rstrToConvertChangeCollection);
    Exit;
  end;

  //
  // Locate the selected book record and pass it to the edit form
  //
  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data^.nodeType <> ntBookInfo) then
    Exit;

  frmConvert := TfrmConvertToFBD.Create(Application);
  try
    frmConvert.OnGetBook := OnGetBookHandler;
    frmConvert.OnReadBook := OnReadBookHandler;
    frmConvert.OnSelectBook := OnSelectBookHandler;
    frmConvert.OnChangeBook2Zip := OnChangeBook2ZipHandler;

    frmConvert.ShowModal;
  finally
    frmConvert.Free;
  end;
end;

procedure TfrmMain.N33Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.ClearReadFolderExecute(Sender: TObject);
var
  dirPath: string;
begin
  dirPath := ExcludeTrailingPathDelimiter(Settings.ReadPath);
  if DirectoryExists(dirPath) then
    ClearDir(dirPath);
end;

procedure TfrmMain.Export2HTMLExecute(Sender: TObject);
const
  HTMLHead =
    '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">' + CRLF +
    '<html>' + CRLF +
    '<head>' + CRLF +
    '  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">' + CRLF +
    '  <title>MyHomeLib HTML</title>' + CRLF +
    '</head>' + CRLF +
    '<body>' + CRLF;
  HTMLFoot =
    '</body>' + CRLF +
    '</html>' + CRLF;

  Ext: array [351 .. 353] of string = ('html', 'txt', 'rtf');
var
  Tree: TBookTree;
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
        Str := Tree.ContentToUnicode(tstAll, Chr(9));
      353:
        Str := Tree.ContentToRTF(tstAll);
    end;
    Data := PChar(Str);
    FS.WriteBuffer(Data^, Length(Str));
  finally
    FreeAndNil(FS);
  end;

  SimpleShellExecute(Handle, FileName);
end;

procedure TfrmMain.ExportUserDataExecute(Sender: TObject);
var
  FileName: string;
  Data: TUserData;
begin
  if not unit_Helpers.GetFileName(fnSaveUserData, FileName) then
    Exit;

  Data := TUserData.Create;
  try
    GetActiveBookCollection.ExportUserData(Data);
    Data.Save(FileName);
  finally
    Data.Free;
  end;
end;

procedure TfrmMain.HeaderPopupItemClick(Sender: TObject);
var
  i: Integer;
  Tree: TBookTree;
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
        Tree.Header.Columns.Delete(i);
        (Sender as TMenuItem).Checked := False;
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
    Column.Options := Options;
    (Sender as TMenuItem).Checked := True;
  end;

  SaveColumns;
end;

function TfrmMain.OnHelpHandler(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
begin
  if Data = 0 then
    HtmlHelp(Application.Handle, PChar(Settings.SystemFileName[sfAppHelp]), HH_DISPLAY_TOC, 0)
  else
    HtmlHelp(Application.Handle, PChar(Settings.SystemFileName[sfAppHelp]), HH_HELP_CONTEXT, Data);

  CallHelp := False;
end;

procedure TfrmMain.ShowCollectionSettingsExecute(Sender: TObject);
var
  frmBases: TfrmBases;
begin
  frmBases := TfrmBases.Create(Application);
  try
    frmBases.tsConnectionInfo.TabVisible := IsOnline;
    if frmBases.ShowModal = mrOk then
    begin
      Assert(Settings.ActiveCollection = GetSystemData.ActiveCollectionInfo.ID);
      InitCollection(True);
    end;
  finally
    frmBases.Free;
  end;
end;

procedure TfrmMain.MarkAsReadedExecute(Sender: TObject);
var
  BookCollection: IBookCollection;
begin
  BookCollection := GetActiveBookCollection;

  ProcessNodes(
    procedure (Tree: TBookTree; Node: PVirtualNode)
    var
      Data: PBookRecord;
      NewProgress: Integer;
    begin
      Data := Tree.GetNodeData(Node);
      if Assigned(Data) and (Data^.nodeType = ntBookInfo) then
      begin
        // заглушка
        NewProgress := IfThen(Data^.Progress = 0, 100, 0);

        BookCollection.SetProgress(Data^.BookKey, NewProgress);
        UpdateNodes(
          Data^.BookKey,
          procedure(BookData: PBookRecord)
          begin
            Assert(Assigned(BookData));
            BookData^.Progress := NewProgress;
          end
        );
      end;
    end
  );
end;

procedure TfrmMain.miRefreshClick(Sender: TObject);
begin
  InitCollection(True);
end;

procedure TfrmMain.UpdateGenresExecute(Sender: TObject);
var
  ALibrary: IBookCollection;
  AFileName: string;
begin
  //DMCollection.DBCollection.Connected := False;
  ALibrary := GetActiveBookCollection;
  if isFB2Collection(GetSystemData.ActiveCollectionInfo.CollectionType) then
    ALibrary.ReloadGenres(Settings.SystemFileName[sfGenresFB2])
  else if unit_Helpers.GetFileName(fnGenreList, AFileName) then
    ALibrary.ReloadGenres(AFileName);
  InitCollection(True);
end;

procedure TfrmMain.RepairDataBaseExecute(Sender: TObject);
begin
  GetActiveBookCollection.RepairDatabase;

//  GetSystemData.SetTableState(True);
end;

procedure TfrmMain.ChangeSettingsExecute(Sender: TObject);
var
  frmSettings: TfrmSettings;
begin
  SaveMainFormSettings;

  frmSettings := TfrmSettings.Create(Application);
  try
    frmSettings.LoadSetting;
    frmSettings.ShowModal;

    Settings.SaveSettings;
  finally
    frmSettings.Free;
  end;
  ReadINIData;
end;

procedure TfrmMain.SetHeaderPopUp;
var
  Tree: TBookTree;
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
  tbtnRead.Enabled := ToolBuutonVisible;
  btnRefreshCollection.Enabled := ToolBuutonVisible;

  tbSendToDevice.Enabled := ToolBuutonVisible;
  btnSwitchTreeMode.Enabled := not((ActiveView = SeriesView) or (ActiveView = DownloadView));

  case ActiveView of
    FavoritesView:
      begin
        // actions
        miGoToAuthor.Visible := True;
        miDelFavorites.Visible := True;
        miAddFavorites.Visible := False;
        BtnFav_add.Hint := rstrRemoveFromGroup;
        BtnFav_add.DropdownMenu := nil;
        BtnFav_add.ImageIndex := 16;
        pmiGroups.Visible := False;
        ///miDeleteFiles.Visible := False;
      end;
    DownloadView:
      begin
        tbtnDownloadList_Add.ImageIndex := 23;
        tbtnDownloadList_Add.Hint := rstrRemoveFromDownloadList;
        // actions
        btnSwitchTreeMode.Enabled := False;
        Exit;
      end;
  else
    begin
      // actions
      miGoToAuthor.Visible := False;
      miDelFavorites.Visible := False;
      miAddFavorites.Visible := True;
      BtnFav_add.Hint := rstrAddToFavorites;
      BtnFav_add.DropdownMenu := pmGroups;
      BtnFav_add.ImageIndex := 15;
      pmiGroups.Visible := True;
      ///miDeleteFiles.Visible := isOnlineCollection(GetSystemData.ActiveCollection.CollectionType);
    end;

  end;

  tbtnDownloadList_Add.ImageIndex := 2;
  tbtnDownloadList_Add.Hint := rstrAddToDownloads;

  ///miEditAuthor.Enabled := (ActiveView = AuthorsView);
  ///miEditSeries.Enabled := (ActiveView = AuthorsView);
  ///tbtnEditSeries.Enabled := (ActiveView = AuthorsView);
  ///tbtnEditAuthor.Enabled := (ActiveView = AuthorsView);
  ///tlbrEdit.Enabled := (ActiveView <> FavoritesView);
  ///miGoToAuthor.Visible := (ActiveView <> AuthorsView);

  SetHeaderPopUp;

  /// tvBooksTreeChange(nil, nil);

  ///btnSwitchTreeMode.ImageIndex := TreeIcons[ord(Settings.TreeModes[pgControl.ActivePageIndex])];
  ///btnSwitchTreeMode.Hint := TreeHints[ord(Settings.TreeModes[pgControl.ActivePageIndex])];

  Settings.ActivePage := pgControl.ActivePageIndex;
end;

procedure TfrmMain.ShowHelpExecute(Sender: TObject);
var
  dummy: Boolean;
begin
  OnHelpHandler(0, 0, dummy);
end;

procedure TfrmMain.ImportNonFB2Execute(Sender: TObject);
var
  frmAddBooks: TfrmAddnonfb2;
begin
  frmAddBooks := TfrmAddnonfb2.Create(Application);
  try
    frmAddBooks.OnSetControlsState := OnSetControlsStateHandler;
    frmAddBooks.ShowModal;
    InitCollection(True);
  finally
    frmAddBooks.Free;
  end;
end;

procedure TfrmMain.ImportNonFB2Update(Sender: TObject);
var
  Action: TAction;
begin
  Assert(Sender is TAction);

  Action := Sender as TAction;
  Action.Visible := IsPrivate and IsNonFB2;
  Action.Enabled := Action.Visible;
end;

procedure TfrmMain.OnChangeLocalStatus(var Message: TLocalStatusChangedMessage);
begin
  Assert(Assigned(Message.Params));

  SetBookLocalStatus(Message.Params^.BookKey, Message.Params^.LocalStatus);

  Dispose(Message.Params);
end;

procedure TfrmMain.SetBookLocalStatus(const BookKey: TBookKey; IsLocal: Boolean);
begin
  GetActiveBookCollection.SetLocal(BookKey, IsLocal);

  UpdateNodes(
    BookKey,
    procedure(BookData: PBookRecord)
    begin
      Assert(Assigned(BookData));
      BookData^.IsLocal := IsLocal;
    end
  );
end;

procedure TfrmMain.ImportUserDataExecute(Sender: TObject);
var
  FileName: string;
  Data: TUserData;
  SavedCursor: TCursor;
begin
  if not GetFileName(fnOpenUserData, FileName) then
    Exit;

  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Data := TUserData.Create;
    try
      Data.Load(FileName);
      OnImportUserDataHandler(Data);
    finally
      Data.Free;
    end;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

// Load user data from an in-memory instance of TUserData
procedure TfrmMain.OnImportUserDataHandler(const UserDataSource: TUserData);
var
  SavedCursor: TCursor;
begin
  SavedCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    GetActiveBookCollection.ImportUserData(
      UserDataSource,
      procedure(const BookKey: TBookKey; extra: TBookExtra)
      begin
        //
        // На всех страницах (кроме "Группы") необходимо обновить список книг,
        // т к могли поменяться пользовательские данные
        //
        UpdateNodes(
          BookKey,
          procedure(BookData: PBookRecord)
          begin
            Assert(Assigned(BookData));
            if extra.Rating <> 0 then
              BookData^.Rate := extra.Rating;
            if extra.Progress <> 0 then
              BookData^.Progress := extra.Progress;
            if extra.Review <> '' then
              BookData^.Code := 1;
          end
        );
      end
    );

    CreateGroupsMenu;

    //
    // Обновим список групп. Побочным эффектом будет перечитывание списка книг на странице "Группы"
    //
    FillGroupsList(tvGroups, FLastGroupID);
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TfrmMain.Export2INPXExecute(Sender: TObject);
var
  FileName: string;
begin
  if not GetFileName(fnSaveINPX, FileName) then
    Exit;

  unit_Export.Export2INPX(FileName);

  InitCollection(True);
end;

procedure TfrmMain.cbPresetNameSelect(Sender: TObject);
var
  preset: TSearchPreset;
  Value: string;
begin
  preset := FPresets.GetPreset(cbPresetName.Text);

  if preset.TryGetValue(SF_AUTHORS, Value) then edFFullName.Text := Value;
  if preset.TryGetValue(SF_TITLE, Value) then edFTitle.Text := Value;
  if preset.TryGetValue(SF_SERIES, Value) then edFSeries.Text := Value;
  if preset.TryGetValue(SF_GENRE_TITLE, Value) then edFGenre.Text := Value;
  if preset.TryGetValue(SF_GENRE_CODES, Value) then edFGenre.Hint := Value;
  if preset.TryGetValue(SF_ANNOTATION, Value) then edFAnnotation.Text := Value;

  if preset.TryGetValue(SF_FILE, Value) then edFFile.Text := Value;
  if preset.TryGetValue(SF_FOLDER, Value) then edFFolder.Text := Value;
  if preset.TryGetValue(SF_EXTENSION, Value) then edFExt.Text := Value;

  if preset.TryGetValue(SF_DOWNLOADED, Value) then
    cbDownloaded.ItemIndex := EnsureRange(StrToIntDef(Value, 0), 0, cbDownloaded.Items.Count - 1);
  if preset.TryGetValue(SF_KEYWORDS, Value) then edFKeyWords.Text := Value;
  if preset.TryGetValue(SF_DELETED, Value) then cbDeleted.Checked := StrToBoolDef(Value, False);
  if preset.TryGetValue(SF_DATE, Value) then
    cbDate.ItemIndex := EnsureRange(StrToIntDef(Value, -1), -1, cbDate.Items.Count - 1);
  if preset.TryGetValue(SF_LANG, Value) then
    cbLang.ItemIndex := EnsureRange(StrToIntDef(Value, -1), -1, cbLang.Items.Count - 1);
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
  GetSelections(tvDownloadList, List);
  for i := 0 to tvDownloadList.SelectedCount - 1 do
  begin
    Data := tvDownloadList.GetNodeData(List[i]);
    if Data.State <> dsRun then
      tvDownloadList.DeleteNode(List[i], True);
  end;
end;

procedure TfrmMain.DeleteSearchPreset(Sender: TObject);
var
  presetName: string;
begin
  presetName := cbPresetName.Items[cbPresetName.ItemIndex];
  FPresets.RemovePreset(presetName);
  FPresets.Save(Settings.SystemFileName[sfPresets]);

  cbPresetName.Items.Delete(cbPresetName.ItemIndex);
  cbPresetName.ItemIndex := -1;
  cbPresetName.Text := '';
end;

procedure TfrmMain.BtnFav_addClick(Sender: TObject);
begin
  if ActiveView = FavoritesView then
    DeleteBookFromGroup(Sender)
  else if GetSystemData.ActivateGroup(FAVORITES_GROUP_ID) then
    AddBookToGroup(Sender);
end;

function TfrmMain.GetBookNode(const Tree: TBookTree; const BookKey: TBookKey): PVirtualNode;
var
  Data: PBookRecord;
  Node: PVirtualNode;
begin
  Assert(Assigned(Tree));

  Result := nil;

  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if (Data^.nodeType = ntBookInfo) and (Data^.BookKey.IsSameAs(BookKey)) then
    begin
      Result := Node;
      Exit;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

procedure TfrmMain.ProcessNodes(ProcessProc: TNodeProcessProc);
var
  Tree: TBookTree;
  FNode: PVirtualNode;
  Node: PVirtualNode;
begin
  GetActiveTree(Tree);
  Assert(Assigned(Tree));

  FNode := Tree.FocusedNode;

  Node := Tree.GetFirstChecked;
  while Assigned(Node) do
  begin
    if Node = FNode then
      FNode := nil;
    ProcessProc(Tree, Node);
    Node := Tree.GetNextChecked(Node);
  end;

  if Assigned(FNode) then
    ProcessProc(Tree, FNode);
end;

procedure TfrmMain.UpdateNodes(const BookKey: TBookKey; UpdateProc: TNodeUpdateProc);
type
  TTreeArray = array of TBookTree;
var
  BookTrees: TTreeArray;
  Tree: TBookTree;
  Node: PVirtualNode;
  Data: PBookRecord;
begin
  BookTrees := TTreeArray.Create(tvBooksA, tvBooksS, tvBooksG, tvBooksSR, tvBooksF {, tvDownloadList});
  for Tree in BookTrees do
  begin
    Node := GetBookNode(Tree, BookKey);
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

function TfrmMain.IsSelectedBookNode(Node: PVirtualNode; Data: PBookRecord): Boolean;
begin
  Result :=
    Assigned(Node) and Assigned(Data) and
   (Data^.nodeType = ntBookInfo) and
   ((Node^.CheckState = csCheckedNormal) or (vsSelected in Node.States));
end;

procedure TfrmMain.OnGetBookHandler(var BookRecord: TBookRecord);
var
  Tree: TBookTree;
  Node: PVirtualNode;
  Data: PBookRecord;
begin
  //
  // Locate the selected book record and pass it to the edit form
  //
  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;
  Data := Tree.GetNodeData(Node);

  Assert(Assigned(Data) and (Data^.nodeType = ntBookInfo));

  GetActiveBookCollection.GetBookRecord(Data^.BookKey, BookRecord, True);
end;

// Invoked when it's time to update the current book in DB
procedure TfrmMain.OnUpdateBookHandler(const BookRecord: TBookRecord);
var
  Tree: TBookTree;
  Data: PBookRecord;
  Node: PVirtualNode;
  BookCollection: IBookCollection;
  OldID: Integer;
begin
  //
  // TODO : этот метод надо срочно переписать.
  // Проблемы:
  //  1. возможно рассинхронизация данных из-за модификации базы через отдельное подсоединение
  //  2. не обновляются ноды неактивных списков
  //  3. просто много лишнего
  //
  // См. TfrmMain.OnChangeBook2ZipHandler как пример верной реализации
  //
  Assert(BookRecord.nodeType = ntBookInfo);

  BookCollection := GetActiveBookCollection;
  BookCollection.BeginBulkOperation;
  try
    BookCollection.UpdateBook(BookRecord);
    BookCollection.EndBulkOperation(True);
  except
    BookCollection.EndBulkOperation(False);
  end;
  {
  UpdateNodes(
    BookRecord.BookKey,
    procedure(BookData: PBookRecord)
    begin
      Assert(Assigned(BookData));
      BookData^.FileName := NewFileName;
    end
  );
  }

  {
  GetActiveTree(Tree);
  Node := Tree.GetFirstSelected;

  Data := Tree.GetNodeData(Node);
  if not Assigned(Data) or (Data^.nodeType <> ntBookInfo) then
    Exit;

  OldID := Data^.BookKey.BookID;

  ALibrary := TMHLLibrary.Create(nil);
  try
    ALibrary.DatabaseFileName := GetSystemData.ActiveCollection.DBFileName;
    ALibrary.Active := True;

    ALibrary.BeginBulkOperation;
    try
      ALibrary.DeleteBook(Data^.BookKey);
      Data^.BookKey.BookID := ALibrary.InsertBook(BookRecord, False, False);
      ALibrary.EndBulkOperation(True);
    except
      ALibrary.EndBulkOperation(False);
    end;

    GetSystemData.ChangeBookID(OldID, Data^.BookKey.BookID);

    Data^.Title := BookRecord.Title;
    Data^.Genres := BookRecord.Genres;
    Data^.SeqNumber := BookRecord.SeqNumber;
    Data^.Lang := BookRecord.Lang;
    Tree.RepaintNode(Node);
  finally
    ALibrary.Free;
  end;
  }
end;

// A raw file just became a zip archive (FBD + raw)
// Change the book's file name in both the database and the trees
procedure TfrmMain.OnChangeBook2ZipHandler(const BookRecord: TBookRecord);
var
  NewFileName: string;
begin
  Assert(BookRecord.nodeType = ntBookInfo);

  NewFileName := BookRecord.FileName + ZIP_EXTENSION;
  GetActiveBookCollection.SetFileName(BookRecord.BookKey, NewFileName);
  UpdateNodes(
    BookRecord.BookKey,
    procedure(BookData: PBookRecord)
    begin
      Assert(Assigned(BookData));
      BookData^.FileName := NewFileName;
    end
  );
end;

function TfrmMain.AuthorBookFilter: TFilterValue;
begin
  Result.ValueInt := FLastAuthorID;
end;

function TfrmMain.SeriesBookFilter: TFilterValue;
begin
  Result.ValueInt := FLastSeriesID;
end;

function TfrmMain.GenreBookFilter: TFilterValue;
begin
  if isFB2Collection(GetSystemData.ActiveCollectionInfo.CollectionType) or not Settings.ShowSubGenreBooks then
    Result.ValueString := FLastGenreCode
  else
    Result.ValueString := FLastGenreCode + IfThen(FLastGenreIsContainer, '.', '');
end;

function TfrmMain.GroupBookFilter: string;
begin
  Result := Format('bg.%s = %d', [GROUP_ID_FIELD, FLastGroupID]);
end;
end.
