object frmEditor: TfrmEditor
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = '   '#1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090
  ClientHeight = 322
  ClientWidth = 245
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmMemo: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 82
    Width = 239
    Height = 210
    Margins.Bottom = 30
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitWidth = 200
    ExplicitHeight = 223
  end
  object RzBitBtn1: TRzBitBtn
    Left = 65
    Top = 296
    Width = 127
    TabOrder = 1
    OnClick = RzBitBtn1Click
    Kind = bkOK
  end
  object RzGroupBox4: TRzGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 0
    Width = 239
    Height = 76
    Margins.Top = 0
    Align = alTop
    Alignment = taCenter
    TabOrder = 2
    ExplicitLeft = 58
    ExplicitTop = -8
    ExplicitWidth = 375
    object btnInsertFilterTemplate: TRzToolButton
      Tag = 50
      Left = 10
      Top = 11
      Width = 31
      Flat = False
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = 'LIKE'
      OnClick = btnInsertFilterTemplateClick
    end
    object RzToolButton3: TRzToolButton
      Tag = 52
      Left = 84
      Top = 42
      Width = 31
      Flat = False
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = '<>'
      OnClick = btnInsertFilterTemplateClick
    end
    object RzToolButton6: TRzToolButton
      Tag = 55
      Left = 47
      Top = 11
      Width = 31
      Flat = False
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = '()'
      OnClick = btnInsertFilterTemplateClick
    end
    object RzToolButton5: TRzToolButton
      Tag = 54
      Left = 121
      Top = 11
      Width = 31
      Flat = False
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = '>'
      OnClick = btnInsertFilterTemplateClick
    end
    object RzToolButton4: TRzToolButton
      Tag = 53
      Left = 84
      Top = 11
      Width = 31
      Flat = False
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = '<'
      OnClick = btnInsertFilterTemplateClick
    end
    object RzToolButton7: TRzToolButton
      Tag = 56
      Left = 10
      Top = 42
      Width = 31
      Flat = False
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = 'AND'
      OnClick = btnInsertFilterTemplateClick
    end
    object RzToolButton8: TRzToolButton
      Tag = 57
      Left = 47
      Top = 42
      Width = 31
      Flat = False
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = 'OR'
      OnClick = btnInsertFilterTemplateClick
    end
    object RzToolButton9: TRzToolButton
      Tag = 58
      Left = 158
      Top = 42
      Width = 31
      Flat = False
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = 'NOT'
      OnClick = btnInsertFilterTemplateClick
    end
    object RzToolButton1: TRzToolButton
      Tag = 59
      Left = 121
      Top = 42
      Width = 31
      Flat = False
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = '" "'
      OnClick = btnInsertFilterTemplateClick
    end
  end
end
