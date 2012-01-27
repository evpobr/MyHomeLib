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
  unit_ImportFB2ThreadBase,
  unit_Globals,
  unit_MHLArchiveHelpers;

type
  TImportFB2Thread = class(TImportFB2ThreadBase)
  protected
    procedure WorkFunction; override;
    procedure ProcessFileList; override;
    procedure ProcessFileListArchive; override;
    procedure SortFiles(var R: TBookRecord); override;
  public
    constructor Create(const CollectionID: Integer;  const ArchiveFormat: TArchiveFormat);

  end;

implementation

uses
  Classes,
  SysUtils,
  IOUtils,
  unit_WorkerThread,
  FictionBook_21,
  unit_Helpers,
  unit_Consts,
  dm_user,
  unit_Templater;

resourcestring
  rstrStructureError = '������ ��������� fb2: %s.zip -> %s';
  rstrProcessedFiles = '���������� ������: %u �� %u';
  rstrAddedFiles = '��������� ������: %u �� %u';
  rstrErrorUnpackingWithCode = '������ ���������� ������ %s, ���: %d';
  rstrFoundNewArchives = '���������� ����� �������: %u';
  rstrErrorFB2Structure = '������ ��������� fb2: %s -> %s';
  rstrErrorUnpacking = '������ ���������� ������: ';
  rstrProcessedArchives = '���������� �������: %u �� %u';
  rstrAddedBooks = '��������o ����: %u, ��������� ����: %u';
  rstrImportFB2 = '������ ������ fb2:';
  rstrImportFB2Zip = '������ ������ fb2.zip:';

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
  AddedBooks: integer;
  FileName: string;
begin
  FProgressEngine.BeginOperation(FFiles.Count, rstrProcessedFiles, rstrProcessedFiles);
  try
    AddedBooks := 0;

    FTemplater:= TTemplater.Create;
    try
      for i := 0 to FFiles.Count - 1 do
      begin
        if Canceled then
          Break;

        R.Clear;
        FileName := ExtractFileName(FFiles[i]);
        R.FileExt := ExtractFileExt(FileName);
        R.FileName := TPath.GetFileNameWithoutExtension(FileName);

        R.Size := unit_Helpers.GetFileSize(FFiles[i]);
        R.Date := Now;
        Include(R.BookProps, bpIsLocal);
        try
          if Settings.EnableSort then
          begin
            R.Folder := ExtractFilePath(FFiles[i]);
            book := LoadFictionBook(FFiles[i]);
            GetBookInfo(book, R);
            SortFiles(R); // ������� R.Folder � R.FileName
          end
          else
          begin
            R.Folder := ExtractRelativePath(FCollectionRoot, ExtractFilePath(FFiles[i]));
            book := LoadFictionBook(FFiles[i]);
            GetBookInfo(book, R);
          end;
          FCollection.InsertBook(R, True, True);
          Inc(AddedBooks);
        except
          on e: Exception do
            Teletype(Format(rstrStructureError, [R.Folder, R.FileName + FB2_EXTENSION]), tsError);
        end;

        FProgressEngine.AddProgress;
      end;
    finally
      FTemplater.Free;
    end;

    Teletype(Format(rstrAddedFiles, [AddedBooks, FFiles.Count]),tsInfo);
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
  AddCount:Integer;
  DefectCount:Integer;

  NoErrors: boolean;
  numFb2FilesInZip: Integer;
  Zip: TMHLZip;
begin
  AddCount := 0;
  DefectCount := 0;

  FProgressEngine.BeginOperation(FFiles.Count, rstrProcessedArchives, rstrProcessedArchives);
  try
    for i := 0 to FFiles.Count - 1 do
    begin
      if Canceled then
        Break;

      NoErrors := True;
      try
        try
          Zip := TMHLZip.Create(FFiles[i]);
          j := 0;
          if Zip.Find('*.*') then
          repeat
            R.Clear;
            AFileName := Zip.LastName;
            R.FileExt := ExtractFileExt(AFileName);
            if R.FileExt = FB2_EXTENSION then
            begin
              Inc(numFb2FilesInZip);
              R.FileName := TPath.GetFileNameWithoutExtension(CleanFileName(AFileName));
              R.Size := Zip.LastSize;
              R.InsideNo := j;
              R.Date := Now;
              Include(R.BookProps, bpIsLocal);
              FS := TMemoryStream.Create;
              Zip.ExtractToStream(AFileName,FS);
              try
                try
                  book := LoadFictionBook(FS);
                  GetBookInfo(book, R);
                  if not Settings.EnableSort then
                  begin
                    R.Folder := ExtractRelativePath(FCollectionRoot, FFiles[i]);
                    if FCollection.InsertBook(R, True, True) <> 0 then
                      Inc(AddCount);
                  end;
                except
                  on e: Exception do
                  begin
                    NoErrors := False;
                    Teletype(Format(rstrErrorFB2Structure, [FFiles[i], R.FileName + FB2_EXTENSION]), tsError);
                    //Teletype(e.Message, tsError);
                    Inc(DefectCount);
                  end;
                end;
              finally
                FreeAndNil(FS);
              end;
            end;
            inc(j);
          until not Zip.FindNext;
          Zip.CloseArchive;
          if Settings.EnableSort and NoErrors and (numFb2FilesInZip = 1) then
          begin
            R.Folder := FFiles[i];
            SortFiles(R);
            if FCollection.InsertBook(R, True, True) <> 0 then
              Inc(AddCount);
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

    Teletype(Format(rstrAddedBooks, [AddCount, DefectCount]));
  finally
    FProgressEngine.EndOperation;
  end;
end;

procedure TImportFB2Thread.SortFiles(var R: TBookRecord);
var
  FileName, NewFileName, NewFolder: string;
  archiveFileName: string;
  archiver: TMHLZip;
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
    StrReplace(FileName, NewFileName + FFb2ArchiveExt, NewFolder);
    RenameFile(FCollectionRoot + R.Folder, FCollectionRoot + NewFolder);
    R.Folder :=  NewFolder;
    try
      try
        archiveFileName := TPath.Combine(FCollectionRoot, NewFolder);
        archiver := TMHLZip.Create(archiveFileName);
        archiver.RenameFile( FCollectionRoot +  NewFolder + FileName, NewFileName); // assuming there are only fb2 files there
        R.FileName := NewFileName;
      except
        // ������ �� ������
      end;
    finally
      FreeAndNil(archiver);
    end;
  end;
end;

procedure TImportFB2Thread.WorkFunction;
begin
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
    FreeAndNil(FFiles);
  end;
end;
end.

