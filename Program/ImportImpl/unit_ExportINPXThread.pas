(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov    nrymanov@gmail.com
  *                     Aleksey Penkov  alex.penkov@gmail.com
  * Created             22.02.2010
  * Description
  *
  * $Id$
  *
  * History
  * NickR 08.04.2010    Информация из глобальных переменных зачитывается в контексте основного потока.
  *
  ****************************************************************************** *)

unit unit_ExportINPXThread;

interface

uses
  Classes,
  unit_WorkerThread,
  unit_Globals;

type
  TExport2INPXThread = class(TWorker)
  strict private
    FTempPath: string;

    FCollectionName: string;
    FCollectionDBFileName: string;
    FCollectionType: COLLECTION_TYPE;
    FCollectionVersion: Integer;
    FCollectionNotes: string;

    FINPXFileName: string;

    FGenresType: TGenresType;

    procedure INPRecordCreate(const R: TBookRecord; writer: TStreamWriter);

  protected
    procedure WorkFunction; override;

  public
    constructor Create;

    property INPXFileName: string read FINPXFileName write FINPXFileName;
  end;

implementation

uses
  Windows,
  Forms,
  SysUtils,
  StrUtils,
  ZipForge,
  unit_Consts,
  unit_MHLGenerics,
  unit_Settings,
  unit_MHL_strings,
  unit_Interfaces,
  unit_SystemDatabase;

resourcestring
  rstrVersionFrom = 'Версия от ddddd';
  rstrExportingCollection = 'Экспортируем коллекцию.';
  rstrSaving = 'Сохраняем документ. Подождите, пожалуйста.';

const
  BOOKS_INFO_FILE = 'books.inp'; { TODO -oNickR -cRefactoring : добавить в систебные файлы? }

  { TImportXMLThread }

constructor TExport2INPXThread.Create;
var
  CollectionInfo: ICollectionInfo;
begin
  inherited Create;

  FTempPath := Settings.TempPath;

  CollectionInfo := GetSystemData.GetActiveCollectionInfo;
  FCollectionType := CollectionInfo.CollectionType;
  FCollectionVersion := CollectionInfo.Version;
  FCollectionName := CollectionInfo.Name;
  FCollectionDBFileName := CollectionInfo.DBFileName;

  FCollectionNotes := CollectionInfo.Notes;
  if FCollectionNotes = '' then
    FCollectionNotes := FormatDateTime(rstrVersionFrom, Now);
end;

procedure TExport2INPXThread.WorkFunction;
var
  BookCollection: IBookCollection;
  R: TBookRecord;
  BookIterator: IBookIterator;

  inpxStream: TMemoryStream;
  inpxWriter: TStreamWriter;
  inpxZIP: TZipForge;
  header: TINPXHeader;
begin
  SetComment(rstrExportingCollection);

  if isFB2Collection(FCollectionType) then
    FGenresType := gtFb2
  else
    FGenresType := gtAny;

  inpxStream := TMemoryStream.Create;
  try
    inpxWriter := TStreamWriter.Create(inpxStream, TEncoding.UTF8);
    try
      BookCollection := GetSystemData.GetCollection(FCollectionDBFileName);
      try
        BookIterator := BookCollection.GetBookIterator(bmAll, True);
        try
          FProgressEngine.BeginOperation(BookIterator.RecordCount, rstrBookProcessedMsg1, rstrBookProcessedMsg2);
          try
            while BookIterator.Next(R) do
            begin
              if Canceled then
                Exit;

              INPRecordCreate(R, inpxWriter);

              FProgressEngine.AddProgress;
            end;
          finally
            FProgressEngine.EndOperation;
          end;
        finally
          BookIterator := nil;
        end;
      finally
        BookCollection := nil;
      end;
    finally
      inpxWriter.Free;
    end;

    FProgressEngine.BeginOperation(-1, rstrSaving, rstrSaving);
    try
      inpxStream.Position := 0;
      //
      // Все готово - пакуем
      //
      inpxZIP := TZipForge.Create(nil);
      try
        inpxZIP.FileName := INPXFileName;
        inpxZIP.BaseDir := FTempPath;
        inpxZIP.OpenArchive(fmCreate);

        inpxZIP.AddFromStream(BOOKS_INFO_FILE, inpxStream);

        if UNVERSIONED_COLLECTION = FCollectionVersion then
          inpxZIP.AddFromString(VERINFO_FILENAME, FormatDateTime('yyyymmdd', Now))
        else
          inpxZIP.AddFromString(VERINFO_FILENAME, IntToStr(FCollectionVersion));

        inpxZIP.AddFromString(
          STRUCTUREINFO_FILENAME,
          'AUTHOR;GENRE;TITLE;SERIES;SERNO;FILE;SIZE;LIBID;DEL;EXT;DATE;INSNO;FOLDER;LANG;KEYWORDS;'
        );

        //
        // Устанавливаем комментарий для INPX-файла
        //
        header.Name := FCollectionName;
        header.FileName := ExtractFileName(FCollectionDBFileName);
        header.ContentType := FCollectionType;
        header.Notes := FCollectionNotes;
        //header.URL := TODO
        //header.Script := TODO

        inpxZIP.Comment := header.AsString;

        inpxZIP.CloseArchive;
      finally
        inpxZIP.Free;
      end;
    finally
      FProgressEngine.EndOperation;
    end;
  finally
    inpxStream.Free;
  end;
end;

procedure TExport2INPXThread.INPRecordCreate(const R: TBookRecord; writer: TStreamWriter);
var
  strAuthors: string;
  strGenres: string;
  strFileExt: string;
begin
  //
  // Список авторов
  //
  strAuthors :=
    TArrayUtils.Join<TAuthorData>(
      R.Authors,
      INPX_ITEM_DELIMITER,
      function(const a: TAuthorData): string
      begin
        Result := a.LastName + INPX_SUBITEM_DELIMITER + a.FirstName + INPX_SUBITEM_DELIMITER + a.MiddleName;
      end
    ) + INPX_ITEM_DELIMITER;

  //
  // Список жанров
  //
  strGenres :=
    TArrayUtils.Join<TGenreData>(
      R.Genres,
      INPX_ITEM_DELIMITER,
      function(const g: TGenreData): string
      begin
        Result := IfThen(FGenresType = gtFb2, g.FB2GenreCode, g.GenreCode);
      end
    ) + INPX_ITEM_DELIMITER;

  strFileExt := R.FileExt;
  Delete(strFileExt, 1, 1);

  writer.Write(strAuthors);                           writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(strGenres);                            writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(Trim(R.Title));                        writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(Trim(R.Series));                       writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(R.SeqNumber);                          writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(CheckSymbols(Trim(R.FileName)));       writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(R.Size);                               writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(R.LibID);                              writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(IfThen(bpIsDeleted in R.BookProps, '1', '0')); writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(strFileExt);                           writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(FormatDateTime('yyyy-mm-dd', R.Date)); writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(R.InsideNo);                           writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(R.Folder);                             writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(R.Lang);                               writer.Write(INPX_FIELD_DELIMITER);
  writer.Write(R.KeyWords);                           writer.Write(INPX_FIELD_DELIMITER);
  writer.WriteLine;
end;

end.
