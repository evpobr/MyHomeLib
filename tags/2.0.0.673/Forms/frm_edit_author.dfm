object frmEditAuthorData: TfrmEditAuthorData
  Left = 0
  Top = 0
  HelpContext = 117
  BorderStyle = bsDialog
  Caption = #1060'.'#1048'.'#1054
  ClientHeight = 195
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 149
    Width = 286
    Height = 43
    Align = alBottom
    TabOrder = 0
    object btnSave: TRzBitBtn
      Left = 9
      Top = 12
      Width = 120
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      Kind = bkOK
    end
    object RzBitBtn2: TRzBitBtn
      Left = 151
      Top = 12
      Width = 128
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object RzGroupBox2: TRzGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 286
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 10
      Width = 44
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object Label2: TLabel
      Left = 9
      Top = 52
      Width = 19
      Height = 13
      Caption = #1048#1084#1103
    end
    object Label3: TLabel
      Left = 151
      Top = 52
      Width = 49
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    end
    object edFamily: TRzEdit
      Left = 9
      Top = 26
      Width = 270
      Height = 21
      TabOrder = 0
    end
    object edName: TRzEdit
      Left = 9
      Top = 71
      Width = 136
      Height = 21
      TabOrder = 1
    end
    object edMiddle: TRzEdit
      Left = 151
      Top = 71
      Width = 128
      Height = 21
      TabOrder = 2
    end
  end
  object gbAddNew: TRzGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 111
    Width = 286
    Height = 35
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alBottom
    TabOrder = 2
    Visible = False
    object cbAddNew: TRzCheckBox
      Left = 9
      Top = 12
      Width = 85
      Height = 15
      Caption = #1053#1086#1074#1099#1081' '#1072#1074#1090#1086#1088
      State = cbUnchecked
      TabOrder = 0
    end
    object cbSaveLinks: TRzCheckBox
      Left = 155
      Top = 12
      Width = 108
      Height = 15
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'  '#1089#1074#1103#1079#1080
      State = cbUnchecked
      TabOrder = 1
    end
  end
end
