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
  FBDAuthorTable;

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
    procedure btnPasteCoverClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnOpenBookClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    FBookRecord: TBookRecord;
    FEditorMode: Boolean;

    FBusy: Boolean;
    FTerminated: Boolean;

    procedure ChangeBookData;
    procedure PrepareForm;
    procedure EnableButtons(State: boolean);
    function FillFBDData: boolean;
    procedure SaveFBD;

  public
    procedure AutoMode;
    property EditorMode: Boolean read FEditorMode write FEditorMode;
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
  frm_Main,
  ZipForge,
  dm_user,
  unit_Helpers,
  ActiveX,
  ComObj,
  Dialogs,
  unit_Consts;

{$R *.dfm}

procedure TfrmConvertToFBD.AutoMode;
var
  FirstID: integer;
begin
  FTerminated := False;
  PrepareForm;
  Show;
  btnNextClick(Self);
  FirstID := frmMain.LastActiveBookID;
  repeat
    btnNextClick(Self);
  until (FirstID = frmMain.LastActiveBookID) or FTerminated;
  Close;
end;

procedure TfrmConvertToFBD.btnCancelClick(Sender: TObject);
begin
  FTerminated := True;
end;

procedure TfrmConvertToFBD.btnLoadClick(Sender: TObject);
var
  FileName: string;
begin
  if GetFileName(fnOpenCoverImage, FileName) then
    FBD.LoadCoverFromFile(FileName);
end;

procedure TfrmConvertToFBD.btnOpenBookClick(Sender: TObject);
begin
  frmMain.tbtbnReadClick(Sender);
end;

procedure TfrmConvertToFBD.btnPasteCoverClick(Sender: TObject);
begin
  FBD.LoadCoverFromClpbrd;
end;

procedure TfrmConvertToFBD.btnSaveClick(Sender: TObject);
begin
  if FBusy then
    Exit;

  SaveFBD;
  ModalResult := mrOk;
end;

procedure TfrmConvertToFBD.btnNextClick(Sender: TObject);
begin
  if FBusy then
    Exit;

  SaveFBD;
  frmMain.SelectNextBook(False, True);
  PrepareForm;
end;

procedure TfrmConvertToFBD.btnPreviousClick(Sender: TObject);
begin
  if FBusy then
    Exit;

  SaveFBD;
  frmMain.SelectNextBook(False, False);
  PrepareForm;
end;

procedure TfrmConvertToFBD.ChangeBookData;
begin
  DMCollection.tblBooks.Edit;
  DMCollection.tblBooksFileName.Value := DMCollection.tblBooksFileName.Value + '.zip';
  DMCollection.tblBooks.Post;
end;

procedure TfrmConvertToFBD.EnableButtons(State: boolean);
begin
  btnPrevious.Enabled := State;
  btnNext.Enabled     := State;
  btnSave.Enabled     := State;
end;

procedure TfrmConvertToFBD.FormCreate(Sender: TObject);
begin
  FBD.CoverSizeCode := 4;
end;

procedure TfrmConvertToFBD.FormShow(Sender: TObject);
begin
  PrepareForm;
end;

function TfrmConvertToFBD.FillFBDData: Boolean;
var
  i: Integer;
  AuthorsFBD: TAuthorDataList;
begin
  Result := False;

  SetLength(AuthorsFBD, FBookRecord.AuthorCount);
  for i := 0 to FBookRecord.AuthorCount - 1 do
  begin
    AuthorsFBD[i].Last := FBookRecord.Authors[i].LastName;
    AuthorsFBD[i].First := FBookRecord.Authors[i].FirstName;
    AuthorsFBD[i].Middle := FBookRecord.Authors[i].MiddleName;
    AuthorsFBD[i].Nick := '';
    AuthorsFBD[i].Email := '';
    AuthorsFBD[i].HomePage := '';
  end;

  FBD.SetAuthors(AuthorsFBD, atlBook);
  FBD.SetAuthors(alFBDAuthors.Items, atlFBD);

  with FBD.Title do
  begin
    Booktitle.Text := FBookRecord.Title;
    Keywords.Text := FBookRecord.KeyWords;
    Lang := FBookRecord.Lang;
    FBD.AddSeries(sltBook, FBookRecord.Serie, FBookRecord.SeqNumber);

    Genre.Clear;
    for i := 0 to High(FBookRecord.Genres) do
      Genre.Add(FBookRecord.Genres[i].FB2GenreCode);
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

procedure TfrmConvertToFBD.PrepareForm;
var
  Folder: string;
begin
  //
  // здесь использование этого метода не полностью оправдано
  //
  DMCollection.GetCurrentBook(FBookRecord);

  lblAuthor.Caption := FBookRecord.Authors[0].GetFullName;
  lblTitle.Caption := FBookRecord.Title;
  Folder := TPath.Combine(DMUser.ActiveCollection.RootPath, FBookRecord.Folder);

  if FEditorMode then
  begin
    FBD.Load(Folder, TPath.GetFileNameWithoutExtension(FBookRecord.FileName), FBookRecord.FileExt);
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
    FBD.New(Folder, FBookRecord.FileName, FBookRecord.FileExt);
end;

procedure TfrmConvertToFBD.SaveFBD;
begin
  EnableButtons(False);
  FBusy := True;
  Screen.Cursor := crHourGlass;
  try
    if FillFBDData then
    begin
      FBD.Save(FEditorMode);
      if not FEditorMode then
        ChangeBookData;
    end;
  finally
    EnableButtons(True);
    Screen.Cursor := crDefault;
    FBusy := False;
  end;
end;

end.
