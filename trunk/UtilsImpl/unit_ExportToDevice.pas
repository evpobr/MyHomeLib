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

unit unit_ExportToDevice;

interface

uses
  Controls,
  Forms,
  Dialogs,
  Windows,
  dm_user,
  ABSMain,
  unit_Globals;

procedure ExportToDevice(
  ATable: TAbsTable;
  const IdList: TBookIdList;
  Mode: TExportMode;
  out ProcessedFiles:string
  );

procedure DownloadBooks(
  ATable: TAbsTable;
  var IdList: TBookIdList
  );

implementation

uses
  unit_ExportToDeviceThread,
  frm_ExportToDeviceProgressForm,
  unit_DownloadBooksThread,
  frm_DownloadProgressForm;

procedure ExportToDevice(
  ATable: TAbsTable;
  const IdList: TBookIdList;
  Mode: TExportMode;
  out ProcessedFiles: string
  );
var
  worker: TExportToDeviceThread;
  frmProgress: TExportToDeviceProgressForm;
begin
  worker := TExportToDeviceThread.Create;
  try
    worker.BookIdList := IdList;
    worker.Table := ATable;
    worker.ExportMode := Mode;
    frmProgress := TExportToDeviceProgressForm.Create(Application);
    try
      frmProgress.Caption := 'Отправка на устройство';
      frmProgress.WorkerThread := worker;
      frmProgress.ShowModal;
      ProcessedFiles := Worker.ProcessedFiles;
    finally
      frmProgress.Free;
    end;
  finally
    worker.Free;
  end;
end;

procedure DownloadBooks(
  ATable: TAbsTable;
  var IdList: TBookIdList
  );
var
  worker: TDownloadBooksThread;
  frmProgress: TDownloadProgressForm;
begin
  worker := TDownloadBooksThread.Create;
  try
    worker.BookIdList := IdList;
    frmProgress := TDownloadProgressForm.Create(Application);
    try
      frmProgress.Caption := 'Скачивание книг';
      frmProgress.WorkerThread := worker;
      frmProgress.ShowModal;
    finally
      frmProgress.Free;
    end;
  finally
    worker.Free;
  end;
end;


end.

