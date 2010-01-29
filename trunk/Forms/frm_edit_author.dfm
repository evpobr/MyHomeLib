object frmEditAuthorData: TfrmEditAuthorData
  Left = 0
  Top = 0
  HelpContext = 117
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1072#1074#1090#1086#1088#1077
  ClientHeight = 216
  ClientWidth = 358
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
  object gbInfo: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 352
    Height = 102
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 17
      Width = 48
      Height = 13
      Caption = '&'#1060#1072#1084#1080#1083#1080#1103':'
      FocusControl = edFamily
    end
    object Label2: TLabel
      Left = 9
      Top = 44
      Width = 23
      Height = 13
      Caption = '&'#1048#1084#1103':'
      FocusControl = edName
    end
    object Label3: TLabel
      Left = 9
      Top = 71
      Width = 53
      Height = 13
      Caption = #1054'&'#1090#1095#1077#1089#1090#1074#1086':'
      FocusControl = edMiddle
    end
    object edFamily: TEdit
      Left = 73
      Top = 14
      Width = 270
      Height = 21
      TabOrder = 0
    end
    object edName: TEdit
      Left = 73
      Top = 41
      Width = 270
      Height = 21
      TabOrder = 1
    end
    object edMiddle: TEdit
      Left = 73
      Top = 68
      Width = 270
      Height = 21
      TabOrder = 2
    end
  end
  object gbAddNew: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 108
    Width = 352
    Height = 61
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = #1054'&'#1087#1094#1080#1080
    TabOrder = 1
    Visible = False
    object cbAddNew: TCheckBox
      Left = 17
      Top = 28
      Width = 85
      Height = 15
      Caption = '&'#1053#1086#1074#1099#1081' '#1072#1074#1090#1086#1088
      TabOrder = 0
    end
    object cbSaveLinks: TCheckBox
      Left = 158
      Top = 28
      Width = 108
      Height = 15
      Caption = #1057#1086'&'#1093#1088#1072#1085#1080#1090#1100'  '#1089#1074#1103#1079#1080
      TabOrder = 1
    end
  end
  object pnButtons: TPanel
    Left = 0
    Top = 175
    Width = 358
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnButtons'
    ShowCaption = False
    TabOrder = 2
    DesignSize = (
      358
      41)
    object btnOk: TButton
      Left = 194
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 275
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
end
