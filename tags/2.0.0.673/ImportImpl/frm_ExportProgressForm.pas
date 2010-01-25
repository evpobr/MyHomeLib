unit frm_ExportProgressForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_ImportProgressForm, StdCtrls, ComCtrls;

type
  TExportProgressForm = class(TImportProgressForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExportProgressForm: TExportProgressForm;

implementation

{$R *.dfm}

end.

