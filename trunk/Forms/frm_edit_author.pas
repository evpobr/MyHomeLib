
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}


unit frm_edit_author;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton, RzRadChk, ExtCtrls, RzPanel;

type
  TfrmEditAuthor = class(TForm)
    RzGroupBox1: TRzGroupBox;
    btnSave: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    edFamily: TRzEdit;
    Label1: TLabel;
    edName: TRzEdit;
    Label2: TLabel;
    edMiddle: TRzEdit;
    Label3: TLabel;
    gbAddNew: TRzGroupBox;
    cbAddNew: TRzCheckBox;
    cbSaveLinks: TRzCheckBox;
    procedure FormShow(Sender: TObject);
  private
    function GetAddNewState: boolean;
    function GetSaveLinks: boolean;
    procedure SetShowCheckBoxes(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    property ShowCheckBoxes: boolean write SetShowCheckBoxes default False;
    property AddNew: boolean read GetAddNewState;
    property SaveLinks: boolean read GetSaveLinks;

  end;

var
  frmEditAuthor: TfrmEditAuthor;

implementation

{$R *.dfm}

{ TfrmEditAuthor }

procedure TfrmEditAuthor.FormShow(Sender: TObject);
begin
  ActiveControl := edFamily;
end;

function TfrmEditAuthor.GetAddNewState: boolean;
begin
  Result := cbAddNew.Checked;
end;

function TfrmEditAuthor.GetSaveLinks: boolean;
begin
  Result := cbSaveLinks.Checked;
end;

procedure TfrmEditAuthor.SetShowCheckBoxes(const Value: boolean);
begin
  gbAddNew.Visible := Value;
end;

end.
