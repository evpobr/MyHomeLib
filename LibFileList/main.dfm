object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' c'#1087#1080#1089#1082#1086#1074' MyHomeLib'
  ClientHeight = 386
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 256
    Width = 338
    Height = 127
    Align = alBottom
    TabOrder = 0
    object pbProgress: TRzProgressBar
      Left = 12
      Top = 61
      Width = 321
      BorderWidth = 0
      InteriorOffset = 0
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
    end
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 16
      Height = 13
      Alignment = taCenter
      Caption = '----'
    end
    object Label2: TLabel
      Left = 12
      Top = 35
      Width = 20
      Height = 13
      Caption = '-----'
    end
    object btnStart: TButton
      Left = 12
      Top = 92
      Width = 153
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      TabOrder = 0
      OnClick = btnStartClick
    end
    object btnStop: TButton
      Left = 177
      Top = 92
      Width = 75
      Height = 25
      Caption = #1057#1090#1086#1087
      Enabled = False
      TabOrder = 1
      OnClick = btnStopClick
    end
    object Button2: TButton
      Left = 258
      Top = 91
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object pcPages: TRzPageControl
    Left = 0
    Top = 0
    Width = 344
    Height = 253
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 1
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'fb2'
      object RzGroupBox1: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 334
        Height = 224
        Align = alTop
        Caption = 'xxxx-xxxx.inp'
        TabOrder = 0
        object Label3: TLabel
          Left = 250
          Top = 96
          Width = 28
          Height = 13
          Alignment = taCenter
          Caption = #1050#1085#1080#1075':'
        end
        object edURLfb2: TEdit
          Left = 8
          Top = 20
          Width = 321
          Height = 21
          TabOrder = 0
          Text = 'http://lib:8080/get_inp_usr.php'
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Extra'
      object pbDownload: TRzProgressBar
        AlignWithMargins = True
        Left = 3
        Top = 203
        Width = 334
        Align = alBottom
        BorderWidth = 0
        InteriorOffset = 0
        PartsComplete = 0
        Percent = 0
        TotalParts = 0
        ExplicitLeft = 12
        ExplicitTop = 61
        ExplicitWidth = 321
      end
      object Label4: TLabel
        Left = 0
        Top = 187
        Width = 340
        Height = 13
        Align = alBottom
        Alignment = taCenter
        Anchors = [akLeft, akBottom]
        Caption = '----'
        ExplicitWidth = 16
      end
      object mmLog: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 55
        Width = 334
        Height = 132
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
      end
      object RzGroupBox4: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 334
        Height = 46
        Align = alTop
        TabOrder = 1
        object edExtraURL: TEdit
          Left = 11
          Top = 16
          Width = 213
          Height = 21
          TabOrder = 0
          Text = 'http://lib/get_extra.php'
        end
        object edExtra: TEdit
          Left = 230
          Top = 16
          Width = 52
          Height = 21
          TabOrder = 1
          Text = '148523'
        end
        object cbFTP: TCheckBox
          Left = 288
          Top = 16
          Width = 81
          Height = 17
          Caption = 'FTP'
          TabOrder = 2
        end
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'USR'
      object edURLUSR: TEdit
        Left = 3
        Top = 12
        Width = 334
        Height = 21
        TabOrder = 0
        Text = 'http://lib:8080/get_inp_usr.php'
      end
    end
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 80
    Top = 168
  end
  object HTTP: TIdHTTP
    OnWork = HTTPWork
    OnWorkBegin = HTTPWorkBegin
    OnWorkEnd = HTTPWorkEnd
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 232
    Top = 128
  end
  object dlgOpen: TRzOpenDialog
    Options = [osoAllowMultiselect, osoHideReadOnly, osoAllowTree, osoShowHints, osoOleDrag, osoOleDrop, osoShowHidden]
    Filter = 'archives|*.zip'
    DefaultExt = 'zip'
    Left = 40
    Top = 160
  end
  object Zip: TZipMaster
    AddOptions = []
    AddStoreSuffixes = [assGIF, assPNG, assZ, assZIP, assZOO, assARC, assLZH, assARJ, assTAZ, assTGZ, assLHA, assRAR, assACE, assCAB, assGZ, assGZIP, assJAR, assEXE, assJPG, assJPEG, ass7Zp, assMP3, assWMV, assWMA, assDVR, assAVI]
    Dll_Load = False
    ExtrOptions = []
    KeepFreeOnAllDisks = 0
    KeepFreeOnDisk1 = 0
    MaxVolumeSize = 0
    PasswordReqCount = 1
    SFXOptions = []
    SFXOverWriteMode = OvrConfirm
    SFXPath = 'DZSFXUS.bin'
    SpanOptions = []
    Trace = False
    Unattended = False
    Verbose = False
    Version = '1.79.10.18'
    VersionInfo = '1.79.10.18'
    ZipFileName = '0.sql.gz'
    Left = 168
    Top = 136
  end
  object IdFTP: TIdFTP
    OnWorkBegin = IdFTPWorkBegin
    OnWorkEnd = IdFTPWorkEnd
    IPVersion = Id_IPv4
    AutoLogin = True
    TransferType = ftBinary
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 288
    Top = 120
  end
end
