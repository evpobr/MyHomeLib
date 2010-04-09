inherited frameNCWImport: TframeNCWImport
  Width = 460
  Height = 220
  Constraints.MinHeight = 220
  Constraints.MinWidth = 460
  ExplicitWidth = 460
  ExplicitHeight = 220
  object pageHint: TMHLStaticTip [0]
    AlignWithMargins = True
    Left = 14
    Top = 134
    Width = 432
    Height = 58
    Margins.Left = 14
    Margins.Top = 14
    Margins.Right = 14
    TextMargin = 15
    Images = DMUser.SeverityImagesBig
    ImageIndex = 1
    Align = alTop
    Caption = 
      #1042#1085#1080#1084#1072#1085#1080#1077'! '#1058#1080#1087' '#1080#1084#1087#1086#1088#1090#1080#1088#1091#1077#1084#1086#1081' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1076#1086#1083#1078#1077#1085' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1086#1074#1072#1090#1100' '#1090#1080#1087 +
      #1091' '#1089#1086#1079#1076#1072#1074#1072#1077#1084#1086#1081' '#1082#1086#1083#1083#1077#1082#1094#1080#1080'.'
    ExplicitTop = 128
    ExplicitWidth = 469
  end
  inherited pnTitle: TPanel
    Width = 460
    ExplicitWidth = 460
    inherited lblTitle: TLabel
      Width = 432
      Caption = #1048#1084#1087#1086#1088#1090
      ExplicitWidth = 44
    end
    inherited lblSubTitle: TLabel
      Width = 425
      Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1085#1086#1074#1091#1102' '#1082#1086#1083#1083#1077#1082#1094#1080#1102' '#1089#1088#1072#1079#1091' '#1087#1086#1089#1083#1077' '#1089#1086#1079#1076#1072#1085#1080#1103
      ExplicitWidth = 339
    end
  end
  object cbImportXML: TCheckBox
    AlignWithMargins = True
    Left = 14
    Top = 70
    Width = 439
    Height = 17
    Margins.Left = 14
    Margins.Top = 14
    Margins.Right = 7
    Margins.Bottom = 0
    Align = alTop
    Caption = '&'#1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' XML'
    TabOrder = 1
    OnClick = cbImportXMLClick
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 7
    Top = 94
    Width = 446
    Height = 26
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      446
      26)
    object Label4: TLabel
      Left = 21
      Top = 5
      Width = 75
      Height = 13
      Caption = '&'#1060#1072#1081#1083' '#1080#1084#1087#1086#1088#1090#1072':'
      FocusControl = edXMLFile
    end
    object edXMLFile: TMHLAutoCompleteEdit
      Left = 102
      Top = 2
      Width = 256
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      AutoCompleteOption = [acoFileSystem]
    end
    object btnSelectXML: TButton
      Left = 364
      Top = 0
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 1
      OnClick = btnSelectXMLClick
    end
  end
end
