inherited frameNCWProgress: TframeNCWProgress
  Width = 460
  Height = 300
  Constraints.MinHeight = 300
  Constraints.MinWidth = 460
  ExplicitWidth = 460
  ExplicitHeight = 300
  object txtComment: TLabel [0]
    AlignWithMargins = True
    Left = 14
    Top = 63
    Width = 432
    Height = 13
    Margins.Left = 14
    Margins.Top = 7
    Margins.Right = 14
    Margins.Bottom = 0
    Align = alTop
    AutoSize = False
    Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1091#1077#1084'...'
    EllipsisPosition = epEndEllipsis
    ExplicitLeft = -25
    ExplicitTop = 13
    ExplicitWidth = 345
  end
  inherited pnTitle: TPanel
    Width = 460
    ExplicitWidth = 460
    inherited lblTitle: TLabel
      Width = 432
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ExplicitWidth = 121
    end
    inherited lblSubTitle: TLabel
      Width = 425
      Caption = #1055#1086#1076#1086#1078#1076#1080#1090#1077', '#1087#1086#1082#1072' '#1084#1072#1089#1090#1077#1088' '#1079#1072#1082#1086#1085#1095#1080#1090' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      ExplicitWidth = 285
    end
  end
  object ProgressBar: TProgressBar
    AlignWithMargins = True
    Left = 14
    Top = 83
    Width = 432
    Height = 17
    Margins.Left = 14
    Margins.Top = 7
    Margins.Right = 14
    Margins.Bottom = 0
    Align = alTop
    TabOrder = 1
  end
  object errorLog: TListView
    AlignWithMargins = True
    Left = 14
    Top = 107
    Width = 432
    Height = 150
    Margins.Left = 14
    Margins.Top = 7
    Margins.Right = 14
    Margins.Bottom = 7
    Align = alClient
    Columns = <
      item
        Width = 20
      end
      item
        AutoSize = True
      end>
    ColumnClick = False
    HoverTime = 65535
    Items.ItemData = {
      01B10000000400000000000000FFFFFFFFFFFFFFFF0100000000000000000C49
      006E0066006F0020004D0065007300730061006700650001000000FFFFFFFFFF
      FFFFFF0100000000000000000F5700610072006E0069006E00670020004D0065
      007300730061006700650002000000FFFFFFFFFFFFFFFF010000000000000000
      0D4500720072006F00720020004D00650073007300610067006500FFFFFFFFFF
      FFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFF}
    RowSelect = True
    SmallImages = DMUser.SeverityImages
    TabOrder = 2
    ViewStyle = vsReport
    ExplicitTop = 108
    ExplicitHeight = 101
  end
  object pnButtons: TPanel
    Left = 0
    Top = 264
    Width = 460
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    DesignSize = (
      460
      36)
    object btnSaveLog: TButton
      Left = 14
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
    end
  end
end
