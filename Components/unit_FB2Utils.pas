(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             19.02.2010
  * Description         набор функций для получения информации из файлов в формате fb2
  * Author(s)           Nick Rymanov     nrymanov@gmail.com
  *
  * History
  * NickR 19.02.2010    создан
  *
  ****************************************************************************** *)

unit unit_FB2Utils;

interface

uses
  Classes,
  Graphics,
  fictionbook_21;

function GetBookCover(book: IXMLFictionBook): TGraphic;

{ TODO -oNickR -cRefactoring : доделать эту функцию. Для этого необходимо вынести определение TBookRecord в доступное место }
// procedure GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);

implementation

uses
  SysUtils,
  unit_MHLHelpers,
  jpeg,
  pngimage;

function CreateImage(ext: string): TGraphic;
begin
  //
  // TODO -oNickR -cRefactoring : избавиться от привязки к расширению и определять формат изображения из стрима
  //
  Result := nil;

  ext := LowerCase(ext);
  if ext = '.png' then
  begin
    Result := TPngImage.Create;
  end
  else if (ext = '.jpg') or (ext = '.jpeg') then
  begin
    Result := TJPEGImage.Create;
  end;
end;

function GetBookCover(book: IXMLFictionBook): TGraphic;
var
  coverID: string;
  i: Integer;
  outStr: AnsiString;
  coverStream: TMemoryStream;
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

          coverStream := TMemoryStream.Create;
          try
            coverStream.Write(PAnsiChar(outStr)^, Length(outStr));
            /// MS.SaveToFile('C:\temp\' + CoverID);

            Result := CreateImage(ExtractFileExt(coverID));
            if Assigned(Result) then
            begin
              coverStream.Seek(0, soFromBeginning);
              Result.LoadFromStream(coverStream);
              Exit;
            end;
          finally
            coverStream.Free;
          end;

          Break;
        end;
      end;
    end;
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
