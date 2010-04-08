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

{ TODO -oNickR -cBug : использовать настройки прокси при закачке файла. Сейчас они устанавливаются в коде самого визарда. }

unit frame_NCWDownload;

interface

uses
  Windows,
  Messages,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  frame_InteriorPageBase,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP;

type
  TframeNCWDownload = class(TInteriorPageBase)
    HTTP: TIdHTTP;
    lblStatus: TLabel;
    Bar: TProgressBar;

    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);

  private
    FDownloadSize : Int64;
    FStartDate : TDateTime;
    FTerminated: Boolean;

  public
    function Activate(LoadData: Boolean): Boolean; override;
    function Deactivate(CheckData: Boolean): Boolean; override;

    procedure Stop;
    procedure Download;
  end;

var
  frameNCWDownload: TframeNCWDownload;

implementation

uses
  SysUtils,
  DateUtils,
  unit_NCWParams,
  frm_NCWizard;

{$R *.dfm}

{ TframeNCWDownload }

function TframeNCWDownload.Activate(LoadData: Boolean): Boolean;
begin
  lblStatus.Caption := 'Подключение ...';
  Bar.Position := 0;

  Result := True;
end;

function TframeNCWDownload.Deactivate(CheckData: Boolean): Boolean;
begin
  Result := True;
end;

procedure TframeNCWDownload.Download;
var
  Responce: TMemoryStream;
begin
  FTerminated := False;
  Responce := TMemoryStream.Create;
  try
    HTTP.Get(FPParams^.INPXUrl, Responce);
    if not FTerminated then
    begin
      Responce.SaveToFile(FPParams^.INPXFile);
      FPParams^.Operation := otInpx;
    end;
  finally
    Responce.Free;
  end;
end;

procedure TframeNCWDownload.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  Bar.Position := 0;
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
end;

procedure TframeNCWDownload.HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
var
  ElapsedTime: Cardinal;
  KB : Int64;
begin
  KB := AWorkCount div 1024;

  if FDownloadSize <> 0 then
    Bar.Position := AWorkCount * 100 div FDownloadSize;

  ElapsedTime := SecondsBetween(Now, FStartDate);
  if ElapsedTime > 0 then
  begin
    { TODO -oNickR -cRefactoring : создать и использовать во всех подобных местах FormatSize функцию }
    lblStatus.Caption := Format(
      'Загружено %d из %d кб (%n кб/с)',
      [KB, FDownloadSize div 1024, KB / ElapsedTime]
    );
  end;
  Application.ProcessMessages;
end;

procedure TframeNCWDownload.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  lblStatus.Caption := 'Загрузка завершена';
  Application.ProcessMessages;
end;

procedure TframeNCWDownload.Stop;
begin
  try
    FTerminated := True;
    HTTP.Disconnect;
  except
    //
  end;
end;

end.
