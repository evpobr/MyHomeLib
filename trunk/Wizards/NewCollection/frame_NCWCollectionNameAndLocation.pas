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

unit frame_NCWCollectionNameAndLocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frame_InteriorPageBase, StdCtrls, ExtCtrls, unit_StaticTip, unit_AutoCompleteEdit;

type
  TframeNCWNameAndLocation = class(TInteriorPageBase)
    Label1: TLabel;
    Panel2: TPanel;
    Label9: TLabel;
    edCollectionFile: TMHLAutoCompleteEdit;
    btnNewFile: TButton;
    Label5: TLabel;
    edCollectionRoot: TMHLAutoCompleteEdit;
    btnSelectRoot: TButton;
    Label8: TLabel;
    edCollectionName: TEdit;
    pageHint: TMHLStaticTip;
    cbRelativePath: TCheckBox;
    procedure btnNewFileClick(Sender: TObject);
    procedure btnSelectRootClick(Sender: TObject);
    procedure CheckControlData(Sender: TObject);
    procedure edCollectionNameChange(Sender: TObject);
    procedure edCollectionFileChange(Sender: TObject);

  private
    procedure ShowPageMessage(const Message: string; AImageIndex: Integer);
    procedure HidePageMessage;
    function IsDataValid(Sender: TObject = nil): Boolean;
    procedure GetCollectionDataFromINPX;

  public
    function Activate(LoadData: Boolean): Boolean; override;
    function Deactivate(CheckData: Boolean): Boolean; override;
  end;

var
  frameNCWNameAndLocation: TframeNCWNameAndLocation;

resourcestring
  SHOWCOLLECTIONTYPE = 'Укажите название коллекции.';
  SHOWCOLLECTIONFILE = 'Укажите файл коллекции.';
  SHOWCOLLECTIONFOLDER = 'Укажите расположение папки с книгами.';
  SELECTFOLDER = 'Выберите папку с книгами';
implementation

uses
  unit_Helpers,
  unit_NCWParams,
  dm_user, DB,
  unit_Errors,
  unit_mhl_strings,
  unit_settings,
  unit_Consts,
  unit_Globals,
  ZipForge;

{$R *.dfm}

{ TframeNCWNameAndLocation }

procedure TframeNCWNameAndLocation.GetCollectionDataFromINPX;
var
  Zip: TZipForge;
  S  : ansistring;
  Script: string;

  function GetParam(var S: ansistring): string;
  var
    p: integer;
  begin
    p := pos(#13#10,S);
    if p <> 0 then
    begin
      Result := copy(S,1,p - 1);
      delete(S,1,p + 1);
    end
    else begin
      Result := S;
      S := '';
    end;
  end;


begin
  if FPParams^.INPXFile = '' then Exit;

  try
    Zip := TZipForge.Create(self);
    try
      Zip.FileName := FPParams^.INPXFile;
      Zip.OpenArchive;
      S := Zip.Comment;
      Zip.CloseArchive;
    except
      on E: exception do
        MessageDlg('Архив поврежден или имеет неправильный формат!', mtError, [mbOK], 0);
    end;
  finally
    Zip.Free;
  end;

  try
    edCollectionName.Text := GetParam(S);
    edCollectionFile.Text := GetParam(S);
    FPParams^.CollectionCode  := StrToInt(GetParam(S));
    FPParams^.Notes  := GetParam(S);
    if S <> '' then FPParams^.URL := GetParam(S);
    Script := '';
    while S <> '' do
      Script := Script + GetParam(S) + #13#10;
    FPParams^.Script := Script;
  except
  end;

  case FPParams^.CollectionCode of
             CT_PRIVATE_FB: FPParams^.CollectionType := ltUserFB2;
          CT_PRIVATE_NONFB: FPParams^.CollectionType := ltUserAny;
      CT_LIBRUSEC_LOCAL_FB: FPParams^.CollectionType := ltLRELocal;
           CT_LIBRUSEC_USR: FPParams^.CollectionType := ltLRELocal;
     CT_LIBRUSEC_ONLINE_FB: FPParams^.CollectionType := ltLREOnline;
  end;

end;


procedure TframeNCWNameAndLocation.ShowPageMessage(const Message: string; AImageIndex: Integer);
begin
  pageHint.Caption := Message;
  pageHint.ImageIndex := AImageIndex;
  pageHint.Visible := True;
end;

procedure TframeNCWNameAndLocation.HidePageMessage;
begin
  pageHint.Visible := False;
end;

function TframeNCWNameAndLocation.Activate(LoadData: Boolean): Boolean;
begin
  if LoadData then
  begin
    GetCollectionDataFromINPX;
    IsDataValid;
  end;

  Result := True;
end;

function TframeNCWNameAndLocation.Deactivate(CheckData: Boolean): Boolean;
begin
  FPParams^.DisplayName := edCollectionName.Text;
  FPParams^.CollectionFile := edCollectionFile.Text;
  FPParams^.CollectionRoot := edCollectionRoot.Text;
  FPParams^.RelativePaths := cbRelativePath.Checked;

  if CheckData then
  begin
    Result := IsDataValid;
    if not Result then
      Exit;
  end;

  Result := True;
end;

procedure TframeNCWNameAndLocation.edCollectionFileChange(Sender: TObject);
begin
  CheckControlData(Sender);
end;

procedure TframeNCWNameAndLocation.edCollectionNameChange(Sender: TObject);
begin
  CheckControlData(Sender);
end;

function TframeNCWNameAndLocation.IsDataValid(Sender: TObject = nil): Boolean;
var
  strValue: string;

  function CheckThis(Control: TObject): Boolean;
  begin
    Result := not Assigned(Sender) or (Sender = Control);
  end;

begin
  Result := False;

  //
  // Проверим название коллекции
  //
  if CheckThis(edCollectionName) then
  begin
    strValue := Trim(edCollectionName.Text);
    if strValue = '' then
    begin
      ShowPageMessage(SHOWCOLLECTIONTYPE, 0);
      Exit;
    end;

    if DMUser.FindCollectionWithProp(cpDisplayName, strValue) then
    begin
      ShowPageMessage(Format(rstrCollectionAlreadyExists, [strValue]), 2);
      Exit;
    end;
  end;

  //
  // Проверим файл коллекции
  //
  if CheckThis(edCollectionFile) then
  begin
    strValue := Trim(edCollectionFile.Text);
    if strValue = '' then
    begin
      ShowPageMessage(SHOWCOLLECTIONFILE, 0);
      Exit;
    end;

    if (FPParams^.Operation = otExisting) and not FileExists(strValue)  then
    begin
      ShowPageMessage(Format(rstrFileDoesntExists, [strValue]), 2);
      Exit;
    end;

    if DMUser.FindCollectionWithProp(cpFileName, strValue + COLLECTION_EXTENSION) or
       DMUser.FindCollectionWithProp(cpFileName, Settings.DataPath + strValue + COLLECTION_EXTENSION) then
    begin
      ShowPageMessage(Format(rstrFileAlreadyExistsInDB, [strValue]), 2);
      Exit;
    end;
  end;

  //
  // Проверим корень библиотеки
  //
  if CheckThis(edCollectionRoot) then
  begin
    strValue := Trim(edCollectionRoot.Text);
    if strValue = '' then
    begin
      ShowPageMessage(SHOWCOLLECTIONFOLDER, 0);
      Exit;
    end;
  end;

  HidePageMessage;

  Result := True;
end;

procedure TframeNCWNameAndLocation.btnNewFileClick(Sender: TObject);
var
  key: TMHLFileName;
  AFileName: string;
begin
  key := fnSaveCollection;
  if FPParams^.Operation = otExisting then
    key := fnOpenCollection;

  if GetFileName(key, AFileName) then
    edCollectionFile.Text := AFileName;
end;

procedure TframeNCWNameAndLocation.CheckControlData(Sender: TObject);
begin
  IsDataValid(Sender);
end;

procedure TframeNCWNameAndLocation.btnSelectRootClick(Sender: TObject);
var
  AFolder: string;
begin
  if GetFolderName(Handle, SELECTFOLDER , AFolder) then
    edCollectionRoot.Text := AFolder;
end;

end.

