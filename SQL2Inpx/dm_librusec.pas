unit dm_librusec;

interface

uses
  SysUtils, Classes, DB, DBAccess, MyAccess, MemDS;

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
    QueryCount: TLargeintField;
    procedure BookAfterScroll(DataSet: TDataSet);

    procedure QueryAvtor(BookID: integer);
    procedure QueryGenre(BookID: integer);
    procedure QuerySeries(BookID: integer);
    function GetBookRecord(BookID: integer): string; overload;
    function GetNextBook: string;
    procedure SetFb2Only(Enabled: boolean);
    function LastBookID: integer;
    function RecordToString: string;
  private
    { Private declarations }
  public
    { Public declarations }
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

function TLib.LastBookID: integer;
var
  Count : integer;
begin
  Query.SQL.Text := 'Select Count(*) From libbook';
  Query.Execute;
  Count := QueryCount.Value;
  Book.SQL.Text := 'SELECT * FROM `libbook` LIMIT ' +  IntToStr(Count - 1) +  ', 1';
  Book.Execute;
  Result := BookBookID.Value;
end;

function TLib.GetBookRecord(BookID: integer): string;
var
  Query : string;
begin
//  if Book.LocateEx('BookID', BookID, [lxNext]) then
//    Result := RecordToString
//  else
//    Result := '';
//
//
//  if Book.Locate('BookID', BookID, []) then
//    Result := RecordToString
//  else
//    Result := '';

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


function TLib.GetNextBook: string;
begin
  Book.Next;
  if not Book.Eof then
    Result := RecordToString
  else
    Result := '';
end;

procedure TLib.QueryAvtor(BookID: integer);
begin
  Avtor.SQL.Clear;
  Avtor.SQL.Add('select an.LastName, an.FirstName, an.MiddleName from' + #10 +
                    '(libavtor ba left outer join libavtoraliase aa on aa.badid = ba.avtorid)' + #10 +
                    'join libavtorname an on an.avtorid = COALESCE(aa.goodid, ba.avtorid) ' + #10 +
                    'WHERE  ba.bookid = ' + IntToStr(BookID));

  Avtor.Execute;
end;

procedure TLib.QueryGenre(BookID: integer);
begin
  Genre.SQL.Clear;
  Genre.SQL.Add('SELECT G.GenreCode  FROM libgenrelist G, libgenre GL' + #10 +
                    'WHERE GL.BookID = '+ IntToStr(BookID)  + #10 +
                    'AND G.GenreID = GL.GenreId' );
  Genre.Execute;
end;

procedure TLib.QuerySeries(BookID: integer);
begin
  Series.SQL.Clear;
  Series.SQL.Add('SELECT S.SeqName, SL.SeqNumb FROM libseqname S, libseq SL' + #10 +
                    'Where SL.BookID = '+ IntToStr(BookID)  + #10 +
                    'AND S.SeqID = SL.SeqId' );
  Series.Execute;
end;

function TLib.RecordToString: string;
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

  DecodeDate(BookTime.AsDateTime,Year,Month,Day);
  Date := Format('%d-%.2d-%.2d',[Year,Month,Day]);
  Result := A + c +                             // авторы
            G + c +                             // жанры
            BookTitle.AsWideString + c +        // название
            S + c + SN + c +                    // серия, номер
            BookBookId.AsWideString + c +       // имя файла
            BookFileSize.AsWideString + c +     // размер
            BookBookId.AsWideString + c +       // LibID
            Del + c +                           // Deleted
            BookFileType.AsWideString + c +     // type
            Date + c +                          // Date
            BookLang.AsWideString + c +         // Lang
            BookN.AsWideString + c +            // N
            Bookkeywords.AsWideString + c;      // Keywords
end;

procedure TLib.SetFb2Only;
begin
  if Enabled then
  begin
    Book.Filter := 'FileType="fb2"';
    Book.Filtered := True;
  end
  else
  begin
    Book.Filtered := False;
    Book.Filter := '';
  end
end;

end.
