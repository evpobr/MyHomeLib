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
  Dialogs,
  UserData;

procedure SyncOnLineFiles;

procedure SyncFolders;

function LibrusecUpdate(OnImportUserData: TOnImportUserDataEvent): Boolean;

procedure ShowPopup(const Msg: string);
procedure HidePopup;

procedure LocateBook;

implementation

uses
  Controls,
  Forms,
  unit_SyncOnLineThread,
  frm_SyncOnLineProgressForm,
  unit_SyncFoldersThread,
  frm_ImportProgressFormEx,
  unit_libupdateThread,
  frm_info_popup,
  frm_search,
  frm_main,
  unit_SystemDatabase;

resourcestring
  rstrUpdateCollections = 'Обновление коллекций';

procedure SyncOnLineFiles;
var
  worker: TSyncOnLineThread;
  frmProgress: TSyncOnLineProgressForm;
begin
  worker := TSyncOnLineThread.Create;
  try
    worker.CollectionID := GetSystemData.ActiveCollectionInfo.ID;
    worker.CollectionRoot := GetSystemData.ActiveCollectionInfo.RootPath;

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

function LibrusecUpdate(OnImportUserData: TOnImportUserDataEvent): boolean;
var
  worker : TLibUpdateThread;
  ProgressForm : TImportProgressFormEx;
begin
  worker := TLibUpdateThread.Create(OnImportUserData);
  try
    ProgressForm := TImportProgressFormEx.Create(Application);
    ProgressForm.Caption := rstrUpdateCollections;
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
  SearchForm: TfrmBookSearch;
begin
  SearchForm := TfrmBookSearch.Create(Application);
  SearchForm.OnLocateBook := frmMain.LocateBook;
  try
    SearchForm.ShowModal;
  finally
    SearchForm.Free;
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
