unit unit_FBD_helpers;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  fictionbook_21,
  unit_Globals,
  XMLDoc;

  procedure GetFBDFileNames(Arch: string; out Description: string);

implementation

uses
  ZipForge;

procedure GetFBDFileNames(Arch: string; out Description: string);
var
  F: TZFArchiveItem;
  Zip: TZipForge;
begin
  Zip := TZipForge.Create(Nil);
  try
    Zip.FileName := Arch;
    Zip.OpenArchive;

    zip.FindFirst('*.fbd',F);
    Description := F.FileName;

  finally
    Zip.Free;
  end;
end;

end.
