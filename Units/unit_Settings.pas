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

unit unit_Settings;

interface

uses
  Classes,
  SysUtils,
  Forms,
  Graphics,
  IniFiles,
  unit_Scripts,
  unit_Readers,
  unit_globals,
  unit_Lib_Updates;

type

  TMHLSystemFile = (
    sfSystemDB,
    sfGenresFB2,
    sfGenresNonFB2,
    sfServerErrorLog,
    sfImportErrorLog,
    sfAppHelp,
    sfLibRusEcUpdate,
    sfAppVerInfo,
    sfLibRusEcInpx,
    sfCollectionVerInfo
    );


  TSplitters = array of integer;
  TTreeModes = array of TTreeMode;

  TMHLSettings = class
  private
    //
    // System paths
    //
    FAppPath: string;
    FDataDir: string;
    FTempDir: string;
    FWorkDir: string;
    FReadDir: string;
    FPresetDir: string;

    //
    // Settings
    //

    // PATH_SECTION
    FDeviceDir: string;

    // SYSTEM_SECTION
    FTransliterate: Boolean;
    FActiveCollection: Integer;
    FDoCheckUpdate: Boolean;
    FCheckExternalLibUpdate: Boolean;
    FPromptDevicePath: Boolean;
    FFolderTemplate: string;
    FFileNameTemplate: string;
    FExportMode: TExportMode;
    FRemoveSquareBrackets: Boolean;
    FUseSystemTemp: boolean;
    FTXTEncoding: TTXTEncoding;

    // INTERFACE_SECTION
    FTreeFontSize: Integer;
    FShortFontSize: Integer;
    FAppLanguage: TAppLanguage;
    FActivePage: integer;
    FLastAuthor: string;
    FLastSeries: string;
    FLastBookInAuthors: integer;
    FLastBookInSeries: integer;
    FLastBookInFavorites: integer;
    FSplitters: TSplitters;
    FTreeModes: TTreeModes;
    FWindowState: TWindowState;

    // NETWORK_SECTION
    FProxyServer: string;
    FProxyUsername: string;
    FProxyPassword: string;
    FProxyPort: Integer;
    FUpdateURL: string;
    FDownloadURL: string;
    FErrorLog: boolean;
    FTimeOut: integer;
    FReadTimeOut: integer;
    FDwnldInterval : integer;

    FUseIESettings: boolean;
    FIEProxyServer: string;
    FIEProxyPort: Integer;


    // COLORS_SECTION
    FBookColor: TColor;
    FSeriesColor: TColor;
    FAuthorColor: TColor;
    FSeriesBookColor: TColor;
    FBGColor: TColor;
    FFontColor: TColor;

    FDeletedColor: TColor;
    FLocalColor: TColor;

    // SEARCH_SECTION
    FFullTextSearch: Boolean;

    // READERS_SECTION
    FReaders: TReaders;

    // UPDATES_SECTION
    FUpdateList: TUpdateInfoList;


    // SCRIPTS_SECTION
    FScripts: TScripts;
    FDefaultScript: Integer;

    // IMPORT_SECTION
    FCheckExistsFiles: Boolean;

    FInitialDirs: TStringList;


    // BEHAVIOR_SECTION
    FMinimizeToTray: boolean;
    FAutoStartDwnld: boolean;
    FShowSubGenreBooks: boolean;
    FShowFb2Info: boolean;
    FAllowMixed: boolean;

    FAutoRunUpdate: boolean;
    FShowInfoPanel: Boolean;
    FShowRusBar: Boolean;
    FShowEngBar: Boolean;
    FDoNotShowDeleted: Boolean;
    FShowLocalOnly : boolean;
    FFullSearchMode: boolean;
    FDeleteDeleted: boolean;

  private
    function GetSettingsFileName: string;

    function GetSystemFileName(fileType: TMHLSystemFile): string;

    function GetDataPath: string;

    function GetTempPath: string;

    function GetWorkPath: string;

    function GetDevicePath: string;
    procedure SetDeviceDir(const Value: string);

    function GetReadPath: string;
    procedure SetReadDir(const Value: string);


    procedure LoadReaders(iniFile: TIniFile);
    procedure SaveReaders(iniFile: TIniFile);

    procedure LoadUpdates;

    procedure LoadScripts(iniFile: TIniFile);
    procedure SaveScripts(iniFile: TIniFile);

    procedure SaveSplitters(iniFile: TIniFile);
    procedure LoadSplitters(iniFile: TIniFile);

    procedure LoadInitialDirs(iniFile: TIniFile);
    procedure SaveInitialDirs(iniFile: TIniFile);

    function GetInitialDir(const key: string): string;
    procedure SetInitialDir(const key, Value: string);
    function GetPresetPath: string;


  public
    constructor Create;

    procedure LoadSettings;
    procedure SaveSettings;

  public
    property AppPath: string read FAppPath;
    property DataDir: string read FDataDir;
    property DataPath: string read GetDataPath;
    property TempDir: string read FTempDir write FTempDir;
    property TempPath: string read GetTempPath;
    property WorkDir: string read FWorkDir;
    property WorkPath: string read GetWorkPath;
    property PresetDir: string read FPresetDir write FPresetDir;
    property PresetPath: string read GetPresetPath;

    //
    // Полные пути к некоторым файлам
    //
    property SystemFileName[fileType: TMHLSystemFile]: string read GetSystemFileName;

    //
    // Собственно настройки программы
    //
    property UseSystemTemp:Boolean read FUseSystemTemp write FUseSystemTemp;

    property DeviceDir: string read FDeviceDir write SetDeviceDir;
    property DevicePath: string read GetDevicePath;
    property ReadDir: string read FReadDir write SetReadDir;
    property ReadPath: string read GetReadPath;

    property TransliterateFileName: Boolean read FTransliterate write FTransliterate;
    property ActiveCollection: Integer read FActiveCollection write FActiveCollection;
    property CheckUpdate: Boolean read FDoCheckUpdate write FDoCheckUpdate;
    property CheckExternalLibUpdate: Boolean read FCheckExternalLibUpdate write FCheckExternalLibUpdate;
    property PromptDevicePath: Boolean read FPromptDevicePath write FPromptDevicePath;
    property FolderTemplate: string read FFolderTemplate write FFolderTemplate;
    property FileNameTemplate: string read FFileNameTemplate write FFileNameTemplate;
    property ExportMode: TExportMode read FExportMode write FExportMode;
    property TXTEncoding: TTXTEncoding read FTXTEncoding write FTXTEncoding;

    property ShowRusBar: Boolean read FShowRusBar write FShowRusBar;
    property ShowEngBar: Boolean read FShowEngBar write FShowEngBar;
    property TreeFontSize: Integer read FTreeFontSize write FTreeFontSize;
    property ShortFontSize: Integer read FShortFontSize write FShortFontSize;
    property ShowInfoPanel: Boolean read FShowInfoPanel write FShowInfoPanel;
    property AppLanguage: TAppLanguage read FAppLanguage write FAppLanguage;
    property DoNotShowDeleted: Boolean read FDoNotShowDeleted write FDoNotShowDeleted;
    property ShowLocalOnly: Boolean read FShowLocalOnly write FShowLocalOnly;
    property ShowSubGenreBooks: boolean read FShowSubGenreBooks write FShowSubGenreBooks;
    property ShowFb2Info: boolean read FShowFb2Info write FShowFb2Info;
    property FullSearchMode: boolean read FFullSearchMode write FFullSearchMode;
    property AutoRunUpdate: boolean read FAutoRunUpdate write FAutoRunUpdate;

    property MinimizeToTray : boolean read FMinimizeToTray   write FMinimizeToTray;
    property AutoStartDwnld : boolean read FAutoStartDwnld   write FAutoStartDwnld;

    property RemoveSquarebrackets : boolean read FRemoveSquarebrackets write FRemoveSquarebrackets;

    property ActivePage:integer read FActivePage write FActivePage;
    property LastAuthor:string read FLastAuthor write FLastAuthor;
    property LastSeries:string read FLastSeries write FLastSeries;
    property LastBookInSeries:integer read FLastBookInSeries write FLastBookInSeries;
    property LastBookInAuthors:integer read FLastBookInAuthors write FLastBookInAuthors;
    property LastBookInFavorites:integer read FLastBookInFavorites write FLastBookInFavorites;

    property Splitters:TSplitters read FSplitters write FSplitters;
    property TreeModes:TTreeModes read FTreeModes write FTreeModes;


    property ProxyServer: string read FProxyServer write FProxyServer;
    property ProxyUsername: string read FProxyUsername write FProxyUsername;
    property ProxyPassword: string read FProxyPassword write FProxyPassword;
    property ProxyPort: Integer read FProxyPort write FProxyPort;
    property UpdateURL: string read FUpdateURL write FUpdateURL;
    property DownloadURL: string read FDownloadURL write FDownloadURL;
    property ErrorLog:boolean read FerrorLog write FErrorLog;
    property TimeOut: integer read FTimeOut write FTimeOut;
    property ReadTimeOut: integer read FReadTimeOut write FReadTimeOut;
    property DwnldInterval: integer read FDwnldInterval write FDwnldInterval;

    property UseIESettings: boolean read FUseIESettings write FUseIESettings;
    property IEProxyServer: string read FIEProxyServer write FIEProxyServer;
    property IEProxyPort: Integer read FIEProxyPort write FIEProxyPort;




    property BookColor: TColor read FBookColor write FBookColor;
    property SeriesColor: TColor read FSeriesColor write FSeriesColor;
    property AuthorColor: TColor read FAuthorColor write FAuthorColor;
    property SeriesBookColor: TColor read FSeriesBookColor write FSeriesBookColor;
    property BGColor: TColor read FBGColor write FBGColor;
    property FontColor: TColor read FFontColor write FFontColor;
    property DeletedColor: TColor read FDeletedColor write FDeletedColor;
    property LocalColor: TColor read FLocalColor write FLocalColor;

    property WindowState: TWindowState read FWindowState write FWindowState;

    property FullTextSearch: Boolean read FFullTextSearch write FFullTextSearch;

    property Readers: TReaders read FReaders;

    property Updates: TUpdateInfoList read FUpdateList;

    property Scripts: TScripts read FScripts;
    property DefaultScript: Integer read FDefaultScript write FDefaultScript;

    property CheckExistsFiles: Boolean read FCheckExistsFiles write FCheckExistsFiles;

    property InitialDir[const key: string]: string read GetInitialDir write SetInitialDir;

    property AllowMixed : boolean read FAllowMixed write FAllowMixed;

    property DeleteDeleted:boolean read FDeleteDeleted write FDeleteDeleted;

  end;

  procedure CreateSettings;
  procedure FreeSettings;
  function Settings: TMHLSettings;

implementation

uses
  StrUtils,
  unit_Consts,
  ShlObj,
  ShellAPI;

var
  g_objSettings: TMHLSettings;

procedure CreateSettings;
begin
  Assert(not Assigned(g_objSettings));

  if not Assigned(g_objSettings) then
    g_objSettings := TMHLSettings.Create;
end;

procedure FreeSettings;
begin
  Assert(Assigned(g_objSettings));

  FreeAndNil(g_objSettings);
end;

function Settings: TMHLSettings;
begin
  Assert(Assigned(g_objSettings));

  Result := g_objSettings;
end;

const
  TOOLS_DIR_NAME = 'Tools';
  TEMP_DIR_NAME = '$tmp';
  APPDATA_DIR_NAME = 'MyHomeLib';

  SETTINGS_FILE_NAME = 'myhomelib.ini';

  PATH_SECTION = 'PATH';
  SYSTEM_SECTION = 'SYSTEM';
  INTERFACE_SECTION = 'INTERFACE';
  NETWORK_SECTION = 'NETWORK';
  COLORS_SECTION = 'COLORS';
  CONVERTER_SECTION = 'CONVERTER';
  SEARCH_SECTION = 'SEARCH';
  READERS_SECTION = 'READERS';
  SCRIPTS_SECTION = 'SCRIPTS';
  IMPORT_SECTION = 'IMPORT';
  BEHAVIOR_SECTION = 'BEHAVIOR';

  READER_KEY_PREFIX = 'Reader';
  SCRIPT_KEY_PREFIX = 'Script';

  INITIAL_DIRS_SECTION = 'InitialDirs';

  LIBRUSEC_INPX_FILENAME = 'librusec.inpx';
  COLLECTION_VERINFO_FILENAME = 'version.info';

{ TMHLSettings }

constructor TMHLSettings.Create;
const
  STR_USELOCALDATA = 'uselocaldata';
  STR_USELOCALTEMP = 'uselocaltemp';

var
  AppDataPath : string;

  UseLocalData, UseLocalTemp: boolean;
  I: Integer;

begin
  UseLocalData := False;
  UseLocalTemp := False;

  FAppPath := ExtractFilePath(Application.ExeName);
  AppDataPath := GetSpecialPath(CSIDL_APPDATA) + APPDATA_DIR_NAME;

  // определяем рабочую и временную папку в зависимости от параметров
  // командной строки или ключевых файлов

  for I := 1 to ParamCount do
  begin
    if not UseLocalData then
         UseLocalData := (LowerCase(paramstr(i)) = STR_USELOCALDATA);
    if not UseLocalTemp then
         UseLocalTemp := (LowerCase(paramstr(i)) = STR_USELOCALTEMP);
  end;

  UseLocalData := UseLocalData or FileExists(FAppPath + STR_USELOCALDATA) or
                  not DirectoryExists(AppDataPath);
  UseLocalTemp := UseLocalTemp or FileExists(FAppPath + STR_USELOCALTEMP);




  // Устанавливаем рабочую папку

  if not UseLocalData then
  begin                                             // работаем с AppData
    FWorkDir := AppDataPath;
    FDataDir := WorkPath + DATA_DIR_NAME;
  end
  else
  begin
    FWorkDir := FAppPath;                           // работаем с AppPath
    FDataDir := FAppPath + DATA_DIR_NAME;
  end;

  // устанавливаем временную папку

  if not UseLocalTemp then
     FTempDir := c_GetTempPath + '_myhomelib'
  else
     FTempDir := FAppPath + TEMP_DIR_NAME;

  FPresetDir := WorkPath + PRESET_DIR_NAME;
  //-----------------------------------------------------

  FReaders := TReaders.Create;
  FScripts := TScripts.Create;
  FUpdateList := TUpdateInfoList.Create;

  FInitialDirs := TStringList.Create;
end;

function TMHLSettings.GetSettingsFileName: string;
begin
  { TODO -oNickR -cVista : Под Вистой мы будем иметь проблемы }
  Result := WorkPAth + SETTINGS_FILE_NAME;
end;

procedure TMHLSettings.LoadSettings;
var
  iniFile: TIniFile;
begin
  iniFile := TIniFile.Create(GetSettingsFileName);
  try
    //
    // PATH_SECTION
    //
    FDeviceDir := ExcludeTrailingPathDelimiter(iniFile.ReadString(PATH_SECTION, 'Device', 'C:\'));
    FReadDir := ExcludeTrailingPathDelimiter(iniFile.ReadString(PATH_SECTION, 'Read', ''));

    if not DirectoryExists(FReadDir) then  FReadDir := FTempDir;

    //
    // SYSTEM_SECTION
    //
    FTransliterate := iniFile.ReadBool(SYSTEM_SECTION, 'TransliterateFileName', True);
    FActiveCollection := iniFile.ReadInteger(SYSTEM_SECTION, 'ActiveCollection', 1);
    FDoCheckUpdate := iniFile.ReadBool(SYSTEM_SECTION, 'CheckUpdates', True);
    FCheckExternalLibUpdate := iniFile.ReadBool(SYSTEM_SECTION, 'CheckLibrusecUpdates', True);
    FPromptDevicePath := iniFile.ReadBool(SYSTEM_SECTION, 'PromptDevicePath', False);
    FFolderTemplate := iniFile.ReadString(SYSTEM_SECTION, 'FolderTemplate', '%f\%s');
    FFileNameTemplate := iniFile.ReadString(SYSTEM_SECTION, 'FileNameTemplate', '%n%t');
    FRemoveSquareBrackets := iniFile.ReadBool(SYSTEM_SECTION, 'RemoveSquareBrackets', True);
    FUseSystemTemp := iniFile.ReadBool(SYSTEM_SECTION, 'UseSystemTemp', False);

    case iniFile.ReadInteger(SYSTEM_SECTION, 'ExpFormat', 0) of
      0: FExportMode := emFB2;
      1: FExportMode := emFB2zip;
      2: FExportMode := emLrf;
      3: FExportMode := emTxt;
    end;

    case iniFile.ReadInteger(SYSTEM_SECTION, 'TXTEncoding', 0) of
      0: FTXTEncoding := enUTF8;
      1: FTXTEncoding := en1251;
      2: FTXTEncoding := enUnicode;
    end;

    //
    // INTERFACE_SECTION
    //
    FTreeFontSize := iniFile.ReadInteger(INTERFACE_SECTION, 'FontSize', 8);
    FShortFontSize := iniFile.ReadInteger(INTERFACE_SECTION, 'ShortFontSize', 8);
    FActivePage := iniFile.ReadInteger(INTERFACE_SECTION, 'ActivePage', 0);
    FLastAuthor := iniFile.ReadString(INTERFACE_SECTION, 'LastAuthor', 'А');
    FLastSeries := iniFile.ReadString(INTERFACE_SECTION, 'LastSeries', 'А');

    FLastBookinAuthors := iniFile.ReadInteger(INTERFACE_SECTION, 'LastBookInAuthors', 0);
    FLastBookinSeries:= iniFile.ReadInteger(INTERFACE_SECTION, 'LastBookInSeries', 0);
    FLastBookinFavorites := iniFile.ReadInteger(INTERFACE_SECTION, 'LastBookInFavorites', 0);

    if iniFile.ReadInteger(INTERFACE_SECTION, 'Lang', 0) = 0 then
      FAppLanguage := alEng
    else
      FAppLanguage := alRus;

    LoadSplitters(iniFile);

    case iniFile.ReadInteger(INTERFACE_SECTION, 'WindowState', 2) of
      0: FWindowState := wsNormal;
      1: FWindowState := wsMinimized;
      2: FWindowState := wsMaximized;
    end;


    //
    // NETWORK_SECTION
    //
    FProxyServer := iniFile.ReadString(NETWORK_SECTION, 'proxy', '');
    FProxyUsername := iniFile.ReadString(NETWORK_SECTION, 'proxy-user', '');
    FProxyPassword := DecodeStr(iniFile.ReadString(NETWORK_SECTION, 'proxy-pass', ''));
    FProxyPort := iniFile.ReadInteger(NETWORK_SECTION, 'proxy-port', 0);
    FUpdateURL := iniFile.ReadString(NETWORK_SECTION, 'update_server', 'http://home-lib.net/update/');
    FDownloadURL := iniFile.ReadString(NETWORK_SECTION, 'library_server', 'http://lib.rus.ec/');
    FErrorLog := iniFile.ReadBool(NETWORK_SECTION,'use_error_log',false);
    FTimeOut := iniFile.ReadInteger(NETWORK_SECTION,'time-out',5000);
    FReadTimeOut := iniFile.ReadInteger(NETWORK_SECTION,'read_time-out',50000);
    FDwnldInterval := iniFile.ReadInteger(NETWORK_SECTION,'dwnld_interval',0);

    FUseIESettings := iniFile.ReadBool(NETWORK_SECTION,'use_ie_settings',false);


    //
    // COLORS_SECTION
    //
    FBookColor := iniFile.ReadInteger(COLORS_SECTION, 'Book', clWhite);
    FSeriesColor := iniFile.ReadInteger(COLORS_SECTION, 'Series', clWhite);
    FAuthorColor := iniFile.ReadInteger(COLORS_SECTION, 'Author', clWhite);
    FSeriesBookColor := iniFile.ReadInteger(COLORS_SECTION, 'SeriesBook', clWhite);
    FBGColor := iniFile.ReadInteger(COLORS_SECTION, 'ASG Tree', clWhite);
    FFontColor := iniFile.ReadInteger(COLORS_SECTION, 'Font', clBlack);

    FLocalColor := iniFile.ReadInteger(COLORS_SECTION, 'Downloaded', clBlack);
    FDeletedColor := iniFile.ReadInteger(COLORS_SECTION, 'Deleted', clGray);

    //
    // SEARCH_SECTION
    //
    FFullTextSearch := iniFile.ReadBool(SEARCH_SECTION, 'FullText', False);

    //
    // READERS_SECTION
    //
    LoadReaders(iniFile);

    //
    // SCRIPTS_SECTION
    //
    LoadScripts(iniFile);
    FDefaultScript := iniFile.ReadInteger(SCRIPTS_SECTION, 'Default', 0);

    //
    // IMPORT_SECTION
    //
    FCheckExistsFiles := iniFile.ReadBool(IMPORT_SECTION, 'CheckFB2Exist', True);

    //
    //   BEHAVIOR_SECTION
    //

    FShowRusBar := iniFile.ReadBool(BEHAVIOR_SECTION, 'ShowRusABC', True);
    FShowEngBar := iniFile.ReadBool(BEHAVIOR_SECTION, 'ShowEngABC', True);
    FShowInfoPanel := iniFile.ReadBool(BEHAVIOR_SECTION, 'CoverPanel', True);
    FDoNotShowDeleted := iniFile.ReadBool(BEHAVIOR_SECTION, 'DoNotShowDeleted', True);
    FShowLocalOnly := iniFile.ReadBool(BEHAVIOR_SECTION, 'ShowLocalOnly', False);

    FShowSubGenreBooks := iniFile.ReadBool(BEHAVIOR_SECTION, 'ShowSubGenreBooks', False);
    FShowFb2Info := iniFile.ReadBool(BEHAVIOR_SECTION, 'ShowFb2Info', True);
    FMinimizeToTray  := iniFile.ReadBool(BEHAVIOR_SECTION, 'MinimizeToTray', True);
    FAutoStartDwnld  := iniFile.ReadBool(BEHAVIOR_SECTION, 'AutoStartDwnld', False);
    FAllowMixed :=  iniFile.ReadBool(BEHAVIOR_SECTION, 'AllowMixed', False);
    FAutoRunUpdate :=  iniFile.ReadBool(BEHAVIOR_SECTION, 'AutoRunUpdate', False);

    FFullSearchMode := iniFile.ReadBool(BEHAVIOR_SECTION, 'FullSearchMode', False);
    FDeleteDeleted := iniFile.ReadBool(BEHAVIOR_SECTION, ' DeleteDeleted',  False);

    //
    // INITIAL_DIRS_SECTION
    //
    LoadInitialDirs(iniFile);

    LoadUpdates;

  finally
    iniFile.Free;
  end;
end;


procedure TMHLSettings.SaveSettings;
var
  iniFile: TIniFile;
begin
  iniFile := TIniFile.Create(GetSettingsFileName);
  try
    //
    // PATH_SECTION
    //
    iniFile.WriteString(PATH_SECTION, 'Device', FDeviceDir);
    iniFile.WriteString(PATH_SECTION, 'Read', FReadDir);

    //
    // SYSTEM_SECTION
    //
    iniFile.WriteBool(SYSTEM_SECTION, 'TransliterateFileName', FTransliterate);
    iniFile.WriteInteger(SYSTEM_SECTION, 'ActiveCollection', FActiveCollection);
    iniFile.WriteBool(SYSTEM_SECTION, 'CheckUpdates', FDoCheckUpdate);
    iniFile.WriteBool(SYSTEM_SECTION, 'CheckLibrusecUpdates', FCheckExternalLibUpdate);
    iniFile.WriteBool(SYSTEM_SECTION, 'PromptDevicePath', FPromptDevicePath);
    iniFile.WriteString(SYSTEM_SECTION, 'FolderTemplate', FFolderTemplate);
    iniFile.WriteString(SYSTEM_SECTION, 'FileNameTemplate', FFileNameTemplate);
    iniFile.WriteInteger(SYSTEM_SECTION, 'ExpFormat', Ord(FExportMode));
    iniFile.WriteBool(SYSTEM_SECTION, 'RemoveSquareBrackets', FRemoveSquareBrackets);
    iniFile.WriteInteger(SYSTEM_SECTION, 'TXTEncoding', Ord(FTXTEncoding));
    //
    // INTERFACE_SECTION
    //
    iniFile.WriteInteger(INTERFACE_SECTION, 'FontSize', FTreeFontSize);
    iniFile.WriteInteger(INTERFACE_SECTION, 'ShortFontSize', FShortFontSize);
    iniFile.WriteInteger(INTERFACE_SECTION, 'Lang', Ord(FAppLanguage));
    iniFile.WriteInteger(INTERFACE_SECTION, 'ActivePage', FActivePage);

    iniFile.WriteString(INTERFACE_SECTION, 'LastAuthor', FLastAuthor);
    iniFile.WriteString(INTERFACE_SECTION, 'LastSeries', FLastSeries );

    iniFile.WriteInteger(INTERFACE_SECTION, 'LastBookInAuthors', FLastBookinAuthors );
    iniFile.WriteInteger(INTERFACE_SECTION, 'LastBookInSeries', FLastBookinSeries);
    iniFile.WriteInteger(INTERFACE_SECTION, 'LastBookInFavorites', FLastBookinFavorites);

    iniFile.WriteInteger(INTERFACE_SECTION, 'WindowState', Ord(FWindowState));
    SaveSplitters(iniFile);

    //
    // NETWORK_SECTION
    //
    iniFile.WriteString(NETWORK_SECTION, 'proxy', FProxyServer);
    iniFile.WriteString(NETWORK_SECTION, 'proxy-user', FProxyUsername);
    iniFile.WriteString(NETWORK_SECTION, 'proxy-pass', EncodeStr(FProxyPassword));
    iniFile.WriteInteger(NETWORK_SECTION, 'proxy-port', FProxyPort);
    iniFile.WriteString(NETWORK_SECTION, 'update_server', FUpdateURL);
    iniFile.WriteString(NETWORK_SECTION, 'library_server', FDownloadURL);
    iniFile.WriteBool(NETWORK_SECTION,'use_error_log',FErrorLog);
    iniFile.WriteInteger(NETWORK_SECTION,'time-out',FTimeOut);
    iniFile.WriteInteger(NETWORK_SECTION,'read_time-out',FReadTimeOut);
    iniFile.WriteBool(NETWORK_SECTION,'use_ie_settings',FUseIESettings);
    iniFile.WriteInteger(NETWORK_SECTION,'dwnld_interval',FDwnldInterval);

    //
    // COLORS_SECTION
    //
    iniFile.WriteInteger(COLORS_SECTION, 'Book', FBookColor);
    iniFile.WriteInteger(COLORS_SECTION, 'Series', FSeriesColor);
    iniFile.WriteInteger(COLORS_SECTION, 'Author', FAuthorColor);
    iniFile.WriteInteger(COLORS_SECTION, 'SeriesBook', FSeriesBookColor);
    iniFile.WriteInteger(COLORS_SECTION, 'ASG Tree', FBGColor);
    iniFile.WriteInteger(COLORS_SECTION, 'Font', FFontColor);

    iniFile.WriteInteger(COLORS_SECTION, 'Downloaded', FLocalColor);
    iniFile.WriteInteger(COLORS_SECTION, 'Deleted', FDeletedColor);

    //
    // SEARCH_SECTION
    //
    iniFile.WriteBool(SEARCH_SECTION, 'FullText', FFullTextSearch);

    //
    // READERS_SECTION
    //
    SaveReaders(iniFile);

    //
    // SCRIPTS_SECTION
    //
    SaveScripts(iniFile);
    iniFile.WriteInteger(SCRIPTS_SECTION, 'Default', FDefaultScript);

    //
    // IMPORT_SECTION
    //
    iniFile.WriteBool(IMPORT_SECTION, 'CheckFB2Exist', FCheckExistsFiles);


    //
    //   BEHAVIOR_SECTION
    //

    iniFile.WriteBool(BEHAVIOR_SECTION, 'ShowRusABC', FShowRusBar);
    iniFile.WriteBool(BEHAVIOR_SECTION, 'ShowEngABC', FShowEngBar);
    iniFile.WriteBool(BEHAVIOR_SECTION, 'DoNotShowDeleted', FDoNotShowDeleted);
    iniFile.WriteBool(BEHAVIOR_SECTION, 'ShowLocalOnly', FShowLocalOnly);
    iniFile.WriteBool(BEHAVIOR_SECTION, 'CoverPanel', FShowInfoPanel);

    iniFile.WriteBool(BEHAVIOR_SECTION, 'ShowSubGenreBooks', FShowSubGenreBooks);
    iniFile.WriteBool(BEHAVIOR_SECTION, 'MinimizeToTray', FMinimizeToTray );
    iniFile.WriteBool(BEHAVIOR_SECTION, 'ShowFb2Info', FShowFb2Info);
    iniFile.WriteBool(BEHAVIOR_SECTION, 'AutoStartDwnld', FAutoStartDwnld );
    iniFile.WriteBool(BEHAVIOR_SECTION, 'AllowMixed', FAllowMixed );

    iniFile.WriteBool(BEHAVIOR_SECTION, 'AutoRunUpdate', FAutoRunUpdate);

    iniFile.WriteBool(BEHAVIOR_SECTION, 'FullSearchMode', FFullSearchMode);
    iniFile.WriteBool(BEHAVIOR_SECTION, ' DeleteDeleted', FDeleteDeleted);
    //
    // INITIAL_DIRS_SECTION
    //
    SaveInitialDirs(iniFile);
  finally
    iniFile.Free;
  end;
end;

procedure TMHLSettings.LoadSplitters(iniFile: TIniFile);
var
  i: Integer;
  slHelper: TStringList;
  S: string;
begin
  slHelper := TStringList.Create;
  try
    slHelper.QuoteChar := '"';
    slHelper.Delimiter := ';';

    // Сначала сплиттеры
    S := iniFile.ReadString(INTERFACE_SECTION,'Splitters','250;250;250;250');
    slHelper.DelimitedText := S;
    SetLength(FSplitters,4);
    for I := 0 to slHelper.Count - 1 do
      FSplitters[i] := StrToInt(slHelper[i]);

    // режимы таблиц
    slHelper.Clear;
    S := iniFile.ReadString(INTERFACE_SECTION,'TreeModes','0;1;0;1;0;1');
    slHelper.DelimitedText := S;
    SetLength(FTreeModes,6);
    for I := 0 to slHelper.Count - 1 do
      case StrToInt(slHelper[i]) of
        0: FTreeModes[i] := tmTree;
        1: FTreeModes[i] := tmFlat;
      end;
  finally
    slHelper.Free;
  end;
end;


procedure TMHLSettings.LoadUpdates;
var
  i: Integer;
  sl: TStringList;
  slHelper: TStringList;
  iniFile: TIniFile;

begin

  FUpdateList.URL := FUpdateURL;
  FUpdateList.Path := WorkPath;

  iniFile := TIniFile.Create(FAppPath + 'updates.ini');
  try

    //
    // Добавим апдейты по умолчанию
    //

    FUpdateList.Add('Локальная коллекция Либрусек','','last_librusec.info','librusec_update.zip',
                       True,CT_LIBRUSEC_LOCAL_FB);
    FUpdateList.Add('Онлайн коллекция Либрусек','','last_librusec.info','librusec_update.zip',
                       True,CT_LIBRUSEC_ONLINE_FB);
    FUpdateList.Add('Онлайн коллекция Либрусек','','last_extra.info','extra_update.zip',
                       False,CT_LIBRUSEC_ONLINE_FB);
    FUpdateList.Add('Локальная коллекция Либрусек [USR]','','last_usr.info','usr_update.zip',
                       True,CT_LIBRUSEC_USR);

    // обрабатываем файл

    sl := TStringList.Create;
    iniFile.ReadSection('UPDATES', sl);
    if sl.Count > 0 then
    begin
      slHelper := TStringList.Create;
      try
        slHelper.QuoteChar := '"';
        slHelper.Delimiter := ';';
        for i := 0 to sl.Count - 1 do
        begin
          if Pos(READER_KEY_PREFIX, sl[i]) = 1 then
          begin
            slHelper.DelimitedText := iniFile.ReadString(READERS_SECTION, sl[i], '');
            if slHelper.Count = 5 then
            begin
              FUpdateList.Add(slHelper[0],
                              slHelper[1],
                              slHelper[2],
                              slHelper[3],
                              StrToBool(slHelper[4]),
                              StrToInt(slHelper[5]));
            end;
          end;
        end;
      finally
        slHelper.Free;
      end;
    end;
  finally
    sl.Free;
  end;
end;

procedure TMHLSettings.SaveSplitters(iniFile: TIniFile);
var
  i: Integer;
  sl: TStringList;
begin

  sl := TStringList.Create;
  try
    sl.QuoteChar := '"';
    sl.Delimiter := ';';

    // сначала сплиттеры
    for i := 0 to High(FSplitters) do
      sl.Add(IntToStr(FSplitters[i]));

    iniFile.WriteString(INTERFACE_SECTION,'Splitters', sl.DelimitedText);

   // потом - режимы списков
    sl.Clear;
    for i := 0 to High(FTreeModes) do
      sl.Add(IntToStr(ord(FTreeModes[i])));

    iniFile.WriteString(INTERFACE_SECTION,'TreeModes', sl.DelimitedText);
  finally
    sl.Free;
  end;
end;

procedure TMHLSettings.LoadReaders(iniFile: TIniFile);
var
  i: Integer;
  sl: TStringList;
  slHelper: TStringList;
begin
  sl := TStringList.Create;
  try
    iniFile.ReadSection(READERS_SECTION, sl);
    if sl.Count > 0 then
    begin
      slHelper := TStringList.Create;
      try
        slHelper.QuoteChar := '"';
        slHelper.Delimiter := ';';
        for i := 0 to sl.Count - 1 do
        begin
          if Pos(READER_KEY_PREFIX, sl[i]) = 1 then
          begin
            slHelper.DelimitedText := iniFile.ReadString(READERS_SECTION, sl[i], '');
            if slHelper.Count = 2 then
              FReaders.Add(slHelper[0], slHelper[1]);
          end;
        end;
      finally
        slHelper.Free;
      end;
    end
    else
    begin
      //
      // Добавим некоторые ридеры по умолчанию
      //
      FReaders.Add('fb2',AppPath+'AlReader\AlReader2.exe');
      FReaders.Add('doc',AppPath+'AlReader\AlReader2.exe');
      FReaders.Add('txt',AppPath+'AlReader\AlReader2.exe');
      FReaders.Add('htm',AppPath+'AlReader\AlReader2.exe');
      FReaders.Add('html',AppPath+'AlReader\AlReader2.exe');
      FReaders.Add('pdf', '');
      FReaders.Add('djvu', '');
      FReaders.Add('mht', '');
      FReaders.Add('chm', '');
    end;
  finally
    sl.Free;
  end;
end;

procedure TMHLSettings.SaveReaders(iniFile: TIniFile);
var
  i: Integer;
  sl: TStringList;
begin
  iniFile.EraseSection(READERS_SECTION);

  if FReaders.Count > 0 then
  begin
    sl := TStringList.Create;
    try
      sl.QuoteChar := '"';
      sl.Delimiter := ';';

      for i := 0 to FReaders.Count - 1 do
      begin
        sl.Clear;
        sl.Add(FReaders[i].Extension);
        sl.Add(FReaders[i].Path);

        iniFile.WriteString(READERS_SECTION, Format('%s%u', [READER_KEY_PREFIX, i]), sl.DelimitedText);
      end;
    finally
      sl.Free;
    end;
  end;
end;

procedure TMHLSettings.LoadScripts(iniFile: TIniFile);
var
  i: Integer;
  sl: TStringList;
  slHelper: TStringList;
begin
  sl := TStringList.Create;
  try
    iniFile.ReadSection(SCRIPTS_SECTION, sl);
    if sl.Count > 0 then
    begin
      slHelper := TStringList.Create;
      try
        slHelper.QuoteChar := '"';
        slHelper.Delimiter := ';';
        for i := 0 to sl.Count - 1 do
        begin
          if Pos(SCRIPT_KEY_PREFIX, sl[i]) = 1 then
          begin
            slHelper.DelimitedText := iniFile.ReadString(SCRIPTS_SECTION, sl[i], '');
            if slHelper.Count = 3 then
              FScripts.Add(slHelper[0], slHelper[1], slHelper[2]);
          end;
        end;
      finally
        slHelper.Free;
      end;
    end;
  finally
    sl.Free;
  end;
end;

procedure TMHLSettings.SaveScripts(iniFile: TIniFile);
var
  i: Integer;
  sl: TStringList;
begin
  iniFile.EraseSection(SCRIPTS_SECTION);

  if FScripts.Count > 0 then
  begin
    sl := TStringList.Create;
    try
      sl.QuoteChar := '"';
      sl.Delimiter := ';';

      for i := 0 to FScripts.Count - 1 do
      begin
        sl.Clear;
        sl.Add(FScripts[i].Title);
        sl.Add(FScripts[i].Path);
        sl.Add(FScripts[i].Params);

        iniFile.WriteString(SCRIPTS_SECTION, Format('%s%u', [SCRIPT_KEY_PREFIX, i]), sl.DelimitedText);
      end;
    finally
      sl.Free;
    end;
  end;
end;

function TMHLSettings.GetDataPath: string;
begin
  Result := IncludeTrailingPathDelimiter(FDataDir);
end;

function TMHLSettings.GetTempPath: string;
begin
  Result := IncludeTrailingPathDelimiter(FTempDir);
end;

function TMHLSettings.GetWorkPath: string;
begin
  Result := IncludeTrailingPathDelimiter(FWorkDir);
end;

function TMHLSettings.GetDevicePath: string;
begin
  Result := IncludeTrailingPathDelimiter(FDeviceDir);
end;

function TMHLSettings.GetSystemFileName(fileType: TMHLSystemFile): string;
begin
  case fileType of
    sfSystemDB: Result := DataPath + SYSTEM_DATABASE_FILENAME;
    sfGenresFB2: Result := AppPath + GENRES_FB2_FILENAME;
    sfGenresNonFB2: Result := AppPath + GENRES_NONFB2_FILENAME;
    sfServerErrorLog: Result := WorkPath + SERVER_ERRORLOG_FILENAME;
    sfImportErrorLog: Result := WorkPath + IMPORT_ERRORLOG_FILENAME;
    sfAppHelp: Result := AppPath + APP_HELP_FILENAME;
    sfLibRusEcUpdate: Result := WorkPath + LIBRUSEC_UPDATE_FILENAME;
    sfLibRusEcInpx: Result := WorkPath + LIBRUSEC_INPX_FILENAME;
    sfAppVerInfo: Result := WorkPath + PROGRAM_VERINFO_FILENAME;
    sfCollectionVerInfo: Result := TempPath + COLLECTION_VERINFO_FILENAME;
  else
    Assert(False);
  end;
end;

procedure TMHLSettings.SetDeviceDir(const Value: string);
begin
  FDeviceDir := ExcludeTrailingPathDelimiter(Value);
end;

procedure TMHLSettings.LoadInitialDirs(iniFile: TIniFile);
var
  i: Integer;
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    iniFile.ReadSection(INITIAL_DIRS_SECTION, sl);
    for i := 0 to sl.Count - 1 do
      FInitialDirs.Values[sl[i]] := iniFile.ReadString(INITIAL_DIRS_SECTION, sl[i], '');
  finally
    sl.Free;
  end;
end;

procedure TMHLSettings.SaveInitialDirs(iniFile: TIniFile);
var
  i: Integer;
begin
  iniFile.EraseSection(INITIAL_DIRS_SECTION);

  for i := 0 to FInitialDirs.Count - 1 do
    iniFile.WriteString(INITIAL_DIRS_SECTION, FInitialDirs.Names[i], FInitialDirs.ValueFromIndex[i]);
end;

function TMHLSettings.GetInitialDir(const key: string): string;
begin
  Result := FInitialDirs.Values[key];
end;

function TMHLSettings.GetPresetPath: string;
begin
  if FPresetDir <> '' then
    Result := IncludeTrailingPathDelimiter(FPresetDir)
  else
    Result := '';
end;

function TMHLSettings.GetReadPath: string;
begin
  if FReadDir <> '' then
    Result := IncludeTrailingPathDelimiter(FReadDir)
  else
    Result := '';
end;

procedure TMHLSettings.SetInitialDir(const key, Value: string);
begin
  FInitialDirs.Values[key] := Value;
end;

procedure TMHLSettings.SetReadDir(const Value: string);
begin
  FReadDir := ExcludeTrailingPathDelimiter(Value)
end;

initialization
  g_objSettings := nil;

end.
