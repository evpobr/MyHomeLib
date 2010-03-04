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
    procedure edTextChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FBusy: boolean;

  public
    { Public declarations }
  end;

  TChangeEvent = procedure (Sender: TObject) of object;
  TKeyDownEvent = procedure (Sender: TObject; var Key: Word;  Shift: TShiftState) of object;

  TSearchThread = class(TThread)
    FSearchForm :  TfrmBookSearch;
  private
    FOnChange: TChangeEvent;
    FOnKeyDown: TKeyDownEvent;

  protected
    procedure Execute; override;
  public
    property OnChange: TChangeEvent read FOnChange write FOnChange;
    property OnKeyDown: TKeyDownEvent read FOnKeyDown write FOnKeyDown;
    property SearchForm: TfrmBookSearch read FSearchForm write FSearchForm ;
  end;

implementation

uses frm_Main;

{$R *.dfm}

procedure TfrmBookSearch.edTextChange(Sender: TObject);
begin
  if not FBusy then
  begin
    FBusy := True;
    frmMain.LocateBook(edText.Text, False);
    FBusy := False;
  end;
end;

procedure TfrmBookSearch.edTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RIGHT) and not FBusy then
  begin
    FBusy := True;
    frmMain.LocateBook(edText.Text, True);
    FBusy := False;
  end;
end;

procedure TfrmBookSearch.FormCreate(Sender: TObject);
begin
  FBusy := False;
end;

procedure TfrmBookSearch.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_ESCAPE) then Close;
end;

procedure TSearchThread.Execute;
begin
  // здесь пусто
end;


end.
