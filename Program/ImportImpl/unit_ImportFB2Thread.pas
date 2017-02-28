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

unit unit_ImportFB2Thread;

interface

uses
  Winapi.Windows,
  unit_ImportFB2ThreadBase,
  unit_Globals,
  unit_MHLArchiveHelpers;

type

  TImportFB2Thread = class(TImportFB2ThreadBase)
  protected
    FAddCount:Integer;
    FDefectCount:Integer;
    FArchAdded: Integer;
    FFb2Added: Integer;

    procedure WorkFunction; override;
    procedure ProcessFileList; override;
    procedure ProcessFileListArchive; override;
    procedure SortFilesZip(var R: TBookRecord);
  public
    constructor Create(const CollectionID: Integer;  const ArchiveFormat: TArchiveFormat);

  end;

implementation

uses
  Classes,
  SysUtils,
  IOUtils,
  jclCompression,
  unit_WorkerThread,
  FictionBook_21,
  unit_Helpers,
  unit_Consts,
  dm_user,
  unit_Templater,
  unit_Settings;

resourcestring
  rstrStructureError = 'Ошибка структуры fb2: %s.zip -> %s';
  rstrProcessedFiles = 'Обработано файлов: %u из %u';
  rstrAddedFiles = 'Добавлено файлов: %u из %u';
  rstrErrorUnpackingWithCode = 'Ошибка распаковки архива %s, Код: %d';
  rstrFoundNewArchives = 'Обнаружено новых архивов: %u';
  rstrErrorFB2Structure = 'Ошибка структуры fb2: %s -> %s';
  rstrErrorUnpacking = 'Ошибка распаковки архива: ';
  rstrProcessedArchives = 'Обработано архивов: %u из %u';
  rstrAddedBooks = 'Добавленo книг: %u,; пропущено книг: %u';
  rstrAddedBooksTotal = 'Добавленo всего книг: %u; пропущено всего книг: %u';
  rstrImportFB2 = 'Импорт файлов fb2:';
  rstrImportFB2Zip = 'Импорт файлов fb2.zip:';

{ TImportFB2Thread }

constructor TImportFB2Thread.Create;
begin
  inherited Create(CollectionID);

  FFullNameSearch := False;
  FArchiveFormat := ArchiveFormat;

end;

procedure TImportFB2Thread.ProcessFileList;
var
  i: Integer;
  R: TBookRecord;
  book: IXMLFictionBook;
  FileName: string;

  Added, Defective: integer;

begin
  Added := 0; Defective := 0;

  FProgressEngine.BeginOperation(FFiles.Count, rstrProcessedFiles, rstrProcessedFiles);
  try
    try
      for i := 0 to FFiles.Count - 1 do
      begin
        if Canceled then
          Break;

        R.Clear;
        FileName := ExtractFileName(FFiles[i]);
        R.FileExt := ExtractFileExt(FileName);
        R.FileName := TPath.GetFileNameWithoutExtension(CleanFileName(FileName));

        R.Size := unit_Helpers.GetFileSize(FFiles[i]);
        R.Date := Now;
        Include(R.BookProps, bpIsLocal);
        try
          if Settings.EnableSort then
          begin
            R.Folder := ExtractFilePath(FFiles[i]);
            book := LoadFictionBook(FFiles[i]);
            GetBookInfo(book, R);
            SortFiles(R); // изменит R.Folder и R.FileName
          end
          else
          begin
            R.Folder := ExtractRelativePath(FCollectionRoot, ExtractFilePath(FFiles[i]));
            book := LoadFictionBook(FFiles[i]);
            GetBookInfo(book, R);
          end;
          FCollection.InsertBook(R, True, True);
          Inc(Added);
        except
          on e: Exception do
          begin
            Teletype(Format(rstrStructureError, [R.Folder, R.FileName + FB2_EXTENSION]), tsError);
            Inc(Defective);
          end;
        end;

        FProgressEngine.AddProgress;
      end;
    finally
    end;

    Teletype(Format(rstrAddedBooks, [Added, Defective]),tsInfo);
    FAddCount := Added;
    FDefectCount := Defective;
  finally
    FProgressEngine.EndOperation;
  end;
end;

procedure TImportFB2Thread.ProcessFileListArchive;
var
  i, j: Integer;
  R: TBookRecord;
  AFileName:    string;
  book: IXMLFictionBook;
  FS: TMemoryStream;

  NoErrors: boolean;
  numFb2FilesInZip: Integer;
  Zip: TJclZipDecompressArchive;
  Added, Defective: integer;

begin
  Added := 0; Defective := 0;

  FProgressEngine.BeginOperation(FFiles.Count, rstrProcessedArchives, rstrProcessedArchives);
  try
    for i := 0 to FFiles.Count - 1 do
    begin
      if Canceled then
        Break;

      NoErrors := True;
      try
        try
          Zip := TJclZipDecompressArchive.Create(FFiles[i]);
          Zip.ListFiles;
          numFb2FilesInZip := 0;
          if Zip.ItemCount > 0 then
          for J := 0 to Zip.ItemCount - 1 do
          begin
            R.Clear;
            AFileName := String(Zip.Items[J].PackedName);
            R.FileExt := ExtractFileExt(AFileName);
            if R.FileExt = FB2_EXTENSION then
            begin
              Inc(numFb2FilesInZip);

              R.FileName := TPath.GetFileNameWithoutExtension(CleanFileName(AFileName));

              R.Size := Integer(Zip.Items[J].FileSize);
              R.InsideNo := j;
              R.Date := Now;
              Include(R.BookProps, bpIsLocal);
              FS := TMemoryStream.Create;
              Zip.Items[J].Stream := FS;
              Zip.Items[J].Selected := True;
              Zip.ExtractSelected;
              try
                try
                  book := LoadFictionBook(FS);
                  GetBookInfo(book, R);
                  if not Settings.EnableSort then
                  begin
                    R.Folder := ExtractRelativePath(FCollectionRoot, FFiles[i]);
                    if FCollection.InsertBook(R, True, True) <> 0 then
                      Inc(Added);
                  end;
                except
                  on e: Exception do
                  begin
                    NoErrors := False;
                    Teletype(Format(rstrErrorFB2Structure, [FFiles[i], R.FileName + FB2_EXTENSION]), tsError);
                    //Teletype(e.Message, tsError);
                    Inc(Defective);
                  end;
                end;
              finally
                Zip.Items[J].ReleaseStream;
                Zip.Items[J].Selected := False;
                FreeAndNil(FS);
              end;
            end;
          end;
          if Settings.EnableSort and NoErrors and (numFb2FilesInZip = 1) then
          begin
            R.Folder := FFiles[i];
            SortFilesZip(R);
            if FCollection.InsertBook(R, True, True) <> 0 then
              Inc(Added);
          end;
        except
          on e: Exception do
             Teletype(rstrErrorUnpacking + FFiles[i], tsError);
        end;

        FProgressEngine.AddProgress;
      finally
        FreeAndNil(Zip);
      end;
    end;
    Inc(FAddCount, Added);
    Inc(FDefectCount, Defective);
  finally
    FProgressEngine.EndOperation;
  end;
end;

procedure TImportFB2Thread.SortFilesZip(var R: TBookRecord);
var
  FileName, PackedName, OldFileName, NewFileName, NewFolder: string;
  archiveFileName: string;
  archiver: TJclZipUpdateArchive;
  I: Integer;
begin
  FileName := ExtractFileName(R.Folder);

  NewFolder := GetNewFolder(Settings.FB2FolderTemplate, R);


  CreateFolders(FCollectionRoot, NewFolder);
  CopyFile(R.Folder, FCollectionRoot +  NewFolder + FileName);

  R.Folder := NewFolder + FileName;

  NewFileName := GetNewFileName(Settings.FB2FileTemplate, R);
  if NewFileName <> '' then
  begin
    NewFolder := R.Folder;
    if FileName <> NewFileName + FFb2ArchiveExt then
    begin
      StrReplace(FileName, NewFileName + FFb2ArchiveExt, NewFolder);
      RenameFile(FCollectionRoot + R.Folder, FCollectionRoot + NewFolder);
      R.Folder :=  NewFolder;
      try
        archiveFileName := TPath.Combine(FCollectionRoot, NewFolder);
        archiver := TJclZipUpdateArchive.Create(archiveFileName);
        try
          archiver.ListFiles;
          if archiver.ItemCount > 0 then
          begin
            OldFileName := R.FileName +  R.FileExt;
            for I := 0 to archiver.ItemCount - 1 do
            begin
              PackedName := String(archiver.Items[I].PackedName);
              if PackedName = OldFileName then
              begin
                archiver.Items[I].PackedName := NewFileName;
                archiver.Compress;
                R.FileName := NewFileName;
                Break;
              end;
            end;
          end;
        finally
          FreeAndNil(archiver);
        end;
      except
        // ничего не делаем
      end;
    end;
  end;
end;

procedure TImportFB2Thread.WorkFunction;
begin
  FAddCount := 0;
  FDefectCount := 0;

  FFiles := TStringList.Create;
  try
    // Import FB2
    Teletype(rstrImportFb2);

    FTargetExt := FB2_EXTENSION;
    FZipFolder := False;

    ScanFolder;
    if Canceled then
      Exit;

    FCollection.BeginBulkOperation;
    try
      ProcessFileList;
      FCollection.EndBulkOperation(True);
    except
      FCollection.EndBulkOperation(False);
      raise;
    end;

    // Import fb2.zip
    Teletype(rstrImportFb2Zip);
    FZipFolder := True;
    case FArchiveFormat of
    afZip:
      begin
        FTargetExt := ZIP_EXTENSION;
        FFb2ArchiveExt := FB2ZIP_EXTENSION;
      end;

    else
      Assert(False, 'Not supported');
    end;

    ScanFolder;
    if Canceled then
      Exit;

    FCollection.BeginBulkOperation;
    try
      ProcessFileListArchive;
      FCollection.EndBulkOperation(True);
    except
      FCollection.EndBulkOperation(False);
      raise;
    end;

  finally
    Teletype(Format(rstrAddedBooksTotal, [FAddCount, FDefectCount]),tsInfo);
    FreeAndNil(FFiles);
  end;
end;
end.

