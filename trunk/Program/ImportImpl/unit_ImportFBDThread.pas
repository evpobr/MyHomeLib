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
    constructor Create;
  end;
implementation

uses
  Classes,
  SysUtils,
  IOUtils,
  unit_WorkerThread,
  FictionBook_21,
  unit_Consts,
  unit_Settings;

resourcestring
  rstrFoundNewArchives = 'Обнаружено новых архивов: %u';
  rstrErrorFB2Structure = 'Ошибка структуры fb2: %s -> %s.fbd';
  rstrErrorFBD = 'Ошибка FBD: ';
  rstrErrorUnpacking = 'Ошибка распаковки архива: ';
  rstrProcessedArchives = 'Обработано архивов: %u из %u';
  rstrBooksAdded = 'Добавленo книг: %u, пропущено книг: %u';

{ TImportFB2Thread }

constructor TImportFBDThread.Create;
begin
  inherited Create;

  FTargetExt := ZIP_EXTENSION;
  FZipFolder := False;
  FFullNameSearch := True;
end;

procedure TImportFBDThread.SortFiles(var R: TBookRecord);
var
  NewFileName, NewFolder, Ext: string;
  F:  TZFArchiveItem;
begin
  NewFolder := GetNewFolder(Settings.FBDFolderTemplate, R);

  CreateFolders(FRootPath, NewFolder);
  CopyFile(Settings.ImportPath + R.FileName, FRootPath + NewFolder + R.FileName);
  R.Folder := NewFolder;

  NewFileName := GetNewFileName(Settings.FBDFileTemplate, R);
  if NewFileName <> '' then
  begin
    NewFileName := NewFileName;
    RenameFile(FRootPath + NewFolder + R.FileName, FRootPath + NewFolder + NewFileName + ZIP_EXTENSION);
    R.FileName := NewFileName + ZIP_EXTENSION;

    try
      FZipper.FileName := FRootPath + NewFolder + NewFileName + ZIP_EXTENSION;
      FZipper.OpenArchive(fmOpenReadWrite);

      if (FZipper.FindFirst('*.*', F,faAnyFile-faDirectory)) then
      repeat
        Ext := ExtractFileExt(F.FileName);
        FZipper.RenameFile(F.FileName, NewFileName + Ext);
      until (not FZipper.FindNext(F));
      FZipper.CloseArchive;
    except
      // ничего не делаем
    end;
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
  Teletype(Format(rstrFoundNewArchives, [FFiles.Count]));

  FZipper := TZipForge.Create(nil);
//  FZipper.Options.OEMFileNames := False;
  try

    for i := 0 to FFiles.Count - 1 do
    begin
      if Canceled then
        Break;
      IsValid := False;
      AZipFileName := FFiles[i];

      Assert(ExtractFileExt(AZipFileName) = ZIP_EXTENSION);
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
              GetBookInfo(book, R);
              IsValid := True;
              FBDFileName := TPath.GetFileNameWithoutExtension(ArchiveItem.FileName);
            except
              on e: Exception do
              begin
                Teletype(Format(rstrErrorFB2Structure, [AZipFileName, R.FileName]), tsError);
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
              BookFileName := TPath.GetFileNameWithoutExtension(ArchiveItem.FileName);
              R.Size := FZipper.Size;
            end;
          inc(j);
        until (not FZipper.FindNext(ArchiveItem));
        FZipper.CloseArchive;

        if Settings.EnableSort then
          SortFiles(R);

        if IsValid and (BookFileName = FBDFileName) and (FLibrary.InsertBook(R, True, True)<>0) then
          Inc(AddCount)
        else
        begin
          Teletype(rstrErrorFBD + AZipFileName, tsError);
          Inc(DefectCount);
        end;
      except
        on e: Exception do
          Teletype(rstrErrorUnpacking + AZipFileName, tsError);
      end;

      if (i mod ProcessedItemThreshold) = 0 then
        SetComment(Format(rstrProcessedArchives, [i + 1, FFiles.Count]));
      SetProgress((i + 1) * 100 div FFiles.Count);
    end;
  finally
    FreeAndNil(FZipper);
  end;

  SetComment(Format(rstrProcessedArchives, [FFiles.Count, FFiles.Count]));

  if FFiles.Count > 0 then
    Teletype(Format(rstrBooksAdded, [AddCount, DefectCount]));
end;

end.

