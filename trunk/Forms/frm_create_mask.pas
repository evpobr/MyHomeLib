(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Version 0.9
  * 20.08.2008
  * Copyright (c) Aleksey Penkov    alex.penkov@gmail.com
  *               Nick Rymanov      nrymanov@gmail.com
  *               Matvienko Sergei  matv84@mail.ru
  ****************************************************************************** *)

unit frm_create_mask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, unit_StaticTip;

type
  TFMask = (MFolder, MFile);

  TfrmCreateMask = class(TForm)
    edTemplate: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    pnButtons: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    stDescription: TMHLStaticTip;
    Label3: TLabel;
    procedure SaveMask(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FMask: TFMask;
  public
    { Public declarations }
    property FoderMask: TFMask read FMask write FMask;
  end;

var
  frmCreateMask: TfrmCreateMask;

implementation

uses frm_settings, unit_Templater;
{$R *.dfm}

procedure TfrmCreateMask.FormShow(Sender: TObject);
begin
  edTemplate.SetFocus;
end;

procedure TfrmCreateMask.SaveMask(Sender: TObject);
var
  Templater: TTemplater;
begin
  Templater := TTemplater.Create;
  case Templater.ValidateTemplate(edTemplate.Text) of
    ErFine:
      ModalResult := mrOk;
    ErTemplate:
      ShowMessage('Проверьте правильность шаблона');
    ErBlocks:
      ShowMessage(
        'Проверьте соответствие открывающих и закрывающих скобок блоков элемнтов');
    ErElements:
      ShowMessage('Неверные элементы шаблона');
  end;
  Templater.Free;
end;

end.
