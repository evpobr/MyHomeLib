{******************************************************************************}
{                                                                              }
{                       Package MyHomeLib Components                           }
{                                                                              }
{                                Version 1                                     }
{                                                                              }
{         Copyright (c) 2008, 2009 Nyck Rymanov,Aleksey Penkov                 }
{                        alex.penkov@gmail.com                                 }
{******************************************************************************}

unit files_list;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes;

type
  TOnDirectoryEvent = procedure(Sender: TObject; const Dir: string) of object;
  TOnFileEvent = procedure(Sender: TObject; const F: TSearchRec) of object;

type
  TFilesList = class(TComponent)
  private
    FTargetPath: string;
    FLastDir: string;

    FOnDirectory: TOnDirectoryEvent;
    FOnFile: TOnFileEvent;

    procedure SetTargetPath(const S: string);

    procedure Recurs(const S: string; Level: Integer);
  public
    procedure Process;
  published
    property TargetPath: string read FTargetPath write SetTargetPath;
    property LastDir: string read FLastDir;

    property OnDirectory: TOnDirectoryEvent read FOnDirectory write FOnDirectory;
    property OnFile: TOnFileEvent read FOnFile write FOnFile;
  end;

implementation

procedure TFilesList.SetTargetPath(const S: string);
begin
  FTargetPath := IncludeTrailingPathDelimiter(S);
end;

procedure TFilesList.Process;
begin
  Recurs(FTargetPath, 0);
end;

procedure TFilesList.Recurs(const S: string; Level: Integer);
var
  F: TSearchRec;
begin
  if Level > 512 then
    Exit;

  if Assigned(FOnDirectory) then
    FOnDirectory(Self, S);

  if FindFirst(S + '*.*', faAnyFile, F) = 0 then
  begin
    repeat
      FLastDir := S;
      if Assigned(FOnFile) then
        FOnFile(Self, F);

      if (F.Attr and faDirectory = faDirectory) and (F.Name <> '.') and (F.Name <> '..') then
        Recurs(IncludeTrailingPathDelimiter(S + F.Name), Level + 1);
    until FindNext(F) <> 0;

    FindClose(F);
  end;
end;

end.
