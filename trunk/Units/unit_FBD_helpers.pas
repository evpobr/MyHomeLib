unit unit_FBD_helpers;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  fictionbook_21,
  unit_Globals,
  ExtCtrls,
  pngimage,
  jpeg,
  StdCtrls;

type

  TFBDRecord = record
                 First, Last, Middle, Nick: string;
                 Publisher, City, Year, ISBN, UDK,BBK, GRNTI: string;
                 cover: string;
                 ImageType:TCoverImageType;
              end;


  procedure GetFBDFileNames(Arch: string; out Description: string);
  procedure ResizeImage(var Cover: TImage);
  procedure CoverFromClpbrd(var Cover: TImage;
                            out CoverStr: string;
                            out ImageType:TCoverImageType);

  function PrepareFBDFile(BookRecord: TBookRecord;
                          FBDRecord: TFBDRecord;
                          memo: TMemo;
                          FileName: string):boolean;

  procedure LoadCoverFromFile(Cover: TImage;
                              out CoverStr: string;
                              out ImageType: TCoverImageType);

  procedure LoadFBDFromFile(FileName : string;
                            out FBD: TFBDRecord;
                            out Cover: TImage;
                            out memo: TMemo);

  function CreateZip(ZipFilename,
                     Folder,
                     BookFileName,
                     FBDFileName: string;
                     EditorMode: boolean
                     ):boolean;

implementation

uses
  ZipForge,
  ClipBrd,
  EncdDecd,
  ActiveX,
  unit_Helpers,
  Dialogs,
  XMLDoc,
  XMLIntf;

function PrepareFBDFile(BookRecord: TBookRecord;
                         FBDRecord: TFBDRecord;
                         memo: TMemo;
                         FileName: string):boolean;
var
  A: IXMLAuthorType;
  S : IXMLSequenceType;
  Bin : IXMLBinary;
  C: IXMLImageType;
  P: IXMLPType;
  MS: TMemoryStream;
  SL: TstringList;
  Str: string;
  i: integer;

  G: TGUID;

  AText: string;
  XML : TXMLDocument;
  FBD: IXMLFictionBook;

begin
  Result := False;
  MS := TMemoryStream.Create;
  SL := TStringList.Create;
  XML := TXMLDocument.Create(nil);
  try
    FBD := GetFictionBook(XML);
    XML.Version := '1.0';
    XML.Encoding := 'UTF-8';

    XML.Options := XML.Options + [doNodeAutoIndent];

    if FBD.Attributes['xmlns:xlink'] = Null  then
        FBD.Attributes['xmlns:xlink']:='http://www.w3.org/1999/xlink';

    with FBD.Description.Titleinfo do
    begin
      Author.Clear;
      for i := 0 to High(BookRecord.Authors) do
      begin
        A := Author.Add;
        A.Lastname.Text := BookRecord.Authors[i].LastName;
        A.Firstname.Text :=BookRecord.Authors[i].FirstName;
        A.Middlename.Text :=BookRecord.Authors[i].MiddleName;
      end;

      Booktitle.Text := BookRecord.Title;

      Annotation.ChildNodes.Clear;
      for I := 0 to memo.Lines.Count - 1 do
      begin
        Str := memo.Lines[i];
        StrReplace(#10,'',str);
        P := Annotation.P.Add;
        P.Text := Str;
      end;

      UDK := FBDRecord.UDK;
      BBK := FBDRecord.BBK;
      GRNTI := FBDRecord.GRNTI;

      Lang := BookRecord.Lang;
      Keywords.Text := BookRecord.KeyWords;

      Genre.Clear;
      for i := 0 to High(BookRecord.Genres) do
        Genre.Add(BookRecord.Genres[i].GenreFb2Code);

      if BookRecord.Series <> '' then
      begin
        try
          Sequence.Clear;
          S := Sequence.Add;

          S.Name := BookRecord.Series;
          S.Number := BookRecord.SeqNumber
        except
        end;
      end;
    end; // with Description

    with FBD.Description do
    begin
      Publishinfo.Publisher.Text := FBDRecord.Publisher;
      Publishinfo.City.Text := FBDRecord.City;
      Publishinfo.Year := FBDRecord.Year;
      Publishinfo.Isbn.Text := FBDRecord.ISBN;
    end;

    with FBD.Description do
    begin
      Documentinfo.Author.Clear;
      A := Documentinfo.Author.Add;

      A.Firstname.Text := FBDRecord.First;
      A.Middlename.Text := FBDRecord.Middle;
      A.LastName.Text := FBDRecord.Last;
      A.Nickname.Text := FBDRecord.Nick;

      DocumentInfo.Programused.Text := 'MyHomeLib 1.6';
      DocumentInfo.Date.Text := DateToStr(Now);
      DocumentInfo.Version := '1.0';

      CoCreateGuid(G);
      DocumentInfo.Id := GUIDToString(G);
    end;

    if FBDRecord.Cover <> '' then
    begin
      FBD.Binary.Clear;
      Bin := FBD.Binary.Add;

      FBD.Description.Titleinfo.Coverpage.Clear;
      C := FBD.Description.Titleinfo.Coverpage.Add;

      case FBDRecord.ImageType of
        itPng: begin
                 Bin.Id := 'cover.png';
                 C.xlinkHref := '#cover.png';
                 Bin.Contenttype := 'image/png';
               end ;
        itJPG: begin
                 Bin.Id := 'cover.jpg';
                 C.xlinkHref := '#cover.jpg';
                 Bin.Contenttype := 'image/jpeg';
               end;
      end;
      Bin.Text := FBDRecord.Cover;
    end;

    XML.SaveToFile(FileName);
    Result := True;
  finally
    SL.Free;
    MS.Free;
  end;
end;

procedure LoadCoverFromFile(Cover: TImage; out CoverStr: string; out ImageType: TCoverImageType);
var
  Input, Output: TMemoryStream;
  IMG: TGraphic;
  FileName: string;
  Lines: TStringList;
begin
   if not GetFileName(fnOpenCoverImage,FileName) then Exit;

   Output := TMemoryStream.Create;
   Input := TMemoryStream.Create;
   Lines := TStringList.Create;
   try
     Input.LoadFromFile(Filename);
     EncodeStream(Input, Output);

     Lines.Clear;
     Output.Seek(0,soFromBeginning);
     Lines.LoadFromStream(Output);

     CoverStr := Lines.Text;

     try
       CreateImage(ExtractFileExt(Filename),IMG, ImageType);
       if Assigned(IMG) then
       begin
         Input.Seek(0,soFromBeginning);
         IMG.LoadFromStream(Input);
         Cover.Picture.Assign(IMG);
         Cover.Invalidate;
         //ResizeImage;
      end;
     finally
       IMG.Free;
     end;
   finally
     Output.Free;
     Input.Free;
     Lines.Free;
   end;
end;

function CreateZip(ZipFilename, Folder, BookFileName, FBDFileName: string; EditorMode: boolean):boolean;
var
  Zip: TZipForge;
    F: TZFArchiveItem;
begin
  Result := False;
  Zip := TZipForge.Create(nil);
  try
    zip.FileName := ZipFileName;
    zip.BaseDir := Folder;
    if EditorMode then
    begin
      zip.OpenArchive;
      zip.DeleteFiles(FBDFileName);
      zip.AddFiles(FBDFileName);
      DeleteFile(Folder + FBDFileName);
      Result := True;
    end
    else
    begin
      zip.OpenArchive(fmCreate);
      zip.AddFiles(BookFileName);
      zip.AddFiles(FBDFileName);

      if zip.FindFirst(BookFileName,F) and
           zip.FindFirst(FBDFileName,F)
      then
        try
          zip.TestFiles('*.*');
          Result := True;
          DeleteFile(Folder + FBDFileName);
          DeleteFile(Folder + BookFileName);
        except
        end; // if
      zip.CloseArchive;
    end;
  finally
    Zip.Free;
  end;
  if not Result then MessageDlg('Ошибка создания FBD! ', mtError, [mbOK], 0);
end;



procedure LoadFBDFromFile(FileName : string; out FBD: TFBDRecord; out Cover: TImage; out memo: TMemo);
var
  Zip: TZipForge;
  Input, Output: TMemoryStream;
  FBook: IXMLFictionBook;
  outStr: AnsiString;
  CoverID: string;
  i: integer;
  IMG: TGraphic;
  Ext: string;

  XML: TXMLDocument;
  F: TZFArchiveItem;
  Lines: TStringList;
begin
  Input := TMemoryStream.Create;
  XML := TXMLDocument.Create(nil);
  Lines := TstringList.Create;
  try
    Zip := TZipForge.Create(nil);
    try
      Zip.FileName :=  FileName;
      Zip.OpenArchive;
      Zip.FindFirst('*.fbd',F);
      Zip.ExtractToStream(F.FileName,Input);
    finally
      Zip.Free;
    end;

    XML.LoadFromStream(Input);

    FBook := LoadFictionBook(Input);
    if FBook.Description.Titleinfo.Coverpage.Count > 0 then
    begin
      CoverID := FBook.Description.Titleinfo.Coverpage.ImageList[0].xlinkHref;
      Delete(CoverID,1,1);
      for i := 0 to FBook.Binary.Count - 1 do
        if FBook.Binary.Items[i].Id = CoverID then
        try
          Output := TMemoryStream.Create;
          Lines.Clear;
          Input.Clear;
          Lines.Text := FBook.Binary.Items[i].Text;
          FBD.cover :=  FBook.Binary.Items[i].Text;

          Lines.SaveToStream(Output);

          Output.Seek(0,soFromBeginning);
          DecodeStream(Output,Input);

          CreateImage(ExtractFileExt(CoverID),IMG,FBD.ImageType);
          if Assigned(IMG) then
          begin
            Input.Seek(0,soFromBeginning);
            IMG.LoadFromStream(Input);
            Cover.Picture.Assign(IMG);
            Cover.Invalidate;
          end;
        finally
          IMG.Free;
          Output.Free;
        end; // for
    end;

    with FBook.Description.Titleinfo do
    begin
      FBD.UDK := UDK;
      FBD.BBK := BBK;
      FBD.GRNTI := GRNTI;
    end;

    with FBook.Description do
    begin
      memo.Clear;

      if Titleinfo.Annotation.P.Count <> 0 then
        for I := 0 to Titleinfo.Annotation.P.Count - 1 do
          memo.Lines.Add(Titleinfo.Annotation.P.Items[i].Text)
      else
        for I := 0 to Titleinfo.Annotation.ChildNodes.Count - 1 do
           memo.Lines.Add(Titleinfo.Annotation.ChildNodes[i].Text);

      FBD.City:= Publishinfo.City.Text;
      FBD.Publisher := Publishinfo.Publisher.Text;
      FBD.Year := Publishinfo.Year;
      FBD.ISBN := Publishinfo.Isbn.Text;

      if Documentinfo.Author.Count > 0 then
             FBD.Nick := Documentinfo.Author.Items[0].Nickname.Text;
    end;
  finally
    Input.Free;
    Lines.Free;
  end;
end;

procedure CoverFromClpbrd(var Cover: TImage; out CoverStr: string; out ImageType:TCoverImageType);
var
  s : string;
  Icon: TJPEGImage;
  Input, Output: TMemoryStream;
  IMG: TGraphic;
  Lines : TStringList;
begin
 Output := TMemoryStream.Create;
 Input := TMemoryStream.Create;
 Lines := TStringList.Create;
 IMG := TJPEGImage.Create;
 try
   Cover.Picture.RegisterClipboardFormat(cf_BitMap,TPNGImage);
   Cover.Picture.RegisterClipboardFormat(cf_BitMap,TJPEGImage);
   Cover.Picture.Bitmap.LoadFromClipBoardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);

   ResizeImage(Cover);

   IMG.Assign(Cover.Picture.Bitmap);
   IMG.SaveToStream(Input);

   Input.Seek(0,soFromBeginning);
   EncodeStream(Input,Output);
   Lines.Clear;
   Output.Seek(0,soFromBeginning);
   Lines.LoadFromStream(Output);
   CoverStr := Lines.Text;

   ImageType := itJPG;
 finally
   Output.Free;
   Input.Free;
   IMG.Free;
   Lines.Free
 end;
end;

procedure ResizeImage(var Cover: TImage);
const
  maxWidth = 300;
  maxHeight = 450;
var
  thumbnail : TBitmap;
  thumbRect : TRect;
begin
    // resize
   thumbnail := TBitmap.Create;
   thumbnail.Assign(Cover.Picture.Bitmap);
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
     Cover.Picture.Assign(thumbnail) ;
   finally
     thumbnail.Free;
   end;
end;

procedure GetFBDFileNames(Arch: string; out Description: string);
var
  F: TZFArchiveItem;
  Zip: TZipForge;
begin
  Zip := TZipForge.Create(Nil);
  try
    Zip.FileName := Arch;
    Zip.OpenArchive;

    zip.FindFirst('*.fbd',F);
    Description := F.FileName;

  finally
    Zip.Free;
  end;
end;

end.
