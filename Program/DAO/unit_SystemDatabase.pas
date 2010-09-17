(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors             eg
  * Created             12.09.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)
unit unit_SystemDatabase;

interface

uses
  unit_Interfaces,
  unit_SystemDatabase_SQLite;

  procedure CreateSystemTables(const DBUserFile: string);

  function CreateSystemData(ADefaultSession: Boolean = True): ISystemData;
  function GetSystemData: ISystemData;

implementation

uses
  Windows,
  SysUtils,
  unit_Settings;

var
  g_SystemData: ISystemData;
  g_SystemDataLock: TRTLCriticalSection;

procedure CreateSystemTables(const DBUserFile: string);
begin
  CreateSystemTables_SQLite(DBUserFile);
end;

function CreateSystemData(ADefaultSession: Boolean = True): ISystemData;
begin
  Result := TSystemData_SQLite.Create(Settings.SystemFileName[sfSystemDB]);
end;

function GetSystemData: ISystemData;
begin
  if not Assigned(g_SystemData) then
  begin
    EnterCriticalSection(g_SystemDataLock);
    if not Assigned(g_SystemData) then
      g_SystemData := CreateSystemData;
    LeaveCriticalSection(g_SystemDataLock);
  end;

  Result := g_SystemData;
end;


initialization
  g_SystemData := nil; // do not load to support first-time App start-up without system data
  InitializeCriticalSection(g_SystemDataLock);

finalization
  g_SystemData := nil;
  DeleteCriticalSection(g_SystemDataLock);
end.

