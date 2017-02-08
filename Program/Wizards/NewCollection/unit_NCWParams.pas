(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors             Nick Rymanov     nrymanov@gmail.com
  * Created             20.08.2008
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_NCWParams;

interface

uses unit_globals;

type
  TNCWOperation = (
    otNew,              // создать новую пользовательскую коллекцию
    otExisting,         // подключить существующую коллекцию
    otInpx,             // создать коллекцию из INPX
    otInpxDownload      // создать коллекцию из предварительно скачанного INPX
  );

  TNCWCollectionType = (
    ltUser,             // новая пользовательская коллекция. тип книг определяется TNCWFileTypes
    ltUserFB,           // пользовательская коллекция FB2 книг из INPX
    ltUserAny,          // пользовательская коллекция не-FB2 книг из INPX
    ltExternalLocalFB,  // внешняя локальная коллекция FB2 книг из INPX
    ltExternalOnlineFB, // внешняя онлайн коллекция FB2 книг из INPX
    ltExternalLocalAny, // внешняя локальная коллекция не-FB2 книг из INPX
    ltExternalOnlineAny // внешняя онлайн коллекция не-FB2 книг из INPX
  );

  TNCWFileTypes = (
    ftFB2,              // в коллекции хранятся файлы в формате FB2
    ftAny               // в коллекции хранятся файлы в произвольном формате
  );

  PNCWParams = ^TNCWParams;
  TNCWParams = record
    Operation: TNCWOperation;
    CollectionType: TNCWCollectionType;
    FileTypes: TNCWFileTypes;
    DefaultGenres: Boolean;
    GenreFile: string;

    DisplayName: string;
    CollectionFile: string;
    CollectionRoot: string;

    INPXFile: string;

    AutoImport: boolean;

    //
    // необходимо перенести загрузку и установку этих значений в TImportInpxThread
    //
    //Notes: string;
    //URL: string;
    //Script: string;
    INPXUrl: string;

    //
    // реальный тип коллекции
    //
    CollectionCode: COLLECTION_TYPE;

    //
    // ID новой коллекции (созданной или подключенной)
    //
    CollectionID: Integer;
  end;

implementation

end.

