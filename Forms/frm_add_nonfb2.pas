
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
  unit_globals;

type
  TfrmAddnonfb2 = class(TForm)
    RzPanel2: TRzPanel;
    dlgFolder: TRzSelDirDialog;
    Tree: TVirtualStringTree;
    RzPanel3: TRzPanel;
    RzPanel1: TRzPanel;
    btnCopyToSeries: TButton;
    btnCopyToTitle: TButton;
    btnCopyToName: TButton;
    btnCopyToFamily: TButton;
    edFileName: TEdit;
    RzGroupBox1: TRzGroupBox;
    lvAuthors: TRzListView;
    btnDeleteAuthor: TRzBitBtn;
    btnChangeAuthor: TRzBitBtn;
    btnAddAuthor: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    edT: TEdit;
    RzGroupBox3: TRzGroupBox;
    btnAdd: TRzBitBtn;
    cbAutoSeries: TCheckBox;
    RzGroupBox4: TRzGroupBox;
    edSN: TRzNumericEdit;
    RzGroupBox5: TRzGroupBox;
    lblGenre: TLabel;
    btnShowGenres: TButton;
    pmEdit: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    cbSeries: TRzComboBox;
    flFiles: TFilesList;
    N5: TMenuItem;
    miClearAll: TMenuItem;
    RzGroupBox6: TRzGroupBox;
    cbClearOptions: TRzComboBox;
    cbSelectFileName: TCheckBox;
    pmMain: TPopupMenu;
    MenuItem6: TMenuItem;
    N6: TMenuItem;
    miOpenExplorer: TMenuItem;
    miAdd: TMenuItem;
    N7: TMenuItem;
    miRenameFile: TMenuItem;
    RzBitBtn1: TRzBitBtn;
    cbNoAuthorAllowed: TCheckBox;
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
    procedure FormResize(Sender: TObject);

  private
    procedure ScanFolder;
    procedure FillLists;

  public

  private
    FLibrary: TMHLLibrary;
    FRootPath: string;
    FFiles: TStringList;
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

  FreeAndNil(FFiles);

  frmMain.DisableControls(True);
  frmMain.DisableMainMenu(True);
  CanClose := true;
end;

procedure TfrmAddnonfb2.FormResize(Sender: TObject);
begin
  Tree.Header.Columns[0].Width := Width - 30;
end;

procedure TfrmAddnonfb2.FormShow(Sender: TObject);
begin
  frmMain.FillGenresTree(frmGenreTree.tvGenresTree);

  FFiles := TStringList.Create;

  FLibrary := TMHLLibrary.Create(Self);
  FLibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
  FLibrary.Active := True;

  ScanFolder;

  FillLists;
end;

procedure TfrmAddnonfb2.miClearAllClick(Sender: TObject);
begin
  edT.Text := '';
  lvAuthors.Items.Clear;
  cbSeries.Text := '';
  edSN.Value := 0;
  frmEditAuthor.edFamily.Text := '';
  frmEditAuthor.edName.Text := '';
  frmEditAuthor.edMiddle.Text := '';
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

procedure TfrmAddnonfb2.miRenameFileClick(Sender: TObject);
var
   NewName: string;
   NewPath: String;
   Data: PFileData;
begin
  Data := Tree.GetNodeData(Tree.GetFirstSelected);
  if CheckEmptyFields(Data) then
  begin
    NewName := lvAuthors.Items[0].Caption + ' ' +  lvAuthors.Items[0].SubItems[0] +
             ' ' + edT.Text;
    NewPath := Data.FullPath;
    StrReplace(Data.FileName,NewName,NewPath);
    if RenameFile(FRootPath + Data.FullPath,FRootPath + NewPath) then
    begin
      Data.FileName := NewName;
      Data.FullPath := NewPath;
      edFileName.Text := NewName;
      Tree.RepaintNode(Tree.GetFirstSelected);
    end
    else MessageDlg('Переименование не удалось!' + #13 +
                    'Возможно, файл заблокирован другой программой.',
                    mtError,[mbOk],0);
  end;
end;

procedure TfrmAddnonfb2.btnAddClick(Sender: TObject);
var
  R: TBookRecord;
  Data: PFileData;
  Next: PvirtualNode;
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

      R.AddAuthor(strLastName, strFirstName, strMidName);
    end
  else
  begin
    R.AddAuthor('Неизвестный','автор', '');
  end;

  frmGenreTree.GetSelectedGenres(R);
  R.Title := edT.Text;
  R.Series := cbSeries.Text;
  if Data.Folder <> '\' then
    R.Folder := Data.Folder
  else
    R.Folder := '';
  R.FileName := Data.FileName;
  R.FileExt := Data.Ext;
  R.Code := 0;
  R.InsideNo := 0;
  R.SeqNumber := round(edSN.Value);
  R.LibID := DMUser.ActiveCollection.ID;
  R.Deleted := False;
  R.Size := Data.Size;
  R.Date := Now;
  FLibrary.InsertBook(R);

  Next := Tree.GetNext(Tree.GetFirstSelected);
  Tree.DeleteNode(Tree.GetFirstSelected, True);
  if Next <> nil then
    Tree.Selected[Next] := True;
  case cbClearOptions.ItemIndex of
    0: miClearAllClick(Sender);
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

procedure TfrmAddnonfb2.flFilesFile(Sender: TObject; const F: TSearchRec);
var
  FullName: string;
begin
  FullName := ExtractRelativePath(FRootPath, flFiles.LastDir + F.Name);
  FFiles.Add(IntToStr(F.Size) + ' ' + FullName);
end;

procedure TfrmAddnonfb2.ScanFolder;
var
  i: integer;
  p: integer;
  Data: PFileData;
  A, B: PVirtualNode;
  FN, Ext: string;
  SS: string;
  FullName, LastFolder, Folder: string;
  ParentName: string;
begin
  Tree.Clear;
  Tree.NodeDataSize := sizeof(TFileData);

  FRootPath := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  flFiles.TargetPath := DMUser.ActiveCollection.RootFolder;
  flFiles.Process;

  LastFolder := '';
  for I := 0 to FFiles.Count - 1 do
  begin
    p := Pos(' ', FFiles[i]);
    Assert(p <> 0);
    FullName := FFiles[i];
    if p <> 0 then
    begin
      SS := Copy(FullName, 1, p - 1);
      Delete(FullName, 1, p);
    end;

    Ext := ExtractFileExt(FullName);

    //
    // Пропустим fb2-документы
    //
    if AnsiCompareText(Ext, FB2_EXTENSION) = 0 then
      Continue;

    //
    // Проверим, есть ли у нас ридер для этого документа
    //
    if Settings.Readers.Find(Ext) = nil then
      Continue;

    Folder := ExtractFilePath(FullName);
    ParentName := ExtractFilePath(ExcludeTrailingPathdelimiter(Folder));
    if FLibrary.CheckFileInCollection(FullName, Ext) then
      Continue;

    if Folder <> LastFolder then
    begin
      A := FindParentInTree(Tree,ParentName);
      A := Tree.AddChild(A);
      Data := Tree.GetNodeData(A);
      Data.Title :=  ExtractFileName(ExcludeTrailingPathdelimiter(Folder));
      Data.Folder := Folder;
      Data.DataType := dtFolder;
      LastFolder := Folder;
    end;

    FN := ExtractFileName(FullName);
    FN := Copy(FN, 1, Length(FN) - Length(Ext));

    B := Tree.AddChild(A);
    Data := Tree.GetNodeData(B);
    Data.DataType := dtFile;
    Data.FileName := FN;
    Data.Size := StrToInt(SS);
    Data.FullPath := FullName;
    Data.Folder := Folder;
    Data.Ext := Ext;
  end;
end;

procedure TfrmAddnonfb2.RzButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddnonfb2.TreeChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
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

procedure TfrmAddnonfb2.TreeDblClick(Sender: TObject);
var
  Data: PFileData;
  S: string;
begin
  Data := Tree.GetNodedata(Tree.GetFirstSelected);
  if Data <> nil then
  begin
    S := FRootPath+AnsiLowercase(Data.FullPath);
    ShellExecute(Handle, 'open', PChar(s), '', nil, SW_SHOWNORMAL);
  end;
end;

procedure TfrmAddnonfb2.TreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: String);
var
  Data: PFileData;
begin
  Data := Sender.GetNodeData(Node);
  case Data.DataType of
    dtFolder: CellText := Data.Title;
    dtFile: CellText := Data.FileName + Data.Ext;
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

