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
  Classes,
  SysUtils,
  unit_WorkerThread,
  Windows;

type
  TSyncOnLineThread = class(TWorker)
  private

  protected
    procedure WorkFunction; override;
  public

  end;

implementation

uses
  dm_user,
  dm_main,
  globals,
  database,
  unit_Consts;

{ TImportXMLThread }

procedure TSyncOnLineThread.WorkFunction;
var
  totalBooks: Integer;
  processedBooks: Integer;
  Root: string;
  IDStr: string;
  TmpFolder: String;
begin
  totalBooks := DMMain.tblBooks.RecordCount;
  processedBooks := 0;
  Root := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  try
    DMMain.tblBooks.First;
    while not DMMain.tblBooks.Eof do
    begin
      if Canceled then
          Exit;

      //  Переименовывание старых файлов
      //  проверяем, есть ли файл в старом формате (без ID в имени файла)
      //
      { TODO -oAlex : Через какое-то время переименовывание можно будет убрать }
      IDStr := DMMain.tblBooksLibID.AsString + ' ';
      TmpFolder := DMMain.tblBooksFolder.Value;
      StrReplace(IDStr, '', TmpFolder);              // удаляем Id из имени
      if FileExists(Root + TmpFolder)  then
      begin
          // если есть, переименовываем и результат заносим в базу
        DMMain.tblBooks.Edit;
        DMMain.tblBooksLocal.Value := RenameFile(Root + TmpFolder, Root + DMMain.tblBooksFolder.Value);
        DMMain.tblBooks.Post;
      end;

      //
      //  Проверяем был ли файл закачан ранее и ставим отметку в базу
      //

      DMMain.tblBooks.Edit;
      DMMain.tblBooksLocal.Value := FileExists(Root + DMMain.tblBooksFolder.Value);
      DMMain.tblBooks.Post;

      DMMain.tblBooks.Next;

      Inc(processedBooks);
      if (processedBooks mod ProcessedItemThreshold) = 0 then
          SetComment(Format('Обработано книг: %u из %u', [processedBooks, totalBooks]));
      SetProgress(processedBooks * 100 div totalBooks);
    end;
    SetComment(Format('Обработано книг: %u из %u', [processedBooks, totalBooks]));
  finally
  end;
end;

end.

