inherited frameNCWInpxSource: TframeNCWInpxSource
  Width = 330
  Height = 342
  Constraints.MinHeight = 240
  Constraints.MinWidth = 330
  ExplicitWidth = 330
  ExplicitHeight = 342
  object pageHint: TMHLStaticTip [0]
    AlignWithMargins = True
    Left = 14
    Top = 284
    Width = 302
    Height = 58
    Margins.Left = 14
    Margins.Right = 14
    TextMargin = 15
    Images = DMUser.SeverityImagesBig
    ImageIndex = 0
    Align = alTop
    ExplicitTop = 276
  end
  inherited pnTitle: TPanel
    Width = 330
    ExplicitWidth = 330
    inherited lblTitle: TLabel
      Width = 302
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082' INPX'
      ExplicitWidth = 84
    end
    inherited lblSubTitle: TLabel
      Width = 295
      Caption = #1042#1099#1073#1080#1088#1080#1090#1077' '#1092#1072#1081#1083' inpx '#1076#1083#1103' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ExplicitWidth = 231
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 56
    Width = 330
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object rbLocal: TRadioButton
      AlignWithMargins = True
      Left = 18
      Top = 7
      Width = 294
      Height = 17
      Margins.Left = 18
      Margins.Top = 7
      Margins.Right = 18
      Margins.Bottom = 0
      Align = alTop
      Caption = #1051#1086#1082#1072#1083#1100#1085#1099#1081' '#1092#1072#1081#1083' INPX '
      TabOrder = 0
      OnClick = OnSetCollectionType
    end
    object edINPXPath: TRzButtonEdit
      AlignWithMargins = True
      Left = 18
      Top = 27
      Width = 294
      Height = 21
      Margins.Left = 18
      Margins.Right = 18
      Margins.Bottom = 0
      Align = alTop
      TabOrder = 1
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = edINPXPathButtonClick
    end
    object rbDownload: TRadioButton
      AlignWithMargins = True
      Left = 18
      Top = 55
      Width = 294
      Height = 17
      Margins.Left = 18
      Margins.Top = 7
      Margins.Right = 18
      Margins.Bottom = 0
      Align = alTop
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089' '#1089#1072#1081#1090#1072
      TabOrder = 2
      OnClick = OnSetCollectionType
    end
    object lvCollections: TListView
      AlignWithMargins = True
      Left = 18
      Top = 75
      Width = 294
      Height = 140
      Margins.Left = 18
      Margins.Right = 18
      Margins.Bottom = 10
      Align = alClient
      Columns = <
        item
          Width = 450
        end>
      Enabled = False
      GroupView = True
      TabOrder = 3
      ViewStyle = vsReport
      OnChange = lvCollectionsChange
    end
  end
end
