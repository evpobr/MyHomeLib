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

unit unit_ImportXMLThread;

interface

uses
  Classes,
  unit_WorkerThread,
  unit_globals,
  unit_MHL_xml;

type
  TImportXMLThread = class(TWorker)
  private
    FXMLFileName: string;
    FDBFileName: string;
    FCollectionName: string;
    FCollectionType: Integer;

  protected
    procedure WorkFunction; override;

  public
    property XMLFileName: string read FXMLFileName write FXMLFileName;
    property DBFileName: string read FDBFileName write FDBFileName;

    property CollectionName: string read FCollectionName write FCollectionName;
    property CollectionType: COLLECTION_TYPE read FCollectionType write FCollectionType;

    procedure Start;
  end;

implementation

uses
  SysUtils,
  Windows,
  unit_database;

resourcestring
  rstrOpeningXMLFileMsg = 'Читаем файл. Пожалуйста, подожите...';
  rstrImportingMsg = 'Импортируем...';
  rstrCollectionTypeMismatchErrorMsg = 'Тип импортируемых данных не соответствует типу коллекции!';
  rstrCollectionNameMismatchWarningMsg = 'Название импортируемой коллекции не совпадает.';

{ TImportXMLThread }

procedure TImportXMLThread.Start;
begin
  WorkFunction;
end;

procedure TImportXMLThread.WorkFunction;
var
  FCollection: IXMLCollection;
  FLibrary: TMHLLibrary;
  BookList: IXMLBookList;
  Book: IXMLBook;
  totalBooks: Integer;
  R: TBookRecord;
  i: Integer;
  j: Integer;
begin
  SetComment(rstrOpeningXMLFileMsg);

  FCollection := LoadCollection(FXMLFileName);
  try
    if Canceled then
      Exit;

    if FCollection.Info.Code <> CollectionType then
    begin
      ShowMessage(rstrCollectionTypeMismatchErrorMsg, MB_OK or MB_ICONERROR);
      Exit;
    end;

    if FCollection.Info.Name <> CollectionName then
      Teletype(rstrCollectionNameMismatchWarningMsg, tsWarning);

    FLibrary := TMHLLibrary.Create(nil);
    try
      FLibrary.DatabaseFileName := FDBFileName;
      FLibrary.Active := True;

      BookList := FCollection.BookList;

      SetComment(rstrImportingMsg);

      FLibrary.BeginBulkOperation;
      try
        totalBooks := BookList.Count;
        for i := 0 to totalBooks - 1 do
        begin
          R.Clear;

          Book := BookList.Items[i];

          for j := 0 to Book.AuthorList.Count - 1 do
            R.AddAuthor(Book.AuthorList.Items[j].Family, Book.AuthorList.Items[j].Name, Book.AuthorList.Items[j].Middle);

          for j := 0 to Book.GenreList.Count - 1 do
            R.AddGenreFB2(Book.GenreList.Items[j].MHL_Code, Book.GenreList.Items[j].Fb2_Code, '');

          R.Title := Book.Title;
          R.Series := Book.Series;
          R.SeqNumber := Book.No;
          R.Folder := Book.File_.Folder;
          R.FileName := Book.File_.Name;
          R.Size := Book.File_.Size;
          R.FileExt := Book.File_.Ext;
          R.InsideNo := Book.File_.Inside_no;
          R.Date := StrToDate(Book.Date);

          FLibrary.InsertBook(R, True, True);

          if ((i + 1) mod ProcessedItemThreshold) = 0 then
            SetComment(Format('Импортированно %u книг', [(i + 1)]));
          SetProgress((i + 1) * 100 div totalBooks);

          if Canceled then
            Break;
        end;
      finally
        FLibrary.EndBulkOperation;
      end;
    finally
      FreeAndNil(FLibrary);
    end;
  finally
    FCollection := nil;
  end;
end;

end.

