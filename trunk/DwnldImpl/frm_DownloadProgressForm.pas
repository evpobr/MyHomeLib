unit frm_DownloadProgressForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_BaseProgressForm, StdCtrls, Buttons,ComCtrls,
  unit_WorkerThread, unit_DownloadBooksThread;

type
  TDownloadProgressForm = class(TProgressFormBase)
    lblCurrent: TLabel;
    pbCurrent: TProgressBar;
    pbTotal: TProgressBar;
    lblTotal: TLabel;
    btnCancel: TBitBtn;



    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FStopping: boolean;
    FWorker: TDownloadBooksThread;
    procedure StartWorker;override;
    procedure CancelWorker;
  protected
    procedure OpenProgress; override;
    procedure ShowTeletype(const Msg: string; Severity: TTeletypeSeverity); override;
  public
    procedure ShowProgress(Current, Total: Integer);
    procedure SetComment(const Current, Total: string);
    destructor Destroy; override;
    property WorkerThread: TDownloadBooksThread read FWorker write FWorker;
  end;


var
  DownloadProgressForm: TDownloadProgressForm;

implementation


{$R *.dfm}

{ TDownloadProgressForm }

procedure TDownloadProgressForm.btnCancelClick(Sender: TObject);
begin
  CancelWorker;
end;

procedure TDownloadProgressForm.OpenProgress;
begin
  pbCurrent.Position := 0;
  pbTotal.Position := 0;
end;

procedure TDownloadProgressForm.SetComment(const Current, Total: string);
begin
  if Total <> '' then lblTotal.Caption := Total;
  if Current <> '' then lblCurrent.Caption := Current;
  lblTotal.Refresh;
  lblCurrent.Refresh;
end;

procedure TDownloadProgressForm.ShowTeletype(const Msg: string;
  Severity: TTeletypeSeverity);
begin
  // ничего не делаем
end;

procedure TDownloadProgressForm.ShowProgress(Current, Total: Integer);
begin
  if Current > 0 then pbCurrent.Position := Current;
  if Total >0 then pbTotal.Position := Total;
end;

procedure TDownloadProgressForm.StartWorker;
begin
  Assert(Assigned(FWorker));

  if not Assigned(FWorker) then
    Exit;

  FWorker.OnOpenProgress := OpenProgress;
  FWorker.OnProgress := ShowProgress;
  FWorker.OnCloseProgress := CloseProgress;
  FWorker.OnTeletype := ShowTeletype;
  FWorker.OnSetComment := SetComment;
  FWorker.OnShowMessage := ShowMessage;

  FWorker.Resume;
end;

destructor TDownloadProgressForm.Destroy;
begin
  if Assigned(FWorker) then
  begin
    Assert(FWorker.Finished);
    FWorker.WaitFor;
  end;
  inherited Destroy;
end;

procedure TDownloadProgressForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not FWorker.Finished then
  begin
    CancelWorker;
    CanClose := False;
  end;
end;

procedure TDownloadProgressForm.FormShow(Sender: TObject);
begin
  FStopping := False;
  StartWorker;
end;

procedure TDownloadProgressForm.CancelWorker;
begin
  Assert(Assigned(FWorker));

  if FWorker.Finished then
    Exit;

  if not FStopping then
    if ShowMessage('Вы действительно хотите прервать операцию?', MB_OKCANCEL or MB_ICONEXCLAMATION) = IDCANCEL then
      Exit
    else
      FStopping := True;
  FWorker.Cancel;
end;

end.
