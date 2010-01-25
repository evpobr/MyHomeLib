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
