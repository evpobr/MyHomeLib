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
  unit_Consts,
  unit_MHL_strings,
  unit_Globals,
  unit_Database,
  unit_Database_Abstract,
  unit_Interfaces;

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
  NewFolder: string;
  BookCollection: TBookCollection;
  BookIterator: IBookIterator;
  BookRecord: TBookRecord;
begin
  processedBooks := 0;
  FRootPath := DMUser.ActiveCollectionInfo.RootPath;

  FFiles := TFilesList.Create(nil);
  try
    FFiles.OnFile := OnFile;
    FFiles.TargetPath := DMUser.ActiveCollectionInfo.RootFolder;

    FList := TStringList.Create;
    try
      SetComment(rstrBuildingFileList);
      FFiles.Process;

      BookCollection := GetActiveBookCollection;
      BookIterator := BookCollection.GetBookIterator1(bmAll, True);
      totalBooks := BookIterator.GetNumRecords;
      while BookIterator.Next(BookRecord) do
      begin
        if Canceled then
          Exit;

        if not FileExists(BookRecord.GetBookFileName)  then
        begin
          NewFolder := FindNewFolder(BookRecord.FileName + ' ' + IntToStr(BookRecord.Size));
          if NewFolder <> '*' then
          begin
            BookRecord.Folder := NewFolder;
            BookCollection.SetFolder(BookRecord.BookKey, BookRecord.Folder);
          end;
        end;

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
