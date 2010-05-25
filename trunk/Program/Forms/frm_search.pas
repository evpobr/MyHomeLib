unit frm_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, MHLSimplePanel;

type
  TfrmBookSearch = class(TForm)
    RzPanel1: TMHLSimplePanel;
    Label1: TLabel;
    edText: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edTextChange(Sender: TObject);
    procedure edTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    FBusy: boolean;

  public

  end;

implementation

uses
  frm_Main;

{$R *.dfm}

procedure TfrmBookSearch.FormCreate(Sender: TObject);
begin
  FBusy := False;
end;

procedure TfrmBookSearch.edTextChange(Sender: TObject);
begin
  if not FBusy then
  begin
    FBusy := True;
    try
      frmMain.LocateBook(edText.Text, False);
    finally
      FBusy := False;
    end;
  end;
end;

procedure TfrmBookSearch.edTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RIGHT) and not FBusy then
  begin
    FBusy := True;
    try
      frmMain.LocateBook(edText.Text, True);
    finally
      FBusy := False;
    end;
  end;
end;

procedure TfrmBookSearch.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_ESCAPE) then
    Close;
end;

end.
