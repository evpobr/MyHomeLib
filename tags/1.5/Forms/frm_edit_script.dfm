object frmEditScript: TfrmEditScript
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1082#1088#1080#1087#1090#1072
  ClientHeight = 140
  ClientWidth = 346
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
  object RzGroupBox1: TRzGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 340
    Height = 98
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label2: TLabel
      Left = 95
      Top = 8
      Width = 25
      Height = 13
      Caption = #1055#1091#1090#1100
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 57
      Height = 13
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
    end
    object edTitle: TRzEdit
      Left = 8
      Top = 27
      Width = 81
      Height = 21
      TabOrder = 0
    end
    object edPath: TRzButtonEdit
      Left = 95
      Top = 27
      Width = 234
      Height = 21
      TabOrder = 1
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = edPathButtonClick
    end
    object edParams: TRzEdit
      Left = 8
      Top = 67
      Width = 321
      Height = 21
      TabOrder = 2
    end
  end
  object btnSave: TRzBitBtn
    Left = 182
    Top = 107
    Default = True
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object RzBitBtn2: TRzBitBtn
    Left = 263
    Top = 107
    Cancel = True
    ModalResult = 2
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
  end
end
