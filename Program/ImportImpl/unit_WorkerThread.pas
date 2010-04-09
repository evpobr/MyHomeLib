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

unit unit_WorkerThread;

interface

uses
  Classes,
  Windows,
  SysUtils;

type
  TTeletypeSeverity = (tsInfo, tsWarning, tsError);

  TOpenProgressEvent = procedure of object;
  TProgressEvent = procedure (Percent: Integer) of object;
  TCloseProgressEvent = procedure of object;
  TTeletypeEvent = procedure (const Msg: string; Severity: TTeletypeSeverity) of object;
  TSetCommentEvent = procedure (const Msg: string) of object;
  TShowMessageEvent = function (const Text: string; Flags: Longint = MB_OK): Integer of object;

  TWorker = class(TThread)
  private
    FFinished: Boolean;
    FCancel: Boolean;

    FPercent: Integer;
    FComment: string;
    FSeverity: TTeletypeSeverity;
    FTeletypeMessage: string;

    FMessageText: string;
    FMessageFlags: Integer;
    FMessageResult: Integer;

  private
    FOnProgress: TProgressEvent;
    FOnOpenProgress: TOpenProgressEvent;
    FOnCloseProgress: TCloseProgressEvent;
    FOnTeletype: TTeletypeEvent;
    FOnSetComment: TSetCommentEvent;
    FOnShowMessage: TShowMessageEvent; 

    procedure DoOpenProgress;
    procedure DoSetProgress;
    procedure DoCloseProgress;
    procedure DoTeletype;
    procedure DoSetComment;
    procedure DoShowMessage;

  protected
    const ProcessedItemThreshold = 100;

  protected
    procedure OpenProgress;
    procedure SetProgress(APercent: integer);
    procedure CloseProgress;
    procedure Teletype(const Msg: string; Severity: TTeletypeSeverity = tsInfo);
    procedure SetComment(const Comment: string);
    function ShowMessage(const Text: string; Flags: Longint {= MB_OK}): Integer;

    procedure Execute; override;
    procedure WorkFunction; virtual; abstract;

  public
    constructor Create;
    procedure Cancel;

  public
    property OnOpenProgress: TOpenProgressEvent read FOnOpenProgress write FOnOpenProgress;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
    property OnCloseProgress: TCloseProgressEvent read FOnCloseProgress write FOnCloseProgress;
    property OnTeletype: TTeletypeEvent read FOnTeletype write FOnTeletype;
    property OnSetComment: TSetCommentEvent read FOnSetComment write FOnSetComment;
    property OnShowMessage: TShowMessageEvent read FOnShowMessage write FOnShowMessage;

    property Canceled: Boolean read FCancel write FCancel;
    property Finished: Boolean read FFinished;
  end;

implementation

uses
  ActiveX;

// ============================================================================
constructor TWorker.Create;
begin
  inherited Create(True);

  FFinished := False;
  FCancel := False;
  FPercent := 0;

  FMessageFlags := 0;
  FMessageResult := 0;
end;

// ============================================================================
procedure TWorker.DoOpenProgress;
begin
  if Assigned(FOnOpenProgress) then
    FOnOpenProgress;
end;

procedure TWorker.OpenProgress;
begin
  FFinished := False;
  FPercent := 0;
  Synchronize(DoOpenProgress);
  Synchronize(DoSetProgress);
end;

// ============================================================================
procedure TWorker.DoSetProgress;
begin
  if Assigned(FOnProgress) then
    FOnProgress(FPercent);
end;

procedure TWorker.SetProgress(APercent: integer);
begin
  if FPercent <> APercent then
  begin
    FPercent := APercent;
    Synchronize(DoSetProgress);
  end;
end;

// ============================================================================
procedure TWorker.DoTeletype;
begin
  if Assigned(FOnTeletype) then
    FOnTeletype(FTeletypeMessage, FSeverity);
end;

procedure TWorker.Teletype(const Msg: string; Severity: TTeletypeSeverity);
begin
  FTeletypeMessage := Msg;
  FSeverity := Severity;
  Synchronize(DoTeletype);
end;

// ============================================================================
procedure TWorker.DoCloseProgress;
begin
  if Assigned(FOnCloseProgress) then
    FOnCloseProgress;
end;

procedure TWorker.CloseProgress;
begin
  FPercent := 100;
  FFinished := True;
  Synchronize(DoSetProgress);
  Synchronize(DoCloseProgress);
end;

// ============================================================================
procedure TWorker.DoSetComment;
begin
  if Assigned(FOnSetComment) then
    FOnSetComment(FComment);
end;

procedure TWorker.SetComment(const Comment: string);
begin
  FComment := Comment;
  Synchronize(DoSetComment);
end;

// ============================================================================
procedure TWorker.DoShowMessage;
begin
  if Assigned(FOnShowMessage) then
    FMessageResult := FOnShowMessage(FMessageText, FMessageFlags)
  else
    FMessageResult := 0;
end;

function TWorker.ShowMessage(const Text: string; Flags: Longint {= MB_OK}): Integer;
begin
  FMessageText := Text;
  FMessageFlags := Flags;
  FMessageResult := 0;
  Synchronize(DoShowMessage);
  Result := FMessageResult;
end;

// ============================================================================
procedure TWorker.Cancel;
begin
  FCancel := True;
end;

// ============================================================================
procedure TWorker.Execute;
begin
  CoInitializeEx(nil, COINIT_MULTITHREADED or COINIT_APARTMENTTHREADED);
  try
    OpenProgress;
    try
      WorkFunction;
    finally
      CloseProgress;
    end;
  finally
    CoUninitialize;
  end;
end;

end.

