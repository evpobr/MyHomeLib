{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit unit_ImportLibRusEcThread;

interface

uses
  Classes,
  SysUtils,
  StrUtils,
  unit_WorkerThread,
  unit_MHL_xml,
  unit_globals;

type
  TImportLibRusEcThread = class(TWorker)
  private
    FDBFileName: string;
    FCollectionRoot: string;
    FCollectionType: Integer;
    FInpxFileName: string;

    FVersion: integer;

    procedure SetCollectionRoot(const Value: string);


  protected
    procedure WorkFunction; override;

  public
    function Import:integer;

    property DBFileName: string read FDBFileName write FDBFileName;
    property CollectionRoot: string read FCollectionRoot write SetCollectionRoot;
    property CollectionType: COLLECTION_TYPE read FCollectionType write FCollectionType;
    property InpxFileName: string read FInpxFileName write FInpxFileName;
  end;

implementation

uses
  unit_database,
  unit_Settings,
  unit_Consts,
  unit_Helpers,
  ZipForge;

{ TImportLibRusEcThread }

function ParseData(input: WideString; var R: TBookRecord): Boolean;
const
  DelimiterChar = Chr(4);
var
  p: integer;
  slParams: TStringList;
  AuthorList: string;
  strLastName: string;
  strFirstName: string;
  strMidName: string;
  GenreList: string;
  s: string;
  mm, dd, yy: word;
begin
  Result := False;

  R.Clear;

  slParams := TStringList.Create;
  try
    slParams.Delimiter := DelimiterChar;
    slParams.StrictDelimiter := True;
    slParams.DelimitedText := input;

    //
    // Всего 11 полей, но (!!!) при разборе в список попадет еще одно (12-е) значение,
    // т к строка оканчивается разделителем
    //
    if slParams.Count in [11, 12] then
    begin
      //
      // Список авторов
      //
      AuthorList := slParams[0];
      p := PosChr(':', AuthorList);
      while p <> 0 do
      begin
        s := Copy(AuthorList, 1, p - 1);
        Delete(AuthorList, 1, p);

        p := PosChr(',', s);
        strLastName := Copy(s, 1, p - 1);
        Delete(S, 1, p);

        p := PosChr(',', s);
        strFirstName := Copy(s, 1, p - 1);
        Delete(S, 1, p);

        strMidName := S;

        R.AddAuthor(strLastName, strFirstName, strMidName);

        p := PosChr(':', AuthorList);
      end;

      //
      // Список жанров
      //
      GenreList := slParams[1];
      p := PosChr(':', GenreList);
      while p <> 0 do
      begin
        R.AddGenre('', Copy(GenreList, 1, p - 1), '');
        Delete(GenreList, 1, p);

        p := PosChr(':', GenreList);
      end;

      //
      // Название
      //
      R.Title := slParams[2];

      //
      // Серия
      //
      R.Series := slParams[3];

      //
      // Номер внутри серии
      //
      R.SeqNumber := StrToIntDef(slParams[4], 0);

      //
      // Имя файла, размер, ????, признак удаленной книги
      //
      R.FileName := CheckSymbols(Trim(slParams[5]));
      R.Size := StrToIntDef(slParams[6], 0);
      R.LibID := StrToIntDef(slParams[7], 0);
      R.Deleted := (slParams[8] = '1');

      //
      // { TODO -oNickR -cpossible bug : params[9] содержит расширение файла, но мы используем хардкоденное значение }
      //
      R.FileExt := FB2_EXTENSION;

      //
      //
      //
      if slParams[10] <> '' then
      begin
        yy := StrToInt(Copy(slParams[10], 1, 4));
        mm := StrToInt(Copy(slParams[10], 6, 2));
        dd := StrToInt(Copy(slParams[10], 9, 2));
        R.Date := EncodeDate(yy, mm, dd);
      end;
      // else R.Date:=now;

      R.Normalize;

      Result := True;
    end;
  finally
    slParams.Free;
  end;
end;

function TImportLibRusEcThread.Import:integer;
var
  FLibrary: TMHLLibrary;

  i: Integer;
  j: Integer;
  R: TBookRecord;
  filesProcessed: Integer;
  unZip:TZipForge;
  CurrentFile: string;

  F: TextFile;

  S: UTF8String;

  ArchItem: TZFArchiveItem;
begin
  filesProcessed := 0;
  i := 0;
  FLibrary := TMHLLibrary.Create(nil);
  try
    FLibrary.DatabaseFileName := DBFileName;
    FLibrary.Active := True;

    FLibrary.BeginBulkOperation;
    try
      unZip := TZipForge.Create(Nil);
      unZip.BaseDir := Settings.TempPath;
      unZip.FileName := FInpxFileName;
      unZip.OpenArchive;
      unZip.ExtractFiles('*.*');
      try

        if (unZip.FindFirst('*.*',ArchItem,faAnyFile-faDirectory)) then
        repeat
          //
          // Используем TStringListEx для чтения UTF8 файла
          //
          CurrentFile:= ArchItem.FileName;
          Teletype(Format('Обрабатываем файл %s', [CurrentFile]), tsInfo);


          AssignFile(F,Settings.TempPath + CurrentFile);
          Reset(F);
          j := 0;
          while not Eof(F) do
          begin
            Readln(F,S);
            if ParseData(UTF8Decode(S), R) then
            begin
              if isOnlineCollection(CollectionType) then
              begin
                //
                // И\Иванов Иван\1234 Просто книга.fb2.zip
                //
                R.Folder := R.GenerateLocation + FB2ZIP_EXTENSION;

                //
                // Сохраним отметку о существовании файла
                //
                R.Local := FileExists(FCollectionRoot + R.Folder);
              end
              else
              begin
                //
                // 98058-98693.inp -> 98058-98693.zip
                //
                R.Folder := ChangeFileExt(CurrentFile, ZIP_EXTENSION);
                //
                // номер файла внутри zip-а
                //
                R.InsideNo := j;
              end;
            FLibrary.InsertBook(R);
            end;   // if
            Inc(j);
            Inc(filesProcessed);
            if (filesProcessed mod ProcessedItemThreshold) = 0 then
                SetComment(Format('Импортированно %u файлов', [filesProcessed]));
          end; // while
          CloseFile(F);
          inc(i);
          SetProgress((i + 1) * 100 div unZip.FileCount);
          if Canceled then
            Break;
        until (not unZip.FindNext(ArchItem));
      finally

      end;
      SetComment(Format('Импортированно %u файлов', [filesProcessed]));
    finally
      unZip.Free;
    end;
  finally
    FLibrary.EndBulkOperation;
    FLibrary.Free;
  end;
end;

procedure TImportLibRusEcThread.SetCollectionRoot(const Value: string);
begin
  FCollectionRoot := IncludeTrailingPathDelimiter(Value);
end;

procedure TImportLibRusEcThread.WorkFunction;
begin
  Import;
end;

end.

