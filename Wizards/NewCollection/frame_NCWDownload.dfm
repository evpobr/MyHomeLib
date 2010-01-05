inherited frameNCWDownload: TframeNCWDownload
  object lblS1: TLabel [0]
    AlignWithMargins = True
    Left = 3
    Top = 66
    Width = 314
    Height = 13
    Margins.Top = 10
    Margins.Bottom = 10
    Align = alTop
    Alignment = taCenter
    Caption = 'lblS1'
    ExplicitLeft = 0
    ExplicitTop = 56
    ExplicitWidth = 22
  end
  inherited pnTitle: TPanel
    inherited lblTitle: TLabel
      Width = 292
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1092#1072#1081#1083#1072' INPX'
      ExplicitWidth = 122
    end
    inherited lblSubTitle: TLabel
      Width = 285
      Caption = #1055#1086#1076#1086#1078#1076#1080#1090#1077', '#1087#1086#1082#1072' '#1092#1072#1081#1083' '#1073#1091#1076#1077#1090' '#1079#1072#1075#1088#1091#1078#1077#1085' '#1089' '#1089#1077#1088#1074#1077#1088#1072
      ExplicitWidth = 256
    end
  end
  object Bar: TProgressBar
    AlignWithMargins = True
    Left = 15
    Top = 94
    Width = 290
    Height = 17
    Margins.Left = 15
    Margins.Top = 5
    Margins.Right = 15
    Align = alTop
    TabOrder = 1
    ExplicitTop = 74
  end
  object HTTP: TIdHTTP
    OnWork = HTTPWork
    OnWorkBegin = HTTPWorkBegin
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 240
    Top = 168
  end
end
