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

unit unit_ImportFB2ZIPThread;

interface

uses
  unit_ImportFB2ThreadBase,
  ZipForge,
  unit_globals;

type
  TImportFB2ZIPThread = class(TImportFB2ThreadBase)
  private
    FZipper: TZipForge;

    //procedure ShowZipErrorMessage(Sender: TObject; ErrCode: Integer; Message: string);

  protected
    procedure SortFiles(var R: TBookRecord); override;
    procedure ProcessFileList; override;

  public

  end;


implementation

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_Consts,
  unit_Settings,
  fictionbook_21;

{ TImportFB2ZIPThread }

procedure TImportFB2ZIPThread.SortFiles(var R: TBookRecord);
var
  Filename, NewFilename, NewFolder: string;
  F: TZfArchiveItem;
begin
  FileName := ExtractFileName(R.Folder);

  NewFolder := GetNewFolder(Settings.FB2FolderTemplate, R);


  CreateFolders(FRootPath,NewFolder);

  CopyFile(R.Folder,
           FRootPath +  NewFolder + FileName);

  R.Folder := NewFolder + FileName;

  NewFileName := GetNewFileName(Settings.FB2FileTemplate, R);
  if NewFileName <> '' then
  begin
    NewFolder := R.Folder;
    StrReplace(Filename, NewFileName + '.fb2.zip', NewFolder);
    RenameFile(FRootPath + R.Folder, FRootPath +  NewFolder);
    R.Folder :=  NewFolder;

    try
      FZipper.FileName := FRootPath + NewFolder;
      FZipper.OpenArchive(fmOpenReadWrite);
      FZipper.FindFirst('*.fb2', F);
      FZipper.RenameFile(F.FileName, NewFileName + FB2_EXTENSION);
      FZipper.CloseArchive;
      R.FileName := NewFileName;
    except
      // ничего не делаем
    end;
  end;
end;

{
procedure TImportFB2ZIPThread.ShowZipErrorMessage(Sender: TObject; ErrCode: Integer; Message: string);
begin
  if ErrCode <> 0 then
    Teletype(Format('Ошибка распаковки архива %s, Код: %d', [FZipper.FileName, 0]), tsError);
end;
}

procedure TImportFB2ZIPThread.ProcessFileList;
var
  i: Integer;
  j: Integer;
  R: TBookRecord;
  AZipFileName: string;
  AFileName:    string;
  book: IXMLFictionBook;
  FS: TMemoryStream;
  AddCount:Integer;
  DefectCount:Integer;

  ArchiveItem: TZFArchiveItem;

  NoErrors: boolean;
begin
  AddCount := 0;
  DefectCount := 0;

  SetProgress(0);
  Teletype(Format('Обнаружено новых архивов: %u', [FFiles.Count]));

  FZipper := TZipForge.Create(nil);
//  FZipper.Options.OEMFileNames := False;
  try

    for i := 0 to FFiles.Count - 1 do
    begin
      if Canceled then
        Break;

      AZipFileName := FFiles[i];

      NoErrors := True;
      try
        FZipper.FileName := FFiles[i];
        FZipper.OpenArchive(fmOpenRead);
        j := 0;
        if (FZipper.FindFirst('*.*',ArchiveItem,faAnyFile-faDirectory)) then
        repeat
          R.Clear;

          try
            FS := TMemoryStream.Create;

            AFileName := ArchiveItem.FileName;
            R.FileExt := ExtractFileExt(AFileName);
            if R.FileExt <> FB2_EXTENSION then
            begin
              inc(j);     // переходим к следующему файлу
              Continue;
            end;
            R.FileName := ExtractShortFilename(AFileName);
            R.Size := ArchiveItem.UncompressedSize;
            R.InsideNo := j;
            R.Date := Now;
            FZipper.ExtractToStream(AFileName,FS);
            if not Assigned(FS) then
              Continue;

            try
              book := LoadFictionBook(FS);
              GetBookInfo(book, R);
              if not Settings.EnableSort then
              begin
                R.Folder := ExtractRelativePath(FRootPath, AZipFileName);
                if FLibrary.InsertBook(R, True, True)<>0 Then Inc(AddCount);
              end;
            except
              on e: Exception do
              begin
                NoErrors := False;
                Teletype('Ошибка структуры fb2: ' + AZipFileName + ' -> ' + R.FileName + FB2_EXTENSION, tsError);
                //Teletype(e.Message, tsError);
                Inc(DefectCount);
              end;
            end;
          finally
            FS.Free;
          end;
          inc(j);
        until (not FZipper.FindNext(ArchiveItem));
        FZipper.CloseArchive;
        if Settings.EnableSort and NoErrors and (j = 1) then
        begin
          R.Folder := AZipFileName;
          SortFiles(R);
          if FLibrary.InsertBook(R, True, True)<>0 Then Inc(AddCount);
        end;
      except
        on e: Exception do
           Teletype('Ошибка распаковки архива: ' + AZipFileName, tsError);
      end;
      if (i mod ProcessedItemThreshold) = 0 then
        SetComment(Format('Обработано архивов: %u из %u', [i + 1, FFiles.Count]));
      SetProgress((i + 1) * 100 div FFiles.Count);
    end;
  finally
    FreeAndNil(FZipper);
  end;

  SetComment(Format('Обработано архивов: %u из %u', [FFiles.Count, FFiles.Count]));

  if FFiles.Count > 0 then
    Teletype(Format('Добавленo книг: %u, пропущено книг: %u', [AddCount, DefectCount]));
end;

end.

