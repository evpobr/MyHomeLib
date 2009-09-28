object frmConvertToFBD: TfrmConvertToFBD
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077' '#1074' FBD'
  ClientHeight = 402
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 553
    Height = 349
    Align = alClient
    BorderOuter = fsFlatRounded
    TabOrder = 0
    object FCover: TImage
      Left = 8
      Top = 8
      Width = 193
      Height = 289
      Center = True
      Proportional = True
      Stretch = True
    end
    object RzLabel1: TRzLabel
      Left = 207
      Top = 189
      Width = 55
      Height = 13
      Caption = #1040#1085#1085#1086#1090#1072#1094#1080#1103
    end
    object mmAnnotation: TMemo
      Left = 207
      Top = 208
      Width = 338
      Height = 129
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 312
      Width = 75
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object btnPasteCover: TBitBtn
      Left = 126
      Top = 312
      Width = 75
      Height = 25
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnPasteCoverClick
    end
    object RzGroupBox1: TRzGroupBox
      Left = 207
      Top = 113
      Width = 338
      Height = 65
      Caption = #1040#1074#1090#1086#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      TabOrder = 3
      object RzLabel2: TRzLabel
        Left = 18
        Top = 18
        Width = 19
        Height = 13
        Caption = #1048#1084#1103
      end
      object RzLabel3: TRzLabel
        Left = 93
        Top = 18
        Width = 49
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      end
      object RzLabel8: TRzLabel
        Left = 179
        Top = 17
        Width = 44
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object RzLabel9: TRzLabel
        Left = 267
        Top = 17
        Width = 19
        Height = 13
        Caption = #1053#1080#1082
      end
      object edFirstName: TRzEdit
        Left = 4
        Top = 33
        Width = 74
        Height = 21
        TabOrder = 0
      end
      object edMiddleName: TRzEdit
        Left = 84
        Top = 33
        Width = 82
        Height = 21
        TabOrder = 1
      end
      object edLastName: TRzEdit
        Left = 172
        Top = 33
        Width = 68
        Height = 21
        TabOrder = 2
      end
      object edNickName: TRzEdit
        Left = 246
        Top = 33
        Width = 82
        Height = 21
        TabOrder = 3
      end
    end
    object RzGroupBox2: TRzGroupBox
      Left = 207
      Top = 36
      Width = 338
      Height = 71
      Caption = #1048#1079#1076#1072#1090#1077#1083#1100
      TabOrder = 4
      object RzLabel4: TRzLabel
        Left = 11
        Top = 47
        Width = 23
        Height = 13
        Caption = 'ISBN'
      end
      object RzLabel6: TRzLabel
        Left = 192
        Top = 21
        Width = 31
        Height = 13
        Caption = #1043#1086#1088#1086#1076
      end
      object RzLabel7: TRzLabel
        Left = 276
        Top = 47
        Width = 19
        Height = 13
        Caption = #1043#1086#1076
      end
      object RzLabel5: TRzLabel
        Left = 11
        Top = 21
        Width = 48
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object edISBN: TRzEdit
        Left = 40
        Top = 43
        Width = 230
        Height = 21
        TabOrder = 0
      end
      object edPublisher: TRzEdit
        Left = 62
        Top = 18
        Width = 124
        Height = 21
        TabOrder = 1
      end
      object edYear: TRzEdit
        Left = 301
        Top = 45
        Width = 28
        Height = 21
        TabOrder = 2
      end
      object edSity: TRzEdit
        Left = 229
        Top = 18
        Width = 100
        Height = 21
        TabOrder = 3
      end
    end
    object BitBtn2: TBitBtn
      Left = 508
      Top = 5
      Width = 37
      Height = 25
      Caption = #1054
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = BitBtn2Click
    end
  end
  object RzPanel2: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 358
    Width = 553
    Height = 41
    Align = alBottom
    BorderOuter = fsFlatRounded
    TabOrder = 1
    object btnSave: TBitBtn
      Left = 470
      Top = 6
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
end
