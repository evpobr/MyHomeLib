object frmBases: TfrmBases
  Left = 0
  Top = 0
  HelpContext = 110
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
  ClientHeight = 367
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object pcCollectionInfo: TPageControl
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 565
    Height = 307
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tsGeneralInfo
    Align = alTop
    TabOrder = 0
    object tsGeneralInfo: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        557
        275)
      object MHLStaticTip1: TMHLStaticTip
        AlignWithMargins = True
        Left = 13
        Top = 160
        Width = 532
        Height = 81
        Margins.Left = 13
        Margins.Top = 13
        Margins.Right = 13
        Margins.Bottom = 9
        ImageIndex = 1
        Caption = 
          #1042#1085#1080#1084#1072#1085#1080#1077'! '#1053#1077#1082#1086#1088#1088#1077#1082#1090#1085#1086#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1089#1074#1086#1081#1089#1090#1074' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1084#1086#1078#1077#1090' '#1087#1088#1080#1074#1077#1089#1090 +
          #1080' '#1082' '#1077#1077' '#1085#1077#1088#1072#1073#1086#1090#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080'! '
      end
      object lblCollectionDescription: TLabel
        Left = 13
        Top = 119
        Width = 141
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
        FocusControl = edCollectionRoot
      end
      object lblCollectionRoot: TLabel
        Left = 13
        Top = 84
        Width = 111
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&'#1055#1072#1087#1082#1072' '#1089' '#1082#1085#1080#1075#1072#1084#1080':'
        FocusControl = edCollectionRoot
      end
      object lblCollectionFile: TLabel
        Left = 13
        Top = 48
        Width = 111
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&'#1060#1072#1081#1083' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
        FocusControl = edCollectionFile
      end
      object lblCollectionName: TLabel
        Left = 13
        Top = 13
        Width = 137
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&'#1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
        FocusControl = edCollectionName
      end
      object edDescription: TEdit
        Left = 165
        Top = 115
        Width = 380
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 5
      end
      object edCollectionRoot: TMHLAutoCompleteEdit
        Left = 165
        Top = 80
        Width = 274
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        AutoCompleteOption = [acoFileSystem]
      end
      object edCollectionFile: TMHLAutoCompleteEdit
        Left = 165
        Top = 44
        Width = 274
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        AutoCompleteOption = [acoFileSystem]
      end
      object edCollectionName: TEdit
        Left = 165
        Top = 9
        Width = 380
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object btnNewFile: TButton
        Left = 447
        Top = 42
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 2
        OnClick = edDBFileButtonClick
      end
      object btnSelectRoot: TButton
        Left = 447
        Top = 77
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1042#1099#1073#1088#1072#1090#1100
        TabOrder = 4
        OnClick = edDBFolderButtonClick
      end
    end
    object tsConnectionInfo: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblUser: TLabel
        Left = 13
        Top = 48
        Width = 90
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        FocusControl = edUser
        Transparent = True
      end
      object lblPassword: TLabel
        Left = 309
        Top = 48
        Width = 47
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Alignment = taRightJustify
        Caption = #1055#1072#1088#1086#1083#1100
        Color = clMenuBar
        FocusControl = edPass
        ParentColor = False
        Transparent = True
      end
      object lblURL: TLabel
        Left = 13
        Top = 13
        Width = 25
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Alignment = taRightJustify
        Caption = 'URL'
        Color = clMenuBar
        FocusControl = edURL
        ParentColor = False
        Transparent = True
      end
      object lblScript: TLabel
        Left = 18
        Top = 80
        Width = 155
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Alignment = taRightJustify
        Caption = #1057#1094#1077#1085#1072#1088#1080#1081' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
        Color = clMenuBar
        FocusControl = mmScript
        ParentColor = False
        Transparent = True
      end
      object mmScript: TMemo
        Left = 13
        Top = 105
        Width = 532
        Height = 157
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Lines.Strings = (
          '')
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object edUser: TEdit
        Left = 115
        Top = 44
        Width = 150
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 1
      end
      object edPass: TEdit
        Left = 364
        Top = 44
        Width = 181
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        PasswordChar = '*'
        TabOrder = 2
      end
      object edURL: TEdit
        Left = 58
        Top = 9
        Width = 487
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
      end
    end
  end
  object pnButtons: TPanel
    Left = 0
    Top = 314
    Width = 573
    Height = 53
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnButtons'
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      573
      53)
    object btnOk: TButton
      Left = 358
      Top = 13
      Width = 98
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TButton
      Left = 464
      Top = 13
      Width = 98
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
end
