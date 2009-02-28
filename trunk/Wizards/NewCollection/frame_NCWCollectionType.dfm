inherited frameNCWCollectionType: TframeNCWCollectionType
  Width = 330
  Constraints.MinHeight = 240
  Constraints.MinWidth = 330
  ExplicitWidth = 330
  object pageHint: TMHLStaticTip [0]
    AlignWithMargins = True
    Left = 14
    Top = 172
    Width = 302
    Height = 58
    Margins.Left = 14
    Margins.Right = 14
    TextMargin = 15
    Images = DMUser.SeverityImagesBig
    ImageIndex = 0
    Align = alTop
    ExplicitLeft = 3
    ExplicitTop = 159
    ExplicitWidth = 467
  end
  inherited pnTitle: TPanel
    Width = 330
    ExplicitWidth = 330
    inherited lblTitle: TLabel
      Width = 133
      Caption = #1042#1099#1073#1086#1088' '#1090#1080#1087#1072' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ExplicitWidth = 133
    end
    inherited lblSubTitle: TLabel
      Width = 228
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1089#1087#1080#1089#1082#1086#1074' '#1082#1085#1080#1075
      ExplicitWidth = 228
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 56
    Width = 330
    Height = 113
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object rbLocal: TRadioButton
      AlignWithMargins = True
      Left = 14
      Top = 38
      Width = 306
      Height = 17
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 0
      Caption = #1051#1086#1082#1072#1083#1100#1085#1072#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1103' '#1089#1072#1081#1090#1072' lib.rus.ec'
      TabOrder = 0
      OnClick = OnSetCollectionType
    end
    object rbOnline: TRadioButton
      AlignWithMargins = True
      Left = 14
      Top = 62
      Width = 306
      Height = 17
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 0
      Caption = #1054#1085#1083#1072#1081#1085' '#1082#1086#1083#1083#1077#1082#1094#1080#1103' '#1089#1072#1081#1090#1072' lib.rus.ec'
      TabOrder = 1
      OnClick = OnSetCollectionType
    end
    object rbGenesis: TRadioButton
      AlignWithMargins = True
      Left = 14
      Top = 86
      Width = 306
      Height = 17
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 0
      Caption = #1041#1080#1073#1083#1080#1086#1090#1077#1082#1072' "'#1043#1077#1085#1077#1079#1080#1089'".'
      Enabled = False
      TabOrder = 2
      OnClick = OnSetCollectionType
    end
    object rbEmpty: TRadioButton
      AlignWithMargins = True
      Left = 14
      Top = 14
      Width = 195
      Height = 17
      Margins.Left = 14
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 0
      Caption = #1055#1091#1089#1090#1072#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1103
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = OnSetCollectionType
    end
  end
end
