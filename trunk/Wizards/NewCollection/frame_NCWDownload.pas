unit frame_NCWDownload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frame_InteriorPageBase, StdCtrls, ExtCtrls, ComCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, RzPrgres;

type
  TframeNCWDownload = class(TInteriorPageBase)
    HTTP: TIdHTTP;
    lblS1: TLabel;
    Bar: TRzProgressBar;



    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  private
    { Private declarations }
    FDownloadSize : Extended;
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
  DateUtils,
  unit_Settings,
  unit_NCWParams,
  frm_NCWizard;
{$R *.dfm}

{ TframeNCWDownload }

function TframeNCWDownload.Activate(LoadData: Boolean): Boolean;
begin
  lblS1.Caption := 'Подключение ...';
  Bar.Percent := 0;
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
    FTerminated := False;
    Responce := TMemoryStream.Create;
    HTTP.Get(FPParams^.INPXUrl, Responce);
    if not FTerminated then
    begin
      Responce.SaveToFile(FPParams^.INPXFile);
      FPParams^.Operation := otInpx;
      Sleep(2000);
    end;
  finally
    Responce.Free;
  end;
end;

procedure TframeNCWDownload.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  ElapsedTime: Cardinal;
  KB : extended;
begin
  KB := AWorkCount / 1024;

  if FDownloadSize <> 0 then
    Bar.Percent:= round(KB / FDownloadSize * 100);

  ElapsedTime := SecondsBetween(Now, FStartDate);
  if ElapsedTime > 0 then
  begin
    lblS1.Caption := Format('Загружено  %d  из  %d кб (%n кб/с)', [round(KB), round(FDownloadSize), KB / ElapsedTime]);
  end;
  Application.ProcessMessages;
end;

procedure TframeNCWDownload.HTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  Bar.Percent := 0;
  FDownloadSize := AWorkCountMax / 1024;
  FStartDate := Now;
end;

procedure TframeNCWDownload.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  lblS1.Caption := 'Загрузка завершена'
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
