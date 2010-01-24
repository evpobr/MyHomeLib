inherited frameNCWNameAndLocation: TframeNCWNameAndLocation
  Width = 460
  Height = 282
  Constraints.MinHeight = 270
  Constraints.MinWidth = 460
  ExplicitWidth = 460
  ExplicitHeight = 282
  object Label1: TLabel [0]
    AlignWithMargins = True
    Left = 14
    Top = 61
    Width = 425
    Height = 26
    Margins.Left = 14
    Margins.Top = 5
    Margins.Right = 7
    Align = alTop
    Caption = 
      #1059#1082#1072#1078#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080', '#1092#1072#1081#1083' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1080' '#1087#1072#1087#1082#1091', '#1082' '#1082#1086#1090#1086#1088#1086#1081' '#1042#1099 +
      ' '#1087#1083#1072#1085#1080#1088#1091#1077#1090#1077' '#1093#1088#1072#1085#1080#1090#1100' '#1082#1085#1080#1075#1080'.'
    Transparent = True
    WordWrap = True
  end
  object pageHint: TMHLStaticTip [1]
    AlignWithMargins = True
    Left = 14
    Top = 213
    Width = 432
    Height = 58
    Margins.Left = 14
    Margins.Right = 14
    TextMargin = 15
    Images = DMUser.SeverityImagesBig
    Align = alTop
    ExplicitTop = 210
  end
  inherited pnTitle: TPanel
    Width = 460
    ExplicitWidth = 460
    inherited lblTitle: TLabel
      Width = 120
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ExplicitWidth = 120
    end
    inherited lblSubTitle: TLabel
      Width = 278
      Caption = #1059#1082#1072#1078#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1080' '#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1092#1072#1081#1083#1086#1074' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ExplicitWidth = 278
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 7
    Top = 100
    Width = 446
    Height = 110
    Margins.Left = 7
    Margins.Top = 10
    Margins.Right = 7
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Caption = '111'
    TabOrder = 1
    DesignSize = (
      446
      110)
    object Label9: TLabel
      Left = 21
      Top = 42
      Width = 87
      Height = 13
      Caption = '&'#1060#1072#1081#1083' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
      FocusControl = edCollectionFile
    end
    object Label5: TLabel
      Left = 21
      Top = 69
      Width = 87
      Height = 13
      Caption = '&'#1055#1072#1087#1082#1072' '#1089' '#1082#1085#1080#1075#1072#1084#1080':'
      FocusControl = edCollectionRoot
    end
    object Label8: TLabel
      Left = 21
      Top = 15
      Width = 109
      Height = 13
      Caption = '&'#1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080':'
      FocusControl = edCollectionName
    end
    object edCollectionFile: TMHLAutoCompleteEdit
      Left = 147
      Top = 39
      Width = 214
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnChange = edCollectionFileChange
      OnEnter = CheckControlData
      AutoCompleteOption = [acoFileSystem]
    end
    object btnNewFile: TButton
      Left = 367
      Top = 37
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 2
      OnClick = btnNewFileClick
    end
    object edCollectionRoot: TMHLAutoCompleteEdit
      Left = 147
      Top = 66
      Width = 214
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      OnChange = CheckControlData
      OnEnter = CheckControlData
      AutoCompleteOption = [acoFileSystem]
    end
    object btnSelectRoot: TButton
      Left = 367
      Top = 64
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 4
      OnClick = btnSelectRootClick
    end
    object edCollectionName: TEdit
      Left = 147
      Top = 12
      Width = 214
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = edCollectionNameChange
      OnEnter = CheckControlData
    end
    object cbRelativePath: TCheckBox
      Left = 147
      Top = 90
      Width = 221
      Height = 17
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1091#1090#1080' '
      TabOrder = 5
    end
  end
end
