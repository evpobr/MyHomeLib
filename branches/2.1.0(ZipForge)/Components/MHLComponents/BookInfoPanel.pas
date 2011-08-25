(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  * Created             14.04.2010
  * Description         Панель информации о книге
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit BookInfoPanel;

interface

uses
  Controls,
  Graphics,
  Classes,
  StdCtrls,
  ExtCtrls,
  MHLLinkLabel;

type
  TInfoPanel = class(TCustomPanel)
  private
    FCover: TImage;
    FInfoPanel: TPanel;
    FTitle: TLabel;
    FAuthors: TMHLLinkLabel;
    FSerieLabel: TLabel;
    FSeries: TMHLLinkLabel;
    FGenreLabel: TLabel;
    FGenres: TMHLLinkLabel;
    FAnnotation: TMemo;
    FInfoButton: TButton;

    FOnAuthorLinkClicked: TSysLinkEvent;
    FOnGenreLinkClicked: TSysLinkEvent;
    FOnSeriesLinkClicked: TSysLinkEvent;
    FOnAnnotationClicked: TNotifyEvent;

    FColor: TColor;

    FInfoShown: boolean;
    FAnnotationStr: string;
    FBookInfoStr: string;

    function GetShowCover: boolean;
    procedure SetShowCover(const Value: boolean);
    procedure SetColor(Value: TColor);

    function GetShowAnnotation: Boolean;
    procedure SetShowAnnotation(const Value: Boolean);

    procedure UpdateLinkTexts;

    procedure OnLinkClicked(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure OnAnnotationClicked(Sender: TObject);
  protected
    procedure Resize; override;

  public
    constructor Create(AOwner: TComponent); override;

    procedure SetBookInfo(
      const BookTitle: string;
      const Autors: string;
      const Series: string;
      const Genres: string
    );

    procedure SetBookCover(
      BookCover: TGraphic
      );

    procedure SetBookAnnotation(
      const Annotation: string;
      const BookInfo: string = ''
      );

    procedure Clear;

  published
    property Align;
    property Anchors;
    property BiDiMode;
    property Color read FColor write SetColor default clWindow;
    //property Constraints;
    property Ctl3D;
    property UseDockManager default True;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FullRepaint;
    property Font;
    //property Locked;
    property Padding;
    property ParentBiDiMode;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property VerticalAlignment;
    property Visible;

    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;

    property ShowCover: Boolean read GetShowCover write SetShowCover default True;
    property ShowAnnotation: Boolean read GetShowAnnotation write SetShowAnnotation default True;

    property OnAuthorLinkClicked: TSysLinkEvent read FOnAuthorLinkClicked write FOnAuthorLinkClicked;
    property OnSeriesLinkClicked: TSysLinkEvent read FOnSeriesLinkClicked write FOnSeriesLinkClicked;
    property OnGenreLinkClicked: TSysLinkEvent read FOnGenreLinkClicked write FOnGenreLinkClicked;
  end;

implementation

resourcestring
  rstrSerieLabel = 'Серия:';
  rstrGenreLabel = 'Жанр(ы):';
  rstrNoAnnotationHint = 'Аннотация отсутствует';

function GetCoverWidth(Height: Integer): Integer;
begin
  Result := Height * 2 div 3;
end;

constructor TInfoPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  SetBounds(0, 0, 500, 200);

  BevelOuter := bvNone;
  ShowCaption := False;

  FCover := TImage.Create(Self);
  FCover.Parent := Self;
  FCover.SetBounds(0, 0, GetCoverWidth(200), 200);
  FCover.Align := alLeft;
  FCover.AlignWithMargins := True;
  FCover.Center := True;
  FCover.Proportional := True;
  FCover.Stretch := True;

  FInfoPanel := TPanel.Create(Self);
  FInfoPanel.Parent := Self;
  FInfoPanel.SetBounds(200, 0, 300, 200);
  FInfoPanel.Align := alClient;
  FInfoPanel.BevelOuter := bvNone;
  FInfoPanel.ShowCaption := False;

  FTitle := TLabel.Create(FInfoPanel);
  FTitle.Parent := FInfoPanel;
  FTitle.Anchors := [akLeft, akTop, akRight];
  FTitle.AutoSize := False;
  FTitle.Font.Style := [fsBold];

  FAuthors := TMHLLinkLabel.Create(FInfoPanel);
  FAuthors.Parent := FInfoPanel;
  FAuthors.UseVisualStyle := True;
  FAuthors.OnLinkClick := OnLinkClicked;

  FSerieLabel := TLabel.Create(FInfoPanel);
  FSerieLabel.Parent := FInfoPanel;
  FSerieLabel.Caption := rstrSerieLabel;
  FSerieLabel.AutoSize := False;
  FSerieLabel.Font.Style := [fsBold];

  FSeries := TMHLLinkLabel.Create(FInfoPanel);
  FSeries.Parent := FInfoPanel;
  FSeries.UseVisualStyle := True;
  FSeries.OnLinkClick := OnLinkClicked;

  FGenreLabel := TLabel.Create(FInfoPanel);
  FGenreLabel.Parent := FInfoPanel;
  FGenreLabel.Caption := rstrGenreLabel;
  FGenreLabel.AutoSize := False;
  FGenreLabel.Font.Style := [fsBold];

  FGenres := TMHLLinkLabel.Create(FInfoPanel);
  FGenres.Parent := FInfoPanel;
  FGenres.UseVisualStyle := True;
  FGenres.OnLinkClick := OnLinkClicked;

  FAnnotation := TMemo.Create(FInfoPanel);
  FAnnotation.Parent := FInfoPanel;
  FAnnotation.Anchors := [akLeft, akTop, akRight, akBottom];
  FAnnotation.ReadOnly := True;
  FAnnotation.TextHint := rstrNoAnnotationHint;
  FAnnotation.ScrollBars := ssVertical;
  FAnnotation.OnDblClick := OnAnnotationClicked;

  //       300 200
  //0,  0, 300,  20
  //0, 20, 300,  20
  //0, 40,  60,  20 | 60, 40, 140, 20
  //0, 60,  60,  20 | 60, 60, 140, 20
  //0, 80, 300, 120

  if csDesigning in ComponentState then
  begin
    FTitle.Caption := 'Название книги';
    FAuthors.Caption := '<a>Автор книги</a> <a>Автор книги</a>';
    FSeries.Caption := '<a>Название серии</a>';
    FGenres.Caption := '<a>Название жанра</a> <a>Название жанра</a> <a>Название жанра</a>';
  end;

  FTitle.SetBounds(0, 0, 300, 20);
  FAuthors.SetBounds(0, 20, 300, 20);
  FSerieLabel.SetBounds(0, 40, 70, 20);  FSeries.SetBounds(70, 40, 140, 20);
  FGenreLabel.SetBounds(0, 60, 70, 20);  FGenres.SetBounds(70, 60, 140, 20);
  FAnnotation.SetBounds(0, 80, 300, 120);

  //
  //
  //
  Constraints.MinHeight := 150;
end;

procedure TInfoPanel.Resize;
begin
  FCover.Width := GetCoverWidth(FCover.Height);
  inherited;
end;

procedure TInfoPanel.OnAnnotationClicked(Sender: TObject);
begin
  if Not FInfoShown then
    FAnnotation.Lines.Text := FBookInfoStr
  else
    FAnnotation.Lines.Text := FAnnotationStr;
  FInfoShown := not FInfoShown;
end;

procedure TInfoPanel.OnLinkClicked(Sender: TObject; const Link: string; LinkType: TSysLinkType);
begin
  if Sender = FAuthors then
  begin
    if Assigned(FOnAuthorLinkClicked) then
      FOnAuthorLinkClicked(Self, Link, LinkType);
  end
  else if Sender = FSeries then
  begin
    if Assigned(FOnSeriesLinkClicked) then
      FOnSeriesLinkClicked(Self, Link, LinkType);
  end
  else if Sender = FGenres then
  begin
    if Assigned(FOnGenreLinkClicked) then
      FOnGenreLinkClicked(Self, Link, LinkType);
  end
  else
    Assert(False);
end;

procedure TInfoPanel.SetBookInfo(
  const BookTitle: string;
  const Autors: string;
  const Series: string;
  const Genres: string
);
begin
  FTitle.Caption := BookTitle;
  FAuthors.Caption := Autors;
  FSeries.Caption := Series;
  FGenres.Caption := Genres;
end;

procedure TInfoPanel.SetColor(Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    FAnnotation.Color := Value;
  end;
end;

procedure TInfoPanel.SetBookCover(
  BookCover: TGraphic
  );
begin
  FCover.Picture.Assign(BookCover);
end;

procedure TInfoPanel.SetBookAnnotation;
begin
  FAnnotationStr := Annotation;
  FBookInfoStr := BookInfo;
  FInfoShown := False;

  FAnnotation.Lines.BeginUpdate;
  try
    FAnnotation.Lines.Text := Annotation;
    FAnnotation.SelStart := 0;
    FAnnotation.SelLength := 0;
  finally
    FAnnotation.Lines.EndUpdate;
  end;
end;

procedure TInfoPanel.Clear;
begin
  FTitle.Caption := '';
  FAuthors.Caption := '';
  FSeries.Caption := '';
  FGenres.Caption := '';
  FAnnotation.Lines.Clear;
  FCover.Picture.Assign(nil);
end;


function TInfoPanel.GetShowAnnotation: Boolean;
begin
  Result := FAnnotation.Visible;
end;

procedure TInfoPanel.SetShowAnnotation(const Value: Boolean);
begin
  if GetShowAnnotation <> Value then
  begin
    FAnnotation.Visible := Value;
    if Value then
      Constraints.MinHeight := 150
    else
      Constraints.MinHeight := 80;
  end;
end;

function TInfoPanel.GetShowCover: boolean;
begin
  Result := FCover.Visible;
end;

procedure TInfoPanel.SetShowCover(const Value: boolean);
begin
  if GetShowCover <> Value then
  begin
    FCover.Visible := Value;
    UpdateLinkTexts;
  end;
end;

procedure TInfoPanel.UpdateLinkTexts;
begin
  //
  // TODO : задача этого метода превратить обрезанные линки в "Link Link и пр.", т е убрать невлезающие и добавить " и пр."
  //
end;

end.
