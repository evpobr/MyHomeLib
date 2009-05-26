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
  Controls,
  Forms,
  Dialogs,
  Windows,
  dm_user;
  
procedure SyncOnLineFiles;
procedure SyncFolders;
function LibrusecUpdate: boolean;

implementation

uses
  unit_Helpers,
  unit_SyncOnLineThread,
  frm_SyncOnLineProgressForm,
  unit_SyncFoldersThread,
  frm_ImportProgressFormEx,
  unit_libupdateThread;

procedure SyncOnLineFiles;
var
  worker: TSyncOnLineThread;
  frmProgress: TSyncOnLineProgressForm;
begin
  worker := TSyncOnLineThread.Create;
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
  Worker := TLibUpdateThread.Create;
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


end.
