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
  Messages,
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

  protected

  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear;

    procedure Translate(Lang: Integer);

  published
    property Title: string read GetTitle write SetTitle;
    property Author: string read GetAuthor write SetAuthor;
    property Genre: string read GetGenre write SetGenre;
    property Folder: string read GetFolder write SetFolder;
    property FileName: string read GetFileName write SetFileName;
    property HideFileInfo: Boolean write Set_FileInfoVisible;
  end;

  TMHLInfoPanel2 = class(TCustomPanel)
  const
    RowCount = 4;
    DefPadding = 3;

  type
    TField = (ifTitle, ifAuthors, ifSeries, ifGenres);

  strict private
    FLabels: array [0 .. RowCount - 1] of TLabel;
    FValues: array [0 .. RowCount - 1] of TLinkLabel;

    procedure ArrangeControls;

  private
    FControlPadding: Integer;
    procedure SetControlPadding(const Value: Integer);

    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    function GetField(const Index: Integer): string;
    procedure SetField(const Index: Integer; const Value: string);
    procedure SetOnLinkClick(const Index: Integer; const Value: TSysLinkEvent);
    function GetOnLinkClick(const Index: Integer): TSysLinkEvent;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property Align;
    //property Alignment;
    property Anchors;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter default bvNone;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
    property BorderStyle;
    //property Caption;
    property Color;
    property Constraints;
    property Ctl3D;
    property UseDockManager default True;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    //property FullRepaint;
    property Font;
    property Locked;
    //property Padding;
    property ParentBiDiMode;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    //property PopupMenu;
    //property ShowCaption;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    //property VerticalAlignment;
    property Visible;

    property ControlPadding: Integer read FControlPadding write SetControlPadding default DefPadding;

    property Title: string index ifTitle read GetField write SetField;
    property Authors: string index ifAuthors read GetField write SetField;
    property Series: string index ifSeries read GetField write SetField;
    property Genres: string index ifGenres read GetField write SetField;

    property OnAuthorsLinkClick: TSysLinkEvent index ifAuthors read GetOnLinkClick write SetOnLinkClick;
    property OnSeriesLinkClick: TSysLinkEvent index ifSeries read GetOnLinkClick write SetOnLinkClick;
    property OnGenresLinkClick: TSysLinkEvent index ifGenres read GetOnLinkClick write SetOnLinkClick;
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

{ TInfoPanel2 }

resourcestring
  rstrTitle = 'Название';
  rstrAuthors = 'Автор(ы)';
  rstrSeries = 'Серия';
  rstrGenres = 'Жанр(ы)';

const
  DEF_Captions: array [0 .. TMHLInfoPanel2.RowCount - 1] of string = (
    rstrTitle, rstrAuthors, rstrSeries, rstrGenres
  );

constructor TMHLInfoPanel2.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited Create(AOwner);

  BevelOuter := bvNone;
  ShowCaption := False;
  FullRepaint := False;

  FControlPadding := DefPadding;

  for i := 0 to RowCount - 1 do
  begin
    FLabels[i] := TLabel.Create(Self);
    FLabels[i].Parent := Self;
    FLabels[i].Caption := DEF_Captions[i];
    FLabels[i].Font.Style := [fsBold];

    FValues[i] := TLinkLabel.Create(Self);
    FValues[i].Parent := Self;
    FValues[i].Caption := DEF_Captions[i];
    FValues[i].TabOrder := i;
    FValues[i].UseVisualStyle := True;
  end;

  ArrangeControls;
end;

procedure TMHLInfoPanel2.ArrangeControls;
var
  i: Integer;
  maxW, maxH: Integer;
begin
  maxW := 0;
  maxH := 0;

  for i := 0 to RowCount - 1 do
  begin
    if FLabels[i].Width > maxW then
      maxW := FLabels[i].Width;
    if FLabels[i].Height > maxH then
      maxH := FLabels[i].Height;
  end;

  for i := 0 to RowCount - 1 do
  begin
    FLabels[i].Left := FControlPadding;
    FLabels[i].Top := FControlPadding * (i + 1) + maxH * i;

    FValues[i].Left := FControlPadding * 2 + maxW;
    FValues[i].Top := FLabels[i].Top;
  end;
end;

procedure TMHLInfoPanel2.CMFontChanged(var Message: TMessage);
var
  i: Integer;
begin
  inherited;
  for i := 0 to RowCount - 1 do
  begin
    FLabels[i].Font := Font;
    FLabels[i].Font.Style := [fsBold];
  end;
  ArrangeControls;
end;

function TMHLInfoPanel2.GetField(const Index: Integer): string;
begin
  Result := FValues[Index].Caption;
end;

procedure TMHLInfoPanel2.SetField(const Index: Integer; const Value: string);
begin
  FValues[Index].Caption := Value;
end;

function TMHLInfoPanel2.GetOnLinkClick(const Index: Integer): TSysLinkEvent;
begin
  Result := FValues[Index].OnLinkClick;
end;

procedure TMHLInfoPanel2.SetOnLinkClick(const Index: Integer; const Value: TSysLinkEvent);
begin
  FValues[Index].OnLinkClick := Value;
end;

procedure TMHLInfoPanel2.SetControlPadding(const Value: Integer);
begin
  if FControlPadding <> Value then
  begin
    FControlPadding := Value;
    ArrangeControls;
  end;
end;

end.
