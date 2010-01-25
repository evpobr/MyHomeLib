
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}


unit frm_edit_reader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton, RzBtnEdt, ExtCtrls,
  RzPanel;

type
  TfrmEditReader = class(TForm)
    btnSave: TRzBitBtn;
    btnCancel: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    edExt: TRzEdit;
    Label1: TLabel;
    edPath: TRzButtonEdit;
    Label2: TLabel;
    procedure edPathButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    function GetExtension: string;
    function GetPath: string;
    procedure SetExtension(const Value: string);
    procedure SetPath(const Value: string);
  public
    property Extension: string read GetExtension write SetExtension;
    property Path: string read GetPath write SetPath;
  end;

var
  frmEditReader: TfrmEditReader;

implementation

uses unit_Helpers;

{$R *.dfm}

procedure TfrmEditReader.edPathButtonClick(Sender: TObject);
var
  AFileName: string;
begin
  if GetFileName(fnSelectReader, AFileName) then
    edPath.Text := AFileName;
end;

function TfrmEditReader.GetExtension: string;
begin
  Result := AnsiLowerCase(Trim(edExt.Text));
end;

function TfrmEditReader.GetPath: string;
begin
  Result := Trim(edPath.Text);
end;

procedure TfrmEditReader.SetExtension(const Value: string);
begin
  edExt.Text := Value;
end;

procedure TfrmEditReader.SetPath(const Value: string);
begin
  edPath.Text := Value;
end;

procedure TfrmEditReader.btnSaveClick(Sender: TObject);
begin
  if Extension = '' then
    MessageDlg('Тип файла не указан!', mtError, [mbOk], 0)
  else
    ModalResult := mrOk;
end;

end.
