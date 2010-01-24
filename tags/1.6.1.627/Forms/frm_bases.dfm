object frmBases: TfrmBases
  Left = 0
  Top = 0
  HelpContext = 110
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
  ClientHeight = 298
  ClientWidth = 438
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
  object RzPageControl1: TRzPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 432
    Height = 235
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    ExplicitLeft = 40
    ExplicitTop = 225
    ExplicitWidth = 481
    ExplicitHeight = 280
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      ExplicitLeft = 2
      ExplicitTop = 23
      ExplicitWidth = 492
      DesignSize = (
        428
        212)
      object MHLStaticTip1: TMHLStaticTip
        AlignWithMargins = True
        Left = 10
        Top = 135
        Width = 473
        Height = 64
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 7
        ImageIndex = 1
        Caption = 
          #1042#1085#1080#1084#1072#1085#1080#1077'! '#1053#1077#1082#1086#1088#1088#1077#1082#1090#1085#1086#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1089#1074#1086#1081#1089#1090#1074' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1084#1086#1078#1077#1090' '#1087#1088#1080#1074#1077#1089#1090 +
          #1080' '#1082' '#1077#1077' '#1085#1077#1088#1072#1073#1086#1090#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080'! '
      end
      object Label1: TLabel
        Left = 10
        Top = 91
        Width = 110
        Height = 13
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
        FocusControl = edCollectionRoot
      end
      object Label5: TLabel
        Left = 10
        Top = 64
        Width = 87
        Height = 13
        Caption = '&'#1055#1072#1087#1082#1072' '#1089' '#1082#1085#1080#1075#1072#1084#1080':'
        FocusControl = edCollectionRoot
      end
      object Label9: TLabel
        Left = 10
        Top = 37
        Width = 87
        Height = 13
        Caption = '&'#1060#1072#1081#1083' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
        FocusControl = edCollectionFile
      end
      object Label8: TLabel
        Left = 10
        Top = 10
        Width = 109
        Height = 13
        Caption = '&'#1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
        FocusControl = edCollectionName
      end
      object cbRelativePath: TCheckBox
        Left = 126
        Top = 115
        Width = 221
        Height = 17
        Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1091#1090#1080' '
        TabOrder = 0
      end
      object edDescription: TRzEdit
        Left = 126
        Top = 88
        Width = 297
        Height = 21
        TabOrder = 1
      end
      object edCollectionRoot: TMHLAutoCompleteEdit
        Left = 126
        Top = 61
        Width = 212
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        AutoCompleteOption = [acoFileSystem]
        ExplicitWidth = 276
      end
      object edCollectionFile: TMHLAutoCompleteEdit
        Left = 126
        Top = 34
        Width = 212
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        AutoCompleteOption = [acoFileSystem]
      end
      object edCollectionName: TEdit
        Left = 125
        Top = 7
        Width = 294
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ExplicitWidth = 358
      end
      object btnNewFile: TButton
        Left = 344
        Top = 30
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 5
        OnClick = edDBFileButtonClick
      end
      object btnSelectRoot: TButton
        Left = 344
        Top = 60
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 6
        OnClick = edDBFolderButtonClick
        ExplicitLeft = 408
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RzLabel5: TRzLabel
        Left = 16
        Top = 51
        Width = 93
        Height = 13
        Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        Transparent = True
      end
      object RzLabel6: TRzLabel
        Left = 237
        Top = 52
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1072#1088#1086#1083#1100
        Color = clMenuBar
        ParentColor = False
        Transparent = True
      end
      object RzLabel1: TRzLabel
        Left = 16
        Top = 21
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'URL'
        Color = clMenuBar
        ParentColor = False
        Transparent = True
      end
      object RzLabel2: TRzLabel
        Left = 16
        Top = 75
        Width = 122
        Height = 13
        Alignment = taRightJustify
        Caption = #1057#1094#1077#1085#1072#1088#1080#1081' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
        Color = clMenuBar
        ParentColor = False
        Transparent = True
      end
      object mmScript: TMemo
        Left = 3
        Top = 94
        Width = 422
        Height = 115
        Lines.Strings = (
          '')
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object edUser: TRzEdit
        Left = 112
        Top = 48
        Width = 115
        Height = 21
        TabOrder = 1
      end
      object edPass: TRzMaskEdit
        Left = 280
        Top = 48
        Width = 139
        Height = 21
        PasswordChar = #7
        TabOrder = 2
      end
      object edURL: TRzEdit
        Left = 44
        Top = 18
        Width = 375
        Height = 21
        TabOrder = 3
      end
    end
  end
  object RzPanel1: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 244
    Width = 432
    Height = 51
    Align = alBottom
    BorderOuter = fsFlatRounded
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 508
    ExplicitWidth = 701
    DesignSize = (
      430
      49)
    object btnCancel: TButton
      Left = 345
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
      ExplicitLeft = 409
    end
    object btnSave: TButton
      Left = 253
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 1
      OnClick = btnSaveClick
      ExplicitLeft = 317
    end
  end
end
