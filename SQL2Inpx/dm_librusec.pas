unit dm_librusec;

interface

uses
  SysUtils, Classes, DB, DBAccess, MyAccess, MemDS, MyEmbConnection;

type
  TLib = class(TDataModule)
    Connection: TMyConnection;
    dsBook: TMyDataSource;
    dsAvtorname: TMyDataSource;
    dsGenrelist: TMyDataSource;
    dsSeqname: TMyDataSource;
    Avtor: TMyQuery;
    Genre: TMyQuery;
    Series: TMyQuery;
    GenreGenreCode: TWideStringField;
    SeriesSeqName: TWideStringField;
    SeriesSeqNumb: TIntegerField;
    AvtorLastName: TWideStringField;
    AvtorFirstName: TWideStringField;
    AvtorMiddleName: TWideStringField;
    Book: TMyQuery;
    BookBookId: TLargeintField;
    BookTitle: TWideStringField;
    BookFileSize: TLargeintField;
    BookFileType: TWideStringField;
    BookDeleted: TWideStringField;
    BookTime: TDateTimeField;
    BookLang: TWideStringField;
    BookN: TLargeintField;
    Bookkeywords: TWideStringField;
    Query: TMyQuery;
    procedure BookAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    procedure QueryAvtor(BookID: integer);
    procedure QueryGenre(BookID: integer);
    procedure QuerySeries(BookID: integer);
    function  QueryRate(BookID: integer):string;
  public
    { Public declarations }
    function GetBookRecord(BookID: integer; fb2only: boolean = false): string; overload;
    function GetBookRecord(FN: string; fb2only: boolean = false): string; overload;
    function RecordToString(FN: string = ''):string ;
    function LastBookID: integer;
  end;

var
  Lib: TLib;

implementation
uses
  MemData ;

{$R *.dfm}

procedure TLib.BookAfterScroll(DataSet: TDataSet);
begin
  QueryAvtor(Lib.BookBookId.Value);
  QueryGenre(Lib.BookBookId.Value);
  QuerySeries(Lib.BookBookId.Value);
end;

function TLib.GetBookRecord(FN: string; fb2only: boolean): string;
var
  Query : string;
begin
  Query := 'SELECT B.BookId, B.Title, B.FileSize, B.FileType, B.Deleted, B.Time, B.Lang, B.N, B.KeyWords, F.FileName FROM libbook B, libfilename F WHERE B.BookId = F.BookID AND F.FileName = "' + FN + '"';

  Book.SQL.Text := Query;
  Book.Execute;
//  if Book.RecordCount = 0 then
//  begin
//    Result := '';
//    Exit;
//  end;
  QueryAvtor(Lib.BookBookId.Value);
  QueryGenre(Lib.BookBookId.Value);
  QuerySeries(Lib.BookBookId.Value);
  Result := RecordToString(FN);
end;

function TLib.LastBookID: integer;
var
  Count : integer;
begin
  Query.SQL.Text := 'Select Count(*) From libbook';
  Query.Execute;
  Count := Query.Fields[0].AsInteger;
  Book.SQL.Text := 'SELECT * FROM `libbook` LIMIT ' +  IntToStr(Count - 1) +  ', 1';
  Book.Execute;
  Result := BookBookID.Value;
end;

function TLib.GetBookRecord(BookID: integer; fb2only: boolean = false): string;
var
  Query : string;
begin
  if fb2only then
       Query := 'SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`keywords` FROM libbook WHERE FileType = "fb2" and BookId= ' + IntToStr(BookID)
     else
       Query := 'SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`keywords` FROM libbook WHERE  BookId= ' + IntToStr(BookID);

  Book.SQL.Text := Query;
  Book.Execute;
  if Book.RecordCount = 0 then
  begin
    Result := '';
    Exit;
  end;
  QueryAvtor(Lib.BookBookId.Value);
  QueryGenre(Lib.BookBookId.Value);
  QuerySeries(Lib.BookBookId.Value);
  Result := RecordToString;
end;

procedure TLib.QueryAvtor(BookID: integer);
begin
  Avtor.SQL.Text := 'select an.LastName, an.FirstName, an.MiddleName from' + #10 +
                    '(libavtor ba left outer join libavtoraliase aa on aa.badid = ba.avtorid)' + #10 +
                    'join libavtorname an on an.avtorid = COALESCE(aa.goodid, ba.avtorid) ' + #10 +
                    'WHERE  ba.bookid = ' + IntToStr(BookID);

  Avtor.Execute;
end;

procedure TLib.QueryGenre(BookID: integer);
begin
  Genre.SQL.Text := 'SELECT G.GenreCode  FROM libgenrelist G, libgenre GL' + #10 +
                    'WHERE GL.BookID = '+ IntToStr(BookID)  + #10 +
                    'AND G.GenreID = GL.GenreId' ;
  Genre.Execute;
end;

function TLib.QueryRate(BookID: integer): string;
begin
  Query.SQL.Text := 'SELECT AVG(Rate) FROM Librate WHERE BookID = ' + IntToStr(BookID);
  Query.Execute;
  if Query.Fields[0].AsInteger <> 0 then
     Result := Query.Fields[0].AsWideString
   else
     Result := '';
end;

procedure TLib.QuerySeries(BookID: integer);
begin
  Series.SQL.Text := 'SELECT S.SeqName, SL.SeqNumb FROM libseqname S, libseq SL' + #10 +
                    'Where SL.BookID = '+ IntToStr(BookID)  + #10 +
                    'AND S.SeqID = SL.SeqId';
  Series.Execute;
end;

function TLib.RecordToString(FN: string = ''): string;
const
  c = #4;
var
  A: string;
  S: string;
  G: string;
  SN: string;
  Del: string;
  Date: string;
  Year,Month,Day: word;
begin
  A := '';
  Avtor.First;
  while not Avtor.Eof do
  begin
      A := A + AvtorLastname.Value + ',' +
           AvtorFirstName.Value + ',' +
           AvtorMiddlename.Value + ':';
    Avtor.Next;
  end;
  if A = '' then A := 'неизвестный,автор,:';

  G := '';
  Genre.First;
  while not Lib.Genre.Eof do
  begin
    G := G + GenreGenreCode.Value + ':';
    Genre.Next;
  end;
  if G = '' then G := 'other:';


  if Series.RecordCount > 0 then
  begin
    S  := SeriesSeqName.Value;
    SN := SeriesSeqNumb.AsWideString;
  end
  else
  begin
    SN := '0';
     S := '';
  end;

  Del := Bookdeleted.Value;

  if FN = '' then
    FN := BookBookId.AsWideString
  else
    FN := copy(FN, 1, length(FN) - Length(BookFileType.AsWideString) -1);

  DecodeDate(BookTime.AsDateTime,Year,Month,Day);
  Date := Format('%d-%.2d-%.2d',[Year,Month,Day]);
  Result := A + c +                             // авторы
            G + c +                             // жанры
            BookTitle.AsWideString + c +        // название
            S + c + SN + c +                    // серия, номер
            FN + c +       // имя файла
            BookFileSize.AsWideString + c +     // размер
            BookBookId.AsWideString + c +       // LibID
            Del + c +                           // Deleted
            BookFileType.AsWideString + c +     // type
            Date + c +                          // Date
            BookLang.AsWideString + c +         // Lang
            QueryRate(BookBookID.Value) + c +   // N
            Bookkeywords.AsWideString + c;      // Keywords
  Result := StringReplace(Result, #10, '', [rfReplaceAll]);
  Result := StringReplace(Result, #13, '', [rfReplaceAll]);
end;

end.
