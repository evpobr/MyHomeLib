unit dm_librusec;

interface

uses
  SysUtils, Classes, DB, Variants, DBXMySQL, FMTBcd, DBClient,
  Provider, SqlExpr;

type
  TLib = class(TDataModule)
    Connection: TSQLConnection;
    dspLibBook: TDataSetProvider;
    cdsLibBook: TClientDataSet;
    dsLibBook: TDataSource;
    Book: TSQLQuery;
    Genre: TSQLQuery;
    dspGenre: TDataSetProvider;
    cdsGenre: TClientDataSet;
    dsGenre: TDataSource;
    Avtor: TSQLQuery;
    dspAvtor: TDataSetProvider;
    cdsAvtor: TClientDataSet;
    dsAvtor: TDataSource;
    Series: TSQLQuery;
    dspSeries: TDataSetProvider;
    cdsSeries: TClientDataSet;
    dsSeries: TDataSource;
    Query: TSQLQuery;
    procedure ConnectionAfterConnect(Sender: TObject);
    procedure cdsLibBookAfterScroll(DataSet: TDataSet);
  private
    FAllowScroll: Boolean;
    FUseAuthorRole: boolean;
    { Private declarations }
    procedure QueryAvtor(BookID: integer);
    procedure QueryGenre(BookID: integer);
    procedure QuerySeries(BookID: integer);
    function QueryRate(BookID: integer): string;
    procedure Update;
    procedure ExecQuery(Query: string; var Table: TSqlQuery);
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
    property AllowScrool: Boolean write FAllowScroll default False;
    procedure Flush;
  end;

var
  Lib: TLib;

implementation


const
  QS = 'SELECT B.BookId, B.Title, B.FileSize, B.FileType, B.Deleted, B.Time, B.Lang, B.KeyWords ';
{$R *.dfm}

function TLib.GetBookRecord(FN: string; fb2only: boolean;
  oldFormat: boolean): string;
var
  Query: string;
begin
  if oldFormat then
    Query := QS +
      ', F.FileName FROM libbook B, libfilenameold F WHERE B.BookId = F.BookId AND F.FileName = "' + FN + '"'
  else
    Query := QS +
      ', F.FileName FROM libbook B, libfilename F WHERE B.BookId = F.BookId AND F.FileName = "' + FN + '"';

  ExecQuery(Query, Book);

  if Book.FieldByName('BookID').AsInteger <> 0 then
  begin
    Update;
    Result := RecordToString(FN);
  end
  else Result := '';
end;

function TLib.LastBookID: integer;
var
  Count: integer;
  Query: string;
begin
  ExecQuery('Select Count(*) From libbook', Book);
  Count := Book.Fields[0].AsInteger;
  ExecQuery(Format('SELECT * FROM `libbook` LIMIT %d, 1;', [Count - 1]), Book);
  Result :=  Book.FieldByName('BookId').AsInteger;
end;

function TLib.GetBookRecord(BookID: integer; fb2only: boolean = false): string;
var
  Query: string;
  ID: integer;
begin
  Result := '';
  if fb2only then
    Query := Format('%s FROM libbook B WHERE B.FileType = "fb2" and B.BookId = "%d";',[QS, BookID])
  else
    Query := Format('%s FROM libbook B WHERE B.BookId = "%d";', [QS, BookID]);

  ExecQuery(Query, Book);
  ID := Book.FieldByName('BookId').AsInteger;

  if ID = 0 then
  begin
    Result := '';
    Exit;
  end;

  QueryAvtor(ID);
  QueryGenre(ID);
  QuerySeries(ID);
  Result := RecordToString;
end;

procedure TLib.QueryAvtor(BookID: integer);
var
  RoleStr: string;

begin
  if FUseAuthorRole then RoleStr := ' and ba.role = "a";'
    else RoleStr := ';';

  ExecQuery('select an.LastName, an.FirstName, an.MiddleName from' + #10 +
    '(libavtor ba left outer join libavtoraliase aa on aa.badid = ba.avtorid)'
    + #10 +
    'join libavtorname an on an.avtorid = COALESCE(aa.goodid, ba.avtorid) ' +
    #10 + ' WHERE  ba.bookid = ' + IntToStr(BookID) + RoleStr,
    Avtor);
end;

procedure TLib.QueryGenre(BookID: integer);
begin
  ExecQuery('SELECT G.GenreCode  FROM libgenrelist G, libgenre GL' + #10 +
    ' WHERE GL.BookId = ' + IntToStr(BookID)
    + #10 + ' AND G.GenreId = GL.GenreId', Genre);
end;

function TLib.QueryRate(BookID: integer): string;
begin
  Query.SQL.Text := 'SELECT AVG(Rate) FROM Librate WHERE BookId = ' + IntToStr
    (BookID);
  Query.ExecSQL;
  Query.Active := True;
  if Query.Fields[0].AsInteger <> 0 then
    Result := IntToStr(Query.Fields[0].AsInteger)
  else
    Result := '';
end;

procedure TLib.QuerySeries(BookID: integer);
begin
  ExecQuery('SELECT S.SeqName, SL.SeqNumb FROM libseqname S, libseq SL' + #10 + 'Where SL.BookId = ' + IntToStr(BookID) + #10 + 'AND S.SeqID = SL.SeqId', Series);
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
    A := A + Avtor.FieldByName('LastName').AsWideString + ',' + Avtor.FieldByName('FirstName').AsWideString + ',' +
      Avtor.FieldByName('MiddleName').AsWideString + ':';
    Avtor.Next;
  end;
  if A = ',,:' then
    A := '�����������,�����,:';

  G := '';
  Genre.First;
  while not Lib.Genre.Eof do
  begin
    G := G + Genre.FieldByName('GenreCode').AsWideString + ':';
    Genre.Next;
  end;
  if G = ':' then
    G := 'other:';

  if Series.RecordCount > 0 then
  begin
    S := copy(Series.FieldByName('SeqName').AsWideString, 1, 80);
    SN := Series.FieldByName('SeqNumb').AsWideString;
  end
  else
  begin
    SN := '0';
    S := '';
  end;

  Del := Book.FieldByName('Deleted').AsWideString;
  ID := Book.FieldByName('BookID').AsInteger;

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
  Result := A + c + // ������
    G + c + // �����
    trim(Book.FieldByName('Title').AsWideString) + c + // ��������
    S + c + SN + c + // �����, �����
    FN + c + // ��� �����
    Book.FieldByName('FileSize').AsWideString + c + // ������
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
  ExecQuery(QS + 'FROM libbook B', Book);
end;

procedure TLib.Update;
var
  ID: integer;
begin
  ID := Book.FieldByName('BookId').AsInteger;
  cdsLibBook.Refresh;

  QueryAvtor(ID);
  cdsAvtor.Refresh;

  QueryGenre(ID);
  cdsGenre.Refresh;

  QuerySeries(ID);
  cdsSeries.Refresh;
end;

procedure TLib.cdsLibBookAfterScroll(DataSet: TDataSet);
begin
  if FAllowScroll then Update;
end;

procedure TLib.ConnectionAfterConnect(Sender: TObject);
var
  Params: TParams;
begin
  try
    Params := TParams.Create(Self);
    Connection.Execute('SET Names "utf8"',Params);
  finally
    FreeAndNil(Params);
  end;
end;

procedure TLib.ExecQuery(Query: string; var Table: TSqlQuery);
begin
  Table.SQL.Text := Query;
  Table.ExecSQL;
  Table.Active := True;
end;

procedure TLib.Flush;
begin

end;

end.
