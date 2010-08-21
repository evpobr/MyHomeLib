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
    FFiles: TFilesList;
    FList: TStringList;
    FRootPath: string;

    procedure OnFile(Sender: TObject; const F: TSearchRec);
    function FindNewFolder(const FileName: string): string;

  protected
    procedure WorkFunction; override;
  end;

implementation

uses
  dm_user,
  dm_collection,
  unit_Consts,
  unit_MHL_strings;

resourcestring
  rstrBuildingFileList = 'Построение списка файлов ...';

{ TImportXMLThread }

function TSyncFoldersThread.FindNewFolder(const FileName: string): string;
var
  i: Integer;
begin
  Result := '*';
  for i := 0 to FList.Count - 1 do
    if Pos(FileName, FList[i]) <> 0 then
      Result := ExtractRelativePath(FRootPath, ExtractFilePath(FList[i]));
end;

procedure TSyncFoldersThread.OnFile(Sender: TObject; const F: TSearchRec);
begin
  FList.Add(FFiles.LastDir + F.Name + ' ' + IntToStr(F.Size));
end;

procedure TSyncFoldersThread.WorkFunction;
var
  totalBooks: Integer;
  processedBooks: Integer;
  FileName: string;
  Folder: string;
  NewFolder: string;
begin
  totalBooks := DMCollection.tblBooks.RecordCount;
  processedBooks := 0;
  FRootPath := DMUser.ActiveCollection.RootPath;

  FFiles := TFilesList.Create(nil);
  try
    FFiles.OnFile := OnFile;
    FFiles.TargetPath := DMUser.ActiveCollection.RootFolder;

    FList := TStringList.Create;
    try
      SetComment(rstrBuildingFileList);
      FFiles.Process;

      DMCollection.tblBooks.First;
      while not DMCollection.tblBooks.Eof do
      begin
        if Canceled then
          Exit;

        Folder := DMCollection.tblBooksFolder.Value;
        if  ExtractFileExt(DMCollection.tblBooksFileName.Value) <> ZIP_EXTENSION then
          FileName := DMCollection.tblBooksFileName.Value + DMCollection.tblBooksExt.Value
        else
          FileName := DMCollection.tblBooksFileName.Value;

        if not FileExists(FRootPath + Folder + FileName)  then
        begin
          NewFolder := FindNewFolder(FileName + ' ' + DMCollection.tblBooksSize.AsString);
          if NewFolder <> '*' then
          begin
            DMCollection.tblBooks.Edit;
            try
              DMCollection.tblBooksFolder.Value := NewFolder;
              DMCollection.tblBooks.Post;
            except
              DMCollection.tblBooks.Cancel;
              raise;
            end;
          end;
        end;
        DMCollection.tblBooks.Next;

        Inc(processedBooks);
        if (processedBooks mod ProcessedItemThreshold) = 0 then
            SetComment(Format(rstrBookProcessedMsg2, [processedBooks, totalBooks]));
        SetProgress(processedBooks * 100 div totalBooks);
      end;

      SetComment(Format(rstrBookProcessedMsg2, [processedBooks, totalBooks]));
    finally
      FList.Free;
    end;
  finally
    FFiles.Free;
  end;
end;

end.
