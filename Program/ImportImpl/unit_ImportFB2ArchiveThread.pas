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

unit unit_ImportFB2ArchiveThread;

interface

uses
  Windows,
  unit_ImportFB2ThreadBase,
  unit_Globals,
  unit_MHLArchiveHelpers;

type
  TImportFB2ArchiveThread = class(TImportFB2ThreadBase)
  protected
    procedure SortFiles(var R: TBookRecord); override;
    procedure ProcessFileList; override;

  public
    constructor Create(const CollectionID: Integer; const ArchiveFormat: TArchiveFormat);

  protected
    FFb2ArchiveExt: string;
  end;


implementation

uses
  Classes,
  SysUtils,
  IOUtils,
  unit_WorkerThread,
  unit_Consts,
  unit_Settings,
  fictionbook_21;

resourcestring
  rstrErrorUnpackingWithCode = 'Ошибка распаковки архива %s, Код: %d';
  rstrFoundNewArchives = 'Обнаружено новых архивов: %u';
  rstrErrorFB2Structure = 'Ошибка структуры fb2: %s -> %s';
  rstrErrorUnpacking = 'Ошибка распаковки архива: ';
  rstrProcessedArchives = 'Обработано архивов: %u из %u';
  rstrAddedBooks = 'Добавленo книг: %u, пропущено книг: %u';

{ TImportFB2ArchiveThread }

constructor TImportFB2ArchiveThread.Create(const CollectionID: Integer; const ArchiveFormat: TArchiveFormat);
begin
  inherited Create(CollectionID);

  case ArchiveFormat of
    afZip:
      begin
        FTargetExt := ZIP_EXTENSION;
        FFb2ArchiveExt := FB2ZIP_EXTENSION;
      end;

    else
      Assert(False, 'Not supported');
  end;

  FZipFolder := True;
end;

procedure TImportFB2ArchiveThread.SortFiles(var R: TBookRecord);
var
  FileName, NewFileName, NewFolder: string;
  archiveFileName: string;
  archiver: IArchiver;
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
      archiveFileName := TPath.Combine(FCollectionRoot, NewFolder);
      archiver := TArchiver.Create(archiveFileName);
      archiver.ArchiveRenameAll(NewFileName); // assuming there are only fb2 files there
      R.FileName := NewFileName;
    except
      // ничего не делаем
    end;
  end;
end;

{
procedure TImportFB2ArchiveThread.ShowZipErrorMessage(Sender: TObject; ErrCode: Integer; Message: string);
begin
  if ErrCode <> 0 then
    Teletype(Format(rstrErrorUnpackingWithCode, [FZipper.FileName, 0]), tsError);
end;
}

procedure TImportFB2ArchiveThread.ProcessFileList;
var
  i: Integer;
  R: TBookRecord;
  AFileName:    string;
  book: IXMLFictionBook;
  FS: TMemoryStream;
  AddCount:Integer;
  DefectCount:Integer;

  NoErrors: boolean;
  idxFile: Integer;
  numFb2FilesInZip: Integer;
  archiveFileName: string;
  archiver: IArchiver;
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
        archiveFileName := FFiles[i];
        archiver := TArchiver.Create(archiveFileName);
        numFb2FilesInZip := 0;
        idxFile := archiver.GetNextFileIdx;
        while (idxFile >= 0) do
        begin
          R.Clear;
          AFileName := archiver.GetFileName(idxFile);;
          R.FileExt := ExtractFileExt(AFileName);
          if R.FileExt = FB2_EXTENSION then
          begin
            Inc(numFb2FilesInZip);
            R.FileName := TPath.GetFileNameWithoutExtension(AFileName);
            R.Size := archiver.GetFileSize(idxFile);
            R.InsideNo := idxFile;
            R.Date := Now;
            Include(R.BookProps, bpIsLocal);
            FS := archiver.UnarchiveToStream(idxFile);
            try
              try
                book := LoadFictionBook(FS);
                GetBookInfo(book, R);
                if not Settings.EnableSort then
                begin
                  R.Folder := ExtractRelativePath(FCollectionRoot, archiveFileName);
                  if FCollection.InsertBook(R, True, True) <> 0 then
                    Inc(AddCount);
                end;
              except
                on e: Exception do
                begin
                  NoErrors := False;
                  Teletype(Format(rstrErrorFB2Structure, [archiveFileName, R.FileName + FB2_EXTENSION]), tsError);
                  //Teletype(e.Message, tsError);
                  Inc(DefectCount);
                end;
              end;
            finally
              FreeAndNil(FS);
            end;
          end;
          idxFile := archiver.GetNextFileIdx(idxFile + 1);
        end; // while

        if Settings.EnableSort and NoErrors and (numFb2FilesInZip = 1) then
        begin
          R.Folder := archiveFileName;
          SortFiles(R);
          if FCollection.InsertBook(R, True, True) <> 0 then
            Inc(AddCount);
        end;
      except
        on e: Exception do
           Teletype(rstrErrorUnpacking + archiveFileName, tsError);
      end;

      FProgressEngine.AddProgress;
    end;

    Teletype(Format(rstrAddedBooks, [AddCount, DefectCount]));
  finally
    FProgressEngine.EndOperation;
  end;
end;

end.

