{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit unit_Utils;

interface

uses
  Windows,
  Dialogs;

procedure SyncOnLineFiles;

procedure SyncFolders;

function LibrusecUpdate: Boolean;

procedure ShowPopup(const Msg: string);
procedure HidePopup;

procedure LocateBook;

implementation

uses
  Controls,
  Forms,
  dm_user,
  unit_SyncOnLineThread,
  frm_SyncOnLineProgressForm,
  unit_SyncFoldersThread,
  frm_ImportProgressFormEx,
  unit_libupdateThread,
  frm_info_popup,
  frm_search;

procedure SyncOnLineFiles;
var
  worker: TSyncOnLineThread;
  frmProgress: TSyncOnLineProgressForm;
begin
  worker := TSyncOnLineThread.Create;
  try
    worker.CollectionID := DMUser.ActiveCollection.ID;
    worker.CollectionRoot := DMUser.ActiveCollection.RootPath;

    frmProgress := TSyncOnLineProgressForm.Create(Application);
    try
      frmProgress.WorkerThread := worker;
      frmProgress.ShowModal;
    finally
      frmProgress.Free;
    end;
  finally
    worker.Free;
  end;
end;

procedure SyncFolders;
var
  worker: TSyncFoldersThread;
  frmProgress: TSyncOnLineProgressForm;
begin
  worker := TSyncFoldersThread.Create;
  try
    frmProgress := TSyncOnLineProgressForm.Create(Application);
    try
      frmProgress.WorkerThread := worker;
      frmProgress.ShowModal;
    finally
      frmProgress.Free;
    end;
  finally
    worker.Free;
  end;
end;

function LibrusecUpdate: boolean;
var
  worker : TLibUpdateThread;
  ProgressForm : TImportProgressFormEx;
begin
  worker := TLibUpdateThread.Create;
  try
    ProgressForm := TImportProgressFormEx.Create(Application);
    ProgressForm.Caption := 'Обновление коллекций';
    ProgressForm.CloseOnTimer := True;
    try
      ProgressForm.WorkerThread := worker;
      ProgressForm.ShowModal;
      Result := worker.Updated;
    finally
      ProgressForm.Free;
    end;
  finally
    worker.Free;
  end;
end;

procedure LocateBook;
var
  Worker : TSearchThread;
begin
  Worker := TSearchThread.Create(true);
  try
    Worker.SearchForm := TfrmBookSearch.Create(Application);
    try
      Worker.OnChange := Worker.SearchForm.edText.OnChange;
      Worker.OnKeyDown := Worker.SearchForm.edText.OnKeyDown;
      Worker.SearchForm.ShowModal;
    finally
      Worker.SearchForm.Free;
    end;
  finally
    Worker.Free;
  end;
end;

procedure ShowPopup(const Msg: string);
begin
  frmInfoPopup := TfrmInfoPopup.Create(Nil);
  frmInfoPopup.lblText.Caption := Msg;
  frmInfoPopup.Refresh;
  frmInfoPopup.Show;
end;

procedure HidePopup;
begin
  if frmInfoPopup <> Nil then
  begin
    frmInfoPopup.Hide;
    frmInfoPopup.Free;
  end;
end;



end.
