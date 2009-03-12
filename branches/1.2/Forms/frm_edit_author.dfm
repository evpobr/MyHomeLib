object frmEditAuthor: TfrmEditAuthor
  Left = 0
  Top = 0
  HelpContext = 117
  BorderStyle = bsDialog
  Caption = #1060'.'#1048'.'#1054
  ClientHeight = 125
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 1
    Width = 44
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object Label2: TLabel
    Left = 8
    Top = 46
    Width = 19
    Height = 13
    Caption = #1048#1084#1103
  end
  object Label3: TLabel
    Left = 151
    Top = 46
    Width = 49
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object btnSave: TRzBitBtn
    Left = 40
    Top = 92
    Default = True
    ModalResult = 1
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
  end
  object RzBitBtn2: TRzBitBtn
    Left = 184
    Top = 92
    Cancel = True
    ModalResult = 2
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
  end
  object edFamily: TRzEdit
    Left = 8
    Top = 19
    Width = 276
    Height = 21
    TabOrder = 2
  end
  object edName: TRzEdit
    Left = 8
    Top = 65
    Width = 137
    Height = 21
    TabOrder = 3
  end
  object edMiddle: TRzEdit
    Left = 151
    Top = 65
    Width = 133
    Height = 21
    TabOrder = 4
  end
end
