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
  Dialogs, Buttons, StdCtrls, ExtCtrls, unit_StaticTip, RzButton;

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

uses frm_settings;
{$R *.dfm}

procedure TfrmCreateMask.FormShow(Sender: TObject);
begin
  edTemplate.SetFocus;
end;

procedure TfrmCreateMask.SaveMask(Sender: TObject);
const mask_elements: array[1..8] of string = ('f', 't', 's', 'n', 'id', 'g', 'fl', 'rg');
type TElement = record
                  name: string;
                  BegBlock, EndBlock: integer;
                end;
var stack: array[0..10] of TElement;
    Elements: array[1..10] of TElement;
    Template: string;
    h, k, i, j, StackPos, ElementPos: integer;
    bol, TemplEnd: boolean;
begin
  TemplEnd:= false;
  k:= 1;
  while not(TemplEnd) do
  begin
    i:= 1;
    Template:= '';

    while (not(edTemplate.Text[k] in ['/', '\'])) and (k <= Length(edTemplate.Text)) do
    begin
      Template:= Template + edTemplate.Text[k];
      inc(k);
    end;
    inc(k);
    if k > Length(edTemplate.Text) then TemplEnd:= true;

    StackPos:= 0;
    ElementPos:= 0;
    while i <= Length(Template) do
    begin
      if Template[i] = '[' then
      begin
        inc(StackPos);
        Stack[StackPos].BegBlock:= i;
        Stack[StackPos].name:= '';
      end;

      if Template[i] = '%' then
      begin
        if (Stack[StackPos].name <> '') and (StackPos > 0) then
        begin
          ShowMessage('Проверьте правильность шаблона');
          exit;
        end;

        inc(i);
        Stack[StackPos].name:= '';
        while CharInSet(Template[i], ['a'..'z', 'A'..'Z']) do
        begin
          Stack[StackPos].name:= Stack[StackPos].name + Template[i];
          inc(i);
        end;
        dec(i);

        if StackPos <= 0 then
        begin
          inc(ElementPos);
          Elements[ElementPos].name:= Stack[StackPos].name;
          Elements[ElementPos].BegBlock:= 0;
          Elements[ElementPos].EndBlock:= 0;
        end;
      end;

      if Template[i]=']' then
      begin
        if (Stack[StackPos].name = '') or (StackPos <= 0) then
        begin
          ShowMessage('Проверьте соответствие открывающих и закрывающих скобок блоков элемнтов');
          exit;
        end;

        Stack[StackPos].EndBlock:= i;

        inc(ElementPos);
        Elements[ElementPos].name:= Stack[StackPos].name;
        Elements[ElementPos].BegBlock:= Stack[StackPos].BegBlock;
        Elements[ElementPos].EndBlock:= Stack[StackPos].EndBlock;

        dec(StackPos);
      end;

      inc(i);
    end;

    for h := 1 to ElementPos do
    begin
      bol:= false;
      for j := 1 to High(mask_elements) do
        if Elements[h].name = mask_elements[j] then
          bol:= true;

      if not(bol) then
        break;
    end;

    if StackPos > 0 then
    begin
      ShowMessage('Проверьте соответствие открывающих и закрывающих скобок блоков элемнтов');
      exit;
    end;
    if not(bol) then
    begin
      ShowMessage('Неверные элементы шаблона');
      exit;
    end;

    inc(i);
  end;

  ModalResult:= mrOk;
end;

end.
