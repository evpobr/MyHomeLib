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
  fictionbook_21,
  dm_Collection,
  unit_Globals,
  XMLDoc,
  ImgList,
  RzButton,
  xmldom,
  FBDDocument;

type

  TfrmConvertToFBD = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    mmAnnotation: TMemo;
    btnSave: TBitBtn;
    RzGroupBox1: TRzGroupBox;
    edFirstName: TRzEdit;
    RzLabel2: TRzLabel;
    edMiddleName: TRzEdit;
    RzLabel3: TRzLabel;
    edLastName: TRzEdit;
    RzLabel8: TRzLabel;
    edNickName: TRzEdit;
    RzLabel9: TRzLabel;
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
    procedure btnPasteCoverClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnOpenBookClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }

    FBookRecord: TBookRecord;
    FEditorMode: boolean;

    FBusy : boolean;
    FTerminated: boolean;

    procedure ChangeBookData;
    procedure PrepareForm;
    procedure EnableButtons(State: boolean);
    function MakeFBD: boolean;
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
  unit_Consts,
  Dialogs;

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
  FBD.LoadCoverFronClpbrd;
end;

procedure TfrmConvertToFBD.btnSaveClick(Sender: TObject);
begin
  if FBusy then Exit;
  FBD.Save(FEditorMode);
  Modalresult := mrOk;
end;

procedure TfrmConvertToFBD.btnNextClick(Sender: TObject);
begin
  if FBusy then Exit;
  FBD.Save(FEditorMode);
  frmMain.SelectNextBook(False,True);
  PrepareForm;
end;

procedure TfrmConvertToFBD.btnPreviousClick(Sender: TObject);
begin
  if FBusy then Exit;
  FBD.Save(FEditorMode);
  frmMain.SelectNextBook(False, False);
  PrepareForm;
end;

procedure TfrmConvertToFBD.ChangeBookData;
begin
  DMCollection.ActiveTable.Edit;
//  DMCollection.ActiveTable.FieldByName('Ext').Value := ExtractFileExt(FBookFilename);
  DMCollection.ActiveTable.FieldByName('FileName').Value := DMCollection.ActiveTable.FieldByName('FileName').Value + '.zip';
  DMCollection.ActiveTable.Post;
end;

procedure TfrmConvertToFBD.EnableButtons(State: boolean);
begin
  btnPrevious.Enabled := State;
  btnNext.Enabled     := State;
  btnSave.Enabled     := State;
end;

procedure TfrmConvertToFBD.FormShow(Sender: TObject);
begin
  PrepareForm;
end;

function TfrmConvertToFBD.MakeFBD:boolean;
begin
//  FFBD.First := edFirstName.Text;
//  FFBD.Last := edLastName.Text;
//  FFBD.Middle := edMiddleName.Text;
//  FFBD.Nick := edNickName.Text;
//
//  FFBD.Publisher := edPublisher.Text;
//  FFBD.City := edCity.Text;
//  FFBD.ISBN := edISBN.Text;
//  FFBD.Year := edYear.Text;
end;

procedure TfrmConvertToFBD.PrepareForm;
begin
//  DMCollection.GetCurrentBook(FBookRecord);
//
//  FCover.Picture := nil;
//
//  lblAuthor.Caption := FBookRecord.Authors[0].FLastName + ' ' +
//                       FBookRecord.Authors[0].FFirstName;
//
//  lblTitle.Caption := FBookRecord.Title;
//
//  FFolder := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder) + FBookRecord.Folder;
//
//  if FEditorMode then
//  begin
//    FBookFileName := FBookrecord.FileName ;
//    FZipFileName := FFolder + FBookrecord.FileName;
//    getfbdfilenames(FZipFileName,FFBDFilename);
//
//    LoadFBDFromFile(FZipFileName,FFBD,FCover, mmAnnotation);
//
//    edFirstName.Text := FFBD.First;
//    edLastName.Text := FFBD.Last;
//    edMiddleName.Text := FFBD.Middle;
//    edNickName.Text := FFBD.Nick;
//
//    edPublisher.Text := FFBD.Publisher;
//    edCity.Text := FFBD.City;
//    edISBN.Text := FFBD.ISBN;
//    edYear.Text := FFBD.Year;
//  end
//  else
//  begin
//    FBookFileName := FBookrecord.FileName + FBookrecord.FileExt;
//    FFBDFilename := FBookrecord.FileName + '.fbd';
//    FZipFileName := FFolder + FBookrecord.FileName + ZIP_EXTENSION;
//  end;
end;

procedure TfrmConvertToFBD.SaveFBD;
begin
//  EnableButtons(False);
//  FBusy := True;
//  Screen.Cursor := crHourGlass;
//  try
//    if MakeFBD then
//     if CreateZip(FZipFilename, FFolder, FBookFileName, FFBDFilename, FeditorMode)  then
//       if not FEditorMode then
//         ChangeBookData;
//  finally
//    EnableButtons(True);
//    Screen.Cursor := crDefault;
//    FBusy := False;
//  end;
end;

end.
