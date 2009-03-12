{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 1.1                                                                  }
{                                                                              }
{ Copyright (c) 2009 Aleksey Penkov  alex.penkov@gmail.com                     }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit unit_SyncFoldersThread;

interface

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  files_list,
  Windows;

type
  TSyncFoldersThread = class(TWorker)
  private
    FFiles:   TFilesList;

    FList:   TStringList;

    FRootPath: string;
  protected
    procedure OnFile(Sender: TObject; const F: TSearchRec);
    procedure WorkFunction; override;
    function FindNewFolder(FileName: String):String;
  public

  end;

implementation

uses
  dm_user,
  dm_collection,
  unit_globals,
  unit_database,
  unit_Consts;

{ TImportXMLThread }

function TSyncFoldersThread.FindNewFolder(FileName: String): String;
var
  i: integer;
begin
  Result := '*';
  for I := 0 to FList.Count - 1 do
    if pos(FileName,FList[i]) <> 0 then
      Result := ExtractRelativePath(FRootPath,ExtractFilePath(FList[i]));
end;

procedure TSyncFoldersThread.OnFile(Sender: TObject; const F: TSearchRec);
begin
  FList.Add(FFiles.LastDir + F.Name + ' ' + IntToStr(F.Size));
end;

procedure TSyncFoldersThread.WorkFunction;
var
  totalBooks: Integer;
  processedBooks: Integer;
  FileName: String;
  Folder: String;
  NewFolder: String;
begin
  totalBooks := DMCollection.tblBooks.RecordCount;
  processedBooks := 0;
  FRootPath := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  FFiles := TFilesList.Create(nil);
  FFiles.OnFile := OnFile;
  FFiles.TargetPath := DMUser.ActiveCollection.RootFolder;

  FList := TStringList.Create;

  try
    SetComment('Построение списка файлов ...');
    FFiles.Process;

    DMCollection.tblBooks.First;
    while not DMCollection.tblBooks.Eof do
    begin
      if Canceled then
          Exit;

      Folder := DMCollection.tblBooksFolder.Value;
      FileName := DMCollection.tblBooksFileName.Value + DMCollection.tblBooksExt.Value;

      if not FileExists(FRootPath + Folder + FileName)  then
      begin
        NewFolder := FindNewFolder(FileName + ' ' + DMCollection.tblBooksSize.AsString);
        if NewFolder <> '*' then
        begin
          DMCollection.tblBooks.Edit;
          DMCollection.tblBooksFolder.Value := NewFolder;
          DMCollection.tblBooks.Post;
        end;
      end;
      DMCollection.tblBooks.Next;

      Inc(processedBooks);
      if (processedBooks mod ProcessedItemThreshold) = 0 then
          SetComment(Format('Обработано книг: %u из %u', [processedBooks, totalBooks]));
      SetProgress(processedBooks * 100 div totalBooks);
    end;
    SetComment(Format('Обработано книг: %u из %u', [processedBooks, totalBooks]));
  finally
    FFiles.Free;
    FList.Free;
  end;
end;

end.
