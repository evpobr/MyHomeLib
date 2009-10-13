
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}

unit frm_add_nonfb2;

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
  Dialogs,
  RzButton,
  ExtCtrls,
  RzPanel,
  VirtualTrees,
  RzCommon,
  RzSelDir,
  StdCtrls,
  ShellApi,
  Mask,
  RzEdit,
  RzBtnEdt,
  RzLstBox,
  ComCtrls,
  RzListVw,
  Menus,
  RzCmboBx,
  files_list,
  unit_database,
  unit_globals,
  unit_FBD_helpers,
  RzTabs, RzLabel;

type
  TfrmAddnonfb2 = class(TForm)
    dlgFolder: TRzSelDirDialog;
    pmEdit: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    flFiles: TFilesList;
    N5: TMenuItem;
    miClearAll: TMenuItem;
    pmMain: TPopupMenu;
    N6: TMenuItem;
    miOpenExplorer: TMenuItem;
    btnClose: TRzBitBtn;
    pcPages: TRzPageControl;
    tsBookInfo: TRzTabSheet;
    RzGroupBox9: TRzGroupBox;
    FCover: TImage;
    btnPasteCover: TRzBitBtn;
    btnLoad: TRzBitBtn;
    RzGroupBox10: TRzGroupBox;
    RzLabel4: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel5: TRzLabel;
    edISBN: TRzEdit;
    edPublisher: TRzEdit;
    edYear: TRzEdit;
    edCity: TRzEdit;
    RzGroupBox11: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    edFirstName: TRzEdit;
    edMiddleName: TRzEdit;
    edLastName: TRzEdit;
    edNickName: TRzEdit;
    mmAnnotation: TMemo;
    dtnConvert: TRzBitBtn;
    TabSheet3: TRzTabSheet;
    Tree: TVirtualStringTree;
    tsFiles: TRzTabSheet;
    RzGroupBox12: TRzGroupBox;
    edFileName: TEdit;
    btnCopyToFamily: TButton;
    btnCopyToName: TButton;
    btnCopyToTitle: TButton;
    btnCopyToSeries: TButton;
    btnFileOpen: TRzBitBtn;
    btnRenameFile: TRzBitBtn;
    btnAdd: TRzBitBtn;
    RzGroupBox5: TRzGroupBox;
    lblGenre: TLabel;
    btnShowGenres: TButton;
    RzGroupBox8: TRzGroupBox;
    cbLang: TRzComboBox;
    RzGroupBox7: TRzGroupBox;
    edKeyWords: TEdit;
    RzGroupBox1: TRzGroupBox;
    lvAuthors: TRzListView;
    btnDeleteAuthor: TRzBitBtn;
    btnChangeAuthor: TRzBitBtn;
    btnAddAuthor: TRzBitBtn;
    RzGroupBox4: TRzGroupBox;
    edSN: TRzNumericEdit;
    cbSeries: TRzComboBox;
    RzGroupBox2: TRzGroupBox;
    edT: TEdit;
    RzGroupBox3: TRzGroupBox;
    cbAutoSeries: TCheckBox;
    cbSelectFileName: TCheckBox;
    cbNoAuthorAllowed: TCheckBox;
    RzGroupBox6: TRzGroupBox;
    cbClearOptions: TRzComboBox;
    miOpenFile: TMenuItem;
    procedure RzButton3Click(Sender: TObject);
    procedure TreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure TreeDblClick(Sender: TObject);
    procedure TreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure btnAddClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TreePaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType);
    procedure btnShowGenresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddAuthorClick(Sender: TObject);
    procedure btnChangeAuthorClick(Sender: TObject);
    procedure btnDeleteAuthorClick(Sender: TObject);
    procedure btnCopyToTitleClick(Sender: TObject);
    procedure btnCopyToSeriesClick(Sender: TObject);
    procedure btnCopyToFamilyClick(Sender: TObject);
    procedure btnCopyToNameClick(Sender: TObject);
    procedure flFilesFile(Sender: TObject; const F: TSearchRec);
    procedure miClearAllClick(Sender: TObject);
    procedure miOpenExplorerClick(Sender: TObject);
    procedure miRenameFileClick(Sender: TObject);
    procedure flFilesDirectory(Sender: TObject; const Dir: string);
    procedure TreeCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure TreeClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnPasteCoverClick(Sender: TObject);
    procedure dtnConvertClick(Sender: TObject);
    procedure btnFileOpenClick(Sender: TObject);

  private
    FBookRecord: TBookRecord;
    FFBD: TFBDRecord;
    FFolder: string;
    
    procedure PrepareBookRecord;
    procedure CommitData;

    procedure ScanFolder;
    procedure FillLists;
    procedure SortTree;
    function MakeFBD:boolean;
  public

  private
    FLibrary: TMHLLibrary;
    FRootPath: string;
    FFBDFileName : string;
    function CheckEmptyFields(Data: PFileData): boolean;
  end;

var
  frmAddnonfb2: TfrmAddnonfb2;

implementation

uses dm_user,
  frm_main,
  frm_genre_tree,
  frm_edit_author,
  unit_TreeUtils,
  unit_Consts,
  unit_Settings;

{$R *.dfm}

procedure TfrmAddnonfb2.FillLists;
begin
  cbSeries.Items.Clear;
  FLibrary.GetSeries(cbSeries.Items);
end;

procedure TfrmAddnonfb2.btnShowGenresClick(Sender: TObject);
var
  Data: PGenreData;
  Node: PVirtualNode;
begin

  if frmGenreTree.ShowModal = mrOk then
  begin
    lblGenre.Caption := '';
    Node := frmGenreTree.tvGenresTree.GetFirstSelected;
    while Node <> nil do
    begin
      Data := frmGenreTree.tvGenresTree.GetNodeData(Node);
      lblGenre.Caption := lblGenre.Caption + Data.Text + ' ; ';
      Node := frmGenreTree.tvGenresTree.GetNextSelected(Node);
    end;
  end;
end;

procedure TfrmAddnonfb2.btnCopyToFamilyClick(Sender: TObject);
var
  Family: TListItem;
begin
  Family := lvAuthors.Items.Add;
  Family.Caption := trim(edFileName.SelText);
  lvAuthors.Selected := Family;
end;

procedure TfrmAddnonfb2.btnCopyToNameClick(Sender: TObject);
begin
  if lvAuthors.Selected <> nil then
    lvAuthors.Selected.SubItems.Add(trim(edFileName.SelText));
end;

procedure TfrmAddnonfb2.btnCopyToSeriesClick(Sender: TObject);
begin
  cbSeries.Text := trim(edFileName.SelText);
end;

procedure TfrmAddnonfb2.btnCopyToTitleClick(Sender: TObject);
begin
  edT.Text := trim(edFileName.SelText);
end;

procedure TfrmAddnonfb2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FLibrary.Active := False;
  FreeAndNil(FLibrary);
  frmMain.DisableControls(True);
  CanClose := true;
end;

procedure TfrmAddnonfb2.FormShow(Sender: TObject);
begin
  frmMain.FillGenresTree(frmGenreTree.tvGenresTree);
  miClearAllClick(Sender);
  lblGenre.Caption := '';

  FLibrary := TMHLLibrary.Create(Self);
  FLibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
  FLibrary.Active := True;

  ScanFolder;

  FillLists;
end;

function TfrmAddnonfb2.MakeFBD;
begin
  FFBD.First := edFirstName.Text;
  FFBD.Last := edLastName.Text;
  FFBD.Middle := edMiddleName.Text;
  FFBD.Nick := edNickName.Text;

  FFBD.Publisher := edPublisher.Text;
  FFBD.City := edCity.Text;
  FFBD.ISBN := edISBN.Text;
  FFBD.Year := edYear.Text;

  Result := PrepareFBDFile(FBookRecord, FFBD, mmAnnotation, FFolder +  FFBDFileName);
end;

procedure TfrmAddnonfb2.miClearAllClick(Sender: TObject);
begin
  edT.Text := '';
  edFileName.Text := '';
  lvAuthors.Items.Clear;
  cbSeries.Text := '';
  edSN.Value := 0;
  edKeyWords.Text := '';

  frmEditAuthor.edFamily.Text := '';
  frmEditAuthor.edName.Text := '';
  frmEditAuthor.edMiddle.Text := '';

  edPublisher.Clear;
  edCity.Clear;
  edISBN.Clear;
  edYear.Clear;

  mmAnnotation.Lines.Clear;
  FCover.Picture := nil;
end;

procedure TfrmAddnonfb2.miOpenExplorerClick(Sender: TObject);
var
  Data: PFileData;
begin
  Data := Tree.GetNodedata(Tree.GetFirstSelected);
  if (Data = nil) or (Data.DataType = dtFolder) then
    Exit;
  ShellExecute(Handle, 'explore', PChar(AnsiLowercase(ExtractFilePath(Data.FullPath))), '', nil, SW_SHOWNORMAL);
end;

function TfrmAddnonfb2.CheckEmptyFields(Data: PFileData):boolean;
begin
  Result := False;
  try
    if Data = nil then
      raise EInvalidOp.Create('Файл не выбран!');
    if (not cbNoAuthorAllowed.Checked) and (lvAuthors.Items.Count = 0) then
      raise EInvalidOp.Create('Укажите минимум одного автора!');
    if edT.Text = '' then
      raise EInvalidOp.Create('Укажите название книги!');
    if Data.DataType = dtFolder then
      Result := False
    else
      Result := True;
  finally
  end;
end;

procedure TfrmAddnonfb2.CommitData;
var
  Next: PvirtualNode;
begin
  FLibrary.InsertBook(FBookRecord, True, True);

  FBookRecord.Clear;
  FFBD.cover := '';


  Next := Tree.GetNext(Tree.GetFirstSelected);
  Tree.DeleteNode(Tree.GetFirstSelected, True);
  if Next <> nil then
    Tree.Selected[Next] := True;
  case cbClearOptions.ItemIndex of
    0: miClearAllClick(nil);
    1:
      begin
        lvAuthors.Items.Clear;
        frmEditAuthor.edFamily.Text := '';
        frmEditAuthor.edName.Text := '';
        frmEditAuthor.edMiddle.Text := '';

      end;
    2:
      begin
        edT.Text := '';
      end;
  end;
  FillLists;
  if cbAutoSeries.Checked then
    edSN.Value := edSN.Value + 1;
  TreeChange(Tree, Next);
end;

procedure TfrmAddnonfb2.dtnConvertClick(Sender: TObject);
var
  ZipFilename, BookFileName: string;

begin
  Screen.Cursor := crHourGlass;
  frmAddNonFB2.Enabled := False;
  try
    PrepareBookRecord;
    FFBDFilename := FBookrecord.FileName + FBD_EXTENSION;
    BookFileName := FBookrecord.FileName + FBookrecord.FileExt;
    FFolder := FRootPath + FBookrecord.Folder;
    ZipFilename := FFolder + FBookrecord.FileName + ZIP_EXTENSION;
        
    if MakeFBD then
      if CreateZip(ZipFilename, FFolder, BookFileName, FFBDFilename, False) then
      begin
        FBookrecord.FileName := FBookrecord.FileName + ZIP_EXTENSION;
        CommitData;
      end;
  finally
    frmAddNonFB2.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAddnonfb2.miRenameFileClick(Sender: TObject);
var
   NewName: string;
   Data: PFileData;
begin
  btnRenameFile.Enabled := False;
  try
    Data := Tree.GetNodeData(Tree.GetFirstSelected);
    if CheckEmptyFields(Data) then
    begin
      NewName := CheckSymbols(lvAuthors.Items[0].Caption + ' ' +  lvAuthors.Items[0].SubItems[0] +
             ' ' + edT.Text);
      if RenameFile(Data.FullPath + Data.FileName + Data.Ext, Data.FullPath + NewName + Data.Ext) then
      begin
        Data.FileName := NewName;
        edFileName.Text := NewName;
        Tree.RepaintNode(Tree.GetFirstSelected);
      end
      else MessageDlg('Переименование не удалось!' + #13 +
                    'Возможно, файл заблокирован другой программой.',
                    mtError,[mbOk],0);
    end;
  finally
    btnRenameFile.Enabled := True;
  end;
end;

procedure TfrmAddnonfb2.PrepareBookRecord;
var
  R: TBookRecord;
  Data: PFileData;
  I: Integer;
  strLastName: string;
  strFirstName: string;
  strMidName: string;
begin
  Data := Tree.GetNodeData(Tree.GetFirstSelected);
  if not CheckEmptyFields(Data) then Exit;

  if lvAuthors.Items.Count > 0 then
    for I := 0 to lvAuthors.Items.Count - 1 do
    begin
      strLastName:= lvAuthors.Items[i].Caption;
      if lvAuthors.Items[i].SubItems.Count > 0 then
        strFirstName:= lvAuthors.Items[i].SubItems[0];
      if lvAuthors.Items[i].SubItems.Count > 1 then
        strMidName:= lvAuthors.Items[i].SubItems[1];

      FBookRecord.AddAuthor(strLastName, strFirstName, strMidName);
    end
  else
  begin
    FBookRecord.AddAuthor('Неизвестный','автор', '');
  end;

  frmGenreTree.GetSelectedGenres(FBookRecord);
  FBookRecord.Title := edT.Text;
  FBookRecord.Series := cbSeries.Text;
  if Data.Folder <> '\' then
    FBookRecord.Folder := Data.Folder
  else
    FBookRecord.Folder := '';
  FBookRecord.FileName := Data.FileName;
  FBookRecord.FileExt := Data.Ext;
  FBookRecord.Code := 0;
  FBookRecord.InsideNo := 0;
  FBookRecord.SeqNumber := round(edSN.Value);
  FBookRecord.LibID := DMUser.ActiveCollection.ID;
  FBookRecord.Deleted := False;
  FBookRecord.Size := Data.Size;
  FBookRecord.Date := Now;
  FBookRecord.KeyWords := edKeyWords.Text;
  FBookRecord.Lang := cbLang.Text;

end;

procedure TfrmAddnonfb2.btnAddClick(Sender: TObject);
begin
  PrepareBookRecord;
  CommitData;
end;

procedure TfrmAddnonfb2.btnAddAuthorClick(Sender: TObject);
var
  Family: TListItem;

begin
  frmEditAuthor.edFamily.Text := '';
  frmEditAuthor.edName.Text := '';
  frmEditAuthor.edMiddle.Text := '';
  if frmEditAuthor.ShowModal = mrOk then
  begin
    Family := lvAuthors.Items.Add;
    Family.Caption := frmEditAuthor.edFamily.Text;
    Family.SubItems.Add(frmEditAuthor.edName.Text);
    Family.SubItems.Add(frmEditAuthor.edMiddle.Text);
  end;
end;

procedure TfrmAddnonfb2.btnChangeAuthorClick(Sender: TObject);
var
  Family: TListItem;
begin
  Family := lvAuthors.Selected;
  if Family = nil then
    Exit;
  frmEditAuthor.edFamily.Text := Family.Caption;
  if Family.SubItems.Count > 0 then
    frmEditAuthor.edName.Text := Family.SubItems[0];
  if Family.SubItems.Count > 1 then
    frmEditAuthor.edMiddle.Text := Family.SubItems[1];
  if frmEditAuthor.ShowModal = mrOk then
  begin
    Family.Caption := frmEditAuthor.edFamily.Text;
    if Family.SubItems.Count > 0 then
      Family.SubItems[0] := frmEditAuthor.edName.Text
    else
      Family.SubItems.Add(frmEditAuthor.edName.Text);
    if Family.SubItems.Count > 1 then
      Family.SubItems[1] := frmEditAuthor.edMiddle.Text
    else
      Family.SubItems.Add(frmEditAuthor.edMiddle.Text);
  end;
end;

procedure TfrmAddnonfb2.btnDeleteAuthorClick(Sender: TObject);
begin
  lvAuthors.DeleteSelected;
end;

procedure TfrmAddnonfb2.btnLoadClick(Sender: TObject);
begin
  LoadCoverFromFile(FCover, FFBD.cover, FFBD.ImageType);
end;

procedure TfrmAddnonfb2.btnPasteCoverClick(Sender: TObject);
begin
  CoverFromClpbrd(FCover, FFBD.Cover, FFBD.ImageType);
end;

procedure TfrmAddnonfb2.flFilesDirectory(Sender: TObject; const Dir: string);
var
  Data: PFileData;
  ParentNode: PVirtualNode;
  CurrentNode: PVirtualNode;
  ParentName: string;
  Path: string;

  procedure InsertNodeData(Node:PVirtualNode);
  begin
    Data := Tree.GetNodeData(Node);
    Data.Title :=  ExtractFileName(ExcludeTrailingPathdelimiter(Path));
    Data.Folder := Path;
    Data.DataType := dtFolder;
  end;

begin
  Path := ExtractRelativePath(FRootPath, Dir);
  if Path = '' then Exit;

  ParentName := ExtractFilePath(ExcludeTrailingPathdelimiter(Path));
  ParentNode := FindParentInTree(Tree,ParentName);
  if ParentNode <> nil then
  begin
    CurrentNode := Tree.AddChild(ParentNode);
    InsertNodeData(CurrentNode);
  end
  else
    if (FindParentInTree(Tree,Path) = nil) then
    begin
      CurrentNode := Tree.AddChild(Nil);
      InsertNodeData(CurrentNode);
    end;
end;

procedure TfrmAddnonfb2.flFilesFile(Sender: TObject; const F: TSearchRec);
var
  FullName: string;
  FileName: string;
  Data: PFileData;
  Path: String;
  ParentNode: PVirtualNode;
  CurrentNode: PVirtualNode;
  Ext: string;
begin
  if (F.Name = '.') or (F.Name = '..') then Exit;

  Ext := ExtractFileExt(F.Name);
  if Ext = '' then Exit;

 //
 // Пропустим fb2-документы и зипы
 //
 if (CompareText(Ext, FB2_EXTENSION) = 0) or (CompareText(Ext, ZIP_EXTENSION) = 0) then
      Exit;

  //
  // Проверим, есть ли у нас ридер для этого документа
  //

  if Settings.Readers.Find(Ext) = nil then
    Exit;

  if FLibrary.CheckFileInCollection(F.Name, False, True) then
    Exit;

  FullName := ExtractRelativePath(FRootPath, flFiles.LastDir + F.Name);
  FileName := ExtractShortFileName(F.Name);
  Path := ExtractRelativePath(FRootPath, flFiles.LastDir);

  ParentNode := FindParentInTree(Tree,Path);

  CurrentNode := Tree.AddChild(ParentNode);

  Data := Tree.GetNodeData(CurrentNode);
  Data.DataType := dtFile;
  Data.FileName := FileName;
  Data.Size := F.Size;
  Data.FullPath := flFiles.LastDir;
  Data.Folder := Path;
  Data.Ext := Ext;
  Data.Date := F.Time;
end;

procedure TfrmAddnonfb2.ScanFolder;
begin
  Tree.Clear;
  Tree.NodeDataSize := sizeof(TFileData);

  FRootPath := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  flFiles.TargetPath := DMUser.ActiveCollection.RootFolder;
  flFiles.Process;
  SortTree;
end;

procedure TfrmAddnonfb2.SortTree;
var
  A,B: PVirtualNode;
  Data,DataA,DataB: PFileData;
  Parent: PVirtualNode;
begin
  Parent := Tree.GetFirst;
  Data := Tree.GetNodeData(Parent);
  while Parent <> nil do
  begin
    if (Data.DataType = dtFolder) and
       (Tree.HasChildren[Parent]) then
    begin
      A := Tree.GetFirstChild(Parent);
      while (A <> Parent.LastChild) do
      begin
        DataA := Tree.GetNodeData(A);
        B := Tree.GetNext(A);
        DataB := Tree.GetNodeData(B);
        if (A.Parent = B.Parent) and
           (DataA.DataType = dtFile) and
           (DataB.DataType = dtFolder) then
        begin
          Tree.MoveTo(B, A, amInsertBefore, false);
          A := Parent.FirstChild;
        end
        else
          A := B;
        B := Tree.GetNext(B);
      end;
    end;

    if (Data.DataType = dtFolder) and (Parent.ChildCount = 0) then
                  Tree.DeleteNode(Parent, True);

    Parent := Tree.GetNext(Parent);
    Data := Tree.GetNodeData(Parent);
  end;
end;

procedure TfrmAddnonfb2.btnFileOpenClick(Sender: TObject);
var
  Data: PFileData;
  S: string;
begin
  Data := Tree.GetNodedata(Tree.GetFirstSelected);
  if Data <> nil then
  begin
    S := AnsiLowercase(Data.FullPath + Data.FileName + Data.Ext);
    ShellExecute(Handle, 'open', PChar(s), '', nil, SW_SHOWNORMAL);
  end;
end;

procedure TfrmAddnonfb2.RzButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddnonfb2.TreeChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);

begin
  TreeClick(Sender);
end;

procedure TfrmAddnonfb2.TreeClick(Sender: TObject);
var
  Data: PFiledata;
begin
  Data := Tree.GetNodeData(Tree.GetFirstSelected);
  if (Data = nil) or (Data.DataType = dtFolder) then
    Exit;
  edFileName.Text := Data.FileName;
  if cbSelectFileName.Checked then
    edFileName.SelectAll;

end;

procedure TfrmAddnonfb2.TreeCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PFileData;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);
//  Result := CompareInt(Data1.DataType, Data1.DataType);
end;

procedure TfrmAddnonfb2.TreeDblClick(Sender: TObject);
//var
//  Data: PFileData;
//  S: string;
begin
//  Data := Tree.GetNodedata(Tree.GetFirstSelected);
//  if Data <> nil then
//  begin
//    S := AnsiLowercase(Data.FullPath + Data.FileName + Data.Ext);
//    ShellExecute(Handle, 'open', PChar(s), '', nil, SW_SHOWNORMAL);
//  end;
  pcPages.ActivePageIndex := 1;
end;

procedure TfrmAddnonfb2.TreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: String);
var
  Data: PFileData;
begin
  Data := Sender.GetNodeData(Node);
  case Data.DataType of
    dtFolder: if Column = 0 then CellText := Data.Title
                else  CellText := '';
    dtFile:  case Column of
               0: CellText := Data.FileName;
               1: CellText := CleanExtension(Data.Ext);
               2: CellText := IntToStr(Data.Size);
               3: CellText := '';
             end;
  end;
end;

procedure TfrmAddnonfb2.TreePaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
var
  Data: PFileData;
begin
  Data := Tree.GetNodeData(Node);
  if Data.DataType = dtFolder then
    TargetCanvas.Font.Style := [fsBold]
end;

end.

