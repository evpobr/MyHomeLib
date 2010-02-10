(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
  *         Matvienko Sergei matv84@mail.ru
  *
  ****************************************************************************** *)

unit frm_create_mask;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Buttons,
  StdCtrls,
  ExtCtrls,
  unit_StaticTip,
  unit_Templater;

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

  private
    FTemplater: TTemplater;

    FTemplateType: TTemplateType;
    procedure SetTemplateType(const Value: TTemplateType);

    function GetTemplate: string;
    procedure SetTemplate(const Value: string);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property TemplateType: TTemplateType read FTemplateType write SetTemplateType;
    property Template: string read GetTemplate write SetTemplate;
  end;

function EditTemplate(ATemplateType: TTemplateType; var ATemplate: string): Boolean;

var
  frmCreateMask: TfrmCreateMask;

implementation

{$R *.dfm}

resourcestring
  rstrFileTemplateCaption = 'Редактирование шаблона: Имя файла';
  rstrPathTemplateCaption = 'Редактирование шаблона: Путь к файлу';
  rstrTextTemplateCaption = 'Редактирование шаблона: Текст';

const
  DlgCaptions: array [TTemplateType] of string = (rstrFileTemplateCaption, rstrPathTemplateCaption, rstrTextTemplateCaption);

function EditTemplate(ATemplateType: TTemplateType; var ATemplate: string): Boolean;
var
  frmCreateMask: TfrmCreateMask;
begin
  frmCreateMask := TfrmCreateMask.Create(Application);
  try
    frmCreateMask.TemplateType := ATemplateType;
    frmCreateMask.Template := ATemplate;
    Result := (mrOk = frmCreateMask.ShowModal);

    if Result then
      ATemplate := frmCreateMask.Template;
  finally
    frmCreateMask.Free;
  end;
end;

constructor TfrmCreateMask.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTemplater := TTemplater.Create;
end;

destructor TfrmCreateMask.Destroy;
begin
  FTemplater.Free;
  inherited Destroy;
end;

function TfrmCreateMask.GetTemplate: string;
begin
  Result := edTemplate.Text;
end;

procedure TfrmCreateMask.SetTemplate(const Value: string);
begin
  edTemplate.Text := Value;
end;

procedure TfrmCreateMask.SetTemplateType(const Value: TTemplateType);
begin
  FTemplateType := Value;
  Caption := DlgCaptions[FTemplateType];
end;

procedure TfrmCreateMask.SaveMask(Sender: TObject);
var
  Valid: TErrorType;
begin
  Valid := FTemplater.ValidateTemplate(Template, TemplateType);

  { TODO -cUsability -oNickR : использовать стандартную функцию для показа сообщения об ошибке }
  case Valid of
    ErFine:
      ModalResult := mrOk;
    ErTemplate:
      ShowMessage('Проверьте правильность шаблона');
    ErBlocks:
      ShowMessage('Проверьте соответствие открывающих и закрывающих скобок блоков элемнтов');
    ErElements:
      ShowMessage('Неверные элементы шаблона');
  end;
end;

end.
