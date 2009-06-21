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

unit unit_Helpers;

interface

uses
  Windows, Classes, Dialogs, Graphics;

type
  TStringListEx = class(TStringList)
  public
    procedure LoadFromStream(Stream: TStream); override;
  end;

function GetFileSize(const FileName: string): Integer;

function GetOpenFileName(
  const Title: string;
  const DefaultExt: string;
  const Filter: string;
  out strFileName: string;
  dialogKey: string = '';
  ExtraOptions: TOpenOptions = []
  ): Boolean;

function GetSaveFileName(
  const Title: string;
  const DefaultExt: string;
  const Filter: string;
  out strFileName: string;
  dialogKey: string = '';
  ExtraOptions: TOpenOptions = []
  ): Boolean;

type
  TMHLFileName = (
    fnGenreList,
    fnOpenCollection,
    fnSelectReader,
    fnSelectScript,
    fnOpenImportFile,
    fnSaveCollection,
    fnSaveLog,
    fnSaveImportFile,
    fnOpenINPX,
    fnSaveINPX
  );

function GetFileName(key: TMHLFileName; out FileName: string): Boolean;

function GetFolderName(Handle: Integer; Caption: string; var strFolder: string): Boolean;

function CreateImageFromResource(GraphicClass: TGraphicClass; const ResName: string; ResType: PChar = RT_RCDATA): TGraphic;

implementation

uses
  SysUtils, Forms, unit_Consts, unit_Settings, ShlObj, ActiveX;

{ TStringListEx }

procedure TStringListEx.LoadFromStream(Stream: TStream);
const
  UTF8BOM: array [1..3] of Byte = ($EF, $BB, $BF); //the UTF-8 byte order mark (BOM).
var
  FIsUTF8File: Boolean;
  APosition: Int64;
  bomBuffer: array [1..3] of Byte;
begin
  APosition := Stream.Position;
  FIsUTF8File := False;

  if Stream.Read(bomBuffer, SizeOf(bomBuffer)) = SizeOf(bomBuffer) then
  begin
    FIsUTF8File := (bomBuffer[1] = UTF8BOM[1]) and (bomBuffer[2] = UTF8BOM[2]) or (bomBuffer[3] = UTF8BOM[3]);
  end;

  if not FIsUTF8File then
    Stream.Position := APosition;

  inherited;
end;

// ============================================================================
function GetFileSize(const FileName: string): Integer;
var
  hFile: Integer;
begin
  hFile := SysUtils.FileOpen(FileName, fmOpenRead or fmShareDenyWrite);
  if hFile = -1 then
    RaiseLastOSError;

  Result := Windows.GetFileSize(hFile, nil);
  SysUtils.FileClose(hFile);
end;

// ============================================================================
type
  TStdDialogClass = class of TOpenDialog;

function InternalGetFileName(
  DialogClass: TStdDialogClass;
  const Title: string;
  const DefaultExt: string;
  const Filter: string;
  out strFileName: string;
  ExtraOptions: TOpenOptions;
  dialogKey: string = ''
  ): Boolean;
var
  dlg: TOpenDialog;
begin
  dlg := DialogClass.Create(nil);
  try
    if Title <> '' then    
      dlg.Title := Title;
    dlg.DefaultExt := DefaultExt;
    dlg.Filter := Filter;
    dlg.Options := dlg.Options + ExtraOptions;

    { DONE -oNickR -cUsability : восстановить InitialDir }
    dlg.InitialDir := Settings.InitialDir[dialogKey];

    Result := dlg.Execute;
    if Result then
    begin
      strFileName := dlg.FileName;

      { DONE -oNickR -cUsability : сохранить InitialDir }
      Settings.InitialDir[dialogKey] := ExtractFilePath(strFileName);
    end;
  finally
    dlg.Free;
  end;
end;

function GetOpenFileName(
  const Title: string;
  const DefaultExt: string;
  const Filter: string;
  out strFileName: string;
  dialogKey: string = '';
  ExtraOptions: TOpenOptions = []
  ): Boolean;
begin
  //
  // TODO -oNickR -cUsability : использовать TFileOpenDialog под Vista-ой
  //
  Include(ExtraOptions, ofFileMustExist);
  Include(ExtraOptions, ofNoChangeDir);
  Result := InternalGetFileName(TOpenDialog, Title, DefaultExt, Filter, strFileName, ExtraOptions, dialogKey);
end;

function GetSaveFileName(
  const Title: string;
  const DefaultExt: string;
  const Filter: string;
  out strFileName: string;
  dialogKey: string = '';
  ExtraOptions: TOpenOptions = []
  ): Boolean;
begin
  //
  // TODO -oNickR -cUsability : использовать TFileSaveDialog под Vista-ой
  //
  Include(ExtraOptions, ofOverwritePrompt);
  Include(ExtraOptions, ofNoChangeDir);
  Result := InternalGetFileName(TSaveDialog, Title, DefaultExt, Filter, strFileName, ExtraOptions, dialogKey);
end;

type
  TDialogParams = record
    Title: string;
    Filter: string;
    DefaultExt: string;
    DialogKey: string;
    OpenFile: Boolean;
  end;

resourcestring
  //fnGenreList
  rstrGenreListDlgTitle = 'Выбор списка жанров';
  rstrGenreListDlgFilter = 'Список жанров MyHomeLib (*.glst)|*.glst|Все типы|*.*';
  rstrGenreListDlgDefaultExt = 'glst';

  // fnOpenCollection
  rstrOpenCollectionDlgTitle = 'Открыть файл коллекции';
  // fnSaveCollection
  rstrSaveCollectionDlgTitle = 'Сохранить файл коллекции';
  rstrCollectionDlgFilter = 'Коллекция MyHomeLib (*.hlc)|*.hlc|Все типы|*.*';
  rstrCollectionDlgDefaultExt = 'hlc';

  // fnSelectReader
  rstrSelectReaderDlgTitle = 'Выбор программы для просмотра';
  // fnSelectScript
  rstrSelectScriptDlgTitle = 'Выбор скрипта';
  rstrSelectProgrammDlgFilter = 'Скрипты, программы (*.exe;*.bat;*.cmd;*.vbs;*.js)|*.exe;*.bat;*.cmd;*.vbs;*.js|Все типы|*.*';
  rstrSelectProgrammDlgDefaultExt = 'exe';

  // fnOpenImportFile
  rstrOpenImportFileDlgTitle = 'Открыть xml';
  // fnSaveImportFile
  rstrSaveImportFileDlgTitle = 'Сохранить xml';
  rstrImportFileDlgFilter = 'xml (*.xml)|*.xml|Все типы|*.*';
  rstrImportFileDlgDefaultExt = 'xml';

  // fnSaveLog
  rstrSaveLogDlgTitle = 'Сохранить лог работы';
  rstrSaveLogDlgFilter = 'Файл протокола (*.log)|*.log|Все типы|*.*';
  rstrSaveLogDlgDefaultExt = 'log';
  //fnOpenINPX
  rstrOpenINPXDlgTitle = 'Выбор файла списков';
  rstrOpenINPXDlgFilter = 'Список книг MyHomeLib (*.inpx)|*.inpx|Все типы|*.*';
  rstrOpenINPXDlgDefaultExt = 'inpx';

  //fnSaveINPX
  rstrSaveINPXDlgTitle = 'Выбор файла списков';
  rstrSaveINPXDlgFilter = 'Список книг MyHomeLib (*.inpx)|*.inpx|Все типы|*.*';
  rstrSaveINPXDlgDefaultExt = 'inpx';

function GetFileName(key: TMHLFileName; out FileName: string): Boolean;
const
  DlgParams: array[TMHLFileName] of TDialogParams = (
    ( // fnGenreList
      Title:      rstrGenreListDlgTitle;
      Filter:     rstrGenreListDlgFilter;      DefaultExt: rstrGenreListDlgDefaultExt;
      DialogKey:  'SelectGenreList';           OpenFile:   True
    ),
    ( // fnOpenCollection
      Title:      rstrOpenCollectionDlgTitle;
      Filter:     rstrCollectionDlgFilter;     DefaultExt: rstrCollectionDlgDefaultExt;
      DialogKey:  'OpenCollection';            OpenFile:   True
    ),
    ( // fnSelectReader
      Title:      rstrSelectReaderDlgTitle;
      Filter:     rstrSelectProgrammDlgFilter; DefaultExt: rstrSelectProgrammDlgDefaultExt;
      DialogKey:  'SelectReader';              OpenFile:   True
    ),
    ( // fnSelectScript
      Title:      rstrSelectScriptDlgTitle;
      Filter:     rstrSelectProgrammDlgFilter; DefaultExt: rstrSelectProgrammDlgDefaultExt;
      DialogKey:  'SelectScript';              OpenFile:   True
    ),
    ( // fnOpenImportFile
      Title:      rstrOpenImportFileDlgTitle;
      Filter:     rstrImportFileDlgFilter;     DefaultExt: rstrImportFileDlgDefaultExt;
      DialogKey:  'OpenImportFile';            OpenFile:   True
    ),
    ( // fnSaveCollection
      Title:      rstrSaveCollectionDlgTitle;
      Filter:     rstrCollectionDlgFilter;     DefaultExt: rstrCollectionDlgDefaultExt;
      DialogKey:  'SaveCollection';            OpenFile:   False
    ),
    ( // fnSaveLog
      Title:      rstrSaveLogDlgTitle;
      Filter:     rstrSaveLogDlgFilter;        DefaultExt: rstrSaveLogDlgDefaultExt;
      DialogKey:  'SaveLog';                   OpenFile:   False
    ),
    ( // fnSaveImportFile
      Title:      rstrSaveImportFileDlgTitle;
      Filter:     rstrImportFileDlgFilter;     DefaultExt: rstrImportFileDlgDefaultExt;
      DialogKey:  'SaveImportFile';            OpenFile:   False
    ),
    ( // fnLoadINPX
      Title:      rstrOpenINPXDlgTitle;
      Filter:     rstrOpenINPXDlgFilter;     DefaultExt: rstrOpenINPXDlgDefaultExt;
      DialogKey:  'OpenINPXFile';            OpenFile:   True
    ),
    ( // fnSaveINPX
      Title:      rstrSaveINPXDlgTitle;
      Filter:     rstrSaveINPXDlgFilter;     DefaultExt: rstrSaveINPXDlgDefaultExt;
      DialogKey:  'SaveINPXFile';            OpenFile:   False
    )
    //(Title: ''; Filter: ''; DefaultExt: ''; ExtraOptions: ; DialogKey: ''; GetFileNameFunction:)
  );
begin
  if DlgParams[key].OpenFile then
    Result := GetOpenFileName(
      DlgParams[key].Title, DlgParams[key].DefaultExt, DlgParams[key].Filter, FileName, DlgParams[key].DialogKey, []
      )
  else
    Result := GetSaveFileName(
      DlgParams[key].Title, DlgParams[key].DefaultExt, DlgParams[key].Filter, FileName, DlgParams[key].DialogKey, []
      );
end;

function BrowseCallbackProc(hwnd: HWND; uMsg: UINT; lParam: LPARAM; lpData: LPARAM): Integer; stdcall;
begin
  if (uMsg = BFFM_INITIALIZED) then
    SendMessage(hwnd, BFFM_SETSELECTION, 1, lpData);
  BrowseCallbackProc := 0;
end;

function GetFolderName(Handle: Integer; Caption: string; var strFolder: string): Boolean;
var
  BrowseInfo: TBrowseInfo;
  lpItemID: PItemIDList;

  DisplayName: array [0 .. MAX_PATH] of Char;
  TempPath : array[0..MAX_PATH] of Char;
begin
  //
  // TODO DONE -oNickR -cUsability : восстановить InitialDir
  //

  Result := False;

  FillChar(BrowseInfo, SizeOf(TBrowseInfo), #0);

  if 0 <> Handle then
    BrowseInfo.hwndOwner := Handle
  else
    BrowseInfo.hwndOwner := Application.Handle;

  BrowseInfo.pszDisplayName := @DisplayName;
  BrowseInfo.lpszTitle := PChar(Caption);
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS or BIF_USENEWUI;
  BrowseInfo.lpfn := @BrowseCallbackProc;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if Assigned(lpItemId) then
  begin
    Result := SHGetPathFromIDList(lpItemID, TempPath);
    if Result then
    begin
      strFolder := StrPas(TempPath);
      //
      // TODO DONE -oNickR -cUsability : сохранить InitialDir
      //
    end;
    CoTaskMemFree(lpItemID);
  end;
end;

function CreateImageFromResource(GraphicClass: TGraphicClass; const ResName: string; ResType: PChar): TGraphic;
var
  s: TResourceStream;
begin
  s := TResourceStream.Create(HInstance, ResName, ResType);
  try
    Result := GraphicClass.Create;
    Result.LoadFromStream(s);
  finally
    s.Free;
  end;
end;

end.



