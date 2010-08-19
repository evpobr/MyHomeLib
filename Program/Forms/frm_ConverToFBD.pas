(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
  * Created                  22.02.2010
  * Description              
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit frm_ConverToFBD;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  StdCtrls,
  Mask,
  Buttons,
  ExtCtrls,
  dm_Collection,
  unit_Globals,
  ImgList,
  xmldom,
  FBDDocument,
  FBDAuthorTable,
  unit_MHLHelpers;

type
  TfrmConvertToFBD = class(TForm)
    RzPanel1: TPanel;
    pnButtons: TPanel;
    mmAnnotation: TMemo;
    btnSave: TButton;
    RzLabel1: TLabel;
    RzGroupBox2: TGroupBox;
    RzLabel4: TLabel;
    edISBN: TEdit;
    edPublisher: TEdit;
    RzLabel6: TLabel;
    RzLabel7: TLabel;
    edYear: TEdit;
    edCity: TEdit;
    RzLabel5: TLabel;
    ilButtonImages: TImageList;
    btnOpenBook: TButton;
    lblAuthor: TLabel;
    lblTitle: TLabel;
    RzGroupBox3: TGroupBox;
    btnPasteCover: TButton;
    FCover: TImage;
    btnLoad: TButton;
    btnCancel: TButton;
    btnPrevious: TButton;
    btnNext: TButton;
    FBD: TFBDDocument;
    alFBDAuthors: TFBDAuthorTable;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnOpenBookClick(Sender: TObject);
    procedure btnPasteCoverClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FEditorMode: Boolean;

    FBusy: Boolean;
    FTerminated: Boolean;

    // Events:
    FOnReadBook: TBookEvent;
    FOnSelectBook: TSelectBookEvent;
    FOnGetBook: TGetBookEvent;
    FOnChangeBook2Zip: TBookEvent;

    procedure PrepareForm;
    function FillFBDData: boolean;
    procedure SaveFBD;
    procedure EnableButtons(State: boolean);

  public
    procedure AutoMode;

    property EditorMode: Boolean read FEditorMode write FEditorMode;

    property OnReadBook: TBookEvent read FOnReadBook write FOnReadBook;
    property OnSelectBook: TSelectBookEvent read FOnSelectBook write FOnSelectBook;
    property OnGetBook: TGetBookEvent read FOnGetBook write FOnGetBook;
    property OnChangeBook2Zip: TBookEvent read FOnChangeBook2Zip write FOnChangeBook2Zip;
  end;

var
  frmConvertToFBD: TfrmConvertToFBD;

implementation

uses
  IOUtils,
  EncdDecd,
  jpeg,
  pngimage,
  Clipbrd,
  ZipForge,
  dm_user,
  unit_Helpers,
  ActiveX,
  ComObj,
  Dialogs,
  unit_Consts;

{$R *.dfm}

procedure TfrmConvertToFBD.FormCreate(Sender: TObject);
begin
  FBD.CoverSizeCode := 4;
end;

procedure TfrmConvertToFBD.FormShow(Sender: TObject);
begin
  PrepareForm;
end;

procedure TfrmConvertToFBD.btnOpenBookClick(Sender: TObject);
begin
  OnReadBook;
end;

procedure TfrmConvertToFBD.btnPasteCoverClick(Sender: TObject);
begin
  FBD.LoadCoverFromClpbrd;
end;

procedure TfrmConvertToFBD.btnLoadClick(Sender: TObject);
var
  FileName: string;
begin
  if GetFileName(fnOpenCoverImage, FileName) then
    FBD.LoadCoverFromFile(FileName);
end;

procedure TfrmConvertToFBD.btnPreviousClick(Sender: TObject);
begin
  if FBusy then
    Exit;

  SaveFBD;
  OnSelectBook(False);
  PrepareForm;
end;

procedure TfrmConvertToFBD.btnNextClick(Sender: TObject);
begin
  if FBusy then
    Exit;

  SaveFBD;
  OnSelectBook(True);
  PrepareForm;
end;

procedure TfrmConvertToFBD.btnSaveClick(Sender: TObject);
begin
  if FBusy then
    Exit;

  SaveFBD;
  ModalResult := mrOk;
end;

procedure TfrmConvertToFBD.btnCancelClick(Sender: TObject);
begin
  FTerminated := True;
end;

procedure TfrmConvertToFBD.PrepareForm;
var
  Folder: string;
  BookRecord: TBookRecord;
begin
  OnGetBook(BookRecord);
  lblAuthor.Caption := BookRecord.Authors[0].GetFullName;
  lblTitle.Caption := BookRecord.Title;
  // Never bfFb2Zip, so it's always a folder:
  Folder := BookRecord.GetBookContainer;

  if
    FEditorMode and
    FBD.Load(Folder, TPath.GetFileNameWithoutExtension(BookRecord.FileName), BookRecord.FileExt)
  then
  begin
    alFBDAuthors.Items := FBD.GetAuthors(atlFBD);
    with FBD.Publisher do
    begin
      edPublisher.Text := Publisher.Text;
      edCity.Text := City.Text;
      edISBN.Text := ISBN.Text;
      edYear.Text := Year;
    end;
  end
  else
  begin
    FBD.New(Folder, BookRecord.FileName, BookRecord.FileExt);
    edPublisher.Text := '';
    edCity.Text := '';
    edISBN.Text := '';
    edYear.Text := '';
    mmAnnotation.Text := '';
    alFBDAuthors.Clear;
    FCover.Picture := nil;
  end;

    //
    // TODO : зачитывать аннотацию и обложку
    //
end;

function TfrmConvertToFBD.FillFBDData: Boolean;
var
  i: Integer;
  AuthorsFBD: TAuthorDataList;
  BookRecord: TBookRecord;
begin
  Result := False;

  OnGetBook(BookRecord);
  SetLength(AuthorsFBD, BookRecord.AuthorCount);
  for i := 0 to BookRecord.AuthorCount - 1 do
  begin
    AuthorsFBD[i].Last := BookRecord.Authors[i].LastName;
    AuthorsFBD[i].First := BookRecord.Authors[i].FirstName;
    AuthorsFBD[i].Middle := BookRecord.Authors[i].MiddleName;
    AuthorsFBD[i].Nick := '';
    AuthorsFBD[i].Email := '';
    AuthorsFBD[i].HomePage := '';
  end;

  FBD.SetAuthors(AuthorsFBD, atlBook);
  FBD.SetAuthors(alFBDAuthors.Items, atlFBD);

  with FBD.Title do
  begin
    Booktitle.Text := BookRecord.Title;
    Keywords.Text := BookRecord.KeyWords;
    Lang := BookRecord.Lang;
    FBD.AddSeries(sltBook, BookRecord.Serie, BookRecord.SeqNumber);

    Genre.Clear;
    for i := 0 to High(BookRecord.Genres) do
      Genre.Add(BookRecord.Genres[i].FB2GenreCode);
  end;

  with FBD.Publisher do
  begin
    Publisher.Text := edPublisher.Text;
    City.Text := edCity.Text;
    ISBN.Text := edISBN.Text;
    Year := edYear.Text;
  end;

  FBD.AutoLoadCover;

  Result := True;
end;

procedure TfrmConvertToFBD.SaveFBD;
begin
  EnableButtons(False);
  FBusy := True;
  Screen.Cursor := crHourGlass;
  try
    if FillFBDData then
    begin
      FBD.ProgramUsed := GetProgramUsed(Application.ExeName);
      FBD.Save(FEditorMode);
      if not FEditorMode then
        OnChangeBook2Zip;
    end;
  finally
    EnableButtons(True);
    Screen.Cursor := crDefault;
    FBusy := False;
  end;
end;

procedure TfrmConvertToFBD.EnableButtons(State: boolean);
begin
  btnPrevious.Enabled := State;
  btnNext.Enabled     := State;
  btnSave.Enabled     := State;
end;

procedure TfrmConvertToFBD.AutoMode;
var
  FirstID: integer;
  BookRecord: TBookRecord;
begin
  Assert(False, 'Not implemented yet');
  // TODO - add normal logic with a mutex that never corrupts a book file!
  FTerminated := False;
  PrepareForm;
  Show;
  btnNextClick(Self);
  OnGetBook(BookRecord);
  FirstID := BookRecord.BookID;
  repeat
    btnNextClick(Self);
    OnGetBook(BookRecord);
  until (FirstID = BookRecord.BookID) or FTerminated;
  Close;
end;

end.
