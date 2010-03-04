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
    function FindNewFolder(const FileName: String):String;
  public

  end;

implementation

uses
  dm_user,
  dm_collection,
  unit_Consts;

{ TImportXMLThread }

function TSyncFoldersThread.FindNewFolder(const FileName: String): String;
var
  i: integer;
begin
  Result := '*';
  for I := 0 to FList.Count - 1 do
    if pos(FileName, FList[i]) <> 0 then
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
  totalBooks := dmCollection.tblBooks.RecordCount;
  processedBooks := 0;
  FRootPath := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  FFiles := TFilesList.Create(nil);
  FFiles.OnFile := OnFile;
  FFiles.TargetPath := DMUser.ActiveCollection.RootFolder;

  FList := TStringList.Create;

  try
    SetComment('Построение списка файлов ...');
    FFiles.Process;

    dmCollection.tblBooks.First;
    while not dmCollection.tblBooks.Eof do
    begin
      if Canceled then
          Exit;

      Folder := dmCollection.tblBooksFolder.Value;
      if  ExtractFileExt(dmCollection.tblBooksFileName.Value) <> ZIP_EXTENSION then
        FileName := dmCollection.tblBooksFileName.Value + dmCollection.tblBooksExt.Value
      else
        FileName := dmCollection.tblBooksFileName.Value;

      if not FileExists(FRootPath + Folder + FileName)  then
      begin
        NewFolder := FindNewFolder(FileName + ' ' + dmCollection.tblBooksSize.AsString);
        if NewFolder <> '*' then
        begin
          dmCollection.tblBooks.Edit;
          dmCollection.tblBooksFolder.Value := NewFolder;
          dmCollection.tblBooks.Post;
        end;
      end;
      dmCollection.tblBooks.Next;

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
