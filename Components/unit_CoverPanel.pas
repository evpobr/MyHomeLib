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
  ZipMstr,
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

    FPublisher, FCity, FYear, FISBN, FDate, FVersion, FAuthor: TLabel;

    Zip: TZipMaster;
    FBook: IXMLFictionBook;
    XML: TXMLDocument;

    FOnProgress: boolean;
    FFb2InfoVisible: boolean;
    FFontSize: integer;

    FFolder: string;
    FFile  : string;
    FWorkFile: string;

    FTmp : string;
    FNo: Integer;
    function DecodeBase64(const CinLine: Ansistring): Ansistring;
    function CheckSymbols(Input: string): string;
  protected
    { Protected declarations }
    function UnPack:boolean;
    procedure GetFb2Info;
    procedure ShowEmptyCover;
    procedure Set_Fb2InfoVisible(Value: boolean);
    procedure Set_FontSize(Value: integer);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear;

    function Show(Folder, FileName: string; No: integer):boolean;

  published
    { Published declarations }
    property TmpFolder:string read FTmp write FTmp;
    property Fb2InfoVisible:boolean read FFb2InfoVisible write Set_Fb2InfoVisible;
    property FontSize:integer read FFontSize write Set_FontSize;

  end;



implementation

uses
  Messages,
  Windows,
  xmldom;

{ TMHLCoverPanel }

procedure TMHLCoverPanel.Clear;
begin
  FCover.Picture := nil;
  FText.Clear;
  FPublisher.Caption := '';
  FCity.Caption := '';
  FYear.Caption := '';
  FISBN.Caption := '';
  FDate.Caption := '';
  FVersion.Caption := '';
  FAuthor.Caption := '';

  Refresh;
end;

constructor TMHLCoverPanel.Create(AOwner: TComponent);
var
  lbl: TLabel;
  bvl: TRzBorder;
begin
  inherited;
  Parent := AOwner as TWinControl;
  Align := alRight;
  AlignWithMargins := True;
  Caption := '';
  Width := 250;
  BorderInner := fsNone;
  BorderOuter := fsFlatRounded;
  ParentFont := False;
  Font.Size := 8;
  SizeBarWidth := 1;
  MarginMin := 150;


  FCover := TImage.Create(Self);
  FCover.Align := alTop;
  FCover.AlignWithMargins := True;
  FCover.Margins.Top := 5;
  FCover.Parent := Self;
  FCover.Height := 255;
  FCover.Center := True;
  FCover.Stretch:= True;
  FCover.Proportional := True;

  FText := TMemo.Create(Self);
  FText.Parent := Self;
  FText.AlignWithMargins := True;
  FText.Align := alClient;
  FText.ScrollBars := ssVertical;
  FText.ReadOnly := True;
  FText.TabStop := False;
  //-----------------------------

  FInfo := TPanel.Create(Self);
  FInfo.Parent := Self;
  FInfo.AlignWithMargins := True;
  FInfo.Align := alBottom;
  FInfo.Height := 100;
  FInfo.BevelOuter := bvNone;

  lbl := TLabel.Create(FInfo);
  lbl.Parent := FInfo;
  lbl.Caption := 'Изд-во:';
  lbl.Font.Style := [fsBold];
  lbl.Top := 0;
  lbl.Tag := 1;
  lbl.Left := 5;   lbl.Width := 50;
  lbl.Alignment := taRightJustify;

  lbl := TLabel.Create(FInfo);
  lbl.Parent := FInfo;
  lbl.Caption := 'Город:';
  lbl.Font.Style := [fsBold];
  lbl.Top := 15;
  lbl.Tag := 2;
  lbl.Left := 5;   lbl.Width := 50;
  lbl.Alignment := taRightJustify;
  

  lbl := TLabel.Create(FInfo);
  lbl.Parent := FInfo;
  lbl.Caption := 'Год:';
  lbl.Font.Style := [fsBold];
  lbl.Top := 30;
  lbl.Tag := 3;
  lbl.Left := 5;   lbl.Width := 50;
  lbl.Alignment := taRightJustify;


  lbl := TLabel.Create(FInfo);
  lbl.Parent := FInfo;
  lbl.Caption := 'ISBN:';
  lbl.Font.Style := [fsBold];
  lbl.Top := 45;
  lbl.Tag := 4;
  lbl.Left := 5;   lbl.Width := 50;
  lbl.Alignment := taRightJustify;


  lbl := TLabel.Create(FInfo);
  lbl.Parent := FInfo;
  lbl.Caption := 'Дата:';
  lbl.Font.Style := [fsBold];
  lbl.Top := 65;
  lbl.Tag := 5;
  lbl.Left := 5;   lbl.Width := 55;
  lbl.Alignment := taRightJustify;


  lbl := TLabel.Create(FInfo);
  lbl.Parent := FInfo;
  lbl.Caption := 'Версия:';
  lbl.Font.Style := [fsBold];
  lbl.Tag := 6;
  lbl.Top := 65; lbl.Left := 150;

  lbl := TLabel.Create(FInfo);
  lbl.Parent := FInfo;
  lbl.Caption := 'Автор:';
  lbl.Font.Style := [fsBold];
  lbl.Top := 80;
  lbl.Tag := 7;
  lbl.Left := 5;   lbl.Width := 55;
  lbl.Alignment := taRightJustify;


  //------------------------------

  FPublisher := TLabel.Create(FInfo);
  FPublisher.Parent := FInfo;
  FPublisher.Width := 180;
  FPublisher.Top := 0; FPublisher.Left := 60;

  FCity := TLabel.Create(FInfo);
  FCity.Parent := FInfo;
  FCity.Top := 15; FCity.Left := 60;

  FYear := TLabel.Create(FInfo);
  FYear.Parent := FInfo;
  FYear.Top := 30; FYear.Left := 60;

  FISBN := TLabel.Create(FInfo);
  FISBN.Parent := FInfo;
  FISBN.Top := 45; FISBN.Left := 60;
  FISBN.Width := 180;
  FISBN.AutoSize := False;

  FDate := TLabel.Create(FInfo);
  FDate.Parent := FInfo;
  FDate.Width := 65;
  FDate.Top := 65; FDate.Left := 65;

  FVersion := TLabel.Create(FInfo);
  FVersion.Parent := FInfo;
  FVersion.Top := 65; FVersion.Left := 200;

  FAuthor := TLabel.Create(FInfo);
  FAuthor.Parent := FInfo;
  FAuthor.Width := 180;
  FAuthor.Top := 80; FAuthor.Left := 65;

  //--------------------------------------------

  bvl := TRzBorder.Create(FInfo);
  bvl.Parent := FInfo;
  bvl.BorderOuter := fsFlatRounded;
  bvl.Align := alBottom;
  bvl.Height := 36;
  bvl.AlignWithMargins := True;

end;

procedure TMHLCoverPanel.Set_Fb2InfoVisible(Value: boolean);
begin
  FInfo.Visible := Value;
  FFb2InfoVisible := Value;
end;

procedure TMHLCoverPanel.Set_FontSize(Value: integer);
begin
  FText.Font.Size := Value;
  FFontSize := Value;
end;

function TMHLCoverPanel.Show(Folder, FileName: string; No: integer): boolean;
begin
  if (Not Visible) or FOnProgress  then Exit;

  FOnProgress := true;
  Clear;

  FFolder := Folder;
  FFile := FileName;
  FNo:= No;

  if UnPack then
    GetFb2Info
  else
    FOnProgress := False;
end;

function TMHLCoverPanel.UnPack: boolean;
var
  fs: TMemoryStream;

begin
  if ExtractFileExt(FFolder) = '.zip' then
  begin
    if not FileExists(FFolder) then
    begin
      FOnProgress := False;
      Result := False;
      Exit;
    end;

    Zip := TZipMaster.Create(nil);
    try
      Zip.ZipFileName := FFolder;
      Zip.ExtrBaseDir := FTmp;
      FFile := ZipDirEntry(Zip.ZipContents[FNo]^).FileName;
      FWorkFile := FTmp + Format('%.6d.fb2',[Random(999999)]);
      fs := Zip.ExtractFileToStream(FFile);
      fs.SaveToFile(FWorkFile);
    finally
      FOnProgress := False;
      Zip.Free;
    end;
  end
  else
    FWorkFile := FFolder + FFile;
  Result :=  FileExists(FWorkFile);
end;

function TMHLCoverPanel.DecodeBase64(const CinLine: Ansistring): Ansistring;
const
  RESULT_ERROR = -2;
var
  inLineIndex: Integer;
  c: AnsiChar;
  x: SmallInt;
  c4: Word;
  StoredC4: array[0..3] of SmallInt;
  InLineLength: Integer;
begin
  Result := '';
  inLineIndex := 1;
  c4 := 0;
  InLineLength := Length(CinLine);

  while inLineIndex <= InLineLength do
  begin
    while (inLineIndex <= InLineLength) and (c4 < 4) do
    begin
      c := CinLine[inLineIndex];
      case c of
        '+': x := 62;
        '/': x := 63;
        '0'..'9': x := Ord(c) - (Ord('0') - 52);
        '=': x := -1;
        'A'..'Z': x := Ord(c) - Ord('A');
        'a'..'z': x := Ord(c) - (Ord('a') - 26);
      else
        x := RESULT_ERROR;
      end;
      if x <> RESULT_ERROR then
      begin
        StoredC4[c4] := x;
        Inc(c4);
      end;
      Inc(inLineIndex);
    end;

    if c4 = 4 then
    begin
      c4 := 0;
      Result := Result + AnsiChar((StoredC4[0] shl 2) or (StoredC4[1] shr 4));
      if StoredC4[2] = -1 then
        Exit;
      Result := Result + AnsiChar((StoredC4[1] shl 4) or (StoredC4[2] shr 2));
      if StoredC4[3] = -1 then
        Exit;
      Result := Result + AnsiChar((StoredC4[2] shl 6) or (StoredC4[3]));
    end;
  end;
end;

function TMHLCoverPanel.CheckSymbols(Input: string): string;
const
  denied: set of char = ['<', '>', ':', '"', '/', '|', '*', '?'];

var
  s, conv: string;
  f: integer;
begin
  Conv := '';
  for f := 1 to length(input) do
  begin
    if Input[f] in denied then
      s := ' '
    else
      s := Input[f];
    Conv := Conv + s;
  end;
  result := conv;
end;

procedure TMHLCoverPanel.ShowEmptyCover;
begin
 { TODO : Временная заглушка; добавить отрисовку дефолтной обложки + название книги }
  FCover.Picture := nil;
end;


procedure TMHLCoverPanel.GetFb2Info;
var
  i, p: integer;
  S, outStr: String;
  F: TextFile;
  CoverID, ImgPath, Short, CoverFile: string;
  ImgVisible: boolean;

begin
  ImgVisible := False;
  try
    try
      XML := TXMLDocument.Create(nil);

      {$IFDEF DEBUG}
      XML.DOMVendor := DOMVendors.Find ('Open XML');
      {$ENDIF}

      XML.LoadFromFile(FWorkFile);
      Fbook := GetFictionbook(XML);

      CoverID := FBook.Description.Titleinfo.Coverpage.XML;
      p := pos('"#', CoverID);
      if p <> 0 then
      begin
        Delete(CoverId, 1, p + 1);
        p := pos('"', CoverID);
        CoverID := Copy(CoverID, 1, p - 1);
        CoverFile := IntToStr(Random(99999)) + CoverID;
        for i := 0 to FBook.Binary.Count - 1 do
        begin
          if FBook.Binary.Items[i].Id = CoverID then
          begin
            S := FBook.Binary.Items[i].Text;
            outStr := DecodeBase64(S);
            AssignFile(F, FTmp + CoverFile);
            Rewrite(F);
            Write(F, outStr);
            CloseFile(F);
            ImgVisible := True;
          end;
        end;
      end;
        ImgPath := FTmp + CoverFile;

      with FBook.Description do
      begin
        Short := Titleinfo.Annotation.P.OnlyText;
        if FFb2InfoVisible then
        begin
          FCity.Caption := Publishinfo.City.Text;
          FPublisher.Caption := Publishinfo.Publisher.Text;
          FYear.Caption := Publishinfo.Year;
          FISBN.Caption := Publishinfo.Isbn.Text;

          FDate.Caption := Documentinfo.Date.Text;
          FVersion.Caption := Documentinfo.Version;
          if Documentinfo.Author.Count > 0 then
             FAuthor.Caption := Documentinfo.Author.Items[0].Nickname.Text
        end;
      end;
    except
    end;
  finally
    if ImgVisible and FileExists(ImgPath) then
    try
      FCover.Picture.LoadFromFile(ImgPath);
      DeleteFile(PChar(ImgPath));
    except
    end
    else ShowEmptyCover;
    DeleteFile(PChar(FWorkFile));
    FText.Lines.Add(Short);

    Refresh;
    FOnProgress := False;

    FText.SelStart := 0;
    FText.SelLength := 1;
    FText.SelLength := 0;

    XML := nil;
  end;
end;

end.
