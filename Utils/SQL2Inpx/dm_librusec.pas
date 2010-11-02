unit dm_librusec;

interface

uses
  SysUtils, Classes, DB, DBAccess, MyAccess, MemDS, MyEmbConnection, DADump,
  MyDump, Variants;

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
    Query: TMyQuery;
    procedure BookAfterScroll(DataSet: TDataSet);
  private
    FUseAuthorRole: boolean;
    { Private declarations }
    procedure QueryAvtor(BookID: integer);
    procedure QueryGenre(BookID: integer);
    procedure QuerySeries(BookID: integer);
    function QueryRate(BookID: integer): string;
  public
    { Public declarations }
    property UseAuthorRole: boolean write FUseAuthorRole;

    function GetBookRecord(BookID: integer; fb2only: boolean = false): string;
      overload;
    function GetBookRecord(FN: string; fb2only: boolean = false;
      oldFormat: boolean = false): string; overload;
    function RecordToString(FN: string = ''): string;
    procedure ShowAll;
    function LastBookID: integer;
  end;

var
  Lib: TLib;

implementation

uses
  MemData;

const
  QS = 'SELECT B.BookId, B.Title, B.FileSize, B.FileType, B.Deleted, B.Time, B.Lang, B.KeyWords ';
{$R *.dfm}

procedure TLib.BookAfterScroll(DataSet: TDataSet);
var
  ID: integer;
begin
  ID := Book.FieldByName('BookId').Value;
  QueryAvtor(ID);
  QueryGenre(ID);
  QuerySeries(ID);
end;

function TLib.GetBookRecord(FN: string; fb2only: boolean;
  oldFormat: boolean): string;
var
  Query: string;
  ID: integer;
begin
  if oldFormat then
    Query := QS +
      ', F.FileName FROM libbook B, libfilenameold F WHERE B.BookId = F.BookId AND F.FileName = "' + FN + '"'
  else
    Query := QS +
      ', F.FileName FROM libbook B, libfilename F WHERE B.BookId = F.BookId AND F.FileName = "' + FN + '"';

  Book.SQL.Text := Query;
  Book.Execute;
  if Book.FieldByName('BookId').Value <> Null then
  begin
    ID := Book.FieldByName('BookId').Value;
    QueryAvtor(ID);
    QueryGenre(ID);
    QuerySeries(ID);
    Result := RecordToString(FN);
  end
  else Result := '';
end;

function TLib.LastBookID: integer;
var
  Count: integer;
begin
  Query.SQL.Text := 'Select Count(*) From libbook';
  Query.Execute;
  Count := Query.Fields[0].AsInteger;
  Book.SQL.Text := 'SELECT * FROM `libbook` LIMIT ' + IntToStr(Count - 1)
    + ', 1';
  Book.Execute;
  Result := Book.FieldByName('BookId').Value;
end;

function TLib.GetBookRecord(BookID: integer; fb2only: boolean = false): string;
var
  Query: string;
  ID: integer;
begin
  Result := '';
  if fb2only then
    Query := QS + 'FROM libbook B WHERE B.FileType = "fb2" and B.BookId = ' +
      IntToStr(BookID)
  else
    Query := QS + 'FROM libbook B WHERE B.BookId = ' + IntToStr(BookID);

  Book.SQL.Text := Query;
  Book.Execute;
  if Book.RecordCount = 0 then
  begin
    Result := '';
    Exit;
  end;
  ID := Book.FieldByName('BookId').Value;
  QueryAvtor(ID);
  QueryGenre(ID);
  QuerySeries(ID);
  Result := RecordToString;
end;

procedure TLib.QueryAvtor(BookID: integer);
var
  RoleStr : string;
begin
  if FUseAuthorRole then RoleStr := ' and ba.role = "a";'
    else RoleStr := ';';

  Avtor.SQL.Text :=
    'select an.LastName, an.FirstName, an.MiddleName from' + #10 +
    '(libavtor ba left outer join libavtoraliase aa on aa.badid = ba.avtorid)'
    + #10 +
    'join libavtorname an on an.avtorid = COALESCE(aa.goodid, ba.avtorid) ' +
    #10 + 'WHERE  ba.bookid = ' + IntToStr(BookID) + RoleStr;

  Avtor.Execute;
end;

procedure TLib.QueryGenre(BookID: integer);
begin
  Genre.SQL.Text :=
    'SELECT G.GenreCode  FROM libgenrelist G, libgenre GL' + #10 +
    'WHERE GL.BookId = ' + IntToStr(BookID)
    + #10 + 'AND G.GenreId = GL.GenreId';
  Genre.Execute;
end;

function TLib.QueryRate(BookID: integer): string;
begin
  Query.SQL.Text := 'SELECT AVG(Rate) FROM Librate WHERE BookId = ' + IntToStr
    (BookID);
  Query.Execute;
  if Query.Fields[0].AsInteger <> 0 then
    Result := IntToStr(Query.Fields[0].AsInteger)
  else
    Result := '';
end;

procedure TLib.QuerySeries(BookID: integer);
begin
  Series.SQL.Text :=
    'SELECT S.SeqName, SL.SeqNumb FROM libseqname S, libseq SL' + #10 + 'Where SL.BookId = ' + IntToStr(BookID) + #10 + 'AND S.SeqID = SL.SeqId';
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
  Year, Month, Day: word;
  Ext: string;

  ID: integer;
begin
  A := '';
  Avtor.First;
  while not Avtor.Eof do
  begin
    A := A + AvtorLastName.Value + ',' + AvtorFirstName.Value + ',' +
      AvtorMiddleName.Value + ':';
    Avtor.Next;
  end;
  if A = '' then
    A := 'неизвестный,автор,:';

  G := '';
  Genre.First;
  while not Lib.Genre.Eof do
  begin
    G := G + GenreGenreCode.Value + ':';
    Genre.Next;
  end;
  if G = '' then
    G := 'other:';

  if Series.RecordCount > 0 then
  begin
    S := copy(SeriesSeqName.Value, 1, 80);
    SN := SeriesSeqNumb.AsWideString;
  end
  else
  begin
    SN := '0';
    S := '';
  end;

  Del := Book.FieldByName('deleted').Value;
  ID := Book.FieldByName('BookID').Value;

  if FN = '' then
  begin
    FN := IntToStr(ID);
    Ext := Book.FieldByName('FileType').AsWideString;
  end
  else
  begin
    Ext := ExtractFileExt(FN);
    FN := copy(FN, 1, length(FN) - length(Ext) - 1);
    if Ext[1] = '.' then
      Delete(Ext, 1, 1);
  end;

  DecodeDate(Book.FieldByName('Time').AsDateTime, Year, Month, Day);
  Date := Format('%d-%.2d-%.2d', [Year, Month, Day]);
  Result := A + c + // авторы
    G + c + // жанры
    trim(Book.FieldByName('Title').AsWideString) + c + // название
    S + c + SN + c + // серия, номер
    FN + c + // имя файла
    Book.FieldByName('FileSize').AsWideString + c + // размер
    IntToStr(ID) + c + // LibID
    Del + c + // Deleted
    Ext + c + // type
    Date + c + // Date
    Book.FieldByName('Lang').AsWideString + c + // Lang
    QueryRate(ID) + c + // N
    Book.FieldByName('KeyWords').AsWideString + c; // Keywords
  Result := StringReplace(Result, #10, '', [rfReplaceAll]);
  Result := StringReplace(Result, #13, '', [rfReplaceAll]);
end;

procedure TLib.ShowAll;
begin
  Book.SQL.Text := QS + 'FROM libbook B';
  Book.Execute;
end;

end.
