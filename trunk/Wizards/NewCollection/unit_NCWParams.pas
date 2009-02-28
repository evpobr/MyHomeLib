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

unit unit_NCWParams;

interface

uses unit_globals;

type
  TNCWOperation = (otNew, otExisting);
  TNCWCollectionType = (ltEmpty, ltLRELocal, ltLREOnline, ltGenesis);
  TNCWFileTypes = (ftFB2, ftAny);

  TNCWParams = record
    Operation: TNCWOperation;
    CollectionType: TNCWCollectionType;
    FileTypes: TNCWFileTypes;
    DefaultGenres: Boolean;
    GenreFile: string;
    DisplayName: string;
    UseDefaultName: Boolean;
    CollectionFile: string;
    UseDefaultLocation: Boolean;
    CollectionRoot: string;
    DoImport: Boolean;
    ImportFile: string;
    RelativePaths:boolean;

    //
    // реальный тип коллекции
    //
    CollectionCode: COLLECTION_TYPE;
  end;
  PNCWParams = ^TNCWParams;

implementation

end.

