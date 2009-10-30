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
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_ImportFB2ThreadBase;

type
  TImportFB2Thread = class(TImportFB2ThreadBase)
  private

  protected
    procedure AddFile2List(Sender: TObject; const F: TSearchRec); override;
    procedure ProcessFileList; override;

  public

  end;

implementation

uses
  unit_globals,
  FictionBook_21,
  unit_Helpers,
  unit_Consts,
  unit_Settings;

{ TImportFB2Thread }

procedure TImportFB2Thread.AddFile2List(Sender: TObject; const F: TSearchRec);
var
  FullName: string;
  FileName: string;
begin
  if ExtractFileExt(F.Name) = FB2_EXTENSION then
  begin
    FullName := ExtractRelativePath(FRootPath, FFilesList.LastDir + F.Name);

    if FCheckExistsFiles then
    begin
      { TODO -oNickR -cRefactoring : Переписать. Для начала необходимо разобраться с использование поля Books.Folder }
      FileName := FullName;

      FileName := ExtractShortFilename(F.Name);
      if FLibrary.CheckFileInCollection(FileName, False, False) then
        Exit;
    end;

    FFiles.Add(FullName);
  end;

  //
  // сколько найдем файлов неизвестно => зациклим прогресс
  //
  SetProgress(FFiles.Count mod 100);

  if Canceled then
    Abort;
end;

procedure TImportFB2Thread.ProcessFileList;
var
  i: Integer;
  R: TBookRecord;
  AFileName: string;
  book: IXMLFictionBook;
begin
  SetProgress(0);
  Teletype(Format('Обнаружено файлов: %u', [FFiles.Count]));

  for i := 0 to FFiles.Count - 1 do
  begin
    if Canceled then
      Break;

    R.Clear;

    //
    // Обрабатываемый файл: H:\eBooks\Л\Лаберж Стивен\Исследование мира осознанных сновидений.fb2
    //

    //
    // Л\Лаберж Стивен\Исследование мира осознанных сновидений.fb2
    //
    AFileName := FFiles[i];

    //
    // .fb2
    //
    R.FileExt := ExtractFileExt(AFileName);
    Assert(R.FileExt = FB2_EXTENSION);

    //
    // Л\Лаберж Стивен\
    //
    R.Folder := ExtractFilePath(AFileName);

    //
    // Исследование мира осознанных сновидений
    //
    AFileName := ExtractFileName(AFileName);
    R.FileName := ExtractShortFilename(AFileName);
    R.Size := unit_Helpers.GetFileSize(FRootPath + FFiles[i]);
    R.Date := Now;
    try
      book := LoadFictionBook(FRootPath + FFiles[i]);
      GetBookInfo(book, R);
      if Settings.EnableSort then SortFiles(R);
      FLibrary.InsertBook(R, True, True);
    except
      on e: Exception do
      begin
        Teletype('Ошибка структуры fb2: ' + R.Folder + '.zip -> ' + R.FileName + FB2_EXTENSION, tsError);
        //Teletype(e.Message, tsError);
      end;
    end;

    if (i mod ProcessedItemThreshold) = 0 then
      SetComment(Format('Обработано файлов: %u из %u', [i + 1, FFiles.Count]));
    SetProgress((i + 1) * 100 div FFiles.Count);
  end;

  SetComment(Format('Обработано файлов: %u из %u', [FFiles.Count, FFiles.Count]));
end;

end.

