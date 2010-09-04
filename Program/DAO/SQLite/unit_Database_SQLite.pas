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
  * $Id: unit_Database_SQLite.pas -1   $
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
//    // Iterators:
//    function GetBookIterator1(const Mode: TBookIteratorMode; const LoadMemos: Boolean; const Filter: string = ''): IBookIterator; override;
//    function GetBookIterator2(const LoadMemos: Boolean; const SearchCriteria: TBookSearchCriteria): IBookIterator; override;
//    function GetAuthorIterator(const Mode: TAuthorIteratorMode; const Filter: string = ''): IAuthorIterator; override;
//    function GetGenreIterator(const Mode: TGenreIteratorMode; const Filter: string = ''): IGenreIterator; override;
//    function GetSeriesIterator(const Mode: TSeriesIteratorMode; const Filter: string = ''): ISeriesIterator; override;

  protected
    procedure InsertGenreIfMissing(const GenreData: TGenreData); override;
//    procedure GetGenre(const GenreCode: string; var Genre: TGenreData); override;

  strict private
    FDatabase: TSQLiteDatabase; // NOT THREAD-SAFE!
  end;

procedure CreateCollectionTables_SQLite(const DBCollectionFile: string; const GenresFileName: string);

implementation

uses
  SysUtils,
  Windows,
  unit_Consts,
  unit_Logger;

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
  SQL = 'UPDATE Settings SET SettingValue = ? WHERE ID = :v0 ';
var
  ValueStream: TStringStream;
  Logger: IIntervalLogger;
begin
  ValueStream := TStringStream.Create(Value);
  try
    Logger := GetIntervalLogger('TBookCollection_SQLite.SetPropertyS', SQL);
    FDatabase.ParamsClear;
    FDatabase.AddParamInt(':v0', PropID);
    FDatabase.UpdateBlob(SQL, ValueStream);
    Logger := nil;
  finally
    FreeAndNil(ValueStream);
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
  Logger := GetIntervalLogger('TBookCollection_SQLite.InsertGenreIfMissing', SQL_SELECT);
  FDatabase.ParamsClear;
  FDatabase.AddParamText(':v0', GenreData.GenreCode);
  Count := FDatabase.GetTableValue(SQL_SELECT);
  Logger := nil;

  if Count = 0 then // A new Genre
  begin
    Logger := GetIntervalLogger('TBookCollection_SQLite.InsertGenreIfMissing', SQL_INSERT);
    FDatabase.ParamsClear;
    FDatabase.AddParamText(':v0', GenreData.GenreCode);
    FDatabase.AddParamText(':v1', GenreData.ParentCode);
    FDatabase.AddParamText(':v2', GenreData.FB2GenreCode);
    FDatabase.AddParamText(':v3', GenreData.GenreAlias);
    FDatabase.ExecSQL(SQL_INSERT);
    Logger := nil;
  end;
end;

end.
