object frmEditReader: TfrmEditReader
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1090#1080#1087#1072' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 98
  ClientWidth = 351
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
  object btnSave: TRzBitBtn
    Left = 187
    Top = 66
    Default = True
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object btnCancel: TRzBitBtn
    Left = 268
    Top = 66
    Cancel = True
    ModalResult = 2
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
  end
  object RzGroupBox1: TRzGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 345
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    object Label2: TLabel
      Left = 64
      Top = 8
      Width = 25
      Height = 13
      Caption = #1055#1091#1090#1100
    end
    object edExt: TRzEdit
      Left = 8
      Top = 27
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object edPath: TRzButtonEdit
      Left = 59
      Top = 27
      Width = 270
      Height = 21
      TabOrder = 1
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = edPathButtonClick
    end
  end
end
