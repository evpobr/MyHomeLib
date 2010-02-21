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

unit unit_Export;

interface

procedure Export2XML;
procedure Export2INPX;

implementation

uses Forms,
unit_ExportXMLThread,
unit_ExportINPXThread,
unit_Helpers,
frm_ExportProgressForm;

procedure Export2XML;
var
  xmlFileName: string;
  worker: TExport2XMLThread;
  frmProgress: TExportProgressForm;
begin
  if not GetFileName(fnSaveImportFile, xmlFileName) then
    Exit;

  worker := TExport2XMLThread.Create;
  try
    worker.XMLFileName := xmlFileName;
    frmProgress := TExportProgressForm.Create(Application);
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

procedure Export2INPX;
var
  xmlFileName: string;
  worker: TExport2INPXThread;
  frmProgress: TExportProgressForm;
begin
  if not GetFileName(fnSaveINPX, xmlFileName) then
    Exit;

  worker := TExport2INPXThread.Create;
  try
    worker.INPXFileName := xmlFileName;
    frmProgress := TExportProgressForm.Create(Application);
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

