(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             22.02.2010
  * Description
  * Author(s)           Nick Rymanov    nrymanov@gmail.com
  *                     Aleksey Penkov  alex.penkov@gmail.com
  *
  * History
  * NickR 02.03.2010    Код переформатирован
  * NickR 08.04.2010    Убраны ненужные зависимости
  *
  ****************************************************************************** *)

unit unit_Import;

interface

uses
  dm_user;
  
procedure ImportXML(
  ACollection: TMHLActiveCollection;
  const FileName: string
  );

procedure ImportFB2(
  ACollection: TMHLActiveCollection
  );

procedure ImportFB2ZIP(
  ACollection: TMHLActiveCollection
  );

procedure ImportFBD(
  ACollection: TMHLActiveCollection
  );

implementation

uses
  Forms,
  unit_ImportXMLThread,
  unit_ImportFB2Thread,
  unit_ImportFB2ZIPThread,
  unit_ImportFBDThread,
  frm_ImportProgressForm,
  frm_ImportProgressFormEx,
  unit_Consts;

procedure ImportXML(
  ACollection: TMHLActiveCollection;
  const FileName: string
  );
var
  worker: TImportXMLThread;
  frmProgress: TImportProgressForm;
begin
  worker := TImportXMLThread.Create;
  try
    worker.XMLFileName := FileName;
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
  ACollection: TMHLActiveCollection
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
  ACollection: TMHLActiveCollection
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

procedure ImportFBD(
  ACollection: TMHLActiveCollection
  );
var
  worker: TImportFBDThread;
  frmProgress: TImportProgressFormEx;
begin
  worker := TImportFBDThread.Create;
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

