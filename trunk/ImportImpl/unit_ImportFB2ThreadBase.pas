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

unit unit_ImportFB2ThreadBase;

interface

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  globals,
  FictionBook_21,
  database,
  files_list;

type
  TImportFB2ThreadBase = class(TWorker)
  protected
    FDBFileName: string;
    FLibrary: TMHLLibrary;
    FFiles: TStringList;
    FRootPath: string;
    FFilesList: TFilesList;

    FCheckExistsFiles: Boolean;

    procedure ScanFolder;

    procedure ShowCurrentDir(Sender: TObject; const Dir: string);
    procedure AddFile2List(Sender: TObject; const F: TSearchRec); virtual; abstract;

  protected
    procedure WorkFunction; override;
    procedure ProcessFileList; virtual; abstract;
    procedure GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);

  public
    property DBFileName: string read FDBFileName write FDBFileName;
  end;

implementation

uses
  dm_user,
  unit_Settings,
  unit_Consts;

{ TImportFB2Thread }

procedure TImportFB2ThreadBase.GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);
var
  i: integer;
begin
  with Book.Description.Titleinfo do
  begin
    for i := 0 to Author.Count - 1 do
      R.AddAuthor(Author[i].Lastname.Text, Author[i].Firstname.Text, '');

    if Booktitle.IsTextElement then
      R.Title := Booktitle.Text;

    for i := 0 to Genre.Count - 1 do
      R.AddGenre('', Genre[i], '');

    if Sequence.Count > 0 then
    begin
      try
        R.Series := Sequence[0].Name;
        R.SeqNumber := Sequence[0].Number;
      except
      end;
    end;
  end;
end;

procedure TImportFB2ThreadBase.ShowCurrentDir(Sender: TObject; const Dir: string);
begin
  SetComment(Format('Сканируем %s', [Dir]));
end;

procedure TImportFB2ThreadBase.ScanFolder;
begin
  SetProgress(0);
  SetComment('Сканируем...');
  Teletype('Сканирование папок...');

  FCheckExistsFiles := Settings.CheckExistsFiles;

  FFilesList := TFilesList.Create(nil);
  try
    FFilesList.TargetPath := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);
    FFilesList.OnDirectory := ShowCurrentDir;
    FFilesList.OnFile := AddFile2List;
    try
      FFilesList.Process;
    except
      on EAbort do {nothing};
    end;
  finally
    FreeAndNil(FFilesList);
  end;
end;

procedure TImportFB2ThreadBase.WorkFunction;
begin
  FRootPath := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  FLibrary := TMHLLibrary.Create(nil);
  try
    FLibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
    FLibrary.Active := True;

    FFiles := TStringList.Create;
    try
      ScanFolder;
      
      if Canceled then
        Exit;

      FLibrary.BeginBulkOperation;
      try
        ProcessFileList;
      finally
        FLibrary.EndBulkOperation;
      end;
    finally
      FreeAndNil(FFiles);
    end;
  finally
    FreeAndNil(FLibrary);
  end;
end;

end.

