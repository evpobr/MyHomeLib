(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             12.02.2010
  * Description
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_Messages;

interface

uses
  Windows,
  Messages;

const
  WM_MHL_BASE = WM_APP + $0500;

  WM_MHL_CHANGELOCALSTATUS = WM_MHL_BASE + 0;

type
  PBookLocalStatus = ^TBookLocalStatus;
  TBookLocalStatus = record
    BookID: Integer;
    DatabaseID: Integer;
    LocalStatus: Boolean;
  end;

  TLocalStatusChangedMessage = packed record
    Msg: Cardinal;
    Unused: WPARAM;
    Params: PBookLocalStatus;
    Result: Longint;
  end;

procedure BookLocalStatusChanged(
  BookID: Integer;
  DatabaseID: Integer;
  LocalStatus: Boolean
);

implementation

uses
  Forms;

procedure BookLocalStatusChanged(
  BookID: Integer;
  DatabaseID: Integer;
  LocalStatus: Boolean
);
var
  Param: PBookLocalStatus;
begin
  New(Param);
  Param^.BookID := BookID;
  Param^.DatabaseID := DatabaseID;
  Param^.LocalStatus := LocalStatus;

  PostMessage(
    Application.MainFormHandle,
    WM_MHL_CHANGELOCALSTATUS,
    0,
    LPARAM(Param)
  );
end;

end.
