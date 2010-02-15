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
  Messages;

const
  WM_MHL_BASE = WM_APP + $0500;

  WM_MHL_DOWNLOAD_COMPLETE = WM_MHL_BASE + 0;

type
  TDownloadCompleteMessage = packed record
    Msg: Cardinal;
    BookID: Integer;
    Downloaded: Longbool;
    Result: Longint;
  end;

implementation

end.
