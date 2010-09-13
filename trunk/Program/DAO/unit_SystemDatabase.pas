unit unit_SystemDatabase;

{.$DEFINE USE_SQLITE}

interface

uses
  unit_SystemDatabase_Abstract,
  unit_SystemDatabase_ABS,
  unit_SystemDatabase_SQLite;

  procedure CreateSystemTables(const DBUserFile: string);
  function GetSystemData: TSystemData;

implementation

uses
  Windows,
  SysUtils,
  unit_Settings;

var
  SystemData: TSystemData;
  SystemDataLock: TRTLCriticalSection;

procedure CreateSystemTables(const DBUserFile: string);
begin
{$IFDEF USE_SQLITE}
  CreateSystemTables_SQLite(DBUserFile);
{$ELSE}
  CreateSystemTables_ABS(DBUserFile);
{$ENDIF}
end;

function GetSystemData: TSystemData;
begin
  if not Assigned(SystemData) then
  begin
    EnterCriticalSection(SystemDataLock);
    if not Assigned(SystemData) then
    begin
{$IFDEF USE_SQLITE}
      SystemData := TSystemData_SQLite.Create(Settings.SystemFileName[sfSystemDB]);
{$ELSE}
      SystemData := TSystemData_ABS.Create(Settings.SystemFileName[sfSystemDB]);
{$ENDIF}
    end;
    LeaveCriticalSection(SystemDataLock);
  end;

  Result := SystemData;
end;


initialization
  SystemData := nil; // do not load to support first-time App start-up without system data
  InitializeCriticalSection(SystemDataLock);

finalization
  FreeAndNil(SystemData);
  DeleteCriticalSection(SystemDataLock);
end.

