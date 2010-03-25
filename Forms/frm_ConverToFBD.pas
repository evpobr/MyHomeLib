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
  RzLabel,
  Mask,
  RzEdit,
  Buttons,
  ExtCtrls,
  RzPanel,
  dm_Collection,
  unit_Globals,
  ImgList,
  RzButton,
  xmldom,
  FBDDocument,
  FBDAuthorTable;

type
  TfrmConvertToFBD = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    mmAnnotation: TMemo;
    btnSave: TBitBtn;
    RzLabel1: TRzLabel;
    RzGroupBox2: TRzGroupBox;
    RzLabel4: TRzLabel;
    edISBN: TRzEdit;
    edPublisher: TRzEdit;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    edYear: TRzEdit;
    edCity: TRzEdit;
    RzLabel5: TRzLabel;
    ImageList1: TImageList;
    btnOpenBook: TRzBitBtn;
    lblAuthor: TRzLabel;
    lblTitle: TRzLabel;
    RzGroupBox3: TRzGroupBox;
    btnPasteCover: TRzBitBtn;
    FCover: TImage;
    btnLoad: TRzBitBtn;
    BitBtn1: TBitBtn;
    btnPrevious: TBitBtn;
    btnNext: TBitBtn;
    FBD: TFBDDocument;
    alFBDAuthors: TFBDAuthorTable;
    procedure btnPasteCoverClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnOpenBookClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    FBookRecord: TBookRecord;
    FEditorMode: boolean;

    FBusy : boolean;
    FTerminated: boolean;

    procedure ChangeBookData;
    procedure PrepareForm;
    procedure EnableButtons(State: boolean);
    function FillFBDData: boolean;
    procedure SaveFBD;
  public
    { Public declarations }
    procedure AutoMode;
    property EditorMode: boolean read FEditorMode write FEditorMode;
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

procedure TfrmConvertToFBD.BitBtn1Click(Sender: TObject);
begin
  FTerminated := True;
end;

procedure TfrmConvertToFBD.btnLoadClick(Sender: TObject);
var
  FileName: string;
begin
  if GetFileName(fnOpenCoverImage,FileName) then FBD.LoadCoverFromFile(FileName);
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
  if FBusy then Exit;
  SaveFBD;
  Modalresult := mrOk;
end;

procedure TfrmConvertToFBD.btnNextClick(Sender: TObject);
begin
  if FBusy then Exit;
  SaveFBD;
  frmMain.SelectNextBook(False,True);
  PrepareForm;
end;

procedure TfrmConvertToFBD.btnPreviousClick(Sender: TObject);
begin
  if FBusy then Exit;
  SaveFBD;
  frmMain.SelectNextBook(False, False);
  PrepareForm;
end;

procedure TfrmConvertToFBD.ChangeBookData;
begin
  DMCollection.ActiveTable.Edit;
//  DMCollection.ActiveTable.FieldByName('Ext').Value := ExtractFileExt(FBookFilename);
  DMCollection.ActiveTable.FieldByName(FILENAME_FIELD).Value := DMCollection.ActiveTable.FieldByName(FILENAME_FIELD).Value + '.zip';
  DMCollection.ActiveTable.Post;
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

function TfrmConvertToFBD.FillFBDData:boolean;
var
  I: Integer;
  AuthorsFBD: TAuthorDataList;
begin
  Result := False;

  SetLength(AuthorsFBD, FBookRecord.AuthorCount);
  for i := 0 to FBookRecord.AuthorCount - 1 do
  begin
    AuthorsFBD[i].Last :=  FBookRecord.Authors[i].LastName;
    AuthorsFBD[i].First :=  FBookRecord.Authors[i].FirstName;
    AuthorsFBD[i].Middle :=  FBookRecord.Authors[i].MiddleName;
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
    FBD.AddSeries(sltBook, FBookRecord.Series, FBookRecord.SeqNumber);

    Genre.Clear;
    for I := 0 to High(FBookRecord.Genres) do
      Genre.Add(FBookRecord.Genres[i].GenreFb2Code);
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
  DMCollection.GetCurrentBook(FBookRecord);

  lblAuthor.Caption := FBookRecord.Authors[0].FLastName + ' ' +
                       FBookRecord.Authors[0].FFirstName;

  lblTitle.Caption := FBookRecord.Title;
  Folder := DMUser.ActiveCollection.RootPath + FBookRecord.Folder;

  if FEditorMode then
  begin
    FBD.Load(Folder, TPath.GetFileNameWithoutExtension(FBookrecord.FileName), FBookrecord.FileExt);
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
    FBD.New(Folder, FBookrecord.FileName, FBookrecord.FileExt);
end;

procedure TfrmConvertToFBD.SaveFBD;
begin
  EnableButtons(False);
  FBusy := True;
  Screen.Cursor := crHourGlass;
  try
    if FillFBDData then
    begin
      FBD.Save(FeditorMode);
      if not FEditorMode then ChangeBookData;
    end;
  finally
    EnableButtons(True);
    Screen.Cursor := crDefault;
    FBusy := False;
  end;
end;

end.
