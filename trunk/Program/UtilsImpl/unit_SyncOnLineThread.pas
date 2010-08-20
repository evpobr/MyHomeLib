{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit unit_SyncOnLineThread;

interface

uses
  Windows,
  Classes,
  SysUtils,
  unit_WorkerThread;

type
  TSyncOnLineThread = class(TWorker)
  private
    FCollectionID: Integer;
    FCollectionRoot: string;

    procedure SetCollectionRoot(const Value: string);

  protected
    procedure WorkFunction; override;

  public
    property CollectionID: Integer read FCollectionID write FCollectionID;
    property CollectionRoot: string read FCollectionRoot write SetCollectionRoot;
  end;

implementation

uses
  Forms,
  IOUtils,
  dm_user,
  dm_collection,
  unit_Globals,
  unit_Settings,
  unit_MHL_strings,
  unit_Messages;

resourcestring
  rstrProblemsWithABook = 'Какие-то проблемы с книгой ';

{ TImportXMLThread }

procedure TSyncOnLineThread.SetCollectionRoot(const Value: string);
begin
  FCollectionRoot := IncludeTrailingPathDelimiter(Value);
end;

procedure TSyncOnLineThread.WorkFunction;
var
  BookFile: string;
  BookKey: TBookKey;

  totalBooks: Integer;
  processedBooks: Integer;

  IsLocal: Boolean;
begin
  totalBooks := DMCollection.tblBooks.RecordCount;
  processedBooks := 0;

  DMCollection.tblBooks.First;
  while not DMCollection.tblBooks.Eof do
  begin
    if Canceled then
      Exit;

    try
      //
      //  Проверяем был ли файл закачан ранее и ставим отметку в базу
      //
      // TODO -cBug: это работает не всегда. См. схему хранения расположения книги
      //
      BookFile := TPath.Combine(FCollectionRoot, DMCollection.tblBooksFolder.Value);
      IsLocal := FileExists(BookFile);

      if Settings.DeleteDeleted and IsLocal and DMCollection.tblBooksDeleted.Value then
      begin
        SysUtils.DeleteFile(BookFile);
        IsLocal := False;
      end;

      if DMCollection.tblBooksLocal.Value <> IsLocal then
      begin
        BookKey.Init(DMCollection.tblBooksID.Value, FCollectionID);
        unit_Messages.BookLocalStatusChanged(BookKey, IsLocal);
      end;
    except
      on E: Exception do
        Application.MessageBox(PChar(rstrProblemsWithABook + BookFile), '', MB_OK);
    end;

    DMCollection.tblBooks.Next;

    Inc(processedBooks);
    if (processedBooks mod ProcessedItemThreshold) = 0 then
      SetComment(Format(rstrBookProcessedMsg2, [processedBooks, totalBooks]));
    SetProgress(processedBooks * 100 div totalBooks);
  end;

  SetComment(Format(rstrBookProcessedMsg2, [processedBooks, totalBooks]));
end;

end.

