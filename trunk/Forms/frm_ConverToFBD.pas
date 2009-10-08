unit frm_ConverToFBD;

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
  StdCtrls,
  RzLabel,
  Mask,
  RzEdit,
  Buttons,
  ExtCtrls,
  RzPanel,
  fictionbook_21,
  dm_Collection,
  unit_Globals,
  XMLDoc,
  ImgList,
  RzButton;

type

  TfrmConvertToFBD = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    mmAnnotation: TMemo;
    btnSave: TBitBtn;
    RzGroupBox1: TRzGroupBox;
    edFirstName: TRzEdit;
    RzLabel2: TRzLabel;
    edMiddleName: TRzEdit;
    RzLabel3: TRzLabel;
    edLastName: TRzEdit;
    RzLabel8: TRzLabel;
    edNickName: TRzEdit;
    RzLabel9: TRzLabel;
    RzLabel1: TRzLabel;
    RzGroupBox2: TRzGroupBox;
    RzLabel4: TRzLabel;
    edISBN: TRzEdit;
    edPublisher: TRzEdit;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    edYear: TRzEdit;
    edCity: TRzEdit;
    RzLabel5: TRzLabel;
    ImageList1: TImageList;
    btnOpenBook: TRzBitBtn;
    lblAuthor: TRzLabel;
    lblTitle: TRzLabel;
    RzGroupBox3: TRzGroupBox;
    btnPasteCover: TRzBitBtn;
    FCover: TImage;
    btnLoad: TRzBitBtn;
    BitBtn1: TBitBtn;
    btnPrevious: TBitBtn;
    btnNext: TBitBtn;
    procedure btnPasteCoverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnOpenBookClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FLines: TStringList;
    FBD: IXMLFictionBook;

    FBookFileName: string;
    FFBDFileName: string;

    FBookRecord: TBookRecord;
    FFolder: string;
    FZipFileName: string;

    FXML : TXMLDocument;

    FImageType : TCoverImageType;
    FEditorMode: boolean;

    FAuto : boolean;
    FBusy : boolean;
    FTerminated: boolean;

    function MakeFBD:boolean;
    function CreateZip:boolean;
    procedure ChangeBookData;
    procedure ResizeImage;
    procedure PrepareForm;
    procedure LoadFBD;
    procedure SaveFBD;
    procedure EnableButtons(State: boolean);

  public
    { Public declarations }
    procedure AutoMode;
    property EditorMode: boolean read FEditorMode write FEditorMode;
  end;

var
  frmConvertToFBD: TfrmConvertToFBD;

implementation

uses
  EncdDecd,
  jpeg,
  pngimage,
  Clipbrd,
  frm_Main,
  ZipForge,
  dm_user,
  unit_Helpers,
  ActiveX,
  ComObj,
  unit_Consts,
  Dialogs;

{$R *.dfm}

procedure TfrmConvertToFBD.AutoMode;
var
  FirstID: integer;
begin
  FTerminated := False;
  Show;
  PrepareForm;
  btnNextClick(Self);
  FirstID := frmMain.LastActiveBookID;
  repeat
    btnNextClick(Self);
  until (FirstID = frmMain.LastActiveBookID) or FTerminated;
  Close;
end;

procedure TfrmConvertToFBD.BitBtn1Click(Sender: TObject);
begin
  FTerminated := True;
end;

procedure TfrmConvertToFBD.btnLoadClick(Sender: TObject);
var
  Input, Output: TMemoryStream;
  IMG: TGraphic;
  FileName: string;
begin
   if not GetFileName(fnOpenCoverImage,FileName) then Exit;

   Output := TMemoryStream.Create;
   Input := TMemoryStream.Create;

   Input.LoadFromFile(Filename);
   EncodeStream(Input, Output);

   FLines.Clear;
   Output.Seek(0,soFromBeginning);
   FLines.LoadFromStream(Output);

   try
     CreateImage(ExtractFileExt(Filename),IMG, FImageType);
     if Assigned(IMG) then
     begin
       Input.Seek(0,soFromBeginning);
       IMG.LoadFromStream(Input);
       FCover.Picture.Assign(IMG);
       FCover.Invalidate;
       //ResizeImage;
    end;
  finally
    IMG.Free;
    Output.Free;
    Input.Free;
  end;

end;

procedure TfrmConvertToFBD.btnOpenBookClick(Sender: TObject);
begin
  frmMain.tbtbnReadClick(Sender);
end;

procedure TfrmConvertToFBD.btnPasteCoverClick(Sender: TObject);
var
  s : string;
  Icon: TJPEGImage;
  Input, Output: TMemoryStream;
  IMG: TGraphic;
begin
 Output := TMemoryStream.Create;
 Input := TMemoryStream.Create;

 IMG := TJPEGImage.Create;
 try
   FCover.Picture.RegisterClipboardFormat(cf_BitMap,TPNGImage);
   FCover.Picture.RegisterClipboardFormat(cf_BitMap,TJPEGImage);
   FCover.Picture.Bitmap.LoadFromClipBoardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);

   ResizeImage;

   IMG.Assign(FCover.Picture.Bitmap);
   IMG.SaveToStream(Input);

   Input.Seek(0,soFromBeginning);
   EncodeStream(Input,Output);
   FLines.Clear;
   Output.Seek(0,soFromBeginning);
   FLines.LoadFromStream(Output);

   FImageType := itJPG;
 finally
   Output.Free;
   Input.Free;
   IMG.Free;
 end;
end;

procedure TfrmConvertToFBD.btnSaveClick(Sender: TObject);
begin
  if FBusy then Exit;

  SaveFBD;
  frmMain.Click;
  Modalresult := mrOk;
end;

procedure TfrmConvertToFBD.btnNextClick(Sender: TObject);
begin
  if FBusy then Exit;
  SaveFBD;
  frmMain.SelectNextBook(False,True);
  PrepareForm;
end;

procedure TfrmConvertToFBD.btnPreviousClick(Sender: TObject);
begin
  if FBusy then Exit;
  SaveFBD;
  frmMain.SelectNextBook(False, False);
  PrepareForm;
end;

procedure TfrmConvertToFBD.ChangeBookData;
begin
  DMCollection.ActiveTable.Edit;
  DMCollection.ActiveTable.FieldByName('Ext').Value := ExtractFileExt(FBookFilename);
  DMCollection.ActiveTable.FieldByName('FileName').Value := DMCollection.ActiveTable.FieldByName('FileName').Value + '.zip';
  DMCollection.ActiveTable.Post;
end;

function TfrmConvertToFBD.CreateZip:boolean;
var
  Zip: TZipForge;
    F: TZFArchiveItem;
begin
  Result := False;
  Zip := TZipForge.Create(nil);
  try
    zip.FileName := FZipFileName;
    zip.BaseDir := FFolder;
    if FEditorMode then
    begin
      zip.OpenArchive;
      zip.DeleteFiles(FFBDFileName);
      zip.AddFiles(FFBDFileName);
      DeleteFile(FFolder + FFBDFileName);
      Result := True;
    end
    else
    begin
      zip.OpenArchive(fmCreate);
      zip.AddFiles(FBookFileName);
      zip.AddFiles(FFBDFileName);

      if zip.FindFirst(FBookFileName,F) and
           zip.FindFirst(FFBDFileName,F)
      then
        try
          zip.TestFiles('*.*');
          Result := True;
          DeleteFile(FFolder + FFBDFileName);
          DeleteFile(FFolder + FBookFileName);
        except
        end; // if
      zip.CloseArchive;
    end;
  finally
    Zip.Free;
  end;
  if not Result then MessageDlg('Ошибка создания FBD! ', mtError, [mbOK], 0);
end;

procedure TfrmConvertToFBD.EnableButtons(State: boolean);
begin
  btnPrevious.Enabled := State;
  btnNext.Enabled     := State;
  btnSave.Enabled     := State;
end;

procedure TfrmConvertToFBD.FormCreate(Sender: TObject);
begin
  FLines := TStringList.Create;
end;

procedure TfrmConvertToFBD.FormDestroy(Sender: TObject);
begin
  FLines.Free;
end;

procedure TfrmConvertToFBD.FormShow(Sender: TObject);
begin
  PrepareForm;
end;

procedure TfrmConvertToFBD.LoadFBD;
var
  Zip: TZipForge;
  Input, Output: TMemoryStream;
  FBook: IXMLFictionBook;
  outStr: AnsiString;
  CoverID: string;
  i: integer;
  IMG: TGraphic;
  Ext: string;
begin
  Input := TMemoryStream.Create;
  try
    Zip := TZipForge.Create(nil);
    try
      Zip.FileName :=  FZipFileName;
      Zip.OpenArchive;
      Zip.ExtractToStream(FFBDFileName,Input);
    finally
      Zip.Free;
    end;
    FXML.LoadFromStream(Input);

    FBook := LoadFictionBook(Input);
    if FBook.Description.Titleinfo.Coverpage.Count > 0 then
    begin
      CoverID := FBook.Description.Titleinfo.Coverpage.ImageList[0].xlinkHref;
      Delete(CoverID,1,1);
      for i := 0 to FBook.Binary.Count - 1 do
        if FBook.Binary.Items[i].Id = CoverID then
        try
          Output := TMemoryStream.Create;
          FLines.Clear;
          Input.Clear;
          FLines.Text := FBook.Binary.Items[i].Text;
          FLines.SaveToStream(Output);
          Output.Seek(0,soFromBeginning);
          DecodeStream(Output,Input);

          CreateImage(ExtractFileExt(CoverID),IMG,FImageType);
          if Assigned(IMG) then
          begin
            Input.Seek(0,soFromBeginning);
            IMG.LoadFromStream(Input);
            FCover.Picture.Assign(IMG);
            FCover.Invalidate;
          end;
        finally
          IMG.Free;
          Output.Free;
        end; // for
    end;
    with FBook.Description do
    begin
      if Titleinfo.Annotation.HasChildNodes then
          for I := 0 to Titleinfo.Annotation.ChildNodes.Count - 1 do
              mmAnnotation.Lines.Add(Titleinfo.Annotation.ChildNodes[i].Text);

      edCity.Text := Publishinfo.City.Text;
      edPublisher.Text := Publishinfo.Publisher.Text;
      edYear.Text := Publishinfo.Year;
      edISBN.Text := Publishinfo.Isbn.Text;

      if Documentinfo.Author.Count > 0 then
             edNickName.Text := Documentinfo.Author.Items[0].Nickname.Text;
    end;
  finally
    Input.Free;
  end;
end;

function TfrmConvertToFBD.MakeFBD:boolean;
var
  A: IXMLAuthorType;
  S : IXMLSequenceType;
  Bin : IXMLBinary;
  C: IXMLImageType;
  MS: TMemoryStream;
  SL: TstringList;
  Str: string;
  i: integer;

  G: TGUID;
begin
  Result := False;
  MS := TMemoryStream.Create;
  SL := TStringList.Create;

  try
    FBD := GetFictionBook(FXML);

    FXML.Version := '1.0';
    FXML.Encoding := 'UTF-8';

    with FBD.Description.Titleinfo do
    begin
      Author.Clear;
      for i := 0 to High(FBookRecord.Authors) do
      begin
        A := Author.Add;
        A.Lastname.Text := FBookRecord.Authors[i].LastName;
        A.Firstname.Text :=FBookRecord.Authors[i].FirstName;
        A.Middlename.Text :=FBookRecord.Authors[i].MiddleName;
      end;

      Booktitle.Text := FBookRecord.Title;

      Annotation.Text := mmAnnotation.Text;
      Lang := FBookRecord.Lang;
      Keywords.Text := FBookRecord.KeyWords;

      Genre.Clear;
      for i := 0 to High(FBookRecord.Genres) do
        Genre.Add(FBookRecord.Genres[i].GenreFb2Code);

      if FBookRecord.Series <> '' then
      begin
        try
          Sequence.Clear;
          S := Sequence.Add;

          S.Name := FBookRecord.Series;
          S.Number := FBookRecord.SeqNumber
        except
        end;
      end;
    end; // with Description

    with FBD.Description do
    begin
      Publishinfo.Publisher.Text := edPublisher.Text;
      Publishinfo.City.Text := edCity.Text;
      Publishinfo.Year := edYear.Text;
      Publishinfo.Isbn.Text := edISBN.Text;
    end;

    with FBD.Description do
    begin
      Documentinfo.Author.Clear;
      A := Documentinfo.Author.Add;

      A.Firstname.Text := edFirstName.Text;
      A.Middlename.Text := edMiddleName.Text;
      A.LastName.Text := edLastName.Text;
      A.Nickname.Text := edNickName.Text;

      DocumentInfo.Programused.Text := 'MyHomeLib 1.6';
      DocumentInfo.Date.Text := DateToStr(Now);
      DocumentInfo.Version := '1.0';

      CoCreateGuid(G);
      DocumentInfo.Id := GUIDToString(G);
    end;

    if Length(FLines.Text) > 100 then
    begin
      FBD.Binary.Clear;
      Bin := FBD.Binary.Add;
      case FImageType of
        itPng: begin
                 Bin.Id := 'cover.png';
                 Bin.Contenttype := 'image/png';
               end ;
        itJPG: begin
                 Bin.Id := 'cover.jpg';
                 Bin.Contenttype := 'image/jpeg';
               end;
      end;
      Bin.Text := FLines.Text;
      FBD.Description.Titleinfo.Coverpage.Clear;
      C := FBD.Description.Titleinfo.Coverpage.Add;
    end;

    FXML.SaveToStream(MS);

  //----------------------------------------------------------------------------
  //                              костыли для XML
    MS.Seek(0,soFromBeginning);
    SL.LoadFromStream(MS);
    Str := SL.Text;
    StrReplace('<FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.0">',
             '<FictionBook xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.gribuser.ru/xml/fictionbook/2.0">',
             Str);

   case FImageType of
     itPng: StrReplace('<coverpage><image/></coverpage>',
                       '<coverpage><image xlink:href="#cover.png"/></coverpage>',Str);
     itJPG: StrReplace('<coverpage><image/></coverpage>',
                       '<coverpage><image xlink:href="#cover.jpg"/></coverpage>',Str);
   end;

    SL.Text := Str;
    //----------------------------------------------------------------------------
    SL.SaveToFile(FFolder + FFBDFileName);
    Result := True;
  finally
    SL.Free;
    MS.Free;
  end;
end;

procedure TfrmConvertToFBD.PrepareForm;
begin
  DMCollection.GetCurrentBook(FBookRecord);

  FLines.Clear;
  edPublisher.Clear; edCity.Clear; edISBN.Clear; edYear.Clear;
  mmAnnotation.Clear;
  FCover.Picture := nil;

  lblAuthor.Caption := FBookRecord.Authors[0].FLastName + ' ' +
                       FBookRecord.Authors[0].FFirstName;

  lblTitle.Caption := FBookRecord.Title;

  FXML := TXmlDocument.Create(Self);
  FXML.Active := True;

  FFolder := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder) + FBookRecord.Folder;

  if FEditorMode then
  begin
    FBookFileName := FBookrecord.FileName ;
    FFBDFilename := ChangeFileExt(FBookrecord.FileName, '.fbd');
    FZipFileName := FFolder + FBookrecord.FileName;
    LoadFBD;
  end
  else
  begin
    FBookFileName := FBookrecord.FileName + FBookrecord.FileExt;
    FFBDFilename := FBookrecord.FileName + '.fbd';
    FZipFileName := FFolder + FBookrecord.FileName + ZIP_EXTENSION;
  end;
end;

procedure TfrmConvertToFBD.ResizeImage;
const
  maxWidth = 300;
  maxHeight = 450;
var
  thumbnail : TBitmap;
  thumbRect : TRect;
begin
    // resize
   thumbnail := TBitmap.Create;
   thumbnail.Assign(FCover.Picture.Bitmap);
   try
     if (thumbnail.Width > maxWidth) and (thumbnail.Height > maxHeight)    then
     begin
       thumbRect.Left := 0;
       thumbRect.Top := 0;

        //proportional resize
       if thumbnail.Width > thumbnail.Height then
       begin
         thumbRect.Right := maxWidth;
         thumbRect.Bottom := (maxWidth * thumbnail.Height) div thumbnail.Width;
       end
       else
       begin
         thumbRect.Bottom := maxHeight;
         thumbRect.Right := (maxHeight * thumbnail.Width) div thumbnail.Height;
       end;
       thumbnail.Canvas.StretchDraw(thumbRect, thumbnail) ;
       //resize image
       thumbnail.Width := thumbRect.Right;
       thumbnail.Height := thumbRect.Bottom;

       //display in a TImage control
     end;
     FCover.Picture.Assign(thumbnail) ;
   finally
     thumbnail.Free;
   end;
end;

procedure TfrmConvertToFBD.SaveFBD;
begin
  EnableButtons(False);
  FBusy := True;
  Screen.Cursor := crHourGlass;
  try
    if MakeFBD then
     if CreateZip then
       if not FEditorMode then
         ChangeBookData;
  finally
    EnableButtons(True);
    Screen.Cursor := crDefault;
    FBusy := False;
  end;
end;

end.
