object frmAbout: TfrmAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 317
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 208
    Height = 311
    Align = alClient
    BorderOuter = fsFlatRounded
    TabOrder = 0
    object RzURLLabel1: TRzURLLabel
      Left = 58
      Top = 237
      Width = 92
      Height = 13
      Alignment = taCenter
      Caption = 'http://home-lib.net'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object RzVersionInfoStatus1: TRzVersionInfoStatus
      Left = 54
      Top = 36
      Height = 32
      FrameStyle = fsNone
      FieldLabel = #1042#1077#1088#1089#1080#1103': '
      Alignment = taCenter
      Field = vifFileVersion
      VersionInfo = RzVersionInfo1
    end
    object RzLabel1: TRzLabel
      Left = 34
      Top = 11
      Width = 141
      Height = 29
      Alignment = taCenter
      Caption = 'MyHomeLib'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TextStyle = tsRaised
    end
    object RzLabel2: TRzLabel
      Left = 41
      Top = 64
      Width = 134
      Height = 13
      Alignment = taCenter
      Caption = '(c) 2010 '#1040#1083#1077#1082#1089#1077#1081' '#1055#1077#1085#1100#1082#1086#1074' '
    end
    object RzLabel3: TRzLabel
      Left = 47
      Top = 93
      Width = 115
      Height = 13
      Alignment = taCenter
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel4: TRzLabel
      Left = 59
      Top = 182
      Width = 84
      Height = 13
      Alignment = taCenter
      Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel5: TRzLabel
      Left = 60
      Top = 112
      Width = 90
      Height = 26
      Alignment = taCenter
      Caption = #1040#1083#1077#1082#1089#1077#1081' '#1055#1077#1085#1100#1082#1086#1074#13#1053#1080#1082#1086#1083#1072#1081' '#1056#1099#1084#1072#1085#1086#1074
    end
    object RzLabel6: TRzLabel
      Left = 41
      Top = 201
      Width = 137
      Height = 26
      Alignment = taCenter
      Caption = 'eg, Evgeniy_V, albert'#13' AlbanSpy, kaznelson, Olega'
    end
    object RzLabel7: TRzLabel
      Left = 76
      Top = 144
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'Icon Set:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel8: TRzLabel
      Left = 63
      Top = 163
      Width = 76
      Height = 13
      Alignment = taCenter
      Caption = #1040#1083#1077#1082#1089#1077#1081' '#1053#1077#1093#1072#1081
    end
    object RzBitBtn1: TRzBitBtn
      Left = 68
      Top = 280
      ModalResult = 1
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
    end
  end
  object RzVersionInfo1: TRzVersionInfo
    FilePath = 'myhomelib.exe'
    Left = 8
    Top = 248
  end
end
