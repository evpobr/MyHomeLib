
{*******************************************************}
{                                                       }
{       Borland Delphi Custom Library                   }
{       HTMLHelp API Interface Unit                     }
{                                                       }
{       Copyright (c) 1985-1999, Microsoft Corporation  }
{                                                       }
{       Translated by  Vino Rodrigues                   }
{       vinorodrigues@yahoo.com                         }
{                                                       }
{*******************************************************}

unit HtmlHlp;

{$UNDEF DEBUG}
{.$DEFINE DEBUG}

{$IFDEF DEBUG}
  {$D+,C+,O-,Q+,R+,Y+,L+}
{$ELSE}
  {$D-,C-,Q-,R-,Y-,L-}
{$ENDIF}

interface

uses
  Windows;

{ Commands to pass to HtmlHelp }

const
  HH_DISPLAY_TOPIC        = $0000;
  HH_HELP_FINDER          = $0000;  // WinHelp equivalent
  HH_DISPLAY_TOC          = $0001;  // not currently implemented
  HH_DISPLAY_INDEX        = $0002;  // not currently implemented
  HH_DISPLAY_SEARCH       = $0003;  // not currently implemented
  HH_SET_WIN_TYPE         = $0004;
  HH_GET_WIN_TYPE         = $0005;
  HH_GET_WIN_HANDLE       = $0006;
  HH_ENUM_INFO_TYPE       = $0007;  // Get Info type name, call repeatedly enumerate, -1 at end
  HH_SET_INFO_TYPE        = $0008;  // Add Info type to filter.
  HH_SYNC                 = $0009;
  HH_ADD_NAV_UI           = $000A;  // not currently implemented
  HH_ADD_BUTTON           = $000B;  // not currently implemented
  HH_GETBROWSER_APP       = $000C;  // not currently implemented
  HH_KEYWORD_LOOKUP       = $000D;
  HH_DISPLAY_TEXT_POPUP   = $000E;  // display string resource id or text in a popup window
  HH_HELP_CONTEXT         = $000F;  // display mapped numeric value in dwData
  HH_TP_HELP_CONTEXTMENU  = $0010;  // text popup help, same as WinHelp HELP_CONTEXTMENU
  HH_TP_HELP_WM_HELP      = $0011;  // text popup help, same as WinHelp HELP_WM_HELP
  HH_CLOSE_ALL            = $0012;  // close all windows opened directly or indirectly by the caller
  HH_ALINK_LOOKUP         = $0013;  // ALink version of HH_KEYWORD_LOOKUP
  HH_GET_LAST_ERROR       = $0014;  // not currently implemented (See HHERROR.h)
  HH_ENUM_CATEGORY        = $0015;  // Get category name, call repeatedly to enumerate, -1 at end
  HH_ENUM_CATEGORY_IT     = $0016;  // Get category info type members, call repeatedly to enumerate, -1 at end
  HH_RESET_IT_FILTER      = $0017;  // Clear the info type filter of all info types.
  HH_SET_INCLUSIVE_FILTER = $0018;  // set inclusive filtering method for untyped topics to be included in display
  HH_SET_EXCLUSIVE_FILTER = $0019;  // set exclusive filtering method for untyped topics to be excluded from display
  HH_SET_GUID             = $001A;  // For Microsoft Installer -- dwData is a pointer to the GUID string

  HH_INTERNAL             = $00FF;  // Used internally.

{ window properties }

const
  HHWIN_PROP_ONTOP          = 1 shl 1;   // Top-most window (not currently implemented)
  HHWIN_PROP_NOTITLEBAR     = 1 shl 2;   // no title bar
  HHWIN_PROP_NODEF_STYLES   = 1 shl 3;   // no default window styles (only HH_WINTYPE.dwStyles)
  HHWIN_PROP_NODEF_EXSTYLES = 1 shl 4;   // no default extended window styles (only HH_WINTYPE.dwExStyles)
  HHWIN_PROP_TRI_PANE       = 1 shl 5;   // use a tri-pane window
  HHWIN_PROP_NOTB_TEXT      = 1 shl 6;   // no text on toolbar buttons
  HHWIN_PROP_POST_QUIT      = 1 shl 7;   // post WM_QUIT message when window closes
  HHWIN_PROP_AUTO_SYNC      = 1 shl 8;   // automatically ssync contents and index
  HHWIN_PROP_TRACKING       = 1 shl 9;   // send tracking notification messages
  HHWIN_PROP_TAB_SEARCH     = 1 shl 10;  // include search tab in navigation pane
  HHWIN_PROP_TAB_HISTORY    = 1 shl 11;  // include history tab in navigation pane
  HHWIN_PROP_TAB_BOOKMARKS  = 1 shl 12;  // include bookmark tab in navigation pane
  HHWIN_PROP_CHANGE_TITLE   = 1 shl 13;  // Put current HTML title in title bar
  HHWIN_PROP_NAV_ONLY_WIN   = 1 shl 14;  // Only display the navigation window
  HHWIN_PROP_NO_TOOLBAR     = 1 shl 15;  // Don't display a toolbar
  HHWIN_PROP_MENU           = 1 shl 16;  // Menu
  HHWIN_PROP_TAB_ADVSEARCH  = 1 shl 17;  // Advanced FTS UI.
  HHWIN_PROP_USER_POS       = 1 shl 18;  // After initial creation, user controls window size/position

{ window parameters }

const
  HHWIN_PARAM_PROPERTIES    = 1 shl 1;   // valid fsWinProperties
  HHWIN_PARAM_STYLES        = 1 shl 2;   // valid dwStyles
  HHWIN_PARAM_EXSTYLES      = 1 shl 3;   // valid dwExStyles
  HHWIN_PARAM_RECT          = 1 shl 4;   // valid rcWindowPos
  HHWIN_PARAM_NAV_WIDTH     = 1 shl 5;   // valid iNavWidth
  HHWIN_PARAM_SHOWSTATE     = 1 shl 6;   // valid nShowState
  HHWIN_PARAM_INFOTYPES     = 1 shl 7;   // valid apInfoTypes
  HHWIN_PARAM_TB_FLAGS      = 1 shl 8;   // valid fsToolBarFlags
  HHWIN_PARAM_EXPANSION     = 1 shl 9;   // valid fNotExpanded
  HHWIN_PARAM_TABPOS        = 1 shl 10;  // valid tabpos
  HHWIN_PARAM_TABORDER      = 1 shl 11;  // valid taborder
  HHWIN_PARAM_HISTORY_COUNT = 1 shl 12;  // valid cHistory
  HHWIN_PARAM_CUR_TAB       = 1 shl 13;  // valid curNavType

{ button constants }

const
  HHWIN_BUTTON_EXPAND     = 1 shl 1;   // Expand/contract button
  HHWIN_BUTTON_BACK       = 1 shl 2;   // Back button
  HHWIN_BUTTON_FORWARD    = 1 shl 3;   // Forward button
  HHWIN_BUTTON_STOP       = 1 shl 4;   // Stop button
  HHWIN_BUTTON_REFRESH    = 1 shl 5;   // Refresh button
  HHWIN_BUTTON_HOME       = 1 shl 6;   // Home button
  HHWIN_BUTTON_BROWSE_FWD = 1 shl 7;   // not implemented
  HHWIN_BUTTON_BROWSE_BCK = 1 shl 8;   // not implemented
  HHWIN_BUTTON_NOTES      = 1 shl 9;   // not implemented
  HHWIN_BUTTON_CONTENTS   = 1 shl 10;  // not implemented
  HHWIN_BUTTON_SYNC       = 1 shl 11;  // Sync button
  HHWIN_BUTTON_OPTIONS    = 1 shl 12;  // Options button
  HHWIN_BUTTON_PRINT      = 1 shl 13;  // Print button
  HHWIN_BUTTON_INDEX      = 1 shl 14;  // not implemented
  HHWIN_BUTTON_SEARCH     = 1 shl 15;  // not implemented
  HHWIN_BUTTON_HISTORY    = 1 shl 16;  // not implemented
  HHWIN_BUTTON_BOOKMARKS  = 1 shl 17;  // not implemented
  HHWIN_BUTTON_JUMP1      = 1 shl 18;
  HHWIN_BUTTON_JUMP2      = 1 shl 19;
  HHWIN_BUTTON_ZOOM       = 1 shl 20;
  HHWIN_BUTTON_TOC_NEXT   = 1 shl 21;
  HHWIN_BUTTON_TOC_PREV   = 1 shl 22;

  HHWIN_DEF_BUTTONS       = HHWIN_BUTTON_EXPAND or HHWIN_BUTTON_BACK or
                            HHWIN_BUTTON_OPTIONS or HHWIN_BUTTON_PRINT;

{ Button IDs }

const
  IDTB_EXPAND      = 200;
  IDTB_CONTRACT    = 201;
  IDTB_STOP        = 202;
  IDTB_REFRESH     = 203;
  IDTB_BACK        = 204;
  IDTB_HOME        = 205;
  IDTB_SYNC        = 206;
  IDTB_PRINT       = 207;
  IDTB_OPTIONS     = 208;
  IDTB_FORWARD     = 209;
  IDTB_NOTES       = 210;  // not implemented
  IDTB_BROWSE_FWD  = 211;
  IDTB_BROWSE_BACK = 212;
  IDTB_CONTENTS    = 213;  // not implemented
  IDTB_INDEX       = 214;  // not implemented
  IDTB_SEARCH      = 215;  // not implemented
  IDTB_HISTORY     = 216;  // not implemented
  IDTB_BOOKMARKS   = 217;  // not implemented
  IDTB_JUMP1       = 218;
  IDTB_JUMP2       = 219;
  IDTB_CUSTOMIZE   = 221;
  IDTB_ZOOM        = 222;
  IDTB_TOC_NEXT    = 223;
  IDTB_TOC_PREV    = 224;

{ Assumed Types }

type
  TColor = -$7FFFFFFF-1..$7FFFFFFF;

{ Notification codes }

const
  HHN_FIRST         = Cardinal(-860);
  HHN_LAST          = Cardinal(-879);

  HHN_NAVCOMPLETE   = HHN_FIRST - 0;
  HHN_TRACK         = HHN_FIRST - 1;
  HHN_WINDOW_CREATE = HHN_FIRST - 2;

type
  THHNNOTIFY = record
    hdr: TNMHDR;
    pszUrl: PWideChar;  // Multi-byte, null-terminated string
  end;

  THHPOPUP = record
    cbStruct: Integer;         // sizeof this structure
    hinst: Longint;            // instance handle for string resource
    idString: UINT;            // string resource id, or text id if pszFile is specified in HtmlHelp call
    pszText: PAnsiChar;          // used if idString is zero
    pt: TPOINT;                // top center of popup window
    clrForeground: TCOLORREF;  // use -1 for default
    clrBackground: TCOLORREF;  // use -1 for default
    rcMargins: TRECT;          // amount of space between edges of window and text, -1 for each member to ignore
    pszFont: PAnsiChar;          // facename, point size, char set, BOLD ITALIC UNDERLINE
  end;

  THHAKLINK = record
    cbStruct: Integer;     // sizeof this structure
    fReserved: BOOL;       // must be FALSE (really!)
    pszKeywords: PAnsiChar;  // semi-colon separated keywords
    pszUrl: PAnsiChar;       // URL to jump to if no keywords found (may be NULL)
    pszMsgText: PAnsiChar;   // Message text to display in MessageBox if pszUrl is NULL and no keyword match
    pszMsgTitle: PAnsiChar;  // Message text to display in MessageBox if pszUrl is NULL and no keyword match
    pszWindow: PAnsiChar;    // Window to display URL in
    fIndexOnFail: BOOL;    // Displays index if keyword lookup fails.
  end;

   THHWinNavTypes = (
     HHWIN_NAVTYPE_TOC,          // = 0
     HHWIN_NAVTYPE_INDEX,        // = 1
     HHWIN_NAVTYPE_SEARCH,       // = 2
     HHWIN_NAVTYPE_HISTORY,      // = 3
     __HHWIN_NAMTYPE_DUMMY04,
     __HHWIN_NAMTYPE_DUMMY05,
     __HHWIN_NAMTYPE_DUMMY06,
     __HHWIN_NAMTYPE_DUMMY07,
     __HHWIN_NAMTYPE_DUMMY08,
     __HHWIN_NAMTYPE_DUMMY09,
     __HHWIN_NAMTYPE_DUMMY10,
     HHWIN_NAVTYPE_FAVOURITES);  // = 11

  THHITTypes = (IT_INCLUSIVE, IT_EXCLUSIVE, IT_HIDDEN);

  PHHENUMIT = ^THHENUMIT;
  THHENUMIT = record
    cbStruct: Integer;         // size of this structure
    iType: Integer;            // the type of the information type ie. Inclusive, Exclusive, or Hidden
    pszCatName: PAnsiChar;        // Set to the name of the Category to enumerate the info types in a category; else NULL
    pszITName: PAnsiChar;         // volitile pointer to the name of the infotype. Allocated by call. Caller responsible for freeing
    pszITDescription: PAnsiChar;  // volitile pointer to the description of the infotype.
  end;

  PHHENUMCAT = ^THHENUMCAT;
  THHENUMCAT = record
    cbStruct: Integer;         // size of this structure
    pszCatName: PAnsiChar;        // volitile pointer to the category name
    pszCatDescription: PAnsiChar; // volitile pointer to the category description
  end;

  PHHSETINFOTYPE = ^THHSETINFOTYPE;
  THHSETINFOTYPE = record
    cbStruct: Integer;        // the size of this structure
    pszCatName: PAnsiChar;       // the name of the category, if any, the InfoType is a member of.
    pszInfoTypeName: PAnsiChar;  // the name of the info type to add to the filter
  end;

  PHHINFOTYPE = ^THHINFOTYPE;
  THHINFOTYPE = DWORD;

  THHWinNavTabTypes = (HHWIN_NAVTAB_TOP, HHWIN_NAVTAB_LEFT, HHWIN_NAVTAB_BOTTOM);

const
  HH_MAXTABS = 19;  // maximum number of tabs

type
  THHTabTypes = (
    HH_TAB_CONTENTS,      // = 0
    HH_TAB_INDEX,         // = 1
    HH_TAB_SEARCH,        // = 2
    HH_TAB_FAVORITES,     // = 3
    HH_TAB_HISTORY,       // = 4
    HH_TAB_AUTHOR,        // = 5
    __HH_TAB_DUMMY06,
    __HH_TAB_DUMMY07,
    __HH_TAB_DUMMY08,
    __HH_TAB_DUMMY09,
    __HH_TAB_DUMMY10,
    HH_TAB_CUSTOM_FIRST,
    __HH_TAB_DUMMY12,
    __HH_TAB_DUMMY13,
    __HH_TAB_DUMMY14,
    __HH_TAB_DUMMY15,
    __HH_TAB_DUMMY16,
    __HH_TAB_DUMMY17,
    __HH_TAB_DUMMY19,
    HH_TAB_CUSTOM_LAST);  // = HH_MAX_TABS

const
  HH_MAX_TABS_CUSTOM = Ord(HH_TAB_CUSTOM_LAST) - Ord(HH_TAB_CUSTOM_FIRST) + 1;

type
  TTabOrder = array[0..HH_MAXTABS] of BYTE;

{ HH_DISPLAY_SEARCH Command Related Structures and Constants }

const
  HHFTSDEFAULTPROXIMITY = -1;

type
  THHFTSQUERY = record
    cbStruct: Integer;        // Sizeof structure in bytes.
    fUniCodeStrings: BOOL;    // TRUE if all strings are unicode.
    pszSearchQuery: PAnsiChar;  // String containing the search query.
    iProximity: Longint;         // Word proximity.
    fStemmedSearch: BOOL;     // TRUE for StemmedSearch only.
    fTitleOnly: BOOL;         // TRUE for Title search only.
    fExecute: BOOL;           // TRUE to initiate the search.
    pszWindow: PAnsiChar;       // Window to display in
  end;

{ HH_WINTYPE Structure }

type
  PHHWINTYPE = ^THHWINTYPE;
  THHWINTYPE = record
    cbStruct: Integer;         // IN: size of this structure including all Information Types
    fUniCodeStrings: BOOL;     // IN/OUT: TRUE if all strings are in UNICODE
    pszType: PAnsiChar;          // IN/OUT: Name of a type of window
    fsValidMembers: DWORD;     // IN: Bit flag of valid members (HHWIN_PARAM_)
    fsWinProperties: DWORD;    // IN/OUT: Properties/attributes of the window (HHWIN_)

    pszCaption: PAnsiChar;       // IN/OUT: Window title
    dwStyles: DWORD;           // IN/OUT: Window styles
    dwExStyles: DWORD;         // IN/OUT: Extended Window styles
    rcWindowPos: TRECT;        // IN: Starting position, OUT: current position
    nShowState: Integer;       // IN: show state (e.g., SW_SHOW)

    hwndHelp: HWND;            // OUT: window handle
    hwndCaller: HWND;          // OUT: who called this window

    paInfoTypes: PHHINFOTYPE;  // IN: Pointer to an array of Information Types

    // The following members are only valid if HHWIN_PROP_TRI_PANE is set

    hwndToolBar: HWND;         // OUT: toolbar window in tri-pane window
    hwndNavigation: HWND;      // OUT: navigation window in tri-pane window
    hwndHTML: HWND;            // OUT: window displaying HTML in tri-pane window
    iNavWidth: Integer;        // IN/OUT: width of navigation window
    rcHTML: TRect;             // OUT: HTML window coordinates

    pszToc: PAnsiChar;           // IN: Location of the table of contents file
    pszIndex: PAnsiChar;         // IN: Location of the index file
    pszFile: PAnsiChar;          // IN: Default location of the html file
    pszHome: PAnsiChar;          // IN/OUT: html file to display when Home button is clicked
    fsToolBarFlags: DWORD;     // IN: flags controling the appearance of the toolbar
    fNotExpanded: BOOL;        // IN: TRUE/FALSE to contract or expand, OUT: current state
    curNavType: Integer;       // IN/OUT: UI to display in the navigational pane
    tabpos: Integer;           // IN/OUT: HHWIN_NAVTAB_TOP, HHWIN_NAVTAB_LEFT, or HHWIN_NAVTAB_BOTTOM
    idNotify: Integer;         // IN: ID to use for WM_NOTIFY messages
    tabOrder: array[0..HH_MAXTABS + 1] of BYTE;
    // IN/OUT: tab order: Contents, Index, Search, History, Favorites, Reserved 1-5, Custom tabs
    cHistory: Integer;         // IN/OUT: number of history items to keep (default is 30)
    pszJump1: PAnsiChar;         // Text for HHWIN_BUTTON_JUMP1
    pszJump2: PAnsiChar;         // Text for HHWIN_BUTTON_JUMP2
    pszUrlJump1: PAnsiChar;      // URL for HHWIN_BUTTON_JUMP1
    pszUrlJump2: PAnsiChar;      // URL for HHWIN_BUTTON_JUMP2
    rcMinSize: TRECT;          // Minimum size for window (ignored in version 1)
    cbInfoTypes: Integer;      // size of paInfoTypes;
  end;

  THHActTabTypes = (
    HHACT_TAB_CONTENTS,
    HHACT_TAB_INDEX,
    HHACT_TAB_SEARCH,
    HHACT_TAB_HISTORY,
    HHACT_TAB_FAVORITES,

    HHACT_EXPAND,
    HHACT_CONTRACT,
    HHACT_BACK,
    HHACT_FORWARD,
    HHACT_STOP,
    HHACT_REFRESH,
    HHACT_HOME,
    HHACT_SYNC,
    HHACT_OPTIONS,
    HHACT_PRINT,
    HHACT_HIGHLIGHT,
    HHACT_CUSTOMIZE,
    HHACT_JUMP1,
    HHACT_JUMP2,
    HHACT_ZOOM,
    HHACT_TOC_NEXT,
    HHACT_TOC_PREV,
    HHACT_NOTES,

    HHACT_LAST_ENUM);

  THHNTRACK = record
    hdr: TNMHDR;
    pszCurUrl: PWideChar;     // Multi-byte, null-terminated string
    idAction: Integer;        // HHACT_ value
    phhWinType: PHHWINTYPE;  // Current window type structure
  end;

const
  ATOM_HTMLHELP_API_ANSI: PChar = #0#0#0#14;
  ATOM_HTMLHELP_API_UNICODE: PChar = #0#0#0#15;

type

  PFNHtmlHelpW = ^TFNHtmlHelpW;
  TFNHtmlHelpW = function(hwndCaller: HWND; pszFile: PChar;
    uCommand: UINT; dwData: DWORD): HWND; stdcall;

function HtmlHelp(hwndCaller: HWND; pszFile: PChar;
  uCommand: UINT; dwData: DWORD): HWND; stdcall;

const
  HELPDLL: string = 'HHCTRL.OCX';

implementation

var
  HelpModule: HModule;
  HH: TFNHtmlHelpW;
  HelpChecked: Boolean;

procedure InitHelp;
begin
  if (not HelpChecked) then
  begin
    HelpChecked := True;
    try
      HelpModule := LoadLibrary(PChar(HELPDLL));
    except
      HelpModule := 0;
    end;
    if HelpModule <> 0 then
      try
        @HH := GetProcAddress(HelpModule, 'HtmlHelpW');
      except
        @HH := nil;
      end;
  end;
end;

function HtmlHelp(hwndCaller: HWND; pszFile: PChar; uCommand: UINT;
  dwData: DWORD): HWND;
begin
  if (uCommand = HH_CLOSE_ALL) and (not HelpChecked) then Exit;
  InitHelp;
  if (@HH <> nil) then
    Result := HH(hwndCaller, pszFile, uCommand, dwData)
  else
    Result := 0;
end;

initialization
  HelpModule := 0;
  HH := nil;
  HelpChecked := False;
finalization
  if (HelpModule <> 0) then FreeLibrary(HelpModule);
end.

