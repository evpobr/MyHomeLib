object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  HelpContext = 144
  BorderStyle = bsToolWindow
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 473
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 422
    Width = 605
    Height = 48
    Align = alBottom
    BorderOuter = fsFlatRounded
    TabOrder = 0
    object btnSave: TRzBitBtn
      Left = 316
      Top = 11
      Width = 120
      Height = 28
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveClick
      Kind = bkOK
    end
    object btnCancel: TRzBitBtn
      Left = 466
      Top = 11
      Width = 120
      Height = 28
      Caption = #1053#1077' '#1089#1086#1093#1088#1072#1085#1103#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
    object btnHelp: TRzBitBtn
      Left = 5
      Top = 11
      Width = 120
      Height = 28
      Caption = #1057#1087#1088#1072#1074#1082#1072
      TabOrder = 2
      OnClick = btnHelpClick
      Kind = bkHelp
    end
  end
  object pcSetPages: TPageControl
    AlignWithMargins = True
    Left = 194
    Top = 3
    Width = 414
    Height = 413
    ActivePage = tsInternet
    Align = alClient
    TabOrder = 1
    object tsDevices: TTabSheet
      HelpContext = 143
      Caption = 'tsDevices'
      TabVisible = False
      object RzGroupBox3: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 191
        Width = 400
        Height = 142
        Align = alTop
        Caption = #1060#1086#1088#1084#1072#1090' '#1080#1084#1077#1085#1080
        TabOrder = 0
        object Label5: TLabel
          Left = 20
          Top = 29
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1072#1087#1082#1072': '
        end
        object Label6: TLabel
          Left = 25
          Top = 64
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = #1060#1072#1081#1083': '
        end
        object tbtnInsert1: TRzToolButton
          Tag = 41
          Left = 64
          Top = 88
          Width = 33
          Hint = #1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1084#1103' '#1072#1074#1090#1086#1088#1072
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%f'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object tbtnInsert2: TRzToolButton
          Tag = 42
          Left = 103
          Top = 88
          Width = 33
          Hint = #1053#1072#1079#1074#1072#1085#1080#1077
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%t'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object tbtnInsert3: TRzToolButton
          Tag = 43
          Left = 142
          Top = 88
          Width = 33
          Hint = #1057#1077#1088#1080#1103
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%s '
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object tbtnInsert4: TRzToolButton
          Tag = 44
          Left = 181
          Top = 88
          Width = 33
          Hint = #1053#1086#1084#1077#1088' '#1074' '#1089#1077#1088#1080#1080
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%n'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton1: TRzToolButton
          Tag = 45
          Left = 220
          Top = 88
          Width = 33
          Hint = 'Id '#1082#1085#1080#1075#1080
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%id'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton2: TRzToolButton
          Tag = 46
          Left = 259
          Top = 88
          Width = 33
          Hint = #1046#1072#1085#1088
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%g'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton3: TRzToolButton
          Tag = 47
          Left = 298
          Top = 88
          Width = 33
          Hint = #1055#1077#1088#1074#1072#1103' '#1073#1091#1082#1074#1072#13#1092#1072#1084#1080#1083#1080#1080' '#1072#1074#1090#1086#1088#1072
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%fl'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object edFolderTemplate: TRzEdit
          Tag = 785
          Left = 64
          Top = 26
          Width = 313
          Height = 21
          Text = '%f\%s'
          TabOrder = 0
        end
        object edFileNameTemplate: TRzEdit
          Tag = 785
          Left = 64
          Top = 61
          Width = 313
          Height = 21
          Text = '%n%t'
          TabOrder = 1
        end
        object cbTranslit: TCheckBox
          Left = 20
          Top = 115
          Width = 294
          Height = 27
          Caption = #1058#1088#1072#1085#1089#1083#1080#1090#1077#1088#1072#1094#1080#1103' '#1080#1084#1077#1085' '#1087#1072#1087#1086#1082' '#1080' '#1092#1072#1081#1083#1086#1074
          TabOrder = 2
          WordWrap = True
        end
      end
      object RzGroupBox4: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 400
        Height = 69
        Align = alTop
        Caption = #1055#1072#1087#1082#1072' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1077' '
        TabOrder = 1
        object edDeviceDir: TRzButtonEdit
          Left = 11
          Top = 18
          Width = 374
          Height = 21
          HelpContext = 5001
          TabOrder = 0
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edDeviceDirButtonClick
        end
        object cbPromptPath: TCheckBox
          Left = 13
          Top = 45
          Width = 278
          Height = 20
          Caption = #1057#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1087#1091#1090#1100' '#1082#1072#1078#1076#1099#1081' '#1088#1072#1079
          TabOrder = 1
          WordWrap = True
        end
      end
      object rgDeviceFormat: TRadioGroup
        AlignWithMargins = True
        Left = 3
        Top = 135
        Width = 400
        Height = 50
        Align = alTop
        Caption = #1060#1086#1088#1084#1072#1090' '#1079#1072#1087#1080#1089#1080' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
        Columns = 6
        ItemIndex = 0
        Items.Strings = (
          '.fb2'
          '.fb2.zip'
          '.lrf '
          '.txt'
          '.epub'
          '.pdf')
        TabOrder = 2
      end
      object RzGroupBox5: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 339
        Width = 400
        Height = 61
        Align = alClient
        Caption = #1054#1087#1094#1080#1080
        TabOrder = 3
        object Label1: TLabel
          Left = 181
          Top = 26
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072' TXT'
        end
        object cbSquareFilter: TCheckBox
          Left = 11
          Top = 20
          Width = 150
          Height = 27
          Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' "[ ... ]"'
          TabOrder = 0
          WordWrap = True
        end
        object cbTXTEncoding: TRzComboBox
          Left = 264
          Top = 23
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'UTF-8'
          Items.Strings = (
            'UTF-8'
            'Windows-1251')
        end
      end
      object RzGroupBox11: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 78
        Width = 400
        Height = 51
        Align = alTop
        Caption = #1055#1072#1087#1082#1072' "'#1076#1083#1103' '#1095#1090#1077#1085#1080#1103'"'
        TabOrder = 4
        object edReadDir: TRzButtonEdit
          Left = 11
          Top = 18
          Width = 374
          Height = 21
          HelpContext = 5001
          TabOrder = 0
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edDeviceDirButtonClick
        end
      end
    end
    object tsReaders: TTabSheet
      HelpContext = 137
      Caption = 'tsReaders'
      ImageIndex = 1
      TabVisible = False
      object RzGroupBox8: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 400
        Height = 397
        Align = alClient
        Caption = #1058#1080#1087#1099' '#1092#1072#1081#1083#1086#1074' '#1080' '#1087#1088#1086#1089#1084#1086#1090#1088#1097#1080#1082#1080
        TabOrder = 0
        object lvReaders: TRzListView
          Left = 6
          Top = 24
          Width = 379
          Height = 325
          Columns = <
            item
              Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1080#1077
              Width = 80
            end
            item
              Caption = #1055#1091#1090#1100
              Width = 265
            end>
          EditOnRowClick = True
          FillLastColumn = False
          FlatScrollBars = True
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ShowWorkAreas = True
          TabOrder = 2
          ViewStyle = vsReport
          OnDblClick = btnChangeExtClick
        end
        object btnDeleteExt: TRzBitBtn
          Left = 312
          Top = 355
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 3
          OnClick = btnDeleteExtClick
        end
        object btnChangeExt: TRzBitBtn
          Left = 87
          Top = 355
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          OnClick = btnChangeExtClick
        end
        object btnAddExt: TRzBitBtn
          Left = 6
          Top = 355
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnAddExtClick
        end
      end
    end
    object tsInterface: TTabSheet
      HelpContext = 132
      Caption = 'tsInterface'
      ImageIndex = 2
      TabVisible = False
      object RzGroupBox6: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 400
        Height = 397
        Align = alClient
        Caption = #1057#1087#1080#1089#1082#1080
        TabOrder = 0
        object Label9: TLabel
          Left = 19
          Top = 45
          Width = 138
          Height = 13
          Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072' '#1072#1085#1085#1086#1090#1072#1094#1080#1080' '
        end
        object Label7: TLabel
          Left = 24
          Top = 15
          Width = 133
          Height = 13
          Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072' '#1074' '#1089#1087#1080#1089#1082#1072#1093' '
        end
        object pnlASG: TRzPanel
          Left = 24
          Top = 97
          Width = 350
          Height = 25
          BorderOuter = fsFlatBold
          Caption = #1057#1087#1080#1089#1086#1082' '#1072#1074#1090#1086#1088#1086#1074'/'#1057#1077#1088#1080#1081'/'#1046#1072#1085#1088#1086#1074
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = pnlCAClick
        end
        object pnlCT: TRzPanel
          Left = 24
          Top = 128
          Width = 174
          Height = 25
          BorderOuter = fsFlatBold
          Caption = #1050#1085#1080#1075#1072' '#1073#1077#1079' '#1089#1077#1088#1080#1080
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = pnlCAClick
        end
        object pnlBS: TRzPanel
          Left = 204
          Top = 128
          Width = 170
          Height = 25
          BorderOuter = fsFlatBold
          Caption = #1050#1085#1080#1075#1072' '#1074#1085#1091#1090#1088#1080' '#1089#1077#1088#1080#1080
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = pnlCAClick
        end
        object pnlCS: TRzPanel
          Left = 204
          Top = 66
          Width = 170
          Height = 25
          BorderOuter = fsFlatBold
          Caption = #1057#1077#1088#1080#1103
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = pnlCAClick
        end
        object pnlCA: TRzPanel
          Left = 24
          Top = 66
          Width = 174
          Height = 25
          BorderOuter = fsFlatBold
          Caption = #1040#1074#1090#1086#1088
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = pnlCAClick
        end
        object seShortFontSize: TRzSpinEdit
          Left = 163
          Top = 39
          Width = 47
          Height = 21
          Max = 20.000000000000000000
          Min = 6.000000000000000000
          Value = 10.000000000000000000
          TabOrder = 5
        end
        object seFontSize: TRzSpinEdit
          Left = 163
          Top = 12
          Width = 47
          Height = 21
          Max = 20.000000000000000000
          Min = 6.000000000000000000
          Value = 10.000000000000000000
          TabOrder = 6
        end
        object Button1: TButton
          Left = 229
          Top = 10
          Width = 137
          Height = 25
          Caption = #1062#1074#1077#1090' '#1096#1088#1080#1092#1090#1072
          TabOrder = 7
          OnClick = Button1Click
        end
        object pnlDwnld: TRzPanel
          Left = 24
          Top = 185
          Width = 174
          Height = 25
          BorderOuter = fsFlatBold
          Caption = #1057#1082#1072#1095#1072#1085#1085#1099#1077
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = pnlDwnldClick
        end
        object pnlDeleted: TRzPanel
          Left = 204
          Top = 185
          Width = 170
          Height = 25
          BorderOuter = fsFlatBold
          Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1077' '#1085#1072' lib.rus.ec'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = pnlDwnldClick
        end
        object RzPanel5: TRzPanel
          Left = 24
          Top = 216
          Width = 174
          Height = 25
          BorderOuter = fsFlatBold
          Caption = #1055#1088#1086#1095#1080#1090#1072#1085#1085#1099#1077
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          Visible = False
          OnClick = pnlDwnldClick
        end
      end
    end
    object tsInternet: TTabSheet
      HelpContext = 133
      Caption = 'tsInternet'
      ImageIndex = 4
      TabVisible = False
      object RzGroupBox1: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 93
        Width = 400
        Height = 113
        Align = alTop
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1082#1089#1080
        TabOrder = 0
        object RzLabel1: TRzLabel
          Left = 16
          Top = 50
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = #1057#1077#1088#1074#1077#1088
          Color = clMenuBar
          ParentColor = False
          Transparent = True
          ShadowColor = clMenuBar
        end
        object RzLabel2: TRzLabel
          Left = 289
          Top = 50
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1088#1090
          Color = clMenuBar
          ParentColor = False
          Transparent = True
        end
        object RzLabel3: TRzLabel
          Left = 16
          Top = 81
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          Color = clMenuBar
          ParentColor = False
          Transparent = True
        end
        object RzLabel4: TRzLabel
          Left = 237
          Top = 81
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1072#1088#1086#1083#1100
          Color = clMenuBar
          ParentColor = False
          Transparent = True
        end
        object edProxyServer: TRzEdit
          Left = 59
          Top = 47
          Width = 214
          Height = 21
          TabOrder = 0
        end
        object edProxyUsername: TRzEdit
          Left = 94
          Top = 75
          Width = 115
          Height = 21
          TabOrder = 1
        end
        object edProxyPassword: TRzMaskEdit
          Left = 280
          Top = 74
          Width = 105
          Height = 21
          PasswordChar = #7
          TabOrder = 2
        end
        object edProxyPort: TRzNumericEdit
          Left = 320
          Top = 47
          Width = 65
          Height = 21
          TabOrder = 3
          CheckRange = True
          Max = 65535.000000000000000000
          DisplayFormat = '0'
        end
        object cbUseIESettings: TCheckBox
          Left = 16
          Top = 21
          Width = 337
          Height = 17
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' Internet Explorer'
          TabOrder = 4
          OnClick = cbUseIESettingsClick
        end
      end
      object RzGroupBox2: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 400
        Height = 84
        Align = alTop
        Caption = #1057#1077#1088#1074#1077#1088' lib.rus.ec'
        TabOrder = 1
        object RzLabel6: TRzLabel
          Left = 237
          Top = 52
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1072#1088#1086#1083#1100
          Color = clMenuBar
          ParentColor = False
          Transparent = True
        end
        object RzLabel5: TRzLabel
          Left = 16
          Top = 51
          Width = 93
          Height = 13
          Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          Transparent = True
        end
        object edLibUserName: TRzEdit
          Left = 112
          Top = 48
          Width = 115
          Height = 21
          TabOrder = 0
        end
        object edDownloadServer: TRzComboBox
          Left = 16
          Top = 21
          Width = 369
          Height = 21
          AutoComplete = False
          TabOrder = 1
          Text = 'http://lib.rus.ec/'
          Items.Strings = (
            'http://lib.rus.ec/'
            'http://lib.ololo.cc/')
        end
        object edLibPassword: TRzMaskEdit
          Left = 280
          Top = 48
          Width = 105
          Height = 21
          PasswordChar = #7
          TabOrder = 2
        end
      end
      object RzGroupBox9: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 212
        Width = 400
        Height = 109
        Align = alTop
        Caption = #1057#1077#1088#1074#1077#1088' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
        TabOrder = 2
        object edUpdates: TEdit
          Left = 16
          Top = 23
          Width = 369
          Height = 21
          TabOrder = 0
          Text = 'http://home-lib.net/update/'
        end
        object cbCheckColUpdate: TCheckBox
          Left = 16
          Top = 50
          Width = 337
          Height = 17
          Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1082#1072#1090#1072#1083#1086#1075#1072' lib.rus.ec '#1087#1088#1080' '#1079#1072#1087#1091#1089#1082#1077
          TabOrder = 1
        end
        object cbUpdates: TCheckBox
          Left = 16
          Top = 90
          Width = 353
          Height = 17
          Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1085#1072#1083#1080#1095#1080#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1087#1088#1080' '#1079#1072#1087#1091#1089#1082#1077
          TabOrder = 2
        end
        object cbAutoRunUpdate: TCheckBox
          Left = 16
          Top = 70
          Width = 337
          Height = 17
          Caption = #1047#1072#1087#1091#1089#1082#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1072#1090#1072#1083#1086#1075#1072' lib.rus.ec '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
          TabOrder = 3
        end
      end
      object RzGroupBox10: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 327
        Width = 400
        Height = 73
        Align = alClient
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
        TabOrder = 3
        object RzLabel7: TRzLabel
          Left = 16
          Top = 22
          Width = 131
          Height = 13
          Alignment = taRightJustify
          Caption = #1058#1072#1081#1084'-'#1072#1091#1090' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' ('#1084#1089')'
          Color = clMenuBar
          ParentColor = False
          Transparent = True
        end
        object RzLabel8: TRzLabel
          Left = 40
          Top = 46
          Width = 107
          Height = 13
          Alignment = taRightJustify
          Caption = #1058#1072#1081#1084'-'#1072#1091#1090' '#1095#1090#1077#1085#1080#1103' ('#1084#1089')'
          Color = clMenuBar
          ParentColor = False
          Transparent = True
        end
        object RzLabel9: TRzLabel
          Left = 252
          Top = 22
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = #1048#1085#1090#1077#1088#1074#1072#1083' ('#1084#1089')'
          Color = clMenuBar
          ParentColor = False
          Transparent = True
        end
        object edTimeOut: TRzNumericEdit
          Left = 153
          Top = 19
          Width = 65
          Height = 21
          TabOrder = 0
          CheckRange = True
          Max = 100000.000000000000000000
          Min = 1000.000000000000000000
          Value = 10000.000000000000000000
          DisplayFormat = ',0;(,0)'
        end
        object edReadTimeOut: TRzNumericEdit
          Left = 153
          Top = 43
          Width = 65
          Height = 21
          TabOrder = 1
          CheckRange = True
          Max = 100000.000000000000000000
          Min = 1000.000000000000000000
          Value = 10000.000000000000000000
          DisplayFormat = ',0;(,0)'
        end
        object edDwnldInterval: TRzNumericEdit
          Left = 329
          Top = 19
          Width = 65
          Height = 21
          TabOrder = 2
          CheckRange = True
          Max = 900000.000000000000000000
          Value = 10000.000000000000000000
          DisplayFormat = ',0;(,0)'
        end
      end
    end
    object tsScripts: TTabSheet
      HelpContext = 140
      Caption = 'tsScripts'
      ImageIndex = 4
      TabVisible = False
      object RzGroupBox523324: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 400
        Height = 333
        Align = alClient
        Caption = #1057#1082#1088#1080#1087#1090#1099
        TabOrder = 0
        object lvScripts: TRzListView
          AlignWithMargins = True
          Left = 4
          Top = 17
          Width = 392
          Height = 278
          Align = alTop
          Columns = <
            item
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 80
            end
            item
              Caption = #1055#1091#1090#1100
              Width = 150
            end
            item
              Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
              Width = 135
            end>
          EditOnRowClick = True
          FillLastColumn = False
          FlatScrollBars = True
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ShowWorkAreas = True
          TabOrder = 2
          ViewStyle = vsReport
          OnDblClick = btnEditScriptClick
        end
        object btnDeleteScript: TRzBitBtn
          Left = 312
          Top = 300
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 3
          OnClick = btnDeleteScriptClick
        end
        object btnEditScript: TRzBitBtn
          Left = 87
          Top = 300
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          OnClick = btnEditScriptClick
        end
        object btnAddScript: TRzBitBtn
          Left = 6
          Top = 300
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnAddScriptClick
        end
      end
      object RzGroupBox5343245: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 342
        Width = 400
        Height = 58
        Align = alBottom
        Caption = #1044#1077#1081#1089#1090#1074#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        TabOrder = 1
        object cbDefaultAction: TComboBox
          Left = 6
          Top = 24
          Width = 379
          Height = 21
          TabOrder = 0
          Text = #1057#1090#1072#1085#1076#1072#1088#1090#1085#1086#1077
        end
      end
    end
    object tsBehavour: TTabSheet
      Caption = 'tsBehavior'
      ImageIndex = 5
      TabVisible = False
      object RzGroupBox7: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 400
        Height = 397
        Align = alClient
        Caption = #1055#1086#1074#1077#1076#1077#1085#1080#1077
        TabOrder = 0
        object cbShowSubGenreBooks: TCheckBox
          Left = 24
          Top = 26
          Width = 281
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1080#1075#1080' '#1080#1079' '#1074#1083#1086#1078#1077#1085#1085#1099#1093' '#1078#1072#1085#1088#1086#1074' ('#1085#1077'-fb2)'
          TabOrder = 0
        end
        object cbMinimizeToTray: TCheckBox
          Left = 24
          Top = 48
          Width = 177
          Height = 17
          Caption = #1057#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1074' '#1090#1088#1077#1081
          TabOrder = 1
        end
        object cbAutoStartDwnld: TCheckBox
          Left = 24
          Top = 69
          Width = 257
          Height = 17
          Caption = #1057#1090#1072#1088#1090#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1095#1082#1080' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
          TabOrder = 2
        end
        object cbShowFb2Info: TCheckBox
          Left = 24
          Top = 92
          Width = 281
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1080#1079' fb2 '
          TabOrder = 3
        end
        object cbAllowMixedCollections: TCheckBox
          Left = 24
          Top = 115
          Width = 281
          Height = 17
          Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1089#1084#1077#1096#1072#1085#1085#1099#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
          TabOrder = 4
        end
        object cbDeleteDeleted: TCheckBox
          Left = 24
          Top = 138
          Width = 281
          Height = 17
          Caption = #1059#1076#1072#1083#1103#1090#1100' "'#1091#1076#1072#1083#1077#1085#1099#1077' '#1085#1072' '#1083#1080#1073#1088#1091#1089#1077#1082#1077'"'
          TabOrder = 5
        end
        object cbAutoLoadReview: TCheckBox
          Left = 24
          Top = 161
          Width = 281
          Height = 17
          Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1088#1077#1094#1077#1085#1079#1080#1080
          TabOrder = 6
        end
      end
    end
    object tsFileSort: TTabSheet
      Caption = 'tsFileSort'
      ImageIndex = 6
      TabVisible = False
      object RzGroupBox12: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 244
        Width = 400
        Height = 126
        Align = alTop
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' FBD'
        TabOrder = 0
        object Label2: TLabel
          Left = 20
          Top = 29
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1072#1087#1082#1072': '
        end
        object Label3: TLabel
          Left = 25
          Top = 64
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = #1060#1072#1081#1083': '
        end
        object RzToolButton4: TRzToolButton
          Tag = 41
          Left = 64
          Top = 88
          Width = 33
          Hint = #1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1084#1103' '#1072#1074#1090#1086#1088#1072
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%f'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton5: TRzToolButton
          Tag = 42
          Left = 103
          Top = 88
          Width = 33
          Hint = #1053#1072#1079#1074#1072#1085#1080#1077
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%t'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton6: TRzToolButton
          Tag = 43
          Left = 142
          Top = 88
          Width = 33
          Hint = #1057#1077#1088#1080#1103
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%s '
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton7: TRzToolButton
          Tag = 44
          Left = 181
          Top = 88
          Width = 33
          Hint = #1053#1086#1084#1077#1088' '#1074' '#1089#1077#1088#1080#1080
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%n'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton8: TRzToolButton
          Tag = 48
          Left = 220
          Top = 88
          Width = 33
          Hint = #1050#1086#1088#1085#1077#1074#1086#1081' '#1078#1072#1085#1088
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%rg'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton9: TRzToolButton
          Tag = 46
          Left = 259
          Top = 88
          Width = 33
          Hint = #1046#1072#1085#1088
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%g'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton10: TRzToolButton
          Tag = 47
          Left = 298
          Top = 88
          Width = 33
          Hint = #1055#1077#1088#1074#1072#1103' '#1073#1091#1082#1074#1072#13#1092#1072#1084#1080#1083#1080#1080' '#1072#1074#1090#1086#1088#1072
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%fl'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object edFBDFolderTemplate: TRzEdit
          Tag = 785
          Left = 64
          Top = 26
          Width = 313
          Height = 21
          Text = '%g\%s'
          TabOrder = 0
        end
        object edFBDFileTemplate: TRzEdit
          Tag = 785
          Left = 64
          Top = 61
          Width = 313
          Height = 21
          TabOrder = 1
        end
      end
      object RzGroupBox13: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 112
        Width = 400
        Height = 126
        Align = alTop
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' FB2'
        TabOrder = 1
        object Label4: TLabel
          Left = 20
          Top = 29
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1072#1087#1082#1072': '
        end
        object Label8: TLabel
          Left = 25
          Top = 64
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = #1060#1072#1081#1083': '
        end
        object RzToolButton11: TRzToolButton
          Tag = 41
          Left = 64
          Top = 88
          Width = 33
          Hint = #1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1084#1103' '#1072#1074#1090#1086#1088#1072
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%f'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton12: TRzToolButton
          Tag = 42
          Left = 103
          Top = 88
          Width = 33
          Hint = #1053#1072#1079#1074#1072#1085#1080#1077
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%t'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton13: TRzToolButton
          Tag = 43
          Left = 142
          Top = 88
          Width = 33
          Hint = #1057#1077#1088#1080#1103
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%s '
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton14: TRzToolButton
          Tag = 44
          Left = 181
          Top = 88
          Width = 33
          Hint = #1053#1086#1084#1077#1088' '#1074' '#1089#1077#1088#1080#1080
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%n'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton15: TRzToolButton
          Tag = 48
          Left = 220
          Top = 88
          Width = 33
          Hint = #1050#1086#1088#1085#1077#1074#1086#1081' '#1078#1072#1085#1088
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%rg'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton16: TRzToolButton
          Tag = 46
          Left = 259
          Top = 88
          Width = 33
          Hint = #1046#1072#1085#1088
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%g'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object RzToolButton17: TRzToolButton
          Tag = 47
          Left = 298
          Top = 88
          Width = 33
          Hint = #1055#1077#1088#1074#1072#1103' '#1073#1091#1082#1074#1072#13#1092#1072#1084#1080#1083#1080#1080' '#1072#1074#1090#1086#1088#1072
          Flat = False
          ShowCaption = True
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          Caption = '%fl'
          ParentShowHint = False
          ShowHint = True
          OnClick = tbtnInsert1Click
        end
        object edFB2FolderTemplate: TRzEdit
          Tag = 785
          Left = 64
          Top = 26
          Width = 313
          Height = 21
          TabOrder = 0
        end
        object edFB2FileTemplate: TRzEdit
          Tag = 785
          Left = 64
          Top = 61
          Width = 313
          Height = 21
          TabOrder = 1
        end
      end
      object RzGroupBox14: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 400
        Height = 46
        Align = alTop
        Caption = #1054#1087#1094#1080#1080
        TabOrder = 2
        object cbEnableFileSort: TCheckBox
          Left = 11
          Top = 12
          Width = 206
          Height = 27
          Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1091' '#1087#1088#1080' '#1080#1084#1087#1086#1088#1090#1077
          TabOrder = 0
          WordWrap = True
        end
      end
      object RzGroupBox15: TRzGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 55
        Width = 400
        Height = 51
        Align = alTop
        Caption = #1055#1072#1087#1082#1072
        TabOrder = 3
        object edInputFolder: TRzButtonEdit
          Left = 11
          Top = 18
          Width = 374
          Height = 21
          HelpContext = 5001
          TabOrder = 0
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edDeviceDirButtonClick
        end
      end
    end
  end
  object RzPanel2: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 185
    Height = 413
    Align = alLeft
    BorderOuter = fsFlatRounded
    TabOrder = 2
    object tvSections: TRzTreeView
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 175
      Height = 403
      SelectionPen.Color = clBtnShadow
      Align = alClient
      Indent = 19
      RowSelect = True
      TabOrder = 0
      OnChange = tvSectionsChange
      Items.NodeData = {
        03070000003E0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000
        000000000001101F0430043F043A0438042F0023044104420440043E04390441
        04420432043004340000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00
        00000000000000010B220438043F044B0420004404300439043B043E04320430
        0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000001
        0918043D0442043504400444043504390441042E0000000000000000000000FF
        FFFFFFFFFFFFFFFFFFFFFF0000000000000000010818043D044204350440043D
        04350442042C0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000
        0000000000010721043A04400438043F0442044B042A00000000000000000000
        00FFFFFFFFFFFFFFFF00000000000000000000000001062004300437043D043E
        043504400000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        000000011121043E0440044204380440043E0432043A04300420004404300439
        043B043E043204}
    end
  end
  object dlgColors: TColorDialog
    Left = 32
    Top = 176
  end
  object dlgSelectDir: TRzSelDirDialog
    CenterToParent = True
    Position = poOwnerFormCenter
    AllowCreate = True
    ButtonGlyphs = True
    ChangeCurrentDir = False
    DriveTypes = [dtFloppy, dtFixed, dtNetwork, dtRAM]
    OpenCurrentDir = True
    AutoSelect = True
    Prompt = #1048#1084#1103' '#1087#1072#1087#1082#1080
    PromptFolders = #1055#1072#1087#1082#1080
    PromptDrives = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1072
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1072#1087#1082#1091
    CaptionOK = 'OK'
    CaptionCancel = #1054#1090#1084#1077#1085#1072
    CaptionHelp = '&'#1057#1087#1088#1072#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    FrameVisible = True
    Left = 96
    Top = 176
  end
end
