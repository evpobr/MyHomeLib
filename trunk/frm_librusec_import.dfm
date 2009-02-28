object frmImportTXT: TfrmImportTXT
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' ... '
  ClientHeight = 93
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  GlassFrame.Enabled = True
  GlassFrame.SheetOfGlass = True
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 327
    Height = 93
    Align = alClient
    BorderInner = fsButtonDown
    BorderOuter = fsButtonDown
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 58
      Top = 16
      Width = 213
      Height = 13
      Caption = #1055#1086#1076#1086#1078#1076#1080#1090#1077', '#1080#1076#1077#1090' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' ...'
    end
    object pbProgress: TRzProgressBar
      Left = 62
      Top = 48
      BorderWidth = 0
      InteriorOffset = 0
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
    end
  end
  object dlgBaseFolder: TRzSelDirDialog
    DriveTypes = [dtFloppy, dtFixed, dtNetwork, dtCDROM, dtRAM]
    Prompt = 'Folder Name'
    PromptFolders = 'Folders'
    PromptDrives = 'Drives'
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1072#1087#1082#1091' '#1089' '#1072#1088#1093#1080#1074#1072#1084#1080' lib.rus.ec'
    CaptionOK = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 280
    Top = 16
  end
end
