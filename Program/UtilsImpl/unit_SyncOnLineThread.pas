(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  * Created             20.08.2008
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_SyncOnLineThread;

interface

uses
  Windows,
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_CollectionWorkerThread;

type
  TSyncOnLineThread = class(TCollectionWorker)
  protected
    procedure WorkFunction; override;
  end;

implementation

uses
  IOUtils,
  unit_Consts,
  unit_Globals,
  unit_Settings,
  unit_MHL_strings,
  unit_Messages,
  unit_Interfaces;

{ TImportXMLThread }

procedure TSyncOnLineThread.WorkFunction;
var
  FCollectionRoot: string;
  BookIterator: IBookIterator;

  BookFile: string;

  IsLocal: Boolean;
  BookRecord: TBookRecord;
begin
  Assert(Assigned(FSystemData));
  Assert(Assigned(FCollection));
  FCollectionRoot := FCollection.GetProperty(PROP_ROOTFOLDER);
  BookIterator := FCollection.GetBookIterator(bmAll, True);

  FProgressEngine.BeginOperation(BookIterator.RecordCount, rstrBookProcessedMsg1, rstrBookProcessedMsg2);
  try
    while BookIterator.Next(BookRecord) do
    begin
      if Canceled then
        Exit;

      try
        //
        //  Проверяем был ли файл закачан ранее и ставим отметку в базу
        //
        BookFile := BookRecord.GetBookFileName;
        IsLocal := TFile.Exists(BookFile);

        if Settings.DeleteDeleted and IsLocal and (bpIsDeleted in BookRecord.BookProps) then
        begin
          TFile.Delete(BookFile);
          IsLocal := False;
        end;

        if (bpIsLocal in BookRecord.BookProps) <> IsLocal then
        begin
          FCollection.SetLocal(BookRecord.BookKey, IsLocal);
          unit_Messages.BookLocalStatusChanged(BookRecord.BookKey, IsLocal);
        end;
      except
        on E: Exception do
          Teletype(e.Message, tsError);
      end;

      FProgressEngine.AddProgress;
    end;
  finally
    FProgressEngine.EndOperation;
  end;
end;

end.

