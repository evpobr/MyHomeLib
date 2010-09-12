(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors             Aleksey Penkov   alex.penkov@gmail.com
  *                     Nick Rymanov     nrymanov@gmail.com
  * Created
  * Description
  *
  * $Id$
  *
  * History
  * NickR 02.03.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit dm_user;

interface

uses
  ImgList,
  Classes,
  Controls;

type
  TDMUser = class(TDataModule)
    SeverityImages: TImageList;
    SeverityImagesBig: TImageList;
  end;

var
  DMUser: TDMUser;

implementation

{$R *.dfm}

end.
