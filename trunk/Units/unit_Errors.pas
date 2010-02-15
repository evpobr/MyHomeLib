(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             12.02.2010
  * Description         Сообщения об ошибках
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_Errors;

interface

uses
  SysUtils;

type
  EMHLError = class(Exception);

resourcestring
  rstrErrorInvalidArgument = 'Invalid argument';

  rstrAllFieldsShouldBeFilled = 'Все поля должны быть заполнены!';

  rstrCollectionAlreadyExists = 'Коллекция "%s" уже существует!';
  rstrFileDoesntExists = 'Файл "%s" не существует!';
  rstrFileAlreadyExistsInDB = 'Файл "%s" используется другой коллекцией!';


implementation

end.

