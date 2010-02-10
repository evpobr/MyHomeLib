{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 1                                                                    }
{ 14.09.2009                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{               Matvienko Sergei  matv84@mail.ru                               }
{                                                                              }
{   Запись в fb2info информации из базы                                        }
{******************************************************************************}

unit unit_WriteFb2Info;

interface

  function WriteFb2InfoToFile(FileName: string):boolean;

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
  dm_Collection;

function WriteFb2InfoToFile(FileName: string):boolean;
var
  R: TBookRecord;
  book: IXMLFictionBook;
  i: integer;

  A : IXMLAuthorType;
  S : IXMLSequenceType;

  XML: TXmlDocument;

  TitleBook: String;

  Templater: TTemplater;
begin
  try
    DMCollection.GetCurrentBook(R);

    XML := TXmlDocument.Create(FileName);
    XML.Active := True;
    book := GetFictionBook(XML);

    Templater:= TTemplater.Create;
    try
      { TODO -oNickR -cBug : нет реакции на невалидный шаблон }
      if Templater.SetTemplate(Settings.BookHeaderTemplate, TpText) = ErFine then
        TitleBook := Templater.ParseString(R, TpText);
    finally
      Templater.Free;
    end;

    with Book.Description.Titleinfo do
    begin
      Author.Clear;
      for i := 0 to High(R.Authors) do
      begin
        A := Author.Add;
        A.Lastname.Text := R.Authors[i].LastName;
        A.Firstname.Text := R.Authors[i].FirstName;
        A.Middlename.Text := R.Authors[i].MiddleName;
      end;

      Booktitle.Text := TitleBook;

      Genre.Clear;
      for i := 0 to High(R.Genres) do
      begin
        Genre.Add(R.Genres[i].GenreFb2Code)
      end;

      if R.Series <> '' then
      begin
        try
          Sequence.Clear;
          S := Sequence.Add;

          S.Name := R.Series;
          S.Number := R.SeqNumber
        except
        end;
      end;
    end;
    XML.SaveToFile;
  except

  end;
end;

end.
