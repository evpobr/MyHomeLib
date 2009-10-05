{******************************************************************************}
{                                                                              }
{                       Package MyHomeLib Components                           }
{                                                                              }
{                                Version 1                                     }
{                                                                              }
{         Copyright (c) 2008, 2009 Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}

unit unit_CoverPanel;

interface

uses
  SysUtils,
  Classes,
  Controls,
  ExtCtrls,
  StdCtrls ,
  ZipForge,
  fictionbook_21,
  XMLDoc,
  Graphics,
  RzBorder,
  RzCommon,
  RzPanel,
  RzSplit;


type

  TMHLCoverPanel = class(TRzSizePanel)
  private
    { Private declarations }
    FCover: TImage;
    FText : TMemo;
    FInfo : TPanel;

    FPublisher, FCity, FYear, FISBN, FDate, FVersion, FAuthor, FVerTitle: TLabel;

    Zip: TZipForge;

    FBook: IXMLFictionBook;

    //FS: TStream;

    FOnProgress: boolean;
    FFb2InfoVisible: boolean;
    FFontSize: integer;

    FFolder: string;
    FFile  : string;

    FTmp : string;
    FNo: Integer;

    FAColor : TColor;

    procedure SetAColor(Value: TColor);

  protected
    { Protected declarations }
    function UnPack(var FS: TMemoryStream):boolean;
    procedure GetFb2Info(FS: TMemoryStream);
    procedure ShowEmptyCover;
    procedure Set_Fb2InfoVisible(Value: boolean);
    procedure Set_FontSize(Value: integer);

  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear;
    procedure Resize; override;

    function Show(Folder, FileName: string; No: integer):boolean;

  published
    { Published declarations }
    property TmpFolder:string read FTmp write FTmp;
    property Fb2InfoVisible:boolean read FFb2InfoVisible write Set_Fb2InfoVisible;
    property FontSize:integer read FFontSize write Set_FontSize;
    property AnnotationColor: TColor read FAColor write SetAColor;
  end;



implementation

uses
  Messages,
  xmldom,
  jpeg,
  pngimage,
  types,
  unit_MHLHelpers;

const
  W = 55;

{ TMHLCoverPanel }

procedure TMHLCoverPanel.Clear;
begin
  FCover.Picture := nil;
  FText.Clear;
  FPublisher.Caption := '';
  FCity.Caption      := '';
  FYear.Caption      := '';
  FISBN.Caption      := '';
  FDate.Caption      := '';
  FVersion.Caption   := '';
  FAuthor.Caption    := '';

  Refresh;
end;

constructor TMHLCoverPanel.Create(AOwner: TComponent);
var
  lbl: TLabel;
  bvl: TRzBorder;
begin
  inherited;

  Parent           := AOwner as TWinControl;
  Align            := alRight;
  AlignWithMargins := True;
  Caption          := '';
  Width            := 250;
  BorderInner      := fsNone;
  BorderOuter      := fsFlatRounded;
  ParentFont       := False;
  Font.Size        := 8;
  SizeBarWidth     := 5;
  Margins.Left     := 0;
  MarginMin        := 150;

  FCover                  := TImage.Create(Self);
  FCover.Align            := alTop;
  FCover.AlignWithMargins := True;
  FCover.Margins.Top      := 5;
  FCover.Parent           := Self;
  FCover.Height           := 255;
  FCover.Center           := True;
  FCover.Stretch          := True;
  FCover.Proportional     := True;

  FText                  := TMemo.Create(Self);
  FText.Parent           := Self;
  FText.AlignWithMargins := True;
  FText.Align            := alClient;
  FText.ScrollBars       := ssVertical;
  FText.ReadOnly         := True;
  FText.TabStop          := False;
  //-----------------------------
  FInfo                  := TPanel.Create(Self);
  FInfo.Parent           := Self;
  FInfo.AlignWithMargins := True;
  FInfo.Align            := alBottom;
  FInfo.Height           := 100;
  FInfo.BevelOuter       := bvNone;

  lbl            := TLabel.Create(FInfo);
  lbl.Parent     := FInfo;
  lbl.Caption    := 'Изд-во:';
  lbl.Font.Style := [fsBold];
  lbl.Top        := 0;
  lbl.Tag        := 1;
  lbl.Left       := 5;
  lbl.Width      := W;
  lbl.Alignment  := taRightJustify;

  lbl            := TLabel.Create(FInfo);
  lbl.Parent     := FInfo;
  lbl.Caption    := 'Город:';
  lbl.Font.Style := [fsBold];
  lbl.Top        := 15;
  lbl.Tag        := 2;
  lbl.Left       := 5;
  lbl.Width      := W;
  lbl.Alignment  := taRightJustify;

  lbl            := TLabel.Create(FInfo);
  lbl.Parent     := FInfo;
  lbl.Caption    := 'Год:';
  lbl.Font.Style := [fsBold];
  lbl.Top        := 30;
  lbl.Tag        := 3;
  lbl.Left       := 5;
  lbl.Width      := W;
  lbl.Alignment  := taRightJustify;

  lbl            := TLabel.Create(FInfo);
  lbl.Parent     := FInfo;
  lbl.Caption    := 'ISBN:';
  lbl.Font.Style := [fsBold];
  lbl.Top        := 45;
  lbl.Tag        := 4;
  lbl.Left       := 5;
  lbl.Width      := W;
  lbl.Alignment  := taRightJustify;

  lbl            := TLabel.Create(FInfo);
  lbl.Parent     := FInfo;
  lbl.Caption    := 'Дата:';
  lbl.Font.Style := [fsBold];
  lbl.Top        := 65;
  lbl.Tag        := 5;
  lbl.Left       := 5;
  lbl.Width      := W;
  lbl.Alignment  := taRightJustify;

  FVerTitle            := TLabel.Create(FInfo);
  FVerTitle.Parent     := FInfo;
  FVerTitle.Caption    := 'v. ';
  FVerTitle.Font.Style := [fsBold];
  FVerTitle.Tag        := 6;
  FVerTitle.Top        := 65;
  FVerTitle.Left       := Width - 70;

  lbl            := TLabel.Create(FInfo);
  lbl.Parent     := FInfo;
  lbl.Caption    := 'Автор:';
  lbl.Font.Style := [fsBold];
  lbl.Top        := 80;
  lbl.Tag        := 7;
  lbl.Left       := 5;
  lbl.Width      := W;
  lbl.Alignment  := taRightJustify;

  //------------------------------

  FPublisher          := TLabel.Create(FInfo);
  FPublisher.Parent   := FInfo;
  FPublisher.Width    := 180;
  FPublisher.Top      := 0;
  FPublisher.Left     := W + 10;
  FPublisher.AutoSize := False;

  FCity        := TLabel.Create(FInfo);
  FCity.Parent := FInfo;
  FCity.Top    := 15;
  FCity.Left   := W + 10;

  FYear        := TLabel.Create(FInfo);
  FYear.Parent := FInfo;
  FYear.Top    := 30;
  FYear.Left   := W + 10;

  FISBN          := TLabel.Create(FInfo);
  FISBN.Parent   := FInfo;
  FISBN.Top      := 45;
  FISBN.Left     := W + 10;
  FISBN.Width    := 180;
  FISBN.AutoSize := False;

  FDate          := TLabel.Create(FInfo);
  FDate.Parent   := FInfo;
  FDate.Width    := 65;
  FDate.Top      := 65;
  FDate.Left     := W + 10;
  FDate.AutoSize := False;

  FVersion        := TLabel.Create(FInfo);
  FVersion.Parent := FInfo;
  FVersion.Top    := 65;
  FVersion.Left   := Width - 55;

  FAuthor          := TLabel.Create(FInfo);
  FAuthor.Parent   := FInfo;
  FAuthor.AutoSize := False;
  FAuthor.Width    := Width - W - 30;
  FAuthor.Top      := 80;
  FAuthor.Left     := W + 10;

  //--------------------------------------------

  bvl                  := TRzBorder.Create(FInfo);
  bvl.Parent           := FInfo;
  bvl.BorderOuter      := fsFlatRounded;
  bvl.Align            := alBottom;
  bvl.Height           := 36;
  bvl.AlignWithMargins := True;

end;

procedure TMHLCoverPanel.SetAColor(Value: TColor);
begin
  FAColor     := Value;
  FText.Color := FAColor;
end;

procedure TMHLCoverPanel.Set_Fb2InfoVisible(Value: boolean);
begin
  FInfo.Visible   := Value;
  FFb2InfoVisible := Value;
end;

procedure TMHLCoverPanel.Set_FontSize(Value: integer);
begin
  FText.Font.Size := Value;
  FFontSize       := Value;
end;

function TMHLCoverPanel.Show(Folder, FileName: string; No: integer): boolean;
var
  FS: TMemoryStream;
begin
  if (Not Visible) or FOnProgress then Exit;

  FOnProgress := true;
  Result := False;
  Clear;

  FFolder := Folder;
  FFile := FileName;
  FNo:= No;

  FS := TMemoryStream.Create;
  try
    if UnPack(FS) then
    begin
      GetFb2Info(FS);
      Result := True;
    end
    else
      FOnProgress := False;
  finally
    FS.Free;
  end;
end;

function TMHLCoverPanel.UnPack(var FS: TMemoryStream): boolean;
var
  S : string;
begin
  Result := False;
  if ExtractFileExt(FFolder) = '.zip' then
  begin
    if not FileExists(FFolder) then
    begin
      FOnProgress := False;
      Exit;
    end;

    Zip := TZipForge.Create(nil);
    try
      Zip.FileName := FFolder;
      Zip.OpenArchive;
      s := GetFileNameZip(Zip,FNo);
      if ExtractFileExt(S) = '.fb2' then
      begin
        Zip.ExtractToStream(s,FS);
        Result := True;
      end;
    finally
      FOnProgress := False;
      Zip.Free;
    end;
  end
  else
    if ExtractFileExt(FFile) = '.zip' then
    begin

      Zip := TZipForge.Create(nil);
      try
        Zip.FileName := FFolder + FFile;
        Zip.OpenArchive;
        s := ChangeFileExt(FFile,'.fbd');
        Zip.ExtractToStream(S,FS);
        Result := True;
      finally
        FOnProgress := False;
        Zip.Free;
      end;
    end
    else
      if ExtractFileExt(FFile) = '.fb2' then
      try
        FS.LoadFromFile(FFolder + FFile);
        Result := True;
      finally
        FOnProgress := False;
      end;
end;

procedure TMHLCoverPanel.ShowEmptyCover;
begin
 { TODO : Временная заглушка; добавить отрисовку дефолтной обложки + название книги }
  FCover.Picture := nil;
end;

procedure TMHLCoverPanel.GetFb2Info;
var
  i: integer;
  S, outStr: AnsiString;
  CoverID, Short : string;
  ImgVisible: boolean;

  MS: TMemoryStream;
  IMG: TGraphic;

  EXT: string;
  StrLen: integer;
begin
  ImgVisible := False;
  try
    try
      MS := TMemoryStream.Create;
      FBook := LoadFictionBook(FS);
      if FBook.Description.Titleinfo.Coverpage.Count > 0 then
      begin
        CoverID := FBook.Description.Titleinfo.Coverpage.ImageList[0].xlinkHref;
        Delete(CoverID,1,1);
        for i := 0 to FBook.Binary.Count - 1 do
        begin
          if FBook.Binary.Items[i].Id = CoverID then
          begin
            S := FBook.Binary.Items[i].Text;
            outStr := DecodeBase64(S);

            StrLen := Length(outStr);
            MS.Write(PAnsiChar(outStr)^, StrLen);
            ImgVisible := True;
          end;
        end;
      end;
      with FBook.Description do
      begin
        if Titleinfo.Annotation.HasChildNodes then
          for I := 0 to Titleinfo.Annotation.ChildNodes.Count - 1 do
            Ftext.Lines.Add(Titleinfo.Annotation.ChildNodes[i].Text);
        if FFb2InfoVisible then
        begin
          Hint := '';

          FCity.Caption := Publishinfo.City.Text;
          FPublisher.Caption := Publishinfo.Publisher.Text;
          FYear.Caption := Publishinfo.Year;
          FISBN.Caption := Publishinfo.Isbn.Text;

          FDate.Caption := Documentinfo.Date.Text;
          FVersion.Caption := Documentinfo.Version;
          if Documentinfo.Author.Count > 0 then
             FAuthor.Caption := Documentinfo.Author.Items[0].Nickname.Text;
        end
        else
        begin
          Hint := 'Автор' + #13#10 +
          'Издатель: ' + Publishinfo.City.Text  + #13#10 +
          'Город :' + Publishinfo.City.Text;
        end;
      end;
    except
    end;
  finally
    if ImgVisible then
    begin
      Ext := LowerCase(ExtractFileExt(CoverID));
      try
        if Ext = '.png' then
             IMG := TPngImage.Create
        else
          if (Ext = '.jpg') or (Ext = '.jpeg') then
              IMG := TJPEGImage.Create;
        if Assigned(IMG) then
        begin
          MS.Seek(0,soFromBeginning);
          IMG.LoadFromStream(MS);
          FCover.Picture.Assign(IMG);
          FCover.Invalidate;
        end;
      finally
        IMG.Free;
      end;
    end
    else ShowEmptyCover;
    FText.Lines.Add(Short);
    FOnProgress := False;
    FText.SelStart := 0;
    FText.SelLength := 1;
    FText.SelLength := 0;
    MS.Free;
  end;
end;

procedure TMHLCoverPanel.Resize;
begin
  inherited;
  FVersion.Left  := Width - 47;
  FVerTitle.Left := Width - 60;

  FDate.Width   := FVerTitle.Left - FDate.Left - 5;
  FAuthor.Width := FInfo.Width - W - 17;
end;

end.
