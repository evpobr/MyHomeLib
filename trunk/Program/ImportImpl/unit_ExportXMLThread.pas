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

unit unit_ExportXMLThread;

interface

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_MHL_xml;

type
  TExport2XMLThread = class(TWorker)
  private
    FXMLFileName: string;

  protected
    procedure WorkFunction; override;

  public
    property XMLFileName: string read FXMLFileName write FXMLFileName;
  end;

implementation

uses
  dm_collection,
  dm_user,
  unit_Globals,
  unit_MHL_strings;

resourcestring
  rstrExportingCollection = 'Экспортируем коллекцию.';
  rstrSavingDocumentPleaseWait = 'Сохраняем документ. Подождите, пожалуйста.';

{ TImportXMLThread }

(*

Вообще говоря, использовать основной экземпляр датамодуля в потоке не очень корректно.
Но!, 1) мы не используем датаэвэ-контролы, 2) все использование происходит при поднятой модальной форме.
Возможно, стоит создавать новый экземпляр, но пока обойдемся и так.

*)

procedure TExport2XMLThread.WorkFunction;
var
  FCollection: IXMLCollection;
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

  FCollection.Info.Name := DMUser.ActiveCollection.Name;
  FCollection.Info.Code := Ord(DMUser.ActiveCollection.CollectionType);

  totalBooks := DMCollection.GetTotalNumBooks;
  processedBooks := 0;

  BookIterator := DMCollection.GetBookIterator(bmAll, True);
  while BookIterator.Next(R) do
  begin
    if Canceled then
      Exit;

    FBook := FCollection.BookList.Add;
    FBook.Title := R.Title;
    FBook.Series := R.Serie;
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

  SetComment(rstrSavingDocumentPleaseWait);
  FCollection.OwnerDocument.SaveToFile(FXMLFileName);
end;

end.

