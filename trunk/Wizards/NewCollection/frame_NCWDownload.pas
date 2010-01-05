unit frame_NCWDownload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frame_InteriorPageBase, StdCtrls, ExtCtrls, ComCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TframeNCWDownload = class(TInteriorPageBase)
    Bar: TProgressBar;
    HTTP: TIdHTTP;
    lblS1: TLabel;
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
  private
    { Private declarations }
    FDownloadSize : Integer;
    FStartDate : TDateTime;
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
  DateUtils,
  unit_Settings,
  unit_NCWParams,
  frm_NCWizard;
{$R *.dfm}

{ TframeNCWDownload }

function TframeNCWDownload.Activate(LoadData: Boolean): Boolean;
begin
  lblS1.Caption := 'Подключение ...';
  Bar.Position := 0;
end;

function TframeNCWDownload.Deactivate(CheckData: Boolean): Boolean;
begin
  //--------------------------------
end;

procedure TframeNCWDownload.Download;
var
  Responce: TMemoryStream;
begin
  try
    Responce := TMemoryStream.Create;
    HTTP.Get(FPParams^.INPXUrl, Responce);
    Responce.SaveToFile(FPParams^.INPXFile);
    FPParams^.Operation := otInpx;
  finally
    Responce.Free;
  end;
end;

procedure TframeNCWDownload.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  ElapsedTime: Cardinal;
  Speed: string;
begin
  if FDownloadSize <> 0 then
    Bar.Position := AWorkCount * 100 div FDownloadSize;

  ElapsedTime := SecondsBetween(Now, FStartDate);
  if ElapsedTime > 0 then
  begin
    Speed := FormatFloat('0.00', AWorkCount / 1024 / ElapsedTime);
    lblS1.Caption := Format('Загрузка: %s Kb/s', [Speed]);
  end;
  Application.ProcessMessages;
end;

procedure TframeNCWDownload.HTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  Bar.Position := 0;
  FDownloadSize := AWorkCountMax;
  FStartDate := Now;
end;

procedure TframeNCWDownload.Stop;
begin
  try
    HTTP.Disconnect;
  except
    //
  end;
end;

end.
