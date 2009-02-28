
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}


unit frm_librusec_import;

interface

uses
  Classes, Controls, Forms, StdCtrls, RzCommon, RzSelDir, RzPrgres, RzLabel, ExtCtrls, RzPanel, globals,
  SysUtils, StrUtils;

type
  TfrmImportTXT = class(TForm)
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    pbProgress: TRzProgressBar;
    dlgBaseFolder: TRzSelDirDialog;
  private

  public
    procedure ImportTables(
      const DBFileName: string;
      const Code: COLLECTION_TYPE;
      RootFolder: string
      );
  end;

var
  frmImportTXT: TfrmImportTXT;

implementation

uses database, dm_user, unit_Settings, unit_Consts, unit_Helpers, frm_main;

{$R *.dfm}

{ TfrmIndexRebuild }

function ParseData(input: WideString; var R: TBookRecord): Boolean;
const
  DelimiterChar = Chr(4);
var
  p: integer;
  slParams: TStringList;
  AuthorList: string;
  strLastName: string;
  strFirstName: string;
  strMidName: string;
  GenreList: string;
  s: string;
  mm, dd, yy: word;
begin
  Result := False;
  
  R.Clear;

  slParams := TStringList.Create;
  try
    slParams.Delimiter := DelimiterChar;
    slParams.StrictDelimiter := True;
    slParams.DelimitedText := input;
    if slParams.Count in [11,12] then
    begin
      //
      // Список авторов
      //
      AuthorList := slParams[0];
      p := Pos(':', AuthorList);
      while p <> 0 do
      begin
        s := Copy(AuthorList, 1, p - 1);
        Delete(AuthorList, 1, p);

        p := Pos(',', s);
        strLastName := Copy(s, 1, p - 1);
        Delete(S, 1, p);

        p := Pos(',', s);
        strFirstName := Copy(s, 1, p - 1);
        Delete(S, 1, p);

        strMidName := S;

        R.AddAuthor(strLastName, strFirstName, strMidName);

        p := Pos(':', AuthorList);
      end;

      //
      // Список жанров
      //
      GenreList := slParams[1];
      p := Pos(':', GenreList);
      while p <> 0 do
      begin
        R.AddGenre('', Copy(GenreList, 1, p - 1), '');
        Delete(GenreList, 1, p);

        p := Pos(':', GenreList);
      end;

      //
      // Название
      //
      R.Title := slParams[2];

      //
      // Серия
      //
      R.Series := slParams[3];

      //
      // Номер внутри серии
      //
      R.SeqNumber := StrToIntDef(slParams[4], 0);

      //
      // Имя файла, размер, ????, признак удаленной книги
      //
      R.FileName := CheckSymbols(Trim(slParams[5]));
      R.Size := StrToIntDef(slParams[6], 0);
      R.LibID := StrToIntDef(slParams[7], 0);
      R.Deleted := (slParams[8] = '1');

      //
      // { TODO -oNickR -cpossible bug : params[9] содержит расширение файла, но мы используем хардкоденное значение }
      //
      R.FileExt := FB2_EXTENSION;

      //
      //
      //
      if slParams[10] <> '' then
      begin
        yy := StrToInt(Copy(slParams[10], 1, 4));
        mm := StrToInt(Copy(slParams[10], 6, 2));
        dd := StrToInt(Copy(slParams[10], 9, 2));
        R.Date := EncodeDate(yy, mm, dd);
      end;
      // else R.Date:=now;

      R.Normalize;

      Result := True;
    end;
  finally
    slParams.Free;
  end;
end;

procedure TfrmImportTXT.ImportTables(const DBFileName: string; const Code: COLLECTION_TYPE; RootFolder: string);
var
  FileList: TStringList;
  BookList: TStringList;
  ver: Integer;
  i: Integer;
  j: Integer;
  F:TextFile;
  R: TBookRecord;
  s: string;
  ALibrary: TMHLLibrary;
begin
  frmImportTXT.Show;

  frmMain.DisableControls(False);
  try
    ALibrary := TMHLLibrary.Create(nil);
    try
      //
      // (Пере)создать коллекцию
      //
      ALibrary.CreateCollectionTables(DBFileName, Settings.SystemFileName[sfGenresFB2]);

      ALibrary.BeginBulkOperation;
      try
        FileList := TStringList.Create;
        try
          FileList.LoadFromFile(Settings.SystemFileName[sfFileList]);

          for i := 0 to FileList.Count - 1 do
          try
            //
            // Используем TStringListEx для чтения UTF8 файла
            //
            BookList := TStringListEx.Create;
            try
              BookList.LoadFromFile(Settings.INPPath + FileList[i]);
              for j := 0 to BookList.Count - 1 do
              begin
                if ParseData(UTF8Decode(BookList[j]), R) then
                begin
                  if isOnlineCollection(Code) then
                  begin
                    //
                    // И\Иванов Иван Иванович\1234 Просто книга.fb2.zip
                    //
                    R.Folder := R.GenerateLocation + FB2ZIP_EXTENSION;

                    //
                    // Сохраним отметку о существовании файла
                    //
                    R.Local := FileExists(RootFolder + R.Folder);
                  end
                  else
                  begin
                    //
                    // 98058-98693.inp -> 98058-98693.zip
                    //
                    R.Folder := ChangeFileExt(FileList[i], ZIP_EXTENSION);

                    //
                    // номер файла внутри zip-а
                    //
                    R.InsideNo := j;
                  end;

                  ALibrary.InsertBook(R);
                end;
              end;
            finally
              BookList.Free;
            end;
          finally
            pbProgress.Percent := (i + 1) * 100 div FileList.Count;
            Application.ProcessMessages;
          end;
        finally
          FileList.Free;
        end;
      finally
        ALibrary.EndBulkOperation;
      end;
    finally
      ALibrary.Free;
    end;

    //
    // Прочитаем версию в файл .\LIBRUSEC_INP\version.info
    //
    ver := 0;
    if FileExists(Settings.SystemFileName[sfLibRusEcVerInfo]) then
    begin
      AssignFile(F, Settings.SystemFileName[sfLibRusEcVerInfo]);
      Reset(F);
      Readln(F, S);
      CloseFile(F);

      Ver := StrToIntDef(S, 0);
    end;

    //
    // Обновим информацию о коллекции в базе
    //
    DMUser.tblBases.Edit;
    DMUser.ActiveCollection.CreationDate := Now;
    DMUser.ActiveCollection.Version := Ver;
    DMUser.tblBases.Post;
  finally
    frmMain.DisableControls(True);
    frmImportTXT.Close;
  end;
end;


end.
