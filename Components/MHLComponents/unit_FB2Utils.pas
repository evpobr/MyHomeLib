(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov     nrymanov@gmail.com
  * Created             19.02.2010
  * Description         набор функций для получения информации из файлов в формате fb2
  *
  * $Id$
  *
  * History
  * NickR 19.02.2010    создан
  *       07.05.2010    Формат обложки определяется более точно (не на основании расширения).
  *
  ****************************************************************************** *)

unit unit_FB2Utils;

interface

uses
  Classes,
  Graphics,
  fictionbook_21;

function GetBookCoverStream(book: IXMLFictionBook): TStream;
function GetBookCover(book: IXMLFictionBook): TGraphic;
function GetBookAnnotation(book: IXMLFictionBook): string;

{ TODO -oNickR -cRefactoring : доделать эту функцию. Для этого необходимо вынести определение TBookRecord в доступное место }
// procedure GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);

implementation

uses
  Windows,
  SysUtils,
  ActiveX,
  UrlMon,
  unit_MHLHelpers,
  GIFImg,
  jpeg,
  pngimage;

function InternalGetBookCoverStream(book: IXMLFictionBook): TStream;
var
  coverID: string;
  i: Integer;
  outStr: AnsiString;
begin
  Result := nil;

  if book.Description.Titleinfo.Coverpage.Count > 0 then
  begin
    coverID := book.Description.Titleinfo.Coverpage[0].xlinkHref;
    if Pos('#', coverID) = 1 then
    begin
      // это локальная ссылка (начинается с #)
      coverID := Copy(coverID, 2, MaxInt);

      for i := 0 to book.Binary.Count - 1 do
      begin
        if book.Binary[i].Id = coverID then
        begin
          outStr := DecodeBase64(book.Binary[i].Text);

          Result := TMemoryStream.Create;
          try
            Result.Write(PAnsiChar(outStr)^, Length(outStr));
          except
            FreeAndNil(Result);
          end;
          Break;
        end;
      end;
    end;
  end;
end;

function IsSupportedImageFormat(StreamFormat: TStreamFormat): Boolean;
begin
  Result := StreamFormat in [sfBitmap, sfGif, sfJPEGImage, sfMetafile, sfPngImage, fsIcon];
end;

function InternalCreateGraphic(StreamFormat: TStreamFormat): TGraphic;
begin
  Assert(IsSupportedImageFormat(StreamFormat));
  Result := nil;

  case StreamFormat of
    sfBitmap: Result := Graphics.TBitmap.Create;
    sfGif: Result := TGIFImage.Create;
    sfJPEGImage: Result := TJPEGImage.Create;
    //sfTiff: ;
    sfPngImage: Result := TPngImage.Create;
    sfMetafile: Result := Graphics.TMetafile.Create;
    fsIcon: Result := Graphics.TIcon.Create;
  else
    Assert(False);
  end;
end;

function GetBookCoverStream(book: IXMLFictionBook): TStream;
var
  StreamFormat: TStreamFormat;
begin
  Result := InternalGetBookCoverStream(book);
  if Assigned(Result) then
  begin
    Result.Seek(0, soFromBeginning);
    StreamFormat := DetectStreamFormat(Result);
    if not IsSupportedImageFormat(StreamFormat) then
      FreeAndNil(Result);
  end;
end;

function GetBookCover(book: IXMLFictionBook): TGraphic;
var
  coverStream: TStream;
  StreamFormat: TStreamFormat;
begin
  Result := nil;

  coverStream := InternalGetBookCoverStream(book);
  if Assigned(coverStream) then
  try
    coverStream.Seek(0, soFromBeginning);
    StreamFormat := DetectStreamFormat(coverStream);
    if not IsSupportedImageFormat(StreamFormat) then
      Exit;

    Result := InternalCreateGraphic(StreamFormat);
    if Assigned(Result) then
    try
      coverStream.Seek(0, soFromBeginning);
      Result.LoadFromStream(coverStream);
    except
      FreeAndNil(Result);
    end;
  finally
    coverStream.Free;
  end;
end;

function GetBookAnnotation(book: IXMLFictionBook): string;
var
  i: Integer;
  sl: TStringList;
begin
  Result := '';

  sl := TStringList.Create;
  try
    with book.Description.Titleinfo do
    begin
      for i := 0 to Annotation.p.Count - 1 do
        sl.Add(Annotation.p[i].OnlyText);
    end;

    Result := sl.Text;
  finally
    sl.Free;
  end;
end;

{
procedure GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);
var
  i: Integer;
begin
  with book.Description.Titleinfo do
  begin
  for i := 0 to Author.Count - 1 do
  R.AddAuthor(Author[i].Lastname.Text, Author[i].Firstname.Text, Author[i].MiddleName.Text);

  if Booktitle.IsTextElement then
  R.Title := Booktitle.Text;

  for i := 0 to Genre.Count - 1 do
  R.AddGenreFB2('', Genre[i], '');

  R.Lang := Lang;
  R.KeyWords := KeyWords.Text;

  if Sequence.Count > 0 then
  begin
  try
  R.Series := Sequence[0].Name;
  R.SeqNumber := Sequence[0].Number;
  except
  end;
  end;

  for i := 0 to Annotation.P.Count - 1 do
  if Annotation.P[i].IsTextElement then
  R.Annotation := R.Annotation + #10#13 + Annotation.P[i].OnlyText;

  ///R.RootGenre:= Trim(FLibrary.GetTopGenreAlias(R.Genres[0].GenreFb2Code));
  end;
end;
}

end.
