object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Traum2Inpx'
  ClientHeight = 190
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 347
    Height = 190
    Align = alClient
    BevelOuter = bvSpace
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 559
    ExplicitHeight = 411
    object Label1: TLabel
      Left = 16
      Top = 125
      Width = 36
      Height = 13
      Caption = #1043#1086#1090#1086#1074#1086
    end
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 4
      Top = 116
      Width = 339
      Height = 70
      Align = alClient
      Shape = bsFrame
      ExplicitLeft = 58
      ExplicitWidth = 329
      ExplicitHeight = 56
    end
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 4
      Top = 60
      Width = 339
      Height = 50
      Align = alTop
      Shape = bsFrame
      ExplicitLeft = 16
      ExplicitTop = 16
      ExplicitWidth = 137
    end
    object Bevel3: TBevel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 339
      Height = 50
      Align = alTop
      Shape = bsFrame
      ExplicitLeft = 16
      ExplicitTop = 16
      ExplicitWidth = 137
    end
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 120
      Height = 25
      Caption = #1048#1084#1087#1086#1088#1090' '#1041#1044
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 72
      Width = 120
      Height = 25
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' INPX'
      TabOrder = 1
      OnClick = Button2Click
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 143
      Width = 305
      Height = 17
      TabOrder = 2
    end
  end
  object Zip: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clFastest
    CompressionMode = 1
    CurrentVersion = '5.06 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = False
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    Zip64Mode = zmDisabled
    UnicodeFilenames = False
    EncryptionMethod = caPkzipClassic
    Left = 280
    Top = 16
  end
end
