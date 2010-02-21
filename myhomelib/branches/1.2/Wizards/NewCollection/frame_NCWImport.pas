{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit frame_NCWImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frame_InteriorPageBase, StdCtrls, ExtCtrls, unit_StaticTip, unit_NCWParams, unit_AutoCompleteEdit;

type
  TframeNCWImport = class(TInteriorPageBase)
    cbImportXML: TCheckBox;
    Panel4: TPanel;
    Label4: TLabel;
    edXMLFile: TMHLAutoCompleteEdit;
    btnSelectXML: TButton;
    pageHint: TMHLStaticTip;
    procedure cbImportXMLClick(Sender: TObject);
    procedure btnSelectXMLClick(Sender: TObject);
  private
    function IsDataValid: Boolean;

  public
    procedure Initialize(PParams: PNCWParams); override;

    function Activate(LoadData: Boolean): Boolean; override;
    function Deactivate(CheckData: Boolean): Boolean; override;
  end;

var
  frameNCWImport: TframeNCWImport;

implementation

uses unit_Helpers, ShLwApi, dm_user;

{$R *.dfm}

procedure TframeNCWImport.Initialize(PParams: PNCWParams);
begin
  inherited Initialize(PParams);
  SHAutoComplete(edXMLFile.Handle, SHACF_FILESYSTEM);
end;

function TframeNCWImport.IsDataValid: Boolean;
var
  strValue: string;
begin
  Result := False;

  if cbImportXML.Checked then
  begin
    strValue := Trim(edXMLFile.Text);
    if not FileExists(strValue) then
      Exit;
  end;

  Result := True;
end;

function TframeNCWImport.Activate(LoadData: Boolean): Boolean;
begin
  if LoadData then
  begin
    cbImportXML.Checked := FPParams^.DoImport;
    edXMLFile.Text := FPParams^.ImportFile;

    cbImportXMLClick(cbImportXML);
  end;

  Result := True;
end;

procedure TframeNCWImport.btnSelectXMLClick(Sender: TObject);
var
  AFileName: string;
begin
  if GetFileName(fnOpenImportFile, AFileName) then
    edXMLFile.Text := AFileName;
end;

procedure TframeNCWImport.cbImportXMLClick(Sender: TObject);
begin
  edXMLFile.Enabled := cbImportXML.Checked;
  btnSelectXML.Enabled := cbImportXML.Checked;
end;

function TframeNCWImport.Deactivate(CheckData: Boolean): Boolean;
begin
  FPParams^.DoImport := cbImportXML.Checked;
  FPParams^.ImportFile := edXMLFile.Text;

  if CheckData then
  begin
    Result := IsDataValid;
    if not Result then
      Exit;
  end;

  Result := True;
end;

end.

