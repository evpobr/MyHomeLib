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

unit frm_info_popup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmInfoPopup = class(TForm)
    lblText: TLabel;
  private

  public

  end;

var
  frmInfoPopup: TfrmInfoPopup;

implementation

{$R *.dfm}

end.
