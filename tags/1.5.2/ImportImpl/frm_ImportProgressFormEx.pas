{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit frm_ImportProgressFormEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unit_WorkerThread, frm_ImportProgressForm, StdCtrls, ComCtrls,
  ExtCtrls;

type
  TImportProgressFormEx = class(TImportProgressForm)
    errorLog: TListView;
    btnSaveLog: TButton;
    Timer: TTimer;



    procedure FormCreate(Sender: TObject);
    procedure btnSaveLogClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    FErrors: TStringList;
    FCloseOnTimer: boolean;

    procedure DoCloseForm(Sender: TObject);
  protected
    procedure ShowTeletype(const Msg: string; Severity: TTeletypeSeverity); override;
    procedure CloseProgress; override;
  public
    property CloseOnTimer:boolean read FCloseOnTimer write FCloseOnTimer;
  end;

var
  ImportProgressFormEx: TImportProgressFormEx;

implementation

uses 
  dm_user,
  unit_Helpers;

{$R *.dfm}

{ TImportProgressForm1 }

procedure TImportProgressFormEx.btnSaveLogClick(Sender: TObject);
var
  AFileName: string;
begin
  if GetFileName(fnSaveLog, AFileName) then
  try
    FErrors.SaveToFile(AFileName, TEncoding.Unicode);
  except
    on e: EFileStreamError do
    begin
      Application.MessageBox(
        PChar(e.Message),
        PChar(Application.Title),
        MB_OK or MB_ICONERROR
        );
    end;
  end;
end;

procedure TImportProgressFormEx.DoCloseForm(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TImportProgressFormEx.CloseProgress;
begin
  if FErrors.Count <> 0 then
    btnSaveLog.Visible := True;
  btnCancel.OnClick := DoCloseForm;
  btnCancel.Caption := '�������';
  Timer.Enabled := FCloseOnTimer;
end;

procedure TImportProgressFormEx.FormCreate(Sender: TObject);
begin
  inherited;
  FErrors := TStringList.Create;
  errorLog.ShowColumnHeaders := False;
  errorLog.Clear;
  FCloseOnTimer := False;
end;

procedure TImportProgressFormEx.FormDestroy(Sender: TObject);
begin
  FErrors.Free;
  inherited;
end;

procedure TImportProgressFormEx.ShowTeletype(const Msg: string; Severity: TTeletypeSeverity);
var
  item: TListItem;
begin
  item := errorLog.Items.Add;

  case Severity of
    tsInfo: item.ImageIndex := 0;
    tsWarning: item.ImageIndex := 1;
    tsError: item.ImageIndex := 2;
  end;
  item.SubItems.Add(Msg);

  if Severity = tsError then
    FErrors.Add(Msg);
  errorLog.Perform(WM_KEYDOWN,VK_DOWN,0);
end;

procedure TImportProgressFormEx.TimerTimer(Sender: TObject);
begin
  Close;
end;

end.

