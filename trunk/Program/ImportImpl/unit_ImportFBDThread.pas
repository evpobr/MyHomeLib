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
//  private
//    FZipper: I7zInArchive;

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
  unit_Settings,
  unit_MHLArchiveHelpers;

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
  NewFileName, NewFolder, Ext: string;
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
      ZipRenameAll(NewFileName, FCollectionRoot + NewFolder + NewFileName + ZIP_EXTENSION);
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
  idxFile: Integer;
  fileName: string;

begin
  AddCount := 0;
  DefectCount := 0;

  FProgressEngine.BeginOperation(FFiles.Count, rstrProcessedArchives, rstrProcessedArchives);
  try
    for i := 0 to FFiles.Count - 1 do
    begin
      if Canceled then
        Break;
      IsValid := False;
      AZipFileName := FFiles[i];

      Assert(ExtractFileExt(AZipFileName) = ZIP_EXTENSION);
      try
        j := 0;
        R.Clear;
        idxFile := GetIdxFileInZip(AZipFileName);
        if (idxFile >= 0) then
        repeat
          fileName := GetFileNameInZip(AZipFileName, idxFile);
          Ext := ExtractFileExt(fileName);
          if Ext = FBD_EXTENSION then
          begin
            FS := UnzipToStream(AZipFileName, idxFile);
            try
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
                begin
                  Teletype(Format(rstrErrorFB2Structure, [AZipFileName, R.FileName]), tsError);
                  //Teletype(e.Message, tsError);
                  Inc(DefectCount);
                end;
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
            R.Size := GetFileSizeInZip(AZipFileName, idxFile);
          end;
          Inc(j);

          idxFile := GetIdxFileInZip(AZipFileName, idxFile + 1);
        until (idxFile < 0);

        if Settings.EnableSort then
          SortFiles(R);

        if IsValid and (BookFileName = FBDFileName) and (FCollection.InsertBook(R, True, True)<>0) then
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

    Teletype(Format(rstrBooksAdded, [AddCount, DefectCount]));
  finally
    FProgressEngine.EndOperation;
  end;
end;

end.

