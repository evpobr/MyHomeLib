program libfilelist;

uses
  Forms,
  main in 'main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Show;
  frmMain.CommandLine;
  Application.Run;
end.
