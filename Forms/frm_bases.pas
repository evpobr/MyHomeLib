
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}

unit frm_bases;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Mask,
  ExtCtrls,
  unit_StaticTip,
  RzEdit,
  RzBtnEdt,
  RzPanel,
  RzRadGrp, unit_AutoCompleteEdit;

type
  TfrmBases = class(TForm)
    pnButtons: TPanel;
    btnSave: TButton;
    btnCancel: TButton;
    MHLStaticTip1: TMHLStaticTip;
    Panel2: TPanel;
    Label9: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    edCollectionFile: TMHLAutoCompleteEdit;
    btnNewFile: TButton;
    edCollectionRoot: TMHLAutoCompleteEdit;
    btnSelectRoot: TButton;
    edCollectionName: TEdit;
    cbRelativePath: TCheckBox;
    Label1: TLabel;
    edDescription: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure edDBFileButtonClick(Sender: TObject);
    procedure edDBFolderButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);

  private
    CollectionID: Integer;

    function GetDisplayName: string;
    procedure SetDisplayName(const Value: string);
    function GetDBFileName: string;
    procedure SetDBFileName(const Value: string);
    function GetRootFolder: string;
    procedure SetRootFolder(const Value: string);
    function GetDescription: string;
    procedure SetDescription(const Value: string);

    property DisplayName: string read GetDisplayName write SetDisplayName;
    property DBFileName: string read GetDBFileName write SetDBFileName;
    property RootFolder: string read GetRootFolder write SetRootFolder;
    property Description: string read GetDescription write SetDescription;

  public

  end;

var
  frmBases: TfrmBases;

implementation

uses
  DB,
  dm_user,
  unit_globals,
  unit_database,
  dm_collection,
  StrUtils,
  unit_Settings,
  unit_Helpers,
  unit_Consts,
  unit_Errors;

{$R *.dfm}

procedure TfrmBases.FormShow(Sender: TObject);
begin
  CollectionID := DMUser.ActiveCollection.ID;

  DisplayName := DMUser.ActiveCollection.Name;
  DBFileName := DMUser.ActiveCollection.DBFileName;
  RootFolder := DMUser.ActiveCollection.RootFolder;
  Description := DMUser.ActiveCollection.Notes;

end;

function TfrmBases.GetDisplayName: string;
begin
  Result := Trim(edCollectionName.Text);
end;

procedure TfrmBases.SetDisplayName(const Value: string);
begin
  edCollectionName.Text := Value;
end;

function TfrmBases.GetDBFileName: string;
begin
  Result := Trim(edCollectionFile.Text);
end;

function TfrmBases.GetDescription: string;
begin
  Result := Trim(edDescription.Text);
end;

procedure TfrmBases.SetDBFileName(const Value: string);
begin
  edCollectionFile.Text := Value;
end;

procedure TfrmBases.SetDescription(const Value: string);
begin
  edDescription.Text := Value;
end;

function TfrmBases.GetRootFolder: string;
begin
  Result := Trim(edCollectionRoot.Text);
end;

procedure TfrmBases.SetRootFolder(const Value: string);
begin
  edCollectionRoot.Text := Value;
end;

procedure TfrmBases.edDBFileButtonClick(Sender: TObject);
var
  AFileName: string;
begin
  if GetFileName(fnOpenCollection, AFileName) then
    edCollectionFile.Text := AFileName;
end;

procedure TfrmBases.edDBFolderButtonClick(Sender: TObject);
var
  AFolder: string;
begin
  if GetFolderName(Handle, 'Выберите папку для сохранения данных', AFolder) then
    edCollectionRoot.Text := AFolder;
end;

procedure TfrmBases.btnSaveClick(Sender: TObject);
var
  ADBFileName: string;
  ARootFolder: string;
begin
  if (DisplayName = '') or (DBFileName = '') or (RootFolder = '') then
  begin
    MessageDlg(rstrAllFieldsShouldBeFilled, mtError, [mbOk], 0);
    Exit;
  end;

  //
  // Проверим название коллекции
  //
  if DMUser.FindCollectionWithProp(cpDisplayName, DisplayName, CollectionID) then
  begin
    MessageDlg(Format(rstrCollectionAlreadyExists, [DisplayName]), mtError, [mbOk], 0);
    Exit;
  end;

  //
  // TODO -oNickR -cBug: в качестве базового каталого необходимо использовать DataPath
  //
  if not cbRelativePath.Checked then
  begin
    ADBFileName := ExpandFileName(DBFileName);
    if '' = ExtractFileExt(ADBFileName) then
      ADBFileName := ChangeFileExt(ADBFileName, COLLECTION_EXTENSION);

    ARootFolder := ExcludeTrailingPathDelimiter(ExpandFileName(RootFolder));
  end
  else
  begin
    ADBFileName := DBFileName;
    if '' = ExtractFileExt(ADBFileName) then
      ADBFileName := ChangeFileExt(ADBFileName, COLLECTION_EXTENSION);
    ARootFolder := ExcludeTrailingPathDelimiter(RootFolder);
  end;

  //
  // Проверим название и существование файла
  //
  if not FileExists(ADBFileName) then
  begin
    MessageDlg(Format(rstrFileDoesntExists, [ADBFileName]), mtError, [mbOk], 0);
    Exit;
  end;

  if DMUser.FindCollectionWithProp(cpFileName, ADBFileName, CollectionID) then
  begin
    MessageDlg(Format(rstrFileAlreadyExistsInDB, [ADBFileName]), mtError, [mbOk], 0);
    Exit;
  end;

  DMUser.UpdateCollectionProps(CollectionID, DisplayName, ARootFolder, ADBFileName, Description);

  ModalResult := mrOk;
end;

end.

