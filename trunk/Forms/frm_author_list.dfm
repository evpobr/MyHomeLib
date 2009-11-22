object frmAuthorList: TfrmAuthorList
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1057#1087#1080#1089#1086#1082' '#1072#1074#1090#1086#1088#1086#1074
  ClientHeight = 438
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel2: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 385
    Width = 301
    Height = 50
    Align = alBottom
    BorderOuter = fsFlatBold
    TabOrder = 0
    object RzBitBtn1: TRzBitBtn
      Left = 24
      Top = 16
      Default = True
      ModalResult = 1
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
    end
    object RzButton1: TRzButton
      Left = 216
      Top = 16
      Cancel = True
      ModalResult = 2
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
    end
  end
  object tvAuthorList: TVirtualStringTree
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 301
    Height = 376
    Align = alClient
    Header.AutoSizeIndex = 0
    Header.DefaultHeight = 17
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = [hoColumnResize, hoDrag]
    TabOrder = 1
    TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
    OnGetText = tvAuthorListGetText
    OnGetNodeDataSize = tvAuthorListGetNodeDataSize
    Columns = <>
  end
end
