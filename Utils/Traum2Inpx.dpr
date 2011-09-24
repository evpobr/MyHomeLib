program Traum2Inpx;

uses
  Forms,
  frm_main in 'forms\frm_main.pas' {frmMain},
  dm_main in 'units\dm_main.pas' {dmTraum: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmTraum, dmTraum);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
