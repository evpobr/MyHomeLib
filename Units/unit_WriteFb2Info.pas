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
uses dm_Collection;

  function WriteFb2InfoToFile(FileName: string):boolean;
  function TemplateText(ACollection: TDMCollection; Template: string): string;

implementation

uses
  unit_globals,
  FictionBook_21,
  unit_Helpers,
  unit_Consts,
  unit_Settings,
  XMLDoc,
  SysUtils;

function TemplateText(ACollection: TDMCollection; Template: string): string;
const mask_elements = 8;
type TElement = record
       name: string;
       BegBlock, EndBlock: integer;
     end;
     TMaskElement = record
       templ, value: string;
     end;
var BookHeader, AuthorName, FirstName, MiddleName, LastName: string;
    stack: array[1..10] of TElement;
    Elements: array[1..10] of TElement;
    MaskElements: array [1..mask_elements] of TMaskElement;
    i, j, StackPos, ElementPos: integer;
    TemplReady: boolean;
    R: TBookRecord;
begin
  ACollection.GetCurrentBook(R);

  { Формирование заголовка книги }
  MaskElements[1].templ:= 's';
  if R.Series <> NO_SERIES_TITLE then
    MaskElements[1].value:= R.Series
  else MaskElements[1].value:= '';

  MaskElements[2].templ:= 'n';
  if R.SeqNumber <> 0 then
    MaskElements[2].value:= IntToStr(R.SeqNumber)
  else MaskElements[2].value:= '';

  MaskElements[3].templ:= 't';
  MaskElements[3].value:= R.Title;

  MaskElements[4].templ:= 'f';
  AuthorName:= '';
  for i:= low(R.Authors) to high(R.Authors) do
  begin
    LastName:= R.Authors[i].FLastName;
    if R.Authors[i].FFirstName <> '' then
      FirstName:= ' ' + R.Authors[i].FFirstName[1] + '.';
    if R.Authors[i].FMiddleName <> '' then
      MiddleName:= ' ' + R.Authors[i].FMiddleName[1] + '.';
    AuthorName := AuthorName + LastName + FirstName + MiddleName;
    if i < high(R.Authors) then AuthorName:= AuthorName + ', ';
  end;
  MaskElements[4].value:= AuthorName;

  MaskElements[5].templ:= 'id';
  MaskElements[5].value:= IntToStr(R.LibID);

  MaskElements[6].templ:= 'g';
  for i := Low(R.Genres) to High(R.Genres) do
    MaskElements[6].value:= R.Genres[i].Alias + ' ';

  MaskElements[7].templ:= 'fl';
  MaskElements[7].value:= R.Authors[low(R.Authors)].FLastName[1];

  MaskElements[8].templ:= 'rg';
  MaskElements[8].value:= ACollection.GetRootGenre(R.LibID);

  BookHeader := Template;
  TemplReady:= false;
  while not(TemplReady) do
  begin
    TemplReady:= true;
    StackPos:= 0;
    ElementPos:= 0;
    i:= 1;
    while i <= Length(BookHeader) do
    begin
      if BookHeader[i]='[' then
      begin
        inc(StackPos);
        Stack[StackPos].BegBlock:= i;
        Stack[StackPos].name:= '';
      end;

      if BookHeader[i]='%' then
      begin
        inc(i);
        Stack[StackPos].name:= '';
        while CharInSet(BookHeader[i], ['a'..'z', 'A'..'Z']) do
        begin
          Stack[StackPos].name:= Stack[StackPos].name + BookHeader[i];
          inc(i);
        end;

        if StackPos <= 0 then
        begin
          inc(ElementPos);
          Elements[ElementPos].name:= Stack[StackPos].name;
          Elements[ElementPos].BegBlock:= 0;
          Elements[ElementPos].EndBlock:= 0;
        end;
      end;

      if BookHeader[i]=']' then
      begin
        Stack[StackPos].EndBlock:= i;

        inc(ElementPos);
        Elements[ElementPos].name:= Stack[StackPos].name;
        Elements[ElementPos].BegBlock:= Stack[StackPos].BegBlock;
        Elements[ElementPos].EndBlock:= Stack[StackPos].EndBlock;

        dec(StackPos);
      end;

      inc(i);
    end;

    for i := 1 to mask_elements do
    begin
      for j := 1 to ElementPos do
        if (Elements[j].name = MaskElements[i].templ) and
           (MaskElements[i].value = '') then
        begin
          if (Elements[j].BegBlock <> 0) and (Elements[j].EndBlock <> 0) then
          begin
            Delete(BookHeader, Elements[j].BegBlock,
                               Elements[j].EndBlock - Elements[j].BegBlock + 1);
            TemplReady := false;
            break;
          end;
        end;
      if not(TemplReady) then
        break;
    end;
  end;

  TemplReady := false;
  while not(TemplReady) do
  begin
    TemplReady := true;
    i:= PosChr('[', BookHeader);
    if i<>0 then
    begin
      Delete(BookHeader, i, 1);
      TemplReady := false;
    end;
    i:= PosChr(']', BookHeader);
    if i<>0 then
    begin
      Delete(BookHeader, i, 1);
      TemplReady := false;
    end;
  end;

  for i := 1 to mask_elements do
    StrReplace('%'+MaskElements[i].templ, MaskElements[i].value, BookHeader);

  Result:= BookHeader;
end;

function WriteFb2InfoToFile(FileName: string):boolean;
var
  R: TBookRecord;
  book: IXMLFictionBook;
  i: integer;

  A : IXMLAuthorType;
  S : IXMLSequenceType;

  XML: TXmlDocument;

  TitleBook: String;
begin
  try
    DMCollection.GetCurrentBook(R);

    XML := TXmlDocument.Create(FileName);
    XML.Active := True;
    book := GetFictionBook(XML);

    TitleBook:= TemplateText(DMCollection, Settings.BookHeaderTemplate);

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
