(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov  alex.penkov@gmail.com
  *         Nick Rymanov    nrymanov@gmail.com
  ****************************************************************************** *)

unit frm_editor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmEditor = class(TForm)
    mmMemo: TMemo;
    RzGroupBox4: TPanel;
    btnLike: TButton;
    btnNotEq: TButton;
    btnBraket: TButton;
    btnGreat: TButton;
    btnLess: TButton;
    btnAnd: TButton;
    btnOr: TButton;
    btnNot: TButton;
    btnCommas: TButton;
    pnButtons: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnLikeClick(Sender: TObject);

  private
    procedure SetText(const Value: string);
    function GetText: string;

  public
    property Text: string read GetText write SetText;
  end;

var
  frmEditor: TfrmEditor;

implementation

{$R *.dfm}

procedure TfrmEditor.btnLikeClick(Sender: TObject);
var
  p: integer;
  AddText: string;
  Offset: integer;
begin
  p := mmMemo.SelStart;

  if Sender = btnLike then
  begin
    AddText := 'LIKE "%%"';
    Offset := p + 7;
  end
  {
  else if Sender = btnEq then
  begin
    AddText := '=""';
    Offset := p + 2;
  end
  }
  else if Sender = btnNotEq then
  begin
    AddText := '<> ""';
    Offset := p + 4;
  end
  else if Sender = btnLess then
  begin
    AddText := '<""';
    Offset := p + 2;
  end
  else if Sender = btnGreat then
  begin
    AddText := '>""';
    Offset := p + 2;
  end
  else if Sender = btnBraket then
  begin
    AddText := '("")';
    Offset := p + 2;
  end
  else if Sender = btnAnd then
  begin
    AddText := ' AND ';
    Offset := p + 5;
  end
  else if Sender = btnOr then
  begin
    AddText := ' OR ';
    Offset := p + 4;
  end
  else if Sender = btnNot then
  begin
    AddText := ' NOT ';
    Offset := p + 5;
  end
  else if Sender = btnCommas then
  begin
    AddText := '""';
    Offset := p + 1;
  end;
  mmMemo.SelText := AddText;
  mmMemo.SelStart := Offset;
  mmMemo.SelLength := 0;
  mmMemo.SetFocus;
end;

function TfrmEditor.GetText: string;
begin
  Result := mmMemo.Lines.Text;
end;

procedure TfrmEditor.SetText(const Value: string);
begin
  mmMemo.Lines.Text := Value;
end;

end.
