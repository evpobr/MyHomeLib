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

unit unit_ImportFB2ZIPThread;

interface

uses
  Windows,
  unit_ImportFB2ThreadBase,
  unit_Globals;

type
  TImportFB2ZIPThread = class(TImportFB2ThreadBase)
  protected
    procedure SortFiles(var R: TBookRecord); override;
    procedure ProcessFileList; override;

  public
    constructor Create(const CollectionID: Integer);
  end;


implementation

uses
  Classes,
  SysUtils,
  IOUtils,
  unit_WorkerThread,
  unit_Consts,
  unit_Settings,
  fictionbook_21,
  unit_MHLArchiveHelpers;

resourcestring
  rstrErrorUnpackingWithCode = 'Ошибка распаковки архива %s, Код: %d';
  rstrFoundNewArchives = 'Обнаружено новых архивов: %u';
  rstrErrorFB2Structure = 'Ошибка структуры fb2: %s -> %s';
  rstrErrorUnpacking = 'Ошибка распаковки архива: ';
  rstrProcessedArchives = 'Обработано архивов: %u из %u';
  rstrAddedBooks = 'Добавленo книг: %u, пропущено книг: %u';

{ TImportFB2ZIPThread }

constructor TImportFB2ZIPThread.Create(const CollectionID: Integer);
begin
  inherited Create(CollectionID);

  FTargetExt := ZIP_EXTENSION;
  FZipFolder := True;
end;

procedure TImportFB2ZIPThread.SortFiles(var R: TBookRecord);
var
  FileName, NewFileName, NewFolder: string;
  zipFileName: string;
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
    StrReplace(FileName, NewFileName + FB2ZIP_EXTENSION, NewFolder);
    RenameFile(FCollectionRoot + R.Folder, FCollectionRoot + NewFolder);
    R.Folder :=  NewFolder;

    try
      zipFileName := TPath.Combine(FCollectionRoot, NewFolder);
      ZipRenameAll(NewFileName, zipFileName); // assuming there are only fb2 files there
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
    Teletype(Format(rstrErrorUnpackingWithCode, [FZipper.FileName, 0]), tsError);
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

  NoErrors: boolean;
  idxFile: Integer;
  zipFileName: string;
begin
  AddCount := 0;
  DefectCount := 0;

  FProgressEngine.BeginOperation(FFiles.Count, rstrProcessedArchives, rstrProcessedArchives);
  try
    for i := 0 to FFiles.Count - 1 do
    begin
      if Canceled then
        Break;

      AZipFileName := FFiles[i];

      NoErrors := True;
      try
        j := 0;
        zipFileName := FFiles[i];
        idxFile := GetIdxFileInZip(zipFileName);
        if (idxFile >= 0) then
        repeat
          R.Clear;
          AFileName := GetFileNameInZip(zipFileName, idxFile);;
          R.FileExt := ExtractFileExt(AFileName);
          if R.FileExt <> FB2_EXTENSION then
          begin
            Inc(j);     // переходим к следующему файлу
            Continue;
          end;

          R.FileName := TPath.GetFileNameWithoutExtension(AFileName);
          R.Size := GetFileSizeInZip(AFileName, idxFile);
          R.InsideNo := j;
          R.Date := Now;
          Include(R.BookProps, bpIsLocal);
          FS := UnzipToStream(AFileName, idxFile);
          try
            try
              book := LoadFictionBook(FS);
              GetBookInfo(book, R);
              if not Settings.EnableSort then
              begin
                R.Folder := ExtractRelativePath(FCollectionRoot, AZipFileName);
                if FCollection.InsertBook(R, True, True) <> 0 then
                  Inc(AddCount);
              end;
            except
              on e: Exception do
              begin
                NoErrors := False;
                Teletype(Format(rstrErrorFB2Structure, [AZipFileName, R.FileName + FB2_EXTENSION]), tsError);
                //Teletype(e.Message, tsError);
                Inc(DefectCount);
              end;
            end;
          finally
            FreeAndNil(FS);
          end;
          Inc(j);
          idxFile := GetIdxFileInZip(zipFileName, idxFile + 1);
        until (idxFile < 0);

        if Settings.EnableSort and NoErrors and (j = 1) then
        begin
          R.Folder := AZipFileName;
          SortFiles(R);
          if FCollection.InsertBook(R, True, True) <> 0 then
            Inc(AddCount);
        end;
      except
        on e: Exception do
           Teletype(rstrErrorUnpacking + AZipFileName, tsError);
      end;

      FProgressEngine.AddProgress;
    end;

    Teletype(Format(rstrAddedBooks, [AddCount, DefectCount]));
  finally
    FProgressEngine.EndOperation;
  end;
end;

end.

