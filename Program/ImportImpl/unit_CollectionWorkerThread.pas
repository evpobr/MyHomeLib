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

unit unit_CollectionWorkerThread;

interface

uses
  unit_WorkerThread,
  unit_Interfaces;

type
  TCollectionWorker = class(TWorker)
  protected
    FCollectionID: Integer;

  protected
    FSystemData: ISystemData;
    FCollection: IBookCollection;

  public
    constructor Create(const CollectionID: Integer);
    destructor Destroy; override;
  end;

implementation

uses
  unit_SystemDatabase;

{ TCollectionWorker }

constructor TCollectionWorker.Create(const CollectionID: Integer);
begin
  inherited Create;

  FCollectionID := CollectionID;
  FSystemData := CreateSystemData;
  FCollection := FSystemData.GetCollection(FCollectionID);
end;

destructor TCollectionWorker.Destroy;
begin
  FSystemData.ClearCollectionCache;
  inherited Destroy;
end;

end.
