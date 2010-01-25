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

