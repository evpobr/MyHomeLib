
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}


unit frm_book_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xmldom, XMLIntf, msxmldom, XMLDoc, ExtCtrls, RzPanel, RzButton,
  StdCtrls, RzLabel, RzEdit, ComCtrls, RzTabs;

type
  TfrmBookDetails = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    mmShort: TMemo;
    Img: TImage;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    btnLoadReview: TRzBitBtn;
    mmReview: TRzMemo;
    btnClearReview: TRzBitBtn;
    mmInfo: TRzRichEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure mmReviewChange(Sender: TObject);
    procedure btnLoadReviewClick(Sender: TObject);
    procedure btnClearReviewClick(Sender: TObject);
  private
    { Private declarations }
    FLibID : integer;

    FReviewChanged : boolean;
    function GetReview: string;
    procedure Setreview(const Value: string);

  public
    procedure AllowOnlineReview(ID: integer);
    procedure Download;

    procedure ShowBookInfo(FS: TMemoryStream);
    property Review: string read GetReview write Setreview;
    property ReviewChanged: boolean read FReviewChanged write FReviewChanged;
    property LibID: integer read FLibID;
    { Public declarations }
  end;

  TReviewDownloadThread = class(TThread)
  private
    { Private declarations }
    FId: integer;
    FForm: TfrmBookDetails;
    FReview : TStringList;

    procedure StartDownload;
    procedure Finish;
  protected
    procedure Execute; override;
    property Form: TfrmBookDetails read FForm write FForm;
  end;

  procedure DownloadReview(Form: TfrmBookDetails);

var
  frmBookDetails: TfrmBookDetails;

implementation

uses
  FictionBook_21,
  unit_globals,
  unit_Settings,
  unit_MHLHelpers,
  unit_ReviewParser,
  jpeg,
  pngimage,
  strutils;

const
  URL = 'http://lib.rus.ec/b/%d/';

{$R *.dfm}

procedure TfrmBookDetails.AllowOnlineReview(ID: integer);
begin
  FLibID := ID;

  btnLoadReview.Visible := True;
  btnClearReview.Visible := True;
end;

procedure TfrmBookDetails.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=27 then Close;
end;

procedure TfrmBookDetails.Download;
var
  reviewParser : TReviewParser;
  review : TStringList;
begin
  btnLoadReview.Enabled := False;

  reviewParser := TReviewParser.Create;
  review := TStringList.Create;
  Screen.Cursor := crHourGlass;
  try
    reviewParser.Parse(Format(url,[FLibID]), review);
    mmReview.Clear;
    mmReview.Lines.AddStrings(review);
    FReviewChanged := True;
  finally
    review.Free;
    reviewParser.Free;
    Screen.Cursor := crDefault;
    btnLoadReview.Enabled := True;
  end;
end;

function TfrmBookDetails.GetReview: string;
begin
  Result := mmReview.Lines.Text;
end;

procedure TfrmBookDetails.mmReviewChange(Sender: TObject);
begin
  FReviewChanged := True;
end;

procedure TfrmBookDetails.RzBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBookDetails.btnClearReviewClick(Sender: TObject);
begin
  mmReview.Clear;
  FReviewChanged := True;
end;

procedure TfrmBookDetails.btnLoadReviewClick(Sender: TObject);
begin
  Download;
end;

procedure TfrmBookDetails.Setreview(const Value: string);
begin
  mmReview.Lines.Text := Value;
end;

procedure TfrmBookDetails.ShowBookInfo(FS: TMemoryStream);
var
  book:IXMLFictionBook;
  i,p:integer;
  S, outStr: AnsiString;
  CoverID:String;
  Ext: string;

  ImgVisible : boolean;
  MS : TMemoryStream;

  TmpImg: TGraphic;

  StrLen : integer;
  ImageType: TCoverImageType;


  procedure WriteString(Title, Text: string);
  begin
    mmInfo.SelAttributes.Style := [fsBold];
    mmInfo.SetSelText(Title + ': ' + #9);
    mmInfo.SelAttributes.Style := [];
    if Text <> '' then mmInfo.SetSelText(Text);
    mmInfo.SetSelText(#13#10)
  end;


begin
  FReviewChanged := False;

  Img.Picture.Bitmap.Canvas.FrameRect(Img.ClientRect);
  mmInfo.Lines.Clear;
  mmShort.Lines.Clear;
  try
    book := LoadFictionbook(FS);
    try
      MS := TMemoryStream.Create;
      CoverID := Book.Description.Titleinfo.Coverpage.XML;
      p := pos('"#', CoverID);
      if p <> 0 then
      begin
        Delete(CoverId, 1, p + 1);
        p := pos('"', CoverID);
        CoverID := Copy(CoverID, 1, p - 1);
        for i := 0 to Book.Binary.Count - 1 do
        begin
          if Book.Binary.Items[i].Id = CoverID then
          begin
            S := Book.Binary.Items[i].Text;
            outStr := DecodeBase64(S);

            StrLen := Length(outStr);
            MS.Write(PAnsiChar(outStr)^, StrLen);
            ImgVisible := True;
          end;
        end;
        //MS.SaveToFile('E:\temp\' + CoverID);
      end;

      if ImgVisible then
      begin
        CreateImage(ExtractFileExt(CoverID), TmpImg, ImageType);
        if Assigned(TmpImg) then
        begin
          MS.Seek(0,soFromBeginning);
          TmpImg.LoadFromStream(MS);
          IMG.Picture.Assign(TmpImg);
          IMG.Invalidate;
          TmpImg.Free;
        end;
      end
      else
        IMG.Picture := nil;
    finally
      MS.Free;
    end;

    with Book.Description.Titleinfo do
    begin

      mmInfo.SelAttributes.Size := 10;
      mmInfo.SelAttributes.Style := [fsBold];

      if Author.Count>0 then
        mmInfo.SetSelText(Author[0].Lastname.Text+' '+Author[0].Firstname.Text+' '+Author[0].MiddleName.Text+#13#10);

      mmInfo.SelAttributes.Size := 12;
      mmInfo.SelAttributes.Color := clNavy;
      mmInfo.SetSelText(Booktitle.Text+#13#10);

      if Sequence.Count > 0 then
        WriteString('Серия',Sequence[0].Name);

      mmInfo.SetSelText(#13#10);
      WriteString('Жанр',IfThen(Genre.Count > 0, Genre[0], ''));
      WriteString('УДК', UDK);
      WriteString('ББК', BBK);
      WriteString('ГРНТИ', GRNTI);
      mmInfo.SetSelText(#13#10);

      WriteString('PublishInfo','');
      mmInfo.SetSelText('Изд-во: '+ #9 + Book.Description.Publishinfo.Publisher.Text+#13#10);
      mmInfo.SetSelText('Город: '+ #9 + Book.Description.Publishinfo.City.Text+#13#10);
      mmInfo.SetSelText('Год: '+ #9 + Book.Description.Publishinfo.Year+#13#10);
      mmInfo.SetSelText('ISBN: '+ #9 + Book.Description.Publishinfo.Isbn.Text+#13#10);
      mmInfo.SetSelText(#13#10);


      WriteString('DocumentInfo (OCR)','');
      mmInfo.SetSelText('Авторы: '+#13#10);
      for I := 0 to Book.Description.Documentinfo.Author.Count - 1 do
        with Book.Description.Documentinfo.Author.Items[i] do
            mmInfo.SetSelText(Firstname.Text + ' ' +Lastname.Text + '(' + NickName.Text + ')' + #13#10);
      mmInfo.SetSelText('');
      mmInfo.SetSelText('Программа: '+ Book.Description.Documentinfo.Programused.Text + #13#10);
      mmInfo.SetSelText('Дата: '+ #9 + Book.Description.Documentinfo.Date.Text + #13#10);
      mmInfo.SetSelText('ID: '+ #9 + Book.Description.Documentinfo.ID + #13#10);
      mmInfo.SetSelText('Version: '+ #9 + Book.Description.Documentinfo.Version + #13#10);
      mmInfo.SetSelText('History: '+ #9 + Book.Description.Documentinfo.History.P.Text + #13#10);

      for I := 0 to Annotation.P.Count - 1 do
              mmShort.SetSelText(Annotation.P.Items[i].Text);

    end;
  except
  end;
end;

{-------------------- TReviewDownloadThread -----------------------------------}

procedure TReviewDownloadThread.Execute;
var
  reviewParser : TReviewParser;
begin
  Synchronize(StartDownload);
  Freview := TStringList.Create;
  try
    reviewParser := TReviewParser.Create;
    try
      reviewParser.Parse(Format(url,[FId]), Freview);
    finally
      reviewParser.Free;
    end;
  finally
    Synchronize(Finish);
    FreeAndNil(FReview);
  end;
end;

procedure TReviewDownloadThread.Finish;
begin
  if FForm.mmReview = Nil then Exit; // FForm почему-то не равно nil после уничтожения.
                                     // зато компоненты обнуляются, поэтому проверям по ним

  FForm.mmReview.Clear;
  FForm.mmReview.Lines.AddStrings(Freview);
  FForm.btnLoadReview.Enabled := True;
  FForm.ReviewChanged := True;
  FForm.RzPageControl1.ActivePageIndex := 1;
end;

procedure TReviewDownloadThread.StartDownload;
begin
  FForm.btnLoadReview.Enabled := False;
end;

//------------------------------------------------------------------------------

procedure DownloadReview (Form: TfrmBookDetails) ;
var
  Worker : TReviewDownloadThread;
begin
  Worker := TReviewDownloadThread.Create(True);
  Worker.Form := Form;
  Worker.FId := Form.LibID;
  Worker.Priority := tpLower;
  Worker.FreeOnTerminate := True;
  Worker.Resume;
end;

end.
