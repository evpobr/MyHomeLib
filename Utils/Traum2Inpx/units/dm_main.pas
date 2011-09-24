unit dm_main;

interface

uses
  SysUtils, Classes, DB, ABSMain, ComCtrls, Forms, StdCtrls;

type
  TdmTraum = class(TDataModule)
    Database: TABSDatabase;
    tblAuthor: TABSTable;
    dsAuthors: TDataSource;
    dsBooks: TDataSource;
    tblBooks: TABSTable;
    dsSeries: TDataSource;
    tblSeries: TABSTable;
    tblGenres: TABSTable;
    dsGenres: TDataSource;
    tblGenresid: TIntegerField;
    tblGenrescode: TStringField;
    tblAuthorid: TIntegerField;
    tblAuthorFirstName: TStringField;
    tblAuthorMidName: TStringField;
    tblAuthorLastName: TStringField;
    tblAuthorlang: TStringField;
    tblAuthorseries: TIntegerField;
    tblBooksid: TIntegerField;
    tblBooksauthor: TIntegerField;
    tblBooksname: TStringField;
    tblBookslang: TStringField;
    tblBooksseries: TIntegerField;
    tblBooksnumber: TIntegerField;
    tblBookstransl: TStringField;
    tblBookspath: TStringField;
    tblBooksfname: TStringField;
    tblBookssize: TIntegerField;
    tblBooksadded: TStringField;
    tblBooksFileType: TStringField;
    tblSeriesid: TIntegerField;
    tblSeriesname: TStringField;
  private
    { Private declarations }
    FProgress : TProgressbar;
    Finfo: TLabel;
    function RecordToString: string;
  public
    { Public declarations }
    procedure ImportData(InputDir: string);
    procedure PrepareINP(Path: string);

    property Progress:TProgressbar write FProgress ;
    property Info:TLabel write FInfo;

    procedure Connect;
    procedure Disconnect;
  end;

var
  dmTraum: TdmTraum;

implementation

const

  dl = #9;

type

  TAuthorRecord = record
    id: integer;
    FirstName: string;
    MidName: string;
    LastName: string;
    lang: string;
    series: integer;
  end;

  TBookRecord = record
    id: integer;
    author: integer;
    name: string;
    lang: string;
    series: integer;
    number: integer;
    fname: string;
    path: string;
    ftype: string;
    size: integer;
    added: string;
  end;

  TSeriesRecord = record
    id: integer;
    name: string;
  end;



{$R *.dfm}

procedure GetSeriesRecord(S: string; out Rec: TSeriesRecord);
var
  p1, k : integer;
begin
  S := StringReplace(S, #4, '', [rfReplaceAll]);
  p1 := pos(dl, S);
  Rec.id := StrToInt(copy(S,1,p1 - 1));
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  Rec.name := copy(S,1,p1 - 1);
  delete(s, 1 , p1);
end;

procedure GetGenresRecord(S: string; out Rec: TSeriesRecord);
var
  p1, k : integer;
begin
  S := StringReplace(S, #4, '', [rfReplaceAll]);

  p1 := pos(dl, S);
  Rec.id := StrToInt(copy(S,1,p1 - 1));
  delete(s, 1 , p1);

  Rec.name := S;
end;

procedure GetAuthorRecord(S: string; out Rec: TAuthorRecord);
var
  p1, k : integer;
  name: string;
begin
  S := StringReplace(S, #4, '', [rfReplaceAll]);

  p1 := pos(dl, S);
  Rec.id := StrToInt(copy(S,1,p1 - 1));
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  name := copy(S,1,p1 - 1);
  delete(s, 1 , p1);

  p1 := pos(', ', name);

  if p1 <> 0 then
  begin
    Rec.LastName := copy(name,1,p1 - 1);
    delete(name, 1 , p1 + 1);
  end;

  p1 := pos('+', name);
  if p1 <> 0 then Delete(name, p1, Length(name));

  Rec.FirstName := name;


  p1 := pos(dl, S);
  Rec.midname := copy(S,1,p1 - 1);
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  Rec.lang := copy(S,1,p1 - 1);
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  delete(s, 1 , p1); //class

  p1 := pos(dl, S);
  delete(s, 1 , p1); //nbook

  Rec.series := StrToInt(s);
end;

procedure GetBookRecord(S: string; out Rec: TBookRecord);
var
  p1, k : integer;
  date: string;
begin
  S := StringReplace(S, #4, '', [rfReplaceAll]);
  p1 := pos(dl, S);
  Rec.id := StrToInt(copy(S,1,p1 - 1));
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  Rec.author := StrToInt(copy(S,1,p1 - 1));
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  Rec.name := copy(S,1,p1 - 1);
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  Rec.lang := copy(S,1,p1 - 1);
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  Rec.series := StrToInt(copy(S,1,p1 - 1));
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  Rec.number := StrToInt(copy(S,1,p1 - 1));
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  delete(s, 1 , p1); //year

  p1 := pos(dl, S);
  delete(s, 1 , p1); //transl

  p1 := pos(dl, S);
  Rec.path := copy(S,1,p1 - 1);
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  Rec.fname := copy(S,1,p1 - 1);
  delete(s, 1 , p1);

  p1 := pos(dl, S);
  Rec.size := StrToInt(copy(S,1,p1 - 1));
  delete(s, 1 , p1);

  Rec.Ftype := ExtractFileExt(Rec.fname);
  delete(Rec.Ftype, 1, 1);

  p1 := pos(dl, S);
  delete(s, 1 , p1); //asize

  p1 := pos(dl, S);
  date := copy(S,1,p1 - 1);
  delete(s, 1 , p1);

  Rec.added := copy(date, 1, 4) + '-' + copy(Date,5,2) + '-' + copy(date, 7,2);
end;

procedure TdmTraum.Connect;
begin
  Database.Connected := True;
  tblAuthor.Active := True;
  tblSeries.Active := True;
  tblGenres.Active := True;
  tblBooks.Active := True;
end;

procedure TdmTraum.Disconnect;
begin
  Database.Connected := False;
  tblAuthor.Active := False;
  tblSeries.Active := False;
  tblGenres.Active := False;
  tblBooks.Active := False;
end;

procedure TdmTraum.ImportData(InputDir: string);
var
  SL: TStringList;
  s: string;

  Author: TAuthorRecord;
  Book: TBookRecord;
  Series: TSeriesRecord;

  i, Max: integer;

begin
  try
    Disconnect;
    tblAuthor.EmptyTable;
    tblBooks.EmptyTable;
    tblSeries.EmptyTable;
    tblGenres.EmptyTable;
    Connect;

    SL := TStringList.Create;
    FInfo.Caption := 'Книги ...';
    SL.LoadFromFile(InputDir + 'book', TEncoding.GetEncoding('cp1251'));
    i := 0;
    for s in SL do
    begin

      GetBookRecord(S, Book);


      tblBooks.Insert;

      tblBooksId.Value := Book.id;
      tblBooksAuthor.Value := Book.author;
      tblBooksName.Value := Book.name;
      tblBooksLang.Value := Book.Lang;
      tblBooksSeries.Value := Book.series;
      tblBooksNumber.Value := Book.number;
      tblBooksPath.Value := Book.Path;
      tblBooksFname.Value := Book.Fname;
      tblBooksFileType.Value := Book.ftype;
      tblBooksSize.Value := Book.Size;
      tblBooksAdded.Value := Book.Added;

      tblBooks.Post;

      inc(i);
      if (i mod 100) = 0 then
      begin
        FProgress.Position := Round(i/SL.Count * 100);
        Application.ProcessMessages;
      end;

    end;


    SL.Clear;
    FInfo.Caption := 'Авторы ...';
    SL.LoadFromFile(InputDir + 'author', TEncoding.GetEncoding('cp1251'));
    i := 0;
    for s in SL do
    begin
      GetAuthorRecord(S, Author);
      tblBooks.FindKey([Author.Id]);

      tblAuthor.Insert;
      tblAuthorid.Value := Author.id;
      tblAuthorFirstName.Value := Author.FirstName;
      tblAuthorMidname.Value := Author.MidName;
      tblAuthorLastname.Value := Author.LastName;
      tblAuthorLang.Value := Author.Lang;
      tblAuthorSeries.Value := Author.Series;

      tblAuthor.Post;

      inc(i);
      if (i mod 100) = 0 then
      begin
        FProgress.Position := Round(i/SL.Count * 100);
        Application.ProcessMessages;
      end;
    end;

    SL.Clear;
    FInfo.Caption := 'Серии ...';
    SL.LoadFromFile(InputDir + 'series', TEncoding.GetEncoding('cp1251'));
    i := 0;
    tblBooks.IndexName := 'SeriesIDIndex';
    for s in SL do
    begin
      GetSeriesRecord(S, Series);
      tblBooks.FindKey([Series.Id]);

      tblSeries.Insert;
      tblSeriesid.Value := Series.id;
      tblSeriesName.Value := Series.Name;

      tblSeries.Post;

      inc(i);
      if (i mod 100) = 0 then
      begin
        FProgress.Position := Round(i/SL.Count * 100);
        Application.ProcessMessages;
      end;
    end;

    SL.Clear;
    FInfo.Caption := 'Жанры ...';
    SL.LoadFromFile(InputDir + 'booktags', TEncoding.GetEncoding('cp1251'));
    i := 0;
    tblBooks.IndexName := 'BookIDIndex';
    for s in SL do
    begin
      GetGenresRecord(S, Series);
      tblBooks.FindKey([Series.Id]);

      tblGenres.Insert;
      tblGenresid.Value := Series.id;
      tblGenresCode.Value := Series.Name;

      tblGenres.Post;

      inc(i);
      if (i mod 100) = 0 then
      begin
        FProgress.Position := Round(i/SL.Count * 100);
        Application.ProcessMessages;
      end;
    end;

  finally
    FreeAndNil(SL);
    FInfo.Caption := 'Импорт завершен';
    FProgress.Position := 0;
  end;
end;

function TdmTraum.RecordToString: string;
const
  c = #4;
var
  A: string;
  S: string;
  G: string;
  SN: string;

  ID: integer;
begin

  A := '';
  tblAuthor.First;
  while not tblAuthor.Eof do
  begin
    A := A + tblAuthorLastName.AsWideString + ',' + tblAuthorFirstName.AsWideString + ',' +
      tblAuthorMidName.AsWideString + ':';
    tblAuthor.Next;
  end;
  if A = ',,:' then
    A := 'неизвестный,автор,:';

  G := '';
  tblGenres.First;
  while not tblGenres.Eof do
  begin
    G := G + tblGenresCode.AsWideString + ':';
    tblGenres.Next;
  end;
  if G = ':' then
    G := 'other:';

  if tblSeries.RecordCount > 0 then
  begin
    S := copy(tblSeriesName.AsWideString, 1, 80);
    SN := tblBooksNumber.AsWideString;
  end
  else
  begin
    SN := '0';
    S := '';
  end;

  Result := A + c + // авторы
    trim(tblBooksName.AsWideString) + c + // название
    S + c + SN + c + // серия, номер
    G + c + // жанры
    tblBooksID.AsWideString + c + // LibID
    '0' + c + //insno
    tblBooksfname.AsWideString + '.zip' + c + // имя файла
    tblBookspath.AsWideString + c + // путь
    tblBooksfiletype.AsWideString + c + // тип
    tblBooksSize.AsWideString + c + // размер
    tblBooksLang.AsWideString + c + // Lang
    tblBooksAdded.AsWideString + c; // Date

  Result := StringReplace(Result, #10, '', [rfReplaceAll]);
  Result := StringReplace(Result, #13, '', [rfReplaceAll]);
end;

procedure TdmTraum.PrepareINP(Path: string);
var
  i, j, Max: Integer;
  S: string;
  Res: TStringList;

  procedure Compile;
  begin
    Res.Clear;
    tblBooks.Filtered := True;
    tblBooks.First;
    while not tblBooks.Eof do
    begin
      S := RecordToString;
      if S <> '' then
      begin
        Res.Add(S);
        inc(j);
      end;
      if (j mod 100) = 0 then
      begin
        FInfo.Caption := 'Добавленно ' + IntToStr(j);
        Application.ProcessMessages;
      end;
      tblBooks.Next;
    end;

  end;

begin
  j := 0;
  try
    Res := TStringList.Create;

    tblBooks.Filter := '`FileType`="fb2" and `Lang`="RU"';
    Compile;
    Res.SaveToFile(Path + 'books_fb2_ru.inp', TEncoding.UTF8);


    tblBooks.Filter := 'FileType="fb2" and Lang="EN"';
    Compile;
    Res.SaveToFile(Path + 'books_fb2_en.inp', TEncoding.UTF8);

    tblBooks.Filter := 'FileType<>"fb2" and Lang="RU"';
    Compile;
    Res.SaveToFile(Path + 'books_nonfb2_ru.inp', TEncoding.UTF8);

    tblBooks.Filter := 'FileType<>"fb2" and Lang="EN"';
    Compile;
    Res.SaveToFile(Path + 'books_nonfb2_en.inp', TEncoding.UTF8);

  finally
    Res.Free;
  end;
end;


end.
