(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Aleksey Penkov  alex.penkov@gmail.com
  *                     Nick Rymanov (nrymanov@gmail.com)
  * Created             12.02.2010
  * Description
  *
  * $Id$
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_Database;

interface

uses
  unit_Interfaces;

  function GetBookCollection(const DBCollectionFile: string): IBookCollection;
  function GetActiveBookCollection: IBookCollection;

implementation

uses
  unit_SystemDatabase;

function GetBookCollection(const DBCollectionFile: string): IBookCollection;
begin
  Result := GetSystemData.GetBookCollection(DBCollectionFile);
end;

function GetActiveBookCollection: IBookCollection;
begin
  Result := GetSystemData.GetActiveBookCollection;
end;

end.

