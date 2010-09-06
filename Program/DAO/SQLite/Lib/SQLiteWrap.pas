{: @abstract(SQLite 3.x object based wrapper)

Can be used for object based access to SQLite3 databases.

Note: Requires Sqlite 3.6.8 and higher!

Designed for Delphi 6+ and Freepascal, Unicode support for Delphi 2009+

  ------------------------ Modifications for MyHomeLib ------------------------

  Sep 2010
    - added method TSQLiteDatabase.UpdateBlob (Tim Anderson's implementation from http://www.itwriting.com/blog/?page_id=659 but with UTF-8 support)
    - added method TSQLiteDatabase.AddParamBoolean
    - added method TSQLiteDatabase.AddParamDateTime
    - added method TSQLiteTable.FieldAsBoolean
    - added method TSQLiteTable.FieldAsDateTime
    - Renamed a few method names (have a naming convention for matching Add*/Field* methods):
        AddParamText    ==> AddParamString
        FieldAsBlobText ==> FieldAsBlobString
        FieldAsInteger  ==> FieldAsInt
        GetTableValue   ==> GetTableInt
  -----------------------------------------------------------------------------

  V2.0.0  29 June 2010
    Ported to D2009 Unicode by Roger Lascelles (support@veecad.com)

  V1.0.0
    by Lukбљ Gebauer at http://www.ararat.cz/doku.php/en:sqlitewrap.
    based on work by Tim Anderson (tim@itwriting.com)

UNICODE HANDLING:
Delphi 2009+
  Pass data as native UnicodeString. Datas are converted to SQLite native
  UTF-8 internally.

pre-Delphi 2009
  Pass data as UTF8String (it is AnsiString contains UTF8 datas) and you must
  convert data to UTF-8 explicitly!
  Pasing data by UTF8String typed variable made your source forward compatible
  with Delphi 2009+.


Sample usage:
@longcode(#
procedure sample;
var
  database: TSqliteDatabase;
  tab: TSqliteTable;
  s: utf8string;
begin
  database := TSqliteDatabase.Create('somedatabase.db3');
  try
    database.AddParamInt(':key', 123456);
    tab := database.GetTable('SELECT * FROM some_table WHERE ROWID=:key');
    try
      while not tab.EOF do
      begin
        s := tab.FieldAsString(tab.FieldIndex['ROWID']);
        //do something with 'S' variable...
        //...
        //...then go to nexr row.
        tab.next;
      end;
    finally
      tab.free;
    end;
  finally
    database.free;
  end;
end;
#)
}

unit SQLiteWrap;

interface
{$IFDEF FPC}
  {$MODE Delphi}{$H+}
{$ENDIF}

{$IFDEF UNICODE}
  {$IFNDEF FPC}
    {$DEFINE SQUNI}
  {$ENDIF}
{$ENDIF}

uses
  {$IFDEF WIN32}
  Windows,
  {$ENDIF}
  SQLite3, Classes, SysUtils;

type
  {: @abstract(Exception Class for SQLite based errors)}
  ESQLiteException = class(Exception);

  {: @abstract(procedural prototype for @link(OnQuery) hook.)}
  THookQuery = procedure(Sender: TObject; const SQL: string) of object;

  TSQLiteQuery = class;

  {: @abstract(Class for handling SQLite database)}
  TSQLiteDatabase = class(TObject)
  private
    FDB: TSQLite3DB;
    FOnQuery: THookQuery;

  protected
    procedure RegisterSystemCollateAndFunc;
    procedure RaiseError(const s, SQL: string);
    procedure DoLogQuery(const QueryText: string);

  public
    {: Class constructor. Pass filename of database. If databas not exists, then new one is created.
    If you pass empty string as filename, then temporary database is created.
    If you pass ':memory:' as filename, then temporary database in memory is created.

    Warning:
      Pass FileName as AnsiString (if you are not using Unicode Delphi version)
      or as UnicodeString (on Delphi 2009 and higher)!
    }
    constructor Create(const FileName: string);

    {: Class descructor. Call Free instead.}
    destructor Destroy; override;

    { Run SQL command with result. }
    function NewQuery(const SQL: string): TSQLiteQuery;

    { Run SQL command without result. }
    procedure ExecSQL(const SQL : string);

    { Run SQL command and number from first field in first row is returned. }
    function GetTableInt(const SQL: string): Int64; deprecated;
    function GetTableString(const SQL: string): string; deprecated;
    procedure GetTableStrings(const SQL: string; const Value: TStrings); deprecated;

    { Return @True if database is in transaction state.}
    function InTransaction: Boolean;
    procedure Start(const name: string = ''; const param: string = '');
    procedure Commit(const name: string = '');
    procedure Rollback(const name: string = '');

    { Get ROWID of last inserted row.}
    function LastInsertRowID: Int64;

    { Return number of modified rows by last query.}
    function LastChangedRows: Int64;

    { Set wait timeout. if database is locked, then it wait this timeout.
       If database is not released within this timeout, then error is returned.}
    procedure SetTimeout(Value: Integer);

    { Return SQLite engine version.}
    function Version: string;

    { Add custom sorting procedure as new Collate.}
    procedure AddCustomCollate(name: string; xCompare: TCollateXCompare);
    procedure AddFunction(const FunctionName: string; const nArg: Integer; PrefferedEncoding: Integer; xFunc: TxFunc);

    { Update a blob using data from the stream}
    procedure UpdateBlob(const SQL: string; BlobData: TStream);

    { SQLite database handler.}
    property DB: TSQLite3DB read FDB;

    { Debug hook for log all called queries.}
    property OnQuery: THookQuery read FOnQuery write FOnQuery;
  end;

  {: @abstract(Class for handling SQLite query result)}
  TSQLiteQuery = class(TObject)
  private
    FDatabase: TSQLiteDatabase;
    FStmt: TSQLiteStmt;
    FColCount: Cardinal;
    FCols: TStringList;
    FRow: Cardinal;
    FEof: Boolean;
    FSQL: string;

    function GetColumns(const I: Integer): string; inline;
    function GetFields(const I: Cardinal): string; inline;
    function GetFieldIndex(const FieldName: string): Integer;
    function GetFieldByName(const FieldName: string): string;

  public
    {: Class constructor. Called internally by @link(TSqliteDatabase)}
    constructor Create(const DB: TSQLiteDatabase; const SQL: string);

    {: Class descructor. Call Free instead.}
    destructor Destroy; override;

    //
    // Установка параметров
    //
    procedure ParamsClear;

    procedure SetParam(const ParamIndex: Integer; const Value: Int64); overload; inline;
    procedure SetParam(const ParamName: string; const Value: Int64); overload; inline;
    procedure SetParam(const ParamIndex: Integer; const Value: Double); overload; inline;
    procedure SetParam(const ParamName: string; const Value: Double); overload; inline;
    procedure SetParam(const ParamIndex: Integer; const Value: string); overload; inline;
    procedure SetParam(const ParamName: string; const Value: string); overload; inline;
    procedure SetParam(const ParamIndex: Integer); overload; inline;
    procedure SetParam(const ParamName: string); overload; inline;

    //
    // доступ к полям
    //
    function FieldIsNull(I: Integer): Boolean;
    function FieldAsString(I: Integer): string;
    function FieldAsInt(I: Integer): Int64; inline;
    function FieldAsBoolean(I: Integer): Boolean;
    function FieldAsDateTime(I: Integer): TDateTime;
    function FieldAsDouble(I: Integer): Double; inline;
    function FieldAsBlob(I: Integer): TMemoryStream;
    function FieldAsBlobPtr(I: Integer; out iNumBytes: Integer): Pointer; inline; deprecated;
    function FieldAsBlobString(I: Integer): AnsiString; deprecated;

    //
    // Навигация и выплнение запросов
    //
    procedure ExecSQL; inline;
    procedure Open; inline;
    function Next: Boolean;
    procedure Reset; inline;

    //
    // Свойства, для упрощения текста. В большинстве своем бесполезные.
    //
    {: Return value of some field in current row.}
    property Fields[const I: Cardinal]: string read GetFields;

    {: Return value of named field in current row.}
    property FieldByName[const FieldName: string]: string read GetFieldByName;

    {: Return index of some named field.}
    property FieldIndex[const FieldName: string]: Integer read GetFieldIndex;

    {: Return field type of some field.}
    property Columns[const I: Integer]: string read GetColumns;

    {: Indicate last row in result set.}
    property Eof: Boolean read FEof;

    {: Return number of fields in row.}
    property ColCount: Cardinal read FColCount;

    {: Number of current row.}
    property Row: Cardinal read FRow;
  end;

  procedure DisposePointer(ptr: Pointer); cdecl;

resourcestring
  c_unknown = 'Unknown error';
  c_failopen = 'Failed to open database "%s" : %s';
  c_error = '.' + sLineBreak + 'Error [%d]: %s.' + sLineBreak + '"%s": %s';
  c_nomessage = 'No message';
  c_errorsql = 'Error executing SQL';
  c_errorprepare = 'Could not prepare SQL statement';
  c_errorexec = 'Error executing SQL statement';
  c_errorempty = 'Field %s not found. Empty dataset';
  c_errorfield = 'Field not found in dataset: %s';
  c_errordata = 'Could not retrieve data';
  c_errorparam = 'SQL must include a ? parameter';
  c_errormemoryblob = 'Error getting memory to save blob';
  c_errorbindingblob = 'Error binding blob to database';
  c_errorbindingparam = 'Error binding param';

implementation

uses
  SQLite3UDF;

const
  DATE_FORMAT = 'yyyy-mm-dd';
  TIME_FORMAT = 'hh:nn:ss.zzz';
  DATE_TIME_FORMAT = DATE_FORMAT + ' ' + TIME_FORMAT;

var
  SQLite_FormatSettings: TFormatSettings;

{ TSQLiteDatabase }

constructor TSQLiteDatabase.Create(const FileName: string);
var
  s: string;
begin
  inherited Create;

  if SQLite3_Open(PUTF8Char(UTF8String(FileName)), FDB) <> SQLITE_OK then
  begin
    if Assigned(FDB) then
      s := string(UTF8String(SQLite3_ErrMsg(FDB)))
    else
      s := c_unknown;
    raise ESqliteException.CreateFmt(c_failopen, [FileName, s]);
  end;

  RegisterSystemCollateAndFunc;
end;

destructor TSQLiteDatabase.Destroy;
begin
  if Assigned(FDB) then
    SQLite3_Close(FDB);

  inherited Destroy;
end;

procedure TSQLiteDatabase.RaiseError(const s, SQL: string);
var
  Msg: PAnsiChar;
  ret: Integer;
begin
  Msg := nil;
  ret := SQLite3_ErrCode(FDB);
  if ret <> SQLITE_OK then
    Msg := SQLite3_ErrMsg(FDB);

  if Assigned(Msg) then
    raise ESqliteException.CreateFmt(s + c_error, [ret, SQLiteErrorStr(ret), SQL, Msg])
  else
    raise ESqliteException.CreateFmt(s, [SQL, c_nomessage]);
end;

procedure TSQLiteDatabase.DoLogQuery(const QueryText: string);
begin
  if Assigned(FOnQuery) then
    FOnQuery(Self, QueryText);
end;

function TSQLiteDatabase.NewQuery(const SQL: string): TSQLiteQuery;
begin
  Result := TSQLiteQuery.Create(Self, SQL);
end;

procedure TSQLiteDatabase.ExecSQL(const SQL: string);
var
  Query: TSQLiteQuery;
begin
  Query := NewQuery(SQL);
  try
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

function TSQLiteDatabase.GetTableInt(const SQL: string): Int64;
var
  Query: TSQLiteQuery;
begin
  Result := 0;
  Query := NewQuery(SQL);
  try
    Query.Open;
    if not Query.EOF then
      Result := Query.FieldAsInt(0);
  finally
    Query.Free;
  end;
end;

function TSQLiteDatabase.GetTableString(const SQL: string): string;
var
  Query: TSQLiteQuery;
begin
  Result := '';
  Query := NewQuery(SQL);
  try
    Query.Open;
    if not Query.EOF then
      Result := Query.FieldAsString(0);
  finally
    Query.Free;
  end;
end;

procedure TSQLiteDatabase.GetTableStrings(const SQL: string; const Value: TStrings);
var
  Query: TSQLiteQuery;
begin
  Value.Clear;
  Query := NewQuery(SQL);
  try
    Query.Open;
    while not Query.EOF do
    begin
      Value.Add(Query.FieldAsString(0));
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TSQLiteDatabase.InTransaction: Boolean;
begin
  Result := SQLite3_Get_Autocommit(FDB) = 0;
end;

procedure TSQLiteDatabase.Start(const name: string = ''; const param: string = '');
var
  s: string;
begin
  if name = '' then
  begin
    s := 'BEGIN';
    if param <> '' then
      s := s + ' ' + param;
    ExecSQL(s);
  end
  else
    ExecSQL('SAVEPOINT ' + name);
end;

procedure TSQLiteDatabase.Commit(const name: string = '');
begin
  if name = '' then
    ExecSQL('COMMIT')
  else
    ExecSQL('RELEASE ' + name);
end;

procedure TSQLiteDatabase.Rollback(const name: string = '');
begin
  if name = '' then
    ExecSQL('ROLLBACK')
  else
    ExecSQL('ROLLBACK TO ' + name);
end;

function TSQLiteDatabase.LastInsertRowID: int64;
begin
  Result := SQLite3_LastInsertRowID(FDB);
end;

function TSQLiteDatabase.LastChangedRows: int64;
begin
  Result := SQLite3_Changes(FDB);
end;

procedure TSQLiteDatabase.SetTimeout(Value: Integer);
begin
  SQLite3_BusyTimeout(FDB, Value);
end;

function TSQLiteDatabase.Version: string;
begin
  Result := string(UTF8String(SQLite3_Version));
end;

procedure TSQLiteDatabase.AddCustomCollate(name: string; xCompare: TCollateXCompare);
begin
  SQLite3_Create_Collation(FDB, PUTF8Char(UTF8String(name)), SQLITE_UTF8, nil, xCompare);
end;

procedure TSQLiteDatabase.RegisterSystemCollateAndFunc;
begin
  SQLite3_Create_Collation(FDB, PUTF8Char('SYSTEM'), SQLITE_UTF16, nil, @SystemCollate);
  SQLite3_Create_Collation(FDB, PUTF8Char('SYSTEM_NOCASE'), SQLITE_UTF16, nil, @SystemCollateNoCase);
  AddFunction('UPPER', 1, SQLITE_ANY, SystemUpperString);
  AddFunction('LOWER', 1, SQLITE_ANY, SystemLowerString);
end;

procedure TSQLiteDatabase.AddFunction(const FunctionName: string; const nArg: Integer; PrefferedEncoding: Integer; xFunc: TxFunc);
var
  nRc: Integer;
begin
  nRc := SQLite3_Create_Function(FDB, PUTF8Char(UTF8String(FunctionName)), nArg, PrefferedEncoding, nil, @xFunc, nil, nil);
  if SQLITE_OK <> nRc then
    RaiseError('', FunctionName);
end;

procedure TSQLiteDatabase.UpdateBlob(const SQL: string; BlobData: TStream);
var
  iSize: Integer;
  ptr: Pointer;
  Stmt: TSQLiteStmt;
  NextSQLStatement: PUTF8Char;
begin
  //expects SQL of the form 'UPDATE MYTABLE SET MYFIELD = ? WHERE MYKEY = 1'
  if Pos('?', SQL) = 0 then
    RaiseError(c_errorparam, SQL);

  try
    if SQLite3_Prepare_v2(FDB, PUTF8Char(UTF8String(SQL)), -1, Stmt, NextSQLStatement) <> SQLITE_OK then
      RaiseError(c_errorprepare, SQL);

    if (Stmt = nil) then
      RaiseError(c_errorprepare, SQL);

    DoLogQuery(SQL);

    //now bind the blob data
    iSize := BlobData.size;

    GetMem(ptr, iSize);

    if (ptr = nil) then
      raise ESqliteException.CreateFmt(c_errormemoryblob, [SQL, 'Error']);

    BlobData.Position := 0;
    BlobData.Read(ptr^, iSize);

    if SQLite3_Bind_Blob(stmt, 1, ptr, iSize, @DisposePointer) <> SQLITE_OK then
      RaiseError(c_errorbindingblob, SQL);

    if (SQLite3_Step(Stmt) <> SQLITE_DONE) then
    begin
      SQLite3_Reset(stmt);
      RaiseError(c_errorexec, SQL);
    end;

  finally
    if Assigned(Stmt) then
      SQLite3_Finalize(stmt);
  end;
end;

{ TSQLiteQuery }

constructor TSQLiteQuery.Create(const DB: TSQLiteDatabase; const SQL: string);
var
  NextSQLStatement: PUTF8Char;
  i: Integer;
begin
  inherited Create;

  FDatabase := db;
  FEof := False;
  FRow := 0;
  FColCount := 0;
  FSQL := SQL;

  if SQLITE_OK <> Sqlite3_Prepare_v2(FDatabase.FDB, PUTF8Char(UTF8String(FSQL)), -1, FStmt, NextSQLStatement) then
    DB.RaiseError(c_errorsql, FSQL);

  if not Assigned(FStmt) then
    DB.RaiseError(c_errorprepare, FSQL);

  DB.DoLogQuery(SQL);

  //get data types
  FCols := TStringList.Create;
  FColCount := SQLite3_ColumnCount(FStmt);
  for i := 0 to FColCount - 1 do
    FCols.Add(string(UTF8String(SQLite3_ColumnName(FStmt, i))));
end;

destructor TSQLiteQuery.Destroy;
begin
  if Assigned(FStmt) then
  begin
    Sqlite3_Finalize(FStmt);
    FStmt := nil;
  end;

  if Assigned(FCols) then
    FreeAndNil(FCols);

  inherited;
end;

function TSQLiteQuery.GetColumns(const I: Integer): string;
begin
  Assert(Assigned(FCols));
  Result := FCols[I];
end;

procedure TSQLiteQuery.ParamsClear;
begin
  SQLite3_clear_bindings(FStmt);
end;

procedure TSQLiteQuery.SetParam(const ParamIndex: Integer; const Value: Int64);
begin
  if SQLITE_OK <> SQLite3_bind_int64(FStmt, ParamIndex, Value) then
    FDatabase.RaiseError(c_errorbindingparam, FSQL);
end;

procedure TSQLiteQuery.SetParam(const ParamName: string; const Value: Int64);
var
  i: Integer;
begin
  i := SQLite3_bind_parameter_index(FStmt, PUTF8Char(UTF8String(ParamName)));
  if i > 0 then
    SetParam(i, Value);
end;

procedure TSQLiteQuery.SetParam(const ParamIndex: Integer; const Value: Double);
begin
  if SQLITE_OK <> SQLite3_bind_double(FStmt, ParamIndex, Value) then
    FDatabase.RaiseError(c_errorbindingparam, FSQL);
end;

procedure TSQLiteQuery.SetParam(const ParamName: string; const Value: Double);
var
  i: Integer;
begin
  i := SQLite3_bind_parameter_index(FStmt, PUTF8Char(UTF8String(ParamName)));
  if i > 0 then
    SetParam(i, Value);
end;

procedure TSQLiteQuery.SetParam(const ParamIndex: Integer; const Value: string);
var
  valueUTF8: UTF8String;
begin
  valueUTF8 := UTF8String(Value);
  if SQLITE_OK <> SQLite3_bind_text(FStmt, ParamIndex, PUTF8Char(valueUTF8), Length(valueUTF8), SQLITE_TRANSIENT) then
    FDatabase.RaiseError(c_errorbindingparam, FSQL);
end;

procedure TSQLiteQuery.SetParam(const ParamName: string; const Value: string);
var
  i: Integer;
begin
  i := SQLite3_bind_parameter_index(FStmt, PUTF8Char(UTF8String(ParamName)));
  if i > 0 then
    SetParam(i, Value);
end;

procedure TSQLiteQuery.SetParam(const ParamIndex: Integer);
begin
  if SQLITE_OK <> SQLite3_bind_null(FStmt, ParamIndex) then
    FDatabase.RaiseError(c_errorbindingparam, FSQL);
end;

procedure TSQLiteQuery.SetParam(const ParamName: string);
var
  i: Integer;
begin
  i := SQLite3_bind_parameter_index(FStmt, PUTF8Char(UTF8String(ParamName)));
  if i > 0 then
    SetParam(i);
end;

function TSQLiteQuery.GetFields(const I: Cardinal): string;
begin
  Result := string(UTF8String(Sqlite3_ColumnText(FStmt, i)));
end;

function TSQLiteQuery.GetFieldIndex(const FieldName: string): Integer;
begin
  if not Assigned(FCols) or (FCols.Count = 0) then
    raise ESQLiteException.Create(Format(c_errorempty, [FieldName]));

  Result := FCols.IndexOf(AnsiUpperCase(FieldName));

  if (Result < 0) then
    raise ESQLiteException.Create(Format(c_errorfield, [FieldName]))
end;

function TSQLiteQuery.GetFieldByName(const FieldName: string): string;
begin
  Result := GetFields(GetFieldIndex(FieldName));
end;

function TSQLiteQuery.FieldIsNull(I: Integer): Boolean;
begin
  Result := SQLite3_ColumnText(FStmt, i) = nil;
end;

function TSQLiteQuery.FieldAsString(I: Integer): string;
begin
  Result := GetFields(I);
end;

function TSQLiteQuery.FieldAsInt(I: Integer): Int64;
begin
  Result := SQLite3_ColumnInt64(FStmt, i);
end;

function TSQLiteQuery.FieldAsBoolean(I: Integer): Boolean;
var
  IntVal: Integer;
begin
  IntVal := FieldAsInt(I);
  Result := (IntVal = 1);
end;

function TSQLiteQuery.FieldAsDateTime(I: Integer): TDateTime;
var
  StringVal: string;
begin
  StringVal := FieldAsString(I);
  Result := StrToDateTime(StringVal, SQLite_FormatSettings);
end;

function TSQLiteQuery.FieldAsDouble(I: Integer): Double;
begin
  Result := SQLite3_ColumnDouble(FStmt, i);
end;

function TSQLiteQuery.FieldAsBlob(I: Integer): TMemoryStream;
var
  iNumBytes: Integer;
  ptr: Pointer;
begin
  Result := TMemoryStream.Create;
  iNumBytes := SQLite3_ColumnBytes(FStmt, i);
  if iNumBytes > 0 then
  begin
    ptr := Sqlite3_ColumnBlob(FStmt, i);
    Result.WriteBuffer(ptr^, iNumBytes);
    Result.Position := 0;
  end;
end;

function TSQLiteQuery.FieldAsBlobPtr(I: Integer; out iNumBytes: Integer): Pointer;
begin
  iNumBytes := SQLite3_ColumnBytes(FStmt, i);
  Result := SQLite3_ColumnBlob(FStmt, i);
end;

function TSQLiteQuery.FieldAsBlobString(I: Integer): AnsiString;
var
  MemStream: TMemoryStream;
  Buffer: PAnsiChar;
begin
  Result := '';
  MemStream := FieldAsBlob(I);
  if Assigned(MemStream) then
  try
    if MemStream.Size > 0 then
    begin
      MemStream.Position := 0;
      {$IFDEF UNICODE}
      Buffer := AnsiStrAlloc(MemStream.Size + 1);
      {$ELSE}
      Buffer := Stralloc(MemStream.Size + 1);
      {$ENDIF}
      MemStream.ReadBuffer(Buffer[0], MemStream.Size);
      (Buffer + MemStream.Size)^ := Chr(0);
      SetString(Result, Buffer, MemStream.Size);
      StrDispose(Buffer);
    end;
   finally
     MemStream.Free;
  end
end;

procedure TSQLiteQuery.ExecSQL;
begin
  try
    if SQLITE_DONE <> SQLite3_Step(FStmt) then
      FDatabase.RaiseError(c_errorexec, FSQL);
  finally
    Reset;
  end;
end;

procedure TSQLiteQuery.Open;
begin
  Next;
end;

function TSQLiteQuery.Next: Boolean;
var
  iStepResult: Integer;
begin
  FEof := True;
  case SQLite3_Step(FStmt) of
    SQLITE_ROW:
      begin
        FEof := False;
        Inc(fRow);
      end;

    SQLITE_DONE:
      // we are on the end of dataset
      // return EOF=true only
      ;

    else
      begin
        Reset;
        FDatabase.RaiseError(c_errordata, FSQL);
      end;
  end;
  Result := not FEof;
end;

procedure TSQLiteQuery.Reset;
begin
  SQLite3_Reset(FStmt);
end;

procedure DisposePointer(ptr: Pointer); cdecl;
begin
  if Assigned(ptr) then
    FreeMem(ptr);
end;

initialization
  SQLite3_Initialize;

  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, SQLite_FormatSettings);
  SQLite_FormatSettings.ShortDateFormat := DATE_FORMAT;
  SQLite_FormatSettings.LongDateFormat := DATE_FORMAT;
  SQLite_FormatSettings.DateSeparator := '-';
  SQLite_FormatSettings.ShortTimeFormat := TIME_FORMAT;
  SQLite_FormatSettings.LongTimeFormat := TIME_FORMAT;
  SQLite_FormatSettings.TimeSeparator := ':';

finalization
  SQLite3_Shutdown;
end.

