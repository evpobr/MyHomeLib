unit frm_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, ExtCtrls, RzPanel;

type
  TfrmBookSearch = class(TForm)
    RzPanel1: TRzPanel;
    edText: TRzEdit;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edTextKeyPress(Sender: TObject; var Key: Char);
    procedure edTextChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TKeyPressEvent = procedure (Sender: TObject) of object;

  TSearchThread = class(TThread)
    FSearchForm :  TfrmBookSearch;

    FKey : char;

    procedure DoSearch;

  private
    { Private declarations }
    FOnKeyPress: TKeyPressEvent;
    procedure KeyPress(Sender: TObject);

  protected
    procedure Execute; override;
  public
    property OnKeyPress: TKeyPressEvent read FOnKeyPress write FOnKeyPress;
    property SearchForm: TfrmBookSearch read FSearchForm write FSearchForm ;
  end;

implementation

uses frm_Main;

{$R *.dfm}

procedure TfrmBookSearch.edTextChange(Sender: TObject);
begin
  frmMain.LocateBook(edText.Text);
end;

procedure TfrmBookSearch.edTextKeyPress(Sender: TObject; var Key: Char);
begin
  frmMain.LocateBook(edText.Text);
end;

procedure TfrmBookSearch.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_ESCAPE) then Close;
end;

procedure TSearchThread.DoSearch;
begin
  if Assigned(FOnkeyPress) then
    FOnKeyPress(FSearchForm.edText);
end;

procedure TSearchThread.Execute;
begin

end;

procedure TSearchThread.KeyPress(Sender: TObject);
begin
  Synchronize(DoSearch);
end;

end.
