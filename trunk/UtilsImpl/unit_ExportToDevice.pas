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
  unit_ExportToDeviceThread,
  ABSMain,
  globals;

procedure ExportToDevice(
  ATable: TAbsTable;
  IdList: TBookIdList;
  Mode: TExportMode;
  out ProcessedFiles:string
  );

procedure DownloadBooks(
 ATable: TAbsTable;
  var IdList: TBookIdList
  );


implementation

uses
  unit_Helpers,
  frm_ExportToDeviceProgressForm, frm_main, unit_DownloadBooksThread,
  frm_DownloadProgressForm;

procedure ExportToDevice(
  ATable: TAbsTable;
  IdList: TBookIdList;
  Mode: TExportMode;
  out ProcessedFiles:string
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
    frmProgress.Caption := 'Отправка на устройство';
    try
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
    frmProgress.Caption := 'Скачивание книг';
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


end.

