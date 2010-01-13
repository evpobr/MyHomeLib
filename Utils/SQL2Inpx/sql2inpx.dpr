program sql2inpx;

uses
  Forms,
  frm_main in 'frm_main.pas' {frmMain},
  dm_librusec in 'dm_librusec.pas' {Lib: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLib, Lib);
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Show;
  frmMain.Commands;
  Application.Run;
end.
