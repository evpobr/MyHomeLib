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
    procedure ProcessFileList; override;
  public

  end;

implementation

uses
  unit_globals,
  FictionBook_21,
  unit_Helpers,
  unit_Consts,
  unit_Settings,
  unit_Templater;

{ TImportFB2Thread }

procedure TImportFB2Thread.ProcessFileList;
var
  i: Integer;
  R: TBookRecord;
  book: IXMLFictionBook;
  AddedBooks: integer;
  FileName: string;
begin
  SetProgress(0);
  Teletype(Format('Обнаружено файлов: %u', [FFiles.Count]));
  AddedBooks := 0;
  FTemplater:= TTemplater.Create;
  for i := 0 to FFiles.Count - 1 do
  begin
    if Canceled then
      Break;

    R.Clear;
    FileName := ExtractFileName(FFiles[i]);
    R.FileExt := ExtractFileExt(FileName);
    R.FileName := ExtractShortFilename(FileName);

    R.Size := unit_Helpers.GetFileSize(FFiles[i]);
    R.Date := Now;
    try
      if Settings.EnableSort then
      begin
        R.Folder := ExtractFilePath(FFiles[i]);
        book := LoadFictionBook(FFiles[i]);
        GetBookInfo(book, R);
        SortFiles(R);
      end
      else
      begin
        R.Folder := ExtractRelativePath(FRootPath, ExtractFilePath(FFiles[i]));
        book := LoadFictionBook(FFiles[i]);
        GetBookInfo(book, R);
      end;
      FLibrary.InsertBook(R, True, True);
      inc(AddedBooks);
    except
      on e: Exception do
        Teletype('Ошибка структуры fb2: ' + R.Folder + '.zip -> ' + R.FileName + FB2_EXTENSION, tsError);
    end;

    if (i mod ProcessedItemThreshold) = 0 then
      SetComment(Format('Обработано файлов: %u из %u', [i + 1, FFiles.Count]));
    SetProgress((i + 1) * 100 div FFiles.Count);
  end;
  FTemplater.Free;
  Teletype(Format('Добавлено файлов: %u из %u', [AddedBooks, FFiles.Count]),tsInfo);
end;

end.

