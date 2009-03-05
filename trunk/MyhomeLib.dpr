
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{              Copyright (c) 2008, Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{                               http://home-lib.net                            }
{                                                                              }
{ This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.                               }
{                                                                              }
{******************************************************************************}

program MyhomeLib;

uses
  Forms,
  frm_main in 'Forms\frm_main.pas' {frmMain},
  dm_main in 'DataModules\dm_main.pas' {DMMain: TDataModule},
  dm_user in 'DataModules\dm_user.pas' {DMUser: TDataModule},
  unit_Database in 'Units\unit_Database.pas',
  unit_Globals in 'Units\unit_Globals.pas',
  frm_settings in 'Forms\frm_settings.pas' {frmSettings},
  frm_about in 'Forms\frm_about.pas' {frmAbout},
  frm_statistic in 'Forms\frm_statistic.pas' {frmStat},
  unit_PrevInst in 'Units\unit_PrevInst.pas',
  frm_bases in 'Forms\frm_bases.pas' {frmBases},
  fictionbook_21 in 'Units\fictionbook_21.pas',
  frm_book_info in 'Forms\frm_book_info.pas' {frmBookDetails},
  frm_splash in 'Forms\frm_splash.pas' {frmSplash},
  frm_add_nonfb2 in 'Forms\frm_add_nonfb2.pas' {frmAddnonfb2},
  frm_edit_book_info in 'Forms\frm_edit_book_info.pas' {frmEditBookInfo},
  frm_genre_tree in 'Forms\frm_genre_tree.pas' {frmGenreTree},
  unit_TreeUtils in 'Units\unit_TreeUtils.pas',
  unit_MHL_xml in 'Units\unit_MHL_xml.pas',
  frm_edit_author in 'Forms\frm_edit_author.pas' {frmEditAuthor},
  frm_edit_reader in 'Forms\frm_edit_reader.pas' {frmEditReader},
  unit_MHL_strings in 'Units\unit_MHL_strings.pas',
  frm_edit_script in 'Forms\frm_edit_script.pas' {frmEditScript},
  unit_Settings in 'Units\unit_Settings.pas',
  unit_Readers in 'Units\unit_Readers.pas',
  unit_Scripts in 'Units\unit_Scripts.pas',
  unit_Errors in 'Units\unit_Errors.pas',
  unit_Consts in 'Units\unit_Consts.pas',
  unit_WorkerThread in 'ImportImpl\unit_WorkerThread.pas',
  unit_ImportXMLThread in 'ImportImpl\unit_ImportXMLThread.pas',
  unit_Import in 'ImportImpl\unit_Import.pas',
  frm_BaseProgressForm in 'ImportImpl\frm_BaseProgressForm.pas' {ProgressFormBase},
  frm_ImportProgressForm in 'ImportImpl\frm_ImportProgressForm.pas' {ImportProgressForm},
  unit_ImportFB2Thread in 'ImportImpl\unit_ImportFB2Thread.pas',
  unit_Helpers in 'Units\unit_Helpers.pas',
  frm_ImportProgressFormEx in 'ImportImpl\frm_ImportProgressFormEx.pas' {ImportProgressFormEx},
  unit_ImportFB2ThreadBase in 'ImportImpl\unit_ImportFB2ThreadBase.pas',
  unit_ImportFB2ZIPThread in 'ImportImpl\unit_ImportFB2ZIPThread.pas',
  unit_ImportLibRusEcThread in 'ImportImpl\unit_ImportLibRusEcThread.pas',
  unit_ExportXMLThread in 'ImportImpl\unit_ExportXMLThread.pas',
  unit_Export in 'ImportImpl\unit_Export.pas',
  frm_ExportProgressForm in 'ImportImpl\frm_ExportProgressForm.pas' {ExportProgressForm},
  frm_SyncOnLineProgressForm in 'UtilsImpl\frm_SyncOnLineProgressForm.pas' {SyncOnLineProgressForm},
  unit_SyncOnLineThread in 'UtilsImpl\unit_SyncOnLineThread.pas',
  unit_Utils in 'UtilsImpl\unit_Utils.pas',
  frm_ExportToDeviceProgressForm in 'UtilsImpl\frm_ExportToDeviceProgressForm.pas' {ExportToDeviceProgressForm},
  unit_ExportToDevice in 'UtilsImpl\unit_ExportToDevice.pas',
  unit_ExportToDeviceThread in 'UtilsImpl\unit_ExportToDeviceThread.pas',
  frame_DecorativePageBase in 'Wizards\NewCollection\frame_DecorativePageBase.pas' {DecorativePageBase: TFrame},
  frame_InteriorPageBase in 'Wizards\NewCollection\frame_InteriorPageBase.pas' {InteriorPageBase: TFrame},
  frame_NCWWelcom in 'Wizards\NewCollection\frame_NCWWelcom.pas' {frameNCWWelcom: TFrame},
  frm_NCWizard in 'Wizards\NewCollection\frm_NCWizard.pas' {frmNCWizard},
  frame_NCWOperation in 'Wizards\NewCollection\frame_NCWOperation.pas' {frameNCWOperation: TFrame},
  frame_NCWFinish in 'Wizards\NewCollection\frame_NCWFinish.pas' {frameNCWFinish: TFrame},
  frame_NCWCollectionType in 'Wizards\NewCollection\frame_NCWCollectionType.pas' {frameNCWCollectionType: TFrame},
  frame_NCWCollectionNameAndLocation in 'Wizards\NewCollection\frame_NCWCollectionNameAndLocation.pas' {frameNCWNameAndLocation: TFrame},
  frame_NCWSelectGenreFile in 'Wizards\NewCollection\frame_NCWSelectGenreFile.pas' {frameNCWSelectGenreFile: TFrame},
  frame_NCWProgress in 'Wizards\NewCollection\frame_NCWProgress.pas' {frameNCWProgress: TFrame},
  frame_WizardPageBase in 'Wizards\NewCollection\frame_WizardPageBase.pas' {WizardPageBase: TFrame},
  frame_NCWImport in 'Wizards\NewCollection\frame_NCWImport.pas' {frameNCWImport: TFrame},
  unit_NCWParams in 'Wizards\NewCollection\unit_NCWParams.pas',
  frame_NCWCollectionFileTypes in 'Wizards\NewCollection\frame_NCWCollectionFileTypes.pas' {frameNCWCollectionFileTypes: TFrame},
  unit_fb2ToText in 'UtilsImpl\unit_fb2ToText.pas',
  unit_StaticTip in 'Components\unit_StaticTip.pas',
  files_list in 'Components\files_list.pas',
  MHLComponents_Register in 'Components\MHLComponents_Register.pas',
  unit_AutoCompleteEdit in 'Components\unit_AutoCompleteEdit.pas',
  unit_SyncFoldersThread in 'UtilsImpl\unit_SyncFoldersThread.pas',
  unit_libupdateThread in 'UtilsImpl\unit_libupdateThread.pas',
  unit_CoverPanel in 'Components\unit_CoverPanel.pas',
  unit_InfoPanel in 'Components\unit_InfoPanel.pas',
  unit_DownloadBooksThread in 'DwnldImpl\unit_DownloadBooksThread.pas',
  frm_DownloadProgressForm in 'DwnldImpl\frm_DownloadProgressForm.pas' {DownloadProgressForm},
  unit_Columns in 'Units\unit_Columns.pas',
  StoHtmlHelp in 'UtilsImpl\StoHtmlHelp.pas',
  unit_DownloadManagerThread in 'DwnldImpl\unit_DownloadManagerThread.pas';

{$R *.res}

begin
  Application.Initialize;

  if FirstHinstanceRunning(1) then
  begin
    Exit;
  end;

  Application.MainFormOnTaskbar := True;
  Application.Title := 'MyHomeLib';
  Application.HelpFile := '';
  frmSplash := TfrmSplash.Create(Application);
  try
    frmSplash.Show;   // Display the splash screen
    frmSplash.Update; // Update the splash screen to ensure it gets drawn

    Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TDMUser, DMUser);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAddnonfb2, frmAddnonfb2);
  Application.CreateForm(TfrmEditBookInfo, frmEditBookInfo);
  Application.CreateForm(TfrmGenreTree, frmGenreTree);
  Application.CreateForm(TfrmEditAuthor, frmEditAuthor);
  frmSplash.Hide;  // Hide the splash screen
  finally
    frmSplash.Free;  // Free the splash screen
  end;

  Application.Run;
end.
