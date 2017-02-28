(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  *                     Aleksey Penkov  alex.penkov@gmail.com
  * Created             20.08.2008
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_ImportFBDThread;

interface

uses
  Winapi.Windows,
  unit_ImportFB2ThreadBase,
  unit_Globals;

type
  TImportFBDThread = class(TImportFB2ThreadBase)
  protected
    procedure WorkFunction; override;
    procedure ProcessFileList; override;
    procedure SortFiles(var R: TBookRecord); override;
    procedure ProcessFileListArchive; override;

  public
    constructor Create(const CollectionID: Integer);
  end;

implementation

uses
  Classes,
  SysUtils,
  IOUtils,
  jclCompression,
  unit_WorkerThread,
  FictionBook_21,
  unit_Consts,
  dm_user,
  unit_MHLArchiveHelpers,
  unit_Settings;

resourcestring
  rstrFoundNewArchives = 'Обнаружено новых архивов: %u';
  rstrErrorFB2Structure = 'Ошибка структуры fb2: %s -> %s.fbd';
  rstrErrorFBD = 'Ошибка FBD: ';
  rstrErrorUnpacking = 'Ошибка распаковки архива: ';
  rstrProcessedArchives = 'Обработано архивов: %u из %u';
  rstrBooksAdded = 'Добавленo книг: %u, пропущено книг: %u';

{ TImportFB2Thread }

constructor TImportFBDThread.Create(const CollectionID: Integer);
begin
  inherited Create(CollectionID);

  FTargetExt := ZIP_EXTENSION;
  FZipFolder := False;
  FFullNameSearch := True;
end;

procedure TImportFBDThread.SortFiles(var R: TBookRecord);
var
  PackedName, OldFileName, NewFileName, NewFolder: string;
  archiver: TJclZipUpdateArchive;
  I: Integer;
begin
  NewFolder := GetNewFolder(Settings.FBDFolderTemplate, R);

  CreateFolders(FCollectionRoot, NewFolder);
  CopyFile(Settings.ImportPath + R.FileName, FCollectionRoot + NewFolder + R.FileName);
  R.Folder := NewFolder;

  NewFileName := GetNewFileName(Settings.FBDFileTemplate, R);
  if NewFileName <> '' then
  begin
    NewFileName := NewFileName;
    RenameFile(FCollectionRoot + NewFolder + R.FileName, FCollectionRoot + NewFolder + NewFileName + ZIP_EXTENSION);
    R.FileName := NewFileName + ZIP_EXTENSION;

    try
      archiver := TJclZipUpdateArchive.Create(FCollectionRoot + NewFolder + NewFileName + ZIP_EXTENSION);
      OldFileName := FCollectionRoot + NewFolder + R.FileName;
      try
        archiver.ListFiles;
        for I := 0 to archiver.ItemCount - 1 do
        begin
          PackedName := String(archiver.Items[I].PackedName);
          if PackedName = OldFileName then
          begin
            archiver.Items[I].PackedName := NewFileName;
            archiver.Items[I].Selected := True;
            archiver.Compress;
          end;
        end;
      finally
        archiver.Free;
      end;
    except
      // ничего не делаем
    end;
  end;
end;


procedure TImportFBDThread.WorkFunction;
begin

  try
    FFiles := TStringList.Create;

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
  finally
    FreeAndNil(FFiles);
  end;
end;

procedure TImportFBDThread.ProcessFileList;
var
  i: Integer;
  j: Integer;
  R: TBookRecord;
  archiveFileName, Ext: string;
  archiver: TJclZipDecompressArchive;
  BookFileName, FBDFileName: string;
  book: IXMLFictionBook;
  FS: TMemoryStream;
  AddCount:Integer;
  DefectCount:Integer;
  IsValid : boolean;
  fileName: string;
  FileSize: Int64;
  ItemCount: Integer;
begin
  AddCount := 0;
  DefectCount := 0;

  FProgressEngine.BeginOperation(FFiles.Count, rstrProcessedArchives, rstrProcessedArchives);
  try
    for i := 0 to FFiles.Count - 1 do
    begin
      if Canceled then Break;

      IsValid := False;
      archiveFileName := FFiles[i];

      Assert(ExtractFileExt(archiveFileName) = ZIP_EXTENSION);
      try
        try
          R.Clear;
          archiver := TJclZipDecompressArchive.Create(archiveFileName);
          archiver.ListFiles;
          if archiver.ItemCount > 0 then
          for J := 0 to archiver.ItemCount - 1 do
          begin
            fileName := String(archiver.Items[J].PackedName);
            Ext := ExtractFileExt(fileName);
            if Ext = FBD_EXTENSION then
            begin
              FS := TMemoryStream.Create;
              try
                try
                  archiver.Items[J].Stream := FS;
                  archiver.Items[J].Selected := True;
                  archiver.ExtractSelected;
                  FileSize := FS.Size;
                  R.Folder := ExtractRelativePath(FCollectionRoot, ExtractFilePath(FFiles[i]));
                  R.FileName := ExtractFilename(FFiles[i]);
                  R.Date := Now;
                  Include(R.BookProps, bpIsLocal);
                  try
                    book := LoadFictionBook(FS);
                    GetBookInfo(book, R);
                    IsValid := True;
                    FBDFileName := TPath.GetFileNameWithoutExtension(fileName);
                  except
                    on e: Exception do
                        Teletype(Format(rstrErrorFB2Structure, [archiveFileName, R.FileName]), tsError);
                  end;
                except
                    //Teletype(e.Message, tsError);
                end; //try
              finally
                archiver.UnselectAll;
                FreeAndNil(FS);
              end;
            end
            else
            begin
              R.InsideNo := j;
              R.FileExt := Ext;
              BookFileName := TPath.GetFileNameWithoutExtension(fileName);
              R.Size := Integer(archiver.Items[J].FileSize);
            end;
          end;

          if Settings.EnableSort then
            SortFiles(R);

          if IsValid and (BookFileName = FBDFileName) and (FCollection.InsertBook(R, True, True)<>0) then
            Inc(AddCount)
          else
          begin
            Teletype(rstrErrorFBD + archiveFileName, tsError);
            Inc(DefectCount);
          end;
        except
          on e: Exception do
            Teletype(rstrErrorUnpacking + archiveFileName, tsError);
        end;
      finally
        FreeAndNil(archiver);
        FProgressEngine.AddProgress;
      end;
    end;
    Teletype(Format(rstrBooksAdded, [AddCount, DefectCount]));
  finally
    FProgressEngine.EndOperation;
  end;
end;

procedure TImportFBDThread.ProcessFileListArchive;
begin
  raise ENotImplemented.Create('');
end;

end.

