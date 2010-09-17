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
  ZipForge,
  unit_ImportFB2ThreadBase,
  unit_Globals;

type
  TImportFBDThread = class(TImportFB2ThreadBase)
  private
    FZipper: TZipForge;

  protected
    procedure ProcessFileList; override;
    procedure SortFiles(var R: TBookRecord); override;

  public
    constructor Create(const CollectionRoot: string; const DBFileName: string);
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

constructor TImportFBDThread.Create(const CollectionRoot: string; const DBFileName: string);
begin
  inherited Create(CollectionRoot, DBFileName);

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
      FZipper.FileName := FCollectionRoot + NewFolder + NewFileName + ZIP_EXTENSION;
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

  FProgressEngine.BeginOperation(FFiles.Count, rstrProcessedArchives, rstrProcessedArchives);
  try
    FZipper := TZipForge.Create(nil);
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
            if Ext = FBD_EXTENSION then
            try
              FS := TMemoryStream.Create;
              R.Folder := ExtractRelativePath(FCollectionRoot, ExtractFilePath(FFiles[i]));
              R.FileName := ExtractFilename(FFiles[i]);
              R.Date := Now;
              Include(R.BookProps, bpIsLocal);
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
            Inc(j);
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

        FProgressEngine.AddProgress;
      end;
    finally
      FreeAndNil(FZipper);
    end;

    Teletype(Format(rstrBooksAdded, [AddCount, DefectCount]));
  finally
    FProgressEngine.EndOperation;
  end;
end;

end.

