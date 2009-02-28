object frmBookDetails: TfrmBookDetails
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmBookDetails'
  ClientHeight = 498
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
    Height = 498
    Align = alClient
    BorderOuter = fsFlatBold
    TabOrder = 0
    ExplicitWidth = 564
    ExplicitHeight = 313
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
    object RzBitBtn1: TRzBitBtn
      Left = 472
      Top = 463
      Width = 104
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = RzBitBtn1Click
      Kind = bkClose
    end
    object mmShort: TMemo
      Left = 16
      Top = 303
      Width = 560
      Height = 154
      ReadOnly = True
      TabOrder = 1
    end
    object mmInfo: TMemo
      Left = 223
      Top = 16
      Width = 353
      Height = 281
      ReadOnly = True
      TabOrder = 2
    end
  end
  object XML: TXMLDocument
    Left = 488
    Top = 272
    DOMVendorDesc = 'MSXML'
  end
end
