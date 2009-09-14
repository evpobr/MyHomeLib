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

unit unit_ImportFB2ZIPThread;

interface

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_ImportFB2ThreadBase,
  ZipForge;

type
  TImportFB2ZIPThread = class(TImportFB2ThreadBase)
  private
    FZipper: TZipForge;

    procedure ShowZipErrorMessage(Sender: TObject; ErrCode: Integer; Message: string);

  protected
    procedure AddFile2List(Sender: TObject; const F: TSearchRec); override;
    procedure ProcessFileList; override;
  public

  end;


implementation

uses
  unit_Helpers,
  unit_Consts,
  unit_Settings,
  unit_globals,
  fictionbook_21;

{ TImportFB2ZIPThread }

procedure TImportFB2ZIPThread.ShowZipErrorMessage(Sender: TObject; ErrCode: Integer; Message: string);
begin
  if ErrCode <> 0 then
    Teletype(Format('Ошибка распаковки архива %s, Код: %d', [FZipper.FileName, 0]), tsError);
end;

procedure TImportFB2ZIPThread.AddFile2List(Sender: TObject; const F: TSearchRec);
var
  FullName: string;
begin
  if ExtractFileExt(F.Name) = ZIP_EXTENSION then
  begin
    FullName := ExtractRelativePath(FRootPath, FFilesList.LastDir + F.Name);

    if FCheckExistsFiles then
    begin
      { TODO -oNickR -cRefactoring : Переписать. Для начала необходимо разобраться с использование поля Books.Folder }
      if FLibrary.CheckFileInCollection(FullName, ZIP_EXTENSION, False) then
        Exit;
    end;

    FFiles.Add(FullName);
  end;
end;

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
      FZipper.FileName := FRootPath + AZipFileName;
      try
        FZipper.OpenArchive(fmOpenRead);
        j := 0;
        if (FZipper.FindFirst('*.*',ArchiveItem,faAnyFile-faDirectory)) then
        repeat
          R.Clear;

          try
            FS := TMemoryStream.Create;

            R.Folder := AZipFileName;

            //
            // Исследование мира осознанных сновидений.fb2
            //

            AFileName := ArchiveItem.FileName;

            //
            // .fb2
            //
            R.FileExt := ExtractFileExt(AFileName);
            if R.FileExt <> FB2_EXTENSION then
            begin
              inc(j);     // переходим к следующему файлу
              Continue;
            end;

            //
            // Исследование мира осознанных сновидений
            //
            R.FileName := Copy(AFileName, 1, Length(AFileName) - Length(R.FileExt));

            R.Size := ArchiveItem.UncompressedSize;

            R.InsideNo := j;

            R.Date := Now;

            FZipper.ExtractToStream(AFileName,FS);
            if not Assigned(FS) then
              Continue;

            try
              book := LoadFictionBook(FS);
              GetBookInfo(Book, R);
              if FLibrary.InsertBook(R, True, True) Then Inc(AddCount);
            except
              on e: Exception do
              begin
                Teletype('Ошибка структуры fb2: ' + AZipFileName + ' -> ' + R.FileName + FB2_EXTENSION, tsError);
                //Teletype(e.Message, tsError);
                Inc(DefectCount);
              end;
            end;
          finally
            FS.Free;
          end;
          inc(j);
        until (not FZipper.FindNext(ArchiveItem));
        FZipper.CloseArchive;
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

