object frmBases: TfrmBases
  Left = 0
  Top = 0
  HelpContext = 110
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
  ClientHeight = 241
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MHLStaticTip1: TMHLStaticTip
    AlignWithMargins = True
    Left = 15
    Top = 130
    Width = 410
    Height = 64
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 7
    Images = DMUser.SeverityImagesBig
    ImageIndex = 1
    Caption = 
      #1042#1085#1080#1084#1072#1085#1080#1077'! '#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1089#1074#1086#1081#1089#1090#1074' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1084#1086#1078#1077#1090' '#1087#1088#1080#1074#1077#1089#1090#1080' '#1082' '#1077#1077' '#1085#1077#1088#1072#1073#1086 +
      #1090#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080'! '
  end
  object pnButtons: TPanel
    Left = 0
    Top = 201
    Width = 430
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 184
    DesignSize = (
      430
      40)
    object btnSave: TButton
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TButton
      Left = 345
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 7
    Top = 7
    Width = 416
    Height = 90
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    DesignSize = (
      416
      90)
    object Label9: TLabel
      Left = 10
      Top = 37
      Width = 87
      Height = 13
      Caption = '&'#1060#1072#1081#1083' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
      FocusControl = edCollectionFile
    end
    object Label5: TLabel
      Left = 10
      Top = 64
      Width = 87
      Height = 13
      Caption = '&'#1055#1072#1087#1082#1072' '#1089' '#1082#1085#1080#1075#1072#1084#1080':'
      FocusControl = edCollectionRoot
    end
    object Label8: TLabel
      Left = 10
      Top = 10
      Width = 109
      Height = 13
      Caption = '&'#1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
      FocusControl = edCollectionName
    end
    object edCollectionFile: TMHLAutoCompleteEdit
      Left = 125
      Top = 34
      Width = 207
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      AutoCompleteOption = [acoFileSystem]
    end
    object btnNewFile: TButton
      Left = 338
      Top = 32
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 2
      OnClick = edDBFileButtonClick
    end
    object edCollectionRoot: TMHLAutoCompleteEdit
      Left = 125
      Top = 61
      Width = 207
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      AutoCompleteOption = [acoFileSystem]
    end
    object btnSelectRoot: TButton
      Left = 338
      Top = 59
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 4
      OnClick = edDBFolderButtonClick
    end
    object edCollectionName: TEdit
      Left = 125
      Top = 7
      Width = 207
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object cbRelativePath: TCheckBox
    Left = 132
    Top = 100
    Width = 221
    Height = 17
    Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1091#1090#1080' '
    TabOrder = 2
  end
end
