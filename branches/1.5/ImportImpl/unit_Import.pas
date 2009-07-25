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

unit unit_Import;

interface

uses
  Controls,
  Forms,
  Dialogs,
  Windows,
  XMLIntf,
  XMLDoc,
  dm_user;
  
procedure ImportXML(
  ACollection: TMHLCollection
  );

procedure ImportFB2(
  ACollection: TMHLCollection
  );

procedure ImportFB2ZIP(
  ACollection: TMHLCollection
  );

implementation

uses
  unit_MHL_xml,
  unit_ImportXMLThread,
  frm_ImportProgressForm,
  unit_ImportFB2Thread,
  frm_ImportProgressFormEx,
  unit_ImportFB2ZIPThread,
  unit_Helpers;

procedure ImportXML(
  ACollection: TMHLCollection
  );
var
  strFileName: string;
  worker: TImportXMLThread;
  frmProgress: TImportProgressForm;
begin
  if not GetFileName(fnOpenImportFile, strFileName) then
    Exit;

  worker := TImportXMLThread.Create;
  try
    worker.XMLFileName := strFileName;
    worker.DBFileName := ACollection.DBFileName;
    worker.CollectionName := ACollection.Name;
    worker.CollectionType := Ord(ACollection.CollectionType);

    frmProgress := TImportProgressForm.Create(Application);
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

procedure ImportFB2(
  ACollection: TMHLCollection
  );
var
  worker: TImportFB2Thread;
  frmProgress: TImportProgressFormEx;
begin
  worker := TImportFB2Thread.Create;
  try
    worker.DBFileName := ACollection.DBFileName;
    frmProgress := TImportProgressFormEx.Create(Application);
    try
      frmProgress.WorkerThread := worker;
      frmProgress.btnSaveLog.Visible := True;
      frmProgress.ShowModal;
    finally
      frmProgress.Free;
    end;
  finally
    worker.Free;
  end;
end;

procedure ImportFB2ZIP(
  ACollection: TMHLCollection
  );
var
  worker: TImportFB2ZIPThread;
  frmProgress: TImportProgressFormEx;
begin
  worker := TImportFB2ZIPThread.Create;
  try
    worker.DBFileName := ACollection.DBFileName;
    frmProgress := TImportProgressFormEx.Create(Application);
    try
      frmProgress.WorkerThread := worker;
      frmProgress.btnSaveLog.Visible := True;
      frmProgress.ShowModal;
    finally
      frmProgress.Free;
    end;
  finally
    worker.Free;
  end;
end;

end.

