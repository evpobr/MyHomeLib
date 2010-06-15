
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}


unit frm_about;

interface

uses
  Windows,
  Classes,
  Controls,
  Forms,
  StdCtrls,
  ExtCtrls,
  unit_MHLHelpers,
  MHLSimplePanel,
  MHLLinkLabel;

type
  TfrmAbout = class(TForm)
    RzPanel1: TMHLSimplePanel;
    RzURLLabel1: TMHLLinkLabel;
    RzBitBtn1: TButton;
    versionInfoLabel: TLabel;
    RzLabel1: TLabel;
    RzLabel2: TLabel;
    RzLabel3: TLabel;
    RzLabel4: TLabel;
    RzLabel5: TLabel;
    RzLabel6: TLabel;
    RzLabel7: TLabel;
    RzLabel8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure RzURLLabel1LinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses
  SysUtils,
  ShellAPI;

resourcestring
  rstrAppVersionInfo = 'Версия: %s';

{$R *.dfm}

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  versionInfoLabel.Caption := Format(rstrAppVersionInfo, [unit_MHLHelpers.GetFileVersion(Application.ExeName)]);
end;

procedure TfrmAbout.RzURLLabel1LinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
begin
  ShellExecute(
    Handle,
    'open',
    PChar(Link),
    nil,
    nil,
    SW_SHOW
  );
end;

end.
