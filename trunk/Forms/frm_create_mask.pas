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
  Dialogs, Buttons, StdCtrls, ExtCtrls, unit_StaticTip, unit_Templater;

type
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
  public
    { Public declarations }
    TemplateType: TTemplateType;
  end;

function EditTemplate(Template: string; ATemplType: TTemplateType): string;

var
  frmCreateMask: TfrmCreateMask;

implementation

uses frm_settings;
{$R *.dfm}

function EditTemplate(Template: string; ATemplType: TTemplateType): string;
begin
  frmCreateMask := TfrmCreateMask.Create(nil);
  with frmCreateMask do
  begin
    try
      TemplateType := ATemplType;
      edTemplate.Text := Template;

      ShowModal;

      if frmCreateMask.ModalResult = mrOk then
        Result := edTemplate.Text
      else Result := Template;
    except
      Free;
    end;
  end;
end;

procedure TfrmCreateMask.FormShow(Sender: TObject);
begin
  Caption := 'Редактирование шаблона: ';
  case TemplateType of
    TpFile:
      Caption := Caption + 'Имя файла';
    TpPath:
      Caption := Caption + 'Путь к файлу';
    TpText:
      Caption := Caption + 'Текст';
  end;
  edTemplate.SetFocus;
end;

procedure TfrmCreateMask.SaveMask(Sender: TObject);
var
  Templater: TTemplater;
  Valid: TErrorType;
begin
  Templater := TTemplater.Create;
  case TemplateType of
    TpFile:
      Valid := Templater.ValidateTemplate(edTemplate.Text, TpFile);
    TpPath:
      Valid := Templater.ValidateTemplate(edTemplate.Text, TpPath);
  else
    Valid := Templater.ValidateTemplate(edTemplate.Text, TpText);
  end;
  case Valid of
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
