
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}

unit frm_settings;

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
  StdCtrls,
  RzCmboBx,
  RzShellCtrls,
  Mask,
  RzEdit,
  RzBtnEdt,
  RzButton,
  RzShellDialogs,
  RzTabs,
  ExtCtrls,
  RzPanel,
  RzRadGrp,
  ComCtrls,
  RzTreeVw,
  RzSpnEdt,
  RzCommon,
  RzLabel,
  RzListVw,
  unit_Readers,
  unit_Scripts, RzSelDir;

type
  TfrmSettings = class(TForm)
    RzPanel1: TRzPanel;
    btnSave: TRzBitBtn;
    btnCancel: TRzBitBtn;
    pcSetPages: TPageControl;
    tsDevices: TTabSheet;
    tsReaders: TTabSheet;
    tsInterface: TTabSheet;
    dlgColors: TColorDialog;
    tsInternet: TTabSheet;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    edProxyServer: TRzEdit;
    edProxyUsername: TRzEdit;
    edProxyPassword: TRzMaskEdit;
    edProxyPort: TRzNumericEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edLibUserName: TRzEdit;
    RzLabel6: TRzLabel;
    RzGroupBox3: TRzGroupBox;
    edFolderTemplate: TRzEdit;
    edFileNameTemplate: TRzEdit;
    Label5: TLabel;
    Label6: TLabel;
    cbTranslit: TCheckBox;
    RzGroupBox4: TRzGroupBox;
    edDeviceDir: TRzButtonEdit;
    RzGroupBox8: TRzGroupBox;
    lvReaders: TRzListView;
    btnDeleteExt: TRzBitBtn;
    btnChangeExt: TRzBitBtn;
    btnAddExt: TRzBitBtn;
    RzGroupBox6: TRzGroupBox;
    pnlASG: TRzPanel;
    pnlCT: TRzPanel;
    pnlBS: TRzPanel;
    pnlCS: TRzPanel;
    pnlCA: TRzPanel;
    seShortFontSize: TRzSpinEdit;
    Label9: TLabel;
    Label7: TLabel;
    seFontSize: TRzSpinEdit;
    Button1: TButton;
    RzGroupBox9: TRzGroupBox;
    edUpdates: TEdit;
    cbCheckColUpdate: TCheckBox;
    cbUpdates: TCheckBox;
    cbPromptPath: TCheckBox;
    RzPanel2: TRzPanel;
    tvSections: TRzTreeView;
    tsScripts: TTabSheet;
    RzGroupBox523324: TRzGroupBox;
    lvScripts: TRzListView;
    btnDeleteScript: TRzBitBtn;
    btnEditScript: TRzBitBtn;
    btnAddScript: TRzBitBtn;
    RzGroupBox5343245: TRzGroupBox;
    cbDefaultAction: TComboBox;
    btnHelp: TRzBitBtn;
    rgDeviceFormat: TRadioGroup;
    RzGroupBox5: TRzGroupBox;
    cbSquareFilter: TCheckBox;
    tbtnInsert1: TRzToolButton;
    tbtnInsert2: TRzToolButton;
    tbtnInsert3: TRzToolButton;
    tbtnInsert4: TRzToolButton;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzGroupBox11: TRzGroupBox;
    edReadDir: TRzButtonEdit;
    dlgSelectDir: TRzSelDirDialog;
    tsBehavour: TTabSheet;
    RzGroupBox7: TRzGroupBox;
    cbShowSubGenreBooks: TCheckBox;
    cbMinimizeToTray: TCheckBox;
    cbAutoStartDwnld: TCheckBox;
    cbShowFb2Info: TCheckBox;
    cbAllowMixedCollections: TCheckBox;
    pnlDwnld: TRzPanel;
    pnlDeleted: TRzPanel;
    RzPanel5: TRzPanel;
    RzGroupBox10: TRzGroupBox;
    edTimeOut: TRzNumericEdit;
    RzLabel7: TRzLabel;
    edReadTimeOut: TRzNumericEdit;
    RzLabel8: TRzLabel;
    cbUseIESettings: TCheckBox;
    edDwnldInterval: TRzNumericEdit;
    RzLabel9: TRzLabel;
    cbAutoRunUpdate: TCheckBox;
    cbDeleteDeleted: TCheckBox;
    cbTXTEncoding: TRzComboBox;
    Label1: TLabel;
    RzLabel5: TRzLabel;
    cbAutoLoadReview: TCheckBox;
    edDownloadServer: TRzComboBox;
    tsFileSort: TTabSheet;
    RzGroupBox12: TRzGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    RzToolButton4: TRzToolButton;
    RzToolButton5: TRzToolButton;
    RzToolButton6: TRzToolButton;
    RzToolButton7: TRzToolButton;
    RzToolButton8: TRzToolButton;
    RzToolButton9: TRzToolButton;
    RzToolButton10: TRzToolButton;
    edFBDFolderTemplate: TRzEdit;
    edFBDFileTemplate: TRzEdit;
    RzGroupBox13: TRzGroupBox;
    Label4: TLabel;
    Label8: TLabel;
    RzToolButton11: TRzToolButton;
    RzToolButton12: TRzToolButton;
    RzToolButton13: TRzToolButton;
    RzToolButton14: TRzToolButton;
    RzToolButton15: TRzToolButton;
    RzToolButton16: TRzToolButton;
    RzToolButton17: TRzToolButton;
    edFB2FolderTemplate: TRzEdit;
    edFB2FileTemplate: TRzEdit;
    RzGroupBox14: TRzGroupBox;
    cbEnableFileSort: TCheckBox;
    RzGroupBox15: TRzGroupBox;
    edInputFolder: TRzButtonEdit;
    edLibPassword: TRzMaskEdit;
    cbOverwriteFB2Info: TCheckBox;
    cbDeleteFiles: TCheckBox;
    RzToolButton18: TRzToolButton;
    procedure edDeviceDirButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure tvSectionsChange(Sender: TObject; Node: TTreeNode);
    procedure pnlCAClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure btnAddExtClick(Sender: TObject);
    procedure btnChangeExtClick(Sender: TObject);
    procedure btnDeleteExtClick(Sender: TObject);

    procedure btnAddScriptClick(Sender: TObject);
    procedure btnEditScriptClick(Sender: TObject);
    procedure btnDeleteScriptClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure tbtnInsert1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlDwnldClick(Sender: TObject);
    procedure cbUseIESettingsClick(Sender: TObject);

  private
    procedure EditReader(AItem: TListItem);
    procedure EditScript(AItem: TListItem);

    procedure SaveReaders;
    procedure SaveScripts;

  public
    procedure LoadSetting;
    procedure SaveSettings;
  end;

var
  frmSettings: TfrmSettings;

implementation

uses
  StrUtils,
  unit_globals,
  frm_edit_reader,
  frm_main,
  frm_edit_script,
  unit_Settings,
  htmlhlp;

{$R *.dfm}

procedure TfrmSettings.edDeviceDirButtonClick(Sender: TObject);
begin
//  dlgFolder.SelectedFolder.PathName := (Sender as TRzButtonEdit).Text;
//  if dlgFolder.Execute then
//    (Sender as TRzButtonEdit).Text := dlgFolder.SelectedPathName;
  dlgSelectDir.Directory := (Sender as TRzButtonEdit).Text;
  if dlgSelectDir.Execute then
     (Sender as TRzButtonEdit).Text := dlgSelectDir.Directory;
end;

procedure TfrmSettings.LoadSetting;
var
  i: integer;
begin
  // Page 1 - Device settings
  edDeviceDir.Text := Settings.DevicePath;

  if Settings.ReadPath <> Settings.TempPath then
    edReadDir.Text := Settings.ReadPath
  else
    edReadDir.Text := '';

  cbPromptPath.Checked := Settings.PromptDevicePath;

  rgDeviceFormat.ItemIndex := ord(Settings.ExportMode);

  cbTXTEncoding.ItemIndex := Ord(Settings.TXTEncoding);

  edFolderTemplate.Text := Settings.FolderTemplate;
  edFileNameTemplate.Text := Settings.FileNameTemplate;
  cbTranslit.Checked := Settings.TransliterateFileName;
  cbSquareFilter.Checked := Settings.RemoveSquarebrackets;

  // Page 2 - Readers
  lvReaders.Items.Clear;
  for i := 0 to Settings.Readers.Count - 1 do
  begin
    with lvReaders.Items.Add do
    begin
      Caption := Settings.Readers[i].Extension;
      SubItems.Add(Settings.Readers[i].Path);
    end;
  end;


  seFontSize.Value := Settings.TreeFontSize;
  seShortFontSize.Value := Settings.ShortFontSize;

  pnlCT.Color := Settings.BookColor;
  pnlCS.Color := Settings.SeriesColor;
  pnlCA.Color := Settings.AuthorColor;
  pnlBS.Color := Settings.SeriesBookColor;
  pnlASG.Color := Settings.BGColor;
  pnlASG.Font.Color := Settings.FontColor;
  pnlCS.Font.Color := Settings.FontColor;
  pnlCT.Font.Color := Settings.FontColor;
  pnlBS.Font.Color := Settings.FontColor;
  pnlASG.Font.Color := Settings.FontColor;

  pnlDwnld.Font.Color := Settings.LocalColor ;
  pnlDeleted.Font.Color := Settings.DeletedColor;

  // Page 4 - Internet
  edProxyServer.Text := Settings.ProxyServer;
  edProxyUsername.Text := Settings.ProxyUsername;
  edProxyPassword.Text := Settings.ProxyPassword;
  edProxyPort.Value := Settings.ProxyPort;
  edDownloadServer.Text := Settings.DownloadURL;

  edUpdates.Text := Settings.UpdateURL;
  cbCheckColUpdate.Checked := Settings.CheckExternalLibUpdate;
  cbUpdates.Checked := Settings.CheckUpdate;

  edTimeOut.Value := Settings.TimeOut;
  edReadTimeOut.Value := Settings.ReadTimeOut;
  edDwnldInterval.Value := Settings.DwnldInterval;

  cbUseIESettings.Checked := Settings.UseIESettings;
  cbAutoRunUpdate.Checked := Settings.AutoRunUpdate;

  edLibUsername.Text :=  Settings.LibUsername;
  edLibPassword.Text :=  Settings.LibPassword;


  // Page 5 - Scripts
  lvScripts.Items.Clear;
  cbDefaultAction.Items.Clear;
  cbDefaultAction.Items.Add('Стандартное');

  for i := 0 to Settings.Scripts.Count - 1 do
  begin
    with lvScripts.Items.Add do
    begin
      Caption := Settings.Scripts[i].Title;
      SubItems.Add(Settings.Scripts[i].Path);
      SubItems.Add(Settings.Scripts[i].Params);
    end;

    cbDefaultAction.Items.Add(Settings.Scripts[i].Title);
  end;
  cbDefaultAction.ItemIndex := Settings.DefaultScript;

  // Page 6 - Behavior

  cbShowFb2Info.Checked           := Settings.ShowFb2Info;
  cbShowSubGenreBooks.Checked     := Settings.ShowSubGenreBooks;
  cbMinimizeToTray.Checked        := Settings.MinimizeToTray;
  cbAutoStartDwnld.Checked        := Settings.AutoStartDwnld;
  cbAllowMixedCollections.Checked := Settings.AllowMixed;
  cbDeleteDeleted.Checked         := Settings.DeleteDeleted;
  cbAutoLoadReview.Checked        := Settings.AutoLoadReview;
  cbOverwriteFB2Info.Checked      := Settings.OverwriteFB2Info;
  cbDeleteFiles.Checked           := Settings.DeleteFiles;

  // Page 6 -  FileSort

  cbEnableFileSort.Checked := Settings.EnableSort;
  edInputFolder.Text       := Settings.InputFolder;
  edFB2Foldertemplate.Text := Settings.FB2FolderTemplate;
  edFB2FileTemplate.Text   := Settings.FB2FileTemplate;
  edFBDFolderTemplate.Text := Settings.FBDFolderTemplate;
  edFBDFileTemplate.Text   := Settings.FBDFileTemplate;

  tvSections.Select(tvSections.Items[0]);

  cbUseIESettingsClick(Nil);
end;

procedure TfrmSettings.SaveSettings;
begin
  // Page 1 - Device settings
  Settings.DeviceDir := edDeviceDir.Text;
  Settings.ReadDir := edReadDir.Text;

  Settings.PromptDevicePath := cbPromptPath.Checked;
  case rgDeviceFormat.ItemIndex of
    0: Settings.ExportMode := emFB2;
    1: Settings.ExportMode := emFB2zip;
    2: Settings.ExportMode := emLrf;
    3: Settings.ExportMode := emTxt;
    4: Settings.ExportMode := emEpub;
    5: Settings.ExportMode := emPDF;
  end;

  case cbTXTEncoding.ItemIndex of
      0: Settings.TXTEncoding := enUTF8;
      1: Settings.TXTEncoding := en1251;
      2: Settings.TXTEncoding := enUnicode;
  end;

  Settings.FolderTemplate := edFolderTemplate.Text;
  Settings.FileNameTemplate := edFileNameTemplate.Text;
  Settings.TransliterateFileName := cbTranslit.Checked;
  Settings.RemoveSquarebrackets := cbSquareFilter.Checked;
  Settings.AutoStartDwnld := cbAutoStartDwnld.Checked;

  // Page 2 - Readers
  SaveReaders;

  // Page 3 - Interface

  Settings.TreeFontSize    := Trunc(seFontSize.Value);
  Settings.ShortFontSize   := Trunc(seShortFontSize.Value);
  Settings.BookColor       := pnlCT.Color;
  Settings.SeriesColor     := pnlCS.Color;
  Settings.AuthorColor     := pnlCA.Color;
  Settings.SeriesBookColor := pnlBS.Color;
  Settings.BGColor         := pnlASG.Color;
  Settings.FontColor       := pnlASG.Font.Color;

  Settings.LocalColor      := pnlDwnld.Font.Color;
  Settings.DeletedColor    := pnlDeleted.Font.Color;

  // Page 4 - Internet
  Settings.ProxyServer            := edProxyServer.Text;
  Settings.ProxyUsername          := edProxyUsername.Text;
  Settings.ProxyPassword          := edProxyPassword.Text;
  Settings.ProxyPort              := Round(edProxyPort.Value);
  Settings.UpdateURL              := edUpdates.Text;
  Settings.CheckExternalLibUpdate := cbCheckColUpdate.Checked;
  Settings.CheckUpdate            := cbUpdates.Checked;
  Settings.DownloadURL            := edDownloadServer.Text;
  Settings.TimeOut                := Round(edTimeOut.Value);
  Settings.ReadTimeOut            := Round(edReadTimeOut.Value);
  Settings.DwnldInterval          := Round(edDwnldInterval.Value);
  Settings.UseIESettings          := cbUseIESettings.Checked;
  Settings.AutoRunUpdate          := cbAutoRunUpdate.Checked;
  Settings.LibUsername            := edLibUsername.Text;
  Settings.LibPassword            := edLibPassword.Text;

  // Page 5 - Scripts
  SaveScripts;
  Settings.DefaultScript := cbDefaultAction.ItemIndex;

  // Page 6 - Behavior

  Settings.ShowSubGenreBooks := cbShowSubGenreBooks.Checked;
  Settings.MinimizeToTray    := cbMinimizeToTray.Checked;
  Settings.ShowFb2Info       := cbShowFb2Info.Checked;
  Settings.AutoStartDwnld    := cbAutoStartDwnld .Checked;
  Settings.AllowMixed        := cbAllowMixedCollections.Checked;
  Settings.DeleteDeleted     := cbDeleteDeleted.Checked;
  Settings.AutoLoadReview    := cbAutoLoadReview.Checked;
  Settings.OverwriteFB2Info  := cbOverwriteFB2Info.Checked;
  Settings.DeleteFiles       := cbDeleteFiles.Checked;

  // Page 6 -  FileSort

  Settings.EnableSort        := cbEnableFileSort.Checked;
  Settings.InputFolder       := IncludeTrailingPathDelimiter(edInputFolder.Text);
  Settings.FB2FolderTemplate := edFB2Foldertemplate.Text;
  Settings.FB2FileTemplate   := edFB2FileTemplate.Text;
  Settings.FBDFolderTemplate := edFBDFolderTemplate.Text;
  Settings.FBDFileTemplate   := edFBDFileTemplate.Text;

end;

procedure TfrmSettings.SaveReaders;
var
  i: integer;
  Readers: TReaders;
begin
  Readers := Settings.Readers;
  Readers.Clear;
  for i := 0 to lvReaders.Items.Count - 1 do
  begin
    Readers.Add(lvReaders.Items[i].Caption, lvReaders.Items[i].SubItems[0]);
  end;
end;

procedure TfrmSettings.SaveScripts;
var
  i: integer;
  Scripts: TScripts;
begin
  Scripts := Settings.Scripts;
  Scripts.Clear;
  for i := 0 to lvScripts.Items.Count - 1 do
  begin
    Scripts.Add(lvScripts.Items[i].Caption, lvScripts.Items[i].SubItems[0], lvScripts.Items[i].SubItems[1]);
  end;
end;

procedure TfrmSettings.btnHelpClick(Sender: TObject);
begin
  HtmlHelp(Application.Handle,
           PChar(Settings.SystemFileName[sfAppHelp]),
           HH_HELP_CONTEXT, pcSetPages.ActivePage.HelpContext);
end;

procedure TfrmSettings.btnSaveClick(Sender: TObject);
begin
  SaveSettings;

  Close;
end;

// ============================================================================
//
// Настройка читалок
//

procedure TfrmSettings.EditReader(AItem: TListItem);
var
  frmEditReader: TfrmEditReader;
begin
  frmEditReader := TfrmEditReader.Create(Self);
  try
    frmEditReader.Caption := IfThen(Assigned(AItem), 'Изменение типа файлов', 'Добавление типа файлов');
    if Assigned(AItem) then
    begin
      frmEditReader.Extension := AItem.Caption;
      frmEditReader.Path := AItem.SubItems[0];
    end;

    if frmEditReader.ShowModal = mrOk then
    begin
      if Assigned(AItem) and (AnsiCompareText(AItem.Caption, frmEditReader.Extension) = 0) then
      begin
        // Расширение не поменялось -> обновим путь
        AItem.SubItems[0] := frmEditReader.Path;
        Exit;
      end;

      if lvReaders.FindCaption(0, frmEditReader.Extension, False, True, False) <> nil then
      begin
        // Это расширение уже зарегистрировано
        MessageDlg('Тип "' + frmEditReader.edExt.Text + '" уже есть в списке!', mtError, [mbOk], 0);
      end;

      if Assigned(AItem) then
        AItem.SubItems[0] := frmEditReader.Path
      else
      begin
        AItem := lvReaders.Items.Add;
        AItem.SubItems.Add(frmEditReader.Path);
      end;

      AItem.Caption := frmEditReader.Extension;
    end;
  finally
    frmEditReader.Free;
  end;
end;

procedure TfrmSettings.btnAddExtClick(Sender: TObject);
begin
  EditReader(nil);
end;

procedure TfrmSettings.btnChangeExtClick(Sender: TObject);
var
  AItem: TListItem;
begin
  AItem := lvReaders.Selected;
  if not Assigned(AItem) then
    Exit;
  EditReader(AItem);
end;

procedure TfrmSettings.btnDeleteExtClick(Sender: TObject);
begin
  lvReaders.DeleteSelected;
end;

// ============================================================================
//
// Настройка скриптов
//

procedure TfrmSettings.EditScript(AItem: TListItem);
var
  frmEditScript: TfrmEditScript;
begin
  frmEditScript := TfrmEditScript.Create(Self);
  try
    frmEditReader.Caption := IfThen(Assigned(AItem), 'Изменение параметров скрипта', 'Добавление скрипта');
    if Assigned(AItem) then
    begin
      frmEditScript.Title := AItem.Caption;
      frmEditScript.Path := AItem.SubItems[0];
      frmEditScript.Params := AItem.SubItems[1];
    end;
    
    if frmEditScript.ShowModal = mrOk then
    begin
      if Assigned(AItem) then
      begin
        cbDefaultAction.Items[AItem.Index + 1] := frmEditScript.Title;
        { TODO -oNickR -cpossible bug : Странно, после редактирования скрипт становится скриптом по-умолчанию }
//        cbDefaultAction.ItemIndex := AItem.Index + 1;
      end
      else
        cbDefaultAction.Items.Add(frmEditScript.Title);

      if Assigned(AItem) then
      begin
        AItem.SubItems[0] := frmEditScript.Path;
        AItem.SubItems[1] := frmEditScript.Params;
      end
      else
      begin
        AItem := lvScripts.Items.Add;
        AItem.SubItems.Add(frmEditScript.Path);
        AItem.SubItems.Add(frmEditScript.Params);
      end;

      AItem.Caption := frmEditScript.Title;
    end;

  finally
    frmEditScript.Free;
  end;
end;

procedure TfrmSettings.FormShow(Sender: TObject);
begin
  tvSections.Select(tvSections.Items[0],[ssLeft]);
end;

procedure TfrmSettings.btnAddScriptClick(Sender: TObject);
begin
  EditScript(nil);
end;

procedure TfrmSettings.btnEditScriptClick(Sender: TObject);
var
  Script: TListItem;
begin
  Script := lvScripts.Selected;
  if not Assigned(Script) then
    Exit;
  EditScript(Script);
end;

procedure TfrmSettings.btnDeleteScriptClick(Sender: TObject);
begin
  if cbDefaultAction.Items.Count > 1 then
    cbDefaultAction.Items.Delete(lvScripts.Selected.Index + 1);
  lvScripts.DeleteSelected;
end;

procedure TfrmSettings.pnlCAClick(Sender: TObject);
begin
  dlgColors.Color := (Sender as TrzPanel).Color;
  if dlgColors.Execute then
    (Sender as TrzPanel).Color := dlgColors.Color;
end;

procedure TfrmSettings.pnlDwnldClick(Sender: TObject);
begin
  dlgColors.Color := (Sender as TrzPanel).Font.Color;
  if dlgColors.Execute then
    (Sender as TrzPanel).Font.Color := dlgColors.Color;
end;

procedure TfrmSettings.tbtnInsert1Click(Sender: TObject);
const
  s: array [41..48] of string = ('%f','%t','%s','%n','%id','%g','%fl', '%rg');
var
  OldText: string;
  p: integer;
begin
  if (ActiveControl as TRzEdit).Tag = 785 then
  begin
    OldText := (ActiveControl as TRzEdit).Text;
    p := (ActiveControl as TRzEdit).SelStart;
    Insert(s[(Sender as TRzToolButton).Tag],OldText, P + 1);
    (ActiveControl as TRzEdit).Text := OldText;
    (ActiveControl as TRzEdit).SelStart := P + 2;
    (ActiveControl as TRzEdit).SelLength := 0;
  end;
end;

procedure TfrmSettings.tvSectionsChange(Sender: TObject; Node: TTreeNode);
begin
  pcSetPages.ActivePageIndex := tvSections.Selected.Index;
end;

procedure TfrmSettings.Button1Click(Sender: TObject);
begin
  if dlgColors.Execute then
  begin
    pnlCA.Font.Color := dlgColors.Color;
    pnlCS.Font.Color := dlgColors.Color;
    pnlCT.Font.Color := dlgColors.Color;
    pnlBS.Font.Color := dlgColors.Color;
    pnlASG.Font.Color := dlgColors.Color;
  end;
end;

procedure TfrmSettings.cbUseIESettingsClick(Sender: TObject);
begin
  edProxyServer.Enabled := not cbUseIESettings.Checked;
  edProxyPort.Enabled := not cbUseIESettings.Checked;
  edProxyUserName.Enabled := not cbUseIESettings.Checked;
  edProxyPassword.Enabled := not cbUseIESettings.Checked;
end;

end.

