unit frm_editor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, ExtCtrls, RzPanel;

type
  TfrmEditor = class(TForm)
    mmMemo: TMemo;
    RzBitBtn1: TRzBitBtn;
    RzGroupBox4: TRzGroupBox;
    btnInsertFilterTemplate: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzToolButton6: TRzToolButton;
    RzToolButton5: TRzToolButton;
    RzToolButton4: TRzToolButton;
    RzToolButton7: TRzToolButton;
    RzToolButton8: TRzToolButton;
    RzToolButton9: TRzToolButton;
    RzToolButton1: TRzToolButton;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure btnInsertFilterTemplateClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetText(Value: string);
    function GetText:string;

  public
    { Public declarations }
    property Text:string read GetText write SetText;

  end;

var
  frmEditor: TfrmEditor;

implementation

{$R *.dfm}

procedure TfrmEditor.btnInsertFilterTemplateClick(Sender: TObject);
var
   OldText: string;
   p: integer;
   AddText: string;
   Offset : integer;
begin
  OldText := mmMemo.Lines.Text;

  p := mmMemo.SelStart;

  case (Sender as TrzToolButton).Tag of
      50: begin
            AddText := 'LIKE "%%"';
            OffSet  := P + 7;
          end;
      51: begin
            AddText := '=""';
            OffSet  := P + 2;
          end;
      52: begin
            AddText := '<> ""';
            OffSet  := P + 4;
          end;
      53: begin
            AddText := '<""';
            OffSet  := P + 2;
          end;
      54: begin
            AddText := '>""';
            OffSet  := P + 2;
          end;
      55: begin
            AddText := '("")';
            OffSet  := P + 2;
          end;
      56: begin
            AddText := ' AND ';
            OffSet  := P + 5;
          end;
      57: begin
            AddText := ' OR ';
            OffSet  := P + 4;
          end;
       58: begin
            AddText := ' NOT ';
            OffSet  := P + 5;
          end;
       59: begin
            AddText := '""';
            OffSet  := P + 1;
          end;
    end;
  Insert(AddText + ' ',OldText, P + 1);

  mmMemo.Lines.Text := OldText;
  mmMemo.SelStart := Offset;
  mmMemo.SelLength := 0;
end;

function TfrmEditor.GetText: string;
begin
  Result := mmMemo.Lines.Text;
end;

procedure TfrmEditor.RzBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditor.SetText(Value: string);
begin
  mmMemo.Lines.Text := Value;
end;

end.
