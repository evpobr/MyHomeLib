inherited frameNCWCollectionType: TframeNCWCollectionType
  Width = 330
  Height = 313
  Constraints.MinHeight = 240
  Constraints.MinWidth = 330
  object pageHint: TMHLStaticTip [0]
    AlignWithMargins = True
    Left = 14
    Top = 204
    Width = 302
    Height = 58
    Margins.Left = 14
    Margins.Right = 14
    TextMargin = 15
    Images = DMUser.SeverityImagesBig
    ImageIndex = 0
    Align = alTop
  end
  inherited pnTitle: TPanel
    Width = 330
    inherited lblTitle: TLabel
      Width = 302
      Caption = #1042#1099#1073#1086#1088' '#1090#1080#1087#1072' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
    end
    inherited lblSubTitle: TLabel
      Width = 295
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1089#1087#1080#1089#1082#1086#1074' '#1082#1085#1080#1075
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 56
    Width = 330
    Height = 145
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
      Caption = #1051#1086#1082#1072#1083#1100#1085#1072#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1103' '#1089#1072#1081#1090#1072' lib.rus.ec (fb2)'
      Checked = True
      TabOrder = 0
      TabStop = True
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
      TabOrder = 2
      OnClick = OnSetCollectionType
    end
    object rbThirdParty: TRadioButton
      AlignWithMargins = True
      Left = 14
      Top = 86
      Width = 306
      Height = 17
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 0
      Caption = #1044#1088#1091#1075#1072#1103' '#1073#1080#1073#1083#1080#1086#1090#1077#1082#1072
      TabOrder = 3
      OnClick = OnSetCollectionType
    end
    object edINPXPath: TRzButtonEdit
      AlignWithMargins = True
      Left = 18
      Top = 114
      Width = 294
      Height = 21
      Margins.Left = 18
      Margins.Right = 18
      Margins.Bottom = 10
      Align = alBottom
      TabOrder = 4
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = edINPXPathButtonClick
    end
  end
end
