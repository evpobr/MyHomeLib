(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Version 0.9
  * 20.08.2008
  * Copyright (c) Aleksey Penkov  alex.penkov@gmail.com
  *               Nick Rymanov    nrymanov@gmail.com
  ****************************************************************************** *)

unit frm_create_mask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, unit_StaticTip;

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
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreateMask: TfrmCreateMask;

implementation

uses frm_settings;
{$R *.dfm}

procedure TfrmCreateMask.RzBitBtn1Click(Sender: TObject);
const
  mask_elements: array [1 .. 4] of string = ('f', 's', 'n', 't');
type
  TElement = record
    name: string;
    BegBlock, EndBlock: integer;
  end;
var
  stack: array [1 .. 10] of TElement;
  Elements: array [1 .. 10] of TElement;
  Template: string;
  i, j, StackPos, ElementPos: integer;
  bol: boolean;
begin
  Template := edTemplate.Text;
  StackPos := 0;
  ElementPos := 0;
  i := 1;
  while i <= Length(Template) do
  begin
    if Template[i] = '[' then
    begin
      inc(StackPos);
      stack[StackPos].BegBlock := i;
      stack[StackPos].name := '';
    end;

    if Template[i] = '%' then
    begin
      if (stack[StackPos].name <> '') and (StackPos > 0) then
      begin
        // TODO -oNickR -cRefactoring : использовать общую функцию для пока сообщения об ошибке
        ShowMessage('Проверьте правильность шаблона');
        exit;
      end;

      inc(i);
      stack[StackPos].name := '';
      while CharInSet(Template[i], ['a' .. 'z', 'A' .. 'Z']) do
      begin
        stack[StackPos].name := stack[StackPos].name + Template[i];
        inc(i);
      end;

      if StackPos <= 0 then
      begin
        inc(ElementPos);
        Elements[ElementPos].name := stack[StackPos].name;
        Elements[ElementPos].BegBlock := 0;
        Elements[ElementPos].EndBlock := 0;
      end;
    end;

    if Template[i] = ']' then
    begin
      if (stack[StackPos].name = '') or (StackPos <= 0) then
      begin
        // TODO -oNickR -cRefactoring : использовать общую функцию для пока сообщения об ошибке
        ShowMessage('Проверьте правильность шаблона');
        exit;
      end;

      stack[StackPos].EndBlock := i;

      inc(ElementPos);
      Elements[ElementPos].name := stack[StackPos].name;
      Elements[ElementPos].BegBlock := stack[StackPos].BegBlock;
      Elements[ElementPos].EndBlock := stack[StackPos].EndBlock;

      dec(StackPos);
    end;

    inc(i);
  end;

  for i := 1 to ElementPos do
  begin
    bol := false;
    for j := 1 to High(mask_elements) do
      if Elements[i].name = mask_elements[j] then
        bol := true;

    if not(bol) then
      break;
  end;

  if not(bol) then
  begin
    // TODO -oNickR -cRefactoring : использовать общую функцию для пока сообщения об ошибке
    ShowMessage('Неверные элементы шаблона');
    exit;
  end;

  ModalResult := mrOk;
end;

end.
