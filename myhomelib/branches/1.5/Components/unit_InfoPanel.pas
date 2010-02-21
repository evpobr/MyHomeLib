{******************************************************************************}
{                                                                              }
{                            MyHomeLib 2.0                                     }
{                                                                              }
{               Copyright (c) 2009 Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}

unit unit_InfoPanel;

interface

uses
  SysUtils,
  Classes,
  Controls,
  ExtCtrls,
  StdCtrls,
  Graphics,
  RzBorder,
  RzCommon;

type

  TMHLInfoPanel = class(TPanel)
  private

    FAuthor : TLabel;
    FTitle  : TLabel;
    FGenre  : Tlabel;

    FFolder : TLabel;
    FFile   : TLabel;

    procedure SetAuthor(Value: string);
    function GetAuthor:string;

    procedure SetTitle(Value: string);
    function GetTitle:string;

    procedure SetGenre(Value: string);
    function GetGenre:string;

    procedure SetFolder(Value: string);
    function GetFolder:string;

    procedure SetFileName(Value: string);
    function GetFileName:string;

    procedure Set_FileInfoVisible(Value: boolean);


    { Private declarations }
  protected
    { Protected declarations }

  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear;
  published
    property Author: string read GetAuthor write SetAuthor;
    property Title: string read GetTitle write SetTitle;
    property Genre: string read GetGenre write SetGenre;
    property Folder: string read GetFolder write SetFolder;
    property FileName: string read GetFileName write SetFileName;
    procedure Translate(Lang: integer);
    property HideFileInfo: boolean write Set_FileInfoVisible;
  end;


implementation

{ TMHLInfoPanel }

procedure TMHLInfoPanel.Clear;
begin
  FAuthor.Caption := '';
  FTitle.Caption := '';
  FGenre.Caption := '';
  FFolder.Caption := '';
  FFile.Caption := '';
end;

constructor TMHLInfoPanel.Create(AOwner: TComponent);
var
  lbl: TLabel;
  bvl: TRzBorder;
begin
  inherited;
  Height := 100;
  Caption := ' ';
  Align := alBottom;
  BevelOuter := bvNone;
  AlignWithMargins := True;

  // группы

  FAuthor := TLabel.Create(Self);
  FAuthor.Parent := Self;
  FAuthor.Caption := 'ФИО  автора';
  FAuthor.Top := 3; FAuthor.Left := 8;
  FAuthor.Font.Size := 10;
  FAuthor.Font.Style := [fsBold];

  FTitle := TLabel.Create(Self);
  FTitle.Parent := Self;
  FTitle.Caption := 'Название книги';
  FTitle.Top := 20; FTitle.Left := 8;
  FTitle.Font.Size := 12;


  lbl := TLabel.Create(Self);
  lbl.Parent := Self;
  lbl.Caption := 'Жанр:';
  lbl.Font.Style := [fsBold];
  lbl.Tag := 3;
  lbl.Top := 40;
  lbl.Left := 5;   lbl.Width := 50;
  lbl.Alignment := taRightJustify;

  FGenre := TLabel.Create(Self);
  FGenre.Parent := Self;
  FGenre.Caption := 'неизвестный';
  FGenre.Top := 40; FGenre.Left := 60;

  // нижняя группа


  lbl := TLabel.Create(Self);
  lbl.Parent := Self;
  lbl.Caption := 'Папка:';
  lbl.Font.Style := [fsBold];
  lbl.Tag := 1;
  lbl.Top := 65;
  lbl.Left := 5;   lbl.Width := 50;
  lbl.Alignment := taRightJustify;

  lbl := TLabel.Create(Self);
  lbl.Parent := Self;
  lbl.Caption := 'Файл:';
  lbl.Font.Style := [fsBold];
  lbl.Tag := 2;
  lbl.Top := 80;
  lbl.Left := 5;   lbl.Width := 50;
  lbl.Alignment := taRightJustify;

  FFolder := TLabel.Create(Self);
  FFolder.Parent := Self;
  FFolder.Caption := 'C:\Books\1-1009.zip';
  FFolder.Top := 65; FFolder.Left := 60;

  FFile := TLabel.Create(Self);
  FFile.Parent := Self;
  FFile.Caption := '111 Иванов Книга.fb2';
  FFile.Top := 80; FFile.Left := 60;

  //--------------------------------------------

  bvl := TRzBorder.Create(Self);
  bvl.Parent := Self;
  bvl.BorderOuter := fsFlatRounded;
  bvl.Align := alBottom;
  bvl.Height := 36;
  bvl.AlignWithMargins := True;


end;

function TMHLInfoPanel.GetAuthor: string;
begin
  Result := FAuthor.Caption;
end;

function TMHLInfoPanel.GetFileName: string;
begin
  Result := FFile.Caption;
end;

function TMHLInfoPanel.GetFolder: string;
begin
  Result := FFolder.Caption;
end;

function TMHLInfoPanel.GetGenre: string;
begin
  Result := FGenre.Caption;
end;

function TMHLInfoPanel.GetTitle: string;
begin
  Result := FTitle.Caption;
end;

procedure TMHLInfoPanel.SetAuthor(Value: string);
begin
  if FAuthor.Caption <> Value then
    FAuthor.Caption := Value;
end;

procedure TMHLInfoPanel.SetFileName(Value: string);
begin
  if FFile.Caption <> Value then
    FFile.Caption := Value;
end;

procedure TMHLInfoPanel.SetFolder(Value: string);
begin
  if FFolder.Caption <> Value then
    FFolder.Caption := Value;
end;

procedure TMHLInfoPanel.SetGenre(Value: string);
begin
  if FGenre.Caption <> Value then
    FGenre.Caption := Value;
end;

procedure TMHLInfoPanel.SetTitle(Value: string);
begin
  if FTitle.Caption <> Value then
    FTitle.Caption := Value;
end;

procedure TMHLInfoPanel.Set_FileInfoVisible(Value: boolean);
begin
  FFolder.Visible := Value;
  FFile.Visible := Value;
end;

procedure TMHLInfoPanel.Translate(Lang: integer);
const
  Rus : array [1..3] of string = ('Папка:','Файл:','Жанр:');
  ENG : array [1..3] of string = ('Folder:','File:','Genre:');

var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  if (Components[i] is TLabel) and (Components[i].Tag > 0) then
  case Lang of
    $409:(Components[i] as TLabel).Caption := ENG[Components[i].Tag];
    $419:(Components[i] as TLabel).Caption := RUS[Components[i].Tag];
  end;
end;

end.
