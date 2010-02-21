object frmGenreTree: TfrmGenreTree
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmGenreTree'
  ClientHeight = 394
  ClientWidth = 319
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
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 319
    Height = 394
    Align = alClient
    BorderOuter = fsGroove
    TabOrder = 0
    object RzPanel2: TRzPanel
      AlignWithMargins = True
      Left = 5
      Top = 339
      Width = 309
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
    object tvGenresTree: TVirtualStringTree
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 309
      Height = 328
      Align = alClient
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoColumnResize, hoDrag]
      TabOrder = 1
      TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
      OnGetText = tvGenresTreeGetText
      OnGetNodeDataSize = tvGenresTreeGetNodeDataSize
      Columns = <>
    end
  end
end
