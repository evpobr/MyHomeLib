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
  unit_ImportFB2ThreadBase,
  unit_Globals;

type
  TImportFBDThread = class(TImportFB2ThreadBase)
  protected
    procedure ProcessFileList; override;
    procedure SortFiles(var R: TBookRecord); override;

  public
    constructor Create(const CollectionID: Integer);
  end;

implementation

uses
  Classes,
  SysUtils,
  IOUtils,
  unit_WorkerThread,
  FictionBook_21,
  unit_Consts,
  dm_user,
  unit_MHLArchiveHelpers;

resourcestring
  rstrFoundNewArchives = '���������� ����� �������: %u';
  rstrErrorFB2Structure = '������ ��������� fb2: %s -> %s.fbd';
  rstrErrorFBD = '������ FBD: ';
  rstrErrorUnpacking = '������ ���������� ������: ';
  rstrProcessedArchives = '���������� �������: %u �� %u';
  rstrBooksAdded = '��������o ����: %u, ��������� ����: %u';

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
  NewFileName, NewFolder, Ext: string;
  archiver: TMHLZip;
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
      archiver := TMHLZip.Create(FCollectionRoot + NewFolder + NewFileName + ZIP_EXTENSION);
      archiver.RenameFile(FCollectionRoot + NewFolder + R.FileName, NewFileName);
    except
      // ������ �� ������
    end;
  end;
end;

procedure TImportFBDThread.ProcessFileList;
var
  i: Integer;
  j: Integer;
  R: TBookRecord;
  archiveFileName, Ext: string;
  archiver: TMHLZip;
  BookFileName, FBDFileName: string;
  book: IXMLFictionBook;
  FS: TMemoryStream;
  AddCount:Integer;
  DefectCount:Integer;
  IsValid : boolean;
  fileName: string;

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
          j := 0;
          R.Clear;
          archiver := TMHLZip.Create(archiveFileName);
          if archiver.Find('*.*') then
          repeat
            fileName := archiver.LastName;
            Ext := ExtractFileExt(fileName);
            if Ext = FBD_EXTENSION then
            begin
              FS := TMemoryStream.Create;
              try
                try
                  archiver.ExtractToStream(archiver.LastName, FS);
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
                FreeAndNil(FS);
              end;
            end
            else
            begin
              R.InsideNo := j;
              R.FileExt := Ext;
              BookFileName := TPath.GetFileNameWithoutExtension(fileName);
              R.Size := archiver.LastSize;
            end;
            Inc(j);
          until not archiver.FindNext;

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

end.
