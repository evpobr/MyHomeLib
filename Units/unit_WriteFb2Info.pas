(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             12.02.2010
  * Description         Запись в fb2info информации из базы
  * Author(s)           Matvienko Sergei  matv84@mail.ru
  *                     Aleksey Penkov  alex.penkov@gmail.com
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_WriteFb2Info;

interface

function WriteFb2InfoToFile(FileName: string): Boolean;

implementation

uses
  unit_globals,
  FictionBook_21,
  unit_Helpers,
  unit_Consts,
  unit_Settings,
  XMLDoc,
  SysUtils,
  unit_Templater,
  dm_Collection,
  Dialogs;

function WriteFb2InfoToFile(FileName: string): Boolean;
var
  R: TBookRecord;
  book: IXMLFictionBook;
  i: Integer;

  A: IXMLAuthorType;
  S: IXMLSequenceType;

  XML: TXmlDocument;

  TitleBook: string;

  Templater: TTemplater;
begin
  try
    DMCollection.GetCurrentBook(R);

    { TODO -oNickR -cBug : MEMLEAK проверить }
    XML := TXmlDocument.Create(FileName);

    XML.Active := True;
    book := GetFictionBook(XML);

    Templater := TTemplater.Create;
    try
      { DONE -oNickR -cBug : нет реакции на невалидный шаблон }
      if Templater.SetTemplate(Settings.BookHeaderTemplate, TpText) = ErFine then
        TitleBook := Templater.ParseString(R, TpText)
      else
      begin
        ShowMessage('Проверьте правильность шаблона');
        Exit;
      end;
    finally
      Templater.Free;
    end;

    with book.Description.Titleinfo do
    begin
      Author.Clear;
      for i := 0 to High(R.Authors) do
      begin
        A := Author.Add;
        A.Lastname.Text := R.Authors[i].Lastname;
        A.Firstname.Text := R.Authors[i].Firstname;
        A.Middlename.Text := R.Authors[i].Middlename;
      end;

      Booktitle.Text := TitleBook;

      Genre.Clear;
      for i := 0 to High(R.Genres) do
        Genre.Add(R.Genres[i].GenreFb2Code);

      if R.Series <> '' then
      begin
        try
          Sequence.Clear;
          S := Sequence.Add;

          S.Name := R.Series;
          S.Number := R.SeqNumber;
        except
        end;
      end;
    end;
    XML.SaveToFile;
  except

  end;
end;

end.
