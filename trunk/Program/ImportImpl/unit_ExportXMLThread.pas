(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov    nrymanov@gmail.com
  *                     Aleksey Penkov  alex.penkov@gmail.com
  * Created             20.08.2008
  * Description
  *
  * $Id$
  *
  * History
  * NickR 02.09.2010    Информация из глобальных переменных зачитывается в контексте основного потока.
  *
  ****************************************************************************** *)

unit unit_ExportXMLThread;

interface

uses
  Classes,
  SysUtils,
  unit_Globals,
  unit_WorkerThread,
  unit_MHL_xml;

type
  TExport2XMLThread = class(TWorker)
  private
    FCollectionName: string;
    FCollectionDBFileName: string;
    FCollectionType: COLLECTION_TYPE;
    FXMLFileName: string;

  protected
    procedure WorkFunction; override;

  public
    constructor Create;

    property XMLFileName: string read FXMLFileName write FXMLFileName;
  end;

implementation

uses
  dm_user,
  unit_MHL_strings,
  unit_Database,
  unit_Interfaces;

resourcestring
  rstrExportingCollection = 'Экспортируем коллекцию.';
  rstrSavingDocumentPleaseWait = 'Сохраняем документ. Подождите, пожалуйста.';

{ TImportXMLThread }

constructor TExport2XMLThread.Create;
begin
  inherited Create;

  FCollectionName := DMUser.ActiveCollectionInfo.Name;
  FCollectionDBFileName := DMUser.ActiveCollectionInfo.DBFileName;
  FCollectionType := DMUser.ActiveCollectionInfo.CollectionType;
end;

procedure TExport2XMLThread.WorkFunction;
var
  FCollection: IXMLCollection;
  BookCollection: TBookCollection;
  FBook: IXMLBook;
  FAuthor: IXMLAuthor;
  FGenre: IXMLGenre;
  totalBooks: Integer;
  processedBooks: Integer;
  R: TBookRecord;
  AuthorRecord: TAuthorData;
  GenreRecord: TGenreData;
  BookIterator: IBookIterator;
begin
  SetComment(rstrExportingCollection);

  FCollection := NewCollection();

  FCollection.OwnerDocument.Encoding := 'UTF-8';

  FCollection.Info.Name := FCollectionName;
  FCollection.Info.Code := Ord(FCollectionType);

  processedBooks := 0;

  BookCollection := CreateBookCollection(FCollectionDBFileName, False);
  try
    BookIterator := GetActiveBookCollection.GetBookIterator(bmAll, True);
    try
      totalBooks := BookIterator.GetNumRecords;
      while BookIterator.Next(R) do
      begin
        if Canceled then
          Exit;

        FBook := FCollection.BookList.Add;
        FBook.Title := R.Title;
        FBook.Series := R.Series;
        FBook.File_.Inside_no := R.InsideNo;
        FBook.No := R.SeqNumber;
        FBook.File_.Folder := R.Folder;
        FBook.File_.Ext := R.FileExt;
        FBook.File_.Size := R.Size;
        FBook.File_. Name := R.FileName;
        FBook.Date := DateToStr(R.Date);

        for AuthorRecord in R.Authors do
        begin
          FAuthor := FBook.AuthorList.Add;
          FAuthor.Name := AuthorRecord.FirstName;
          FAuthor.Family := AuthorRecord.LastName;
          FAuthor.Middle := AuthorRecord.MiddleName;
        end;

        for GenreRecord in R.Genres do
        begin
          FGenre := FBook.GenreList.Add;
          FGenre.MHL_Code := GenreRecord.GenreCode;
          FGenre.Fb2_Code := GenreRecord.FB2GenreCode;
          FGenre.Alias := GenreRecord.GenreAlias;
        end;

        Inc(processedBooks);
        if (processedBooks mod ProcessedItemThreshold) = 0 then
          SetComment(Format(rstrBookProcessedMsg2, [processedBooks, totalBooks]));
        SetProgress(processedBooks * 100 div totalBooks);
      end;
      SetComment(Format(rstrBookProcessedMsg2, [processedBooks, totalBooks]));
    finally
      BookIterator := nil;
    end;
  finally
    FreeAndNil(BookCollection);
  end;

  SetComment(rstrSavingDocumentPleaseWait);
  FCollection.OwnerDocument.SaveToFile(FXMLFileName);
end;

end.

