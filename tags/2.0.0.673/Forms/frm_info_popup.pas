unit frm_info_popup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, ExtCtrls, RzPanel;

type
  TfrmInfoPopup = class(TForm)
    RzPanel1: TRzPanel;
    lblText: TRzLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfoPopup: TfrmInfoPopup;

implementation

{$R *.dfm}

end.
