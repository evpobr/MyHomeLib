object frmNewCollectionWizard: TfrmNewCollectionWizard
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1081' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
  ClientHeight = 345
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 295
    Width = 507
    Height = 50
    Align = alBottom
    ExplicitLeft = 360
    ExplicitTop = 288
    ExplicitWidth = 50
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 57
    Align = alTop
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object lblCaption: TLabel
      Left = 16
      Top = 8
      Width = 56
      Height = 13
      Caption = 'lblCaption'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHint: TLabel
      Left = 24
      Top = 32
      Width = 29
      Height = 13
      Caption = 'lblHint'
    end
  end
  object pcWizard: TPageControl
    Left = 0
    Top = 57
    Width = 507
    Height = 238
    ActivePage = tsLibrusec
    TabOrder = 1
    object tsWelcome: TTabSheet
      Caption = 'tsWelcome'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 24
        Top = 32
        Width = 314
        Height = 13
        Caption = #1044#1086#1073#1088#1086' '#1087#1086#1078#1072#1083#1086#1074#1072#1090#1100' '#1074' '#1052#1072#1089#1090#1077#1088' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' MyHomeLib!'
      end
    end
    object tsTypeSelect: TTabSheet
      Hint = #1059#1082#1072#1078#1080#1090#1077' '#1090#1080#1087' '#1085#1086#1074#1086#1081' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1080' '#1087#1072#1087#1082#1091' '#1089' '#1082#1085#1080#1075#1072#1084#1080
      Caption = #1042#1099#1073#1086#1088' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label2: TLabel
        Left = 12
        Top = 16
        Width = 165
        Height = 13
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1085#1086#1074#1086#1081' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
      end
      object Label3: TLabel
        Left = 12
        Top = 149
        Width = 87
        Height = 13
        Caption = #1055#1072#1087#1082#1072' '#1089' '#1082#1085#1080#1075#1072#1084#1080':'
      end
      object rgCollType: TRadioGroup
        Left = 12
        Top = 35
        Width = 389
        Height = 89
        ItemIndex = 0
        Items.Strings = (
          #1050#1086#1083#1083#1077#1082#1094#1080#1103' lib.rus.ec'
          #1053#1086#1074#1072#1103'  '#1082#1086#1083#1083#1077#1082#1094#1080#1103
          #1057#1091#1097#1077#1089#1090#1074#1091#1102#1097#1072#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1103' (*.hlc)')
        TabOrder = 0
      end
      object edCollFolder: TEdit
        Left = 12
        Top = 168
        Width = 389
        Height = 21
        TabOrder = 1
      end
      object btnLibraryPath: TButton
        Left = 418
        Top = 166
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 2
        OnClick = btnLibraryPathClick
      end
    end
    object tsLibrusec: TTabSheet
      Hint = #1057#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1089#1087#1080#1089#1082#1086#1074' '#1082#1085#1080#1075
      Caption = #1042#1099#1073#1086#1088' '#1090#1080#1087#1072' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' librus.ec'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cblibrusecType: TRadioGroup
        Left = 3
        Top = 15
        Width = 478
        Height = 105
        Items.Strings = (
          #1051#1086#1082#1072#1083#1100#1085#1072#1103' ('#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099' '#1072#1088#1093#1080#1074#1099' lib.rus.ec)'
          
            'Fb2 on-line. '#1050#1085#1080#1075#1080' '#1073#1091#1076#1091#1090' '#1089#1082#1072#1095#1080#1074#1072#1090#1100#1089#1103' '#1089' '#1089#1077#1088#1074#1077#1088#1072' lib.rus.ec '#1087#1086' '#1084#1077#1088 +
            #1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080'.'
          
            #1041#1080#1073#1083#1080#1086#1090#1077#1082#1072' "'#1043#1077#1085#1077#1079#1080#1089'".    '#1050#1085#1080#1075#1080' '#1073#1091#1076#1091#1090' '#1089#1082#1072#1095#1080#1074#1072#1090#1100#1089#1103' '#1089' '#1089#1077#1088#1074#1077#1088#1072' '#1087#1086' '#1084#1077 +
            #1088#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080'.')
        TabOrder = 0
      end
    end
    object tsProgress: TTabSheet
      Hint = #1055#1086#1076#1086#1078#1076#1080#1090#1077' ...'
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object txtComment: TLabel
        Left = 20
        Top = 80
        Width = 59
        Height = 13
        Caption = 'txtComment'
      end
      object ProgressBar: TProgressBar
        Left = 20
        Top = 144
        Width = 453
        Height = 16
        TabOrder = 0
      end
    end
    object tsEmpty: TTabSheet
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1091#1089#1090#1086#1081' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label8: TLabel
        Left = 20
        Top = 3
        Width = 105
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      end
      object Label9: TLabel
        Left = 20
        Top = 46
        Width = 83
        Height = 13
        Caption = #1060#1072#1081#1083' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      end
      object Label10: TLabel
        Left = 20
        Top = 142
        Width = 117
        Height = 13
        Caption = #1060#1072#1081#1083' '#1086#1087#1080#1089#1072#1085#1080#1103' '#1078#1072#1085#1088#1086#1074
      end
      object edCollName: TEdit
        Left = 20
        Top = 19
        Width = 381
        Height = 21
        TabOrder = 0
      end
      object edCollFile: TEdit
        Left = 20
        Top = 65
        Width = 381
        Height = 21
        TabOrder = 1
      end
      object btnNewFile: TButton
        Left = 421
        Top = 63
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 2
        OnClick = btnNewFileClick
      end
      object btnGenreList: TButton
        Left = 421
        Top = 158
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Enabled = False
        TabOrder = 3
        OnClick = btnSelectExitsPathClick
      end
      object edGenreList: TEdit
        Left = 20
        Top = 161
        Width = 381
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object rgCollType2: TRadioGroup
        Left = 20
        Top = 92
        Width = 381
        Height = 44
        Caption = #1058#1080#1087' '#1092#1072#1081#1083#1086#1074' '#1074' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'fb2 '
          #1085#1077' - fb2 (pdf, djvu, mht, doc '#1080' '#1076#1088'.)  ')
        TabOrder = 5
        OnClick = rgCollType2Click
      end
      object cbImportXML: TCheckBox
        Left = 20
        Top = 190
        Width = 300
        Height = 17
        Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' XML'
        TabOrder = 6
      end
    end
    object tsExists: TTabSheet
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1081' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 20
        Top = 24
        Width = 48
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object Label7: TLabel
        Left = 20
        Top = 70
        Width = 83
        Height = 13
        Caption = #1060#1072#1081#1083' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      end
      object edExistsPath: TEdit
        Left = 20
        Top = 89
        Width = 325
        Height = 21
        TabOrder = 0
      end
      object edExistsTitle: TEdit
        Left = 20
        Top = 43
        Width = 325
        Height = 21
        TabOrder = 1
      end
      object btnSelectExitsPath: TButton
        Left = 413
        Top = 87
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 2
        OnClick = btnSelectExitsPathClick
      end
    end
    object tsFinish: TTabSheet
      Caption = #1043#1086#1090#1086#1074#1086'!'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label5: TLabel
        Left = 40
        Top = 32
        Width = 214
        Height = 26
        Caption = #1055#1086#1079#1076#1088#1072#1074#1083#1103#1077#1084'!'#13#1057#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1091#1089#1087#1077#1096#1085#1086' '#1079#1072#1074#1077#1088#1096#1077#1085#1086'.'
      end
    end
    object tsXML: TTabSheet
      Caption = #1048#1084#1087#1086#1088#1090' XML'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 20
        Top = 70
        Width = 83
        Height = 13
        Caption = #1060#1072#1081#1083' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      end
      object EdXMLFileName: TEdit
        Left = 20
        Top = 89
        Width = 381
        Height = 21
        TabOrder = 0
        Text = 'e:\temp\test.xml'
      end
      object btnSelectXML: TButton
        Left = 413
        Top = 87
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 1
        OnClick = btnSelectXMLClick
      end
    end
  end
  object btnForward: TButton
    Left = 330
    Top = 312
    Width = 75
    Height = 25
    Caption = #1042#1087#1077#1088#1077#1076' >'
    TabOrder = 2
    OnClick = btnForwardClick
  end
  object btnBackward: TButton
    Left = 249
    Top = 312
    Width = 75
    Height = 25
    Caption = '< '#1053#1072#1079#1072#1076
    TabOrder = 3
    Visible = False
    OnClick = btnBackwardClick
  end
  object btnCancel: TButton
    Left = 424
    Top = 312
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object dlgSelectFolder: TRzSelectFolderDialog
    Left = 344
    Top = 16
  end
end
