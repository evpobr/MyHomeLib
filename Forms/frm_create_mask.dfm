object frmCreateMask: TfrmCreateMask
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1086#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1096#1072#1073#1083#1086#1085#1072
  ClientHeight = 243
  ClientWidth = 434
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
    Left = 8
    Top = 40
    Width = 41
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1088':'
  end
  object Label2: TLabel
    Left = 58
    Top = 40
    Width = 85
    Height = 13
    Caption = '[%s [(%n) ]- ]%t'
  end
  object stDescription: TMHLStaticTip
    Left = 8
    Top = 59
    Width = 417
    Height = 137
    Caption = 
      'TODO - '#1080#1079#1084#1077#1085#1080#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1085#1072' '#1073#1086#1083#1077#1077' '#1082#1086#1088#1088#1077#1082#1090#1085#1086#1077#13#1055#1088#1072#1074#1080#1083#1072' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' ' +
      #1096#1072#1073#1083#1086#1085#1072':'#13'%f - '#1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1085#1080#1094#1080#1072#1083#1099' '#1072#1074#1090#1086#1088#1086#1074#13'%s - '#1085#1072#1079#1074#1072#1085#1080#1077' '#1089#1077#1088#1080#1080' '#1082#1085#1080 +
      #1075#13'%n - '#1085#1086#1084#1077#1088' '#1082#1085#1080#1075#1080' '#1074' '#1089#1077#1088#1080#1080#13'%t - '#1085#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080#13'[ ] - '#1073#1083#1086#1082' '#1101#1083#1077#1084#1077#1085 +
      #1090#1072' '#1096#1072#1073#1083#1086#1085#1072'. '#1042' '#1073#1083#1086#1082#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1086#1076#1080#1085' '#1101#1083#1077#1084#1077#1085#1090' '#1096#1072#1073#1083#1086#1085#1072'. '#1058#1072#1082#1078 +
      #1077' '#1088#1072#1079#1088#1077#1096#1072#1102#1090#1089#1103' '#1074#1083#1086#1078#1077#1085#1085#1099#1077' '#1073#1083#1086#1082#1080'. '#1045#1089#1083#1080' '#1101#1083#1077#1084#1077#1085#1090' '#1096#1072#1073#1083#1086#1085#1072' '#1085#1077' '#1080#1084#1077#1077#1090' '#1079#1085#1072 +
      #1095#1077#1085#1080#1103', '#1090#1086' '#1074#1077#1089#1100' '#1073#1083#1086#1082' '#1085#1077' '#1074#1099#1074#1086#1076#1080#1090#1089#1103'.'
  end
  object Label3: TLabel
    Left = 8
    Top = 16
    Width = 44
    Height = 13
    Caption = '&'#1064#1072#1073#1083#1086#1085':'
    FocusControl = edTemplate
  end
  object edTemplate: TEdit
    Left = 58
    Top = 13
    Width = 367
    Height = 21
    Margins.Top = 10
    TabOrder = 0
  end
  object pnButtons: TPanel
    Left = 0
    Top = 202
    Width = 434
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnButtons'
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 339
    ExplicitWidth = 313
    DesignSize = (
      434
      41)
    object btnOk: TButton
      Left = 270
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = RzBitBtn1Click
      ExplicitLeft = 149
    end
    object btnCancel: TButton
      Left = 351
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 230
    end
  end
end
