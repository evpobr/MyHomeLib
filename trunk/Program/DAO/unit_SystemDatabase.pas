unit unit_SystemDatabase;

interface

uses
  unit_SystemDatabase_Abstract,
  unit_SystemDatabase_ABS;

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
  // So far, there is only an ABS implementation for the system DB connection (GetSystemData)
  CreateSystemTables_ABS(DBUserFile);
end;

function GetSystemData: TSystemData;
begin
  if not Assigned(SystemData) then
  begin
    EnterCriticalSection(SystemDataLock);
    if not Assigned(SystemData) then
      SystemData := TSystemData_ABS.Create(Settings.SystemFileName[sfSystemDB]);
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

