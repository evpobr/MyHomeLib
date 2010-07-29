(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov    nrymanov@gmail.com
  *                     Aleksey Penkov  alex.penkov@gmail.com
  * Created             22.02.2010
  * Description         
  *
  * $Id$
  *
  * History
  * NickR 02.03.2010    Код переформатирован
  * NickR 08.04.2010    Убраны ненужные зависимости
  *
  ****************************************************************************** *)

unit unit_Export;

interface

procedure Export2XML(const FileName: string);
procedure Export2INPX(const FileName: string);

implementation

uses
  Forms,
  unit_ExportXMLThread,
  unit_ExportINPXThread,
  frm_ExportProgressForm;

procedure Export2XML(const FileName: string);
var
  worker: TExport2XMLThread;
  frmProgress: TExportProgressForm;
begin
  worker := TExport2XMLThread.Create;
  try
    worker.XMLFileName := FileName;
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

procedure Export2INPX(const FileName: string);
var
  worker: TExport2INPXThread;
  frmProgress: TExportProgressForm;
begin
  worker := TExport2INPXThread.Create;
  try
    worker.INPXFileName := FileName;
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

