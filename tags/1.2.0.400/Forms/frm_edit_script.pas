unit frm_edit_script;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzBtnEdt, StdCtrls, Mask, RzEdit, ExtCtrls, RzPanel;

type
  TfrmEditScript = class(TForm)
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edTitle: TRzEdit;
    edPath: TRzButtonEdit;
    btnSave: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    edParams: TRzEdit;
    Label3: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure edPathButtonClick(Sender: TObject);
  private
    procedure SetParams(const Value: string);
    procedure SetPath(const Value: string);
    procedure SetTitle(const Value: string);
    function GetParams: string;
    function GetPath: string;
    function GetTitle: string;
    { Private declarations }
  public
    property Title: string read GetTitle write SetTitle;
    property Path: string read GetPath write SetPath;
    property Params: string read GetParams write SetParams;
  end;

var
  frmEditScript: TfrmEditScript;

implementation

uses unit_Helpers;

{$R *.dfm}

procedure TfrmEditScript.edPathButtonClick(Sender: TObject);
var
  AFileName: string;
begin
  if GetFileName(fnSelectScript, AFileName) then
    edPath.Text := AFileName;
end;

function TfrmEditScript.GetParams: string;
begin
  Result := Trim(edParams.Text);
end;

function TfrmEditScript.GetPath: string;
begin
  Result := Trim(edPath.Text);
end;

function TfrmEditScript.GetTitle: string;
begin
  Result := Trim(edTitle.Text);
end;

procedure TfrmEditScript.SetParams(const Value: string);
begin
  edParams.Text := Value;
end;

procedure TfrmEditScript.SetPath(const Value: string);
begin
  edPath.Text := Value;
end;

procedure TfrmEditScript.SetTitle(const Value: string);
begin
  edTitle.Text := Value;
end;

procedure TfrmEditScript.btnSaveClick(Sender: TObject);
begin
  if (Title = '') or (Path = '') then
    MessageDlg('”кажите название и путь!', mtError, [mbOk], 0)
  else
    ModalResult := mrOk;
end;

end.
