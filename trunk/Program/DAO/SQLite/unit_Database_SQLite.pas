(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           eg
  *
  * Created             04.09.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_Database_SQLite;

interface

uses
  Classes,
  SQLiteWrap,
  UserData,
  unit_Globals,
  unit_Interfaces,
  unit_Database_Abstract;

type
  // The class is NOT THREAD-SAFE as the connection instance FDatabase is not.
  TBookCollection_SQLite = class(TBookCollection)
  strict private type
    //-------------------------------------------------------------------------
    TAuthorIteratorImpl = class(TInterfacedObject, IAuthorIterator)
    public
      constructor Create(
        Collection: TBookCollection_SQLite;
        const Mode: TAuthorIteratorMode;
        const FilterValue: PFilterValue
      );
      destructor Destroy; override;

    protected
      // IAuthorIterator
      function Next(out AuthorData: TAuthorData): Boolean;
      function GetNumRecords: Integer;

    strict private
      FCollection: TBookCollection_SQLite;
      FAuthors: TSQLiteTable;
      FCollectionID: Integer; // Active collection's ID at the time the iterator was created
      FNumRecords: Integer;

      procedure PrepareData(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue);
    end;
    // << TAuthorIteratorImpl

    //-------------------------------------------------------------------------
    TSeriesIteratorImpl = class(TInterfacedObject, ISeriesIterator)
    public
      constructor Create(Collection: TBookCollection_SQLite; const Mode: TSeriesIteratorMode);
      destructor Destroy; override;

    protected
      //
      // ISeriesIterator
      //
      function Next(out SeriesData: TSeriesData): Boolean;
      function GetNumRecords: Integer;

    strict private
      FCollection: TBookCollection_SQLite;
      FSeries: TSQLiteTable;
      FCollectionID: Integer; // Active collection's ID at the time the iterator was created
      FNumRecords: Integer;

      procedure PrepareData(const Mode: TSeriesIteratorMode);
    end;
    // << TSeriesIteratorImpl

  public
    constructor Create(const DBCollectionFile: string);
    destructor Destroy; override;

//    procedure ReloadDefaultGenres(const FileName: string); override;
    procedure SetPropertyS(PropID: Integer; const Value: string); override;
//    function CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean; override;
//    function InsertBook(BookRecord: TBookRecord; CheckFileName, FullCheck: Boolean): Integer; override;
//    procedure DeleteBook(const BookKey: TBookKey); override;
//    procedure GetBookRecord(const BookKey: TBookKey; var BookRecord: TBookRecord; LoadMemos: Boolean); override;
//    function GetTopGenreAlias(const FB2Code: string): string; override;
//    procedure CleanBookGenres(BookID: Integer); override;
//    procedure InsertBookGenres(const BookID: Integer; var Genres: TBookGenres); override;
//    procedure GetSeries(SeriesList: TStrings); override;
//    procedure SetSeriesTitle(const SeriesID: Integer; const NewSeriesTitle: string); override;
//    function AddOrLocateSeriesIDBySeriesTitle(const SeriesTitle: string): Integer; override;
//    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer); override;
//    procedure ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc); override;
//    procedure ExportUserData(data: TUserData); override;
//    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer); override;
//    procedure UpdateBook(const BookRecord: TBookRecord); override;
//    function SetReview(const BookKey: TBookKey; const Review: string): Integer; override;
//    function GetReview(const BookKey: TBookKey): string; override;
//    procedure SetProgress(const BookKey: TBookKey; Progress: Integer); override;
//    procedure SetRate(const BookKey: TBookKey; Rate: Integer); override;
//    procedure SetBookSeriesID(const BookKey: TBookKey; const SeriesID: Integer); override;
//    procedure SetFolder(const BookKey: TBookKey; const Folder: string); override;
//    procedure SetFileName(const BookKey: TBookKey; const FileName: string); override;
//    procedure SetLocal(const BookKey: TBookKey; AState: Boolean); override;
//    procedure GetBookLibID(const BookKey: TBookKey; out ARes: string); override; // deprecated;
//    procedure TruncateTablesBeforeImport; override;
//
//    procedure CompactDatabase; override;
//    procedure RepairDatabase; override;
//
//    //
//    // Bulk operation
//    //
//    procedure BeginBulkOperation; override;
//    procedure EndBulkOperation(Commit: Boolean = True); override;
//
    // Iterators:
//    function GetBookIterator1(const Mode: TBookIteratorMode; const LoadMemos: Boolean; const Filter: string = ''): IBookIterator; override;
//    function GetBookIterator2(const LoadMemos: Boolean; const SearchCriteria: TBookSearchCriteria): IBookIterator; override;
    function GetAuthorIterator(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue = nil): IAuthorIterator; override;
//    function GetGenreIterator(const Mode: TGenreIteratorMode; const Filter: string = ''): IGenreIterator; override;
    function GetSeriesIterator(const Mode: TSeriesIteratorMode): ISeriesIterator; override;

  protected
    procedure InsertGenreIfMissing(const GenreData: TGenreData); override;
//    procedure GetGenre(const GenreCode: string; var Genre: TGenreData); override;

  strict private
    FDatabase: TSQLiteDatabase; // NOT THREAD-SAFE (query parameters are stored on the object)!

    procedure GetAuthor(AuthorID: Integer; var Author: TAuthorData);
  end;

procedure CreateCollectionTables_SQLite(const DBCollectionFile: string; const GenresFileName: string);

implementation

uses
  SysUtils,
  Windows,
  Character,
  dm_user,
  unit_Consts,
  unit_Logger,
  unit_SearchUtils;

// Read provided resource file as a string list (split by ';')
// This is done as ExecSQL works with only one statement at a time
function ReadResourceAsStringList(const ResourceName: string): TStringList;
var
  ResourceStream: TStream;
  Text: String;
begin
  ResourceStream := TResourceStream.Create(HInstance, ResourceName, RT_RCDATA);
  try
    Result := TStringList.Create;

    // Load the file:
    Result.LoadFromStream(ResourceStream);

    // Clean up the text:
    Text := Result.Text;
    StrReplace(CRLF, ' ', Text);
    StrReplace(LF, ' ', Text);

    // Split by ';'
    Result.Clear;
    Result.StrictDelimiter := True; // so that spaces are ignored
    Result.Delimiter := ';';
    Result.DelimitedText := Text;
  finally
    FreeAndNil(ResourceStream);
  end;
end;

// Generate table structure and minimal data for a new collection
procedure CreateCollectionTables_SQLite(const DBCollectionFile: string; const GenresFileName: string);
var
  ADatabase: TSQLiteDatabase;
  StringList: TStringList;
  StructureDDL: String;
  BookCollection: TBookCollection;
  Logger: IIntervalLogger;
begin
  ADatabase := TSQLiteDatabase.Create(DBCollectionFile);
  try
    StringList := ReadResourceAsStringList('CreateCollectionDB_SQLite');
    try
      for StructureDDL in StringList do
      begin
        if Trim(StructureDDL) <> '' then
        begin
          Logger := GetIntervalLogger('CreateCollectionTables_SQLite', StructureDDL);
          ADatabase.ExecSQL(StructureDDL);
          Logger := nil
        end;
      end;
    finally
      FreeAndNil(StringList);
    end;
  finally
    FreeAndNil(ADatabase);
  end;

  // Now that we have the DB structure in place, can create a collection instance:
  BookCollection := TBookCollection_SQLite.Create(DBCollectionFile);
  try
    // Fill metadata version and creation date:
    BookCollection.SetPropertyS(SETTING_VERSION, DATABASE_VERSION);
    BookCollection.SetPropertyS(SETTING_CREATION_DATE, FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now));

    // Fill the Genres table:
    BookCollection.LoadGenres(GenresFileName);
  finally
    FreeAndNil(BookCollection);
  end;
end;

{ TAuthorIteratorImpl }

constructor TBookCollection_SQLite.TAuthorIteratorImpl.Create(
  Collection: TBookCollection_SQLite;
  const Mode: TAuthorIteratorMode;
  const FilterValue: PFilterValue
);
var
  pLogger: IIntervalLogger;
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollectionInfo.ID;
  FCollection := Collection;

  PrepareData(Mode, FilterValue);
end;

destructor TBookCollection_SQLite.TAuthorIteratorImpl.Destroy;
begin
  FreeAndNil(FAuthors);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TBookCollection_SQLite.TAuthorIteratorImpl.Next(out AuthorData: TAuthorData): Boolean;
var
  AuthorID: Integer;
begin
  Result := not FAuthors.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollectionInfo.ID = FCollectionID); // shouldn't happen

    AuthorID := FAuthors.FieldAsInteger(0);
    FCollection.GetAuthor(AuthorID, AuthorData);

    FAuthors.Next;
  end;
end;

function TBookCollection_SQLite.TAuthorIteratorImpl.GetNumRecords: Integer;
begin
  Result := FNumRecords;
end;

procedure TBookCollection_SQLite.TAuthorIteratorImpl.PrepareData(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue);
var
  Where: string;
  SQLRows: string;
  SQLCount: string;
  Logger: IIntervalLogger;
begin
  Where := '';
  FCollection.FDatabase.ParamsClear;

  case Mode of
    amAll:
      SQLRows := 'SELECT a.AuthorID FROM Authors a ';

    amByBook:
      begin
        Assert(Assigned(FilterValue));
        SQLRows := 'SELECT DISTINCT a.AuthorID FROM Author_List a WHERE a.BookID = :v0 ';
        FCollection.FDatabase.AddParamInt(':v0', FilterValue^.ValueInt);
      end;

    amFullFilter:
      begin
        SQLRows := 'SELECT DISTINCT a.AuthorID FROM Authors a ';
        if FCollection.HideDeleted or FCollection.ShowLocalOnly then
        begin
          SQLRows := SQLRows + ' INNER JOIN Author_List al ON a.AuthorID = al.AuthorID INNER JOIN Books b ON al.BookID = b.BookID ';
          if FCollection.HideDeleted then
          begin
            AddToWhere(Where, ' b.IsDeleted = :IsDeleted ');
            FCollection.FDatabase.AddParamBoolean(':IsDeleted', False);
          end;
          if FCollection.ShowLocalOnly then
          begin
            AddToWhere(Where, ' b.IsLocal = :IsLocal ');
            FCollection.FDatabase.AddParamBoolean(':IsLocal', True);
          end;
        end;

        // Add an author type filter:
        if FCollection.AuthorFilterType <> '' then
        begin
          if FCollection.AuthorFilterType = ALPHA_FILTER_NON_ALPHA then
          begin
            AddToWhere(Where,
              '(POS(UPPER(SUBSTRING(a.LastName, 1, 1)), ":EN") = 0) AND (POS(UPPER(SUBSTRING(a.LastName, 1, 1)), ":RU") = 0)'
            );
            FCollection.FDatabase.AddParamText(':EN', ENGLISH_ALPHABET);
            FCollection.FDatabase.AddParamText(':RU', RUSSIAN_ALPHABET);
          end
          else if FCollection.AuthorFilterType <> ALPHA_FILTER_ALL then
          begin
            Assert(Length(FCollection.AuthorFilterType) = 1);
            Assert(TCharacter.IsUpper(FCollection.AuthorFilterType, 1));
            AddToWhere(Where,
              'UPPER(a.LastName) LIKE ":FilterType%"'  // начинается на заданную букву
            );
            FCollection.FDatabase.AddParamText(':FilterType', FCollection.AuthorFilterType);
          end;
        end;
      end;

    else
      Assert(False);
  end;

  SQLRows := SQLRows + Where;
  SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';

  Logger := GetIntervalLogger('TAuthorIteratorImpl.PrepareData', SQLCount);
  FNumRecords := FCollection.FDatabase.GetTableValue(SQLCount);
  Logger := nil;

  if Mode in [amAll, amFullFilter] then
    SQLRows := SQLRows + ' ORDER BY a.LastName, a.FirstName, a.MiddleName ';

  Logger := GetIntervalLogger('TAuthorIteratorImpl.PrepareData', SQLRows);
  FAuthors := FCollection.FDatabase.GetTable(SQLRows);
  Logger := nil;
end;

{ TSeriesIteratorImpl }

constructor TBookCollection_SQLite.TSeriesIteratorImpl.Create(Collection: TBookCollection_SQLite; const Mode: TSeriesIteratorMode);
var
  pLogger: IIntervalLogger;
begin
  inherited Create;

  Assert(Assigned(Collection));

  FCollectionID := DMUser.ActiveCollectionInfo.ID;
  FCollection := Collection;

  PrepareData(Mode);
end;

destructor TBookCollection_SQLite.TSeriesIteratorImpl.Destroy;
begin
  FreeAndNil(FSeries);

  inherited Destroy;
end;

// Read next record (if present), return True if read
function TBookCollection_SQLite.TSeriesIteratorImpl.Next(out SeriesData: TSeriesData): Boolean;
begin
  Result := not FSeries.Eof;

  if Result then
  begin
    Assert(DMUser.ActiveCollectionInfo.ID = FCollectionID); // shouldn't happen
    SeriesData.SeriesID := FSeries.FieldAsInteger(0);
    SeriesData.SeriesTitle := FSeries.FieldAsString(1);
    FSeries.Next;
  end;
end;

function TBookCollection_SQLite.TSeriesIteratorImpl.GetNumRecords: Integer;
begin
  Result := FNumRecords;
end;

procedure TBookCollection_SQLite.TSeriesIteratorImpl.PrepareData(const Mode: TSeriesIteratorMode);
var
  Where: string;
  SQLRows: string;
  SQLCount: string;
  Logger: IIntervalLogger;
begin
  Where := '';
  FCollection.FDatabase.ParamsClear;

  case Mode of
    smAll:
      SQLRows := 'SELECT s.SeriesID, s.SeriesTitle FROM Series s ';

    smFullFilter:
    begin
      SQLRows := 'SELECT DISTINCT s.SeriesID, s.SeriesTitle FROM Series s ';
      if FCollection.HideDeleted or FCollection.ShowLocalOnly then
      begin
        SQLRows := SQLRows + ' INNER JOIN Books b ON s.SeriesID = b.SeriesID ';
        if FCollection.HideDeleted then
        begin
          AddToWhere(Where, ' b.IsDeleted = :IsDeleted ');
          FCollection.FDatabase.AddParamBoolean(':IsDeleted', False);
        end;
        if FCollection.ShowLocalOnly then
        begin
          AddToWhere(Where, ' b.IsLocal = :IsLocal ');
          FCollection.FDatabase.AddParamBoolean(':IsLocal', True);
        end;
      end;

      // Series type filter
      if FCollection.SeriesFilterType <> '' then
      begin
        if FCollection.SeriesFilterType = ALPHA_FILTER_NON_ALPHA then
        begin
          AddToWhere(Where,
            '(POS(UPPER(SUBSTRING(s.SeriesTitle, 1, 1)), ":EN") = 0) AND (POS(UPPER(SUBSTRING(s.SeriesTitle, 1, 1)), ":RU") = 0)'
          );
          FCollection.FDatabase.AddParamText(':EN', ENGLISH_ALPHABET);
          FCollection.FDatabase.AddParamText(':RU', RUSSIAN_ALPHABET);
        end
        else if FCollection.SeriesFilterType <> ALPHA_FILTER_ALL then
        begin
          Assert(Length(FCollection.SeriesFilterType) = 1);
          Assert(TCharacter.IsUpper(FCollection.SeriesFilterType, 1));
          AddToWhere(Where,
            'UPPER(s.SeriesTitle) LIKE ":FilterType%"'   // начинается на заданную букву
          );
          FCollection.FDatabase.AddParamText(':FilterType', FCollection.SeriesFilterType);
        end;
      end;
    end
    else
      Assert(False);
  end;

  SQLRows := SQLRows + Where;
  SQLCount := 'SELECT COUNT(*) FROM (' + SQLRows + ') ROWS ';
  SQLRows := SQLRows + ' ORDER BY s.' + SERIES_TITLE_FIELD;

  Logger := GetIntervalLogger('TSeriesIteratorImpl.PrepareData', SQLCount);
  FNumRecords := FCollection.FDatabase.GetTableValue(SQLCount);
  Logger := nil;

  Logger := GetIntervalLogger('TSeriesIteratorImpl.PrepareData', SQLRows);
  FSeries := FCollection.FDatabase.GetTable(SQLRows);
  Logger := nil;
end;

//-----------------------------------------------------------------------------

{ TBookCollection_SQLite }

constructor TBookCollection_SQLite.Create(const DBCollectionFile: string);
begin
  inherited Create;

  FDatabase := TSQLiteDatabase.Create(DBCollectionFile);
end;

destructor TBookCollection_SQLite.Destroy;
begin
  FreeAndNil(FDatabase);

  inherited Destroy;
end;

procedure TBookCollection_SQLite.SetPropertyS(PropID: Integer; const Value: string);
const
  // A special format of query with a '?' sign for the blob value
  SQL_UPDATE = 'UPDATE Settings SET SettingValue = ? WHERE ID = :v0 ';
  SQL_DELETE = 'DELETE FROM Settings WHERE ID = :v0 ';
var
  ValueStream: TStringStream;
  Logger: IIntervalLogger;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamInt(':v0', PropID);

  if Value <> '' then
  begin
    ValueStream := TStringStream.Create(Value);
    try
      Logger := GetIntervalLogger('SetPropertyS', SQL_UPDATE);
      FDatabase.UpdateBlob(SQL_UPDATE, ValueStream);
      Logger := nil;
    finally
      FreeAndNil(ValueStream);
    end;
  end
  else
  begin
    Logger := GetIntervalLogger('SetPropertyS', SQL_DELETE);
    FDatabase.ExecSQL(SQL_DELETE);
    Logger := nil;
  end;
end;

procedure TBookCollection_SQLite.InsertGenreIfMissing(const GenreData: TGenreData);
const
  SQL_SELECT = 'SELECT COUNT(*) FROM Genres WHERE GenreCode = :v0';
  SQL_INSERT = 'INSERT INTO Genres (GenreCode, ParentCode, FB2Code, GenreAlias) ' +
    'SELECT :v0, :v1, :v2, :v3 ';
var
  Logger: IIntervalLogger;
  Count: Integer;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamText(':v0', GenreData.GenreCode);
  Logger := GetIntervalLogger('InsertGenreIfMissing', SQL_SELECT);
  Count := FDatabase.GetTableValue(SQL_SELECT);
  Logger := nil;

  if Count = 0 then // A new Genre
  begin
    FDatabase.ParamsClear;
    FDatabase.AddParamText(':v0', GenreData.GenreCode);
    FDatabase.AddParamText(':v1', GenreData.ParentCode);
    FDatabase.AddParamText(':v2', GenreData.FB2GenreCode);
    FDatabase.AddParamText(':v3', GenreData.GenreAlias);
    Logger := GetIntervalLogger('InsertGenreIfMissing', SQL_INSERT);
    FDatabase.ExecSQL(SQL_INSERT);
    Logger := nil;
  end;
end;

function TBookCollection_SQLite.GetAuthorIterator(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue = nil): IAuthorIterator;
begin
  Result := TAuthorIteratorImpl.Create(Self, Mode, FilterValue);
end;

function TBookCollection_SQLite.GetSeriesIterator(const Mode: TSeriesIteratorMode): ISeriesIterator;
begin
  Result := TSeriesIteratorImpl.Create(Self, Mode);
end;

procedure TBookCollection_SQLite.GetAuthor(AuthorID: Integer; var Author: TAuthorData);
const
  SQL = 'SELECT LastName, FirstName, MiddleName FROM Authors WHERE AuthorID = :v0 ';
var
  Logger: IIntervalLogger;
  Table: TSQLiteTable;
begin
  FDatabase.ParamsClear;
  FDatabase.AddParamInt(':v0', AuthorID);

  Logger := GetIntervalLogger('CreateCollectionTables_SQLite', SQL);
  Table := FDatabase.GetTable(SQL);
  Logger := nil;

  if not Table.Eof then
  begin
    Author.AuthorID := AuthorID;
    Author.LastName := Table.FieldAsString(0);
    Author.FirstName := Table.FieldAsString(1);
    Author.MiddleName := Table.FieldAsString(2);
  end
  else
    Author.Clear;
end;

end.
