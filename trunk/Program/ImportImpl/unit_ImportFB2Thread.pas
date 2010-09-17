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
  unit_ImportFB2ThreadBase;

type
  TImportFB2Thread = class(TImportFB2ThreadBase)
  protected
    procedure ProcessFileList; override;
  public
    constructor Create(const CollectionRoot: string; const DBFileName: string);
  end;

implementation

uses
  Classes,
  SysUtils,
  IOUtils,
  unit_WorkerThread,
  unit_globals,
  FictionBook_21,
  unit_Helpers,
  unit_Consts,
  unit_Settings,
  unit_Templater;

resourcestring
  rstrStructureError = 'Ошибка структуры fb2: %s.zip -> %s';
  rstrProcessedFiles = 'Обработано файлов: %u из %u';
  rstrAddedFiles = 'Добавлено файлов: %u из %u';

{ TImportFB2Thread }

constructor TImportFB2Thread.Create(const CollectionRoot: string; const DBFileName: string);
begin
  inherited Create(CollectionRoot, DBFileName);

  FTargetExt := FB2_EXTENSION;
  FZipFolder := False;
  FFullNameSearch := False;
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
            SortFiles(R); // изменит R.Folder и R.FileName
          end
          else
          begin
            R.Folder := ExtractRelativePath(FCollectionRoot, ExtractFilePath(FFiles[i]));
            book := LoadFictionBook(FFiles[i]);
            GetBookInfo(book, R);
          end;
          FLibrary.InsertBook(R, True, True);
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

end.

