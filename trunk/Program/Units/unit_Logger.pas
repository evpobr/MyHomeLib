(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  * Created             31.08.2010
  * Description         Базовая поддержка записи сообщений в лог-файл
  *
  * $Id: unit_Consts.pas 657 2010-08-29 02:07:36Z eg_ $
  *
  * History
  *
  ****************************************************************************** *)

unit unit_Logger;

interface

uses
  unit_Interfaces;

function GetLogger: ILogger;
function GetIntervalLogger(const intervalName: string; const extraInfo: string): IIntervalLogger;

implementation

uses
  Windows,
  SysUtils,
  IOUtils,
  TimeSpan,
  //DateUtils,
  Diagnostics,
  Forms,
  unit_Consts;

type
  TGlobalLogger = class
  private
    class constructor Create;
    class destructor Destroy;

    class procedure Log(const logMessage: string; const extraInfo: string = ''); overload;
    class procedure Log(const logMessage: string; const extraInfo: string; Elapsed: TTimeSpan); overload;

  private
    class var
      FLogFileName: string;
      FLogFile: THandle;
  end;

  TLoggerImpl = class(TInterfacedObject, ILogger)
  private
    //
    // ILogger
    //
    procedure Log(const logMessage: string; const extraInfo: string);
  end;

  TIntervalLoggerImpl = class(TLoggerImpl, IIntervalLogger)
  private
    constructor Create(const intervalName: string; const extraInfo: string);
    destructor Destroy; override;

  private
    FIntervalName: string;
    FExtraInfo: string;
    FStopwatch: TStopwatch;
  end;

{ TGlobalLogger }

class constructor TGlobalLogger.Create;
begin
  FLogFileName := TPath.ChangeExtension(Application.ExeName, 'log');

  FLogFile := Integer(CreateFile(
    PChar(FLogFileName),
    GENERIC_WRITE,
    FILE_SHARE_READ,
    nil,
    CREATE_ALWAYS,
    FILE_ATTRIBUTE_NORMAL,
    FILE_FLAG_WRITE_THROUGH
  ));
end;

class destructor TGlobalLogger.Destroy;
begin
  CloseHandle(FLogFile);
end;

class procedure TGlobalLogger.Log(const logMessage, extraInfo: string);
begin
  Log(logMessage, extraInfo, TTimeSpan.Zero);
end;

class procedure TGlobalLogger.Log(const logMessage, extraInfo: string; Elapsed: TTimeSpan);
var
  logString: AnsiString;
  bytesWritten: Longword;
begin
  logString := Format('%s; %s; %s; %s' + CRLF,
    [
      FormatDateTime('c', Now),
      Format('%.2d:%.2d:%.2d:%.3d', [Elapsed.Hours, Elapsed.Minutes, Elapsed.Seconds, Elapsed.Milliseconds]),
      Trim(logMessage),
      Trim(extraInfo)
    ]);

  WriteFile(FLogFile, PAnsiChar(logString)^, Length(logString), bytesWritten, nil);
end;

{ TLoggerImpl }

procedure TLoggerImpl.Log(const logMessage, extraInfo: string);
begin
  TGlobalLogger.Log(logMessage, extraInfo);
end;

{ TIntervalLoggerImpl }

constructor TIntervalLoggerImpl.Create(const intervalName: string; const extraInfo: string);
begin
  inherited Create;
  FIntervalName := intervalName;
  FExtraInfo := extraInfo;
  FStopwatch := TStopwatch.StartNew;
end;

destructor TIntervalLoggerImpl.Destroy;
begin
  FStopwatch.Stop;
  TGlobalLogger.Log(FIntervalName, FExtraInfo, FStopwatch.Elapsed);
  inherited;
end;

function GetLogger: ILogger;
begin
  Result := TLoggerImpl.Create;
end;

function GetIntervalLogger(const intervalName: string; const extraInfo: string): IIntervalLogger;
begin
  Result := TIntervalLoggerImpl.Create(intervalName, extraInfo);
end;

end.
