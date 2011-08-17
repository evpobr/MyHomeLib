(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
  * Created                  20.08.2008
  * Description              
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit frm_splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, pngimage, LMDPNGImage;

type
  TfrmSplash = class(TForm)
    Image1: TImage;
    lblState: TLabel;
    RzLabel1: TLabel;
  private
  public
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

end.
