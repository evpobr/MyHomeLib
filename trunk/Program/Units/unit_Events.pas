(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           eg
  * Created             08.10.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_Events;

interface

uses
  unit_Globals,
  unit_Interfaces;

type
  TBookEvent = procedure(const BookRecord: TBookRecord) of object;
  TSelectBookEvent = procedure(MoveForward: Boolean) of object;
  TGetBookEvent = procedure(var BookRecord: TBookRecord) of object;
  TChangeStateEvent = procedure(State: Boolean) of object;
  TOnLocateBookEvent = procedure(const Text: string; MoveForward: Boolean) of object;
  TOnHelpEvent = function(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean of object;

implementation

end.
