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

unit unit_ImportFBDThread;

interface

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_ImportFB2ThreadBase,
  ZipForge,
  unit_globals;

type
  TImportFBDThread = class(TImportFB2ThreadBase)
  private
    FZipper: TZipForge;
  protected
    procedure ProcessFileList; override;
    procedure SortFiles(var R: TBookRecord); override;
  public

  end;
implementation

uses
  FictionBook_21,
  unit_Helpers,
  unit_Consts,
  unit_Settings;

{ TImportFB2Thread }

procedure TImportFBDThread.SortFiles(var R: TBookRecord);
var
  NewFilename, NewFolder: string;
begin
  NewFolder := GetNewFolder(Settings.FBDFolderTemplate, R);

  CreateFolders(FRootPath,NewFolder);
  CopyFile(Settings.InputFolder + R.FileName,
           FRootPath + NewFolder + R.FileName);
  R.Folder := NewFolder;

  NewFileName := GetNewFileName(Settings.FBDFileTemplate, R);
  if NewFileName <> '' then
  begin
    RenameFile(NewFolder + R.FileName,
               NewFolder + NewFileName);
    R.FileName := NewFileName;
  end;
end;

procedure TImportFBDThread.ProcessFileList;
var
  i: Integer;
  j: Integer;
  R: TBookRecord;
  AZipFileName, Ext: string;
  BookFileName, FBDFileName: string;
  book: IXMLFictionBook;
  FS: TMemoryStream;
  AddCount:Integer;
  DefectCount:Integer;
  IsValid : boolean;
  ArchiveItem: TZFArchiveItem;

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
      IsValid := False;
      //
      // Обрабатываемый файл: H:\eBooks\Л\Лаберж Стивен\Исследование мира осознанных сновидений.fb2.zip
      //

      //
      // Л\Лаберж Стивен\Исследование мира осознанных сновидений.fb2.zip
      //


      AZipFileName := FFiles[i];

      Assert(ExtractFileExt(AZipFileName) = ZIP_EXTENSION);

      //
      // H:\eBooks\Л\Лаберж Стивен\Исследование мира осознанных сновидений.fb2.zip
      //
      FZipper.FileName := AZipFileName;
      try
        FZipper.OpenArchive(fmOpenRead);
        j := 0;
        R.Clear;
        if (FZipper.FindFirst('*.*',ArchiveItem,faAnyFile-faDirectory)) then
        repeat
          Ext := ExtractFileExt(ArchiveItem.FileName);
          if  Ext = '.fbd' then
          try
            FS := TMemoryStream.Create;
            R.Folder := ExtractRelativePath(FRootPath,ExtractFilePath(FFiles[i]));
            R.FileName := ExtractFilename(FFiles[i]);
            R.Date := Now;
            FZipper.ExtractToStream(ArchiveItem.FileName,FS);
            if not Assigned(FS) then
              Continue;
            try
              book := LoadFictionBook(FS);
              GetBookInfo(Book, R);
              IsValid := True;
              FBDFileName := ExtractShortFileName(ArchiveItem.FileName);
            except
              on e: Exception do
              begin
                Teletype('Ошибка структуры fb2: ' + AZipFileName + ' -> ' + R.FileName + '.fbd', tsError);
                //Teletype(e.Message, tsError);
                Inc(DefectCount);
              end;
            end; //try
          finally
            FS.Free;
          end
          else
            begin
              R.InsideNo := j;
              R.FileExt := Ext;
              BookFileName := ExtractShortFileName(ArchiveItem.FileName);
              R.Size := FZipper.Size;
            end;
          inc(j);
        until (not FZipper.FindNext(ArchiveItem));
        FZipper.CloseArchive;

        if Settings.EnableSort then SortFiles(R);


        if IsValid and (BookFileName = FBDFileName)
           and (FLibrary.InsertBook(R, True, True)<>0)
            Then Inc(AddCount)
            else Teletype('Ошибка FBD: ' + AZipFileName, tsError);


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

