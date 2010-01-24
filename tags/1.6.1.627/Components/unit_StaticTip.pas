{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov alex.penkov@gmail.com                           }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

{ DONE -oNickR : добавить поддержку ImageList-а }
{ TODO -oNickR : добавить поддержку тени }

unit unit_StaticTip;

interface

uses
  SysUtils,
  Classes,
  Controls,
  StdCtrls,
  Graphics,
  Windows,
  Forms,
  ImgList,
  Themes,
  UxTheme,
  DwmApi;

type
  TMHLStaticTip = class(TCustomLabel)
  private
    FArcSize: Integer;
    FTextMargin: Integer;
    FImageChangeLink: TChangeLink;
    FImages: TCustomImageList;
    FImageIndex: TImageIndex;

    procedure SetArcSize(const Value: Integer);
    procedure SetTextMargin(const Value: Integer);
    procedure SetImages(const Value: TCustomImageList);

    procedure ImageListChange(Sender: TObject);
    procedure SetImageIndex(const Value: TImageIndex);

  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property ArcSize: Integer read FArcSize write SetArcSize default 10;
    property TextMargin: Integer read FTextMargin write SetTextMargin default 10;
    property Images: TCustomImageList read FImages write SetImages;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;

    property Align;
    property Caption;
  end;

implementation

{ TMHLStaticTip }

constructor TMHLStaticTip.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Color := clInfoBk;
  Transparent := False;
  Layout := tlCenter;
  WordWrap := True;
  AutoSize := False;

  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;

  FImageIndex := -1;

  FArcSize := 10;
  FTextMargin := 10;
end;

destructor TMHLStaticTip.Destroy;
begin
  FreeAndNil(FImageChangeLink);
  inherited Destroy;
end;

procedure TMHLStaticTip.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then
    Images := nil;
end;

procedure FillGlassRect(Canvas: TCanvas; Rect: TRect);
var
  MemDC: HDC;
  PaintBuffer: HPAINTBUFFER;
begin
  PaintBuffer := BeginBufferedPaint(Canvas.Handle, Rect, BPBF_TOPDOWNDIB, nil, MemDC);
  try
    //
    // TODO -oNickR -cподдержка Vista : заменить на RoundRect
    //
    FillRect(MemDC, Rect, Canvas.Brush.Handle);
    BufferedPaintMakeOpaque(PaintBuffer, @Rect);
  finally
    EndBufferedPaint(PaintBuffer, True);
  end;
end;

procedure TMHLStaticTip.Paint;
var
  Rect, CalcRect, CaptionRect: TRect;
  DrawStyle: Longint;
  LForm: TCustomForm;
  LGlassEnabled: Boolean;
  ImageWidth, ImageHeight: Integer;
  ImageTop, ImageLeft: Integer;
begin
  LGlassEnabled := ThemeServices.ThemesEnabled and DwmCompositionEnabled and not (csDesigning in ComponentState);

  if LGlassEnabled then
  begin
    LForm := GetParentForm(Self);
    LGlassEnabled := (LForm <> nil) and LForm.GlassFrame.FrameExtended and LForm.GlassFrame.IntersectsControl(Self);
  end;

  Rect := ClientRect;

  Canvas.Brush.Color := Self.Color;
  Canvas.Brush.Style := bsSolid;
  if LGlassEnabled then
    FillGlassRect(Canvas, Rect)
  else
    Canvas.RoundRect(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, FArcSize, FArcSize);

  if Assigned(Images) and (FImageIndex >= 0) then
  begin
    ImageWidth := FImages.Width;
    ImageHeight := FImages.Height;

    ImageLeft := Rect.Left + FTextMargin;
    ImageTop := Rect.Top + ((Height - ImageHeight) div 2);

    Inc(Rect.Left, FTextMargin);
    Inc(Rect.Left, ImageWidth);

    Images.Draw(Canvas, ImageLeft, ImageTop, FImageIndex);
  end;

  Canvas.Brush.Style := bsClear;
  { DoDrawText takes care of BiDi alignments }
  DrawStyle := DT_EXPANDTABS or DT_WORDBREAK or DT_LEFT;

  CaptionRect := Rect;
  InflateRect(CaptionRect, -FTextMargin, -FTextMargin);

  CalcRect := Rect;
  DoDrawText(CalcRect, DrawStyle or DT_CALCRECT);
  OffsetRect(Rect, 0, (Height - CalcRect.Bottom) div 2);

  IntersectRect(CaptionRect, CaptionRect, Rect);
  DoDrawText(CaptionRect, DrawStyle);
end;

procedure TMHLStaticTip.SetArcSize(const Value: Integer);
begin
  if FArcSize <> Value then
  begin
    FArcSize := Value;
    Invalidate;
  end;
end;

procedure TMHLStaticTip.SetTextMargin(const Value: Integer);
begin
  if FTextMargin <> Value then
  begin
    FTextMargin := Value;
    Invalidate;
  end;
end;

procedure TMHLStaticTip.SetImageIndex(const Value: TImageIndex);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    Invalidate;
  end;
end;

procedure TMHLStaticTip.SetImages(const Value: TCustomImageList);
begin
  if Images <> nil then
    Images.UnRegisterChanges(FImageChangeLink);

  FImages := Value;

  if Images <> nil then
  begin
    Images.RegisterChanges(FImageChangeLink);
    Images.FreeNotification(Self);
  end;

  Invalidate;
end;

procedure TMHLStaticTip.ImageListChange(Sender: TObject);
begin
  Invalidate;
end;

end.

