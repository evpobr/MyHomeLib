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

  protected
    procedure WorkFunction; override;

  public

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

{ TImportXMLThread }

procedure TSyncOnLineThread.WorkFunction;
var
  DatabaseID: Integer;
  Root: string;
  BookFile: string;

  totalBooks: Integer;
  processedBooks: Integer;

  IsLocal: Boolean;
begin
  totalBooks := dmCollection.tblBooks.RecordCount;
  processedBooks := 0;
  DatabaseID := DMUser.ActiveCollection.ID;
  Root := DMUser.ActiveCollection.RootPath;

  dmCollection.tblBooks.First;
  while not dmCollection.tblBooks.Eof do
  begin
    if Canceled then
        Exit;

    try
      //
      //  Проверяем был ли файл закачан ранее и ставим отметку в базу
      //
      // TODO -cBug: это работает не всегда. См. схему хранения расположения книги
      //
      BookFile := TPath.Combine(Root, dmCollection.tblBooksFolder.Value);
      IsLocal := FileExists(BookFile);

      if Settings.DeleteDeleted and IsLocal and dmCollection.tblBooksDeleted.Value then
      begin
        SysUtils.DeleteFile(BookFile);
        IsLocal := False;
      end;

      if dmCollection.tblBooksLocal.Value <> IsLocal then
        unit_Messages.BookLocalStatusChanged(dmCollection.tblBooksId.Value, DatabaseID, IsLocal);
    except
      on E:Exception do
        Application.MessageBox(PChar('Какие-то проблемы с книгой ' + BookFile), '', MB_OK);
    end;

    dmCollection.tblBooks.Next;

    Inc(processedBooks);
    if (processedBooks mod ProcessedItemThreshold) = 0 then
        SetComment(Format(rstrBookProcessedMsg2, [processedBooks, totalBooks]));
    SetProgress(processedBooks * 100 div totalBooks);
  end;

  SetComment(Format(rstrBookProcessedMsg2, [processedBooks, totalBooks]));
end;

end.

