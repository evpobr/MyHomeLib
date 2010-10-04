object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  HelpContext = 144
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 565
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object pcSetPages: TPageControl
    AlignWithMargins = True
    Left = 208
    Top = 4
    Width = 595
    Height = 503
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tsDevices
    Align = alClient
    TabOrder = 1
    object tsDevices: TTabSheet
      HelpContext = 143
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'tsDevices'
      TabVisible = False
      object pnDeviceOptions: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 80
        Width = 579
        Height = 465
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 1
        object Label16: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 571
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 89
        end
        object pnDeviceDir: TPanel
          Left = 0
          Top = 26
          Width = 579
          Height = 93
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          DesignSize = (
            579
            93)
          object Label14: TLabel
            AlignWithMargins = True
            Left = 12
            Top = 4
            Width = 563
            Height = 18
            Margins.Left = 12
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #1055#1072#1087#1082#1072' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1077' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 165
          end
          object btnDeviceDir: TButton
            Left = 469
            Top = 60
            Width = 99
            Height = 33
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Anchors = [akTop, akRight]
            Caption = #1042#1099#1073#1088#1072#1090#1100
            TabOrder = 2
            OnClick = SelectFolder
          end
          object cbPromptPath: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 30
            Width = 555
            Height = 26
            Margins.Left = 20
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #1057#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1087#1091#1090#1100' '#1082#1072#1078#1076#1099#1081' '#1088#1072#1079
            TabOrder = 0
            WordWrap = True
            OnClick = cbPromptPathClick
          end
          object edDeviceDir: TMHLAutoCompleteEdit
            Left = 20
            Top = 63
            Width = 442
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
        end
        object pnFileFormat: TPanel
          Left = 0
          Top = 119
          Width = 579
          Height = 67
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 1
          object Label17: TLabel
            AlignWithMargins = True
            Left = 12
            Top = 12
            Width = 563
            Height = 18
            Margins.Left = 12
            Margins.Top = 12
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #1060#1086#1088#1084#1072#1090' '#1079#1072#1087#1080#1089#1080' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 230
          end
          object rgDeviceFormat: TComboBox
            AlignWithMargins = True
            Left = 20
            Top = 38
            Width = 550
            Height = 25
            Margins.Left = 20
            Margins.Top = 4
            Margins.Right = 9
            Margins.Bottom = 4
            Align = alTop
            Style = csDropDownList
            TabOrder = 0
            Items.Strings = (
              '.fb2'
              '.fb2.zip'
              '.lrf '
              '.txt'
              '.epub'
              '.pdf')
          end
        end
        object pnNameFormat: TPanel
          Left = 0
          Top = 186
          Width = 579
          Height = 102
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 2
          DesignSize = (
            579
            102)
          object Label18: TLabel
            AlignWithMargins = True
            Left = 12
            Top = 12
            Width = 563
            Height = 18
            Margins.Left = 12
            Margins.Top = 12
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #1060#1086#1088#1084#1072#1090' '#1080#1084#1077#1085#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 111
          end
          object Label19: TLabel
            Left = 22
            Top = 41
            Width = 47
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = #1055#1072#1087#1082#1072': '
          end
          object Label20: TLabel
            Left = 21
            Top = 76
            Width = 42
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = #1060#1072#1081#1083': '
          end
          object btnFolderTemplate: TButton
            Left = 469
            Top = 34
            Width = 99
            Height = 33
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Anchors = [akTop, akRight]
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100
            TabOrder = 1
            OnClick = EditFolderTemplate
          end
          object btnFileNameTemplate: TButton
            Left = 469
            Top = 69
            Width = 99
            Height = 33
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Anchors = [akTop, akRight]
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100
            TabOrder = 3
            OnClick = EditFileNameTemplate
          end
          object edFolderTemplate: TEdit
            Left = 77
            Top = 37
            Width = 385
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Anchors = [akLeft, akTop, akRight]
            ReadOnly = True
            TabOrder = 0
            Text = '%f\%s'
          end
          object edFileNameTemplate: TEdit
            Left = 77
            Top = 72
            Width = 385
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Anchors = [akLeft, akTop, akRight]
            ReadOnly = True
            TabOrder = 2
            Text = '%n%t'
          end
        end
        object pnOtherOpt: TPanel
          Left = 0
          Top = 288
          Width = 579
          Height = 142
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 3
          DesignSize = (
            579
            142)
          object Label5: TLabel
            AlignWithMargins = True
            Left = 12
            Top = 12
            Width = 563
            Height = 18
            Margins.Left = 12
            Margins.Top = 12
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #1055#1088#1086#1095#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 56
          end
          object Label1: TLabel
            Left = 24
            Top = 85
            Width = 102
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072' TXT:'
          end
          object cbSquareFilter: TCheckBox
            AlignWithMargins = True
            Left = 20
            Top = 38
            Width = 555
            Height = 35
            Margins.Left = 20
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' "[ ... ]"'
            TabOrder = 0
            WordWrap = True
          end
          object cbTXTEncoding: TComboBox
            Left = 133
            Top = 81
            Width = 435
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 0
            TabOrder = 1
            Text = 'UTF-8'
            Items.Strings = (
              'UTF-8'
              'Windows-1251')
          end
        end
      end
      object pnReadDir: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 579
        Height = 60
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 12
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          579
          60)
        object Label15: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 571
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1055#1072#1087#1082#1072' "'#1076#1083#1103' '#1095#1090#1077#1085#1080#1103'"'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 153
        end
        object edReadDir: TMHLAutoCompleteEdit
          Left = 12
          Top = 30
          Width = 450
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          TextHint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1072#1087#1082#1091' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        end
        object btnSelectReadDir: TButton
          Left = 469
          Top = 27
          Width = 99
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1073#1088#1072#1090#1100
          TabOrder = 1
          OnClick = SelectFolder
        end
      end
    end
    object tsReaders: TTabSheet
      HelpContext = 137
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'tsReaders'
      ImageIndex = 1
      TabVisible = False
      object Label11: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 579
        Height = 18
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Caption = #1058#1080#1087#1099' '#1092#1072#1081#1083#1086#1074' '#1080' '#1087#1088#1086#1089#1084#1086#1090#1088#1097#1080#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 234
      end
      object Panel1: TPanel
        Left = 0
        Top = 450
        Width = 587
        Height = 43
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 1
        object btnAddExt: TButton
          Left = 4
          Top = 4
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnAddExtClick
        end
        object btnChangeExt: TButton
          Left = 110
          Top = 4
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          OnClick = btnChangeExtClick
        end
        object btnDeleteExt: TButton
          Left = 216
          Top = 4
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 2
          OnClick = btnDeleteExtClick
        end
      end
      object lvReaders: TListView
        AlignWithMargins = True
        Left = 4
        Top = 30
        Width = 579
        Height = 416
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Columns = <
          item
            Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1080#1077
            Width = 105
          end
          item
            AutoSize = True
            Caption = #1055#1091#1090#1100
          end>
        ColumnClick = False
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = btnChangeExtClick
      end
    end
    object tsInterface: TTabSheet
      HelpContext = 132
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'tsInterface'
      ImageIndex = 2
      TabVisible = False
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 579
        Height = 213
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        object Label31: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 571
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1064#1088#1080#1092#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 55
        end
        object Label7: TLabel
          Left = 12
          Top = 33
          Width = 172
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072' '#1074' '#1089#1087#1080#1089#1082#1072#1093':'
          FocusControl = edFontSize
        end
        object Label9: TLabel
          Left = 12
          Top = 68
          Width = 179
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072' '#1072#1085#1085#1086#1090#1072#1094#1080#1080':'
          FocusControl = edShortFontSize
        end
        object Button1: TButton
          Left = 292
          Top = 99
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 5
          OnClick = SetDefaultFontColor
        end
        object pnDeletedFontColor: TPanel
          Left = 12
          Top = 180
          Width = 272
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1077' '#1074' '#1086#1085#1083#1072#1081#1085' '#1073#1080#1073#1083#1080#1086#1090#1077#1082#1077
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object pnDownloadedFontColor: TPanel
          Left = 12
          Top = 140
          Width = 272
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #1057#1082#1072#1095#1072#1085#1085#1099#1077' '#1082#1085#1080#1075#1080
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edFontSize: TEdit
          Left = 201
          Top = 29
          Width = 62
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 0
          Text = '10'
          OnExit = CheckNumValue
        end
        object edShortFontSize: TEdit
          Left = 201
          Top = 64
          Width = 62
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 2
          Text = '10'
          OnExit = CheckNumValue
        end
        object udFontSize: TUpDown
          Left = 263
          Top = 29
          Width = 21
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Associate = edFontSize
          Min = 6
          Max = 20
          Position = 10
          TabOrder = 1
        end
        object udShortFontSize: TUpDown
          Left = 263
          Top = 64
          Width = 21
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Associate = edShortFontSize
          Min = 6
          Max = 20
          Position = 10
          TabOrder = 3
        end
        object pnDefaultFontColor: TPanel
          Left = 12
          Top = 99
          Width = 272
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #1062#1074#1077#1090' '#1096#1088#1080#1092#1090#1072' '#1089#1087#1080#1089#1082#1086#1074
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object btnDownloadedFontColor: TButton
          Left = 292
          Top = 140
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 7
          OnClick = SetCustomFontColor
        end
        object btnDeletedFontColor: TButton
          Left = 292
          Top = 180
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 9
          OnClick = SetCustomFontColor
        end
      end
      object Panel10: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 225
        Width = 579
        Height = 247
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 1
        object Label32: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 571
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 83
        end
        object btnCA: TButton
          Left = 292
          Top = 29
          Width = 98
          Height = 32
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          OnClick = SetBackgroundColor
        end
        object btnCS: TButton
          Left = 292
          Top = 69
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 3
          OnClick = SetBackgroundColor
        end
        object btnASG: TButton
          Left = 292
          Top = 110
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 5
          OnClick = SetBackgroundColor
        end
        object pnASG: TPanel
          Left = 12
          Top = 110
          Width = 272
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #1057#1087#1080#1089#1086#1082' '#1072#1074#1090#1086#1088#1086#1074'/'#1057#1077#1088#1080#1081'/'#1046#1072#1085#1088#1086#1074
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
        object pnBS: TPanel
          Left = 12
          Top = 191
          Width = 272
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #1050#1085#1080#1075#1072' '#1074#1085#1091#1090#1088#1080' '#1089#1077#1088#1080#1080
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 8
        end
        object pnCA: TPanel
          Left = 12
          Top = 29
          Width = 272
          Height = 32
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #1040#1074#1090#1086#1088
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
        end
        object pnCS: TPanel
          Left = 12
          Top = 69
          Width = 272
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #1057#1077#1088#1080#1103
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
        end
        object pnCT: TPanel
          Left = 12
          Top = 150
          Width = 272
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = #1050#1085#1080#1075#1072' '#1073#1077#1079' '#1089#1077#1088#1080#1080
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 6
        end
        object btnCT: TButton
          Left = 292
          Top = 150
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 7
          OnClick = SetBackgroundColor
        end
        object btnBS: TButton
          Left = 292
          Top = 191
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 9
          OnClick = SetBackgroundColor
        end
      end
    end
    object tsInternet: TTabSheet
      HelpContext = 133
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'tsInternet'
      ImageIndex = 4
      TabVisible = False
      object Panel5: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 579
        Height = 122
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          579
          122)
        object Label25: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 571
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1082#1089#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 139
        end
        object lblProxyPassword: TLabel
          Left = 369
          Top = 101
          Width = 52
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1055#1072#1088#1086#1083#1100':'
          Color = clMenuBar
          FocusControl = edProxyPassword
          ParentColor = False
          Transparent = True
          ExplicitLeft = 367
        end
        object lblProxyPort: TLabel
          Left = 434
          Top = 65
          Width = 38
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1055#1086#1088#1090':'
          Color = clMenuBar
          FocusControl = edProxyPort
          ParentColor = False
          Transparent = True
          ExplicitLeft = 432
        end
        object lblProxyServer: TLabel
          Left = 20
          Top = 65
          Width = 51
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1057#1077#1088#1074#1077#1088':'
          Color = clMenuBar
          FocusControl = edProxyServer
          ParentColor = False
          Transparent = True
        end
        object lblProxyUser: TLabel
          Left = 20
          Top = 101
          Width = 95
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
          Color = clMenuBar
          FocusControl = edProxyUsername
          ParentColor = False
          Transparent = True
        end
        object cbUseIESettings: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 30
          Width = 563
          Height = 22
          Margins.Left = 12
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' Internet Explorer'
          TabOrder = 0
          OnClick = cbUseIESettingsClick
        end
        object edProxyPassword: TEdit
          Left = 431
          Top = 97
          Width = 137
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          PasswordChar = '*'
          TabOrder = 4
        end
        object edProxyPort: TEdit
          Left = 479
          Top = 61
          Width = 89
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          MaxLength = 5
          NumbersOnly = True
          TabOrder = 2
          OnExit = CheckNumValue
        end
        object edProxyServer: TEdit
          Left = 81
          Top = 61
          Width = 337
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object edProxyUsername: TEdit
          Left = 127
          Top = 97
          Width = 227
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 130
        Width = 587
        Height = 230
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 1
        DesignSize = (
          587
          230)
        object Label27: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 12
          Width = 579
          Height = 18
          Margins.Left = 4
          Margins.Top = 12
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 184
        end
        object Label26: TLabel
          Left = 16
          Top = 41
          Width = 152
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1055#1072#1087#1082#1072' '#1089' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103#1084#1080':'
          FocusControl = edUpdateDir
        end
        object Label28: TLabel
          Left = 16
          Top = 77
          Width = 84
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1057#1077#1088#1074#1077#1088' INPX:'
          FocusControl = edINPXUrl
        end
        object Label29: TLabel
          Left = 16
          Top = 112
          Width = 133
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1057#1077#1088#1074#1077#1088' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081':'
          FocusControl = edUpdates
        end
        object edUpdateDir: TMHLAutoCompleteEdit
          Left = 178
          Top = 37
          Width = 288
          Height = 25
          HelpContext = 5001
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          TextHint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1072#1087#1082#1091' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        end
        object btnUpdateDir: TButton
          Left = 474
          Top = 34
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1073#1088#1072#1090#1100
          TabOrder = 1
          OnClick = SelectFolder
        end
        object edINPXUrl: TMHLAutoCompleteEdit
          Left = 178
          Top = 73
          Width = 394
          Height = 25
          HelpContext = 5001
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          AutoCompleteOption = [acoURLHistory, acoURLMRU]
        end
        object edUpdates: TMHLAutoCompleteEdit
          Left = 178
          Top = 109
          Width = 394
          Height = 25
          HelpContext = 5001
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          AutoCompleteOption = [acoURLHistory, acoURLMRU]
        end
        object cbAutoRunUpdate: TCheckBox
          AlignWithMargins = True
          Left = 16
          Top = 174
          Width = 557
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          Caption = #1047#1072#1087#1091#1089#1082#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1072#1090#1072#1083#1086#1075#1072' '#1086#1085#1083#1072#1081#1085' '#1073#1080#1073#1083#1080#1086#1090#1077#1082' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
          TabOrder = 5
        end
        object cbCheckColUpdate: TCheckBox
          AlignWithMargins = True
          Left = 16
          Top = 144
          Width = 557
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1082#1072#1090#1072#1083#1086#1075#1072' '#1086#1085#1083#1072#1081#1085' '#1073#1080#1073#1083#1080#1086#1090#1077#1082' '#1087#1088#1080' '#1079#1072#1087#1091#1089#1082#1077
          TabOrder = 4
        end
        object cbUpdates: TCheckBox
          AlignWithMargins = True
          Left = 16
          Top = 204
          Width = 557
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1085#1072#1083#1080#1095#1080#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1087#1088#1080' '#1079#1072#1087#1091#1089#1082#1077
          TabOrder = 6
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 360
        Width = 587
        Height = 121
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 2
        object Label30: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 12
          Width = 579
          Height = 18
          Margins.Left = 4
          Margins.Top = 12
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 184
        end
        object RzLabel7: TLabel
          Left = 12
          Top = 41
          Width = 175
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = #1058#1072#1081#1084'-'#1072#1091#1090' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' ('#1084#1089'):'
          Color = clMenuBar
          FocusControl = edTimeOut
          ParentColor = False
          Transparent = True
        end
        object RzLabel8: TLabel
          Left = 42
          Top = 76
          Width = 145
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = #1058#1072#1081#1084'-'#1072#1091#1090' '#1095#1090#1077#1085#1080#1103' ('#1084#1089'):'
          Color = clMenuBar
          FocusControl = edReadTimeOut
          ParentColor = False
          Transparent = True
        end
        object RzLabel9: TLabel
          Left = 325
          Top = 41
          Width = 97
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = #1048#1085#1090#1077#1088#1074#1072#1083' ('#1084#1089'):'
          Color = clMenuBar
          FocusControl = edDwnldInterval
          ParentColor = False
          Transparent = True
        end
        object edDwnldInterval: TEdit
          Left = 430
          Top = 37
          Width = 85
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 2
          Text = '0'
          OnExit = CheckNumValue
        end
        object edReadTimeOut: TEdit
          Left = 195
          Top = 72
          Width = 85
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 4
          Text = '1,000'
          OnExit = CheckNumValue
        end
        object edTimeOut: TEdit
          Left = 195
          Top = 37
          Width = 85
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 0
          Text = '1,000'
          OnChange = edTimeOutChange
          OnExit = CheckNumValue
        end
        object udTimeOut: TUpDown
          Left = 280
          Top = 37
          Width = 21
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Associate = edTimeOut
          Min = 1000
          Max = 100000
          Increment = 1000
          Position = 1000
          TabOrder = 1
        end
        object udReadTimeOut: TUpDown
          Left = 280
          Top = 72
          Width = 21
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Associate = edReadTimeOut
          Min = 1000
          Max = 100000
          Increment = 1000
          Position = 1000
          TabOrder = 5
        end
        object udDwnldInterval: TUpDown
          Left = 515
          Top = 37
          Width = 21
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Associate = edDwnldInterval
          Max = 900000
          Increment = 1000
          TabOrder = 3
        end
      end
    end
    object tsScripts: TTabSheet
      HelpContext = 140
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'tsScripts'
      ImageIndex = 4
      TabVisible = False
      object Label12: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 579
        Height = 18
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Caption = #1057#1082#1088#1080#1087#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 68
      end
      object Panel2: TPanel
        Left = 0
        Top = 403
        Width = 587
        Height = 90
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 1
        DesignSize = (
          587
          90)
        object Label13: TLabel
          Left = 4
          Top = 58
          Width = 166
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1044#1077#1081#1089#1090#1074#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
          FocusControl = cbDefaultAction
        end
        object btnAddScript: TButton
          Left = 4
          Top = 4
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnAddScriptClick
        end
        object btnEditScript: TButton
          Left = 110
          Top = 4
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          OnClick = btnEditScriptClick
        end
        object btnDeleteScript: TButton
          Left = 216
          Top = 4
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 2
          OnClick = btnDeleteScriptClick
        end
        object cbDefaultAction: TComboBox
          Left = 179
          Top = 54
          Width = 404
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
      end
      object lvScripts: TListView
        AlignWithMargins = True
        Left = 4
        Top = 30
        Width = 579
        Height = 369
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Columns = <
          item
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 105
          end
          item
            AutoSize = True
            Caption = #1055#1091#1090#1100
          end
          item
            Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
            Width = 177
          end>
        ColumnClick = False
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = btnEditScriptClick
      end
    end
    object tsBehavour: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'tsBehavior'
      ImageIndex = 5
      TabVisible = False
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 579
        Height = 416
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 12
        Align = alTop
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          579
          416)
        object Label6: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 571
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1055#1086#1074#1077#1076#1077#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          ExplicitWidth = 85
        end
        object Label10: TLabel
          Left = 68
          Top = 281
          Width = 123
          Height = 34
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = #1064#1072#1073#1083#1086#1085' '#1079#1072#1075#1086#1083#1086#1074#1082#1072' '#1082#1085#1080#1075#1080':'
          WordWrap = True
        end
        object cbShowSubGenreBooks: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 30
          Width = 563
          Height = 22
          Margins.Left = 12
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1080#1075#1080' '#1080#1079' '#1074#1083#1086#1078#1077#1085#1085#1099#1093' '#1078#1072#1085#1088#1086#1074' ('#1085#1077'-fb2)'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
        end
        object cbMinimizeToTray: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 60
          Width = 563
          Height = 22
          Margins.Left = 12
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1057#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1074' '#1090#1088#1077#1081
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
        end
        object cbAutoStartDwnld: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 90
          Width = 563
          Height = 22
          Margins.Left = 12
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1057#1090#1072#1088#1090#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1095#1082#1080' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
          TabOrder = 2
        end
        object cbAllowMixedCollections: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 120
          Width = 563
          Height = 22
          Margins.Left = 12
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1089#1084#1077#1096#1072#1085#1085#1099#1077' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
          Color = clBtnFace
          ParentColor = False
          TabOrder = 3
        end
        object cbDeleteDeleted: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 150
          Width = 563
          Height = 22
          Margins.Left = 12
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1059#1076#1072#1083#1103#1090#1100' "'#1091#1076#1072#1083#1077#1085#1099#1077' '#1074' '#1073#1080#1073#1083#1080#1086#1090#1077#1082#1077'"'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 4
        end
        object cbAutoLoadReview: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 180
          Width = 563
          Height = 22
          Margins.Left = 12
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1088#1077#1094#1077#1085#1079#1080#1080
          Color = clBtnFace
          ParentColor = False
          TabOrder = 5
        end
        object cbDeleteFiles: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 210
          Width = 563
          Height = 22
          Margins.Left = 12
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1059#1076#1072#1083#1103#1090#1100' '#1092#1072#1081#1083#1099' '#1087#1088#1080' '#1091#1076#1072#1083#1077#1085#1080#1080' '#1082#1085#1080#1075
          Color = clBtnFace
          ParentColor = False
          TabOrder = 6
        end
        object cbOverwriteFB2Info: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 248
          Width = 563
          Height = 22
          Margins.Left = 12
          Margins.Top = 12
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1055#1077#1088#1077#1079#1072#1087#1080#1089#1099#1074#1072#1090#1100' '#1079#1072#1075#1086#1083#1086#1074#1086#1082' fb2'
          TabOrder = 7
          OnClick = cbOverwriteFB2InfoClick
        end
        object edTitleTemplate: TEdit
          Left = 199
          Top = 277
          Width = 265
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          TabOrder = 8
          Text = '[%s [(%n) ]- ]%t'
        end
        object btnTitleTemplate: TButton
          Left = 471
          Top = 275
          Width = 99
          Height = 32
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 9
          OnClick = EditTextTemplate
        end
      end
    end
    object tsFileSort: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'tsFileSort'
      ImageIndex = 6
      TabVisible = False
      object Panel4: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 579
        Height = 322
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 12
        Align = alTop
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          579
          322)
        object Label21: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 571
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1048#1084#1087#1086#1088#1090' '#1092#1072#1081#1083#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 122
        end
        object Label22: TLabel
          Left = 20
          Top = 76
          Width = 43
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1055#1072#1087#1082#1072':'
          FocusControl = edImportFolder
        end
        object Label23: TLabel
          Left = 20
          Top = 107
          Width = 550
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' FB2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 548
        end
        object Label4: TLabel
          Left = 30
          Top = 136
          Width = 47
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = #1055#1072#1087#1082#1072': '
          FocusControl = edFB2FolderTemplate
        end
        object Label8: TLabel
          Left = 29
          Top = 171
          Width = 42
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = #1060#1072#1081#1083': '
          FocusControl = edFB2FileTemplate
        end
        object Label24: TLabel
          Left = 20
          Top = 203
          Width = 550
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' FBD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 548
        end
        object Label2: TLabel
          Left = 30
          Top = 231
          Width = 47
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = #1055#1072#1087#1082#1072': '
          FocusControl = edFBDFolderTemplate
        end
        object Label3: TLabel
          Left = 29
          Top = 267
          Width = 42
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          Caption = #1060#1072#1081#1083': '
          FocusControl = edFBDFileTemplate
        end
        object btnImportFolder: TButton
          Left = 471
          Top = 69
          Width = 99
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1073#1088#1072#1090#1100
          TabOrder = 2
          OnClick = SelectFolder
        end
        object cbEnableFileSort: TCheckBox
          AlignWithMargins = True
          Left = 12
          Top = 30
          Width = 563
          Height = 35
          Margins.Left = 12
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1091' '#1087#1088#1080' '#1080#1084#1087#1086#1088#1090#1077
          TabOrder = 0
          WordWrap = True
          OnClick = cbEnableFileSortClick
        end
        object edImportFolder: TMHLAutoCompleteEdit
          Left = 73
          Top = 72
          Width = 391
          Height = 25
          HelpContext = 5001
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object edFB2FileTemplate: TEdit
          Tag = 785
          Left = 85
          Top = 167
          Width = 379
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          TabOrder = 5
        end
        object edFB2FolderTemplate: TEdit
          Tag = 785
          Left = 85
          Top = 132
          Width = 379
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          TabOrder = 3
        end
        object edFBDFileTemplate: TEdit
          Tag = 785
          Left = 85
          Top = 263
          Width = 379
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          TabOrder = 9
        end
        object edFBDFolderTemplate: TEdit
          Tag = 785
          Left = 85
          Top = 228
          Width = 379
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          TabOrder = 7
          Text = '%g\%s'
        end
        object btnFB2FolderTemplate: TButton
          Left = 471
          Top = 129
          Width = 99
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 4
          OnClick = EditFolderTemplate
        end
        object btnFB2FileTemplate: TButton
          Left = 471
          Top = 165
          Width = 99
          Height = 32
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 6
          OnClick = EditFileNameTemplate
        end
        object btnFBDFileTemplate: TButton
          Left = 471
          Top = 260
          Width = 99
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 10
          OnClick = EditFileNameTemplate
        end
        object btnFBDFolderTemplate: TButton
          Left = 471
          Top = 225
          Width = 99
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 8
          OnClick = EditFolderTemplate
        end
      end
    end
  end
  object pnButtons: TPanel
    Left = 0
    Top = 511
    Width = 807
    Height = 54
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnButtons'
    ShowCaption = False
    TabOrder = 2
    DesignSize = (
      807
      54)
    object btnOk: TButton
      Left = 592
      Top = 13
      Width = 98
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = SaveSettingsClick
    end
    object btnCancel: TButton
      Left = 698
      Top = 13
      Width = 98
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object btnHelp: TButton
      Left = 16
      Top = 13
      Width = 98
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1057#1087#1088#1072#1074#1082#1072
      TabOrder = 2
      OnClick = ShowHelpClick
    end
  end
  object tvSections: TTreeView
    AlignWithMargins = True
    Left = 4
    Top = 7
    Width = 196
    Height = 499
    Margins.Left = 4
    Margins.Top = 7
    Margins.Right = 4
    Margins.Bottom = 5
    Align = alLeft
    HideSelection = False
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
  object dlgColors: TColorDialog
    Left = 32
    Top = 176
  end
end
