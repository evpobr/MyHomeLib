
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
    mmInfo: TMemo;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    btnLoadReview: TRzBitBtn;
    mmReview: TRzMemo;
    btnClearReview: TRzBitBtn;
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
  pngimage;

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
begin
  FReviewChanged := False;

  Img.Picture.Bitmap.Canvas.FrameRect(Img.ClientRect);
  mmInfo.Lines.Clear;
  mmShort.Lines.Clear;
  try
    book:=LoadFictionbook(FS);
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
        Ext := LowerCase(ExtractFileExt(CoverID));
        try
          if Ext = '.png' then
             TmpImg := TPngImage.Create
          else
            if (Ext = '.jpg') or (Ext = '.jpeg') then
              TmpImg := TJPEGImage.Create;
          if Assigned(TmpImg) then
          begin
            MS.Seek(0,soFromBeginning);
            TmpImg.LoadFromStream(MS);
            IMG.Picture.Assign(TmpImg);
            IMG.Invalidate;
          end;
        finally
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
      mmInfo.Lines.Add('Description:');
      if Author.Count>0 then
        mmInfo.Lines.Add(Author[0].Lastname.Text+' '+Author[0].Firstname.Text);
      mmInfo.Lines.Add(Booktitle.Text);
      if Genre.Count>0 then mmInfo.Lines.Add('Жанр: '+Genre[0]);;
      if Sequence.Count>0 then
      begin
        mmInfo.Lines.Add('Серия: '+Sequence[0].Name);
//        mmInfo.Lines.Add('Номер: '+IntToStr(Sequence[0].Number));
      end;

     if Annotation.HasChildNodes then
          for I := 0 to Annotation.ChildNodes.Count - 1 do
            mmShort.Lines.Add(Annotation.ChildNodes[i].Text);

      mmInfo.Lines.Add('PublishInfo:');
      mmInfo.Lines.Add('Издатель: '+Book.Description.Publishinfo.Publisher.Text);
      mmInfo.Lines.Add('Город: '+Book.Description.Publishinfo.City.Text);
      mmInfo.Lines.Add('Год: '+Book.Description.Publishinfo.Year);
      mmInfo.Lines.Add('ISBN: '+Book.Description.Publishinfo.Isbn.Text);
      mmInfo.Lines.Add('DocumentInfo (OCR):');
      mmInfo.Lines.Add('Авторы: ');
      for I := 0 to Book.Description.Documentinfo.Author.Count - 1 do
        with Book.Description.Documentinfo.Author.Items[i] do
            mmInfo.Lines.Add(Firstname.Text + ' ' +Lastname.Text + '(' + NickName.Text + ')');
      mmInfo.Lines.Add('Программа: '+Book.Description.Documentinfo.Programused.Text);
      mmInfo.Lines.Add('Дата: '+Book.Description.Documentinfo.Date.Text);
      mmInfo.Lines.Add('ID: '+Book.Description.Documentinfo.ID);
      mmInfo.Lines.Add('Version: '+Book.Description.Documentinfo.Version);
//      mmInfo.Lines.Add('History: '+Book.Description.Documentinfo.History.P.OnlyText);
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
