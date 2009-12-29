object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'SQL 2 INPX: librusec'
  ClientHeight = 465
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 446
    Width = 669
    Height = 19
    Panels = <>
  end
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 669
    Height = 446
    ActivePage = tsParams
    Align = alClient
    TabOrder = 1
    object tsParams: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 2
      object edTitle: TLabeledEdit
        Left = 11
        Top = 24
        Width = 286
        Height = 21
        EditLabel.Width = 87
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        TabOrder = 0
        Text = #1051#1086#1082#1072#1083#1100#1085#1072#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1103' Lib.rus.ec'
      end
      object edInpxName: TLabeledEdit
        Left = 11
        Top = 72
        Width = 118
        Height = 21
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = 'Inpx'
        TabOrder = 1
        Text = 'librusec'
      end
      object edUpdateName: TLabeledEdit
        Left = 175
        Top = 72
        Width = 158
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = 'Update'
        TabOrder = 2
        Text = 'librusec_update'
      end
      object edExtraName: TLabeledEdit
        Left = 455
        Top = 112
        Width = 110
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'Extra'
        TabOrder = 3
        Text = 'extra_update'
      end
      object edURL: TLabeledEdit
        Left = 11
        Top = 120
        Width = 322
        Height = 21
        EditLabel.Width = 19
        EditLabel.Height = 13
        EditLabel.Caption = 'URL'
        TabOrder = 4
        Text = 'http://lib.rus.ec/'
      end
      object edSQLUrl: TLabeledEdit
        Left = 11
        Top = 176
        Width = 170
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = 'SQL dump url'
        TabOrder = 5
        Text = 'http://lib.rus.ec/sql/'
      end
      object edDBName: TLabeledEdit
        Left = 187
        Top = 176
        Width = 127
        Height = 21
        EditLabel.Width = 14
        EditLabel.Height = 13
        EditLabel.Caption = #1041#1044
        TabOrder = 6
        Text = 'librusec'
      end
      object mmTables: TMemo
        Left = 11
        Top = 216
        Width = 303
        Height = 169
        Lines.Strings = (
          'lib.libgenrelist.sql.gz'
          'lib.libbook.sql.gz'
          'lib.libavtoraliase.sql.gz'
          'lib.libavtorname.sql.gz'
          'lib.libavtor.sql.gz'
          'lib.libgenre.sql.gz'
          'lib.libseq.sql.gz'
          'lib.libseqname.sql.gz'
          'lib.libfilename.sql.gz'
          'lib.librate.sql.gz')
        TabOrder = 7
      end
      object mmScript: TMemo
        Left = 320
        Top = 176
        Width = 329
        Height = 209
        Lines.Strings = (
          'ADD name %USER%'
          'ADD password %PASS%'
          'POST %URL%b/%LIBID%/get'
          'GET %RESURL%'
          'CHECK')
        TabOrder = 8
      end
      object edStartID: TLabeledEdit
        Left = 571
        Top = 112
        Width = 74
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = 'Extra start ID'
        TabOrder = 9
        Text = '175951'
      end
      object edCode: TLabeledEdit
        Left = 511
        Top = 24
        Width = 66
        Height = 21
        EditLabel.Width = 20
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1086#1076
        TabOrder = 10
        Text = '134283264'
      end
      object edDescr: TLabeledEdit
        Left = 303
        Top = 24
        Width = 202
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        TabOrder = 11
        Text = #1040#1088#1093#1080#1074#1099' '#1089#1072#1081#1090#1072' lib.rus.ec [fb2] '
      end
      object edExtraInfo: TLabeledEdit
        Left = 455
        Top = 72
        Width = 110
        Height = 21
        EditLabel.Width = 76
        EditLabel.Height = 13
        EditLabel.Caption = 'Extra info name'
        TabOrder = 12
        Text = 'last_extra.info'
      end
      object cbFb2Only: TCheckBox
        Left = 583
        Top = 26
        Width = 97
        Height = 17
        Caption = #1058#1086#1083#1100#1082#1086' fb2'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
      object edInfoName: TLabeledEdit
        Left = 339
        Top = 72
        Width = 110
        Height = 21
        EditLabel.Width = 50
        EditLabel.Height = 13
        EditLabel.Caption = 'Info Name'
        TabOrder = 14
        Text = 'last_librusec.info'
      end
      object cbMaxCompress: TCheckBox
        Left = 135
        Top = 74
        Width = 26
        Height = 17
        Caption = '"9"'
        Checked = True
        State = cbChecked
        TabOrder = 15
      end
      object cbOldFormat: TCheckBox
        Left = 583
        Top = 72
        Width = 97
        Height = 17
        Caption = 'Old format'
        Checked = True
        State = cbChecked
        TabOrder = 16
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1099
      ImageIndex = 1
      object DBGrid3: TDBGrid
        Left = 329
        Top = 345
        Width = 320
        Height = 70
        DataSource = Lib.dsGenrelist
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid4: TDBGrid
        Left = 329
        Top = 270
        Width = 320
        Height = 69
        DataSource = Lib.dsSeqname
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SeqName'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SeqNumb'
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 3
        Top = 270
        Width = 320
        Height = 145
        DataSource = Lib.dsAvtorname
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'FirstName'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MiddleName'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LastName'
            Width = 100
            Visible = True
          end>
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 34
        Width = 646
        Height = 230
        DataSource = Lib.dsBook
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'BookId'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Title'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FileSize'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Lang'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Deleted'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Time'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Title1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FileType'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Year'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ver'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FileAuthor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'N'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'keywords'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Blocked'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'md5'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Broken'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Modified'
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 3
        Top = 3
        Width = 240
        Height = 25
        DataSource = Lib.dsBook
        TabOrder = 4
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1051#1086#1075
      object lblS1: TLabel
        Left = 312
        Top = 383
        Width = 22
        Height = 13
        Caption = 'lblS1'
      end
      object lblS2: TLabel
        Left = 312
        Top = 402
        Width = 22
        Height = 13
        Caption = 'lblS2'
      end
      object mmLog: TMemo
        Left = 0
        Top = 3
        Width = 664
        Height = 374
        Lines.Strings = (
          '')
        TabOrder = 0
      end
      object Bar: TProgressBar
        Left = 5
        Top = 388
        Width = 278
        Height = 23
        TabOrder = 1
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 600
    Top = 312
    object N1: TMenuItem
      Caption = #1055#1088#1086#1092#1080#1083#1100
      OnClick = apSaveExecute
      object N8: TMenuItem
        Caption = #1053#1086#1074#1099#1081
      end
      object N9: TMenuItem
        Action = apLoad
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        ShortCut = 114
      end
      object N16: TMenuItem
        Action = apSave
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
      end
      object N10: TMenuItem
        Action = apSaveAs
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
        ShortCut = 113
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #1042#1099#1093#1086#1076
      end
    end
    object N5: TMenuItem
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080
      object Fb21: TMenuItem
        Action = aopFB2
        Caption = #1040#1088#1093#1080#1074#1099
      end
      object Online1: TMenuItem
        Action = aopOnLine
      end
      object Extra1: TMenuItem
        Action = aopExtra
        Caption = 'Extra'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object ExtraFTP1: TMenuItem
        Action = aopExtraFTP
        Caption = 'Extra -> FTP'
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      end
    end
    object N13: TMenuItem
      Caption = #1041#1072#1079#1072
      object N14: TMenuItem
        Action = dbImport
      end
      object N15: TMenuItem
        Action = dbConnect
      end
    end
    object N2: TMenuItem
      Caption = '?'
      object N12: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      end
    end
  end
  object ActionList1: TActionList
    Left = 536
    Top = 312
    object aopFB2: TAction
      Category = 'Operation'
      Caption = 'Fb2'
      OnExecute = aopFB2Execute
    end
    object dbImport: TAction
      Category = 'Database'
      Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1084#1087#1072
      OnExecute = dbImportExecute
    end
    object aopExtra: TAction
      Category = 'Operation'
      Caption = 'aopExtra'
      OnExecute = aopExtraExecute
    end
    object aopExtraFTP: TAction
      Category = 'Operation'
      Caption = 'aopExtraFTP'
      OnExecute = aopExtraFTPExecute
    end
    object apSaveAs: TAction
      Category = 'Profile'
      Caption = 'apSave'
      OnExecute = apSaveAsExecute
    end
    object apLoad: TAction
      Category = 'Profile'
      Caption = 'apLoad'
      OnExecute = apLoadExecute
    end
    object dbConnect: TAction
      Category = 'Database'
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
      OnExecute = dbConnectExecute
    end
    object aopOnLine: TAction
      Category = 'Operation'
      Caption = 'On-Line'
      OnExecute = aopOnLineExecute
    end
    object apSave: TAction
      Category = 'Profile'
      Caption = 'apSave'
      OnExecute = apSaveExecute
    end
  end
  object Zip: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clFastest
    CompressionMode = 1
    CurrentVersion = '5.02 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = False
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.FlushBuffers = True
    Options.OEMFileNames = False
    InMemory = False
    Zip64Mode = zmDisabled
    UnicodeFilenames = True
    EncryptionMethod = caPkzipClassic
    Left = 528
    Top = 368
  end
  object dlgOpen: TOpenDialog
    Filter = 'zip|*.zip'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 392
    Top = 360
  end
  object idFTP: TIdFTP
    IPVersion = Id_IPv4
    AutoLogin = True
    TransferType = ftBinary
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 568
    Top = 368
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
    Left = 616
    Top = 368
  end
  object dlgSave: TSaveDialog
    DefaultExt = 'profile'
    Filter = 'Profile|*.profile'
    Left = 344
    Top = 360
  end
end
