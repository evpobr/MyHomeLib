
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}


unit PrevInst;

interface

uses
  Windows,
  Forms,
  StrUtils,
  SysUtils;

function FirstHinstanceRunning(RunMode: Integer = 0): boolean;

implementation

function FirstHinstanceRunning(RunMode: Integer = 0): boolean;
const
  MemFileSize = 127;

var
  MemHnd: HWND;
  MemFileName: string;
  lpBaseAddress: ^HWND;
  FirstAppHandle: HWND;

begin
  Result := False;
  MemFileName := Application.ExeName;
  case RunMode of
    0:
      MemFileName := AnsiReplaceText(MemFileName, '\', '/');
    1:
      MemFileName := ExtractFileName(MemFileName);
  else
    Exit;
  end;
  //если FileMapping есть - то происходит OpenFileMapping
  MemHnd := CreateFileMapping(HWND($FFFFFFFF), nil,
    PAGE_READWRITE, 0, MemFileSize, PChar(MemFileName));
  if GetLastError <> ERROR_ALREADY_EXISTS then
  begin
    if MemHnd <> 0 then
    begin
      lpBaseAddress := MapViewOfFile(MemHnd, FILE_MAP_WRITE, 0, 0, 0);
      if lpBaseAddress <> nil then
        lpBaseAddress^ := Application.Handle;
    end;
  end
  else
  begin
    //    MemFileHnd := OpenFileMapping(FILE_MAP_READ, False, PChar(MemFileName));
    Result := True;
    if MemHnd <> 0 then
    begin
      lpBaseAddress := MapViewOfFile(MemHnd, FILE_MAP_READ, 0, 0, 0);
      if lpBaseAddress <> nil then
      begin
        FirstAppHandle := lpBaseAddress^;
        ShowWindow(FirstAppHandle, SW_restore);
        SetForegroundWindow(FirstAppHandle);
      end;
    end;
  end;
  if lpBaseAddress <> nil then
    UnMapViewOfFile(lpBaseAddress);
end;

end.
