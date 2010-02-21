object frmBookDetails: TfrmBookDetails
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmBookDetails'
  ClientHeight = 599
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 590
    Height = 599
    Align = alClient
    BorderOuter = fsFlatBold
    TabOrder = 0
    ExplicitHeight = 498
    object Img: TImage
      Left = 16
      Top = 16
      Width = 201
      Height = 281
      Hint = #1054#1073#1083#1086#1078#1082#1072
      Center = True
      ParentShowHint = False
      Proportional = True
      ShowHint = True
      Stretch = True
    end
    object RzLabel1: TRzLabel
      Left = 16
      Top = 303
      Width = 55
      Height = 13
      Caption = #1040#1085#1085#1086#1090#1072#1094#1080#1103
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 449
      Width = 47
      Height = 13
      Caption = #1056#1077#1094#1077#1085#1079#1080#1103
    end
    object RzBitBtn1: TRzBitBtn
      Left = 472
      Top = 559
      Width = 104
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = RzBitBtn1Click
      Kind = bkClose
    end
    object mmShort: TMemo
      Left = 16
      Top = 322
      Width = 560
      Height = 121
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object mmInfo: TMemo
      Left = 223
      Top = 16
      Width = 353
      Height = 281
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object mmReview: TMemo
      Left = 16
      Top = 472
      Width = 560
      Height = 81
      ScrollBars = ssVertical
      TabOrder = 3
      OnChange = mmReviewChange
    end
  end
end
