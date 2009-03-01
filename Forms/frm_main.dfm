object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'MyHomeLib'
  ClientHeight = 772
  ClientWidth = 942
  Color = clBtnFace
  Constraints.MinHeight = 700
  Constraints.MinWidth = 950
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Enabled = True
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000000000000000000000000000000000000000007F7F
    7F0100000002000000040000001436363672525252C7464545D8434242DB4342
    41DB424141D8494848CF646464BE3636366E0000001300000004151515020000
    000F000000160000001A000000213D3D3D6EA7A6A5DAC6C2BFFFBCB8B5FFBCB8
    B5FFC1BEBBFF969493DC797979A83D3D3D660000001F000000160000000F0000
    003A000000520000005B0000005E0000006C7B7B7AC1C1BEBAFFBEBBB7FFBEBB
    B7FFC3C0BCFF7B7B7BC20000006F000000610000005C000000520000003A6C6B
    6AABCECCC9FFCDCCC9FFCDCBC9FFCDCBC9FFCCCAC8FF9B9894FF928F8AFF928F
    8AFF9B9893FFCCCAC7FFCDCBC8FFCDCBC8FFCDCBC8FFCCCBC8FF666564AB5352
    50B1D1CECBFFCDCAC8FFCAC7C5FFC8C5C3FFC8C5C3FFC8C5C3FFC8C5C3FFC8C5
    C3FFC8C5C3FFC8C4C2FFC6C3C0FFC3C0BDFFBFBDB9FFBCB9B5FF4B4947B15553
    52B2B7B8BDFFA6AAB1FFA2A7ADFFA0A4ABFF9EA3AAFF9EA3AAFF9EA3AAFF9EA3
    AAFF9EA3AAFF9EA3AAFF9DA1A8FF9A9EA4FF95999FFF9A9B9EFF494745B25856
    55B2416489FF2B62DAFF666A8AFFA9947BFF6D626FFF5A5DD6FF282BAEFF3F82
    6FFF347037FF67AABDFF609FBEFF978A7AFF978470FF475E6DFF4B4947B25B58
    58B2446C93FF3475F4FF7F7591FFD7AB80FF846A70FF7676F3FF3838C7FF4893
    76FF3A7E34FF7DBECCFF75B1CCFFBF9D7DFFBC9571FF4D6673FF4C4A48B25D5B
    5AB2446C93FF3475F4FF8A7086FFEBA26BFF906462FF8786F4FF4242C8FF4893
    76FF3A7E35FF88C7D3FF7CB9D3FFD0956CFFCD8C5DFF506572FF4D4B4AB25E5C
    5BB2456D93FF3777F4FF897086FFEBA26BFF916662FF8887F5FF4848C9FF4993
    77FF3A7E35FF88C7D3FF7CB9D4FFD0956CFFCE8C5DFF516672FF4E4C4AB25F5D
    5DB2476E92FF3E7CF4FF8A7188FFEBA570FF936863FF9493F6FF5252CAFF5398
    7FFF3E8038FF84C3D0FF7BB6D0FFD29870FFCE8D5FFF526673FF4E4C4BB2605E
    5EB24A7493FF509DF4FF8F808AFFECA774FF956963FF9898F6FF5B5ACBFF599B
    85FF40813AFF81C1CEFF77B3CEFFD19A74FFCE8E60FF516673FF4E4C4BB2615E
    5EB24B7494FF4F9CF7FF798DA5FFC2BDA3FF807C83FF9696F8FF5B5ACDFF5F9D
    89FF42823BFF7DBECCFF75B1CCFFD29C78FFCE8F61FF516673FF4E4C4BB2615F
    5FB2456A89FF3668BBFF717C94FFC3BEA5FF7B7A7AFF6B79BEFF4E5CA4FF62A0
    86FF417F3DFF85C2CDFF78B3CDFFAEAE9EFFA8A38DFF4D6979FF4E4C4BB2615F
    5FAC3C5D76FF1C4A65FF37495EFF555862FF364254FF1B4662FF1C4A65FF1A42
    60FF19405FFF19405FFF19405FFF4D5562FF4C505BFF3F5A71FF4E4D4BAC6765
    659FA1A4ACFF8E94A0FF8E94A0FF8E94A0FF8E949FFF8D939FFF8D939EFF8C92
    9DFF8A919BFF888F99FF858C97FF838A94FF808791FF8F939AFF5452519F0000
    AC410000AC410000AC410000AC410000AC410000AC410000AC410000AC410000
    AC410000AC410000AC410000AC410000AC410000AC410000AC410000AC41}
  Menu = MainMenu
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseUp = FormMouseUp
  PixelsPerInch = 96
  TextHeight = 13
  object rpLang: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 58
    Width = 936
    Height = 80
    Margins.Bottom = 6
    Align = alTop
    AlignmentVertical = avTop
    AutoSize = True
    BorderOuter = fsFlatRounded
    TabOrder = 0
    object RusBar: TToolBar
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 926
      Height = 33
      BorderWidth = 1
      ButtonHeight = 24
      ButtonWidth = 39
      Caption = 'RusBar'
      DrawingStyle = dsGradient
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HotTrackColor = 13682103
      Indent = 2
      List = True
      ParentFont = False
      ShowCaptions = True
      AllowTextButtons = True
      TabOrder = 0
      Wrapable = False
      object tbtnStar: TToolButton
        Tag = 90
        Left = 2
        Top = 0
        Caption = '*'
        ImageIndex = 0
        Style = tbsTextButton
        OnClick = tbtnStarClick
      end
      object ToolButton4: TToolButton
        Tag = 91
        Left = 28
        Top = 0
        Caption = #1040'-'#1071
        ImageIndex = 1
        Style = tbsTextButton
        OnClick = tbtnStarClick
      end
    end
    object EngBar: TToolBar
      AlignWithMargins = True
      Left = 5
      Top = 42
      Width = 926
      Height = 33
      Margins.Bottom = 5
      BorderWidth = 1
      ButtonHeight = 24
      ButtonWidth = 37
      Caption = 'RusBar'
      DrawingStyle = dsGradient
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HotTrackColor = 13682103
      List = True
      ParentFont = False
      AllowTextButtons = True
      TabOrder = 1
      object ToolButton2: TToolButton
        Tag = 90
        Left = 0
        Top = 0
        Caption = '*'
        ImageIndex = 0
        Style = tbsTextButton
        OnClick = tbtnStarClick
      end
      object ToolButton6: TToolButton
        Tag = 92
        Left = 26
        Top = 0
        Caption = 'A-Z'
        ImageIndex = 1
        Style = tbsTextButton
        OnClick = tbtnStarClick
      end
    end
  end
  object StatusBar: TRzStatusBar
    Left = 0
    Top = 753
    Width = 942
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 1
    DesignSize = (
      942
      19)
    object RzVersionInfoStatus1: TRzVersionInfoStatus
      Left = 0
      Top = 0
      Height = 19
      Align = alLeft
      Alignment = taCenter
      Field = vifFileVersion
      VersionInfo = VersionInfo
      ExplicitLeft = -6
      ExplicitTop = 3
    end
    object spStatus: TRzStatusPane
      Left = 100
      Top = 0
      Width = 216
      Height = 19
      Align = alLeft
      Alignment = taRightJustify
      ExplicitLeft = 106
    end
    object spProgress: TRzProgressStatus
      Left = 316
      Top = 0
      Width = 187
      Height = 19
      Align = alLeft
      ParentShowHint = False
      PartsComplete = 0
      Percent = 0
      ShowPercent = True
      TotalParts = 0
    end
    object RzStatusPane1: TRzStatusPane
      Left = 503
      Top = 0
      Width = 200
      Height = 19
      Align = alLeft
      ExplicitLeft = 316
    end
    object RzURLLabel1: TRzURLLabel
      Left = 884
      Top = 3
      Width = 39
      Height = 13
      Hint = #1055#1086#1076#1076#1077#1088#1078#1072#1090#1100#13#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1086#1074
      Anchors = [akTop, akRight]
      Caption = 'Donate!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      URL = 'http://home-lib.net/help_us'
      VisitedColor = clHighlight
    end
  end
  object tlbrMain: TToolBar
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 936
    Height = 49
    HelpContext = 146
    BorderWidth = 1
    ButtonHeight = 40
    ButtonWidth = 41
    Caption = 'tlbrMain'
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    HotTrackColor = 13682103
    Images = ilToolBar
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object tbtnRead: TToolButton
      Left = 0
      Top = 0
      Hint = #1063#1080#1090#1072#1090#1100
      Caption = 'tbtnRead'
      ImageIndex = 0
      OnClick = tbtbnReadClick
    end
    object tbtnDownloadBooks: TToolButton
      Left = 41
      Top = 0
      Hint = #1057#1082#1072#1095#1072#1090#1100' '#1074#1089#1077#13#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077' '#1082#1085#1080#1075#1080
      Caption = 'tbtnDownloadBooks'
      ImageIndex = 18
      OnClick = miDownloadBooksClick
    end
    object tbSendToDevice: TToolButton
      Tag = 900
      Left = 82
      Top = 0
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
      Caption = 'tbSendToDevice'
      DropdownMenu = pmScripts
      ImageIndex = 1
      Style = tbsDropDown
      OnClick = tbSendToDeviceClick
    end
    object ToolButton13: TToolButton
      Left = 136
      Top = 0
      Width = 24
      Caption = 'ToolButton13'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object tbtnRus: TToolButton
      Left = 160
      Top = 0
      Hint = #1056#1091#1089#1089#1082#1080#1081' '#1072#1083#1092#1072#1074#1080#1090
      Caption = 'tbtnRus'
      ImageIndex = 2
      OnClick = tbtnRusClick
    end
    object tbtnEng1: TToolButton
      Left = 201
      Top = 0
      Hint = #1040#1085#1075#1083#1080#1081#1089#1082#1080#1081' '#1072#1083#1092#1072#1074#1080#1090
      Caption = 'tbtnEng1'
      ImageIndex = 3
      OnClick = tbtnEngClick
    end
    object ToolButton12: TToolButton
      Left = 242
      Top = 0
      Width = 24
      Caption = 'ToolButton12'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object tbtnWizard: TToolButton
      Left = 266
      Top = 0
      Hint = #1052#1072#1089#1090#1077#1088' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103#13#1082#1086#1083#1083#1077#1082#1094#1080#1081
      Caption = 'tbtnWizard'
      ImageIndex = 16
      ParentShowHint = False
      ShowHint = True
      OnClick = ShowNewCollectionWizard
    end
    object tbtnSelect: TToolButton
      Left = 307
      Top = 0
      Hint = #1042#1099#1073#1088#1072#1090#1100#13#1082#1086#1083#1083#1077#1082#1094#1080#1102
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1082#1086#1083#1083#1077#1082#1094#1080#1102
      DropdownMenu = pmCollection
      EnableDropdown = True
      ImageIndex = 4
      Indeterminate = True
      ParentShowHint = False
      ShowHint = True
    end
    object tbSelectAll: TToolButton
      Left = 348
      Top = 0
      Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      Caption = 'tbSelectAll'
      ImageIndex = 5
      OnClick = tbSelectAllClick
    end
    object tbCollapse: TToolButton
      Left = 389
      Top = 0
      Hint = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100'/'#1057#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      Caption = 'tbCollapse'
      ImageIndex = 6
      OnClick = tbCollapseClick
    end
    object btnRefreshCollection: TToolButton
      Left = 430
      Top = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      Caption = 'btnRefreshCollection'
      ImageIndex = 7
      OnClick = miRefreshClick
    end
    object ToolButton1: TToolButton
      Left = 471
      Top = 0
      Width = 24
      Caption = 'ToolButton1'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object btnSwitchTreeMode: TToolButton
      Left = 495
      Top = 0
      Hint = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1088#1077#1078#1080#1084' "'#1058#1072#1073#1083#1080#1094#1072'"'
      Caption = 'btnSwitchTreeMode'
      ImageIndex = 15
      OnClick = btnSwitchTreeModeClick
    end
    object tbtnShowDeleted: TToolButton
      Left = 536
      Top = 0
      Hint = #1057#1082#1088#1099#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077' '#1085#1072' lib.rus.ec'
      Caption = 'tbtnShowDeleted'
      ImageIndex = 9
      OnClick = tbtnShowDeletedClick
    end
    object tbtnShowLocalOnly: TToolButton
      Left = 577
      Top = 0
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1089#1082#1072#1095#1072#1085#1085#1099#1077' '#1082#1085#1080#1075#1080
      Caption = 'tbtnShowLocalOnly'
      ImageIndex = 17
      OnClick = tbtnShowLocalOnlyClick
    end
    object tbtnShowCover: TToolButton
      Left = 618
      Top = 0
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1057#1082#1088#1099#1090#1100' '#1086#1073#1083#1086#1078#1082#1091
      Caption = 'tbtnShowCover'
      ImageIndex = 8
      OnClick = tbtnShowCoverClick
    end
    object ToolButton3: TToolButton
      Left = 659
      Top = 0
      Width = 24
      Caption = 'ToolButton3'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object BtnFav_add: TToolButton
      Left = 683
      Top = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1080#1079#1073#1088#1072#1085#1085#1086#1077
      Caption = 'BtnFav_add'
      ImageIndex = 10
      OnClick = BtnFav_addClick
    end
    object ToolButton5: TToolButton
      Left = 724
      Top = 0
      Width = 24
      Caption = 'ToolButton5'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbtnSettings: TToolButton
      Left = 748
      Top = 0
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Caption = 'tbtnSettings'
      ImageIndex = 11
      OnClick = miSettingsClick
    end
  end
  object pgControl: TRzPageControl
    Left = 0
    Top = 144
    Width = 942
    Height = 609
    HelpContext = 135
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 3
    OnChange = pgControlChange
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      OnShow = TabSheet1Show
      Caption = #1040#1074#1090#1086#1088#1099
      object rzsSplitterA: TRzSplitter
        Left = 0
        Top = 0
        Width = 938
        Height = 586
        MarginMin = 150
        Position = 228
        Percent = 24
        PercentMax = 0
        SplitterWidth = 6
        Align = alClient
        TabOrder = 0
        BarSize = (
          228
          0
          234
          586)
        UpperLeftControls = (
          RzPanel13)
        LowerRightControls = (
          cpCoverA
          RzPanel15)
        object RzPanel13: TRzPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 224
          Height = 580
          Margins.Right = 1
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 0
          object tvAuthors: TVirtualStringTree
            AlignWithMargins = True
            Left = 5
            Top = 52
            Width = 214
            Height = 523
            Align = alClient
            CheckImageKind = ckXP
            Colors.UnfocusedSelectionColor = clHighlight
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'Tahoma'
            Header.Font.Style = []
            Header.MainColumn = -1
            Header.Options = [hoColumnResize, hoDrag]
            IncrementalSearch = isAll
            ParentFont = False
            PopupMenu = pmAuthor
            TabOrder = 0
            TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toThemeAware, toUseBlendedImages]
            TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
            OnChange = tvAuthorsChange
            OnGetText = tvAuthorsGetText
            OnPaintText = tvAuthorsPaintText
            OnGetNodeDataSize = tvAuthorsGetNodeDataSize
            Columns = <>
          end
          object RzPanel16: TRzPanel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 214
            Height = 41
            Align = alTop
            BorderOuter = fsFlatRounded
            TabOrder = 1
            DesignSize = (
              214
              41)
            object Label19: TLabel
              Left = 10
              Top = 16
              Width = 30
              Height = 13
              Caption = #1055#1086#1080#1089#1082
            end
            object tbClearEdAuthor: TRzToolButton
              Left = 182
              Top = 8
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100
              ImageIndex = 36
              Images = ilMainMenu
              Anchors = [akTop, akRight]
              ParentShowHint = False
              ShowHint = True
              OnClick = tbClearEdAuthorClick
              ExplicitLeft = 214
            end
            object edLocateAuthor: TRzEdit
              AlignWithMargins = True
              Left = 53
              Top = 12
              Width = 123
              Height = 21
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = edLocateAuthorChange
            end
          end
        end
        object cpCoverA: TMHLCoverPanel
          AlignWithMargins = True
          Left = 451
          Top = 3
          Width = 250
          Height = 580
          Margins.Left = 0
          Align = alRight
          BorderOuter = fsFlatRounded
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MarginMin = 150
          ParentFont = False
          SizeBarWidth = 1
          TabOrder = 0
          Fb2InfoVisible = False
          FontSize = 0
        end
        object RzPanel15: TRzPanel
          AlignWithMargins = True
          Left = 0
          Top = 3
          Width = 451
          Height = 580
          Margins.Left = 0
          Margins.Right = 0
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 1
          object RzPanel17: TRzPanel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 441
            Height = 464
            Align = alClient
            BorderOuter = fsNone
            TabOrder = 0
            object RzPanel18: TRzPanel
              Left = 0
              Top = 0
              Width = 441
              Height = 31
              Align = alTop
              BorderOuter = fsNone
              TabOrder = 0
              object lblAuthor: TRzDBLabel
                AlignWithMargins = True
                Left = 10
                Top = 3
                Width = 76
                Height = 25
                Margins.Left = 10
                Align = alLeft
                AutoSize = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                DataField = 'FullName'
                DataSource = DMMain.dsAuthors
                ExplicitHeight = 19
              end
              object lblBooksTotalA: TRzLabel
                AlignWithMargins = True
                Left = 426
                Top = 3
                Width = 12
                Height = 25
                Align = alRight
                Alignment = taRightJustify
                Caption = '()'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                CenterPoint = cpLowerRight
                ExplicitHeight = 19
              end
            end
            object RzPanel23: TRzPanel
              Left = 0
              Top = 31
              Width = 441
              Height = 433
              Align = alClient
              BorderOuter = fsNone
              TabOrder = 1
              object tvBooksA: TVirtualStringTree
                Left = 0
                Top = 0
                Width = 441
                Height = 433
                Align = alClient
                CheckImageKind = ckXP
                ClipboardFormats.Strings = (
                  'CSV'
                  'HTML Format'
                  'Plain text'
                  'Rich Text Format'
                  'Rich Text Format Without Objects'
                  'Unicode text'
                  'Virtual Tree Data')
                Color = 14024447
                Colors.BorderColor = clBackground
                Colors.HotColor = clBlack
                Colors.UnfocusedSelectionColor = clNavy
                Colors.UnfocusedSelectionBorderColor = clBtnShadow
                DefaultPasteMode = amAddChildFirst
                DragMode = dmAutomatic
                EditDelay = 100
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                Header.AutoSizeIndex = 0
                Header.Font.Charset = ANSI_CHARSET
                Header.Font.Color = clWindowText
                Header.Font.Height = -12
                Header.Font.Name = 'Arial'
                Header.Font.Style = [fsBold]
                Header.Height = 20
                Header.MainColumn = 1
                Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoFullRepaintOnResize]
                Header.PopupMenu = pmHeaders
                Header.Style = hsFlatButtons
                HintMode = hmTooltip
                HotCursor = crHandPoint
                ParentFont = False
                ParentShowHint = False
                PopupMenu = pmMain
                SelectionBlendFactor = 0
                ShowHint = False
                TabOrder = 0
                TreeOptions.AnimationOptions = [toAnimatedToggle]
                TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
                TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toFullRowDrag]
                TreeOptions.PaintOptions = [toPopupMode, toShowBackground, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
                TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect, toSimpleDrawSelection]
                OnAfterCellPaint = tvBooksTreeAfterCellPaint
                OnBeforeCellPaint = tvBooksTreeBeforeCellPaint
                OnChange = tvBooksTreeChange
                OnCompareNodes = tvBooksTreeCompareNodes
                OnDblClick = tbtbnReadClick
                OnGetText = tvBooksAGetText
                OnPaintText = tvBooksTreePaintText
                OnGetNodeDataSize = tvBooksAGetNodeDataSize
                OnHeaderClick = tvBooksTreeHeaderClick
                OnInitNode = tvBooksTreeInitNode
                OnKeyDown = tvBooksTreeKeyDown
                OnMouseUp = tvBooksTreeMouseUp
                Columns = <
                  item
                    MaxWidth = 1000
                    MinWidth = 40
                    Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                    Position = 0
                    Spacing = 10
                    Width = 267
                    WideText = #1053#1072#1079#1074#1072#1085#1080#1077
                    WideHint = 
                      'Text is initially centered and has a left-to-right directionalit' +
                      'y.'
                  end
                  item
                    Alignment = taCenter
                    MaxWidth = 80
                    MinWidth = 35
                    Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                    Position = 1
                    Spacing = 10
                    Width = 40
                    WideText = #8470
                    WideHint = 
                      'Text is initially left aligned and has a left-to-right direction' +
                      'ality.'
                  end
                  item
                    Alignment = taCenter
                    BiDiMode = bdRightToLeft
                    MaxWidth = 200
                    MinWidth = 65
                    Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                    Position = 2
                    Spacing = 10
                    Width = 65
                    WideText = #1056#1072#1079#1084#1077#1088
                    WideHint = 
                      'Text is initially left aligned and has a right-to-left direction' +
                      'ality.'
                  end
                  item
                    Alignment = taCenter
                    MaxWidth = 60
                    MinWidth = 60
                    Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                    Position = 3
                    Width = 60
                    WideText = #1056#1077#1081#1090#1080#1085#1075
                  end
                  item
                    MinWidth = 40
                    Options = [coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                    Position = 4
                    Width = 205
                    WideText = #1046#1072#1085#1088
                  end>
              end
            end
          end
          object ipnlAuthors: TMHLInfoPanel
            AlignWithMargins = True
            Left = 5
            Top = 475
            Width = 441
            Height = 100
            Align = alBottom
            BevelOuter = bvNone
            Caption = ' '
            TabOrder = 1
            Author = #1060#1048#1054'  '#1072#1074#1090#1086#1088#1072
            Title = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
            Genre = #1085#1077#1080#1079#1074#1077#1089#1090#1085#1099#1081
            Folder = 'C:\Books\1-1009.zip'
            FileName = '111 '#1048#1074#1072#1085#1086#1074' '#1050#1085#1080#1075#1072'.fb2'
          end
        end
      end
    end
    object TabSheet2: TRzTabSheet
      OnShow = TabSheet2Show
      Caption = #1057#1077#1088#1080#1080
      object rzsSplitterS: TRzSplitter
        Left = 0
        Top = 0
        Width = 938
        Height = 586
        MarginMin = 150
        Position = 247
        Percent = 26
        SplitterWidth = 5
        Align = alClient
        TabOrder = 0
        BarSize = (
          247
          0
          252
          586)
        UpperLeftControls = (
          RzPanel1)
        LowerRightControls = (
          cpCoverS
          RzPanel3)
        object RzPanel1: TRzPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 241
          Height = 580
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 0
          object tvSeries: TVirtualStringTree
            AlignWithMargins = True
            Left = 5
            Top = 52
            Width = 231
            Height = 523
            Align = alClient
            CheckImageKind = ckXP
            Colors.UnfocusedSelectionColor = clHighlight
            Colors.UnfocusedSelectionBorderColor = clHighlight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'Tahoma'
            Header.Font.Style = []
            Header.MainColumn = -1
            Header.Options = [hoColumnResize, hoDrag]
            ParentFont = False
            PopupMenu = pmAuthor
            TabOrder = 0
            TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toThemeAware, toUseBlendedImages]
            TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
            OnChange = tvSeriesChange
            OnGetText = tvAuthorsGetText
            OnPaintText = tvAuthorsPaintText
            Columns = <>
          end
          object RzPanel19: TRzPanel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 231
            Height = 41
            Align = alTop
            BorderOuter = fsFlatRounded
            TabOrder = 1
            DesignSize = (
              231
              41)
            object Label11: TLabel
              Left = 10
              Top = 16
              Width = 30
              Height = 13
              Caption = #1055#1086#1080#1089#1082
            end
            object btnClearEdSeries: TRzToolButton
              Left = 201
              Top = 8
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100
              ImageIndex = 36
              Images = ilMainMenu
              Anchors = [akTop, akRight]
              ParentShowHint = False
              ShowHint = True
              OnClick = btnClearEdSeriesClick
            end
            object edLocateSeries: TRzEdit
              AlignWithMargins = True
              Left = 54
              Top = 11
              Width = 141
              Height = 21
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              TabOrder = 0
              OnChange = edLocateSeriesChange
            end
          end
        end
        object cpCoverS: TMHLCoverPanel
          AlignWithMargins = True
          Left = 433
          Top = 3
          Width = 250
          Height = 580
          Margins.Left = 0
          Align = alRight
          BorderOuter = fsFlatRounded
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MarginMin = 150
          ParentFont = False
          SizeBarWidth = 5
          TabOrder = 0
          Fb2InfoVisible = False
          FontSize = 0
        end
        object RzPanel3: TRzPanel
          AlignWithMargins = True
          Left = 0
          Top = 3
          Width = 433
          Height = 580
          Margins.Left = 0
          Margins.Right = 0
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 1
          object RzPanel4: TRzPanel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 423
            Height = 464
            Align = alClient
            BorderOuter = fsNone
            TabOrder = 0
            object RzPanel5: TRzPanel
              Left = 0
              Top = 0
              Width = 423
              Height = 31
              Align = alTop
              BorderOuter = fsNone
              TabOrder = 0
              object lblSeries: TRzDBLabel
                AlignWithMargins = True
                Left = 10
                Top = 3
                Width = 70
                Height = 25
                Margins.Left = 10
                Align = alLeft
                AutoSize = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                DataField = 'Title'
                DataSource = DMMain.dsSeries
                ExplicitHeight = 19
              end
              object lblBooksTotalS: TRzLabel
                AlignWithMargins = True
                Left = 408
                Top = 3
                Width = 12
                Height = 25
                Align = alRight
                Alignment = taRightJustify
                Caption = '()'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                CenterPoint = cpLowerRight
                ExplicitHeight = 19
              end
            end
            object tvBooksS: TVirtualStringTree
              Tag = 1
              Left = 0
              Top = 31
              Width = 423
              Height = 433
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BevelKind = bkFlat
              ButtonFillMode = fmShaded
              CheckImageKind = ckXP
              ClipboardFormats.Strings = (
                'CSV'
                'HTML Format'
                'Plain text'
                'Rich Text Format'
                'Rich Text Format Without Objects'
                'Unicode text'
                'Virtual Tree Data')
              Color = 14024447
              Colors.BorderColor = clBackground
              Colors.HotColor = clBlack
              Colors.UnfocusedSelectionBorderColor = clBtnShadow
              DefaultPasteMode = amAddChildFirst
              DragMode = dmAutomatic
              EditDelay = 100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              Header.AutoSizeIndex = 0
              Header.Font.Charset = ANSI_CHARSET
              Header.Font.Color = clWindowText
              Header.Font.Height = -12
              Header.Font.Name = 'Arial'
              Header.Font.Style = [fsBold]
              Header.Height = 20
              Header.Options = [hoColumnResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible]
              Header.PopupMenu = pmHeaders
              Header.Style = hsFlatButtons
              HintMode = hmTooltip
              HotCursor = crHandPoint
              ParentFont = False
              ParentShowHint = False
              PopupMenu = pmMain
              ShowHint = False
              TabOrder = 1
              TreeOptions.AnimationOptions = [toAnimatedToggle]
              TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
              TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
              TreeOptions.PaintOptions = [toPopupMode, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
              TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
              OnAfterCellPaint = tvBooksTreeAfterCellPaint
              OnChange = tvBooksTreeChange
              OnCompareNodes = tvBooksTreeCompareNodes
              OnDblClick = tbtbnReadClick
              OnGetText = tvBooksSGetText
              OnHeaderClick = tvBooksTreeHeaderClick
              OnInitNode = tvBooksTreeInitNode
              OnKeyDown = tvBooksTreeKeyDown
              OnMouseUp = tvBooksTreeMouseUp
              Columns = <
                item
                  MinWidth = 30
                  Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                  Position = 0
                  Width = 131
                  WideText = #1040#1074#1090#1086#1088
                end
                item
                  MinWidth = 30
                  Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                  Position = 1
                  Spacing = 10
                  Width = 181
                  WideText = #1053#1072#1079#1074#1072#1085#1080#1077
                  WideHint = 
                    'Text is initially centered and has a left-to-right directionalit' +
                    'y.'
                end
                item
                  Alignment = taCenter
                  MaxWidth = 90
                  MinWidth = 30
                  Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                  Position = 2
                  Spacing = 10
                  Width = 30
                  WideText = #8470
                  WideHint = 
                    'Text is initially left aligned and has a left-to-right direction' +
                    'ality.'
                end
                item
                  Alignment = taCenter
                  MaxWidth = 100
                  MinWidth = 65
                  Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                  Position = 3
                  Spacing = 10
                  Width = 65
                  WideText = #1056#1072#1079#1084#1077#1088
                  WideHint = 
                    'Text is initially left aligned and has a right-to-left direction' +
                    'ality.'
                end
                item
                  Alignment = taCenter
                  MaxWidth = 100
                  MinWidth = 65
                  Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                  Position = 4
                  Width = 65
                  WideText = #1056#1077#1081#1090#1080#1085#1075
                end
                item
                  Position = 5
                  Width = 120
                  WideText = #1046#1072#1085#1088
                end
                item
                  Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coAllowFocus]
                  Position = 6
                  Width = 56
                  WideText = #1044#1086#1073#1072#1074#1083#1077#1085#1086
                end>
            end
          end
          object RichEdit1: TRichEdit
            Left = 352
            Top = 664
            Width = 185
            Height = 89
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'edClpBrd')
            ParentFont = False
            TabOrder = 1
            Visible = False
          end
          object ipnlSeries: TMHLInfoPanel
            AlignWithMargins = True
            Left = 5
            Top = 475
            Width = 423
            Height = 100
            Align = alBottom
            BevelOuter = bvNone
            Caption = ' '
            TabOrder = 2
            Author = #1060#1048#1054'  '#1072#1074#1090#1086#1088#1072
            Title = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
            Genre = #1085#1077#1080#1079#1074#1077#1089#1090#1085#1099#1081
            Folder = 'C:\Books\1-1009.zip'
            FileName = '111 '#1048#1074#1072#1085#1086#1074' '#1050#1085#1080#1075#1072'.fb2'
          end
        end
      end
    end
    object TabSheet3: TRzTabSheet
      OnShow = TabSheet2Show
      Caption = #1046#1072#1085#1088#1099
      object rzsSplitterG: TRzSplitter
        Left = 0
        Top = 0
        Width = 938
        Height = 586
        MarginMin = 150
        Position = 258
        Percent = 28
        SplitterWidth = 2
        Align = alClient
        TabOrder = 0
        BarSize = (
          258
          0
          260
          586)
        UpperLeftControls = (
          RzPanel25)
        LowerRightControls = (
          cpCoverG
          RzPanel27)
        object RzPanel25: TRzPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 252
          Height = 580
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 0
          object tvGenres: TVirtualStringTree
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 242
            Height = 570
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'Tahoma'
            Header.Font.Style = []
            Header.MainColumn = -1
            Header.Options = [hoColumnResize, hoDrag]
            ParentFont = False
            PopupMenu = pmAuthor
            TabOrder = 0
            TreeOptions.PaintOptions = [toPopupMode, toShowButtons, toShowDropmark, toShowRoot, toShowTreeLines, toThemeAware, toUseBlendedImages]
            OnChange = tvGenresChange
            OnGetText = tvGenresGetText
            Columns = <>
          end
        end
        object cpCoverG: TMHLCoverPanel
          AlignWithMargins = True
          Left = 425
          Top = 3
          Width = 250
          Height = 580
          Margins.Left = 0
          Align = alRight
          BorderOuter = fsFlatRounded
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MarginMin = 150
          ParentFont = False
          SizeBarWidth = 5
          TabOrder = 0
          Fb2InfoVisible = False
          FontSize = 0
        end
        object RzPanel27: TRzPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 419
          Height = 580
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 1
          object RzPanel28: TRzPanel
            AlignWithMargins = True
            Left = 5
            Top = 36
            Width = 409
            Height = 433
            Align = alClient
            BorderOuter = fsNone
            TabOrder = 0
            object tvBooksG: TVirtualStringTree
              Tag = 2
              Left = 0
              Top = 0
              Width = 409
              Height = 433
              Align = alClient
              Alignment = taRightJustify
              BevelInner = bvNone
              BevelOuter = bvNone
              BevelKind = bkFlat
              ButtonFillMode = fmShaded
              CheckImageKind = ckXP
              ClipboardFormats.Strings = (
                'CSV'
                'HTML Format'
                'Plain text'
                'Rich Text Format'
                'Rich Text Format Without Objects'
                'Unicode text'
                'Virtual Tree Data')
              Color = 14024447
              Colors.BorderColor = clBackground
              Colors.HotColor = clBlack
              Colors.UnfocusedSelectionBorderColor = clBtnShadow
              DefaultPasteMode = amAddChildFirst
              DragMode = dmAutomatic
              EditDelay = 100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              Header.AutoSizeIndex = 0
              Header.Font.Charset = ANSI_CHARSET
              Header.Font.Color = clWindowText
              Header.Font.Height = -12
              Header.Font.Name = 'Arial'
              Header.Font.Style = [fsBold]
              Header.Height = 20
              Header.Options = [hoColumnResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible]
              Header.PopupMenu = pmHeaders
              Header.Style = hsFlatButtons
              HintMode = hmTooltip
              HotCursor = crHandPoint
              ParentFont = False
              ParentShowHint = False
              PopupMenu = pmMain
              ShowHint = False
              TabOrder = 0
              TreeOptions.AnimationOptions = [toAnimatedToggle]
              TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
              TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
              TreeOptions.PaintOptions = [toPopupMode, toShowBackground, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
              TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
              OnAfterCellPaint = tvBooksTreeAfterCellPaint
              OnChange = tvBooksTreeChange
              OnCompareNodes = tvBooksTreeCompareNodes
              OnDblClick = tbtbnReadClick
              OnGetText = tvBooksGGetText
              OnPaintText = tvBooksTreePaintText
              OnGetNodeDataSize = tvBooksGGetNodeDataSize
              OnHeaderClick = tvBooksTreeHeaderClick
              OnInitNode = tvBooksTreeInitNode
              OnKeyDown = tvBooksTreeKeyDown
              OnMouseUp = tvBooksTreeMouseUp
              Columns = <
                item
                  MinWidth = 30
                  Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                  Position = 0
                  Spacing = 10
                  Width = 244
                  WideText = #1040#1074#1090#1086#1088'/'#1057#1077#1088#1080#1103'/'#1053#1072#1079#1074#1072#1085#1080#1077
                  WideHint = 
                    'Text is initially centered and has a left-to-right directionalit' +
                    'y.'
                end
                item
                  Alignment = taCenter
                  MaxWidth = 90
                  MinWidth = 30
                  Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coShowDropMark, coVisible, coAutoSpring]
                  Position = 1
                  Spacing = 10
                  Width = 30
                  WideText = #8470
                  WideHint = 
                    'Text is initially left aligned and has a left-to-right direction' +
                    'ality.'
                end
                item
                  Alignment = taCenter
                  BiDiMode = bdRightToLeft
                  MaxWidth = 100
                  MinWidth = 65
                  Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                  Position = 2
                  Spacing = 10
                  Width = 65
                  WideText = #1056#1072#1079#1084#1077#1088
                  WideHint = 
                    'Text is initially left aligned and has a right-to-left direction' +
                    'ality.'
                end
                item
                  Alignment = taCenter
                  MaxWidth = 65
                  MinWidth = 65
                  Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                  Position = 3
                  Width = 65
                  WideText = #1056#1077#1081#1090#1080#1085#1075
                end
                item
                  Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                  Position = 4
                  Width = 139
                end>
            end
          end
          object RichEdit4: TRichEdit
            Left = 352
            Top = 664
            Width = 185
            Height = 89
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'edClpBrd')
            ParentFont = False
            TabOrder = 1
            Visible = False
          end
          object RzPanel26: TRzPanel
            Left = 2
            Top = 2
            Width = 415
            Height = 31
            Align = alTop
            BorderOuter = fsNone
            TabOrder = 2
            object lblBooksTotalG: TRzLabel
              AlignWithMargins = True
              Left = 400
              Top = 3
              Width = 12
              Height = 25
              Align = alRight
              Alignment = taRightJustify
              Caption = '()'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              CenterPoint = cpLowerRight
              ExplicitHeight = 19
            end
            object lblGenreTitle: TRzLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 15
              Height = 25
              Align = alLeft
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              CenterPoint = cpLowerRight
              ExplicitHeight = 19
            end
          end
          object ipnlGenres: TMHLInfoPanel
            AlignWithMargins = True
            Left = 5
            Top = 475
            Width = 409
            Height = 100
            Align = alBottom
            BevelOuter = bvNone
            Caption = ' '
            TabOrder = 3
            Author = #1060#1048#1054'  '#1072#1074#1090#1086#1088#1072
            Title = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
            Genre = #1085#1077#1080#1079#1074#1077#1089#1090#1085#1099#1081
            Folder = 'C:\Books\1-1009.zip'
            FileName = '111 '#1048#1074#1072#1085#1086#1074' '#1050#1085#1080#1075#1072'.fb2'
          end
        end
      end
    end
    object TabSheet4: TRzTabSheet
      HelpContext = 142
      OnShow = TabSheet2Show
      Caption = #1055#1086#1080#1089#1082
      object RzPanel9: TRzPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 682
        Height = 580
        Margins.Right = 0
        Align = alClient
        BorderOuter = fsFlatRounded
        TabOrder = 0
        object RzPanel10: TRzPanel
          AlignWithMargins = True
          Left = 5
          Top = 73
          Width = 672
          Height = 396
          Align = alClient
          BorderOuter = fsNone
          TabOrder = 0
          object tvBooksSR: TVirtualStringTree
            Tag = 3
            Left = 0
            Top = 0
            Width = 672
            Height = 396
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            ButtonFillMode = fmShaded
            CheckImageKind = ckXP
            ClipboardFormats.Strings = (
              'CSV'
              'HTML Format'
              'Plain text'
              'Rich Text Format'
              'Rich Text Format Without Objects'
              'Unicode text'
              'Virtual Tree Data')
            Color = 14024447
            Colors.BorderColor = clBackground
            Colors.HotColor = clBlack
            Colors.UnfocusedSelectionBorderColor = clBtnShadow
            DefaultPasteMode = amAddChildFirst
            DragMode = dmAutomatic
            EditDelay = 100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Font.Charset = ANSI_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -12
            Header.Font.Name = 'Arial'
            Header.Font.Style = [fsBold]
            Header.Height = 20
            Header.Options = [hoColumnResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible]
            Header.PopupMenu = pmHeaders
            Header.Style = hsFlatButtons
            HintMode = hmTooltip
            HotCursor = crHandPoint
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmMain
            ShowHint = False
            TabOrder = 0
            TreeOptions.AnimationOptions = [toAnimatedToggle]
            TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
            TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
            TreeOptions.PaintOptions = [toPopupMode, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
            TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
            OnAfterCellPaint = tvBooksTreeAfterCellPaint
            OnChange = tvBooksTreeChange
            OnCompareNodes = tvBooksTreeCompareNodes
            OnDblClick = tbtbnReadClick
            OnGetText = tvBooksFGetText
            OnPaintText = tvBooksTreePaintText
            OnHeaderClick = tvBooksTreeHeaderClick
            OnInitNode = tvBooksTreeInitNode
            OnKeyDown = tvBooksTreeKeyDown
            OnMouseUp = tvBooksTreeMouseUp
            Columns = <
              item
                MaxWidth = 1000
                MinWidth = 30
                Position = 0
                Width = 200
                WideText = #1040#1074#1090#1086#1088
              end
              item
                MaxWidth = 1000
                MinWidth = 30
                Position = 1
                Spacing = 10
                Width = 200
                WideText = #1053#1072#1079#1074#1072#1085#1080#1077
                WideHint = 
                  'Text is initially centered and has a left-to-right directionalit' +
                  'y.'
              end
              item
                MaxWidth = 1000
                MinWidth = 30
                Position = 2
                Width = 200
                WideText = #1057#1077#1088#1080#1103
              end
              item
                Alignment = taCenter
                MaxWidth = 60
                MinWidth = 30
                Position = 3
                Spacing = 10
                Width = 45
                WideText = #8470
                WideHint = 
                  'Text is initially left aligned and has a left-to-right direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                MaxWidth = 100
                MinWidth = 65
                Position = 4
                Spacing = 10
                Width = 65
                WideText = #1056#1072#1079#1084#1077#1088
                WideHint = 
                  'Text is initially left aligned and has a right-to-left direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                MaxWidth = 60
                MinWidth = 60
                Position = 5
                Width = 60
                WideText = #1056#1077#1081#1090#1080#1085#1075
              end
              item
                MinWidth = 30
                Position = 6
                Width = 205
                WideText = #1046#1072#1085#1088
              end
              item
                Position = 7
                Width = 80
                WideText = #1044#1086#1073#1072#1074#1083#1077#1085#1086
              end>
          end
        end
        object RichEdit2: TRichEdit
          Left = 352
          Top = 664
          Width = 185
          Height = 89
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'edClpBrd')
          ParentFont = False
          TabOrder = 1
          Visible = False
        end
        object RzPanel11: TRzPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 672
          Height = 62
          Align = alTop
          BorderOuter = fsFlatRounded
          TabOrder = 2
          DesignSize = (
            672
            62)
          object Label10: TLabel
            Left = 33
            Top = 13
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = #1040#1074#1090#1086#1088
          end
          object Label12: TLabel
            Left = 16
            Top = 38
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          end
          object lblTotalBooksSR: TRzLabel
            AlignWithMargins = True
            Left = 655
            Top = 5
            Width = 12
            Height = 19
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = '()'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            CenterPoint = cpLeftCenter
            ExplicitLeft = 646
          end
          object edTitle: TRzEdit
            Left = 70
            Top = 35
            Width = 266
            Height = 21
            Enabled = False
            FrameStyle = fsNone
            TabOrder = 0
            OnKeyDown = edAuthKeyDown
          end
          object btnSearch: TRzBitBtn
            AlignWithMargins = True
            Left = 352
            Top = 4
            Width = 115
            Height = 54
            Caption = #1048#1089#1082#1072#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnSearchClick
            ImageIndex = 13
            Images = ilToolBar
          end
          object cbFullText: TCheckBox
            Left = 489
            Top = 8
            Width = 160
            Height = 17
            Caption = #1055#1086#1083#1085#1086#1090#1077#1082#1089#1090#1086#1074#1086#1081' '#1087#1086#1080#1089#1082
            TabOrder = 2
          end
          object edAuth: TRzEdit
            Left = 70
            Top = 8
            Width = 266
            Height = 21
            TabOrder = 3
            OnKeyDown = edAuthKeyDown
          end
          object btnClearSerach: TRzBitBtn
            Left = 489
            Top = 31
            Width = 105
            Caption = #1054#1095#1080#1089#1090#1080#1090#1100
            TabOrder = 4
            OnClick = btnClearSerachClick
            Kind = bkRetry
          end
        end
        object ipnlSearch: TMHLInfoPanel
          AlignWithMargins = True
          Left = 5
          Top = 475
          Width = 672
          Height = 100
          Align = alBottom
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 3
          Author = #1060#1048#1054'  '#1072#1074#1090#1086#1088#1072
          Title = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
          Genre = #1085#1077#1080#1079#1074#1077#1089#1090#1085#1099#1081
          Folder = 'C:\Books\1-1009.zip'
          FileName = '111 '#1048#1074#1072#1085#1086#1074' '#1050#1085#1080#1075#1072'.fb2'
        end
      end
      object cpCoverSR: TMHLCoverPanel
        AlignWithMargins = True
        Left = 685
        Top = 3
        Width = 250
        Height = 580
        Margins.Left = 0
        Align = alRight
        BorderOuter = fsFlatRounded
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        SizeBarWidth = 5
        TabOrder = 1
        Fb2InfoVisible = False
        FontSize = 0
      end
    end
    object TabSheet5: TRzTabSheet
      HelpContext = 125
      OnShow = TabSheet5Show
      Caption = #1048#1079#1073#1088#1072#1085#1085#1086#1077
      object RzPanel20: TRzPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 682
        Height = 580
        Margins.Right = 0
        Align = alClient
        BorderOuter = fsFlatRounded
        TabOrder = 0
        object RzPanel21: TRzPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 672
          Height = 464
          Align = alClient
          BorderOuter = fsNone
          TabOrder = 0
          object tvBooksF: TVirtualStringTree
            Tag = 4
            Left = 0
            Top = 0
            Width = 672
            Height = 464
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            ButtonFillMode = fmShaded
            CheckImageKind = ckXP
            ClipboardFormats.Strings = (
              'CSV'
              'HTML Format'
              'Plain text'
              'Rich Text Format'
              'Rich Text Format Without Objects'
              'Unicode text'
              'Virtual Tree Data')
            Color = 14024447
            Colors.BorderColor = clBackground
            Colors.HotColor = clBlack
            Colors.UnfocusedSelectionBorderColor = clBtnShadow
            DefaultPasteMode = amAddChildFirst
            DragMode = dmAutomatic
            EditDelay = 100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.Font.Charset = ANSI_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -12
            Header.Font.Name = 'Arial'
            Header.Font.Style = [fsBold]
            Header.Height = 20
            Header.Options = [hoColumnResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible]
            Header.PopupMenu = pmHeaders
            Header.Style = hsFlatButtons
            HintMode = hmTooltip
            HotCursor = crHandPoint
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmMain
            ShowHint = False
            TabOrder = 0
            TreeOptions.AnimationOptions = [toAnimatedToggle]
            TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
            TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
            TreeOptions.PaintOptions = [toPopupMode, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
            TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
            OnAfterCellPaint = tvBooksTreeAfterCellPaint
            OnChange = tvBooksTreeChange
            OnCompareNodes = tvBooksTreeCompareNodes
            OnDblClick = tbtbnReadClick
            OnGetText = tvBooksFGetText
            OnPaintText = tvBooksTreePaintText
            OnHeaderClick = tvBooksTreeHeaderClick
            OnInitNode = tvBooksTreeInitNode
            OnKeyDown = tvBooksTreeKeyDown
            OnMouseUp = tvBooksTreeMouseUp
            Columns = <
              item
                Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 0
                Spacing = 10
                Width = 305
                WideText = #1053#1072#1079#1074#1072#1085#1080#1077
                WideHint = 
                  'Text is initially centered and has a left-to-right directionalit' +
                  'y.'
              end
              item
                Alignment = taCenter
                MaxWidth = 90
                MinWidth = 35
                Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring]
                Position = 1
                Spacing = 10
                Width = 38
                WideText = #8470
                WideHint = 
                  'Text is initially left aligned and has a left-to-right direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                BiDiMode = bdRightToLeft
                MinWidth = 65
                Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 2
                Spacing = 10
                Width = 65
                WideText = #1056#1072#1079#1084#1077#1088
                WideHint = 
                  'Text is initially left aligned and has a right-to-left direction' +
                  'ality.'
              end
              item
                Alignment = taCenter
                MaxWidth = 60
                MinWidth = 60
                Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 3
                Width = 60
                WideText = #1056#1077#1081#1090#1080#1085#1075
              end
              item
                Options = [coAllowClick, coDraggable, coEnabled, coParentColor, coResizable, coShowDropMark, coVisible]
                Position = 4
                Width = 200
                WideText = #1050#1086#1083#1083#1077#1082#1094#1080#1103
              end>
          end
        end
        object ipnlFavorites: TMHLInfoPanel
          AlignWithMargins = True
          Left = 5
          Top = 475
          Width = 672
          Height = 100
          Align = alBottom
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 1
          Author = #1060#1048#1054'  '#1072#1074#1090#1086#1088#1072
          Title = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
          Genre = #1085#1077#1080#1079#1074#1077#1089#1090#1085#1099#1081
          Folder = 'C:\Books\1-1009.zip'
          FileName = '111 '#1048#1074#1072#1085#1086#1074' '#1050#1085#1080#1075#1072'.fb2'
          DesignSize = (
            672
            100)
          object lblTotalBooksF: TRzLabel
            AlignWithMargins = True
            Left = 657
            Top = 3
            Width = 12
            Height = 19
            Alignment = taRightJustify
            Anchors = []
            Caption = '()'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            CenterPoint = cpLowerRight
            ExplicitLeft = 648
          end
          object btnClearFavorites: TRzBitBtn
            Left = 543
            Top = 66
            Width = 118
            Anchors = [akRight, akBottom]
            Caption = #1054#1095#1080#1089#1090#1080#1090#1100
            Enabled = False
            TabOrder = 0
            OnClick = btnClearFavoritesClick
            Kind = bkRetry
          end
        end
      end
      object cpCoverF: TMHLCoverPanel
        AlignWithMargins = True
        Left = 685
        Top = 3
        Width = 250
        Height = 580
        Margins.Left = 0
        Align = alRight
        BorderOuter = fsFlatRounded
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        SizeBarWidth = 5
        TabOrder = 1
        Fb2InfoVisible = False
        FontSize = 0
      end
    end
    object TabSheet6: TRzTabSheet
      HelpContext = 126
      OnShow = TabSheet2Show
      Caption = #1060#1080#1083#1100#1090#1088
      object RzPanel29: TRzPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 682
        Height = 580
        Margins.Right = 0
        Align = alClient
        BorderOuter = fsFlatRounded
        TabOrder = 0
        object RichEdit5: TRichEdit
          Left = 352
          Top = 664
          Width = 185
          Height = 89
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'edClpBrd')
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object pnlFilters: TRzPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 672
          Height = 148
          Align = alTop
          BorderOuter = fsNone
          TabOrder = 1
          object RzGroupBox1: TRzGroupBox
            AlignWithMargins = True
            Left = 258
            Top = 0
            Width = 292
            Height = 144
            Caption = #1060#1072#1081#1083
            TabOrder = 1
            object Label27: TLabel
              Left = 59
              Top = 24
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = #1048#1084#1103
            end
            object Label28: TLabel
              Left = 12
              Top = 46
              Width = 66
              Height = 13
              Alignment = taRightJustify
              Caption = #1055#1072#1087#1082#1072'/'#1040#1088#1093#1080#1074
            end
            object Label29: TLabel
              Left = 16
              Top = 73
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1080#1077
            end
            object Label30: TLabel
              Left = 21
              Top = 100
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1086
            end
            object edFExt: TRzEdit
              Left = 83
              Top = 67
              Width = 94
              Height = 21
              FocusColor = 15138790
              FrameStyle = fsNone
              TabOrder = 2
              OnKeyDown = edFFullNameKeyDown
            end
            object edFFolder: TRzEdit
              Left = 84
              Top = 41
              Width = 201
              Height = 21
              FocusColor = 15138790
              FrameStyle = fsNone
              TabOrder = 1
              OnKeyDown = edFFullNameKeyDown
            end
            object edFFile: TRzEdit
              Left = 84
              Top = 16
              Width = 201
              Height = 21
              FocusColor = 15138790
              FrameStyle = fsNone
              TabOrder = 0
              OnKeyDown = edFFullNameKeyDown
            end
            object cbDeleted: TCheckBox
              Left = 156
              Top = 121
              Width = 125
              Height = 17
              Caption = ' '#1057#1082#1088#1099#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077
              TabOrder = 4
            end
            object cbDownloaded: TRzComboBox
              Left = 12
              Top = 119
              Width = 138
              Height = 21
              ItemHeight = 13
              ReadOnlyColor = clBtnHighlight
              TabOrder = 3
              Text = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077
              Items.Strings = (
                #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077
                #1058#1086#1083#1100#1082#1086' '#1089#1082#1072#1095#1072#1085#1085#1099#1077
                #1058#1086#1083#1100#1082#1086' '#1053#1045' '#1089#1082#1072#1095#1072#1085#1085#1099#1077)
              ItemIndex = 0
            end
            object cbDate: TRzComboBox
              Left = 83
              Top = 94
              Width = 201
              Height = 21
              ItemHeight = 13
              TabOrder = 5
              OnKeyDown = edFFullNameKeyDown
              Items.Strings = (
                #1079#1072' '#1085#1077#1076#1077#1083#1102
                #1079#1072' 2 '#1085#1077#1076#1077#1083#1080
                #1079#1072' '#1084#1077#1089#1103#1094
                #1079#1072' 3 '#1084#1077#1089#1103#1094#1072)
            end
          end
          object RzGroupBox3: TRzGroupBox
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 254
            Height = 102
            Caption = #1050#1085#1080#1075#1072
            TabOrder = 0
            object Label24: TLabel
              Left = 8
              Top = 48
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            end
            object Label26: TLabel
              Left = 25
              Top = 69
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = #1057#1077#1088#1080#1103
            end
            object Label23: TLabel
              Left = 25
              Top = 23
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = #1040#1074#1090#1086#1088
            end
            object edFSeries: TRzEdit
              Left = 62
              Top = 69
              Width = 179
              Height = 21
              FocusColor = 15138790
              FrameStyle = fsNone
              TabOrder = 2
              OnKeyDown = edFFullNameKeyDown
            end
            object edFTitle: TRzEdit
              Left = 62
              Top = 42
              Width = 179
              Height = 21
              FocusColor = 15138790
              FrameStyle = fsNone
              TabOrder = 1
              OnKeyDown = edFFullNameKeyDown
            end
            object edFFullName: TRzEdit
              Left = 62
              Top = 16
              Width = 179
              Height = 21
              FocusColor = 15138790
              FrameStyle = fsNone
              TabOnEnter = True
              TabOrder = 0
              OnKeyDown = edFFullNameKeyDown
            end
          end
          object RzGroupBox4: TRzGroupBox
            AlignWithMargins = True
            Left = 554
            Top = 0
            Width = 115
            Height = 145
            Margins.Left = 554
            Margins.Top = 0
            Align = alClient
            TabOrder = 4
            DesignSize = (
              115
              145)
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
              Left = 47
              Top = 90
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
              Left = 47
              Top = 37
              Width = 31
              Flat = False
              ShowCaption = True
              UseToolbarShowCaption = False
              Caption = '>'
              OnClick = btnInsertFilterTemplateClick
            end
            object RzToolButton4: TRzToolButton
              Tag = 53
              Left = 10
              Top = 37
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
              Top = 63
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
              Top = 63
              Width = 31
              Flat = False
              ShowCaption = True
              UseToolbarShowCaption = False
              Caption = 'OR'
              OnClick = btnInsertFilterTemplateClick
            end
            object RzToolButton9: TRzToolButton
              Tag = 58
              Left = 10
              Top = 117
              Width = 31
              Flat = False
              ShowCaption = True
              UseToolbarShowCaption = False
              Caption = 'NOT'
              OnClick = btnInsertFilterTemplateClick
            end
            object lblTotalBooksFL: TRzLabel
              AlignWithMargins = True
              Left = 99
              Top = 14
              Width = 12
              Height = 19
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Caption = '()'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              CenterPoint = cpLeftCenter
              ExplicitLeft = 90
            end
            object RzToolButton1: TRzToolButton
              Tag = 59
              Left = 10
              Top = 90
              Width = 31
              Flat = False
              ShowCaption = True
              UseToolbarShowCaption = False
              Caption = '" "'
              OnClick = btnInsertFilterTemplateClick
            end
          end
          object btnApplyFilter: TRzBitBtn
            Left = 144
            Top = 115
            Width = 105
            Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            TabOrder = 3
            OnClick = btnApplyFilterClick
            Kind = bkOK
          end
          object btnClearFilterEdits: TRzBitBtn
            Left = 25
            Top = 115
            Width = 105
            Caption = #1054#1095#1080#1089#1090#1080#1090#1100
            TabOrder = 2
            OnClick = btnClearFilterEditsClick
            Kind = bkRetry
          end
        end
        object tvBooksFL: TVirtualStringTree
          Tag = 5
          AlignWithMargins = True
          Left = 5
          Top = 159
          Width = 672
          Height = 310
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          ButtonFillMode = fmShaded
          CheckImageKind = ckXP
          ClipboardFormats.Strings = (
            'CSV'
            'HTML Format'
            'Plain text'
            'Rich Text Format'
            'Rich Text Format Without Objects'
            'Unicode text'
            'Virtual Tree Data')
          Color = 14024447
          Colors.BorderColor = clBackground
          Colors.HotColor = clBlack
          Colors.UnfocusedSelectionBorderColor = clBtnShadow
          DefaultPasteMode = amAddChildFirst
          DragMode = dmAutomatic
          EditDelay = 100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Header.AutoSizeIndex = 0
          Header.Font.Charset = ANSI_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -12
          Header.Font.Name = 'Arial'
          Header.Font.Style = [fsBold]
          Header.Height = 20
          Header.Options = [hoColumnResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible]
          Header.PopupMenu = pmHeaders
          Header.Style = hsFlatButtons
          HintMode = hmTooltip
          HotCursor = crHandPoint
          ParentFont = False
          ParentShowHint = False
          PopupMenu = pmMain
          ShowHint = False
          TabOrder = 2
          TreeOptions.AnimationOptions = [toAnimatedToggle]
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScroll, toAutoTristateTracking, toAutoDeleteMovedNodes]
          TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toPopupMode, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
          TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
          OnAfterCellPaint = tvBooksTreeAfterCellPaint
          OnChange = tvBooksTreeChange
          OnCompareNodes = tvBooksTreeCompareNodes
          OnDblClick = tbtbnReadClick
          OnGetText = tvBooksFGetText
          OnPaintText = tvBooksTreePaintText
          OnHeaderClick = tvBooksTreeHeaderClick
          OnInitNode = tvBooksTreeInitNode
          OnKeyDown = tvBooksTreeKeyDown
          OnMouseUp = tvBooksTreeMouseUp
          Columns = <
            item
              MaxWidth = 1000
              MinWidth = 30
              Position = 0
              Width = 200
              WideText = #1040#1074#1090#1086#1088
            end
            item
              MaxWidth = 1000
              MinWidth = 30
              Position = 1
              Spacing = 10
              Width = 200
              WideText = #1053#1072#1079#1074#1072#1085#1080#1077
              WideHint = 
                'Text is initially centered and has a left-to-right directionalit' +
                'y.'
            end
            item
              MaxWidth = 1000
              MinWidth = 30
              Position = 2
              Width = 200
              WideText = #1057#1077#1088#1080#1103
            end
            item
              Alignment = taCenter
              MaxWidth = 60
              MinWidth = 30
              Position = 3
              Spacing = 10
              Width = 45
              WideText = #8470
              WideHint = 
                'Text is initially left aligned and has a left-to-right direction' +
                'ality.'
            end
            item
              Alignment = taCenter
              MaxWidth = 100
              MinWidth = 65
              Position = 4
              Spacing = 10
              Width = 65
              WideText = #1056#1072#1079#1084#1077#1088
              WideHint = 
                'Text is initially left aligned and has a right-to-left direction' +
                'ality.'
            end
            item
              Alignment = taCenter
              MaxWidth = 60
              MinWidth = 60
              Position = 5
              Width = 60
              WideText = #1056#1077#1081#1090#1080#1085#1075
            end
            item
              MinWidth = 30
              Position = 6
              Width = 205
              WideText = #1046#1072#1085#1088
            end
            item
              Position = 7
              Width = 80
              WideText = #1044#1086#1073#1072#1074#1083#1077#1085#1086
            end>
        end
        object ipnlFilter: TMHLInfoPanel
          AlignWithMargins = True
          Left = 5
          Top = 475
          Width = 672
          Height = 100
          Align = alBottom
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 3
          Author = #1060#1048#1054'  '#1072#1074#1090#1086#1088#1072
          Title = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
          Genre = #1085#1077#1080#1079#1074#1077#1089#1090#1085#1099#1081
          Folder = 'C:\Books\1-1009.zip'
          FileName = '111 '#1048#1074#1072#1085#1086#1074' '#1050#1085#1080#1075#1072'.fb2'
        end
      end
      object cpCoverFL: TMHLCoverPanel
        AlignWithMargins = True
        Left = 685
        Top = 3
        Width = 250
        Height = 580
        Margins.Left = 0
        Align = alRight
        BorderOuter = fsFlatRounded
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        SizeBarWidth = 5
        TabOrder = 1
        Fb2InfoVisible = False
        FontSize = 0
      end
    end
  end
  object MainMenu: TMainMenu
    Images = ilMainMenu
    OwnerDraw = True
    Left = 64
    Top = 448
    object miBook: TMenuItem
      Caption = #1050#1085#1080#1075#1072
      HelpContext = 105
      object miRead: TMenuItem
        Caption = #1063#1080#1090#1072#1090#1100
        ImageIndex = 12
        OnClick = tbtbnReadClick
      end
      object miDevice: TMenuItem
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
        ImageIndex = 7
        ShortCut = 16452
        OnClick = tbSendToDeviceClick
      end
      object mmiScripts: TMenuItem
        Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
        ImageIndex = 29
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object miEdit: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        ImageIndex = 3
        object miEditAuthor: TMenuItem
          Caption = #1040#1074#1090#1086#1088
          OnClick = miEditAuthorClick
        end
        object miEditGenres: TMenuItem
          Caption = #1046#1072#1085#1088#1099
          OnClick = miEditGenresClick
        end
        object miEditSeries: TMenuItem
          Caption = #1057#1077#1088#1080#1103
          OnClick = miEditSeriesClick
        end
        object miEditBook: TMenuItem
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          OnClick = miEditBookClick
        end
      end
      object miDeleteBook: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        ImageIndex = 0
        OnClick = miDeleteBookClick
      end
      object miDownloadBooks: TMenuItem
        Caption = #1057#1082#1072#1095#1072#1090#1100
        ImageIndex = 20
        ShortCut = 16452
        OnClick = miDownloadBooksClick
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object miCopyToCollection: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1082#1086#1083#1083#1077#1082#1094#1080#1102
        Enabled = False
        ImageIndex = 23
        object CopyToCollection: TMenuItem
          OnClick = CopyToCollectionClick
        end
      end
      object miImport: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        Enabled = False
        object miFb2ZipImport: TMenuItem
          Caption = 'fb2  ('#1080#1079' .zip)'
          ImageIndex = 22
          OnClick = miFb2ZipImportClick
        end
        object miFb2Import: TMenuItem
          Caption = 'fb2'
          ImageIndex = 18
          OnClick = miFb2ImportClick
        end
        object miPdfdjvu: TMenuItem
          Caption = #1085#1077'-fb2'
          ImageIndex = 8
          OnClick = miPdfdjvuClick
        end
      end
      object N28: TMenuItem
        Caption = '-'
      end
      object miSettings: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        ImageIndex = 11
        OnClick = miSettingsClick
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object miQuitApp: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        ImageIndex = 33
        OnClick = miQuitAppClick
      end
    end
    object N2: TMenuItem
      Caption = #1050#1086#1083#1083#1077#1082#1094#1080#1080
      HelpContext = 112
      object miNewCollection: TMenuItem
        Caption = '&'#1053#1086#1074#1072#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1103'...'
        ShortCut = 16462
        OnClick = ShowNewCollectionWizard
      end
      object miCollSelect: TMenuItem
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Enabled = False
        ImageIndex = 27
      end
      object miCollsettings: TMenuItem
        Caption = #1057#1074#1086#1081#1089#1090#1074#1072
        Enabled = False
        ImageIndex = 19
        OnClick = miCollsettingsClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object miDeleteCol: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        ImageIndex = 2
        OnClick = miDeleteColClick
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object miTools: TMenuItem
        Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
        ImageIndex = 6
        object miStat: TMenuItem
          Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
          Enabled = False
          ImageIndex = 28
          OnClick = miStatClick
        end
        object N6: TMenuItem
          Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          Enabled = False
          Visible = False
          object miSaveUser: TMenuItem
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          end
          object miLoadUser: TMenuItem
            Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          end
          object N31: TMenuItem
            Caption = '-'
          end
          object miRepairUser: TMenuItem
            Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1086#1096#1080#1073#1082#1080
          end
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object miCollectionExport: TMenuItem
          Caption = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' xml'
          Enabled = False
          ImageIndex = 10
          OnClick = miCollectionExportClick
        end
        object miCollectionImport: TMenuItem
          Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1079' xml'
          Enabled = False
          ImageIndex = 5
          OnClick = miCollectionImportClick
        end
        object N26: TMenuItem
          Caption = '-'
        end
        object miRefreshGenres: TMenuItem
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082'  '#1078#1072#1085#1088#1086#1074
          Enabled = False
          ImageIndex = 25
          OnClick = miRefreshGenresClick
        end
        object miUpdate: TMenuItem
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1082#1072#1090#1072#1083#1086#1075'  lib.rus.ec'
          ImageIndex = 34
          OnClick = miUpdateClick
        end
        object miSyncOnline: TMenuItem
          Caption = #1057#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083#1099
          OnClick = miSyncOnlineClick
        end
      end
    end
    object N5: TMenuItem
      Caption = '?'
      object miShowHelp: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
        ImageIndex = 17
        ShortCut = 112
        OnClick = miShowHelpClick
      end
      object miCheckUpdates: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1085#1072#1083#1080#1095#1080#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
        OnClick = miCheckUpdatesClick
      end
      object N30: TMenuItem
        Caption = '-'
      end
      object miGoDonate: TMenuItem
        Caption = #1055#1086#1073#1083#1072#1075#1086#1076#1072#1088#1080#1090#1100' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1086#1074
        OnClick = miGoDonateClick
      end
      object miGoSite: TMenuItem
        Caption = #1054#1092#1080#1094#1080#1072#1083#1100#1085#1099#1081' '#1089#1072#1081#1090
        OnClick = miGoSiteClick
      end
      object miGoForum: TMenuItem
        Caption = #1060#1086#1088#1091#1084' '#1087#1086#1076#1076#1077#1088#1078#1082#1080
        OnClick = miGoForumClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = miAboutClick
      end
    end
  end
  object pmMain: TPopupMenu
    AutoPopup = False
    Images = ilMainMenu
    OwnerDraw = True
    Left = 56
    Top = 496
    object pmiReadBook: TMenuItem
      Caption = #1063#1080#1090#1072#1090#1100
      ImageIndex = 12
      ShortCut = 13
      OnClick = tbtbnReadClick
    end
    object pmiSendToDevice: TMenuItem
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
      ImageIndex = 7
      ShortCut = 16452
      OnClick = tbSendToDeviceClick
    end
    object pmiScripts: TMenuItem
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      ImageIndex = 29
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object pmiDownloadBooks: TMenuItem
      Caption = #1057#1082#1072#1095#1072#1090#1100
      ImageIndex = 20
      OnClick = miDownloadBooksClick
    end
    object miGoToAuthor: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1072#1074#1090#1086#1088#1091
      ImageIndex = 35
      ShortCut = 49217
      OnClick = miGoToAuthorClick
    end
    object miBookInfo: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1085#1080#1075#1077
      ShortCut = 16457
      OnClick = miBookInfoClick
    end
    object miBookEdit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077
      ImageIndex = 3
      ShortCut = 16453
      OnClick = miEditBookClick
    end
    object N19: TMenuItem
      Caption = '-'
    end
    object miAddFavorites: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1080#1079#1073#1088#1072#1085#1085#1086#1077
      ImageIndex = 13
      ShortCut = 16454
      OnClick = miAddFavoritesClick
    end
    object miDelFavorites: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1080#1079#1073#1088#1072#1085#1085#1086#1075#1086
      ImageIndex = 21
      Visible = False
      OnClick = miDelFavoritesClick
    end
    object miRate: TMenuItem
      Caption = #1056#1077#1081#1090#1080#1085#1075
      ImageIndex = 30
      object miSetRate: TMenuItem
        Tag = 1
        Caption = '*'
        OnClick = miSetRateClick
      end
      object miSetRate2: TMenuItem
        Tag = 2
        Caption = '* *'
        OnClick = miSetRateClick
      end
      object miSetRate3: TMenuItem
        Tag = 3
        Caption = '* * *'
        OnClick = miSetRateClick
      end
      object miSetRate4: TMenuItem
        Tag = 4
        Caption = '* * * *'
        OnClick = miSetRateClick
      end
      object miSetRate5: TMenuItem
        Tag = 5
        Caption = '* * * * *'
        OnClick = miSetRateClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object miClearRate: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        OnClick = miClearRateClick
      end
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object pmiSelectAll: TMenuItem
      Tag = 2
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 24
      ShortCut = 16449
      OnClick = pmiSelectAllClick
    end
    object pmiDeselectAll: TMenuItem
      Tag = 1
      Caption = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1080
      ImageIndex = 32
      ShortCut = 16469
      OnClick = pmiDeselectAllClick
    end
    object N23: TMenuItem
      Caption = '-'
      Hint = '-'
    end
    object miCopyClBrd: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088
      ImageIndex = 31
      ShortCut = 16451
      OnClick = miCopyClBrdClick
    end
  end
  object dlgFolder: TRzSelDirDialog
    CenterToParent = True
    Position = poOwnerFormCenter
    AllowCreate = True
    DriveTypes = [dtFloppy, dtFixed, dtNetwork, dtCDROM, dtRAM]
    Prompt = #1055#1072#1087#1082#1072
    PromptFolders = 'Folders'
    PromptDrives = 'Drives'
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1091#1090#1100
    CaptionOK = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 488
    Top = 408
  end
  object VersionInfo: TRzVersionInfo
    FilePath = 'MyHomeLib.exe'
    Left = 488
    Top = 344
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 520
    Top = 376
  end
  object pmAuthor: TPopupMenu
    OwnerDraw = True
    Left = 144
    Top = 496
    object miCopyAuthor: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088' '
      ShortCut = 16451
      OnClick = miCopyAuthorClick
    end
  end
  object ilToolBar: TImageList
    BlendColor = clWhite
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Left = 336
    Top = 408
    Bitmap = {
      494C010117001800040020002000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000C000000001002000000000000080
      010000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBF
      BFFFBFBFBFFF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FF515151FF515151FFBFBFBFFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008F8B8BFF8F8B8BFF8F8B
      8BFF8F8B8BFF8F8B8BFF8F8B8BFF8F8B8BFF8F8B8BFF8F8B8BFF8F8B8BFF8F8B
      8BFF8F8B8BFF8F8B8BFF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00666666FF666666FF666666FF666666FF666666FF666666FF6666
      66FF666666FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBF
      BFFFFEFEFEFFBCBCBCFF4A503CFF032A20FF001D09FF001D09FF001D09FF001D
      09FF001D09FF637B6BFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB4BDFFB29FA5FFBFBFBFFFBFBF
      BFFFBFBFBFFFBFBFBFFFBD9DA7FFA78590FFD1D0D1FFBFBFBFFFBFBFBFFFBFBF
      BFFFC9B9BEFFAF949DFF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFEFFFEFEFCFFFDFDFCFFFDFDFAFFFCFCF8FFFBFBF8FFFAFAF5FFF8F8
      F4FFFBFBF5FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FF353636FF3A3A
      3AFF3A3A3AFF383939FF383939FF383939FF383939FF383839FF383939FF3939
      39FFBABABAFFADABAAFF9CAF77FF31A077FF528719FF4E8513FF4D8511FF4C84
      0DFF498308FF1A3C06FF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FF353636FF3A3A
      3AFF3A3A3AFF383939FF383939FF383939FFC28498FF8F2648FF8A2747FF7E2B
      45FF7F324BFF862B48FF952F4FFF973151FF852745FF7E3049FF802E49FF8928
      47FF932B4DFFA36277FF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FF353636FF3A3A
      3AFF3A3A3AFF383939FF383939FF383939FF383939FF383839FF383939FF3939
      39FFCCCCBBFFCBCBBAFFDCDCCBFFD2D2C1FFFBFBF8FFFAFAF5FFF8F8F4FFF7F7
      F2FFFBFBF5FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBFFF323131FF333333FF3736
      37FF373534FF373533FF393636FF393632FF373532FF373633FF363433FF3431
      2FFF9A9897FFDBD8D5FF525D3CFF717667FF6A784EFF5F7535FF5B732BFF5471
      1BFF4D6F09FF6B8955FF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBFFF323131FF333333FF3736
      37FF373534FF373533FF393636FF393632FFC18296FFA4516BFFB0687FFFAD65
      7BFFAA6076FFA7586FFFA14963FFAA5971FFB57085FFAC6379FFA75A71FFAA5E
      76FFAF607AFF9D5B71FF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBFFF323131FF333333FF3736
      37FF373534FF373533FF393636FF393632FF373532FF373633FF363433FF3431
      2FFFEDEDDCFFEDEDDCFFECECDBFFEBEBDAFFFAFAF5FFF8F8F4FFF7F7F2FFF6F6
      F0FFFAFAF2FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00747475FF615C5BFF87807CFF7E77
      71FF8D8586FF867D7EFF7F7975FF7B7571FF79736FFF736D6AFF68615DFF8078
      79FFC7C5C4FF757371FFA78A66FF2F6850FF6A3B00FF683B00FF683A00FF663A
      00FF653A00FF593D13FF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00747475FF615C5BFF87807CFF7E77
      71FF8D8586FF867D7EFF7F7975FF7B7571FFC18296FFA6566FFFC48D9EFFD7B0
      BCFFDAB5BFFFC18798FFA34D66FFAB5D74FFD5ABB7FFDDBAC5FFCC9DACFFBD82
      95FFB0637CFF965268FF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00747475FF615C5BFF87807CFF7E77
      71FF8D8586FF867D7EFF7F7975FF7B7571FF79736FFF736D6AFF68615DFF8078
      79FFCBCBBAFFDBDBCAFFC9C9B8FFC7C7B6FFD7D7C6FFD6D6C5FFCCCCBBFFD3D3
      C2FFFAFAF2FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF676260FF8C8884FF7B76
      72FF989391FF888080FF7F7977FF7C7672FF7B7470FF746E6BFF605B56FF8983
      80FF666565FFD4D2D0FFC79D6FFFB8C9ADFFDEAC69FFDBA55CFFDA9F51FFD899
      46FFD7923AFF6F4913FF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF676260FF8C8884FF7B76
      72FF989391FF888080FF7F7977FF7C7672FFC18296FFA65670FFC48D9EFFD7B0
      BCFFDAB5BFFFC18798FFA34D66FFAB5D74FFD5ABB7FFDDBAC5FFCC9DACFFBD82
      95FFAE607AFF8F4960FF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF676260FF8C8884FF7B76
      72FF989391FF888080FF7F7977FF7C7672FF7B7470FF746E6BFF605B56FF8983
      80FFECECDBFFEBEBDAFFE9E9D8FFE8E8D7FFE7E7D6FFE5E5D4FFE4E4D3FFE3E3
      D2FFF9F9EFFF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006D6D6DFF767272FF96918EFF7F79
      75FF6F6A66FF736E69FF7A7572FF7D7774FF7E7875FF78726FFF69635EFF5F5A
      56FFD9D6D5FF9C9896FF3C3A47FF011E29FF00001DFF00001EFF00001EFF0000
      1EFF00001EFF636381FF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006D6D6DFF767272FF96918EFF7F79
      75FF6F6A66FF736E69FF7A7572FF7D7774FFC18296FFA65670FFC48D9EFFD7B0
      BCFFDAB5BFFFC18798FFA34D66FFAB5D74FFD5ABB7FFDDBAC5FFCC9DACFFBD82
      95FFAC5E78FF8A4259FF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006D6D6DFF767272FF96918EFF7F79
      75FF6F6A66FF736E69FF7A7572FF7D7774FF7E7875FF78726FFF69635EFF5F5A
      56FFC9C9B8FFC7C7B6FFC6C6B5FFD6D6C5FFC3C3B2FFD3D3C2FFD2D2C1FFC8C8
      B7FFF7F7EAFF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373FF7C7978FF979291FF8781
      80FF7C7977FF7E7A79FF837E7CFF817C7BFF847E7BFF7F7A77FF726D69FF6B67
      65FF888686FF9C9A98FF8A82ADFF397DA6FF55168FFF53138FFF52118FFF510F
      8FFF4E0D8CFF1E0666FF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373FF7C7978FF979291FF8781
      80FF7C7977FF7E7A79FF837E7CFF817C7BFFC18296FFA75770FFC48E9FFFD8B1
      BEFFDBB6C1FFC48C9CFFA7566EFFB0677CFFD8B1BCFFDFBFC9FFD0A3B2FFC189
      9BFFAD6079FF853B53FF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373FF7C7978FF979291FF8781
      80FF7C7977FF7E7A79FF837E7CFF817C7BFF847E7BFF7F7A77FF726D69FF6B67
      65FFE9E9D8FFE8E8D7FFE7E7D6FFE5E5D4FFE4E4D3FFE3E3D2FFE2E2D1FFE0E0
      CFFFF4F4E5FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF4C4949FF5F5A5CFF6560
      61FF625C5DFF696464FF7E7577FF716668FF686163FF50494BFF3B3434FF362F
      2EFF9A9897FFDAD6D8FF66398EFFA56EC6FFA75DCEFF9F4ECDFF9B45CDFF993F
      CEFF8D34C2FF411D80FF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF4C4949FF5F5A5CFF6560
      61FF625C5DFF696464FF7E7577FF716668FFC18296FFA75770FFC48EA0FFD8B2
      BEFFDCB6C2FFC48C9CFFA7576EFFB0677DFFD8B1BCFFE0BFC9FFD1A6B3FFC48E
      A0FFAF667EFF81344DFF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF4C4949FF5F5A5CFF6560
      61FF625C5DFF696464FF7E7577FF716668FF686163FF50494BFF3B3434FF362F
      2EFFC6C6B5FFD6D6C5FFC3C3B2FFC2C2B1FFC1C1B0FFC0C0AFFFCFCFBEFFC6C6
      B5FFF3F3E2FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF575353FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFA4A2A3FFA09D9EFF9B999AFF9C99
      9AFFC9C6CCFF4E487DFF1F5C8FFF0E94ACFF312C85FF47077FFF47077FFF4707
      7DFF401A78FFAEA9C5FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF575353FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFC08195FFA65770FFC48E9FFFD8B1
      BDFFDBB6C1FFC38B9BFFA7556DFFB0667BFFD7B0BCFFDFBFC9FFD1A5B3FFC38E
      9FFFAF647CFF7E2E49FF8F8B8BFFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF575353FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFA4A2A3FFA09D9EFF9B999AFF9C99
      9AFFE7E7D6FFE5E5D4FFE4E4D3FFE3E3D2FFF1F1E7FFECECDFFFE8E8D9FFE6E6
      D5FFF2F2E1FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C797AFF868483FF1412
      11FF1C1A19FF1B1919FF1B1818FF1B1919FF1B1A1AFF1C1A17FF1A1919FF1C1B
      1BFF3D3368FF191B65FF0F4F81FF123A74FF1E1468FF1E1367FF1F1366FF1816
      62FFAAAAC2FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C797AFF868483FF1412
      11FF1C1A19FF1B1919FF1B1818FF1B1919FFC3879AFFA65670FFC48D9EFFD7B1
      BDFFDBB5C1FFC38A9BFFA6546BFFAF647AFFD7B0BBFFDFBEC9FFD0A4B2FFC38D
      9EFFAD637BFF91455CFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C797AFF868483FF1412
      11FF1C1A19FF1B1919FF1B1818FF1B1919FF1B1A1AFF1C1A17FF1A1919FF1C1B
      1BFFF2F2E1FFC2C2B1FFD2D2C1FFC8C8B7FFECECDFFFE8E8D9FFE6E6D5FFE5E5
      D4FFF2F2E1FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C7979FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFF4F2
      F2FFE9E8E8FFE1DFDFFF878384FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C7979FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFF9F4F6FFD2AAB7FFC794A4FFD7B0
      BCFFDBB5C0FFC3899AFFAA5C71FFB57083FFD7AFBBFFDFBEC8FFD0A4B2FFC490
      A2FFC490A2FFF4ECEEFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C7979FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFF4F2
      F2FFF5F5EEFFF4F4ECFFF1F1E7FFECECDFFFE8E8D9FFE6E6D5FFB5B5A4FFB5B5
      A4FFB5B5A4FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFF4F4F4FFE7E6E7FF918C8CFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC490A2FFC490
      A2FFC490A2FFC490A2FFC490A2FFC490A2FFC490A2FFC490A2FFC490A2FFC490
      A2FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFF2F2E1FFF1F1E7FFECECDFFFE8E8D9FFE6E6D5FFE5E5D4FFC7C7B6FFFFFF
      FEFFA3A379FF666666FFBFBFBFFFFFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FF948E8FFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FF948E8FFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF2F2E1FFF6F6EAFFF2F2E1FFF2F2E1FFF2F2E1FFF2F2E1FFD3D3C2FFA7A7
      7DFFA7A77DFFFFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF827C7DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF827C7DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF827C7DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF83807FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817D7EFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF83807FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817D7EFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF83807FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817D7EFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00686868FF7E7978FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF7A7676FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00686868FF7E7978FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF7A7676FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00686868FF7E7978FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF7A7676FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006C6C6CFF837F7FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006C6C6CFF837F7FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006C6C6CFF837F7FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00727272FF8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF767372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00727272FF8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF767372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00727272FF8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF767372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF777272FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF777272FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF777272FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00757575FF979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00757575FF979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00757575FF979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00707070FF8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00707070FF8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00707070FF8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF787372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF787372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF787372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00787878FF8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64D31FFF2D2C5FF797371FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00787878FF8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64D31FFF2D2C5FF797371FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00787878FF8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64D31FFF2D2C5FF797371FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868686FF989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF767273FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868686FF989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF767273FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868686FF989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF767273FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00929292FF888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7E7E81FF78797BFF6E6F72FF696A
      6DFF5D5F61FF5A5A5CFF3D3737FF737272FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00929292FF888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7E7E81FF78797BFF6E6F72FF696A
      6DFF5D5F61FF5A5A5CFF3D3737FF737272FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00929292FF888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7E7E81FF78797BFF6E6F72FF696A
      6DFF5D5F61FF5A5A5CFF3D3737FF737272FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0B0B0FF797979FF828282FF6D6D
      6DFF636363FF666666FF5B5B5BFF4E4E4EFF4E4E4EFF4F4F4FFF474747FF4545
      45FF434343FF414141FF393939FFA6A6A6FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0B0B0FF797979FF828282FF6D6D
      6DFF636363FF666666FF5B5B5BFF4E4E4EFF4E4E4EFF4F4F4FFF474747FF4545
      45FF434343FF414141FF393939FFA6A6A6FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0B0B0FF797979FF828282FF6D6D
      6DFF636363FF666666FF5B5B5BFF4E4E4EFF4E4E4EFF4F4F4FFF474747FF4545
      45FF434343FF414141FF393939FFA6A6A6FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9FFF8C8C8CFF8080
      80FF7A7A7AFF7C7C7CFF7A7A7AFF767676FF767676FF787878FF767676FF7575
      75FF767676FF727272FF868686FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9FFF8C8C8CFF8080
      80FF7A7A7AFF7C7C7CFF7A7A7AFF767676FF767676FF787878FF767676FF7575
      75FF767676FF727272FF868686FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9FFF8C8C8CFF8080
      80FF7A7A7AFF7C7C7CFF7A7A7AFF767676FF767676FF787878FF767676FF7575
      75FF767676FF727272FF868686FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB13FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FF515151FF515151FF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFC1
      C3BB21272FFF5A5E64FB9DA0A3DDE9E9EA59FFFFFF0074818AFF405669FF4056
      69FF405669FF405669FF405669FF405669FF405669FF405669FF405669FF4056
      69FF405669FF405669FF405669FF405669FF405669FF405669FF405669FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF405669FF4056
      69FF405669FF405669FF405669FF405669FF405669FF405669FF405669FF4056
      69FF405669FF405669FF405669FF405669FF405669FF405669FF405669FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0064BFFDFF71C4FCFF9FD6FCFFA4D8FCFF98D3FCFF78C2F5FF71C3F9FF76C6
      FCFF8DCFFCFF8BCEFCFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A7D
      82F15D6369FF9A9CA0FF181F27FF6D7176A7FFFFFF0074818AFF475F73FF475F
      73FF475F73FF475F73FF475F73FF475F73FF475F73FF475F73FF475F73FF475F
      73FF475F73FF475F73FF475F73FF475F73FF475F73FF475F73FF4B5F73FF4056
      69FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF475F73FF475F
      73FF475F73FF475F73FF475F73FF475F73FF475F73FF475F73FF475F73FF475F
      73FF475F73FF475F73FF475F73FF475F73FF475F73FF475F73FF4B5F73FF4056
      69FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FF353636FF3A3A
      3AFF3A3A3AFF383939FF383939FF383939FF383939FF383839FF383939FF3939
      39FF84CDFDFF91D2FDFF99D5FCFFA2D7F9FF94C6E8FF86AFCCFF80B9E0FF75C6
      FDFF67C0FDFF82CCFDFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00465764FF122C46FF122C
      46FF122C46FF122C46FF122C46FF122C46FFFFFFFF00FFFFFF00FFFFFF004247
      4DFEA6AAAFFFF3F6F7FF53575DFFA8AAAD55FFFFFF0074818AFF4E667AFF4E66
      7AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4E66
      7AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4B5F73FF526A
      80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF4E667AFF4E66
      7AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4E66
      7AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4E667AFF4B5F73FF526A
      80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBFFF323131FF333333FF3736
      37FF373534FF373533FF393636FF393632FF373532FF373633FF363433FF3431
      2FFF97D4FDFFA2D9FCFF99D6FCFF8AC5EBFF8FA6B6FF828A90FF7BA4BFFF5EBD
      FDFF67C1FCFF6BC2FCFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00465764FF65A4DBFF5799
      D5FF498FCFFF3C86C9FF307DC3FF122C46FFFFFFFF00FFFFFF00FAFAFA13252A
      32FFD8DBDFFFF3F6F7FF53575DFFE4E5E662FFFFFF0074818AFF556E85FF556E
      85FF556E85FF556E85FF556E85FF556E85FF556E85FF556E85FF556E85FF556E
      85FF556E85FF556E85FF556E85FF556E85FF556E85FF556E85FF4B5F73FF5D77
      8CFF526A80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF556E85FF556E
      85FF556E85FF556E85FF556E85FF556E85FF556E85FF556E85FF556E85FF556E
      85FF556E85FF556E85FF556E85FF556E85FF556E85FF556E85FF4B5F73FF5D77
      8CFF526A80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00747475FF615C5BFF87807CFF7E77
      71FF8D8586FF867D7EFF7F7975FF7B7571FF79736FFF736D6AFF68615DFF8078
      79FFA4DAFDFF94D1F7FF89BDDFFFA6B6C1FF999A9CFF83888CFF59ACE3FF6AC1
      FBFF2AA8FCFF51B8FCFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00465764FF79B3E4FF6BA8
      DEFF5D9ED7FF4F94D1FF428ACCFF122C46FFFFFFFF00FFFFFF00D1D2D4902D33
      3BFFF9FBFCFFCDD1D5FF292F37FFFFFFFF00FFFFFF0074818AFF5A768FFF5A76
      8FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF5A76
      8FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF4B5F73FF5D79
      91FF5D778CFF526A80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF5A768FFF5A76
      8FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF5A76
      8FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF5A768FFF4B5F73FF5D79
      91FF5D778CFF526A80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF676260FF8C8884FF7B76
      72FF989391FF888080FF7F7977FF7C7672FF7B7470FF746E6BFF605B56FF8983
      80FFAEDDFBFF99B7CBFFB0B4B6FFDFDFDFFFC9C9C9FF8199A9FF33A8F6FF74C6
      FBFF51B8FCFF85CCFCFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00435F5FFF0F2A2BFF465764FF8EC2EDFF7FB7
      E6FF71ADE0FF63A2DAFF5598D4FF122C46FFFFFFFF00FFFFFF00909397E4555B
      62FFFFFFFFFF959A9FFF53575DFCFFFFFF00FFFFFF0074818AFF607D96FF607D
      96FF607D96FF607D96FF607D96FF607D96FF607D96FF607D96FF607D96FF607D
      96FF607D96FF607D96FF607D96FF607D96FF607D96FF607D96FF4B5F73FF5D79
      91FF5D7991FF5D778CFF526A80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF607D96FF607D
      96FF607D96FF607D96FF607D96FF607D96FF607D96FF607D96FF607D96FF607D
      96FF607D96FF607D96FF607D96FF607D96FF607D96FF607D96FF4B5F73FF5D79
      91FF5D7991FF5D778CFF526A80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006D6D6DFF767272FF96918EFF7F79
      75FF6F6A66FF736E69FF7A7572FF7D7774FF7E7875FF78726FFF69635EFF5F5A
      56FFBAE3FDFFB7CAD7FFC7C7C8FFD0D0D0FFE3E3E3FFA0ADB6FF72ABCFFF4BA9
      E8FF5ABAF9FF8CCFFCFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00435F5FFF64E3E6FF465764FFA2D2F5FF94C8
      EFFF85BCE9FF77B1E3FF69A7DDFF122C46FFFFFFFF00FFFFFF00575B61FC989D
      A2FFFFFFFFFF5C6168FF8F9296E4FFFFFF00FFFFFF0074818AFF6787A1FF6787
      A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787
      A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF4B5F73FF6481
      9CFF5D7991FF5D7991FF5D778CFF526A80FF405669FFFFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF6787A1FF6787
      A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787
      A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF6787A1FF4B5F73FF6481
      9CFF5D7991FF5D7991FF5D778CFF526A80FF405669FFFFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373FF7C7978FF979291FF8781
      80FF7C7977FF7E7A79FF837E7CFF817C7BFF847E7BFF7F7A77FF726D69FF6B67
      65FFBAE2FDFFC5DFF1FFC2C6C9FFC7C7C7FFE2E2E2FFB4B3B4FF818284FF828C
      93FF80A9C3FF75C5FCFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00435F5FFF77E7E9FF465764FFB5E0FEFFA8D6
      F8FF9ACCF2FF8CC1ECFF7DB6E5FF122C46FFFFFFFF00FFFFFF003A4047FF2B31
      38FF676B71FF262D35FFD2D3D48EFFFFFF00FFFFFF0074818AFF6D8CA8FF6D8C
      A8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8C
      A8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF4B5F73FF6481
      9CFF64819CFF5D7991FF5D7991FF5D778CFF526A80FF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF6D8CA8FF6D8C
      A8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8C
      A8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF6D8CA8FF4B5F73FF6481
      9CFF64819CFF5D7991FF5D7991FF5D778CFF526A80FF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF4C4949FF5F5A5CFF6560
      61FF625C5DFF696464FF7E7577FF716668FF686163FF50494BFF3B3434FF362F
      2EFFB4DFFDFFC2E4FBFFBBC9D3FFDCDCDDFFDEDEDEFF8A8A8AFF858F95FF8BAB
      C0FF82C0EAFF71C4FCFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00615A55FF403730FF435F5FFF89EAECFF465764FF94B1C0FF6279
      89FF5F7688FF5C7486FF7399B6FF122C46FFFFFFFF00EBECEC50161C25FF2127
      2FFF161C24FF20262EFFFCFCFD10FFFFFF00FFFFFF0074818AFF7495B2FF7495
      B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495
      B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF4B5F73FF6786
      A1FF64819CFF64819CFF5D7991FF5D7991FF5D778CFF526A80FF405669FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF7495B2FF7495
      B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495
      B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF7495B2FF4B5F73FF6786
      A1FF64819CFF64819CFF5D7991FF5D7991FF5D778CFF526A80FF405669FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF575353FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFA4A2A3FFA09D9EFF9B999AFF9C99
      9AFFA0D6FCFFB2DFFDFFB3D5EBFFB0B8BEFFA8B5BDFF9DBFD5FF9CCFF1FF8FD0
      FCFF7BC9FDFF69C1FDFF515151FFBFBFBFFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00615A55FFEED0B8FF435F5FFF9CEDEFFF465764FF9EB8C0FF667C
      89FF637A89FF607788FF80A2BCFF122C46FFFFFFFF00B6B8BACB0C121AFF2329
      31FF1B2129FF53575DFEFFFFFF00FFFFFF00FFFFFF0074818AFF799CBAFF799C
      BAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF799C
      BAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF4B5F73FF6786
      A1FF6786A1FF64819CFF64819CFF5D7991FF5D7991FF5D778CFF526A80FF4056
      69FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF799CBAFF799C
      BAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF799C
      BAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF799CBAFF4B5F73FF6786
      A1FF6786A1FF64819CFF64819CFF5D7991FF5D7991FF5D778CFF526A80FF4056
      69FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C797AFF868483FF1412
      11FF1C1A19FF1B1919FF1B1818FF1B1919FF1B1A1AFF1C1A17FF1A1919FF1C1B
      1BFF94D2FCFFA7DAFCFFACDCFCFFA0CAE5FFA5D5F5FF9ED7FDFF92D2FDFF82CC
      FDFF71C5FDFF60BEFDFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00615A55FFF0D6C0FF435F5FFFADF1F2FF465764FFE8FFFFFFDEFD
      FFFFD3F5FFFFC7EDFFFFB9E3FFFF122C46FFFFFFFF007F8287F7111720FF2329
      31FF10151EFF898C90F3FFFFFF00FFFFFF00FFFFFF0074818AFF7EA2C2FF7EA2
      C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2
      C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF4B5F73FF6888
      A3FF6786A1FF6786A1FF64819CFF64819CFF5D7991FF5D7991FF5D778CFF526A
      80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFFFF0074818AFF7EA2C2FF7EA2
      C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2
      C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF7EA2C2FF4B5F73FF6888
      A3FF6786A1FF6786A1FF64819CFF64819CFF5D7991FF5D7991FF5D778CFF526A
      80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C7979FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFF4F2
      F2FFE9E8E8FFE1DFDFFF878384FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000081
      C4FF005A95FF005995FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00006BAEFF0057
      92FF005791FF615A55FFF2DBCAFF435F5FFFA5D6D7FF465764FF465764FF4657
      64FF465764FF465764FF465764FF465764FFFFFFFF00494E55FF1C222AFF2329
      31FF0B121AFFC1C3C5BAFFFFFF00FFFFFF00FFFFFF005F6C73FF556166FF5561
      66FF6D8EABFF5E7A91FF5E7A91FF5E7A91FF5E7A91FF5E7A91FF5E7A91FF5E7A
      91FF5E7A91FF6D8EABFF6D8EABFF556166FF556166FF51687AFF4B5F73FF6888
      A3FF6888A3FF6786A1FF6786A1FF64819CFF64819CFF5D7991FF5D7991FF5D77
      8CFF526A80FF405669FFFFFFFF00FFFFFF00FFFFFF005F6C73FF556166FF5561
      66FF6D8EABFF5E7A91FF5E7A91FF5E7A91FF5E7A91FF5E7A91FF5E7A91FF5E7A
      91FF5E7A91FF6D8EABFF6D8EABFF556166FF556166FF51687AFF4B5F73FF6888
      A3FF6888A3FF6786A1FF6786A1FF64819CFF64819CFF5D7991FF5D7991FF5D77
      8CFF526A80FF405669FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFF4F4F4FFE7E6E7FF918C8CFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007E
      C1FF05DCFFFF00C4F4FF005994FF005A95FF0673AFFF0081C1FF00B6F4FF00C5
      FFFF005791FF615A55FFF4E1D3FF435F5FFFB1D8D9FF6C8F8FFF688E8EFF658D
      8EFF8DD2D3FF0F2A2BFFFFFFFF00FFFFFF00F7F7F72621272FFF232931FF242A
      32FF181F27FFEFF0F041FFFFFF00FFFFFF00FFFFFF00FFFFFF005F6C73FF5561
      66FF6D8EABFF4B5F73FF4B5F73FF4B5F73FF4B5F73FF4B5F73FF4B5F73FF4B5F
      73FF4B5F73FF6D8EABFF556166FFE0D7D1FF706860FF374859FF4B5F73FF6C8C
      A8FF6C8CA8FF6888A3FF6786A1FF6786A1FF64819CFF64819CFF5D7991FF5D79
      91FF5D778CFF526A80FF51687AFFFFFFFF00FFFFFF00FFFFFF005F6C73FF5561
      66FF6D8EABFF4B5F73FF4B5F73FF4B5F73FF4B5F73FF4B5F73FF4B5F73FF4B5F
      73FF4B5F73FF6D8EABFF556166FFE0D7D1FF706860FF374859FF4B5F73FF6C8C
      A8FF6C8CA8FF6888A3FF6786A1FF6786A1FF64819CFF64819CFF5D7991FF5D79
      91FF5D778CFF526A80FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FF948E8FFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000678
      B5FF04D3FBFF05DEFFFF00D8FFFF00B7EEFF00B4EEFF00CEFFFF00CDFFFF00BE
      FBFF0064A2FF615A55FFF6E7DBFF435F5FFFDBF9F9FFD2F7F8FFC8F5F6FFBCF3
      F4FFB1F1F2FF0F2A2BFFFFFFFF00FFFFFF00CDCFD0A40C131BFF232931FF1F25
      2DFF3E444BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005F6C
      73FF556166FF556166FF556166FF556166FF556166FF556166FF556166FF5561
      66FF556166FF556166FFE0D7D1FFE0D7D1FF706860FF6E645EFF374859FF5168
      7AFF6C8CA8FF6C8CA8FF6C8CA8FF6786A1FF6786A1FF64819CFF64819CFF5D79
      91FF5D7991FF5D778CFF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF005F6C
      73FF556166FF556166FF556166FF556166FF556166FF556166FF556166FF5561
      66FF556166FF556166FFE0D7D1FFE0D7D1FF706860FF6E645EFF374859FF5168
      7AFF6C8CA8FF6C8CA8FF6C8CA8FF6786A1FF6786A1FF64819CFF64819CFF5D79
      91FF5D7991FF5D778CFF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF827C7DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C78
      B4FF04CAF4FF06DEFFFF02D8FFFF01D8FFFF00D5FFFF00CEFFFF00CDFFFF00B9
      F4FF0573B1FF615A55FFDACFC7FF435F5FFF435F5FFF435F5FFF435F5FFF435F
      5FFF435F5FFF435F5FFFFFFFFF00FFFFFF0095989CED0B1119FF232931FF131A
      22FF73777CFAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005F6C73FF556166FF556166FF8A8480FFE3DEDAFFE0D7D1FFE0D7D1FFE0D7
      D1FFE0D7D1FFE0D7D1FFE0D7D1FFE0D7D1FF706860FF6E645EFFA3D1D0FF3748
      59FF51687AFF6C8CA8FF6C8CA8FF6C8CA8FF6786A1FF6786A1FF64819CFF6481
      9CFF5D7991FF5D7991FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005F6C73FF556166FF556166FF8A8480FFE3DEDAFFE0D7D1FF2B5C2BFF2B5C
      2BFFE0D7D1FFE0D7D1FFE0D7D1FFE0D7D1FF706860FF6E645EFFA3D1D0FF3748
      59FF51687AFF6C8CA8FF6C8CA8FF6C8CA8FF6786A1FF6786A1FF64819CFF6481
      9CFF5D7991FF5D7991FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002F84
      B7FF05BBE9FF13E5FFFF0BDBFFFF02D8FFFF00D4FFFF00D1FFFF00D3FFFF00AC
      E9FF277EB1FF615A55FFDCD4CDFF918983FF918882FF918781FFD8CABEFF4037
      30FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00575C62FE2B3139FF181E26FF0A11
      18FFAAACAFDAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005F6C73FF556166FF8A8480FFE3DEDAFFABA4A1FFABA4A1FFABA4
      A1FFABA4A1FFABA4A1FFABA4A1FFE0D7D1FF706860FF6E645EFFA3D1D0FFB2D9
      D8FF374859FF51687AFF6C8CA8FF6C8CA8FF6C8CA8FF6786A1FF6786A1FF6786
      A1FF64819CFF5D7991FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005F6C73FF556166FF8A8480FF2B5C2BFF2B5C2BFF9BD1A0FF9BD1
      A0FF2B5C2BFF2B5C2BFFABA4A1FFE0D7D1FF706860FF6E645EFFA3D1D0FFB2D9
      D8FF374859FF51687AFF6C8CA8FF6C8CA8FF6C8CA8FF6786A1FF6786A1FF6786
      A1FF64819CFF5D7991FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF83807FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817D7EFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C7D
      B8FF27D7F5FF2BE9FFFF1EE0FFFF13DCFFFF06D7FFFF00D4FFFF00D4FFFF00BE
      F4FF005893FF615A55FFFCF6F2FFFBF4EEFFFAF1EAFFF9EEE6FFF8ECE2FF4037
      30FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00232931FFDDE0E3FFE2E5E8FF1B21
      2AFFE0E1E274FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005F6C73FF8A8480FFE3DEDAFFABA4A1FFABA4A1FFABA4
      A1FFABA4A1FFABA4A1FFABA4A1FFE0D7D1FF706860FF6E645EFFA3D1D0FFB2D9
      D8FF3B5959FF374859FF51687AFF6C8CA8FF6C8CA8FF6C8CA8FF6786A1FF6786
      A1FF6786A1FF64819CFF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005F6C73FF8A8480FF2B5C2BFF489948FF9BD1A0FF9BD1
      A0FF489948FF2B5C2BFFABA4A1FFE0D7D1FF706860FF6E645EFFA3D1D0FFB2D9
      D8FF3B5959FF374859FF51687AFF6C8CA8FF6C8CA8FF6C8CA8FF6786A1FF6786
      A1FF6786A1FF64819CFF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00686868FF7E7978FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF7A7676FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000B79B5FF3EDA
      F3FF55F4FFFF47EAFFFF3AE7FFFF2AE3FFFF19DCFFFF08D8FFFF00D4FFFF00D5
      FFFF00BBF1FF005893FF615A55FF615A55FF615A55FF615A55FF615A55FF615A
      55FFFFFFFF00FFFFFF00FFFFFF00DFE0E16D282E36FFF5F8FAFFD9DCE0FF282E
      35FFFEFEFE04FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008A8480FFE3DEDAFFADA7A3FFADA7A3FFABA4
      A1FFABA4A1FFABA4A1FFABA4A1FFE0D7D1FF706860FF6E645EFFA3D1D0FFB2D9
      D8FF3B5959FF365454FF374859FF51687AFF6C8CA8FF6C8CA8FF6888A3FF6786
      A1FF6786A1FF6786A1FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002B5C2BFF2B5C2BFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF2B5C2BFF2B5C2BFF706860FF6E645EFFA3D1D0FFB2D9
      D8FF3B5959FF365454FF374859FF51687AFF6C8CA8FF6C8CA8FF6888A3FF6786
      A1FF6786A1FF6786A1FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006C6C6CFF837F7FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001180B9FF59DEF3FF80FF
      FFFF73F4FFFF67F1FFFF57EDFFFF44E9FFFF2FE3FFFF19DCFFFF08D8FFFF00D4
      FFFF00D8FFFF00BBF1FF005893FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009FA1A4D84F545BFFFFFFFFFFA2A6ABFF464B
      51FEFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008A8480FFFCF8F5FFFAF5F2FFFAF4F0FFFAF2
      EDFFF7EFE9FFF7EFE9FFF7EFE9FFF7EFE9FF706860FF6E645EFFA3D1D0FFB2D9
      D8FF3B5959FF365454FFA6C7E0FF374859FF51687AFF6C8CA8FF6C8CA8FF6888
      A3FF6786A1FF6786A1FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002B5C2BFF489948FF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF489948FF2B5C2BFF706860FF6E645EFFA3D1D0FFB2D9
      D8FF3B5959FF365454FFA6C7E0FF374859FF51687AFF6C8CA8FF6C8CA8FF6888
      A3FF6786A1FF6786A1FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00727272FF8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF767372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00328ABDFF32B6DCFF82F1F9FF90F5
      FFFF9AFCFFFF92FCFFFF76F3FFFF5EEDFFFF45E9FFFF2CE3FFFF18E2FFFF05DA
      FFFF00D0FCFF00C7F8FF009BDAFF247FB4FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF005F6369FA878C92FFFFFFFFFF686D74FF7F83
      87EEFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008A8480FF8A8480FF8A8480FF8A8480FF8A84
      80FF8A8480FF8A8480FF8A8480FF8A8480FF8A8480FF6E645EFF91A8A8FFB2D9
      D8FF3B5959FF365454FFA6C7E0FF9EC1DBFF374859FF51687AFF6C8CA8FF6C8C
      A8FF6888A3FF6786A1FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002B5C2BFF2B5C2BFF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF2B5C2BFF2B5C2BFF91A8A8FFB2D9
      D8FF3B5959FF365454FFA6C7E0FF9EC1DBFF374859FF51687AFF6C8CA8FF6C8C
      A8FF6888A3FF6786A1FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF777272FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004293C0FF2688BCFF1B87
      BCFF048BC4FF41B7DFFF92F7FFFF79F4FFFF5AEEFFFF3DE7FFFF02A8DCFF007E
      C1FF0679B7FF177DB5FF3287B8FFCADAE82E61ABD6860573B1FF99B9D054FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0033383FFFC8CCCFFFFDFFFFFF373D45FFC1C2
      C5ADFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00827B78FF827B78FF827B78FF827B
      78FF827B78FF827B78FF827B78FF827B78FF827B78FF6E645EFF91A8A8FFB2D9
      D8FF3B5959FF365454FFA6C7E0FF9EC1DBFF405669FF374859FF51687AFF6C8C
      A8FF6C8CA8FF6888A3FF51687AFFFFFFFF00FFFFFF00FFFFFF002B5C2BFF2B5C
      2BFF489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF489948FF2B5C2BFF2B5C
      2BFF3B5959FF365454FFA6C7E0FF9EC1DBFF405669FF374859FF51687AFF6C8C
      A8FF6C8CA8FF6888A3FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001A7FB8FF70D7EEFF96FCFFFF70F7FFFF31CAEDFF00609AFFDBE2
      EC19008DCFFF00BCECFF0071AFFD0079BDFD00A7E9FF0085D3FF7BA3C16DFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00060D15FFBDC1C5FFE5E8EBFF20262EFFF4F4
      F52DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007185
      85FFB2D9D8FF91A8A8FF91A8A8FF91A8A8FF91A8A8FF8FA8A7FF91A8A8FFB2D9
      D8FF3B5959FF365454FFA6C7E0FF9EC1DBFF405669FF405669FF374859FF5168
      7AFF6C8CA8FF6C8CA8FF51687AFFFFFFFF002B5C2BFF2B5C2BFF489948FF4899
      48FF489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF489948FF489948FF4899
      48FF2B5C2BFF2B5C2BFFA6C7E0FF9EC1DBFF405669FF405669FF374859FF5168
      7AFF6C8CA8FF6C8CA8FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00757575FF979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003495C2FFA1FEFFFF7BF8FFFF0072A8FFFFFFFF00E0E4
      EC180089C5FD00DCFFFF00D7FFFF00CBFFFF00CEFFFF0092DBFF89B5D367FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006B6F74F9353A42FF1C222AFF3A3F46FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007185
      85FFE1F7F7FFE1F7F7FFE1F7F7FFE1F7F7FFE1F7F7FFD8F2F1FFD3F2F2FFCCF0
      EFFF3B5959FF365454FF8798A3FF9EC1DBFF405669FF405669FF374859FF3748
      59FF51687AFF6C8CA8FF51687AFFFFFFFF002B5C2BFF489948FF489948FF4899
      48FF489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF489948FF489948FF4899
      48FF489948FF2B5C2BFF8798A3FF9EC1DBFF405669FF405669FF374859FF3748
      59FF51687AFF6C8CA8FF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00707070FF8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002285BAFF76E2F4FF64DEF4FF1D81B8FFFFFFFF00E9E7
      EE0F008AC3FD00DEFEFF00D8FFFF00D0FFFF00D0FFFF008BD1FF95B0CA61FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F4F430D6D7D990FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007185
      85FF718585FF718585FF718585FF718585FF718585FF718585FF718585FF7185
      85FF718585FF365454FF8798A3FFACCCE3FF405669FF405669FF374859FF3748
      59FF374859FF51687AFF51687AFFFFFFFF00489948FF489948FF489948FF4899
      48FF489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF2B5C2BFF2B5C2BFF2B5C
      2BFF2B5C2BFF2B5C2BFF8798A3FFACCCE3FF405669FF405669FF374859FF3748
      59FF374859FF51687AFF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF787372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF003398C5FF3197C3FFFFFFFF00F4F6F8063495
      C2FF20D4EEFF2DECFFFF13E1FFFF00D7FFFF00D1FFFF00C3F7FF0081BBE26BA3
      CE450079BCE300649EED005C9FA7007CBEE9005C9BEA00387D28FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00677A7AFF677A7AFF677A7AFF677A7AFF677A7AFF677A7AFF677A7AFF677A
      7AFF677A7AFF677A7AFF8798A3FF99AFBFFF405669FF405669FF51687AFF5168
      7AFF51687AFF51687AFF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF2B5C2BFF677A7AFF677A
      7AFF677A7AFF677A7AFF8798A3FF99AFBFFF405669FF405669FF51687AFF5168
      7AFF51687AFF51687AFF51687AFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00787878FF8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64D31FFF2D2C5FF797371FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00609FC4FF5F9EC4FFFFFFFF003495C2FF25C3
      E3FF75FCFFFF6DF8FFFF47EDFFFF1BE2FFFF00DDFFFF00D1FFFF00B4F3FF0170
      B2F00079BDFF00C1E8FF00B0DDFF03C1F1FF0C8BC1E4045E9E27FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0074818AFFB8C8CCFF8B9BA3FF8B9BA3FF8B9B
      A3FF8B9BA3FF8B9BA3FF8999A3FFA5B9C7FF405669FF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF2B5C2BFF8B9BA3FF8B9B
      A3FF8B9BA3FF8B9BA3FF8999A3FFA5B9C7FF405669FF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868686FF989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF767273FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3CDE1651B87
      BCFF1B87BCFF048BC4FF75F5FEFF48F4FFFF00AEDFFF0679B7FF0679B7FF54A1
      CBA70079BDFF1BE7FFFF07EAFFFF00D7FFFF0B86BCE906639F29FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0074818AFFF0FFFEFFE8FCFCFFE3F8FCFFE3F8
      FCFFDCF2FAFFDCF2FAFFDCF2FAFFD4ECFAFF405669FF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF2B5C2BFFE3F8FCFFE3F8
      FCFFDCF2FAFFDCF2FAFFDCF2FAFFD4ECFAFF405669FF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00929292FF888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7E7E81FF78797BFF6E6F72FF696A
      6DFF5D5F61FF5A5A5CFF3D3737FF737272FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008FBCD96356CDE5FF51E9F5FF247FB4FFFAF3F501FFFFFF003495
      C2FF41D6EFFF70FBFFFF35E6FFFF0DE3FFFF00BAE6FF0076B4FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0074818AFF74818AFF74818AFF74818AFF7481
      8AFF74818AFF74818AFF74818AFF74818AFF74818AFF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF2B5C2BFF74818AFF7481
      8AFF74818AFF74818AFF74818AFF74818AFF74818AFF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0B0B0FF797979FF828282FF6D6D
      6DFF636363FF666666FF5B5B5BFF4E4E4EFF4E4E4EFF4F4F4FFF474747FF4545
      45FF434343FF414141FF393939FFA6A6A6FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7EDF20E3495C2FF2CB3D9F9AACCE04AFFFFFF00FFFFFF003495
      C2FF3495C2FF5ECAE5F574F7FFFF17B4DEFF0494CEFF1782B9BDFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00405669FF405669FF405669FF4056
      69FF405669FF405669FF405669FF405669FF405669FF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF2B5C2BFF405669FF4056
      69FF405669FF405669FF405669FF405669FF405669FF405669FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9FFF8C8C8CFF8080
      80FF7A7A7AFF7C7C7CFF7A7A7AFF767676FF767676FF787878FF767676FF7575
      75FF767676FF727272FF868686FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009CC4DC765F9EC4FFFFFFFF00FFFFFF00FFFFFF002E89
      BB121780B91B3495C2FF43C2E0FF5F9EC4FF0673B21C187BB312FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00489948FF489948FF489948FF5DA85EFF74B876FF86C48AFF9BD1A0FF9BD1
      A0FF86C48AFF74B876FF5DA85EFF489948FF489948FF2B5C2BFFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF004697C34D2285BAFF4796C257FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00489948FF2B5C2BFF2B5C2BFF2B5C2BFF2B5C2BFF2B5C2BFF2B5C2BFF2B5C
      2BFF2B5C2BFF2B5C2BFF2B5C2BFF2B5C2BFF2B5C2BFF2B5C2BFFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00666B75FF776D6DFFFFFFFF00FFFFFF00FFFFFF001A1A1A001A1A1A001A1A
      1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A
      1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A
      1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A
      1A001A1A1A001A1A1A001A1A1A001A1A1A00FFFFFF001A1A1A001A1A1A001A1A
      1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A
      1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A
      1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A1A001A1A
      1A001A1A1A001A1A1A001A1A1A001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003F92
      C2FF69A5C8FFA0A6B5FF907F7FFFFFFFFF00FFFFFF00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8
      CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C600FFE3C500FFE2C300FFE1
      C200FFE0C100FFE0C000FFDFBF00FFDEBE00FFDEBD00FFDDBC00FFDDBB00FFDC
      BA00FFDCB900FFDBB800FFDBB8001A1A1A00FFFFFF00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8
      CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C600FFE3C500FFE2C300FFE1
      C200FFE0C100FFE0C000FFDFBF00FFDEBE00FFDEBD00FFDDBC00FFDDBB00FFDC
      BA00FFDCB900FFDBB800FFDBB8001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF698E
      B1FF668CAFFF638AAEFF6187ACFF5E85ABFF5B83AAFF5981A8FF567FA7FF547E
      A6FF517CA4FF4F7AA3FF4D78A2FF4A77A1FF4875A0FF46749FFF44729EFF4371
      9DFF41709CFF3F6E9BFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004196C6FF9CE7
      FCFFABE6F9FF5197C7FF858A9AFFFFFFFF00FFFFFF00FFF3DE00FFF2DC00FFF1
      DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9
      CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C600FFE3C500FFE2
      C300FFE1C200FFE0C100FFE0C000FFDFBF00FFDEBE00FFDEBD00FFDDBC00FFDD
      BB00FFDCBA00FFDCB900FFDBB8001A1A1A00FFFFFF00FFF3DE00FFF2DC00FFF1
      DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9
      CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C600FFE3C500FFE2
      C300FFE1C200FFE0C100FFE0C000FFDFBF00FFDEBE00FFDEBD00FFDDBC00FFDD
      BB00FFDCBA00FFDCB900FFDBB8001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF6D91
      B3FF6B8FB1FF688DB0FF658BAEFF6288ADFF5F86ACFF5D84AAFF5A82A9FF5780
      A8FF557EA6FF527DA5FF507BA4FF4E79A3FF4B77A1FF4976A0FF47749FFF4573
      9EFF43719DFF42709CFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004098C9FF9CE7FDFFAEE8
      FAFF6CC6F3FF2AA2EAFF357BB1FFFFFFFF00FFFFFF00FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C600FFE3
      C500FFE2C300FFE1C200FFE0C100FFE0C000FFDFBF00FFDEBE00FFDEBD00FFDD
      BC00FFDDBB00FFDCBA00FFDCB9001A1A1A00FFFFFF00FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C600FFE3
      C500FFE2C300FFE1C200FFE0C100FFE0C000FFDFBF00FFDEBE00FFDEBD00FFDD
      BC00FFDDBB00FFDCBA00FFDCB9001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF7294
      B5FF6F92B4FF6C90B2FF698EB1FF668CAFFF6389AEFF6187ACFF5E85ABFF5B83
      A9FF5881A8FF567FA7FF537EA6FF517CA4FF4F7AA3FF4C78A2FF4A77A1FF4875
      A0FF46749FFF44729EFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003F9CD0FF9EE8FDFFACE8FAFF6BC6
      F3FF28A3EBFF2884C5FFFFFFFF00FFFFFF00FFFFFF00FFF5E100FFF4DF00FFF3
      DE00FFF2DC00FFF1DB00FFF0D900A2A2A200A2A2A200A2A2A200FFECD300FFEB
      D100FFEAD000A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFE0C100A2A2A200A2A2A200A2A2A200A2A2
      A200FFDDBC00FFDDBB00FFDCBA001A1A1A00FFFFFF00FFF5E100FFF4DF00A2A2
      A200A2A2A200A2A2A200FFF0D900A2A2A200A2A2A200A2A2A200A2A2A200FFEB
      D100A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFE1C200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFDDBB00FFDCBA001A1A1A002442CBFF1C49A9FF1C49A9FF1C49
      A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF1C49
      A9FF1C49A9FF1C49A9FF1C49A9FF6A8FB1FF678DB0FF0081C4FF005A95FF0059
      95FF5C84AAFF5A82A9FF5780A7FF557EA6FF006BAEFF005792FF005791FF4B77
      A1FF4976A0FF47749FFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0040A1D5FF9EE8FDFFACE8FAFF6BC6F3FF29A3
      EBFF2887C9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF5E300FFF5E100FFF4
      DF00A2A2A200CBCBCD00A2A2A200A2A2A200FFEFD800A2A2A200FFEDD500FFEC
      D300FFEBD100A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFE1C200A2A2A200A2A2A200A2A2A200A2A2
      A200FFDEBD00FFDDBC00FFDDBB001A1A1A00FFFFFF00FFF5E300FFF5E100A2A2
      A200FFF3DE00A2A2A200FFF1DB00A2A2A200A2A2A200A2A2A200A2A2A200FFEC
      D300A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFE2C300A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFDDBC00FFDDBB001A1A1A002442CBFFA4B5FCFF9DAFFCFF93A7
      FBFF889EFBFF7C95FAFF6F8AFAFF6280F9FF5475F9FF476AF8FF3A60F8FF2E56
      F7FF244EF7FF1B47F6FF1C49A9FF6F92B4FF6C90B2FF007EC1FF05DCFFFF00C4
      F4FF005994FF005A95FF0673AFFF0081C1FF00B6F4FF00C5FFFF005791FF4F7A
      A3FF4C78A2FF4A77A1FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0041A5DAFF9EE8FDFFACE7FAFF6BC6F3FF29A3EBFF2182
      C4FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF6E400FFF5E300FFF5
      E100CBCBCD00FFF3DE00FFF2DC00A2A2A200A2A2A200A2A2A200FFEED600FFED
      D500FFECD300A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFE2C300A2A2A200A2A2A200A2A2A200A2A2
      A200FFDEBE00FFDEBD00FFDDBC001A1A1A00FFFFFF00FFF6E400FFF5E300A2A2
      A200A2A2A200A2A2A200FFF2DC00A2A2A200A2A2A200A2A2A200A2A2A200FFED
      D500A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFE3C500A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFDEBD00FFDDBC001A1A1A002442CBFFA6B6FCFF9FB0FCFF96A9
      FBFF8BA1FBFF7F97FAFF728DFAFF6582F9FF5777F9FF4A6CF8FF3D62F8FF3158
      F7FF2650F7FF1D48F6FF1C49A9FF7395B6FF7093B4FF0678B5FF04D3FBFF05DE
      FFFF00D8FFFF00B7EEFF00B4EEFF00CEFFFF00CDFFFF00BEFBFF0064A2FF527C
      A5FF507BA4FF4D79A2FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B7E78FF857166FF836A5BFF8B69
      55FF886D5EFF3D99CEFF9EE8FDFFADE8F9FF6AC5F3FF29A3EBFF2388CBFF9879
      61FF8B796FFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7E600FFF6E400FFF5
      E300A2A2A200FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8CD00FFE7CC00FFE6
      CA00FFE5C900FFE4C700FFE4C600FFE3C500FFE2C300FFE1C200FFE0C100FFE0
      C000FFDFBF00FFDEBE00FFDEBD001A1A1A00FFFFFF00FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8CD00FFE7CC00FFE6
      CA00FFE5C900FFE4C700FFE4C600FFE3C500FFE2C300FFE1C200FFE0C100FFE0
      C000FFDFBF00FFDEBE00FFDEBD001A1A1A002442CBFFA7B7FCFFA0B2FCFF98AB
      FBFF8EA3FBFF8299FAFF758FFAFF6885F9FF5B7AF9FF4D6FF8FF4064F8FF345B
      F7FF2852F7FF1F4AF6FF1C49A9FF7899B8FF7596B7FF0C78B4FF04CAF4FF06DE
      FFFF02D8FFFF01D8FFFF00D5FFFF00CEFFFF00CDFFFF00B9F4FF0573B1FF567F
      A7FF537DA5FF517CA4FF191919FFFFFFFF00FFFFFF00FFFFFF00887D76FF8170
      66FF7E685CFF7E6454FF84634FFF8A644DFF92664CFF9D6D4FFFA87352FFA16D
      51FF94624EFF8D6052FF856257FF966958FFB28068FFB88C71FFAA866EFF9F7F
      6AFF957966FF889EB3FF7AC2E8FF69C5F3FF27A3EBFF1F8AD0FF516675FFAE76
      49FF877063FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8E700FFF7E600A2A2
      A200A2A2A200A2A2A200FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEF
      D800FFEED600A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFE4C600A2A2A200A2A2A200A2A2A200A2A2
      A200FFE0C000FFDFBF00FFDEBE001A1A1A00FFFFFF00FFF8E700FFF7E600A2A2
      A200A2A2A200A2A2A200FFF4DF00A2A2A200A2A2A200A2A2A200A2A2A200FFEF
      D800A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFE4C700A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFDFBF00FFDEBE001A1A1A002442CBFF2442CBFF2442CBFF2442
      CBFF2442CBFF2442CBFF2442CBFF2442CBFF2442CBFF2442CBFF2442CBFF2442
      CBFF2442CBFF2442CBFF2442CBFF7C9CBAFF799AB9FF2F84B7FF05BBE9FF13E5
      FFFF0BDBFFFF02D8FFFF00D4FFFF00D1FFFF00D3FFFF00ACE9FF277EB1FF5982
      A9FF5780A7FF547EA6FF191919FFFFFFFF00AB9789FFB3713EFFB57645FFB279
      4DFFB17D55FFAA7C5AFFA17A5DFF997860FF917662FF947767FFA5857BFFBAA4
      95FFD8CAAFFFE7E0C0FFE8E3C6FFE0D9C3FFC6B8ACFF98827EFF746363FF9F91
      91FF9A8D8DFFD1C5C5FF96B5CEFF2D9CE1FF2A98DFFF859DADFF606060FFAA73
      46FF897263FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF9E900FFF8E700A2A2
      A200FFF6E400A2A2A200FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0
      D900FFEFD800A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFE4C700A2A2A200A2A2A200A2A2A200A2A2
      A200FFE0C100FFE0C000FFDFBF001A1A1A00FFFFFF00FFF9E900FFF8E700A2A2
      A200FFF6E400A2A2A200FFF5E100A2A2A200A2A2A200A2A2A200A2A2A200FFF0
      D900A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFE5C900A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFE0C000FFDFBF001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF8DA9
      C3FF8AA7C2FF87A4C0FF84A2BEFF81A0BDFF7E9DBBFF0C7DB8FF27D7F5FF2BE9
      FFFF1EE0FFFF13DCFFFF06D7FFFF00D4FFFF00D4FFFF00BEF4FF005893FF5D85
      ABFF5B83A9FF5881A8FF191919FFFFFFFF00AE8264FF88674BFF898684FF9E9D
      9CFF9B9A9AFF9A9B9BFF9C9C9CFFA2A2A2FF8C8181FFB49D91FFE8D4AFFFF6EB
      BEFFF9F3CAFFF9F8D3FFF1F1D2FFF8F8DEFFF7F5E0FFF2EFDEFFCDC0B8FFA48D
      8CFFC3B4B4FFBEAEAEFFD4CCCDFFA5C8E0FFC0D8E8FFB9B9B9FF616161FFA56F
      42FF897263FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFAEA00FFF9E900A2A2
      A200A2A2A200A2A2A200FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1
      DB00FFF0D900A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFE5C900A2A2A200A2A2A200A2A2A200A2A2
      A200FFE1C200FFE0C100FFE0C0001A1A1A00FFFFFF00FFFAEA00FFF9E900A2A2
      A200A2A2A200A2A2A200FFF5E300A2A2A200A2A2A200A2A2A200A2A2A200FFF1
      DB00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFE6CA00A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFE0C100FFE0C0001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF92AC
      C5FF8EAAC4FF8BA8C2FF88A5C1FF85A3BFFF0B79B5FF3EDAF3FF55F4FFFF47EA
      FFFF3AE7FFFF2AE3FFFF19DCFFFF08D8FFFF00D4FFFF00D5FFFF00BBF1FF0058
      93FF5F86ABFF5C84AAFF191919FFFFFFFF00B28F78FF956944FFA9A9A9FFE9E9
      E9FFE9E9E9FFEAEAEAFFEAEAEAFFCEC4C4FFC2AA9CFFF2DAACFFF9E9BAFFF8EE
      C5FFF9F5CFFFFAF9D7FFF1F1D4FFF9F9E2FFF9F9E8FFF9F9ECFFF6F5ECFFDFD6
      D1FFA18A89FFB19E9EFFE2DFDFFFEEEEEEFFEEEEEEFFBCBCBCFF626262FF9F6B
      3EFF876F60FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBEB00FFFAEA00FFF9
      E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C600FFE3
      C500FFE2C300FFE1C200FFE0C1001A1A1A00FFFFFF00FFFBEB00FFFAEA00FFF9
      E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C600FFE3
      C500FFE2C300FFE1C200FFE0C1001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF96B0
      C9FF93ADC7FF90ABC5FF8DA9C3FF1180B9FF59DEF3FF80FFFFFF73F4FFFF67F1
      FFFF57EDFFFF44E9FFFF2FE3FFFF19DCFFFF08D8FFFF00D4FFFF00D8FFFF00BB
      F1FF005893FF6087ACFF191919FFFFFFFF00FFFFFF00A36A39FF989898FFEAEA
      EAFFEBEBEBFFEBEBEBFFE3E0E0FFBDA7A0FFF1D4A6FFF8E4B3FFF7E7BCFFF8EE
      C6FFF9F6D0FFFAFAD8FFF1F1D5FFF9F9E4FFFAFAEAFFE5E5EFFFECEDF4FFF7F6
      F1FFD2C7C2FFB09D9DFFEFEFEFFFEFEFEFFFF0F0F0FFC7C7C7FF6C6C6CFF9C68
      3BFF896C58FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCED00FFFBEB00FFFA
      EA00FFF9E900FFF8E700FFF7E600A2A2A200A2A2A200A2A2A200FFF4DF00FFF3
      DE00FFF2DC00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFE7CC00A2A2A200A2A2A200A2A2A200A2A2
      A200FFE3C500FFE2C300FFE1C2001A1A1A00FFFFFF00FFFCED00FFFBEB00A2A2
      A200A2A2A200A2A2A200FFF7E600A2A2A200A2A2A200A2A2A200A2A2A200FFF3
      DE00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFE8CD00A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFE2C300FFE1C2001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF9AB3
      CBFF97B1C9FF94AEC8FF328ABDFF32B6DCFF82F1F9FF90F5FFFF9AFCFFFF92FC
      FFFF76F3FFFF5EEDFFFF45E9FFFF2CE3FFFF18E2FFFF05DAFFFF00D0FCFF00C7
      F8FF009BDAFF247FB4FF191919FFFFFFFF00FFFFFF00AA672EFF8C8986FFE8E8
      E8FFEDEDEDFFEDEDEDFFCBBFBFFFE1C3A3FFF7DCA9FFF7E1B3FFF7E6BCFFF8EF
      C7FFFAF6D1FFFBFAD9FFF1F1D6FFFAFAE5FFFBFBEBFFD2D2F2FFCFD1F1FFF8F9
      F4FFF5F3E9FFB29F9DFFE8E6E6FFF1F1F1FFF1F1F1FFCDCDCDFF797979FF9665
      39FF896B57FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDEE00FFFCED00FFFB
      EB00A2A2A200CBCBCD00A2A2A200A2A2A200FFF6E400A2A2A200FFF5E100FFF4
      DF00FFF3DE00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFE8CD00A2A2A200A2A2A200A2A2A200A2A2
      A200FFE4C600FFE3C500FFE2C3001A1A1A00FFFFFF00FFFDEE00FFFCED00A2A2
      A200FFFAEA00A2A2A200FFF8E700A2A2A200A2A2A200A2A2A200A2A2A200FFF4
      DF00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFE9CE00A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFE3C500FFE2C3001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF9FB6
      CDFF9CB4CCFF99B2CAFF96B0C9FF4293C0FF2688BCFF1B87BCFF048BC4FF41B7
      DFFF92F7FFFF79F4FFFF5AEEFFFF3DE7FFFF02A8DCFF007EC1FF0679B7FF177D
      B5FF3287B8FF688DB0FF191919FFFFFFFF00FFFFFF00AA662EFF887E75FFE3E3
      E3FFEFEFEFFFEDECECFFC7B6B1FFF2CF9EFFF8DCA9FFF7DFB1FFF8E6BBFFF9F0
      C7FFFBF7D0FFFBFBD8FFF2F2D5FFFAFAE3FFFAFAE8FFD5D5EFFFD7D9EAFFFAFA
      EFFFF9F9EBFFD3C8BFFFD2C8C8FFF3F3F3FFF4F4F4FFD9D9D9FF868686FF9766
      3BFF896B57FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEF000FFFDEE00FFFC
      ED00CBCBCD00FFFAEA00FFF9E900A2A2A200A2A2A200A2A2A200FFF5E300FFF5
      E100FFF4DF00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFE9CE00A2A2A200A2A2A200A2A2A200A2A2
      A200FFE4C700FFE4C600FFE3C5001A1A1A00FFFFFF00FFFEF000FFFDEE00A2A2
      A200A2A2A200A2A2A200FFF9E900A2A2A200A2A2A200A2A2A200A2A2A200FFF5
      E100A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFEAD000A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFE4C600FFE3C5001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFA3BA
      D0FFA0B7CEFF9DB5CDFF9AB3CBFF97B1C9FF94AEC8FF91ACC5FF8EAAC4FF1A7F
      B8FF70D7EEFF96FCFFFF70F7FFFF31CAEDFF00609AFF7999B9FF7697B7FF7395
      B6FF7093B4FF6D90B2FF191919FFFFFFFF00FFFFFF00A96D40FF887260FFDEDE
      DEFFF1F1F1FFEAE7E7FFD2BCAEFFF5D19CFFF8DAA7FFF8E0B2FFFAEABCFFFAEF
      C5FFFBF5CEFFFCFBD8FFF4F4D7FFFAFADFFFFAFAE5FFD9D9EAFFDDE0E2FFFBFB
      EAFFFBFBE8FFE9E4D4FFC4B7B7FFF5F5F5FFF5F5F5FFDEDEDEFF939393FF9265
      3FFF8B6C58FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEF100FFFEF000FFFD
      EE00A2A2A200FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8CD00FFE7CC00FFE6
      CA00FFE5C900FFE4C700FFE4C6001A1A1A00FFFFFF00FFFEF100FFFEF000FFFD
      EE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8CD00FFE7CC00FFE6
      CA00FFE5C900FFE4C700FFE4C6001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFA7BD
      D2FFA5BBD0FFA2B8CFFF9FB6CDFF9CB4CCFF99B2CAFF96AFC9FF93ADC7FF90AB
      C4FF3495C2FFA1FEFFFF7BF8FFFF0072A8FF809FBDFF7D9DBBFF7A9BB9FF7798
      B8FF7496B6FF7194B5FF191919FFFFFFFF00FFFFFF00B18262FF8D6A4CFFD9D9
      D9FFF2F2F2FFE8E5E5FFD9BFADFFF6D09BFFF8DBA6FFF9E1B0FFF8E3B7FFF9EA
      C0FFFAF0C9FFFBF8D2FFF7F7D5FFFAFADEFFFAFAE0FFDEDDE5FFE2E5DCFFFCFC
      E5FFFCFCE4FFF1EED8FFC4B5B5FFF7F7F7FFF7F7F7FFE6E6E6FFA1A1A1FF9569
      44FF886A55FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF200FFFEF100FFFE
      F000CBCBCD00FFFCED00FFFBEB00A2A2A200A2A2A200A2A2A200FFF7E600FFF6
      E400FFF5E300A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFEBD100A2A2A200A2A2A200A2A2A200A2A2
      A200FFE6CA00FFE5C900FFE4C7001A1A1A00FFFFFF00FFFFF200FFFEF100A2A2
      A200A2A2A200A2A2A200FFFBEB00A2A2A200A2A2A200A2A2A200A2A2A200FFF6
      E400A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFECD300A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFE5C900FFE4C7001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFACC0
      D4FFA9BED2FFA6BCD1FFA3B9CFFFA0B7CEFF9DB5CCFF9AB3CBFF97B0C9FF94AE
      C8FF2285BAFF76E2F4FF64DEF4FF1D81B8FF85A3BFFF82A0BDFF7F9EBCFF7B9C
      BAFF7899B9FF7597B7FF191919FFFFFFFF00FFFFFF00BA9B87FF93623AFFCFCF
      CFFFF4F4F4FFECEAEAFFDCC4B3FFF6CE98FFF9DBA4FFF9E1AFFFFBEDBFFFFCF2
      CDFFFCF3D3FFFBF4CEFFF7F4CEFFF9F9D8FFFAFADBFFE5E5DFFFE5E8D5FFFCFC
      E0FFFCFCDEFFF1EDD4FFC9BCBCFFF9F9F9FFF9F9F9FFEAEAEAFFAEAEAEFF9169
      49FF88654EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF300FFFFF200FFFE
      F100A2A2A200CBCBCD00A2A2A200A2A2A200FFFAEA00A2A2A200FFF8E700FFF7
      E600FFF6E400A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFECD300A2A2A200A2A2A200A2A2A200A2A2
      A200FFE7CC00FFE6CA00FFE5C9001A1A1A00FFFFFF00FFFFF300FFFFF200A2A2
      A200FFFEF000A2A2A200FFFCED00A2A2A200A2A2A200A2A2A200A2A2A200FFF7
      E600A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFEDD500A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFE6CA00FFE5C9001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFB0C3
      D6FFADC1D4FFAABFD3FFA7BDD2FFA4BAD0FFA2B8CFFF9FB6CDFF9CB4CCFF99B2
      CAFF96AFC8FF3398C5FF3197C3FF8CA8C3FF89A6C1FF86A4C0FF83A1BEFF809F
      BCFF7D9DBBFF7A9AB9FF191919FFFFFFFF00FFFFFF00FFFFFF009D5F2FFFBFBE
      BEFFF6F6F6FFF3F2F2FFDCCAC1FFF5CA95FFF9DAA1FFFAE3AFFFFBECBEFFFCF0
      CDFFFCF3D9FFFCF3D4FFF8F0C9FFF7F3CFFFF8F7D5FFECECD9FFE7EACFFFFDFD
      DAFFFDFCD7FFE7E0CAFFD7CECEFFFBFBFBFFFBFBFBFFF1F1F1FFBDBDBDFF976F
      4FFF89644CFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF500FFFFF300FFFF
      F200CBCBCD00FFFEF000FFFDEE00A2A2A200A2A2A200A2A2A200FFF9E900FFF8
      E700FFF7E600A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFEDD500A2A2A200A2A2A200A2A2A200A2A2
      A200FFE8CD00FFE7CC00FFE6CA001A1A1A00FFFFFF00FFFFF500FFFFF300A2A2
      A200A2A2A200A2A2A200FFFDEE00A2A2A200A2A2A200A2A2A200A2A2A200FFF8
      E700A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFEED600A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFE7CC00FFE6CA001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFB4C7
      D8FFB1C4D7FFAEC2D5FFABC0D4FFA9BED2FFA6BCD1FFA3B9CFFFA0B7CEFF9DB5
      CCFF9AB3CBFF609FC4FF5F9EC4FF91ACC5FF8EA9C4FF8BA7C2FF88A5C0FF85A2
      BFFF81A0BDFF7E9EBCFF191919FFFFFFFF00FFFFFF00FFFFFF00A35F2BFFB0AD
      AAFFF7F7F7FFF8F8F8FFE0D7D6FFF1C99EFFF9D69DFFFAE1ABFFFBE9B8FFFCEE
      C5FFFCF1CEFFFCF2CEFFFAECC3FFF6EFC6FFF8F0CCFFEAE4D0FFE7E6C6FFFDF9
      D2FFFCF7CDFFD5C8BDFFEEEBEBFFFCFCFCFFFDFDFDFFF5F5F5FFCACACAFF9571
      56FF88644CFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF600FFFFF500FFFF
      F300A2A2A200FFFEF100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9
      E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC001A1A1A00FFFFFF00FFFFF600FFFFF500FFFF
      F300FFFFF200FFFEF100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9
      E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFB7CA
      DAFFB5C8D9FFB2C5D7FFB0C3D6FFADC1D4FFAABFD3FFA7BDD2FFA4BAD0FFA1B8
      CFFF9EB6CDFF9BB4CCFF98B1CAFF95AFC8FF92ADC7FF8FABC4FF8CA8C3FF89A6
      C1FF86A4C0FF83A1BEFF191919FFFFFFFF00FFFFFF00FFFFFF00A46334FFA79A
      90FFF8F8F8FFFAFAFAFFF0EDEDFFE7CFBEFFF7CE96FFFADCA4FFFBE4AFFFFBEA
      B9FFFCEEC1FFFCEDC1FFFBEABEFFF7EBBFFFF8EAC3FFE4D8C6FFE7DEBEFFFDF3
      C6FFF3E7C8FFD2C6C6FFFDFDFDFFFEFEFEFFFEFEFEFFFAFAFAFFD9D9D9FF9B78
      5EFF87634CFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF600A2A2
      A200A2A2A200A2A2A200FFFEF100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFA
      EA00FFF9E900A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFEFD800A2A2A200A2A2A200A2A2A200A2A2
      A200FFEAD000FFE9CE00FFE8CD001A1A1A00FFFFFF00FFFFF700FFFFF600A2A2
      A200A2A2A200A2A2A200FFFEF100A2A2A200A2A2A200A2A2A200A2A2A200FFFA
      EA00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFF0D900A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFE9CE00FFE8CD001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFBBCC
      DCFFB9CBDAFF8B8B8BFF656565FF656565FF656565FF656565FF656565FF6565
      65FF656565FF656565FF656565FF656565FF656565FF656565FF656565FF6565
      65FF8BA7C2FF87A5C0FF191919FFFFFFFF00FFFFFF00FFFFFF00A36F4CFF9E84
      71FFFCFCFCFFFBFBFBFFFBFBFBFFE8E2E1FFF0CEADFFF8D299FFFADDA4FFFBE3
      ADFFFBE6B2FFFBE5B3FFFBE7B7FFF2DBAFFFF9E5BAFFE5D3BBFFEFE0B8FFF9E8
      BEFFD7CAC3FFF3F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFE5E5E5FF9E7F
      68FF88634BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF800FFFFF700A2A2
      A200FFFFF500A2A2A200FFFFF200FFFEF100FFFEF000FFFDEE00FFFCED00FFFB
      EB00FFFAEA00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFF0D900A2A2A200A2A2A200A2A2A200A2A2
      A200FFEBD100FFEAD000FFE9CE001A1A1A00FFFFFF00FFFFF800FFFFF700A2A2
      A200FFFFF500A2A2A200FFFFF200A2A2A200A2A2A200A2A2A200A2A2A200FFFB
      EB00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFF1DB00A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFEAD000FFE9CE001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFBECF
      DDFFBCCDDCFF8B8B8BFFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9
      E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FF6565
      65FF8FAAC4FF8CA8C3FF191919FFFFFFFF00FFFFFF00FFFFFF00B1896FFF946D
      50FFFCFCFCFFFEFEFEFFFEFEFEFFFCFBFBFFE9E2DFFFF1D1B0FFF7CE98FFF9D7
      9EFFF9DBA3FFF9DDA7FFFADEABFFF4D9A8FFFAE2B0FFF1DAB0FFF5DFB9FFDED1
      C7FFEDE8E8FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF2F2F2FFA486
      71FF855E45FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF900FFFFF800A2A2
      A200A2A2A200A2A2A200FFFFF300FFFFF200FFFEF100FFFEF000FFFDEE00FFFC
      ED00FFFBEB00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200A2A2A200FFF1DB00A2A2A200A2A2A200A2A2A200A2A2
      A200FFECD300FFEBD100FFEAD0001A1A1A00FFFFFF00FFFFF900FFFFF800A2A2
      A200A2A2A200A2A2A200FFFFF300A2A2A200A2A2A200A2A2A200A2A2A200FFFC
      ED00A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200A2A2A200FFF2DC00A2A2A200A2A2A200A2A2A200A2A2A200A2A2
      A200A2A2A200FFEBD100FFEAD0001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFC2D1
      DFFFC0D0DEFF8B8B8BFFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9
      E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FF6565
      65FF94AEC8FF91ACC5FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF008E59
      35FFF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCFFEEEAE9FFEDDACAFFF4D1
      AAFFF6CD9AFFF7D19CFFF8D5A1FFF6D5A3FFF7DAAFFFEFDAC3FFDAD0D0FFF2EE
      EEFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFAA90
      7EFF845B41FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFA00FFFFF900FFFF
      F800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFEF000FFFD
      EE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD1001A1A1A00FFFFFF00FFFFFA00FFFFF900FFFF
      F800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFEF000FFFD
      EE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD1001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFC5D4
      E1FFC3D2E0FF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF98B1CAFF95AFC8FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF009555
      29FFD9D8D8FFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFF9F7F7FFEFEB
      EBFFEDE5E1FFECDED3FFEBDDD1FFE7DBD4FFE6E0E0FFAEADDDFFB0B0F2FFFEFE
      FEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFAC92
      82FF855B41FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00FFFFFA00FFFF
      F900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFE
      F000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6
      E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEF
      D800FFEED600FFEDD500FFECD3001A1A1A00FFFFFF00FFFFFB00FFFFFA00FFFF
      F900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFE
      F000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6
      E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEF
      D800FFEED600FFEDD500FFECD3001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFC9D6
      E2FFC7D5E1FFC4D3E0FFC2D1DFFFBFD0DEFFBDCEDDFFBBCCDCFFB8CADAFFB6C8
      D9FFB3C7D8FFB1C4D6FFAEC2D5FFABBFD4FFA8BDD2FFA5BBD1FFA2B9CFFFA0B7
      CEFF9DB5CCFF9AB2CBFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF009B55
      27FFBFBBB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFDFCFCFFFCFBFBFFDCDBDBFFF8F9FAFF99A1DFFFB3B3F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB19B
      8DFF845B41FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFC00FFFFFB00FFFF
      FA00FFFFF900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFE
      F100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7
      E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD5001A1A1A00FFFFFF00FFFFFC00FFFFFB00FFFF
      FA00FFFFF900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFE
      F100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7
      E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD5001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFCBD8
      E4FFCAD7E3FFC8D5E2FFC5D4E1FFC3D2E0FFC0D1DFFFBECFDDFFBCCDDCFFB9CB
      DBFFB7C9DAFFB4C7D8FFB2C4D7FFAFC2D6FFACC0D4FFAABED3FFA7BCD1FFA4BA
      D0FFA1B8CEFF9EB6CDFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF009C5E
      38FFAC9D93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDEFFF9F9FAFFA6ADE2FFBCBCF8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB19D
      91FF835A41FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00D8CFB700D8CFB700D8CF
      B700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CF
      B700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CF
      B700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CF
      B700D8CFB700D8CFB700D8CFB7001A1A1A00FFFFFF00D8CFB700D8CFB700D8CF
      B700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CF
      B700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CF
      B700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CFB700D8CF
      B700D8CFB700D8CFB700D8CFB7001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFCEDA
      E5FFCCD9E4FFCAD7E3FFC9D6E2FFC7D4E1FFC4D3E0FFC1D1DFFFBFD0DEFFBDCE
      DDFFBBCCDBFFB8CADAFFB6C8D9FFB3C5D8FFB0C3D6FFAEC1D5FFABBFD3FFA8BD
      D2FFA5BBD1FFA2B9CFFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF009970
      56FF9C806EFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5FFF1F2F2FFB5BAE9FFC9C9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A6
      9BFF855A41FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFD0DC
      E6FFCFDAE5FFCDD9E4FFCBD8E4FFC9D7E3FFC8D5E2FFC5D4E1FFC2D2E0FFC0D0
      DEFFBECFDDFFBCCDDCFFB9CBDBFFB7C9DAFFB4C7D8FFB2C4D7FFAFC2D6FFACC0
      D4FFA9BED3FFA7BCD1FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00AF91
      7FFF90654BFFF9F9F9FFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFE
      FEFFFFFFFFFFFEFEFEFFFFFFFFFFF1F1F1FFE5E6E8FFD0D1F5FFD8D8F8FFFEFE
      FEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFF4F4F4FFA999
      8FFF916B55FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE001A1A1A00FFFFFF00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFD2DD
      E7FFD1DCE6FFCFDBE6FFCEDAE5FFCCD9E4FFCAD7E3FFC8D6E2FFC7D4E1FFC3D3
      E0FFC1D1DFFFBFD0DEFFBDCEDDFFBACCDBFFB8CADAFFB5C8D9FFB3C5D8FFB0C3
      D6FFAEC1D5FFABBFD3FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008C5433FFE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFD6D6DCFFE9E9FBFFDFE1F4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFF7F7F7FFE0E0E0FFBCBCBCFFAB9D95FFC29E
      89FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00DEDE
      DE00FFFFFF00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00DEDEDE00FFFFFF00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA001A1A1A00FFFFFF00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00DEDEDE00FFFFFF00EAE9EA00EAE9EA00EAE9EA00DEDEDE00FFFF
      FF00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00DEDEDE00FFFFFF00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008F4E27FFB9B4B1FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFF7F7F7FFC7C7C7FFA3A3A4FFBEBEC7FFC2C2CBFFCFCF
      CFFFBFBFBFFFB0B0B0FFAFAFAFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600EAE9
      EA00FFFFFF00F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600EAE9EA00FFFFFF00F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F6001A1A1A00FFFFFF00F5F5F600F5F5F600F5F5
      F600F5F5F600EAE9EA00FFFFFF00F5F5F600F5F5F600F5F5F600EAE9EA00FFFF
      FF00F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600EAE9EA00FFFFFF00F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F6001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B89985FF926A52FFA9A19CFFADADADFFAEAEAEFFAEAEAEFFAEAEAEFFACAC
      ACFFA5A5A5FFA2A2A2FFABABABFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002B2B2BFF2B2B2BFF2B2B2BFFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FF006C00FF006C00FF006C00FF006C00FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002B2B2BFFFFFFFF00FFFFFF00FFFFFF002B2B2BFFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FF64D670FF5DD46AFF56D263FF006C00FF8B8B8BFF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00515151FF515151FF515151FF515151FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002B2B2BFFFFFFFF00FFFFFF00FFFFFF002B2B2BFFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008B8B8BFF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF856E32FF856E
      32FF856E32FF856E32FF856E32FF856E32FF856E32FF856E32FF856E32FF856E
      32FF856E32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FF6BD877FF64D670FF5DD46AFF006C00FF8B8B8BFF698E
      B1FF668CAFFF638AAEFF6187ACFF5E85ABFF5B83AAFF5981A8FF567FA7FF547E
      A6FF517CA4FF4F7AA3FF4D78A2FF4A77A1FF4875A0FF46749FFF44729EFF4371
      9DFF41709CFF3F6E9BFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00515151FFD6C484FFD6C382FF515151FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002B2B2BFFFFFFFF00FFFFFF00FFFFFF002B2B2BFFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008B8B8BFFEBF7F7FFE4EEEEFFDBE5E5FFD2DADAFFC8CF
      CFFFBDC3C3FFB3B8B8FFA9ADADFF9FA2A2FF969898FF5C5C5CFFF6D2B7FFF6D2
      B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2
      B7FF856E32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FF73DA7EFF6BD877FF64D670FF006C00FF8B8B8BFF6D91
      B3FF6B8FB1FF688DB0FF658BAEFF6288ADFF5F86ACFF5D84AAFF5A82A9FF5780
      A8FF557EA6FF527DA5FF507BA4FF4E79A3FF4B77A1FF4976A0FF47749FFF4573
      9EFF43719DFF42709CFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7FFFDCCD95FF515151FFFFFF
      FF00FFFFFF00FFFFFF00515151FFD7C587FFD6C484FF515151FFFFFFFF00FFFF
      FF00FFFFFF00515151FFD2BE78FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002B2B2BFF2B2B2BFF2B2B2BFFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008B8B8BFFEDF8F8FFE6F0F0FFDDE7E7FFD4DDDDFFCAD2
      D2FFBFC7C7FFB5BABAFFABAFAFFFA1A4A5FF989B9BFF5C5C5CFF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FFF6D2B7FFF6D2
      B7FF856E32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FF7ADC85FF73DA7EFF6BD877FF006C00FF8B8B8BFF7294
      B5FF6F92B4FF6C90B2FF698EB1FF668CAFFF6389AEFF6187ACFF5E85ABFF5B83
      A9FF5881A8FF567FA7FF537EA6FF517CA4FF4F7AA3FF4C78A2FF4A77A1FF4875
      A0FF46749FFF44729EFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7FFFDECF9AFFDDCE98FFDCCD95FF5151
      51FFFFFFFF00515151FFD9C88BFFD8C789FFD7C587FFD6C484FF515151FFFFFF
      FF00515151FFD4C07CFFD3BF7AFFD2BE78FF515151FFFFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002B2B2BFFFFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFE7F2F2FFDFE9E9FFD6DFDFFFCDD5
      D5FFC2C9C9FFB7BDBDFFADB2B2FFA3A7A7FF9A9D9DFF5C5C5CFF0A66B7FF0461
      B5FF005EB2FF005AB0FF0057AEFF0054ACFF0051AAFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF0000A900FF006C00FF006C00FF006C
      00FF006C00FF006C00FF82DE8CFF7ADC85FF73DA7EFF006C00FF006C00FF006C
      00FF006C00FF006C00FF006C00FF6A8FB1FF678DB0FF0081C4FF005A95FF0059
      95FF5C84AAFF5A82A9FF5780A7FF557EA6FF006BAEFF005792FF005791FF4B77
      A1FF4976A0FF47749FFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7FFFDFD19DFFDECF9AFFDDCE98FFDCCD
      95FF515151FFDACB90FFDAC98EFFD9C88BFFD8C789FFD7C587FFD6C484FF5151
      51FFD5C280FFD4C17EFFD4C07CFFD3BF7AFF515151FFFFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002B2B2BFF2B2B
      2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
      2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
      2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
      2BFF2B2B2BFF2B2B2BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF191919FFE1ECECFFD8E2E2FFCFD7
      D7FFC4CCCCFF191919FF191919FFA6A9A9FF9C9F9FFF5C5C5CFF136DBCFF0E69
      B9FF0864B7FF0260B4FF005DB2FF0059AFFF0056ADFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF0000A900FFAEEAB4FFA7E8AEFFA0E6
      A7FF99E4A1FF91E29AFF8AE093FF82DE8CFF7ADC85FF73DA7EFF6BD877FF64D6
      70FF5DD46AFF56D263FF006C00FF6F92B4FF6C90B2FF007EC1FF05DCFFFF00C4
      F4FF005994FF005A95FF0673AFFF0081C1FF00B6F4FF00C5FFFF005791FF4F7A
      A3FF4C78A2FF4A77A1FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7FFFDFD19DFFDECF9AFFDDCE
      98FFDCCD95FFDBCC93FFDACB90FFDAC98EFFD9C88BFFD8C789FFD7C587FFD6C4
      84FFD6C382FFD5C280FFD4C17EFF515151FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFEBF6F6FF191919FFDBE4E4FFD1DA
      DAFF8B8B8BFFBCC2C2FFB2B7B7FF191919FF9EA1A1FF5C5C5CFF1F75C2FF1870
      BEFF126CBBFF0C67B9FF0663B6FF005FB3FF005CB1FF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF0000A900FFB4ECBAFFAEEAB4FFA7E8
      AEFFA0E6A7FF99E4A1FF91E29AFF8AE093FF82DE8CFF7ADC85FF73DA7EFF6BD8
      77FF64D670FF5DD46AFF006C00FF7395B6FF7093B4FF0678B5FF04D3FBFF05DE
      FFFF00D8FFFF00B7EEFF00B4EEFF00CEFFFF00CDFFFF00BEFBFF0064A2FF527C
      A5FF507BA4FF4D79A2FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00515151FF515151FFFFFFFF00FFFFFF007F7F7FFFDFD29FFFDFD19DFFDECF
      9AFFDDCE98FFDCCD95FFDBCC93FFDACB90FFDAC98EFFCBBB85FFCABA83FFCAB9
      81FFC9B87FFFD6C382FFD5C280FF515151FFFFFFFF00FFFFFF00515151FF5151
      51FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1E1FFE0E0E0FFBEB3ABFFDDDD
      DDFFBEB3ABFFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFBEB3
      ABFFBEB3ABFFD0D0D0FFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFFCBCBCBFFCACA
      CAFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFECF8F8FF191919FFDDE6E6FFD3DC
      DCFF8B8B8BFFBEC5C5FFB4B9B9FF191919FFA1A4A4FF5C5C5CFF2B7EC8FF2479
      C4FF1D74C1FF166FBEFF106ABBFF0A66B8FF0462B5FF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF0000A900FFBBEDC0FFB4ECBAFFAEEA
      B4FFA7E8AEFFA0E6A7FF99E4A1FF91E29AFF8AE093FF82DE8CFF7ADC85FF73DA
      7EFF6BD877FF64D670FF006C00FF7899B8FF7596B7FF0C78B4FF04CAF4FF06DE
      FFFF02D8FFFF01D8FFFF00D5FFFF00CEFFFF00CDFFFF00B9F4FF0573B1FF567F
      A7FF537DA5FF517CA4FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F
      7FFFE4D9AEFFE4D8ACFF515151FF515151FFE1D4A4FFE0D3A2FFDFD29FFFDFD1
      9DFFDECF9AFFDDCE98FFDCCD95FFDBCC93FFCDBD8AFFB0A47BFFAFA47AFFAFA3
      78FFBCAF7CFFC9B87FFFD6C382FFD5C280FF515151FF515151FFD3BF7AFFD2BE
      78FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFE8E8E8FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1E1FFDFDFDFFFDEDE
      DEFFDDDDDDFFDBDBDBFFDADADAFFD8D8D8FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3
      D3FFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFFCBCB
      CBFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFEEF9F9FF191919FFDFE9E9FFD6DE
      DFFF8B8B8BFFC1C8C8FFB6BCBCFF191919FFA3A6A6FF5C5C5CFF3887CEFF3182
      CBFF297CC7FF2277C3FF1B72C0FF146EBDFF0E69BAFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF0000A900FF00A900FF00A900FF00A9
      00FF00A900FF00A900FFA0E6A7FF99E4A1FF91E29AFF006C00FF00A900FF00A9
      00FF00A900FF00A900FF00A900FF7C9CBAFF799AB9FF2F84B7FF05BBE9FF13E5
      FFFF0BDBFFFF02D8FFFF00D4FFFF00D1FFFF00D3FFFF00ACE9FF277EB1FF5982
      A9FF5780A7FF547EA6FF191919FFFFFFFF00FFFFFF00FFFFFF007F7F7FFFE6DB
      B3FFE5DAB1FFE4D9AEFFE4D8ACFFE3D7A9FFE2D5A7FFE1D4A4FFE0D3A2FFDFD2
      9FFFDFD19DFFDECF9AFFDDCE98FFDCCD95FFDBCC93FFDACB90FFDAC98EFF938B
      6DFF928A6CFFBCAF7CFFC9B87FFFD6C382FFD5C280FFD4C17EFFD4C07CFFD3BF
      7AFFD2BE78FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFEAEAEAFFE8E8E8FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFBEB3ABFFDFDF
      DFFFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1
      B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFBEB3ABFFCECECEFFCDCDCDFFCCCC
      CCFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFEFFBFBFF191919FFE1EBEBFFD8E1
      E1FF8B8B8BFFC3CBCBFFB9BFBFFF191919FFA5A9A9FF5C5C5CFF4691D4FF3E8B
      D1FF3685CDFF2E80CAFF277BC5FF2076C2FF1971BFFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FFA7E8AEFFA0E6A7FF99E4A1FF006C00FF8B8B8BFF8DA9
      C3FF8AA7C2FF87A4C0FF84A2BEFF81A0BDFF7E9DBBFF0C7DB8FF27D7F5FF2BE9
      FFFF1EE0FFFF13DCFFFF06D7FFFF00D4FFFF00D4FFFF00BEF4FF005893FF5D85
      ABFF5B83A9FF5881A8FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F
      7FFFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFFE3D7A9FFE2D5A7FFE1D4A4FFE0D3
      A2FFDFD29FFFDFD19DFFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFDACB90FFDAC9
      8EFFD9C88BFF7F7964FFBCAF7CFFC9B87FFFD6C382FFD5C280FFD4C17EFFD4C0
      7CFF7F7F7FFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFEBEBEBFFEAEAEAFFE8E8E8FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1
      E1FFDFDFDFFFDEDEDEFFDCDCDCFFDBDBDBFFDADADAFFD8D8D8FFD7D7D7FFD6D6
      D6FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFCECECEFFCDCD
      CDFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF1FDFDFF191919FFE3EDEDFFDAE3
      E3FF8B8B8BFFC5CECEFFBBC1C1FF191919FFA7ABABFF5C5C5CFF549ADBFF4C95
      D7FF448FD3FF3C89D0FF3484CCFF2C7EC9FF2579C4FF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FFAEEAB4FFA7E8AEFFA0E6A7FF006C00FF8B8B8BFF92AC
      C5FF8EAAC4FF8BA8C2FF88A5C1FF85A3BFFF0B79B5FF3EDAF3FF55F4FFFF47EA
      FFFF3AE7FFFF2AE3FFFF19DCFFFF08D8FFFF00D4FFFF00D5FFFF00BBF1FF0058
      93FF5F86ABFF5C84AAFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7FFFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFFE3D7A9FFE2D5A7FFE1D4
      A4FFE0D3A2FFA1A1A1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00A1A1A1FFDACB
      90FFDAC98EFFD9C88BFF7F7964FFBCAF7CFFC9B87FFFD6C382FFD5C280FF7F7F
      7FFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFECECECFFEBEBEBFFE9E9E9FFE8E8E8FFE7E7E7FFE5E5E5FFBEB3ABFFE2E2
      E2FFB5B4B4FFB4B4B4FFB4B3B3FFB3B2B2FFB2B2B2FFB2B1B1FFB1B1B1FFB1B0
      B0FFB0B0B0FFB0AFAFFFAFAFAFFFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFCECE
      CEFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF2FEFEFF191919FFE5EFEFFFDCE6
      E6FF8B8B8BFFC9D0D0FFBEC4C4FF191919FFA9ADADFF5C5C5CFF62A4E1FF5A9E
      DDFF5299DAFF4993D6FF418DD2FF3988CFFF3182CBFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FFB4ECBAFFAEEAB4FFA7E8AEFF006C00FF8B8B8BFF96B0
      C9FF93ADC7FF90ABC5FF8DA9C3FF1180B9FF59DEF3FF80FFFFFF73F4FFFF67F1
      FFFF57EDFFFF44E9FFFF2FE3FFFF19DCFFFF08D8FFFF00D4FFFF00D8FFFF00BB
      F1FF005893FF6087ACFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007F7F7FFFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFFE3D7A9FFE2D5
      A7FFA1A1A1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A1A1
      A1FFDACB90FFDAC98EFFD9C88BFF7F7964FFCAB981FFD6C484FF515151FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFEEEEEEFFECECECFFEBEBEBFFE9E9E9FFE8E8E8FFE7E7E7FFE5E5E5FFE4E4
      E4FFE2E2E2FFE1E1E1FFDFDFDFFFDEDEDEFFDCDCDCFFDBDBDBFFDADADAFFD8D8
      D8FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFCFCF
      CFFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF3FFFFFF191919FFE6F1F1FFDEE8
      E8FF8B8B8BFFCBD3D3FFC0C8C8FF191919FFACB0B0FF5C5C5CFF71AEE8FF68A8
      E4FF60A3E0FF579DDCFF4F97D9FF4791D5FF3F8BD1FF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FFBBEDC0FFB4ECBAFFAEEAB4FF006C00FF8B8B8BFF9AB3
      CBFF97B1C9FF94AEC8FF328ABDFF32B6DCFF82F1F9FF90F5FFFF9AFCFFFF92FC
      FFFF76F3FFFF5EEDFFFF45E9FFFF2CE3FFFF18E2FFFF05DAFFFF00D0FCFF00C7
      F8FF009BDAFF247FB4FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00515151FFE8DEB8FFE7DCB6FFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFF5151
      51FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A1A1A1FFDACB90FFDAC98EFF7F7964FFBCAF7CFFCAB981FFD6C484FF5151
      51FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFEFEFEFFFEEEEEEFFECECECFFEBEBEBFFE9E9E9FFE8E8E8FFE6E6E6FFE5E5
      E5FFE4E4E4FFE2E2E2FFE1E1E1FFDFDFDFFFDEDEDEFFDCDCDCFFDBDBDBFFD9D9
      D9FFD8D8D8FFD7D7D7FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0
      D0FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF4FFFFFF191919FFE8F3F3FFE0EA
      EAFF8B8B8BFFCDD5D5FFC2CACAFF191919FFAEB3B3FF5C5C5CFF7FB8EEFF77B2
      EAFF6EADE7FF66A7E3FF5DA1DFFF559BDBFF4D95D7FF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000A900FF00A900FF00A900FF00A900FF00A900FF8B8B8BFF9FB6
      CDFF9CB4CCFF99B2CAFF96B0C9FF4293C0FF2688BCFF1B87BCFF048BC4FF41B7
      DFFF92F7FFFF79F4FFFF5AEEFFFF3DE7FFFF02A8DCFF007EC1FF0679B7FF177D
      B5FF3287B8FF688DB0FF191919FFFFFFFF00FFFFFF00515151FF515151FF5151
      51FFE9E0BDFFE9DFBBFFE8DEB8FFE7DCB6FFE6DBB3FFE5DAB1FF515151FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A1A1A1FFDACB90FFDAC98EFF928A6CFFCABA83FFD7C587FFD6C4
      84FF515151FF515151FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFF0F0F0FFEFEFEFFFEEEEEEFFECECECFFEBEBEBFFE9E9E9FFA1A1A1FF5151
      51FF515151FF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FF515151FF515151FF515151FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1
      D1FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5FFFFFF191919FFEAF5F5FFE2EC
      ECFF8B8B8BFFD0D8D8FFC5CDCDFF191919FFB0B5B5FF5C5C5CFF8DC2F5FF85BC
      F1FF7CB7EDFF74B1E9FF6CABE5FF63A5E2FF5B9FDEFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFA3BA
      D0FFA0B7CEFF9DB5CDFF9AB3CBFF97B1C9FF94AEC8FF91ACC5FF8EAAC4FF1A7F
      B8FF70D7EEFF96FCFFFF70F7FFFF31CAEDFF00609AFF7999B9FF7697B7FF7395
      B6FF7093B4FF6D90B2FF191919FFFFFFFF00FFFFFF00767676FFECE3C4FFEBE2
      C1FFEAE1BFFFE9E0BDFFE9DFBBFFE8DEB8FFE7DCB6FFE6DBB3FF515151FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A1A1A1FFDBCC93FFDACB90FFAFA378FFD9C88BFFD8C789FFD7C5
      87FFD6C484FFD6C382FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFF2F2F2FFF0F0F0FFEFEFEFFFEEEEEEFFECECECFFEBEBEBFFA1A1A1FFBBE7
      F7FFC8E8F1FF8AA19FFF235769FF235167FF28526BFFB0D4E3FFC7EAF4FFA7B3
      D4FF5F6986FF91A7CBFF515151FFD7D7D7FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2
      D2FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5FFFFFF191919FFEBF7F7FFE4EE
      EEFF8B8B8BFFD2DADAFFC8CFCFFF191919FFB3B8B8FF5C5C5CFF9BCDFBFF93C7
      F7FF8BC1F4FF82BBF0FF7AB5ECFF71AFE8FF69A9E4FF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFA7BD
      D2FFA5BBD0FFA2B8CFFF9FB6CDFF9CB4CCFF99B2CAFF96AFC9FF93ADC7FF90AB
      C4FF3495C2FFA1FEFFFF7BF8FFFF0072A8FF809FBDFF7D9DBBFF7A9BB9FF7798
      B8FF7496B6FF7194B5FF191919FFFFFFFF00FFFFFF00767676FFECE4C7FFECE3
      C4FFEBE2C1FFEAE1BFFFE9E0BDFFE9DFBBFFF1E9CFFFE7DCB6FF515151FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A1A1A1FFDCCD95FFDBCC93FFCDBD8AFFDAC98EFFD9C88BFFD8C7
      89FFD7C587FFD6C484FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFF3F3F3FFF2F2F2FFF0F0F0FFEFEFEFFFEDEDEDFFECECECFFA1A1A1FFBCE9
      F8FFC1E3F2FF8395A7FF40808AFF2D6575FF8FB1C3FFD2F5FFFF96B0B9FFA5BD
      BEFF6B7E7FFFA4B8BCFF515151FFD8D8D8FFD7D7D7FFD5D5D5FFD4D4D4FFD3D3
      D3FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5FFFFFF191919FFEDF8F8FFE6F0
      F0FF8B8B8BFFD4DDDDFFCAD2D2FF191919FFB5BABAFF5C5C5CFF797979FF7979
      79FF797979FF797979FF797979FF797979FF77B3EBFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFACC0
      D4FFA9BED2FFA6BCD1FFA3B9CFFFA0B7CEFF9DB5CCFF9AB3CBFF97B0C9FF94AE
      C8FF2285BAFF76E2F4FF64DEF4FF1D81B8FF85A3BFFF82A0BDFF7F9EBCFF7B9C
      BAFF7899B9FF7597B7FF191919FFFFFFFF00FFFFFF00767676FF767676FF7676
      76FFECE3C4FFEBE2C1FFEAE1BFFFF2ECCFFFF2EAD1FFE8DEB8FF515151FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A1A1A1FFDDCE98FFDCCD95FFDBCC93FFDACB90FFDAC98EFFD9C8
      8BFF7F7F7FFF7F7F7FFF7F7F7FFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFF4F4F4FFF3F3F3FFF1F1F1FFF0F0F0FFEFEFEFFFEDEDEDFFA1A1A1FFC2ED
      FCFFB9DBEDFF8FB3C8FF3E7883FF406E82FFCBEDF9FFCEF0FDFFC3E3EFFFA7BE
      CEFF8A9AB8FF91A4ABFF515151FFD9D9D9FFD8D8D8FFD7D7D7FFD5D5D5FFD4D4
      D4FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5FFFFFF191919FFEEFAFAFFE7F2
      F2FF8B8B8BFFD6DFDFFFCDD5D5FF191919FFB7BDBDFF5C5C5CFFCCD0D6FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FF797979FF86BDF1FF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFB0C3
      D6FFADC1D4FFAABFD3FFA7BDD2FFA4BAD0FFA2B8CFFF9FB6CDFF9CB4CCFF99B2
      CAFF96AFC8FF3398C5FF3197C3FF8CA8C3FF89A6C1FF86A4C0FF83A1BEFF809F
      BCFF7D9DBBFF7A9AB9FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00767676FFECE3C4FFEBE2C1FFF3EDD1FFF3EED9FFE9DFBBFFE8DEB8FF5151
      51FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A1A1A1FFDFD19DFFDECF9AFFDDCE98FFDCCD95FFDBCC93FFDACB90FF5151
      51FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFF5F5F5FFF4F4F4FFF3F3F3FFF1F1F1FFF0F0F0FFEFEFEFFFA1A1A1FFC1EB
      FAFFCEF1FEFFBBE3ECFF3A7483FF5D8599FFD5F6FFFFD0F2FDFFC8E7FFFFA3B5
      E5FFAAC1D4FF8186BBFF515151FFDBDBDBFFD9D9D9FFD8D8D8FFD7D7D7FFD5D5
      D5FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5FFFFFF191919FFF0FCFCFFE9F4
      F4FF8B8B8BFFD8E2E2FFCFD7D7FF191919FFBAC0C0FF5C5C5CFFCCD0D6FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FF797979FF94C8F8FF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFB4C7
      D8FFB1C4D7FFAEC2D5FFABC0D4FFA9BED2FFA6BCD1FFA3B9CFFFA0B7CEFF9DB5
      CCFF9AB3CBFF609FC4FF5F9EC4FF91ACC5FF8EA9C4FF8BA7C2FF88A5C0FF85A2
      BFFF81A0BDFF7E9EBCFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00767676FFECE3C4FFEEE5C7FFF4F0DDFFF9F5EAFFE9DFBBFFE8DE
      B8FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005151
      51FFE0D3A2FFDFD29FFFDFD19DFFDECF9AFFDDCE98FFDCCD95FF515151FFFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFF1F1F1FFF0F0F0FFA1A1A1FFC0EB
      FAFFD1F5FFFFB6E0EBFF215268FF587D93FFDDFCFFFFD0F1F9FFCAEAFBFFB0C4
      FBFFC0E5F3FFBDDEF9FF515151FFDCDCDCFFDBDBDBFFD9D9D9FFD8D8D8FFD6D6
      D6FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5FFFFFF191919FFF1FDFDFFEBF6
      F6FF8B8B8BFFDBE4E4FFD1DADAFF191919FFBCC2C2FF5C5C5CFFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1D2FEFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFB7CA
      DAFFB5C8D9FFB2C5D7FFB0C3D6FFADC1D4FFAABFD3FFA7BDD2FFA4BAD0FFA1B8
      CFFF9EB6CDFF9BB4CCFF98B1CAFF95AFC8FF92ADC7FF8FABC4FF8CA8C3FF89A6
      C1FF86A4C0FF83A1BEFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00767676FFEDE5C8FFECE4C7FFECE3C4FFF3EDD2FFFFFFFFFFEFE7CBFFE9DF
      BBFFE8DEB8FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFE2D5
      A7FFE1D4A4FFE0D3A2FFDFD29FFFDFD19DFFDECF9AFFDDCE98FFDCCD95FF5151
      51FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFF1F1F1FFA1A1A1FFC4EC
      FBFFD0F4FFFFA7D4DFFF3B707FFF496E87FFBDE1ECFF577E90FF5D8494FF5076
      87FF2D4E63FF82A8B5FF515151FFDDDDDDFFDCDCDCFFDADADAFFD9D9D9FFD8D8
      D8FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5FFFFFF191919FFF2FEFEFFECF8
      F8FF8B8B8BFFDDE6E6FFD3DCDCFF191919FFBEC5C5FF5C5C5CFFD9F8FFFFD3F3
      FFFFCCEFFFFFC5EAFFFFBEE5FFFFB6E0FFFFAFDBFFFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFBBCC
      DCFFB9CBDAFF8B8B8BFF656565FF656565FF656565FF656565FF656565FF6565
      65FF656565FF656565FF656565FF656565FF656565FF656565FF656565FF6565
      65FF8BA7C2FF87A5C0FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF007676
      76FFEEE6CBFFEDE6CAFFEDE5C8FFECE4C7FFECE3C4FFF3EDD2FFFFFFFFFFEFE7
      CBFFE9DFBBFFE8DEB8FF515151FF515151FF515151FF515151FFE4D8ACFFE3D7
      A9FFE2D5A7FFE1D4A4FFE0D3A2FFDFD29FFFDFD19DFFDECF9AFFDDCE98FFDCCD
      95FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFF9F9F9FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFA1A1A1FFC3EB
      F9FFD3F6FFFF95C7D0FF205165FF7396ACFF86A6B7FF123956FF3E6F80FF4171
      80FF386D79FF365D6DFF515151FFDFDFDFFFDDDDDDFFDCDCDCFFDADADAFFD9D9
      D9FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5FFFFFF191919FFF3FFFFFFEEF9
      F9FF8B8B8BFFDFE9E9FFD6DEDFFF191919FFC1C8C8FF5C5C5CFFE2FEFFFFDDFA
      FFFFD7F6FFFFD1F2FFFFCAEDFFFFC3E9FFFFBBE4FFFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFBECF
      DDFFBCCDDCFF8B8B8BFFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9
      E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FF6565
      65FF8FAAC4FF8CA8C3FF191919FFFFFFFF00FFFFFF00FFFFFF00767676FFEEE7
      CDFFEEE7CCFFEEE6CBFFEDE6CAFFEDE5C8FFECE4C7FFECE3C4FFF3EDD2FFFFFF
      FFFFF3EDD9FFEEE6C9FFE8DEB8FFE7DCB6FFE6DBB3FFE5DAB1FFE4D9AEFFE4D8
      ACFFE3D7A9FFE2D5A7FFE1D4A4FFE0D3A2FFDFD29FFFDFD19DFFDECF9AFFDDCE
      98FFDCCD95FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFFAFAFAFFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFA1A1A1FFC2EB
      FAFFC7EDFAFF5B969EFF133C55FF93B5C5FFD6F7FFFF749FB1FF82B2BEFFABD7
      E1FF75AEB6FF427581FF515151FFE0E0E0FFDFDFDFFFDDDDDDFFDCDCDCFFDADA
      DAFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF8B8B8BFFF5FFFFFFF5FFFFFFEFFB
      FBFFE9F4F4FF8B8B8BFF8B8B8BFFCED6D6FFC3CBCBFF5C5C5CFFEBFFFFFFE6FF
      FFFFE1FDFFFFDBF9FFFFD5F5FFFFCFF1FFFFC8ECFFFF191919FFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFC2D1
      DFFFC0D0DEFF8B8B8BFFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9
      E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FFD4D9E0FF6565
      65FF94AEC8FF91ACC5FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF007676
      76FFEEE7CDFFEEE7CCFF7F7F7FFF7F7F7FFFEDE5C8FFECE4C7FFECE3C4FFEBE2
      C1FFFFFFFFFFF9F5EAFFF1EAD2FFEEE5C7FFF1E8CDFFE6DBB3FFE5DAB1FFE4D9
      AEFFE4D8ACFFE3D7A9FFE2D5A7FFE1D4A4FF7F7F7FFF7F7F7FFFDFD19DFFDECF
      9AFF7F7F7FFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFA1A1A1FFCCF1
      FFFF88BCC7FF3B7A82FF133954FF80A3B7FFD8F5FAFFCBE4E5FFC3DEE2FFD0EA
      EDFFC5E9F4FF578C97FF515151FFE1E1E1FFE0E0E0FFDFDFDFFFDDDDDDFFDCDC
      DCFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5FFFFFFF5FFFFFFF5FFFFFFF1FD
      FDFFEAF5F5FFE3EDEDFFDAE3E3FFD0D9D9FFC5CECEFF5C5C5CFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFFF6D2B7FF856E
      32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFC5D4
      E1FFC3D2E0FF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF98B1CAFF95AFC8FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00767676FF767676FFFFFFFF00FFFFFF007F7F7FFFEDE5C8FFECE4C7FFECE3
      C4FFEBE2C1FFEAE1BFFFF2EAD2FFF2EAD1FFE8DEB8FFE7DCB6FFE6DBB3FFE5DA
      B1FFE4D9AEFFE4D8ACFFE3D7A9FF515151FFFFFFFF00FFFFFF007F7F7FFF7F7F
      7FFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFA1A1A1FFA4D2
      DEFF4C8D94FF346F7BFF0F314DFF6B8FA4FFD6EAE7FFCDDDD4FFCCDED8FFCADA
      D5FFCDEFF7FF4F7686FF515151FFE3E3E3FFE1E1E1FFE0E0E0FFDFDFDFFFDDDD
      DDFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008B8B8BFF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FFF6D2B7FFF6D2
      B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2
      B7FF856E32FF856E32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFC9D6
      E2FFC7D5E1FFC4D3E0FFC2D1DFFFBFD0DEFFBDCEDDFFBBCCDCFFB8CADAFFB6C8
      D9FFB3C7D8FFB1C4D6FFAEC2D5FFABBFD4FFA8BDD2FFA5BBD1FFA2B9CFFFA0B7
      CEFF9DB5CCFF9AB2CBFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7FFFEDE6CAFFEDE5C8FFECE4
      C7FFECE3C4FFEBE2C1FFEAE1BFFFE9E0BDFFE9DFBBFFE8DEB8FFE7DCB6FFE6DB
      B3FFE5DAB1FFE4D9AEFFE4D8ACFF515151FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFA1A1A1FF4F8E
      97FF44878EFF326675FF10314FFF4F7085FF5D8091FF5E8494FF83AAB9FFA3C8
      D6FF81A4B1FF2E4B5FFF515151FFE4E4E4FFE3E3E3FFE1E1E1FFE0E0E0FFDEDE
      DEFFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008B8B8BFFF5FFFFFFF5FFFFFFF5FFFFFFF5FFFFFFF5FFFFFFF3FF
      FFFFEDF9F9FFE6F1F1FFDEE8E8FFD5DEDEFFCBD3D3FF5C5C5CFFF6D2B7FFF6D2
      B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2
      B7FFF6D2B7FF856E32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFCBD8
      E4FFCAD7E3FFC8D5E2FFC5D4E1FFC3D2E0FFC0D1DFFFBECFDDFFBCCDDCFFB9CB
      DBFFB7C9DAFFB4C7D8FFB2C4D7FFAFC2D6FFACC0D4FFAABED3FFA7BCD1FFA4BA
      D0FFA1B8CEFF9EB6CDFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7FFFEEE7CCFFEEE6CBFFEDE6CAFFEDE5
      C8FF7F7F7FFFECE3C4FFEBE2C1FFEAE1BFFFE9E0BDFFE9DFBBFFE8DEB8FF7F7F
      7FFFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFF515151FFFFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFA1A1A1FF4B88
      91FF41838BFF275668FF183B59FF163A55FF11354DFF153951FF1C3E56FF2444
      58FF1D394FFF28495CFF515151FFE6E6E6FFE4E4E4FFE3E3E3FFE1E1E1FFE0E0
      E0FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008B8B8BFF8B8B8BFFF5FFFFFFF5FFFFFFF5FFFFFFF5FFFFFFF4FF
      FFFFEFFBFBFFE8F3F3FFE0EAEAFFD7E0E0FFCDD5D5FF5C5C5CFFF6D2B7FFF6D2
      B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2
      B7FFF6D2B7FF856E32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFCEDA
      E5FFCCD9E4FFCAD7E3FFC9D6E2FFC7D4E1FFC4D3E0FFC1D1DFFFBFD0DEFFBDCE
      DDFFBBCCDBFFB8CADAFFB6C8D9FFB3C5D8FFB0C3D6FFAEC1D5FFABBFD3FFA8BD
      D2FFA5BBD1FFA2B9CFFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7FFFEEE7CDFFEEE7CCFFEEE6CBFF7F7F
      7FFFFFFFFF007F7F7FFFECE3C4FFEBE2C1FFEAE1BFFFE9E0BDFF515151FFFFFF
      FF007F7F7FFFE6DBB3FFE5DAB1FFE4D9AEFF515151FFFFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFA1A1A1FF4181
      8AFF3E7C85FF225367FF1A3F5CFF1A3D58FF193C56FF1E4159FF23455CFF1C3D
      55FF23435CFF507387FF515151FFE7E7E7FFE6E6E6FFE4E4E4FFE3E3E3FFE1E1
      E1FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF856E32FF856E
      32FF856E32FF856E32FF856E32FF856E32FF856E32FF856E32FF856E32FF856E
      32FF856E32FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFD0DC
      E6FFCFDAE5FFCDD9E4FFCBD8E4FFC9D7E3FFC8D5E2FFC5D4E1FFC2D2E0FFC0D0
      DEFFBECFDDFFBCCDDCFFB9CBDBFFB7C9DAFFB4C7D8FFB2C4D7FFAFC2D6FFACC0
      D4FFA9BED3FFA7BCD1FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7FFFEEE7CDFF7F7F7FFFFFFF
      FF00FFFFFF00FFFFFF007F7F7FFFECE3C4FFEBE2C1FF515151FFFFFFFF00FFFF
      FF00FFFFFF007F7F7FFFE6DBB3FF7F7F7FFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFFEFEFEFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFE8E8E8FFE7E7E7FFE6E6E6FFE4E4E4FFE3E3
      E3FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008B8B8BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008B8B8BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFD2DD
      E7FFD1DCE6FFCFDBE6FFCEDAE5FFCCD9E4FFCAD7E3FFC8D6E2FFC7D4E1FFC3D3
      E0FFC1D1DFFFBFD0DEFFBDCEDDFFBACCDBFFB8CADAFFB5C8D9FFB3C5D8FFB0C3
      D6FFAEC1D5FFABBFD3FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7FFFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7FFFECE4C7FFECE3C4FF515151FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7FFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB9
      A0FFFFFFFFFFFEFEFEFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9
      F9FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFF3F3F3FFF2F2F2FFF1F1F1FFEFEF
      EFFFEEEEEEFFEDEDEDFFEBEBEBFFEAEAEAFFE8E8E8FFE7E7E7FFE5E5E5FFE4E4
      E4FFE08B62FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF9E9E9EFF9E9E9EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF8B8B8BFF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF8B8B8BFF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFFFF2DCFFFFF1DBFFFFF0
      D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFFFFE8
      CDFFFFE7CCFFFFE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1
      C1FFFFE0C0FFFFE0BFFFFFDFBEFFFFDEBDFFFFDEBCFFFFDDBBFFFFDDBAFFFFDC
      B9FFFFDCB8FFFFDBB7FFFFDBB7FF191919FF8B8B8BFFFFF2DCFFFFF1DBFFFFF0
      D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFFFFE8
      CDFFFFE7CCFFFFE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1
      C1FFFFE0C0FFFFE0BFFFFFDFBEFFFFDEBDFFFFDEBCFFFFDDBBFFFFDDBAFFFFDC
      B9FFFFDCB8FFFFDBB7FFFFDBB7FF191919FF8B8B8BFFFFF2DCFFFFF1DBFFFFF0
      D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFFFFE8
      CDFFFFE7CCFFFFE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1
      C1FFFFE0C0FFFFE0BFFFFFDFBEFFFFDEBDFFFFDEBCFFFFDDBBFFFFDDBAFFFFDC
      B9FFFFDCB8FFFFDBB7FFFFDBB7FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFFFF3DEFFFFF2DCFFFFF1
      DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FF8B8B
      8BFF191919FF191919FF191919FF191919FF191919FF191919FF191919FFFFE2
      C2FFFFE1C1FFFFE0C0FFFFE0BFFFFFDFBEFFFFDEBDFFFFDEBCFFFFDDBBFFFFDD
      BAFFFFDCB9FFFFDCB8FFFFDBB7FF191919FF8B8B8BFFFFF3DEFFFFF2DCFFFFF1
      DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFB1B9
      BFFFFFE8CDFFFFE7CCFFFFE6CAFFFFE5C9FFFFE4C7FF8B8B8BFF191919FF1919
      19FF191919FF191919FF191919FF191919FFFFDEBDFFFFDEBCFFFFDDBBFFFFDD
      BAFFFFDCB9FFFFDCB8FFFFDBB7FF191919FF8B8B8BFFFFF3DEFFFFF2DCFF00A9
      00FFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFB1B9
      BFFFFFE8CDFFFFE7CCFFFFE6CAFFFFE5C9FFFFE4C7FF8B8B8BFF191919FF1919
      19FF191919FF191919FF191919FF191919FFFFDEBDFFFFDEBCFFFFDDBBFFFFDD
      BAFFFFDCB9FFFFDCB8FFFFDBB7FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FFFFFFFF00FFFFFF008B8B8BFFFFF4DFFFFFF3DEFFFFF2
      DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FF8B8B
      8BFFE4EAEAFFE9EDEDFFEDF1F1FFF2F5F5FFF6F8F8FFFAFBFBFF191919FFFFE3
      C4FFFFE2C2FFFFE1C1FFFFE0C0FFFFE0BFFFFFDFBEFFFFDEBDFFFFDEBCFFFFDD
      BBFFFFDDBAFFFFDCB9FFFFDCB8FF191919FF8B8B8BFFFFF4DFFFFFF3DEFFFFF2
      DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEA
      D0FFFFE9CEFFFFE8CDFFFFE7CCFFFFE6CAFFFFE5C9FF8B8B8BFFEAEAEAFFEDED
      EDFFF1F1F1FFF5F5F5FFF8F8F8FF191919FFFFDFBEFFFFDEBDFFFFDEBCFFFFDD
      BBFFFFDDBAFFFFDCB9FFFFDCB8FF191919FF8B8B8BFFFFF4DFFFFFF3DEFF00A9
      00FFFFF1DBFF006C00FF006C00FF006C00FF006C00FF006C00FF006C00FFFFEA
      D0FFFFE9CEFFFFE8CDFFFFE7CCFFFFE6CAFFFFE5C9FF8B8B8BFFEAEAEAFFEDED
      EDFFF1F1F1FFF5F5F5FFF8F8F8FF191919FFFFDFBEFFFFDEBDFFFFDEBCFFFFDD
      BBFFFFDDBAFFFFDCB9FFFFDCB8FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF579BD9FF5096D5FF4990
      D2FF428BCFFF3B86CCFF3481C9FF2E7DC7FF2878C3FF2274C1FF1D70BEFF186D
      BCFF1369BAFF191919FFFFFFFF00FFFFFF008B8B8BFFFFF5E1FFFFF4DFFFFFF3
      DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FF8B8B
      8BFFE0E6E6FFE4EAEAFFE1E5E4FF006C00FFF2F5F5FFF6F8F8FF191919FFFFE4
      C5FFFFE3C4FFFFE2C2FFFFE1C1FFFFE0C0FFFFE0BFFFFFDFBEFFFFDEBDFFFFDE
      BCFFFFDDBBFFFFDDBAFFFFDCB9FF191919FF8B8B8BFFFFF5E1FFFFF4DFFFFFF3
      DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFB1B9
      BFFFFFEAD0FFB1B9BFFFFFE8CDFFB1B9BFFFFFE6CAFF8B8B8BFFE6E6E6FFEAEA
      EAFFEDEDEDFFF1F1F1FFF5F5F5FF191919FFFFE0BFFFFFDFBEFFFFDEBDFFFFDE
      BCFFFFDDBBFFFFDDBAFFFFDCB9FF191919FF8B8B8BFFFFF5E1FFFFF4DFFF00A9
      00FF006C00FF63E170FF5BDF69FF53DC62FF4BDA5BFF44D854FF3DD64DFF006C
      00FFFFEAD0FFB1B9BFFFFFE8CDFFB1B9BFFFFFE6CAFF8B8B8BFFE6E6E6FFEAEA
      EAFFEDEDEDFFF1F1F1FFF5F5F5FF191919FFFFE0BFFFFFDFBEFFFFDEBDFFFFDE
      BCFFFFDDBBFFFFDDBAFFFFDCB9FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF63A4DEFF5C9FDBFF5499
      D7FF4D94D4FF468ED1FF3F89CEFF3884CBFF327FC8FF2B7BC5FF2677C2FF2073
      C0FF1B6FBEFF191919FFFFFFFF00FFFFFF008B8B8BFFFFF5E3FFFFF5E1FFFFF4
      DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FF8B8B
      8BFFDCE3E3FFE0E6E6FF00A900FF73DA7EFF006C00FFF2F5F5FF191919FFFFE4
      C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1C1FFFFE0C0FFFFE0BFFFFFDFBEFFFFDE
      BDFFFFDEBCFFFFDDBBFFFFDDBAFF191919FF8B8B8BFFFFF5E3FFFFF5E1FFFFF4
      DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFEC
      D3FFFFEBD1FFFFEAD0FFFFE9CEFFFFE8CDFFFFE7CCFF8B8B8BFFE3E3E3FFE6E6
      E6FFEAEAEAFFEDEDEDFFF1F1F1FF191919FFFFE0C0FFFFE0BFFFFFDFBEFFFFDE
      BDFFFFDEBCFFFFDDBBFFFFDDBAFF191919FF8B8B8BFFFFF5E3FFFFF5E1FF00A9
      00FF76E781FF6DE47AFF65E273FF5DDF6BFF006C00FF00A900FF00A900FF00A9
      00FF006C00FFFFEAD0FFFFE9CEFFFFE8CDFFFFE7CCFF8B8B8BFFE3E3E3FFE6E6
      E6FFEAEAEAFFEDEDEDFFF1F1F1FF191919FFFFE0C0FFFFE0BFFFFFDFBEFFFFDE
      BDFFFFDEBCFFFFDDBBFFFFDDBAFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF191919FF1919
      19FF191919FF191919FF191919FF191919FF8B8B8BFF70ADE3FF68A8E0FF60A2
      DCFF589CD9FF5197D6FF4A91D3FF438CD0FF3C87CDFF3582CAFF2F7EC7FF2979
      C4FF2375C1FF191919FFFFFFFF00FFFFFF008B8B8BFFFFF6E4FFFFF5E3FFFFF5
      E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FF8B8B
      8BFFD8E0E0FFDCE3E3FF00A900FF82DE8CFF73DA7EFF006C00FF191919FFFFE5
      C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1C1FFFFE0C0FFFFE0BFFFFFDF
      BEFFFFDEBDFFFFDEBCFFFFDDBBFF191919FF8B8B8BFFFFF6E4FFFFF5E3FFFFF5
      E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFB1B9
      BFFFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFFFFE8CDFF8B8B8BFFE0E0E0FFE3E3
      E3FFE6E6E6FFEAEAEAFFEDEDEDFF191919FFFFE1C1FFFFE0C0FFFFE0BFFFFFDF
      BEFFFFDEBDFFFFDEBCFFFFDDBBFF191919FF8B8B8BFFFFF6E4FFFFF5E3FF00A9
      00FF80EA8BFF78E784FF70E57DFF68E375FF006C00FFFFEFD8FFFFEED6FFB1B9
      BFFF00A900FF00A900FFFFEAD0FFFFE9CEFFFFE8CDFF8B8B8BFFE0E0E0FFE3E3
      E3FFE6E6E6FFEAEAEAFFEDEDEDFF191919FFFFE1C1FFFFE0C0FFFFE0BFFFFFDF
      BEFFFFDEBDFFFFDEBCFFFFDDBBFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF81EAFFFF7DE9
      FFFF7AE8FFFF76E7FFFF73E6FFFF6FE5FFFF8B8B8BFF7CB7E9FF74B1E5FF6CAB
      E2FF65A5DEFF5DA0DBFF559AD8FF4E94D5FF478FD2FF408ACFFF3985CCFF3380
      C9FF2C7CC5FF191919FFFFFFFF00FFFFFF008B8B8BFFFFF7E6FFFFF6E4FFFFF5
      E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FF8B8B
      8BFFD5DEDEFFD8E0E0FF00A900FF91E29AFF82DE8CFF73DA7EFF006C00FFFFE6
      CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1C1FFFFE0C0FFFFE0
      BFFFFFDFBEFFFFDEBDFFFFDEBCFF191919FF8B8B8BFFFFF7E6FFFFF6E4FFFFF5
      E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEE
      D6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFF8B8B8BFFDEDEDEFFE0E0
      E0FFE3E3E3FFE6E6E6FFEAEAEAFF191919FFFFE2C2FFFFE1C1FFFFE0C0FFFFE0
      BFFFFFDFBEFFFFDEBDFFFFDEBCFF191919FF8B8B8BFFFFF7E6FFFFF6E4FF00A9
      00FF8BED95FF83EB8EFF7BE886FF006C00FFFFF1DBFFFFF0D9FFFFEFD8FFFFEE
      D6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFF8B8B8BFFDEDEDEFFE0E0
      E0FFE3E3E3FFE6E6E6FFEAEAEAFF191919FFFFE2C2FFFFE1C1FFFFE0C0FFFFE0
      BFFFFFDFBEFFFFDEBDFFFFDEBCFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF88ECFFFF84EB
      FFFF80EAFFFF7CE9FFFF79E7FFFF75E6FFFF8B8B8BFF89C0EEFF81BAEBFF79B4
      E7FF71AEE4FF69A9E0FF61A3DDFF5A9DDAFF5298D6FF4B92D3FF448DD0FF3D88
      CDFF3683CAFF191919FFFFFFFF00FFFFFF008B8B8BFFFFF8E7FFFFF7E6FFFFF6
      E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FF8B8B
      8BFFD3DCDCFF00A900FFAEEAB4FFA0E6A7FF91E29AFF82DE8CFF73DA7EFF006C
      00FFFFE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1C1FFFFE0
      C0FFFFE0BFFFFFDFBEFFFFDEBDFF191919FF8B8B8BFFFFF8E7FFFFF7E6FFFFF6
      E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFB1B9
      BFFFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFE3C4FFFFE2C2FFFFE1C1FFFFE0
      C0FFFFE0BFFFFFDFBEFFFFDEBDFF191919FF8B8B8BFFFFF8E7FFFFF7E6FF00A9
      00FF00A900FF00A900FF00A900FF00A900FF00A900FF00A900FFFFF0D9FFB1B9
      BFFFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFE3C4FFFFE2C2FFFFE1C1FFFFE0
      C0FFFFE0BFFFFFDFBEFFFFDEBDFF191919FFFFFFFF00FFFFFF008B8B8BFF1919
      19FF191919FF191919FF191919FF191919FF191919FF8B8B8BFF8FEEFFFF8BED
      FFFF87ECFFFF83EAFFFF7FE9FFFF7BE8FFFF8B8B8BFF96CBF4FF8EC4F0FF86BE
      EDFF7EB8E9FF76B2E6FF6EACE2FF66A6DFFF5EA0DCFF579BD8FF4F95D5FF4890
      D2FF418BCFFF191919FFFFFFFF00FFFFFF008B8B8BFFFFF9E9FFFFF8E7FFFFF7
      E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFF8B8B
      8BFF8B8B8BFF00A900FFBBEDC0FF00A900FF00A900FF00A900FF82DE8CFF73DA
      7EFF006C00FFFFE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1
      C1FFFFE0C0FFFFE0BFFFFFDFBEFF191919FF8B8B8BFFFFF9E9FFFFF8E7FFFFF7
      E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0
      D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFFFFE8
      CDFFFFE7CCFFFFE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1
      C1FFFFE0C0FFFFE0BFFFFFDFBEFF191919FF8B8B8BFFFFF9E9FFFFF8E7FFFFF7
      E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0
      D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFFFFE8
      CDFFFFE7CCFFFFE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2C2FFFFE1
      C1FFFFE0C0FFFFE0BFFFFFDFBEFF191919FFFFFFFF00FFFFFF008B8B8BFFFFE0
      C7FFFFDFC4FFFFDDC2FFFFDCC0FFFFDBBFFFFFDBBEFF8B8B8BFF97F0FFFF92EF
      FFFF8EEEFFFF8AECFFFF86EBFFFF82EAFFFF8B8B8BFFA3D4F9FF9BCEF6FF93C8
      F2FF8BC1EFFF82BBEBFF7AB5E8FF72AFE4FF6AAAE1FF63A4DEFF5B9EDAFF5399
      D7FF4C93D4FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFAEAFFFFF9E9FFFFF8
      E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1
      DBFF00A900FFD1F3D4FF00A900FFFFEDD5FFFDEBD3FF00A900FF00A900FF82DE
      8CFF73DA7EFF006C00FFF9E4C8FFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2
      C2FFFFE1C1FFFFE0C0FFFFE0BFFF191919FF8B8B8BFFFFFAEAFFFFF9E9FFFFF8
      E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFB1B9
      BFFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9
      CEFFFFE8CDFFFFE7CCFFFFE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2
      C2FFFFE1C1FFFFE0C0FFFFE0BFFF191919FF8B8B8BFFFFFAEAFFFFF9E9FFFFF8
      E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFB1B9
      BFFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9
      CEFFFFE8CDFFFFE7CCFFFFE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3C4FFFFE2
      C2FFFFE1C1FFFFE0C0FFFFE0BFFF191919FFFFFFFF00FFFFFF008B8B8BFFFFE2
      CAFFFFE1C8FFFFDFC5FFFFDEC3FFFFDDC2FFFFDCC0FF8B8B8BFF9EF2FFFF9AF1
      FFFF95F0FFFF91EEFFFF8DEDFFFF89ECFFFF8B8B8BFFB0DEFFFFA7D8FBFF9FD2
      F8FF97CCF4FF8FC5F1FF87BFEDFF7FB9EAFF77B3E6FF6FADE3FF67A7E0FF60A1
      DCFF589CD9FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFBEBFFFFFAEAFFFFF9
      E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2
      DCFF00A900FF00A900FFFEEED8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FF00A9
      00FF82DE8CFF73DA7EFF006C00FFFCE6CAFFFFE5C9FFFFE4C7FFFFE4C5FFFFE3
      C4FFFFE2C2FFFFE1C1FFFFE0C0FF191919FF8B8B8BFFFFFBEBFFFFFAEAFFFFF9
      E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2
      DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FF8B8B8BFF191919FF1919
      19FF191919FF191919FF191919FF191919FFFFE5C9FFFFE4C7FFFFE4C5FFFFE3
      C4FFFFE2C2FFFFE1C1FFFFE0C0FF191919FF8B8B8BFFFFFBEBFFFFFAEAFFFFF9
      E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FF006C00FF006C00FF006C00FF006C
      00FF006C00FF006C00FF006C00FFFFEED6FFFFEDD5FF8B8B8BFF191919FF1919
      19FF191919FF191919FF191919FF191919FFFFE5C9FFFFE4C7FFFFE4C5FFFFE3
      C4FFFFE2C2FFFFE1C1FFFFE0C0FF191919FFFFFFFF00FFFFFF008B8B8BFFFFE4
      CEFFFFE3CBFFFFE2CAFFFFE0C8FFFFDFC5FFFFDEC3FF8B8B8BFFA6F4FFFFA1F3
      FFFF9DF2FFFF98F1FFFF94EFFFFF90EEFFFF8B8B8BFFBCE7FFFFB4E1FFFFACDB
      FDFFA4D5FAFF9CCFF6FF94C9F3FF8CC2EFFF84BCECFF7CB6E8FF74B0E5FF6CAB
      E2FF64A5DEFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFCEDFFFFFBEBFFFFFA
      EAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3
      DEFF00A900FFFEF0DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFEEB
      D2FF00A900FF00A900FF73DA7EFF006C00FFFAE5CAFFFFE5C9FFFFE4C7FFFFE4
      C5FFFFE3C4FFFFE2C2FFFFE1C1FF191919FF8B8B8BFFFFFCEDFFFFFBEBFFFFFA
      EAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFB1B9
      BFFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FF8B8B8BFFEAEAEAFFEDED
      EDFFF1F1F1FFF5F5F5FFF8F8F8FF191919FFFFE6CAFFFFE5C9FFFFE4C7FFFFE4
      C5FFFFE3C4FFFFE2C2FFFFE1C1FF191919FF8B8B8BFFFFFCEDFFFFFBEBFFFFFA
      EAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FF006C00FF88EC
      93FF80EA8BFF78E784FF006C00FFFFEFD8FFFFEED6FF8B8B8BFFEAEAEAFFEDED
      EDFFF1F1F1FFF5F5F5FFF8F8F8FF191919FFFFE6CAFFFFE5C9FFFFE4C7FFFFE4
      C5FFFFE3C4FFFFE2C2FFFFE1C1FF191919FFFFFFFF00FFFFFF008B8B8BFFFFE7
      D1FFFFE5CFFFFFE4CDFFFFE3CBFFFFE1C9FFFFE0C7FF8B8B8BFFADF6FFFFA9F5
      FFFFA4F4FFFFA0F3FFFF9BF1FFFF97F0FFFF8B8B8BFFC9F0FFFFC1EAFFFFB9E5
      FFFFB1DFFFFFA9D9FCFFA1D3F8FF99CDF5FF91C7F1FF88C0EEFF80BAEAFF78B4
      E7FF70AEE3FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFDEEFFFFFCEDFFFFFB
      EBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4
      DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFEC
      D3FFFFEBD2FFFFEAD0FF00A900FF73DA7EFF006C00FFFAE5CBFFFFE5C9FFFFE4
      C7FFFFE4C5FFFFE3C4FFFFE2C2FF191919FF8B8B8BFFFFFDEEFFFFFCEDFFFFFB
      EBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4
      DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FF8B8B8BFFE6E6E6FFEAEA
      EAFFEDEDEDFFF1F1F1FFF5F5F5FF191919FFFFE7CCFFFFE6CAFFFFE5C9FFFFE4
      C7FFFFE4C5FFFFE3C4FFFFE2C2FF191919FF8B8B8BFFFFFDEEFFFFFCEDFFFFFB
      EBFF00A900FF006C00FFFFF8E7FFFFF7E6FFFFF6E4FF006C00FF9BF2A4FF93EF
      9DFF8BED95FF83EB8EFF006C00FFFFF0D9FFFFEFD8FF8B8B8BFFE6E6E6FFEAEA
      EAFFEDEDEDFFF1F1F1FFF5F5F5FF191919FFFFE7CCFFFFE6CAFFFFE5C9FFFFE4
      C7FFFFE4C5FFFFE3C4FFFFE2C2FF191919FFFFFFFF00FFFFFF008B8B8BFFFFE9
      D5FFFFE8D3FFFFE6D1FFFFE5CFFFFFE4CDFFFFE2CBFF8B8B8BFFB5F9FFFFB0F7
      FFFFACF6FFFFA7F5FFFFA3F4FFFF9FF2FFFF8B8B8BFFD5F9FFFFCEF3FFFFC5EE
      FFFFBDE8FFFFB6E2FFFFADDCFEFFA5D6FAFF9DD0F7FF95CAF3FF8DC3F0FF85BD
      ECFF7DB7E9FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFEF0FFFFFDEEFFFFFC
      EDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5
      E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFED
      D5FFFFECD3FFFFEBD1FFF3E7CCFF00A900FF73DA7EFF006C00FFFFE6CAFFFFE5
      C9FFFFE4C7FFFFE4C5FFFFE3C4FF191919FF8B8B8BFFFFFEF0FFFFFDEEFFFFFC
      EDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFB1B9
      BFFFFFF4DFFFB1B9BFFFFFF2DCFFB1B9BFFFFFF0D9FF8B8B8BFFE3E3E3FFE6E6
      E6FFEAEAEAFFEDEDEDFFF1F1F1FF191919FFFFE8CDFFFFE7CCFFFFE6CAFFFFE5
      C9FFFFE4C7FFFFE4C5FFFFE3C4FF191919FF8B8B8BFFFFFEF0FFFFFDEEFFFFFC
      EDFFFFFBEBFF00A900FF006C00FF006C00FF006C00FFACF7B4FFA5F5ADFF9DF2
      A6FF96F09FFF8EEE98FF006C00FFB1B9BFFFFFF0D9FF8B8B8BFFE3E3E3FFE6E6
      E6FFEAEAEAFFEDEDEDFFF1F1F1FF191919FFFFE8CDFFFFE7CCFFFFE6CAFFFFE5
      C9FFFFE4C7FFFFE4C5FFFFE3C4FF191919FFFFFFFF00FFFFFF008B8B8BFFFFEC
      D9FFFFEAD7FFFFE9D5FFFFE7D2FFFFE6D0FFFFE5CEFF8B8B8BFFBCFBFFFFB8F9
      FFFFB3F8FFFFAFF7FFFFAAF6FFFFA6F4FFFF8B8B8BFFE0FFFFFFD9FCFFFFD2F7
      FFFFCBF1FFFFC2EBFFFFBAE6FFFFB2E0FFFFAADAFCFFA2D4F9FF9ACEF5FF92C8
      F2FF8AC1EFFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFEF1FFFFFEF0FFFFFD
      EEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5
      E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEE
      D6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FF00A900FF00A900FFFFE7CCFFFFE6
      CAFFFFE5C9FFFFE4C7FFFFE4C5FF191919FF8B8B8BFFFFFEF1FFFFFEF0FFFFFD
      EEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5
      E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFF8B8B8BFFE0E0E0FFE3E3
      E3FFE6E6E6FFEAEAEAFFEDEDEDFF191919FFFFE9CEFFFFE8CDFFFFE7CCFFFFE6
      CAFFFFE5C9FFFFE4C7FFFFE4C5FF191919FF8B8B8BFFFFFEF1FFFFFEF0FFFFFD
      EEFFFFFCEDFFFFFBEBFF00A900FFC3FECAFFBDFCC3FFB6FABDFFAFF8B6FFA7F5
      AFFFA0F3A8FF00A900FF006C00FFFFF2DCFFFFF1DBFF8B8B8BFFE0E0E0FFE3E3
      E3FFE6E6E6FFEAEAEAFFEDEDEDFF191919FFFFE9CEFFFFE8CDFFFFE7CCFFFFE6
      CAFFFFE5C9FFFFE4C7FFFFE4C5FF191919FFFFFFFF00FFFFFF008B8B8BFFFFEE
      DDFFFFEDDBFFFFEBD9FFFFEAD6FFFFE9D4FFFFE7D2FF8B8B8BFFC3FDFFFFBFFC
      FFFFBBFAFFFFB6F9FFFFB2F8FFFFAEF7FFFF8B8B8BFFEBFFFFFFA1A1A1FF7979
      79FF797979FF797979FF797979FF797979FF797979FF797979FF797979FF7979
      79FF97CBF4FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFFF2FFFFFEF1FFFFFE
      F0FFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FF8B8B
      8BFF191919FF191919FF191919FF191919FF191919FF191919FF191919FFFFEF
      D8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFFFFE8CDFFFFE7
      CCFFFFE6CAFFFFE5C9FFFFE4C7FF191919FF8B8B8BFFFFFFF2FFFFFEF1FFFFFE
      F0FFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FFB1B9
      BFFFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFF8B8B8BFFDEDEDEFFE0E0
      E0FFE3E3E3FFE6E6E6FFEAEAEAFF191919FFFFEAD0FFFFE9CEFFFFE8CDFFFFE7
      CCFFFFE6CAFFFFE5C9FFFFE4C7FF191919FF8B8B8BFFFFFFF2FFFFFEF1FFFFFE
      F0FFFFFDEEFFFFFCEDFFFFFBEBFF00A900FF00A900FF00A900FF00A900FF00A9
      00FF00A900FFFFF5E1FF006C00FFFFF3DEFFFFF2DCFF8B8B8BFFDEDEDEFFE0E0
      E0FFE3E3E3FFE6E6E6FFEAEAEAFF191919FFFFEAD0FFFFE9CEFFFFE8CDFFFFE7
      CCFFFFE6CAFFFFE5C9FFFFE4C7FF191919FFFFFFFF00FFFFFF008B8B8BFFFFF1
      E1FFFFF0DFFFFFEEDDFFFFEDDAFFFFEBD8FFFFEAD6FF8B8B8BFFCBFFFFFFC7FE
      FFFFC2FCFFFFBEFBFFFFB9FAFFFFB5F9FFFF8B8B8BFFF6FFFFFFA1A1A1FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF7979
      79FFA4D5FAFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFFF3FFFFFFF2FFFFFE
      F1FFFFFEF0FFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FF8B8B
      8BFFE4EAEAFFE9EDEDFFEDF1F1FFF2F5F5FFF6F8F8FFFAFBFBFF191919FFFFF0
      D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9CEFFFFE8
      CDFFFFE7CCFFFFE6CAFFFFE5C9FF191919FF8B8B8BFFFFFFF3FFFFFFF2FFFFFE
      F1FFFFFEF0FFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7
      E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFEBD1FFFFEAD0FFFFE9CEFFFFE8
      CDFFFFE7CCFFFFE6CAFFFFE5C9FF191919FF8B8B8BFFFFFFF3FFFFFFF2FFFFFE
      F1FFFFFEF0FFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7
      E6FFFFF6E4FFFFF5E3FF00A900FFFFF4DFFFFFF3DEFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFEBD1FFFFEAD0FFFFE9CEFFFFE8
      CDFFFFE7CCFFFFE6CAFFFFE5C9FF191919FFFFFFFF00FFFFFF008B8B8BFFFFF4
      E5FFFFF2E3FFFFF1E1FFFFEFDEFFFFEEDCFFFFECDAFF8B8B8BFFD1FFFFFFCEFF
      FFFFCAFEFFFFC5FDFFFFC1FCFFFFBCFBFFFF8B8B8BFFFFFFFFFFA1A1A1FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF7979
      79FFB0DEFFFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFFF5FFFFFFF3FFFFFF
      F2FFFFFEF1FFFFFEF0FFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FF8B8B
      8BFFE0E6E6FFE4EAEAFFE1E5E4FF006C00FFF2F5F5FFF6F8F8FF191919FFFFF1
      DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9
      CEFFFFE8CDFFFFE7CCFFFFE6CAFF191919FF8B8B8BFFFFFFF5FFFFFFF3FFFFFF
      F2FFFFFEF1FFFFFEF0FFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFB1B9
      BFFFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1
      DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9
      CEFFFFE8CDFFFFE7CCFFFFE6CAFF191919FF8B8B8BFFFFFFF5FFFFFFF3FFFFFF
      F2FFFFFEF1FFFFFEF0FFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFB1B9
      BFFFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1
      DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEAD0FFFFE9
      CEFFFFE8CDFFFFE7CCFFFFE6CAFF191919FFFFFFFF00FFFFFF008B8B8BFFFFF6
      E9FFFFF5E7FFFFF3E5FFFFF2E2FFFFF0E0FFFFEFDEFF8B8B8BFFD7FFFFFFA1A1
      A1FF797979FF797979FF797979FF797979FF8B8B8BFFFFFFFFFFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFBDE7FFFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFFF6FFFFFFF5FFFFFF
      F3FFFFFFF2FFFFFEF1FFFFFEF0FFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFF8B8B
      8BFFDCE3E3FFE0E6E6FF00A900FF82DE8CFF006C00FFF2F5F5FF191919FFFFF2
      DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEA
      D0FFFFE9CEFFFFE8CDFFFFE7CCFF191919FF8B8B8BFFFFFFF6FFFFFFF5FFFFFF
      F3FFFFFFF2FFFFFEF1FFFFFEF0FFFFFDEEFF8B8B8BFF191919FF191919FF1919
      19FF191919FF191919FF191919FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2
      DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEA
      D0FFFFE9CEFFFFE8CDFFFFE7CCFF191919FF8B8B8BFFFFFFF6FFFFFFF5FFFFFF
      F3FFFFFFF2FFFFFEF1FFFFFEF0FFFFFDEEFF8B8B8BFF191919FF191919FF1919
      19FF191919FF191919FF191919FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2
      DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEBD1FFFFEA
      D0FFFFE9CEFFFFE8CDFFFFE7CCFF191919FFFFFFFF00FFFFFF008B8B8BFFFFF8
      EDFFFFF7EBFFFFF6E8FFFFF4E6FFFFF3E4FFFFF1E2FF8B8B8BFFDDFFFFFFA1A1
      A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF8B8B8BFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFAFFFFFFF4FFFFFFEEFFFFFFE7FFFFFFE0FFFFFFD9FBFFFFD1F6
      FFFFCAF0FFFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFFF7FFFFFFF6FFFFFF
      F5FFFFFFF3FFFFFFF2FFFFFEF1FFFFFEF0FFFFFDEEFFFFFCEDFFFFFBEBFF8B8B
      8BFFD8E0E0FFDCE3E3FF00A900FF8DE196FF7FDD89FF006C00FF191919FFFFF3
      DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEB
      D1FFFFEAD0FFFFE9CEFFFFE8CDFF191919FF8B8B8BFFFFFFF7FFFFFFF6FFFFFF
      F5FFFFFFF3FFFFFFF2FFFFFEF1FFFFFEF0FF8B8B8BFFEAEAEAFFEDEDEDFFF1F1
      F1FFF5F5F5FFF8F8F8FF191919FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3
      DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEB
      D1FFFFEAD0FFFFE9CEFFFFE8CDFF191919FF8B8B8BFFFFFFF7FFFFFFF6FFFFFF
      F5FFFFFFF3FFFFFFF2FFFFFEF1FFFFFEF0FF8B8B8BFFEAEAEAFFEDEDEDFFF1F1
      F1FFF5F5F5FFF8F8F8FF191919FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3
      DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFECD3FFFFEB
      D1FFFFEAD0FFFFE9CEFFFFE8CDFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFB
      F0FFFFF9EEFFFFF8ECFFFFF7EAFFFFF5E8FFFFF4E6FF8B8B8BFFE2FFFFFFA1A1
      A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF8B8B8BFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFFFFFFF8FFFFFFF1FFFFFFEBFFFFFFE4FFFFFFDDFF
      FFFFD6F9FFFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFFF8FFFFFFF7FFFFFF
      F6FFFFFFF5FFFFFFF3FFFFFFF2FFFFFEF1FFFFFEF0FFFFFDEEFFFFFCEDFF8B8B
      8BFFD5DEDEFFD8E0E0FF00A900FF99E4A1FF8AE093FF7BDC86FF006C00FFFFF4
      DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFEC
      D3FFFFEBD1FFFFEAD0FFFFE9CEFF191919FF8B8B8BFFFFFFF8FFFFFFF7FFFFFF
      F6FFFFFFF5FFFFFFF3FFFFFFF2FFFFFEF1FF8B8B8BFFE6E6E6FFEAEAEAFFEDED
      EDFFF1F1F1FFF5F5F5FF191919FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4
      DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFEC
      D3FFFFEBD1FFFFEAD0FFFFE9CEFF191919FF8B8B8BFFFFFFF8FFFFFFF7FFFFFF
      F6FFFFFFF5FFFFFFF3FFFFFFF2FFFFFEF1FF8B8B8BFFE6E6E6FFEAEAEAFFEDED
      EDFFF1F1F1FFF5F5F5FF191919FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4
      DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFEDD5FFFFEC
      D3FFFFEBD1FFFFEAD0FFFFE9CEFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFD
      F3FFA1A1A1FF797979FF797979FF797979FF797979FF8B8B8BFFE6FFFFFFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FF8B8B8BFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFF5FFFFFFEFFFFFFFE8FF
      FFFFE1FFFFFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFFF9FFFFFFF8FFFFFF
      F7FFFFFFF6FFFFFFF5FFFFFFF3FFFFFFF2FFFFFEF1FFFFFEF0FFFFFDEEFF8B8B
      8BFFD3DCDCFF00A900FFB1EBB7FFA4E7ABFF95E39EFF87DF90FF78DB83FF006C
      00FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFED
      D5FFFFECD3FFFFEBD1FFFFEAD0FF191919FF8B8B8BFFFFFFF9FFFFFFF8FFFFFF
      F7FFB1B9BFFFFFFFF5FFB1B9BFFFFFFFF2FF8B8B8BFFE3E3E3FFE6E6E6FFEAEA
      EAFFEDEDEDFFF1F1F1FF191919FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5
      E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFED
      D5FFFFECD3FFFFEBD1FFFFEAD0FF191919FF8B8B8BFFFFFFF9FFFFFFF8FFFFFF
      F7FFB1B9BFFFFFFFF5FFB1B9BFFFFFFFF2FF8B8B8BFFE3E3E3FFE6E6E6FFEAEA
      EAFFEDEDEDFFF1F1F1FF191919FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5E3FFFFF5
      E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEED6FFFFED
      D5FFFFECD3FFFFEBD1FFFFEAD0FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFF
      F7FFA1A1A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF8B8B8BFFEAFFFFFFE8FF
      FFFFE6FFFFFFE3FFFFFFE0FFFFFFDDFFFFFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFFFFFFFF00FFFFFF008B8B8BFFFFFFFAFFFFFFF9FFFFFF
      F8FFFFFFF7FFFFFFF6FFFFFFF5FFFFFFF3FFFFFFF2FFFFFEF1FFFFFEF0FF8B8B
      8BFF8B8B8BFF00A900FFBBEDC0FF00A900FF00A900FF00A900FF84DE8DFF75DA
      80FF006C00FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEE
      D6FFFFEDD5FFFFECD3FFFFEBD1FF191919FF8B8B8BFFFFFFFAFFFFFFF9FFFFFF
      F8FFFFFFF7FFFFFFF6FFFFFFF5FFFFFFF3FF8B8B8BFFE0E0E0FFE3E3E3FFE6E6
      E6FFEAEAEAFFEDEDEDFF191919FFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5
      E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEE
      D6FFFFEDD5FFFFECD3FFFFEBD1FF191919FF8B8B8BFFFFFFFAFFFFFFF9FFFFFF
      F8FFFFFFF7FFFFFFF6FFFFFFF5FFFFFFF3FF8B8B8BFFE0E0E0FFE3E3E3FFE6E6
      E6FFEAEAEAFFEDEDEDFF191919FFFFF9E9FFFFF8E7FFFFF7E6FFFFF6E4FFFFF5
      E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEFD8FFFFEE
      D6FFFFEDD5FFFFECD3FFFFEBD1FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFF
      F9FFA1A1A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF8B8B8BFFEBFFFFFFEBFF
      FFFFEAFFFFFFE7FFFFFFE5FFFFFFE2FFFFFFDFFFFFFFDCFFFFFFD9FFFFFFD6FF
      FFFFD2FFFFFFCEFFFFFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFFFFFFBFFFFFFFAFFFFFF
      F9FFFFFFF8FFFFFFF7FFFFFFF6FFFFFFF5FFFFFFF3FFFFFFF2FFFFFEF1FFFFFE
      F0FF00A900FFCEF2D2FF00A900FFFFFAEAFFFDF8E8FF00A900FF00A900FF80DE
      8AFF72DA7DFF006C00FFF9F0DCFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEF
      D8FFFFEED6FFFFEDD5FFFFECD3FF191919FF8B8B8BFFFFFFFBFFFFFFFAFFFFFF
      F9FFFFFFF8FFFFFFF7FFFFFFF6FFFFFFF5FF8B8B8BFFDEDEDEFFE0E0E0FFE3E3
      E3FFE6E6E6FFEAEAEAFF191919FFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6
      E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEF
      D8FFFFEED6FFFFEDD5FFFFECD3FF191919FF8B8B8BFFFFFFFBFFFFFFFAFFFFFF
      F9FFFFFFF8FFFFFFF7FFFFFFF6FFFFFFF5FF8B8B8BFFDEDEDEFFE0E0E0FFE3E3
      E3FFE6E6E6FFEAEAEAFF191919FFFFFAEAFFFFF9E9FFFFF8E7FFFFF7E6FFFFF6
      E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0D9FFFFEF
      D8FFFFEED6FFFFEDD5FFFFECD3FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFF
      FCFFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FF8B8B8BFFEBFFFFFFEBFF
      FFFFEBFFFFFFEBFFFFFFE9FFFFFFE7FFFFFFE4FFFFFFE1FFFFFFDFFFFFFFDBFF
      FFFFD8FFFFFFD5FFFFFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFFFFFFCFFFFFFFBFFFFFF
      FAFFFFFFF9FFFFFFF8FFFFFFF7FFFFFFF6FFFFFFF5FFFFFFF3FFFFFFF2FFFFFE
      F1FF00A900FF00A900FFFEFBEDFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FF00A9
      00FF7DDD87FF6FD97AFF006C00FFFCF2DEFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0
      D9FFFFEFD8FFFFEED6FFFFEDD5FF191919FF8B8B8BFFFFFFFCFFFFFFFBFFFFFF
      FAFFFFFFF9FFFFFFF8FFFFFFF7FFFFFFF6FF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7
      E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0
      D9FFFFEFD8FFFFEED6FFFFEDD5FF191919FF8B8B8BFFFFFFFCFFFFFFFBFFFFFF
      FAFFFFFFF9FFFFFFF8FFFFFFF7FFFFFFF6FF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFFBEBFFFFFAEAFFFFF9E9FFFFF8E7FFFFF7
      E6FFFFF6E4FFFFF5E3FFFFF5E1FFFFF4DFFFFFF3DEFFFFF2DCFFFFF1DBFFFFF0
      D9FFFFEFD8FFFFEED6FFFFEDD5FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFF
      FEFFFFFFFDFFFFFFFBFFFFFFFAFFFFFFF9FFFFFFF7FF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFFFFFFCFFFFFFFCFFFFFF
      FBFFFFFFFAFFFFFFF9FFFFFFF8FFFFFFF7FFFFFFF6FFFFFFF5FFFFFFF3FFFFFF
      F2FF00A900FFFEFDEFFFFFFDEEFFFFFCEDFFFFFBEBFFFFFAEAFFFFF9E9FFFEF8
      E7FF00A900FF00A900FF6BD877FF006C00FFFAF1DEFFFFF3DEFFFFF2DCFFFFF1
      DBFFFFF0D9FFFFEFD8FFFFEED6FF191919FF8B8B8BFFD8CFB6FFD8CFB6FFD8CF
      B6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CF
      B6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CF
      B6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CF
      B6FFD8CFB6FFD8CFB6FFD8CFB6FF191919FF8B8B8BFFD8CFB6FFD8CFB6FFD8CF
      B6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CF
      B6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CF
      B6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CFB6FFD8CF
      B6FFD8CFB6FFD8CFB6FFD8CFB6FF191919FFFFFFFF00FFFFFF008B8B8BFFFFFF
      FEFFFFFFFEFFFFFFFDFFFFFFFCFFFFFFFBFFFFFFFAFFFFFFF8FFFFFFF7FFFFFE
      F5FFFFFDF3FFFFFCF1FFFFFAEFFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF00A900FF68D774FF006C00FF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF191919FF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF191919FF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF191919FFFFFFFF00FFFFFF008B8B8BFFFFFF
      FEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFDFFFFFFFCFFFFFFFBFFFFFFF9FFFFFF
      F8FFFFFFF6FFFFFEF5FFFFFDF3FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFDEDEDEFFDEDEDEFFDEDE
      DEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDE
      DEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDE
      DEFFDEDEDEFFDEDEDEFFD8DDD7FF00A900FF65D671FF006C00FFDEDEDEFFDEDE
      DEFF8B8B8BFFDEDEDEFFDEDEDEFF191919FF8B8B8BFFDEDEDEFFDEDEDEFFDEDE
      DEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDE
      DEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDE
      DEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDE
      DEFF8B8B8BFFDEDEDEFFDEDEDEFF191919FF8B8B8BFFDEDEDEFFDEDEDEFFDEDE
      DEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDE
      DEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDE
      DEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDE
      DEFF8B8B8BFFDEDEDEFFDEDEDEFF191919FFFFFFFF00FFFFFF008B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFEAE9EAFFEAE9EAFFEAE9
      EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9
      EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9
      EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFF00A900FF00A900FFEAE9EAFFDEDE
      DEFF8B8B8BFFEAE9EAFFEAE9EAFF191919FF8B8B8BFFEAE9EAFFEAE9EAFFEAE9
      EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9
      EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9
      EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFDEDE
      DEFF8B8B8BFFEAE9EAFFEAE9EAFF191919FF8B8B8BFFEAE9EAFFEAE9EAFFEAE9
      EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9
      EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9
      EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFDEDE
      DEFF8B8B8BFFEAE9EAFFEAE9EAFF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFFF5F5F6FFF5F5F6FFF5F5
      F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5
      F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5
      F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFEAE9
      EAFF8B8B8BFFF5F5F6FFF5F5F6FF191919FF8B8B8BFFF5F5F6FFF5F5F6FFF5F5
      F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5
      F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5
      F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFEAE9
      EAFF8B8B8BFFF5F5F6FFF5F5F6FF191919FF8B8B8BFFF5F5F6FFF5F5F6FFF5F5
      F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5
      F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5
      F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFF5F5F6FFEAE9
      EAFF8B8B8BFFF5F5F6FFF5F5F6FF191919FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D7BA9FF1552
      8DFF15528DFF15528DFF15528DFF15528DFF15528DFF03315EFF03315EFF0331
      5EFF03315EFF03315EFF03315EFF03315EFF03315EFF03315EFF03315EFF0331
      5EFF03315EFF03315EFF03315EFF03315EFF03315EFF03315EFF03315EFF0331
      5EFF03315EFF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FF353636FF3A3A
      3AFF3A3A3AFF383939FF383939FF383939FF383939FF383839FF383939FF3939
      39FF39393AFF353535FF424242FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D7BA9FF7D9E
      BDFF799BBBFF7698B9FF7295B7FF6F93B5FF6B90B3FF678EB2FF658BB0FF6289
      AFFF5F87ADFF5C85ACFF5A83ABFF5882AAFF5680A9FF557FA8FF557FA8FF557F
      A8FF557FA8FF557FA8FF4876A2FF2B6093FF2B6093FF2B6093FF2B6093FF2B60
      93FF2B6093FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBFFF323131FF333333FF3736
      37FF373534FF373533FF393636FF393632FF373532FF373633FF363433FF3431
      2FFF302F2DFF2D2A2DFF2F2B2BFFB5B5B5FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D7BA9FF628A
      AFFFB4DBEFFF7DB5D4FF7DB5D4FF7DB5D4FF7DB5D4FF4991B9FF4991B9FF4991
      B9FF4991B9FF4991B9FF4991B9FF4991B9FF4991B9FF4991B9FF4991B9FF4991
      B9FF4991B9FF4991B9FF4991B9FF4991B9FF4991B9FF4991B9FF4991B9FF4991
      B9FF2B6093FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00747475FF615C5BFF87807CFF7E77
      71FF8D8586FF867D7EFF7F7975FF7B7571FF79736FFF736D6AFF68615DFF8078
      79FF807878FF79716CFF605852FF787778FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D7BA9FF678D
      B2FFCDF1FFFFCBF0FFFFCAEFFFFFC8EFFFFFC5EEFEFFC4EDFEFFC3EDFEFFC1EC
      FDFFC0ECFDFFBFEBFDFFB2DDF0FF9AC8E0FFBCEAFCFFBCEAFCFFBCEAFCFFBCEA
      FCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFF4991
      B9FF2B6092FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF676260FF8C8884FF7B76
      72FF989391FF888080FF7F7977FF7C7672FF7B7470FF746E6BFF605B56FF8983
      80FF817878FF77716FFF5F5956FF686868FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D7BA9FF6C91
      B5FFCFF2FFFFCDF1FFFFCCF0FFFFCAEFFFFFC8EFFFFFC7EEFEFFC4EDFEFFC3ED
      FEFFC2ECFEFFC0ECFDFFB3DDF1FF8BBEDAFFBDEAFDFFBCEAFCFFBCEAFCFFBCEA
      FCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFF4991
      B9FF2B6092FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006D6D6DFF767272FF96918EFF7F79
      75FF6F6A66FF736E69FF7A7572FF7D7774FF7E7875FF78726FFF69635EFF5F5A
      56FF68615CFF716B67FF645B55FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7C7C7FF515151FF5151
      51FF515151FF515151FFC7C7C7FFFFFFFF00FFFFFF00C7C7C7FF515151FF5151
      51FF515151FF515151FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C7C7C7FF515151FF515151FF515151FF515151FF515151FFC7C7
      C7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7C7C7FF515151FF5151
      51FF515151FF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FFC7C7C7FFFFFFFF00C7C7C7FF515151FF515151FF515151FF515151FFC7C7
      C7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7C7C7FF515151FF5151
      51FF515151FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF7295
      B7FFD1F2FFFFCFF2FFFFCEF1FFFFCCF0FFFFCAEFFFFFC9EFFFFFC7EEFFFFC5ED
      FEFFC3EDFEFFC2ECFEFFB3DDF1FF9AC8E0FFBEEBFDFFBEEAFDFFBDEAFCFFBCEA
      FCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFFBCEAFCFF4991
      B9FF2B6092FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373FF7C7978FF979291FF8781
      80FF7C7977FF7E7A79FF837E7CFF817C7BFF847E7BFF7F7A77FF726D69FF6B67
      65FF6C6764FF6E6865FF564E4CFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFECB68DFFEBB3
      89FFEAB186FFE9AF82FF515151FFFFFFFF00FFFFFF00515151FFE5A472FFE4A2
      6FFFE4A06CFFE39F6AFFE39D68FF515151FFFFFFFF00FFFFFF00FFFFFF00C7C7
      C7FF515151FF515151FFE8AC7FFFE7AA7BFFE7A878FFE6A675FFE5A472FF5151
      51FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00515151FFEEB385FFEEB1
      82FFEDAF7FFFECAD7CFFECAB7AFFEBA977FFEAA874FFEAA672FFE9A570FFE9A3
      6EFF515151FFFFFFFF00515151FFF5C5A1FFF4C39DFFF3C09AFFF2BE96FF5151
      51FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00C7C7C7FF515151FFECAB7AFFEBAA
      77FFEAA875FFEAA672FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF7799
      BAFFD3F3FFFF96C3D6FF96C3D6FF96C3D6FF95C2D6FF95C2D6FF95C2D6FF95C2
      D6FF94C2D6FFC4EDFEFFB4DEF1FF8BBEDAFFC0EBFDFF93C1D6FF93C1D6FF93C1
      D6FF93C1D6FF93C1D6FF93C1D6FF93C1D6FFBCEAFCFFBCEAFCFFBCEAFCFF4991
      B9FF2B6093FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF4C4949FF5F5A5CFF6560
      61FF625C5DFF696464FF7E7577FF716668FF686163FF50494BFF3B3434FF362F
      2EFF322A2AFF2E2627FF251F20FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFEDB992FFECB7
      8EFFEBB48BFFEAB287FF515151FFFFFFFF00C7C7C7FF515151FFE6A776FFE5A5
      73FFE5A370FFE4A16DFF515151FFC7C7C7FFFFFFFF00FFFFFF00C7C7C7FF5151
      51FFEBB58BFFEAB287FFE9B084FFE8AD80FFE8AB7CFFE7A979FFE6A676FFE5A4
      73FFE5A270FF515151FFC7C7C7FFFFFFFF00FFFFFF00515151FFF0B68BFFEFB4
      88FFEEB284FFEDB081FFEDAE7FFFECAC7CFFEBAB79FFEBA976FFEAA774FFEAA6
      72FF515151FFFFFFFF00515151FFF6C9A6FFF5C7A2FFF4C39EFFF3C19AFF5151
      51FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFEDB081FFEDAE7EFFECAC
      7BFFEBAA78FFEBA875FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF7C9D
      BDFFD5F4FFFF97C3D6FF96C3D6FF96C3D6FF96C3D6FF96C2D6FF95C2D6FF95C2
      D6FF95C2D6FF94C2D6FFB5DEF1FF9AC8E0FFC1ECFDFF93C1D6FF93C1D6FF93C1
      D6FF93C1D6FF93C1D6FF93C1D6FF93C1D6FF93C1D6FFBCEAFCFFBCEAFCFF4991
      B9FF2B6093FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00696969FF575353FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFA4A2A3FFA09D9EFF9B999AFF9C99
      9AFF9A9798FFBDBABBFF625D5EFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFEEBD98FFEDBA
      94FFECB890FFEBB58CFF515151FFC7C7C7FF515151FFE8AC7EFFE7A97AFFE6A7
      77FFE6A574FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00515151FFEDBA
      94FFECB890FFEBB58CFFEAB388FFEAB085FFE9AE81FFE8AC7DFFE7A97AFFE6A7
      77FFE6A574FFE5A371FF515151FFFFFFFF00FFFFFF00515151FFF1BA91FFF0B8
      8DFFEFB68AFFEFB487FFEEB284FFEDB081FFEDAE7EFFECAC7BFFEBAA79FFEBA9
      76FF515151FFFFFFFF00515151FFF7CCAAFFF6CAA6FFF5C7A3FFF4C49FFF5151
      51FFFFFFFF00FFFFFF00FFFFFF00C7C7C7FF515151FFEEB385FFEEB082FFEDAE
      7FFFECAC7BFFEBAA79FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF81A0
      BFFFD7F5FFFF97C3D6FF97C3D6FF97C3D6FF96C3D6FF96C3D6FF96C2D6FF95C2
      D6FF95C2D6FF95C2D6FFB6DEF1FF8BBEDAFFC3EDFEFF94C2D6FF93C2D6FF93C1
      D6FF93C1D6FF93C1D6FF93C1D6FF93C1D6FF93C1D6FFBCEAFCFFBCEAFCFF4991
      B9FF2B6093FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C797AFF868483FF1412
      11FF1C1A19FF1B1919FF1B1818FF1B1919FF1B1A1AFF1C1A17FF1A1919FF1C1B
      1BFF181717FF616161FF8C8A8AFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFEFC09DFFEFBE
      99FFEEBB95FFEDB991FF515151FF515151FFEAB186FFE9AF83FFE8AD7FFFE7AA
      7CFFE7A878FF515151FFFFFFFF00FFFFFF00FFFFFF00C7C7C7FF515151FFEEBE
      99FFEEBB95FFEDB991FFECB68DFFEBB389FFEAB186FFE9AF82FFE8AC7EFFE7AA
      7BFFE7A878FFE6A675FF515151FFC7C7C7FFFFFFFF00515151FFF3BE97FFF2BC
      93FFF1BA90FFF0B88DFFEFB689FFEFB386FFEEB183FFEDAF80FFECAE7DFFECAC
      7BFF515151FFFFFFFF00515151FFF8CFAFFFF7CDABFFF6CAA7FFF6C8A3FF5151
      51FFFFFFFF00FFFFFF00FFFFFF00515151FFF0B88DFFEFB589FFEEB386FFEEB1
      82FFEDAF7FFFECAD7CFF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF86A4
      C2FFD9F6FFFF98C3D6FF97C3D6FF97C3D6FF97C3D6FF96C3D6FF96C3D6FF96C3
      D6FFCCF0FFFFCAEFFFFFB7DFF2FF9AC8E0FFC4EDFEFF94C2D6FF94C2D6FF93C2
      D6FF93C1D6FF93C1D6FF93C1D6FF93C1D6FF93C1D6FF93C1D6FFBCEAFCFF4991
      B9FF2B6093FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF7C7979FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFF4F2
      F2FFE9E8E8FFE1DFDFFF878384FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFF1C4A2FFF0C2
      9FFFEFBF9BFFEEBC97FF515151FFECB78FFFEBB58BFFEAB288FFE9B084FFE9AD
      80FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00515151FFF1C4A2FFF0C1
      9EFFEFBF9AFFEEBC96FFEDB992FF515151FF515151FF515151FFE9AF83FFE8AD
      7FFFE8AB7CFFE7A879FFE6A675FF515151FFFFFFFF00515151FFF4C29DFFF3C0
      9AFFF2BE96FFF2BC93FF515151FF515151FF515151FF515151FF515151FF5151
      51FFC7C7C7FFFFFFFF00515151FFF9D2B3FFF8D0B0FFF8CDACFFF7CBA8FF5151
      51FFFFFFFF00FFFFFF00C7C7C7FF515151FFF1BB91FFF0B88DFFEFB68AFFEFB4
      86FFEEB183FFEDAF80FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF8BA8
      C4FFF4FEFFFFDAF6FFFFD8F6FFFFD6F5FFFFD5F4FFFFD3F3FFFFD1F2FFFFCFF2
      FFFFCEF1FFFFCCF0FFFFB7DFF2FF8BBEDAFFC7EEFFFFC5EEFEFFC3EDFEFFC2EC
      FEFFC1ECFDFFC0EBFDFFBFEBFDFFBEEAFDFFBDEAFCFFBCEAFCFFBCEAFCFF4991
      B9FF2B6093FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFF4F4F4FFE7E6E7FF918C8CFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFF2C9A8FFF1C5
      A4FFF0C2A0FFEFC09CFF515151FFEDBB94FFECB890FFECB68DFFEBB389FF5151
      51FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFF2C8A7FFF1C5
      A3FFF0C29FFFEFBF9BFF515151FFC7C7C7FFFFFFFF00C7C7C7FF515151FFE9B0
      84FFE9AE80FFE8AB7DFFE7A97AFF515151FFFFFFFF00515151FFF5C8A3FFF5C4
      A0FFF4C29CFFF3C099FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00515151FFFAD5B8FFF9D3B4FFF9D0B0FFF8CEACFF5151
      51FFFFFFFF00C7C7C7FF515151FFF3C099FFF2BE96FFF1BB92FFF0B98EFFF0B6
      8BFFEFB487FFEEB284FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF8FAB
      C8FFF4FEFFFF98C4D6FF98C4D6FF98C3D6FF97C3D6FF97C3D6FF97C3D6FF96C3
      D6FF96C3D6FF96C3D6FFB7DFF2FF9AC8E0FFC9EFFFFF95C2D6FF94C2D6FF94C2
      D6FF94C2D6FF94C2D6FF93C1D6FF93C1D6FF93C1D6FFBDEAFDFFBCEAFCFF4991
      B9FF2B6093FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF807B7BFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FF948E8FFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFF3CCADFFF2CA
      A9FFF1C7A5FFF1C3A2FFF0C19EFFEFBE9AFFEEBC96FFEDB992FFECB78EFF5151
      51FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00515151FFF3CCACFFF2C9
      A8FFF1C5A4FFF0C3A0FF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFEBB3
      89FFEAB185FFE9AE81FFE8AC7EFF515151FFFFFFFF00515151FFF7CCAAFFF6CA
      A6FFF5C7A3FFF4C49FFF515151FF515151FF515151FF515151FF515151FF5151
      51FFC7C7C7FFFFFFFF00515151FFFBD8BCFFFBD6B8FFFAD3B5FFF9D1B1FF5151
      51FFFFFFFF00515151FFF5C7A2FFF4C39EFFF3C19AFFF2BE96FFF1BC93FFF1B9
      8FFFF0B78BFFEFB488FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF94AF
      CAFFF4FEFFFF99C4D6FF98C4D6FF98C4D6FF98C3D6FF98C3D6FF97C3D6FF97C3
      D6FF97C3D6FF96C3D6FFB7DFF2FF8BBEDAFFCBF0FFFF95C2D6FF95C2D6FF94C2
      D6FF94C2D6FF94C2D6FF94C2D6FF93C2D6FF93C1D6FF93C1D6FFBDEAFDFF4991
      B9FF2C6193FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF827C7DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFF5D0B2FFF4CD
      AFFFF3CBABFFF2C8A7FFF1C4A3FFF0C29FFFEFBF9BFFEEBD97FFEDBA93FFECB8
      90FFEBB58CFF515151FFC7C7C7FFFFFFFF00FFFFFF00515151FFF4CFB1FFF3CC
      ADFFF2CAA9FFF1C7A6FF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFECB6
      8EFFEBB48AFFEAB186FFE9AF82FF515151FFFFFFFF00515151FFF8D0B0FFF8CE
      ACFFF7CBA9FFF6C9A5FFF5C7A2FFF4C39EFFF4C19BFFF3BF97FFF2BD94FFF1BA
      91FF515151FFFFFFFF00515151FFFCDBC0FFFCD9BDFFFBD6B9FFFAD4B5FF5151
      51FFC7C7C7FF515151FFF6CAA6FFF5C7A2FFF4C49FFF515151FFF3BE97FFF2BC
      93FFF1BA90FFF0B78CFF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF98B2
      CCFFF4FEFFFFE0F9FFFF99C4D6FF99C4D6FF98C4D6FF98C3D6FF98C3D6FF97C3
      D6FF97C3D6FFD2F3FFFFB7DFF2FF9AC8E0FFCDF1FFFF95C2D6FF95C2D6FF95C2
      D6FF94C2D6FF94C2D6FF94C2D6FF94C2D6FF93C2D6FFBFEBFDFFBEEBFDFF4991
      B9FF2E6395FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFF6D3B7FFF5D1
      B4FFF4CEB0FFF3CCACFFF2C9A8FFF1C5A5FFF0C3A1FFEFC09DFFEEBE99FFEDBB
      95FFEDB991FFECB68DFF515151FFC7C7C7FFFFFFFF00515151FFF5D2B6FFF5D0
      B2FFF4CDAEFFF3CBABFF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFEDBA
      93FFECB78FFFEBB58BFFEAB287FF515151FFFFFFFF00515151FFFAD4B6FFF9D2
      B3FFF8D0AFFFF8CDACFFF7CBA8FFF6C9A5FFF5C5A1FFF4C39EFFF3C19AFFF3BE
      97FF515151FFFFFFFF00515151FFFDDEC4FFFDDBC1FFFCD9BDFFFBD7BAFF5151
      51FF515151FFF8CFAFFFF7CDABFFF6CAA7FFF5C8A3FF515151FFF4C19BFFF3BF
      98FFF2BC94FFF1BA90FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FF9CB5
      CEFFF4FEFFFF9AC4D6FFE0F9FFFFDFF8FFFFDDF8FFFFDBF7FFFFDAF6FFFFD8F5
      FFFFD6F5FFFFD4F4FFFFBEE2F3FF8BBEDAFFCFF2FFFF96C3D6FF95C2D6FF95C2
      D6FF95C2D6FF94C2D6FF94C2D6FF94C2D6FF94C2D6FFC1ECFDFFBFEBFDFF4991
      B9FF316596FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666FF83807FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817D7EFF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFF7D6BCFFF6D4
      B9FFF5D2B5FFF4CFB2FF515151FF515151FF515151FF515151FFF0C19EFFEFBF
      9AFFEEBC96FFEDBA93FFECB78FFF515151FFFFFFFF00515151FFF7D5BBFFF6D3
      B7FFF5D0B3FFF4CEB0FF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFEEBD
      98FFEDBA94FFECB890FFEBB58CFF515151FFFFFFFF00515151FFFBD8BCFFFBD6
      B9FFFAD4B5FFF9D1B2FFF8CFAEFFF7CDABFFF6CAA7FFF6C8A4FFF5C5A0FFF4C2
      9DFF515151FFFFFFFF00515151FFFEE0C9FFFEDEC5FFFDDCC2FFFCD9BEFF5151
      51FFFAD5B7FFF9D2B3FFF8D0AFFFF7CDABFF515151FF515151FFF5C4A0FFF4C2
      9CFFF3BF98FFF2BD95FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFA0B8
      D0FFF4FEFFFFE4FBFFFFE2FAFFFFE1F9FFFFDFF9FFFFDDF8FFFFDCF7FFFFDAF6
      FFFFD8F6FFFFD6F5FFFFCCECFBFF9AC8E0FFD1F3FFFF96C3D6FF96C3D6FF95C2
      D6FF95C2D6FF95C2D6FFC7EEFFFFC5EEFEFFC3EDFEFFC2ECFEFFC1ECFDFF4991
      B9FF346798FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00686868FF7E7978FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF7A7676FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFF8DAC1FFF7D7
      BEFFF6D5BAFFF6D3B7FF515151FFFFFFFF00FFFFFF00C7C7C7FF515151FFF0C2
      A0FFEFC09CFFEEBD98FFEDBB94FF515151FFFFFFFF00515151FFF8D8BFFFF7D6
      BCFFF6D4B8FFF5D1B5FF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFEFC0
      9DFFEEBE99FFEEBB95FFEDB991FF515151FFFFFFFF00515151FFFDDCC2FFFCDA
      BFFFFBD8BBFFFAD5B8FFFAD3B5FFF9D1B1FFF8CFAEFFF7CCAAFFF6CAA7FFF5C8
      A3FF515151FFFFFFFF00515151FFFFE3CDFFFEE1CAFFFEDFC7FFFDDCC2FF5151
      51FFFBD8BBFFFAD5B8FFF9D3B4FF515151FFC7C7C7FF515151FFF6C9A5FFF5C5
      A1FFF4C29DFFF3C099FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFA4BB
      D2FFF4FEFFFF9AC4D6FF9AC4D6FF9AC4D6FF99C4D6FF99C4D6FF99C4D6FF98C4
      D6FF98C4D6FFD9F6FFFFCCECFBFF93C3DDFFD3F3FFFFD2F3FFFFD0F2FFFFCEF1
      FFFFCCF0FFFFCBF0FFFFC9EFFFFFC8EEFFFFC5EEFEFFC4EDFEFFC2ECFEFF4991
      B9FF376999FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006C6C6CFF837F7FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFF9DDC7FFF8DA
      C2FFF8D8BFFFF7D6BCFF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFF1C7
      A5FFF0C3A1FFF0C19DFFEFBE99FF515151FFFFFFFF00515151FFF9DBC4FFF8D9
      C0FFF7D7BDFFF6D4B9FF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFF1C4
      A2FFF0C19EFFEFBF9AFFEEBC96FF515151FFFFFFFF00515151FFFEE0C8FFFDDE
      C4FFFDDBC1FFFCD9BEFF515151FF515151FF515151FF515151FF515151FF5151
      51FFC7C7C7FFFFFFFF00515151FFFFE5D1FFFFE3CEFFFFE1CBFFFEDFC7FFFDDD
      C3FFFCDABFFFFBD8BCFFFAD6B8FF515151FFFFFFFF00515151FFF7CCA9FFF6C9
      A5FFF5C5A1FFF4C39EFF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFA7BD
      D4FFF4FEFFFF9BC5D6FF9AC5D6FF9AC4D6FF9AC4D6FF99C4D6FF99C4D6FF99C4
      D6FF98C4D6FF98C4D6FFCCECFBFF9AC8E0FFD5F4FFFF97C3D6FF97C3D6FF96C3
      D6FF96C3D6FF96C2D6FF95C2D6FF95C2D6FFC8EFFFFFC5EEFEFFC4EDFEFF4991
      B9FF3B6C9BFF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00727272FF8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF767372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFFADFCBFFF9DD
      C8FFF9DBC4FFF8D9C0FF515151FFFFFFFF00FFFFFF00C7C7C7FF515151FFF3CA
      AAFFF2C8A7FFF1C4A3FFF0C29FFF515151FFFFFFFF00515151FFFADEC9FFF9DC
      C5FFF8DAC1FFF7D7BEFF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFF2C8
      A7FFF1C5A3FFF0C29FFFEFBF9BFF515151FFFFFFFF00515151FFFFE3CEFFFFE1
      CBFFFEDFC8FFFDDDC4FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00515151FFFFE7D4FFFFE6D1FFFFE4CEFFFFE1CBFFFEDF
      C8FFFDDDC4FFFCDBC0FF515151FFC7C7C7FFFFFFFF00515151FFF8CFAEFFF7CC
      AAFFF6C9A6FFF5C7A2FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFAABF
      D6FFF4FEFFFF9BC5D6FF9BC5D6FFE6FCFFFFE5FBFFFFE3FAFFFFE2FAFFFFE0F9
      FFFFDEF8FFFFDDF8FFFFCCECFBFF93C3DEFFD8F5FFFF97C3D6FF97C3D6FF97C3
      D6FF96C3D6FF96C3D6FF96C2D6FF95C2D6FF95C2D6FF95C2D6FFC7EEFEFF4991
      B9FF3F6F9DFF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF777272FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFFBE2CFFFFAE0
      CCFFFADEC9FFF9DCC5FF515151FF515151FF515151FF515151FFF5D0B4FFF4CE
      B0FFF3CBACFFF2C9A8FFF1C5A4FF515151FFFFFFFF00515151FFFBE1CDFFFADF
      CAFFF9DDC7FFF8DAC2FF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFF3CC
      ACFFF2C9A8FFF1C5A4FFF0C3A0FF515151FFFFFFFF00515151FFFFE6D2FFFFE5
      D0FFFFE3CDFFFFE1CAFF515151FF515151FF515151FF515151FF515151FF5151
      51FFC7C7C7FFFFFFFF00515151FFFFE9D7FFFFE8D5FFFFE6D2FFFFE4CFFFFFE2
      CCFFFEE0C9FF515151FFC7C7C7FFFFFFFF00FFFFFF00515151FFF9D2B2FFF8CF
      AEFFF7CDABFFF6CAA7FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFADC1
      D7FFF4FEFFFFEAFDFFFFE9FDFFFFE8FCFFFFE6FCFFFFE5FBFFFFE4FBFFFFE2FA
      FFFFE0F9FFFFDFF8FFFFCCECFBFF9AC8E0FFDAF6FFFF98C3D6FF97C3D6FF97C3
      D6FF97C3D6FF96C3D6FF96C3D6FF96C3D6FF95C2D6FFCAEFFFFFC9EFFFFF4991
      B9FF43729FFF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979FF9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFFCE4D3FFFBE3
      D0FFFBE1CDFFFADFCAFFF9DDC7FFF9DBC3FFF8D8C0FFF7D6BCFFF6D4B9FFF5D1
      B5FFF4CFB1FFF3CCADFFF2CAAAFF515151FFFFFFFF00515151FFFBE3D0FFFBE1
      CEFFFADFCBFFF9DDC8FF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFF4CF
      B1FFF3CCADFFF2CAA9FFF1C7A6FF515151FFFFFFFF00515151FFFFE9D7FFFFE8
      D4FFFFE6D2FFFFE4CFFFFFE2CCFFFEE0C9FFFEDEC5FFFDDCC2FFFCDABFFFFBD8
      BCFF515151FFFFFFFF00515151FFFFEBDAFFFFEAD8FFFFE8D5FFFFE6D2FFFFE4
      CFFFFFE2CCFF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFFAD5B7FFF9D2
      B3FFF8D0AFFFF7CDABFF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFAFC3
      D8FFF4FEFFFF9BC5D6FF9BC5D6FF9BC5D6FF9BC5D6FF9AC5D6FF9AC4D6FF9AC4
      D6FF9AC4D6FFE1F9FFFFCCECFBFF96C5DFFFDCF7FFFFDAF6FFFFD8F6FFFFD7F5
      FFFFD5F4FFFFD3F3FFFFD1F3FFFFD0F2FFFFCEF1FFFFCCF0FFFFCBF0FFFF7DB5
      D4FF4775A2FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00757575FF979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF777372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFFDE7D6FFFCE5
      D3FFFCE3D1FFFBE2CEFFFAE0CBFFFADEC8FFF9DCC4FFF8D9C1FFF7D7BEFFF6D5
      BAFFF5D2B6FFF5D0B3FF515151FFC7C7C7FFFFFFFF00515151FFFCE5D4FFFCE3
      D1FFFBE2CFFFFAE0CCFF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFF5D2
      B6FFF5D0B2FFF4CDAEFFF3CBABFF515151FFFFFFFF00515151FFFFECDBFFFFEA
      D9FFFFE9D6FFFFE7D4FFFFE6D1FFFFE4CFFFFFE2CCFFFEE0C9FFFEDEC5FFFDDC
      C2FF515151FFFFFFFF00515151FFFFEDDDFFFFECDBFFFFEAD8FFFFE8D6FFFFE7
      D3FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00515151FFFBD7BBFFFAD5
      B7FFF9D2B4FFF8D0B0FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFAFC3
      D8FFF4FEFFFF9CC5D6FF9BC5D6FF9BC5D6FFE9FDFFFFE8FDFFFFE7FCFFFFE6FB
      FFFFE4FBFFFFE3FAFFFFCCECFBFF9AC8E0FFDEF8FFFF98C3D6FF98C4D6FF98C3
      D6FFD7F5FFFFD5F4FFFF97C3D6FF96C3D6FF96C3D6FF96C3D6FFCDF1FFFF7DB5
      D4FF4C79A4FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00707070FF8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF777373FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFFDE8D9FFFDE7
      D7FFFCE6D4FFFCE4D2FFFBE2CFFFFBE0CDFFFADECAFFF9DCC5FFF8DAC2FFF8D8
      BFFFF7D6BBFF515151FFC7C7C7FFFFFFFF00FFFFFF00515151FFFDE7D7FFFCE6
      D4FFFCE4D2FFFBE2CFFF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFF7D5
      BBFFF6D3B7FFF5D0B3FFF4CEB0FF515151FFFFFFFF00515151FFFFEEDEFFFFED
      DCFFFFECDAFFFFEAD8FFFFE9D6FFFFE7D3FFFFE5D1FFFFE3CEFFFFE2CBFFFEE0
      C8FF515151FFFFFFFF00515151FFFFEFDFFFFFEDDDFFFFECDBFFFFEAD9FFFFE9
      D6FF515151FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFFCDABFFFFBD8
      BCFFFAD5B8FFFAD3B4FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFAFC3
      D8FFF4FEFFFF9CC5D6FF9CC5D6FF9BC5D6FF9BC5D6FF9BC5D6FFE9FDFFFFE7FC
      FFFFE6FCFFFFE4FBFFFFCCECFBFF96C5DFFFE0F9FFFF98C3D6FF99C4D6FF98C4
      D6FF98C3D6FF98C3D6FF97C3D6FF97C3D6FF97C3D6FF96C3D6FFCFF1FFFF7DB5
      D4FF517CA6FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171FF8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF787372FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFFEEADBFFFEE9
      D9FFFDE8D7FFFDE6D5FFFCE5D3FFFBE3D0FFFBE1CEFFFADFCBFFF9DDC8FF5151
      51FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00515151FFFEE9D9FFFDE8
      D7FFFDE6D5FFFCE4D3FF515151FFFFFFFF00FFFFFF00FFFFFF00515151FFF8D8
      BFFFF7D6BCFFF6D4B8FFF5D1B5FF515151FFFFFFFF00515151FFFFF0E1FFFFEF
      DFFFFFEEDEFFFFEDDCFFFFEBDAFFFFEAD8FFFFE8D5FFFFE7D3FFFFE5D0FFFFE3
      CEFF515151FFFFFFFF00515151FFFFF0E1FFFFEFDFFFFFEEDDFFFFECDBFF5151
      51FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00515151FFFDDDC3FFFCDB
      C0FFFBD8BCFFFBD6B9FF515151FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFAFC3
      D8FFF4FEFFFFEEFFFFFFEEFFFFFFEDFFFFFFECFEFFFFEBFEFFFFEAFDFFFFE9FD
      FFFFE8FCFFFFE6FCFFFFCCECFBFF9AC8E0FFE2FAFFFFDAF6FFFFDFF8FFFFDDF8
      FFFFDBF7FFFFD9F6FFFFD8F5FFFFD6F5FFFFD4F4FFFFD2F3FFFFD1F2FFFF7DB5
      D4FF5580A9FF03315EFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00787878FF8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64D31FFF2D2C5FF797371FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7C7C7FF515151FF5151
      51FF515151FF515151FF515151FF515151FF515151FF515151FF515151FFC7C7
      C7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7C7C7FF515151FF5151
      51FF515151FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00C7C7C7FF5151
      51FF515151FF515151FF515151FFC7C7C7FFFFFFFF00C7C7C7FF515151FF5151
      51FF515151FF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FFC7C7C7FFFFFFFF00C7C7C7FF515151FF515151FF515151FF515151FFC7C7
      C7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7C7C7FF515151FF5151
      51FF515151FF515151FFC7C7C7FFFFFFFF00FFFFFF00FFFFFF004D7BA9FFAFC3
      D8FFF4FEFFFFEEFFFFFFEEFFFFFFEEFFFFFFEDFFFFFFECFEFFFFEBFEFFFFEAFD
      FFFFE9FDFFFFE8FCFFFFCCECFBFFACD3E9FFE4FBFFFFDAF6FFFFE1F9FFFFDFF9
      FFFFDDF8FFFFDCF7FFFFDAF6FFFFD8F6FFFFD6F5FFFFD5F4FFFFD3F3FFFFD1F2
      FFFF5A84ABFF15528DFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868686FF989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF767273FF666666FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D7BA9FFAFC3
      D8FFF4FEFFFFF4FEFFFFF4FEFFFFF4FEFFFFF4FEFFFFF4FEFFFFF4FEFFFFF4FE
      FFFFF4FEFFFFF4FEFFFFF0FEFFFFC5E3F4FFF0FEFFFFF0FEFFFFDAF6FFFFDAF6
      FFFFDAF6FFFFDAF6FFFFC9E5F2FFC7E4F2FFC3E3F1FFC1E1F1FFBFE0F0FFBCDF
      F0FF5F87AEFF15528DFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00929292FF888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7E7E81FF78797BFF6E6F72FF696A
      6DFF5D5F61FF5A5A5CFF3D3737FF737272FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D7BA9FFAFC3
      D8FFAFC3D8FFAFC3D8FFAFC3D8FFAFC3D8FFAFC3D8FFAFC3D8FFAEC2D7FFABC0
      D6FFA9BED5FFA6BCD3FFA2BAD2FF9FB7D0FF9BB4CEFF97B1CCFF93AECAFF8FAB
      C8FF8BA8C4FF86A4C2FF81A1C0FF7D9DBDFF789ABBFF7396B8FF6E93B6FF698F
      B3FF658BB1FF15528DFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0B0B0FF797979FF828282FF6D6D
      6DFF636363FF666666FF5B5B5BFF4E4E4EFF4E4E4EFF4F4F4FFF474747FF4545
      45FF434343FF414141FF393939FFA6A6A6FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D7BA9FF4D7B
      A9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7B
      A9FF4D7BA9FF4D7BA9FF799DC0FF799DC0FF799DC0FF4D7BA9FF4D7BA9FF4D7B
      A9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7B
      A9FF4D7BA9FF4D7BA9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9FFF8C8C8CFF8080
      80FF7A7A7AFF7C7C7CFF7A7A7AFF767676FF767676FF787878FF767676FF7575
      75FF767676FF727272FF868686FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000080000000C00000000100010000000000000C00000000000000000000
      000000000000000000000000FFFFFF00FFFFE000FFFF8000FFFFF80100000000
      FFFFE000FFFF0000FFFFF00100000000FF800000FF800000FF80000100000000
      FF000000FF000000FF00000100000000FF000000FF000000FF00000100000000
      FF000000FF000000FF00000100000000FF000000FF000000FF00000100000000
      FF000000FF000000FF00000100000000FF000000FF000000FF00000100000000
      FF000001FF000000FF00000100000000FF000003FF000003FF00000100000000
      FF0000FFFF000003FF00000100000000FF0000FFFF00000FFF00000100000000
      FF0000FFFF0000FFFF00000700000000FF0000FFFF0000FFFF0000FF00000000
      FF0000FFFF0000FFFF0000FF00000000FF0000FFFF0000FFFF0000FF00000000
      FF0000FFFF0000FFFF0000FF00000000FF0000FFFF0000FFFF0000FF00000000
      FF0000FFFF0000FFFF0000FF00000000FF0000FFFF0000FFFF0000FF00000000
      FF0000FFFF0000FFFF0000FF00000000FF0000FFFF0000FFFF0000FF00000000
      FF0000FFFF0000FFFF0000FF00000000FF0000FFFF0000FFFF0000FF00000000
      FF0000FFFF0000FFFF0000FF00000000FF0000FFFF0000FFFF0000FF00000000
      FF0000FFFF0000FFFF0000FF00000000FF0000FFFF0000FFFF0000FF00000000
      FF8001FFFF8001FFFF8001FF00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFEFFFFFFFFFFFFFFFFFFFFFF800
      FFFFFFE080001FFF80001FFFFFFFF000FFFFFFE080000FFF80000FFFFF800000
      FFFF80E0800007FF800007FFFF000000FFFF80C0800003FF800003FFFF000000
      FFFF80C1800001FF800001FFFF000000FFFE00C1800000FF800000FFFF000000
      FFFE00C18000007F8000007FFF000000FFFE00C18000003F8000003FFF000000
      FFF800818000001F8000001FFF000000FFF800838000000F8000000FFF000003
      FFF800838000000780000007FF0000FFE3C000838000000380000003FF0000FF
      E0000303C0000001C0000001FF0000FFE0000307E0000001E0000001FF0000FF
      E0000307F0000001F0000001FF0000FFE0000F07F8000001F8000001FF0000FF
      E0000F07FC000001FC000001FF0000FFC0000E07FE000001FC000001FF0000FF
      8001FE0FFE000001FC000001FF0000FF0000FE0FFE000001F0000001FF0000FF
      80001E0FFF000001C0000001FF0000FFF8001E0FFFE0000100000001FF0000FF
      FC201E1FFFE0000100000001FF0000FFFC201F9FFFE0000100000001FF0000FF
      FE40003FFFF00001F0000001FF0000FFFE40003FFFFE003FF000003FFF0000FF
      FFC0003FFFFE003FF000003FFF0000FFFFF8203FFFFE003FF000003FFF0000FF
      FFF8603FFFFF003FF000003FFF8001FFFFFCE03FFFFFFFFFF0003FFFFFFFFFFF
      FFFFF8FFFFFFFFFFF0003FFFFFFFFFFFFFFFFFFFFFFFFFF38000000080000000
      FFC00001FFFFFFE18000000080000000FFC00001FFFFFFC18000000080000000
      FFC00001FFFFFF818000000080000000FFC00001FFFFFF038000000080000000
      00000001FFFFFE07800000008000000000000001FFFFFC0F8000000080000000
      00000001FFFF0007800000008000000000000001C00000078000000080000000
      00000001000000078000000080000000FFC00001000000078000000080000000
      FFC00001000000078000000080000000FFC00001800000078000000080000000
      FFC00001800000078000000080000000FFC00001800000078000000080000000
      FFC00001800000078000000080000000FFC00001800000078000000080000000
      FFC00001800000078000000080000000FFC00001C00000078000000080000000
      FFC00001C00000078000000080000000FFC00001C00000078000000080000000
      FFC00001C00000078000000080000000FFC00001C00000078000000080000000
      FFC00001E00000078000000080000000FFC00001E00000078000000080000000
      FFC00001E00000078000000080000000FFC00001E00000078000000080000000
      FFC00001E0000007FFFFFFFEFFFFFFFEFFC00001E00000078008010082100200
      FFC00001F000000F8008010082100200FFC00001F00001FF8008010082100200
      FFFFFFFFF001FFFFFFFFFFFFFFFFFFFFFFFE3FFFFFFFFFFFF83FFFFFFFFFFFFF
      FFFDDFFFFFFFFFFFF8000001FFFC3FFFFFFDDFFFFC000007F8000001FFBC3DFF
      FFFDDFFFFC000007F8000001FF1C38FFFFFE3FFFFC000007F8000001FE08107F
      FFFF7FFFFE00000F00000001FE00007FC0000003FE00000F00000001FF0000FF
      C0000003FE00000F00000001F30000CFE0000007FE00000F00000001E0000007
      E0000007FE00000F00000001C0000003E0000007FE00000FF8000001E0000007
      E0000007FE00000FF8000001F003C00FE0000007FE00000FF8000001F807E01F
      E0000007FE00000FF8000001F00FF00FE0000007FE00000FF8000001801FF801
      E0000007FE00000FFFC00001801FF801E0000007FE00000FFFC00001801FF801
      E0000007FE00000FFFC00001801FF801E0000007FE00000FFFC00001F00FF00F
      E0000007FE00000FFFC00001F807E01FE0000007FE00000FFFC00001F003C00F
      E0000007FE00000FFFC00001E0000007E0000007FE00000FFFC00001C0000003
      E0000007FE00000FFFC00001E0000007E0000007FE00000FFFC00001F30000CF
      E0000007F8000003FFC00001FF0000FFE0000007F8000003FFC00001FE00007F
      E0000007F8000003FFC00001FE08107FE0000007FC000007FFC00001FF1C38FF
      E0000007FFFBF7FFFFC00001FFBC3DFFE0000007FFFC0FFFFFC00001FFFC3FFF
      C0000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFF0003000000000000000000000000FFFF0003000000000000000000000000
      FFFF0003000000000000000000000000FF800003000000000000000000000000
      FF800003000000000000000000000000FF800003000000000000000000000000
      C0000003000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000C00001FF000000000000000000000000
      C00001FF000000000000000000000000C00001FF000000000000000000000000
      C000FFFF000000000000000000000000C000FFFF000000000000000000000000
      C000FFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0000003FF8001FFFFFFFFFFFFFFFFFF
      C0000003FF0000FFFFFFFFFFFFFFFFFFC0000003FF0000FFFFFFFFFFFFFFFFFF
      C0000003FF0000FFFFFFFFFFFFFFFFFFC0000003FF0000FF8180F80F80040F81
      C0000003FF0000FF8180E00380040F01C0000003FF0000FF8100C00180040F01
      C0000003FF0000FF8001C00180040E01C0000003FF0000FF8003800080040E01
      C0000003FF0000FF8003800080040C01C0000003FF0000FF8007808081FC0801
      C0000003FF0000FF800381C080040801C0000003FF0000FF800181C080040001
      C0000003FF0000FF800081C080040001C0000003FF0000FF800081C080040001
      C0000003FF0000FF818081C080040001C0000003FF0000FF81C081C080040081
      C0000003FF0000FF818081C081FC0081C0000003FF0000FF800081C080040181
      C0000003FF0000FF800081C080040381C0000003FF0000FF800081C080040381
      C0000003FF0000FF800181C080040781C0000003FF0000FF800381C080040781
      C0000003FF0000FF800F81C080040F81C0000003FF0000FFFFFFFFFFFFFFFFFF
      C0000003FF0000FFFFFFFFFFFFFFFFFFC0000003FF0000FFFFFFFFFFFFFFFFFF
      C0000003FF8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ilMainMenu: TImageList
    DrawingStyle = dsTransparent
    Left = 296
    Top = 408
    Bitmap = {
      494C010125002700040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0000000010020000000000000A0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009FBFBF007F9F9F005F7F7F005F7F
      7F005F7F7F005F7F7F00808080009F9F9F0000000000BFBFBF00BFBFBF00BFBF
      BF009F9F9F009F9F9F0080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F9F9F009FBFBF009FBFBF009FBF
      BF009FBFBF007F9F9F007F9F9F0080808000BFBFBF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F9F9F009FBFBF009FDFDF009FDF
      DF009FDFDF009FDFDF009FBFBF005F7F7F009F9F9F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF009FBFBF00BFDFDF00BFDF
      DF009FDFDF009FDFDF009FBFBF007F9F9F0080808000BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F9F9F00BFDFDF00BFDF
      DF00BFDFDF009FDFDF009FDFDF009FBFBF005F7F7F009F9F9F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF009FBFBF00BFDF
      DF00BFDFDF009FDFDF009FDFDF009FBFBF007F9F9F0080808000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F9F9F00BFDF
      DF00BFDFDF00BFDFDF009FDFDF009FDFDF009FBFBF005F7F7F009F9F9F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF009FBF
      BF009FBFBF009FBFBF009FBFBF009FBFBF009FBFBF007F9F9F0080808000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F9F
      9F00BFDFDF00000000000000000000000000BFDFDF009FBFBF007F9F9F009F9F
      9F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF009FBFBF0000000000000000000000000000000000BFDFDF009FBFBF008080
      8000BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F9F9F00BFDFDF00000000000000000000000000BFDFDF009FBFBF007F9F
      9F009F9F9F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF009FBFBF0000000000000000000000000000000000BFDFDF009FBF
      BF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F9F9F00BFDFDF00000000000000000000000000BFDFDF009FBF
      BF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF007F9F9F007F9F9F007F9F9F007F9F9F007F9F9F007F9F
      9F009FBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006D00000000
      00000000000000000000688DB300000000000000000000000000000000000000
      0000000000008961380089613800896138008961380089613800896138008961
      380089613800000000000000000000000000000000008B8B8BFF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000122D4700122D47000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000AA0000006D
      000000000000688DB300436A9100000000000000000000000000000000000000
      00000000000089613800C97A2800B98F6400A1580E008A4500008A4500008A45
      000089613800000000000000000000000000000000008B8B8BFFE8E8E8FFECEC
      ECFFEFEFEFFFF2F2F2FFF5F5F5FFF8F8F8FF191919FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000122D47007F7D3F00122D4700122D4700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000AA0000006D0000006D000074DA7F0074DA
      7F00006D00004F769C0000000000000000000000000000000000000000000000
      00000000000089613800C8833A00B3977B00AD631800964F07008A4500008A45
      000089613800000000000000000000000000000000008B8B8BFFE5E5E5FFE8E8
      E8FFEBEBEBFFEEEEEEFFF1F1F1FFF5F5F5FF191919FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D4700122D4700122D47008986430085824100817F3F00122D4700122D
      4700B2B9C1000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000AA000074DA7F0074DA7F0074DA7F0074DA
      7F0074DA7F00006D000000000000000000000000000000000000000000000000
      00000000000089613800C8833A00B98F6400B98F64009D540A00924B05008A45
      000089613800000000000000000000000000000000008B8B8BFFE1E1E1FFE4E4
      E4FFE7E7E7FFEAEAEAFFEEEEEEFFF1F1F1FF191919FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D47007F889400122D4700929048008E8C46008A88440086844200122D
      4700B2B9C1000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000AA000074DA7F0074DA7F0074DA7F0074DA
      7F0074DA7F0074DA7F00006D0000000000000000000000000000000000000000
      0000000000000000000089613800C7792700B3977B00A45C1300974F07008A45
      000089613800000000000000000000000000000000008B8B8BFFDEDEDEFFE1E1
      E1FFE4E4E4FFE7E7E7FFEAEAEAFFEDEDEDFF191919FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D47007F889400122D47009C9A4D0098964B0094924900908E4700122D
      4700B2B9C1000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000AA000074DA7F0074DA7F0074DA7F0074DA
      7F0074DA7F0000AA000000000000000000000000000000000000000000000000
      0000000000000000000089613800C47D3000B3977B00B98F64009C540C008A45
      000089613800000000000000000000000000000000008B8B8BFFDCDCDCFFDEDE
      DEFFE0E0E0FFE3E3E3FFE6E6E6FFE9E9E9FF191919FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D47007F889400122D4700A7A45200A2A050009E9C4E009A974C00122D
      4700B2B9C10000000000000000000000000000000000688DB300000000000000
      000000000000006D00000000000000AA000000AA000000AA000074DA7F0074DA
      7F0000AA0000547AA00000000000000000000000000000000000000000000000
      000000000000000000000000000089613800B3977B00B5937100CC6600008961
      380000000000000000000000000000000000000000008B8B8BFFDADADAFFDCDC
      DCFFDEDEDEFFE0E0E0FFE3E3E3FFE6E6E6FF191919FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D47007F889400122D4700AEAB5A00ACA95600A8A65300A4A15100122D
      4700B2B9C10000000000000000000000000000000000436A9100688DB3000000
      0000006D000000AA00000000000000000000000000000000000000AA000000AA
      000000000000688DB300436A9100000000000000000000000000000000000000
      00000000000089613800896138008ABDF00086B3E00086B3E000896138000000
      000000000000000000000000000000000000000000008B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D47007F889400122D4700B3B06400B1AE6000AFAC5C00ADAA5800122D
      4700B2B9C10000000000000000000000000000000000000000004F769C00006D
      000074DA7F0074DA7F00006D0000006D0000006D00000000000000AA00000000
      00000000000000000000688DB300000000000000000000000000000000000000
      000000000000896138006699CC0099CCFF0099CCFF0086B3E000896138000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D47007F889400122D4700B7B56E00B6B36A00A8B49200AFB06D00122D
      4700B2B9C1000000000000000000000000000000000000000000006D000074DA
      7F0074DA7F0074DA7F0074DA7F0074DA7F00006D000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008961380099CCFF0099CCFF00BADAFB0099CCFF0099CCFF00003366008961
      3800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D47007F889400122D4700BCBA7700B0BFB100C6D0C300B7C4B300122D
      4700B2B9C10000000000000000000000000000000000006D000074DA7F0074DA
      7F0074DA7F0074DA7F0074DA7F0074DA7F00006D000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008961380099CCFF006699CC0099CCFF0099CCFF0099CCFF00003366008961
      3800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D47007F889400122D4700B5BD9600C9CEB100C8CDAF00BBB97500122D
      4700B2B9C100000000000000000000000000000000000000000000AA000074DA
      7F0074DA7F0074DA7F0074DA7F0074DA7F00006D000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000896138006699CC006699CC006699CC0099CCFF0000336600003366008961
      3800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100122D4700122D4700122D4700C5C38800C3C18500C1BF8200122D4700122D
      4700B2B9C1000000000000000000000000000000000000000000547AA00000AA
      000074DA7F0074DA7F0000AA000000AA000000AA000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008961380099CCFF0099CCFF0099CCFF007BAEE10000336600003366008961
      3800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B9
      C100B2B9C100B2B9C100122D4700C8C69000122D4700122D4700B2B9C100B2B9
      C100B2B9C10000000000000000000000000000000000436A9100688DB3000000
      000000AA000000AA000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000896138000033660000336600003366000033660000336600896138000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000122D4700122D47000000000000000000000000000000
      00000000000000000000000000000000000000000000688DB300000000000000
      00000000000000AA000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008961380089613800896138008961380089613800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF0000000000000000696969FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF0000000031368CFF31368CFF31368CFF3136
      8CFF31368CFF31368CFF31368CFF31368CFF31368CFF31368CFF31368CFF3136
      8CFF31368CFF31368CFF31368CFF31368CFF0000000000000000414D57FF414D
      57FF414D57FF414D57FF414D57FF414D57FF414D57FF414D57FF414D57FF414D
      57FF414D57FF414D57FF000000000000000000000000696969FFD3D3D4FFD0D0
      D1FFCDCDCEFFCBCBCCFFC8C8C9FFC4C4C5FFC2C2C3FFBFBFC1FFBDBDBEFFBBBB
      BCFFB9B9BBFFB8B8B9FF191919FF0000000000000000696969FFD3D3D4FFD0D0
      D1FFCDCDCEFFCBCBCCFFC8C8C9FFC4C4C5FFC2C2C3FFBFBFC1FFBDBDBEFFBBBB
      BCFFB9B9BBFFB8B8B9FF191919FF0000000031368CFF6ADAFFFF7FD1F7FF77CE
      F6FF70CCF6FF68C9F5FF60C5F5FF58C2F4FF51C0F4FF49BDF3FF42BAF3FF3BA8
      E6FF3256A5FF315DABFF2CB2F1FF31368CFF0000000000000000414D57FF525C
      66FF70777EFFAFACA9FF918E8AFFB5B3B3FFBBB9B9FFBCBABAFFBFBCBDFFBEBC
      BCFFBEBCBCFF414D57FF000000000000000000000000696969FFD8D8D8FFD5D5
      D5FFD2D2D2FFCFCFD0FFCCCCCDFFC9C9CAFFC5C5C7FFC3C3C4FFC0C0C1FFBEBE
      BFFFBCBCBDFFBABABBFF191919FF0000000000000000696969FFD8D8D8FFD5D5
      D5FFD2D2D2FFCFCFD0FFCCCCCDFFC9C9CAFFC5C5C7FFC3C3C4FFC0C0C1FFBEBE
      BFFFBCBCBDFFBABABBFF191919FF0000000031368CFF6ADAFFFF6597CFFF3136
      8CFF425BA6FF62AEE2FF66C8F5FF5EC4F5FF56C1F4FF4FBFF4FF47BCF3FF3FA9
      E6FF399FDFFF324E9FFF2FA4E5FF31368CFF0000000000000000414D57FF7077
      7EFFAFACA9FFD0CCCBFF969390FFBBB9B9FFC9C7C8FFCAC7C8FFC9C5C8FFC8C5
      C7FFC1BFBFFF414D57FF000000000000000000000000696969FFDCDCDDFFD9D9
      DAFF8D8D8EFFA1A1A3FF8D8D8EFF8D8D8EFF8D8D8EFFA1A1A3FFA1A1A3FFC1C1
      C2FFBFBFC0FFBDBDBEFF191919FF0000000000000000696969FFDCDCDDFFD9D9
      DAFFD6D6D7FFD3D3D4FF006C00FFCDCDCEFFCACACBFFC7C7C8FFC4C4C5FFC1C1
      C2FFBFBFC0FFBDBDBEFF191919FF0000000031368CFF6ADAFFFF8AD5F7FF5070
      B3FF4D6FB3FF25B0F1FF6BCAF5FF63C7F5FF5CC3F4FF54C1F4FF4DBEF3FF44B3
      EDFF3A88CCFF324698FF33B5F2FF31368CFF0000000000000000414D57FFBCB8
      B7FFD0CCCBFFEBE6E7FF9F9C99FFC9C7C8FFCECBCDFFCDCACCFFCCC9CBFFCBC9
      CAFFC4C1C2FF414D57FF000000000000000000000000696969FFE0E0E1FFE0E0
      E1FFDADADBFFD7D7D8FFD4D4D5FFD1D1D2FFCECECFFFCBCBCCFFC8C8C9FFC5C5
      C7FFC2C2C3FFC0C0C1FF191919FF0000000000000000696969FFE0E0E1FFE0E0
      E1FFDADADBFFD7D7D8FF00A900FF006C00FFCECECFFFCBCBCCFFC8C8C9FFC5C5
      C7FFC2C2C3FFC0C0C1FF191919FF0000000031368CFF6ADAFFFF84C2EAFF72AC
      DCFF2D5CABFF6BB1E2FF71CCF6FF69C9F5FF61C7F5FF5AC3F4FF52C0F4FF48AC
      E6FF3657A5FF3667B2FF37B6F2FF31368CFF0000000000000000414D57FFC3C0
      C0FFC4C1C1FFBFBCBCFFBCB9B8FFD3D0D1FFD2CFD0FFD1CECFFFD0CDCEFFCFCC
      CEFFC8C4C5FF414D57FF000000000000000000000000696969FFE4E4E5FF8D8D
      8EFF8D8D8EFF8D8D8EFF8D8D8EFF8D8D8EFF8D8D8EFF8D8D8EFF8D8D8EFF8D8D
      8EFF8D8D8EFFC3C3C4FF191919FF0000000000000000696969FFE4E4E5FFE1E1
      E2FFDEDEDFFFDBDBDCFF00A900FF73DA7EFF006C00FFCFCFD0FFCCCCCDFFCACA
      CBFFC7C7C8FFC3C3C4FF191919FF0000000031368CFF6ADAFFFF8FCFF1FF5471
      B4FF4B67ADFF7FD1F7FF77CEF6FF6FCBF6FF67C9F5FF5FC5F5FF58C2F4FF6ADA
      FFFF6ADAFFFF6ADAFFFF6ADAFFFF31368CFF0000000000000000414D57FFD2D0
      D0FFDBD8D9FFD9D7D8FFD8D6D7FFD7D5D6FFD6D4D5FFD5D2D4FFD4D1D3FFD3D0
      D1FFCDCACBFF414D57FF000000000000000000000000696969FFE8E8E9FF8D8D
      8EFF3797C4FF3797C4FFDCDCDDFF367F00FF367F00FFD3D3D4FF3D00A7FF3D00
      A7FFCBCBCCFFC8C8C9FF191919FF0000000000000000696969FFE8E8E9FFE5E6
      E6FFE3E3E3FFE0E0E0FF00A900FF73DA7EFF73DA7EFF006C00FFD0D0D1FFCDCD
      CEFFCBCBCCFFC8C8C9FF191919FF0000000031368CFF6ADAFFFF6ADAFFFF6ADA
      FFFF6ADAFFFF6ADAFFFF7DD0F6FF75CDF6FF405AA6FF65C8F5FF5DC4F4FF3136
      8CFF31368CFF31368CFF31368CFF31368CFF0000000000000000414D57FFD5D3
      D4FFDFDDDEFFDEDBDCFFDDDADBFFDCD9DAFFDBD8D9FFD9D7D8FFD8D6D7FFD7D5
      D6FFD4D1D2FF414D57FF000000000000000000000000696969FFECECEDFF8D8D
      8EFF3797C4FF3797C4FFC7C7C9FF367F00FF367F00FFC7C7C9FF3D00A7FF3D00
      A7FFC7C7C9FFCCCCCDFF191919FF0000000000000000696969FFECECEDFFEAEA
      EAFFE7E7E7FFE4E4E4FF00A900FF73DA7EFF73DA7EFF73DA7EFF006C00FFD2D2
      D2FFCFCFD0FFCCCCCDFF191919FF0000000031368CFF31368CFF31368CFF3136
      8CFF31368CFF6ADAFFFF82D2F7FF7BCFF6FF415BA6FF6BCAF5FF63C7F5FF3136
      8CFF000000000000000000000000000000000000000000000000414D57FFE1DE
      DFFFE4E1E2FFE3E0E1FFE1DFE0FFE0DEDFFFDFDDDEFFDEDBDCFFDDDADBFFDCD9
      DAFFDBD8D9FF414D57FF000000000000000000000000696969FFF0F0F0FF8D8D
      8EFF3797C4FF3797C4FFE5E5E5FFE2E2E3FFDFDFE0FFDCDCDDFF3D00A7FF3D00
      A7FFD3D3D4FFD0D0D1FF191919FF0000000000000000696969FFF0F0F0FFEDED
      EEFFEBEBEBFFE8E8E8FF00A900FF73DA7EFF73DA7EFF00A900FFD9D9DAFFD6D6
      D7FFD3D3D4FFD0D0D1FF191919FF000000000000000000000000000000000000
      000031368CFF6ADAFFFF88D4F7FF6296CFFF3A4899FF71CCF6FF69C9F5FF3136
      8CFF000000000000000000000000000000000000000000000000414D57FFE4E2
      E3FFE8E6E6FFE7E4E5FFE6E3E4FFE5E2E3FFE4E1E2FFE3E0E1FFE1DFE0FFE0DE
      DFFFDFDDDEFF414D57FF000000000000000000000000696969FFF4F4F4FF8D8D
      8EFF3797C4FF3797C4FFC7C7C9FFC7C7C9FFC7C7C9FFC7C7C9FFC7C7C9FFC7C7
      C9FFC7C7C9FFD4D4D5FF191919FF0000000000000000696969FFF4F4F4FFF1F1
      F1FFEFEFEFFFECECECFF00A900FF73DA7EFF00A900FFE0E0E1FFDDDDDEFFDADA
      DBFFD7D7D8FFD4D4D5FF191919FF000000000000000000000000000000000000
      000031368CFF6ADAFFFF8DD6F7FF81CAF0FF4E6FB3FF76CEF6FF6FCBF6FF3136
      8CFF000000000000000000000000000000000000000000000000414D57FFE8E6
      E6FFECEAEAFFEBE9E9FFEAE8E8FFE9E7E7FFE8E6E6FFE7E4E5FFE6E3E4FFE5E2
      E3FFE2DFE0FF414D57FF000000000000000000000000696969FFF7F7F7FF8D8D
      8EFFF2F2F2FFF0F0F0FFEDEDEDFFEAEAEBFFE7E7E8FFE4E4E5FFE1E1E2FFDEDE
      DFFFDBDBDCFFD8D8D9FF191919FF0000000000000000696969FFF7F7F7FFF5F5
      F5FFF2F2F2FFF0F0F0FF00A900FF00A900FFE7E7E8FFE4E4E5FFE1E1E2FFDEDE
      DFFFDBDBDCFFD8D8D9FF191919FF000000000000000000000000000000000000
      000031368CFF6ADAFFFF6ADAFFFF6ADAFFFF6ADAFFFF6ADAFFFF6ADAFFFF3136
      8CFF000000000000000000000000000000000000000000000000414D57FFEBE9
      E9FFF0EDEEFFEFECEDFFEEEBECFFEDEBEBFFECEAEAFFEBE9E9FFEAE8E8FFE9E7
      E7FFE6E3E4FF414D57FF000000000000000000000000696969FFFAFAFAFF8D8D
      8EFFC7C7C9FFC7C7C9FFC7C7C9FFC7C7C9FFC7C7C9FFC7C7C9FFC7C7C9FFC7C7
      C9FFC7C7C9FFDCDCDDFF191919FF0000000000000000696969FFFAFAFAFFF8F8
      F8FFF5F5F6FFF3F3F3FF00A900FFEEEEEEFFEBEBECFFE8E8E9FFE5E6E6FFE3E3
      E3FFE0E0E0FFDCDCDDFF191919FF000000000000000000000000000000000000
      000031368CFF31368CFF31368CFF31368CFF31368CFF31368CFF31368CFF3136
      8CFF000000000000000000000000000000000000000000000000414D57FFEEEB
      ECFFF3F0F1FFF2EFF0FFF1EFEFFFF0EEEFFFF0EDEEFFEFECEDFFEEEBECFFEDEB
      EBFFE9E7E8FF414D57FF000000000000000000000000696969FFFCFCFCFFFAFA
      FBFFF8F8F9FFF6F6F7FFF4F4F4FFF2F2F2FFEFEFEFFFECECEDFFEAEAEAFF6969
      69FF191919FF191919FF191919FF0000000000000000696969FFFCFCFCFFFAFA
      FBFFF8F8F9FFF6F6F7FFF4F4F4FFF2F2F2FFEFEFEFFFECECEDFFEAEAEAFF6969
      69FF191919FF191919FF191919FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000414D57FFEFED
      EDFFEFEDEDFF807E78FF7C7A74FF74716AFF74716AFF75726BFF807E78FFF0EE
      EFFFF0EDEEFF414D57FF000000000000000000000000696969FFFEFEFEFFFDFD
      FDFFFBFBFBFFF9F9F9FFF7F7F7FFF5F5F5FFF3F3F3FFF0F0F0FFEDEDEEFF6969
      69FFE8E8E8FFC7C7C9FF696969FF0000000000000000696969FFFEFEFEFFFDFD
      FDFFFBFBFBFFF9F9F9FFF7F7F7FFF5F5F5FFF3F3F3FFF0F0F0FFEDEDEEFF6969
      69FFE8E8E8FFC7C7C9FF696969FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000414D57FF414D
      57FF414D57FF8C8A86FFA8A7A6FFBDBDBDFFBDBDBDFFAEAEADFF8C8A86FF414D
      57FF414D57FF414D57FF000000000000000000000000696969FFFFFFFFFFFFFF
      FFFFFDFDFDFFFCFCFCFFFAFAFAFFF8F8F8FFF6F6F6FFF4F4F4FFF1F1F1FF6969
      69FFC7C7C9FF696969FF000000000000000000000000696969FFFFFFFFFFFFFF
      FFFFFDFDFDFFFCFCFCFFFAFAFAFFF8F8F8FFF6F6F6FFF4F4F4FFF1F1F1FF6969
      69FFC7C7C9FF696969FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000414D57FF414D
      57FF414D57FF414D57FFA3A29FFFB5B5B4FFB5B5B4FFA8A7A6FF414D57FF414D
      57FF414D57FF414D57FF000000000000000000000000696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF00000000000000000000000000000000696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000069665EFF726F68FF726F68FF726F68FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000696969FF00000000000000008B8B
      8BFF191919FF191919FF191919FF191919FF0000000000000000000000000000
      00000000000000000000000000000000000000000000465764FF122C46FF122C
      46FF122C46FF122C46FF122C46FF122C46FF000000008B8B8BFF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B9BFFF00000000000000008B8B
      8BFFDEDEDEFFF8F8F8FFF8F8F8FF191919FF0000000000000000000000000000
      00000000000000000000000000000000000000000000465764FF65A4DBFF5799
      D5FF498FCFFF3C86C9FF307DC3FF122C46FF000000008B8B8BFFE8E8E8FFECEC
      ECFFEFEFEFFFF2F2F2FFF5F5F5FFF8F8F8FF191919FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A900FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000696969FFB1B9BFFF696969FF8B8B
      8BFFDEDEDEFFEBEBEBFFF8F8F8FF191919FF0000000000000000000000000000
      00000000000000000000000000000000000000000000465764FF79B3E4FF6BA8
      DEFF5D9ED7FF4F94D1FF428ACCFF122C46FF000000008B8B8BFFE5E5E5FFE0E0
      DFFF006C00FFEEEEEEFFF1F1F1FFF5F5F5FF191919FF00000000000000000000
      0000000000000000000000000000000000007E7E7EFF3069EDFF939393FF0000
      000000A900FF00000000006C00FF006C00FF006C00FF006C00FF006C00FF006C
      00FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B9BFFF00000000000000008B8B
      8BFFDEDEDEFFDEDEDEFFDEDEDEFF191919FF0000000000000000000000000000
      0000000000000000000000000000435F5FFF0F2A2BFF465764FF8EC2EDFF7FB7
      E6FF71ADE0FF63A2DAFF5598D4FF122C46FF000000008B8B8BFFE1E1E1FF00A9
      00FF73DA7EFF006C00FFEEEEEEFFF1F1F1FF191919FF00000000000000000000
      000000000000000000000000000000000000ABABABFFABABABFFABABABFF0000
      000000A900FF006C00FF63E170FF5BDF69FF53DC62FF4BDA5BFF44D854FF3DD6
      4DFF006C00FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000696969FF00000000000000008B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF0000000000000000000000000000
      0000000000000000000000000000435F5FFF64E3E6FF465764FFA2D2F5FF94C8
      EFFF85BCE9FF77B1E3FF69A7DDFF122C46FF000000008B8B8BFFDEDEDEFF00A9
      00FF73DA7EFF73DA7EFF006C00FFEDEDEDFF191919FF00000000000000000000
      0000000000000000000000000000000000007E7E7EFF3069EDFF939393FF0000
      000000A900FF76E781FF6DE47AFF65E273FF5DDF6BFF006C00FF00A900FF00A9
      00FF00A900FF006C00FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B9BFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000435F5FFF77E7E9FF465764FFB5E0FEFFA8D6
      F8FF9ACCF2FF8CC1ECFF7DB6E5FF122C46FF000000008B8B8BFFDCDCDCFF00A9
      00FF73DA7EFF73DA7EFF73DA7EFF006C00FF191919FF00000000000000000000
      000000000000000000000000000000000000ABABABFFABABABFFABABABFF0000
      000000A900FF80EA8BFF78E784FF70E57DFF68E375FF006C00FF000000000000
      00000000000000A900FF00A900FF000000000000000000000000000000000000
      000000000000000000000000000000000000696969FF00000000000000008B8B
      8BFF191919FF191919FF191919FF191919FF0000000000000000000000000000
      000000000000615A55FF403730FF435F5FFF89EAECFF465764FF94B1C0FF6279
      89FF5F7688FF5C7486FF7399B6FF122C46FF000000008C8C8CFF00A900FF73DA
      7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF006C00FF00000000000000000000
      0000000000000000000000000000000000007E7E7EFF3069EDFF939393FF0000
      000000A900FF8BED95FF83EB8EFF7BE886FF006C00FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B9BFFF00000000000000008B8B
      8BFFDEDEDEFFF8F8F8FFF8F8F8FF191919FF0000000000000000000000000000
      000000000000615A55FFEED0B8FF435F5FFF9CEDEFFF465764FF9EB8C0FF667C
      89FF637A89FF607788FF80A2BCFF122C46FF000000008B8B8BFF00A900FF73DA
      7EFF00A900FF00A900FF00A900FF73DA7EFF73DA7EFF006C00FF000000000000
      000000000000000000000000000000000000ABABABFFABABABFFABABABFF0000
      000000A900FF00A900FF00A900FF00A900FF00A900FF00A900FF00A900FF006C
      00FF006C00FF006C00FF006C00FF006C00FF0000000000000000000000000000
      000000000000000000000000000000000000696969FFB1B9BFFF696969FF8B8B
      8BFFDEDEDEFFEBEBEBFFF8F8F8FF191919FF0000000000000000000000000000
      000000000000615A55FFF0D6C0FF435F5FFFADF1F2FF465764FFE8FFFFFFDEFD
      FFFFD3F5FFFFC7EDFFFFB9E3FFFF122C46FF0000000000A900FF73DA7EFF00A9
      00FF000000000000000000A900FF00A900FF73DA7EFF73DA7EFF006C00FF0000
      0000000000000000000000000000000000007E7E7EFF3069EDFF939393FF0000
      000000000000000000000000000000000000000000000000000000000000006C
      00FF88EC93FF80EA8BFF78E784FF006C00FF0000000000000000000000000000
      000000000000000000000000000000000000B1B9BFFF00000000000000008B8B
      8BFFDEDEDEFFDEDEDEFFDEDEDEFF191919FF0000000000000000000000000000
      000000000000615A55FFF2DBCAFF435F5FFFA5D6D7FF465764FF465764FF4657
      64FF465764FF465764FF465764FF465764FF0000000000A900FF00A900FF0000
      00000000000000000000000000000000000000A900FF73DA7EFF73DA7EFF006C
      00FF00000000000000000000000000000000ABABABFFABABABFFABABABFF0000
      00000000000000A900FF006C00FF000000000000000000000000006C00FF9BF2
      A4FF93EF9DFF8BED95FF83EB8EFF006C00FF0000000000000000000000000000
      000000000000000000000000000000000000696969FF00000000000000008B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF0000000000000000000000000000
      000000000000615A55FFF4E1D3FF435F5FFFB1D8D9FF6C8F8FFF688E8EFF658D
      8EFF8DD2D3FF0F2A2BFF00000000000000000000000000A900FF000000000000
      0000000000000000000000000000000000000000000000A900FF00A900FF73DA
      7EFF006C00FF0000000000000000000000007E7E7EFF3069EDFF939393FF0000
      0000000000000000000000A900FF006C00FF006C00FF006C00FFACF7B4FFA5F5
      ADFF9DF2A6FF96F09FFF8EEE98FF006C00FF0000000000000000000000000000
      000000000000000000008B8B8BFF191919FF191919FF191919FF191919FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFF6E7DBFF435F5FFFDBF9F9FFD2F7F8FFC8F5F6FFBCF3
      F4FFB1F1F2FF0F2A2BFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A9
      00FF73DA7EFF006C00FF0000000000000000ABABABFFABABABFFABABABFF0000
      000000000000000000000000000000A900FFC3FECAFFBDFCC3FFB6FABDFFAFF8
      B6FFA7F5AFFFA0F3A8FF00A900FF006C00FF0000000000000000000000000000
      000000000000000000008B8B8BFFDEDEDEFFF8F8F8FFF8F8F8FF191919FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFDACFC7FF435F5FFF435F5FFF435F5FFF435F5FFF435F
      5FFF435F5FFF435F5FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A900FF73DA7EFF006C00FF000000007E7E7EFF3069EDFF939393FF0000
      00000000000000000000000000000000000000A900FF00A900FF00A900FF00A9
      00FF00A900FF00A900FF00000000006C00FF696969FFB1B9BFFF696969FFB1B9
      BFFF696969FFB1B9BFFF8B8B8BFFDEDEDEFFEBEBEBFFF8F8F8FF191919FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFDCD4CDFF918983FF918882FF918781FFD8CABEFF4037
      30FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000A900FF00A900FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000A900FF0000000000000000000000000000
      000000000000000000008B8B8BFFDEDEDEFFDEDEDEFFDEDEDEFF191919FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFFCF6F2FFFBF4EEFFFAF1EAFFF9EEE6FFF8ECE2FF4037
      30FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FF615A55FF615A55FF615A55FF615A55FF615A55FF615A
      55FF000000000000000000000000000000000000000000000000356BA1FF1F3D
      5BFF1F3D5BFF1F3D5BFF1F3D5BFF1F3D5BFF1F3D5BFF1F3D5BFF1F3D5BFF1F3D
      5BFF1F3D5BFF1F3D5BFF1F3D5BFF000000000000000000000000000000000000
      0000000000008B8B8BFF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FFFFFFFF00130F0F00312828001814
      1400010101000F0F0F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008B8B
      8BFF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF00000000000000000000000000000000356BA1FF5A88
      B6FF5A88B6FF5A88B6FF5A88B6FF5A88B6FF5A88B6FF5A88B6FF5A88B6FF5A88
      B6FF5A88B6FF5A88B6FF1F3D5BFF000000000000000000000000000000000000
      0000000000008B8B8BFF4577A7FF3D71A2FF376C9FFF30679CFF296298FF235D
      95FF1D5992FF18558FFF14497DFF191919FFFFFFFF0079676700B59A9A007D68
      68000B0B0B00424343002A292900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008B8B
      8BFF4577A7FF3D71A2FF376C9FFF30679CFF296298FF235D95FF1D5992FF1855
      8FFF14497DFF191919FF00000000000000000000000000000000356BA1FF5A88
      B6FF5A88B6FF5A88B6FF5A88B6FF5A88B6FF5A88B6FF5A88B6FF5A88B6FF5A88
      B6FF5A88B6FF5A88B6FF1F3D5BFF000000000000000000000000000000000000
      0000000000008B8B8BFF5A90C3FF5189BFFF4883BAFF407CB6FF3776B1FF3070
      ADFF286BAAFF2165A6FF1A5893FF191919FFFFFFFF00A28B8B00C8B3B200A087
      860065565400777474005F595900432222004924250047292900452A2B004129
      2B00402A2D002E1F210004040400000000000000000000000000000000008B8B
      8BFF5A90C3FF5189BFFF4883BAFF407CB6FF3776B1FF3070ADFF286BAAFF2165
      A6FF1A5893FF191919FF00000000000000000000000000000000356BA1FF6493
      C4FF6493C4FF6493C4FF6493C4FF6493C4FF6493C4FF6493C4FF6493C4FF6493
      C4FF6493C4FF6493C4FF1F3D5BFF000000002442CBFF1C49A9FF1C49A9FF1C49
      A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF447FB8FF3B79
      B3FF3373AFFF2C6DABFF235D95FF191919FFFFFFFF00503D3D003A3032002D2D
      34007A7C87007D93A0007EA3AF00A89FAD00C18E9A00CE7B8300D6717700E17D
      7F00E07A7E00E07A810074494C00020303000000000000000000000000008B8B
      8BFF689ACBFF5E93C5FF558CC1FF4C86BCFF447FB8FF3B79B3FF3373AFFF2C6D
      ABFF235D95FF191919FF00000000000000000000000000000000356BA1FF709F
      D0FF709FD0FF709FD0FF709FD0FF709FD0FF709FD0FF709FD0FF709FD0FF709F
      D0FF709FD0FF709FD0FF1F3D5BFF000000002442CBFF728DFAFF728DFAFF728D
      FAFF728DFAFF728DFAFF728DFAFF728DFAFF728DFAFF1C49A9FF5089BEFF4882
      BAFF3F7CB5FF3776B1FF2C649AFF191919FFFFFFFF00243C4F006077860095B0
      BB00B4E2EB00B4F3FF00ABFEFF0094F7FA0091DBE4008EB3C000868193007345
      4C00813F3D00D0616100DE7E7F00181314000000000000000000000000008B8B
      8BFF76A5D2FF6C9ECEFF6397C9FF5A90C3FF5089BEFF4882BAFF3F7CB5FF3776
      B1FF2C649AFF191919FF00000000000000000000000000000000356BA1FF76A3
      D1FF85B1DFFF85B1DFFF85B1DFFF85B1DFFF85B1DFFF85B1DFFF85B1DFFF85B1
      DFFF85B1DFFF85B1DFFF1F3D5BFF000000002442CBFF728DFAFF728DFAFF728D
      FAFF728DFAFF728DFAFF728DFAFF728DFAFF728DFAFF1C49A9FF5E93C5FF558C
      C1FF4C85BCFF437FB8FF366C9FFF191919FFFFFFFF008CB3CD00FAFFFF00DAFF
      FF00AFF3FF008CE0FF0089EAFF0087F6FF0093FDFF009EFFFF0093F3FE001538
      4E003C2B2A00B35A5A00DF7877001D1617000000000000000000000000008B8B
      8BFF84AFDAFF7AA8D5FF71A1D0FF679ACBFF006C00FF558CC1FF4C85BCFF437F
      B8FF366C9FFF191919FF00000000000000000000000000000000356BA1FF7EAA
      D8FF5882AEFF495A7AFF495A7AFF495A7AFF495A7AFF495A7AFF495A7AFF495A
      7AFF567CA7FF7BA7D5FF1F3D5BFF000000002442CBFF2442CBFF2442CBFF2442
      CBFF2442CBFF2442CBFF2442CBFF2442CBFF2442CBFF2442CBFF6C9DCDFF6296
      C9FF598FC3FF5088BEFF4174A4FF191919FFFFFFFF0088B4CE00DCFFFF00A2EB
      FF0080DCFF0065D1FF006DDDFF0069E4FF0074E8FF0085F5FF008CF9FF00183F
      5500301F1E00B6606000DD7879001C1517000000000000000000000000008B8B
      8BFF92BAE1FF88B3DCFF7FACD7FF75A4D2FF00A900FF006C00FF598FC3FF5088
      BEFF4174A4FF191919FF0000000000000000000000000000000000000000356B
      A1FF7EAAD8FF5882AEFF495A7AFF495A7AFF495A7AFF495A7AFF495A7AFF5882
      AEFF7BA7D5FF1F3D5BFF00000000000000000000000000000000000000000000
      0000000000008B8B8BFF9FC4E8FF96BDE3FF3798D0FF0F70A8FF3E83B6FF3D8F
      C4FF0E73B0FF2470A6FF4C7CAAFF191919FFFFFFFF006BABCD00B0F6FF007ADA
      FF0053CCFF003AC1FF005BD3FF0048D4FF0052D8FF0064E3FF006DECFF001444
      5D002D1D1B00B6616100DD7878001D1517000000000000000000000000008B8B
      8BFF9FC4E8FF00A900FF006C00FF006C00FF73DA7EFF73DA7EFF006C00FF5D92
      C4FF4C7CAAFF191919FF00000000000000000000000000000000000000000000
      0000356BA1FF7EAAD8FF6B98C5FF6B98C5FF006C00FF6B98C5FF6492BFFF7BA7
      D5FF1F3D5BFF0000000000000000000000000000000000000000000000000000
      0000000000008B8B8BFFADCFEFFFA4C8EAFF2990CAFF02B4DFFF0580B5FF0A92
      CDFF01B0E2FF1A72AAFF5885B0FF191919FFFFFFFF0054A4D00089EBFF005CD0
      FF004FCBFF0055CEFF006FD9FF0065DBFF0052D6FF004FD8FF0053E5FF001149
      6600311D1B00B6626300DC7879001D1516000000000000000000000000008B8B
      8BFFADCFEFFF00A900FF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF006C
      00FF5885B0FF191919FF00000000000000000000000000000000000000000000
      000000000000356BA1FF366CA1FF00A900FF73DA7EFF006C00FF356BA1FF1F3D
      5BFF000000000000000000000000000000000000000000000000000000000000
      0000000000008B8B8BFFB9D9F5FFB1D2F1FF4897C8FF0BC7ECFF03E2FFFF00D8
      FFFF07BEECFF3587BCFF648EB6FF191919FFFFFFFF003B97CD0086DDFE0089E0
      FF0085DBFB0077CAF10060B8EB007ED0F20086DBFF0085E3FF0068E0FF000F4C
      72002F1E1C00B6646500DC7879001D1516000000000000000000000000008B8B
      8BFF9EACB9FF00A900FF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA
      7EFF006C00FF191919FF00000000000000000000000000000000000000000000
      0000000000000000000000A900FF73DA7EFF73DA7EFF73DA7EFF006C00FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008B8B8BFFA4B0BBFF8699A6FF2F91BEFF3AE2F7FF24E3FFFF09D9
      FFFF00C8F4FF1771A2FF6693BAFF191919FFFFFFFF001273B800328ECE0053A3
      D60086A5B3007A8B9800708394006B93A9004E8CB10036729A00144A71000014
      28000E0C0A00A85C5D00E27B7C001D1516000000000000000000000000008B8B
      8BFFA1A5AAFF00A900FF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF00A9
      00FF7097BDFF191919FF00000000000000000000000000000000000000000000
      00000000000000A900FF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF006C
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000008B8B8BFFA2A7ABFF4498C4FF2FCFEDFF7EF5FCFF5FEFFFFF2EE5
      FFFF07D8FCFF03BAE7FF277FB3FF191919FFFFFFFF001376BC00167BCD002757
      8400877E7700827E7C009C8D8600C5A6A10094767B007A525200653E3A00502F
      2D003C282800BA6A6800E1818100171213000000000000000000000000008B8B
      8BFFADB8C1FF00A900FF00A900FF00A900FF73DA7EFF73DA7EFF00A900FF909D
      AAFF7CA1C3FF191919FF00000000000000000000000000000000000000000000
      000000A900FF00A900FF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF00A9
      00FF006C00FF0000000000000000000000000000000000000000000000000000
      0000000000008B8B8BFFB1BBC1FF78A5BEFF4F9BC0FF379AC7FF81EAF7FF4ADB
      F1FF1A86BAFF3B8EBAFF5E99C2FF191919FFFFFFFF00206DA40054647100585C
      600074737200696B6B0077737300BB9D9700F7C5BC00FBC4BD00F9C2BB00F1B1
      AB00EA9F9900EA939000754D4D00020507000000000000000000000000008B8B
      8BFFDCF2FFFFD5EDFFFFCEE7FEFFC5E2FBFF00A900FF00A900FFACCFEEFFA3C8
      EAFF88A9CAFF191919FF00000000000000000000000000000000000000000000
      0000000000000000000000A900FF73DA7EFF73DA7EFF73DA7EFF006C00FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008B8B8BFFE5F9FFFFDFF4FFFFD8EFFFFFADD7F3FF31B9DEFF38A4
      CCFF97C5E8FFB0D2F0FF96B5D3FF191919FFFFFFFF00595A5C005F5854005C59
      5800707172007A797900606263003F3F3F00895F5F00A97A7900A37A7700B58B
      8600C3928D00765755000B0B0C00000202000000000000000000000000008B8B
      8BFFE5F9FFFFDFF4FFFFD8EFFFFFD1EAFFFF00A900FFC1DEF9FFB9D8F5FFB0D2
      F0FF96B5D3FF191919FF00000000000000000000000000000000000000000000
      0000000000000000000000A900FF73DA7EFF73DA7EFF73DA7EFF006C00FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008B8B8BFFE0EFF0FFDCECF0FFD7E9F0FFD1E4F0FF65A9CFFF64A8
      CFFFBDD6EDFFB8D2EAFFA1B9D0FF191919FFFFFFFF0056545300545454005252
      520075757500D7D7D700939393000E0F0F003C272700986666006A3C3E007B55
      550081656200473A3A000F0D0E00000303000000000000000000000000008B8B
      8BFFE0EFF0FFDCECF0FFD7E9F0FFD1E5F0FFCBE0F0FFC4DBEFFFBDD6EDFFB8D2
      EAFFA1B9D0FF191919FF00000000000000000000000000000000000000000000
      0000000000000000000000A900FF00A900FF00A900FF00A900FF00A900FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFFFFFFFF0056565600565656005656
      56005B5B5B00ADADAD006C6C6C00000000000E0A0A009E6B6A006F4242008059
      5900866965004D3D3C00100F0F00000303000000000000000000000000008B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000047586500122D4700122D
      4700122D4700122D4700122D4700122D470000000000696969FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF0000000069C2FDFF3DAFFDFF60BDFDFF97D4
      FCFFA0D6FDFF9CD5FDFF9CD5FDFF94D2FCFF74C5FDFF72C6FDFF6CC3FCFF69C1
      FCFF91D1FCFFACDCFDFFA0D7FDFF83CBFDFF00000000A2A2A2FF515151FF9A9A
      9AFF0000000000000000000000000000000000000000465764FF122C46FF122C
      46FF122C46FF122C46FF122C46FF122C46FF0000000000000000000000000000
      0000000000000000000000000000000000000000000047586500FEF7E900FEF7
      E900FEF7E900FEF7E900FEF7E900122D470000000000696969FFD3D3D4FFD0D0
      D1FFCDCDCEFFCBCBCCFFC8C8C9FFC4C4C5FF9E9EA0FF9E9EA0FFBDBDBEFFBBBB
      BCFFB9B9BBFFB8B8B9FF191919FF0000000079C8FEFF7AC9FDFF99D5FCFF96D3
      FDFFB8E1FCFFB7E0FDFFA6D9FDFF95D3FCFF82C4F0FF7EB6DCFF79C8FCFF71C5
      FDFF68C1FDFF64BFFDFF6CC2FDFF99D5FDFF00000000515151FFB97400FF5151
      51FF0000000000000000000000000000000000000000465764FF65A4DBFF5799
      D5FF498FCFFF3C86C9FF307DC3FF122C46FF0000000000000000000000000000
      0000000000000000000000000000000000000000000047586500FEF7E900FEF7
      E900FEF7E900FEF7E900FEF7E900122D470000000000696969FFD8D8D8FFD5D5
      D5FFD2D2D2FFCFCFD0FFCCCCCDFF8A462EFF7F402AFF9E9EA0FFC0C0C1FFBEBE
      BFFFBCBCBDFFBABABBFF191919FF0000000083CDFEFF8BCFFEFF91D2FDFF8DD0
      FDFF96D5FDFFA3D9FCFF97D3F8FF8EBCDBFF89ADC5FF87B2D1FF82BCE2FF7BC9
      FEFF72C6FEFF68C1FEFF5CBDFEFF9CD6FDFF00000000515151FFB97400FF5151
      51FF0000000000000000000000000000000000000000465764FF79B3E4FF6BA8
      DEFF5D9ED7FF4F94D1FF428ACCFF122C46FF0000000000000000000000000000
      0000000000000000000000000000446060000F2B2C0047586500FEF7E900FEF7
      E900FEF7E900FEF7E900FEF7E900122D470000000000696969FFDCDCDDFFD9D9
      DAFFD6D6D7FFD3D3D4FFD0D0D1FFA7593BFF8A462EFFC7C7C8FFC4C4C5FFC1C1
      C2FFBFBFC0FFBDBDBEFF191919FF000000008FD1FDFF98D5FDFF9DD8FDFFA3DA
      FDFFA6DCFCFF93D1FAFF91AABCFF98BCD4FF8AA3B2FF818082FF84A3B8FF85CE
      FDFF7CCAFEFF71C5FDFF66C1FDFF7AC9FDFF00000000515151FFB97400FF5151
      51FF000000000000000000000000435F5FFF0F2A2BFF465764FF8EC2EDFF7FB7
      E6FF71ADE0FF63A2DAFF5598D4FF122C46FF0000000000000000000000000000
      000000000000000000000000000044606000FEF7E90047586500FEF7E900FEF7
      E900FEF7E900FEF7E900FEF7E900122D470000000000696969FFE0E0E1FFE0E0
      E1FFDADADBFFD7D7D8FFD4D4D5FFD1D1D2FF9C9C9DFF9E9EA0FFC8C8C9FFC5C5
      C7FFC2C2C3FFC0C0C1FF191919FF0000000099D6FEFFA3D9FEFFA9DDFCFFAADC
      FDFF73C6FCFF78C7F9FF98B3C5FF82888CFF7F7F80FF7F8081FF7CB9E0FF2FAA
      FCFF4AB5FDFF5FBEFDFF67C1FCFF62BDFDFF00000000515151FFB97400FF5151
      51FF000000000000000000000000435F5FFF64E3E6FF465764FFA2D2F5FF94C8
      EFFF85BCE9FF77B1E3FF69A7DDFF122C46FF0000000000000000000000000000
      000000000000000000000000000044606000FEF7E90047586500FEF7E900FEF7
      E900FEF7E900FEF7E900FEF7E900122D470000000000696969FFE4E4E5FFE1E1
      E2FFDEDEDFFFDBDBDCFFD8D8D9FFA7593BFF7F402AFFA0A0A1FFCCCCCDFFCACA
      CBFFC7C7C8FFC3C3C4FF191919FF00000000A3DAFEFFADDDFEFF90D2FBFF75C6
      FBFF8FC2E3FF959EA5FFA5A5A5FF807F80FF807F7FFF889199FF4DB6FBFF3CAF
      FCFF84CCFBFF0198FDFF139FFCFF63C0FDFF00000000515151FFB97400FF5151
      51FF000000000000000000000000435F5FFF77E7E9FF465764FFB5E0FEFFA8D6
      F8FF9ACCF2FF8CC1ECFF7DB6E5FF122C46FF0000000000000000000000000000
      000000000000625B56004138310044606000FEF7E90047586500B5B7B400737E
      8500737E8500737E8500B5B7B400122D470000000000696969FFE8E8E9FFE5E6
      E6FFE3E3E3FFE0E0E0FFDCDCDDFFB67F6BFF7F402AFFA4A4A5FFADADAEFFCDCD
      CEFFCBCBCCFFC8C8C9FF191919FF00000000ACDDFDFF95D4FCFF85C7F0FF93A6
      B3FFA3A3A3FFE2E2E2FFF8F8F8FF999999FF7F7F7FFF97B6CBFF1FA4FDFFA2D9
      FCFF95D3FCFF39AFFCFF35ADFDFF85CCFDFF00000000515151FFB97400FF5151
      51FF00000000615A55FF403730FF435F5FFF89EAECFF465764FF94B1C0FF6279
      89FF5F7688FF5C7486FF7399B6FF122C46FF0000000000000000000000000000
      000000000000625B5600FEF7E90044606000FEF7E90047586500B5B7B400737E
      8500737E8500737E8500B5B7B400122D470000000000696969FFECECEDFFEAEA
      EAFFE7E7E7FFE4E4E4FFE1E1E1FFDEDEDEFFA7593BFF7F402AFFB8B8B9FFB8B8
      B9FFCFCFD0FFCCCCCDFF191919FF00000000B1DFFDFFBBE1F8FF8E9399FFD1D2
      D1FFAAAAA9FFEFEFEFFFD4D4D4FFCFCFCFFF858889FF73C0F4FF0299FDFF31AB
      FBFF8ACFFCFF48B4FCFF6FC4FCFFAFDEFDFF00000000626262FF515151FF6262
      62FF00000000615A55FFEED0B8FF435F5FFF9CEDEFFF465764FF9EB8C0FF667C
      89FF637A89FF607788FF80A2BCFF122C46FF0000000000000000000000000000
      000000000000625B5600FEF7E90044606000FEF7E90047586500FEF7E900FEF7
      E900FEF7E900FEF7E900FEF7E900122D470000000000696969FFF0F0F0FFEDED
      EEFFEBEBEBFFE8E8E8FFC7C7C9FFC7C7C9FFDFDFE0FFA35537FF9A6E5FFFC7C7
      C9FFD3D3D4FFD0D0D1FF191919FF00000000B5E1FDFFC4E6FDFFA2AFB7FFDBDB
      DBFFB5B5B5FFE5E5E5FFC7C7C7FFF7F7F7FF9CA2A7FF9BC9E7FF5CBCF9FF31AB
      FCFF19A2FDFF33ADFCFF83CBFCFFA1D8FDFF00000000A2A2A2FF515151FF0000
      000000000000615A55FFF0D6C0FF435F5FFFADF1F2FF465764FFE8FFFFFFDEFD
      FFFFD3F5FFFFC7EDFFFFB9E3FFFF122C46FF0000000000000000000000000000
      000000000000625B5600FEF7E90044606000D9D9CE0047586500475865004758
      65004758650047586500475865004758650000000000696969FFF4F4F4FFF1F1
      F1FFEFEFEFFFBB8570FF7F402AFFC7C7C9FFE3E3E4FFA35537FF7F402AFFC7C7
      C9FFD7D7D8FFD4D4D5FF191919FF00000000B6E2FEFFC4E7FEFFC8DDECFFA4A6
      A7FFE9E9EAFFB1B1B1FFE6E6E6FFDCDCDCFFC1C1C1FF817F81FF878E92FF91A7
      B6FF84B8D9FF81C8F8FF7DCBFCFF7FCAFDFF00000000515151FF515151FF5151
      51FF00000000615A55FFF2DBCAFF435F5FFFA5D6D7FF465764FF465764FF4657
      64FF465764FF465764FF465764FF465764FF0000000000000000000000000000
      000000000000625B5600FEF7E90044606000D9D9CE0080908C0080908C008090
      8C00D9D9CE000F2B2C00000000000000000000000000696969FFF7F7F7FFF5F5
      F5FFF2F2F2FFA7593BFF7F402AFFC7C7C9FFC7C7C9FFA35537FF6F3725FFC7C7
      C9FFDBDBDCFFD8D8D9FF191919FF00000000B5E0FDFFC4E6FEFFD1EBFDFFA0A8
      ADFFE6E5E5FFACACACFFEFEFEFFFDEDEDEFFE7E7E7FF808081FF807F7FFF7F7F
      7FFF807F7FFF808E96FF7FC8FAFF6BC2FDFF0000000000000000515151FF0000
      000000000000615A55FFF4E1D3FF435F5FFFB1D8D9FF6C8F8FFF688E8EFF658D
      8EFF8DD2D3FF0F2A2BFF00000000000000000000000000000000000000000000
      000000000000625B5600FEF7E90044606000FEF7E900FEF7E900FEF7E900FEF7
      E900FEF7E9000F2B2C00000000000000000000000000696969FFFAFAFAFFF8F8
      F8FFF5F5F6FFBD8773FF7F402AFF7F402AFF7F402AFFA35537FF9D7263FFE3E3
      E3FFC7C7C9FFC7C7C9FF191919FF00000000B2DFFDFFBDE3FDFFC9E9FDFFBFD4
      E1FFB4B4B5FFE9E9E9FFCBCBCBFFEAEAEAFF949494FF7F7F7FFF7F7F7FFF8081
      81FF8494A0FF84B5D5FF7DC8FCFF6EC4FCFF0000000000000000515151FF0000
      000000000000615A55FFF6E7DBFF435F5FFFDBF9F9FFD2F7F8FFC8F5F6FFBCF3
      F4FFB1F1F2FF0F2A2BFF00000000000000000000000000000000000000000000
      000000000000625B5600DFD8CC00446060004460600044606000446060004460
      60004460600044606000000000000000000000000000696969FFFCFCFCFFFAFA
      FBFFF8F8F9FFF6F6F7FFBE8773FFA7593BFFA7593BFFBB8571FFEAEAEAFF6969
      69FF191919FF191919FF191919FF00000000B0DEFDFFB6E1FDFFC1E5FDFFC9E7
      FCFFB0B7BBFFF4F4F5FFBCBCBDFFF3F3F3FF8C8C8CFF818384FF8FA2B1FF97C6
      E5FF91D3FCFF85CCFDFF77C8FDFF6BC2FDFF0000000000000000515151FF0000
      000000000000615A55FFDACFC7FF435F5FFF435F5FFF435F5FFF435F5FFF435F
      5FFF435F5FFF435F5FFF00000000000000000000000000000000000000000000
      000000000000625B5600DFD8CC00948D8500948D8500948D8500DFD8CC004138
      31000000000000000000000000000000000000000000696969FFFEFEFEFFFDFD
      FDFFFBFBFBFFF9F9F9FFF7F7F7FFF5F5F5FFF3F3F3FFF0F0F0FFEDEDEEFF6969
      69FFE8E8E8FFC7C7C9FF696969FF0000000096D2FCFFB1DEFCFFB6E1FEFFBCE3
      FDFFAAC5D5FFAFAEAFFFBBBDBBFF8D9397FF9AB2C3FFA7D5F3FFA1D8FDFF97D4
      FEFF8BCFFEFF7ECAFDFF72C6FEFF66C0FEFF0000000000000000515151FF0000
      000000000000615A55FFDCD4CDFF918983FF918882FF918781FFD8CABEFF4037
      30FF000000000000000000000000000000000000000000000000000000000000
      000000000000625B5600FEF7E900FEF7E900FEF7E900FEF7E900FEF7E9004138
      31000000000000000000000000000000000000000000696969FFFFFFFFFFFFFF
      FFFFFDFDFDFFFCFCFCFFFAFAFAFFF8F8F8FFF6F6F6FFF4F4F4FFF1F1F1FF6969
      69FFC7C7C9FF696969FF000000000000000095D2FDFFA0D7FCFFA7DCFDFFAFDE
      FDFFB1DEFAFF91A1ACFFA1BED3FFADDBF8FFA9DCFDFFA2D9FDFF98D5FDFF8ED1
      FDFF83CCFEFF78C8FEFF6CC3FEFF61BEFEFF0000000000000000515151FF0000
      000000000000615A55FFFCF6F2FFFBF4EEFFFAF1EAFFF9EEE6FFF8ECE2FF4037
      30FF000000000000000000000000000000000000000000000000000000000000
      000000000000625B5600625B5600625B5600625B5600625B5600625B5600625B
      56000000000000000000000000000000000000000000696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF00000000000000000000000093D2FDFF91D1FCFFB1DEFDFFAFDE
      FDFFA5DAFDFFA5DBFCFFA6DAFDFFA2D9FDFF9DD7FEFF96D4FEFF8ED0FDFF85CD
      FEFF7AC9FEFF71C5FDFF64C0FEFF5ABCFCFF0000000000000000000000000000
      000000000000615A55FF615A55FF615A55FF615A55FF615A55FF615A55FF615A
      55FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A9
      00FF006C00FF006C00FF006C00FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF191919FF000000006560570079706500BAA3
      8A007360550042404E002B30460045464E0028476A002E5277002B5B8C00324C
      6B00304664002E4360003A485D00434B5C000000000000000000000000000000
      00000000000000000000203E5C00FFFFFF00FFFFFF0047586500122D4700122D
      4700122D4700122D4700122D4700122D4700000000004D7BA9FF15528DFF1552
      8DFF15528DFF15528DFF15528DFF15528DFF15528DFF15528DFF15528DFF1552
      8DFF15528DFF15528DFF15528DFF0000000000000000000000000000000000A9
      00FF73DA7EFF73DA7EFF006C00FF3D71A2FF376C9FFF30679CFF296298FF235D
      95FF1D5992FF18558FFF14497DFF191919FF5D59540057524E00807E7C00DDDE
      DC005C585E00332F3D00433C3D004A4C5400285482003F84C6003E7DB9003277
      BD0049596F00697FB3008E93A60094949C0086B2DF0086B2DF0086B2DF0086B2
      DF0086B2DF0086B2DF00203E5C00FFFFFF00FFFFFF004758650066A5DB00589A
      D5004A90CF003D87C900317EC400122D4700000000004D7BA9FF9FCAE0FF93C2
      DEFF87B9D7FF79AFCFFF78AFCFFF6DA4C7FF73ACCDFF75ADCEFF75ADCEFF75AD
      CEFF79B1D0FF528EB5FF15528DFF0000000000000000000000000000000000A9
      00FF73DA7EFF73DA7EFF006C00FF5189BFFF4883BAFF407CB6FF3776B1FF3070
      ADFF286BAAFF2165A6FF1A5893FF191919FF74655A00715E4E00B0ACA900CED2
      D100615C5B00343B3F0070634D0065605C0021486B004B789800758A98004A5B
      6C004F392600888AB8009998AA0092949C004A5B7B004A5B7B004A5B7B004A5B
      7B00577DA8007CA8D500203E5C00FFFFFF00FFFFFF00475865007AB4E4006CA9
      DE005E9FD7005095D100438BCC00122D4700000000004D7BA9FFD3F4F8FFD3F6
      FFFFD1F6FFFFD0F6FFFFCDF4FFFFA8D5EBFFBEE8FAFFC7F2FFFFC5F2FFFFC5F2
      FFFFD0FAFFFF7BB3D3FF15528DFF0000000000A900FF006C00FF006C00FF006C
      00FF73DA7EFF73DA7EFF006C00FF006C00FF006C00FF006C00FF447FB8FF3B79
      B3FF3373AFFF2C6DABFF235D95FF191919FF6B625D00756A6000CCC9C5007774
      640039483C001F3F3E002E454800373E42001A353E003D5952009C8B6C00624E
      39003A4764007187CF009A98A3008C929B004A5B7B004A5B7B004A5B7B00577D
      A8007CA8D500203E5C00FFFFFF00446060000F2B2C00475865008FC3ED0080B8
      E60072AEE00064A3DA005699D400122D4700000000004D7BA9FFC8EAF2FFB7DF
      EEFFB5DEEEFFB4DEEFFFBBE4F6FFA2D0E7FFB3DFF1FFACDAEDFFABD9ECFFABD9
      ECFFB6E4F3FF75ADCEFF15528DFF0000000000A900FF73DA7EFF73DA7EFF73DA
      7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF006C00FF5089BEFF4882
      BAFF3F7CB5FF3776B1FF2C649AFF191919FF5457650054657D00909397003741
      4000142347002A2D49003F3E530049485E0046466000383F6400504E79008970
      7000516BA6005A7AC5008F8F9F00AA9E9B004A5B7B004A5B7B00577DA8007CA8
      D500203E5C00FFFFFF00FFFFFF004460600065E3E60047586500A3D2F50095C8
      EF0086BDE90078B2E3006AA8DD00122D4700000000004D7BA9FFD7F3F8FFD4F4
      FFFFD1F2FFFFCDF1FFFFCAEFFFFFA3D1E7FFBBE5F7FFC1ECFEFFBEEBFDFFBCEA
      FCFFC5F2FFFF75ADCEFF15528DFF0000000000A900FF73DA7EFF73DA7EFF73DA
      7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF006C00FF5E93C5FF558C
      C1FF4C85BCFF437FB8FF366C9FFF191919FF5377B600425B860045405B001315
      5E003F3E6100978C8A00B7AFAD00C1B8B600BBB3B200AEA5A400837E87007B6A
      6600425762002B4F8700788CB500C0A691004A5B7B005983AF007CA8D500203E
      5C00FFFFFF00FFFFFF00FFFFFF004460600078E7E90047586500B6E0FE00A9D6
      F8009BCCF2008DC2EC007EB7E500122D4700000000004D7BA9FFDDEEF4FFBADF
      EDFFB8DEECFFB6DDECFFBAE1F1FFA4D1E7FFB6DFF1FFAEDAECFFACD8EBFFAAD8
      EBFFB5E2F1FF75ADCEFF15528DFF0000000000A900FF00A900FF00A900FF00A9
      00FF73DA7EFF73DA7EFF006C00FF00A900FF00A900FF00A900FF6C9DCDFF6296
      C9FF598FC3FF5088BEFF4174A4FF191919FF3C6380006C849100373457002740
      5A007E797700CAC1C200D3C9C900D3C9C800D8CBCA00D3C9C800A3A0A2006166
      7100455C5300646B730098979700B4A89C006593C0007CA8D500203E5C00FFFF
      FF00FFFFFF00625B560041383100446060008AEAEC004758650095B2C100637A
      8A00607789005D758700749AB700122D4700000000004D7BA9FFE6F3F7FFD6F3
      FCFFD5F3FCFFD2F2FCFFD1F2FFFFA4D1E7FFB9E1F2FFB3DDEEFFB1DCEEFFB8E3
      F5FFC3EEFBFF76AECFFF15528DFF0000000000000000000000000000000000A9
      00FF73DA7EFF73DA7EFF006C00FF96BDE3FF3798D0FF0F70A8FF3E83B6FF3D8F
      C4FF0E73B0FF2470A6FF4C7CAAFF191919FF40655D0072887600435752004A73
      6B0097919200BBB6BD00C9C1C100CAC5C500A59D990095959B00536CB400426C
      D8006479B1008C7E7400B0AAA400C0BEBB00366CA200203E5C00FFFFFF00FFFF
      FF00FFFFFF00625B5600EED0B900446060009DEDEF00475865009FB9C100677D
      8A00647B8A006178890081A3BD00122D4700000000004D7BA9FFE0EEF3FFC1E3
      EEFFC1E4EFFFBFE3EFFFC4E7F3FFAAD5EAFFC2E8F7FFCDF1FFFFC9EFFFFFC5ED
      FEFFCDF4FFFF78AFCFFF15528DFF0000000000000000000000000000000000A9
      00FF73DA7EFF73DA7EFF006C00FFA4C8EAFF2990CAFF02B4DFFF0580B5FF0A92
      CDFF01B0E2FF1A72AAFF5885B0FF191919FF6D7F6F00556D610040574D005077
      7400A29C9E00A1A3AE008E93A60082899C004F5C7700375AA7004C80F0005C94
      FF006285DA007770750097928D00F6F3F000FFFFFF000C8C0C00FFFFFF00FFFF
      FF00FFFFFF00625B5600F0D6C10044606000AEF1F20047586500E8FFFF00DEFD
      FF00D3F5FF00C7EDFF00BAE3FF00122D4700000000004D7BA9FFE7F2F6FFD6F1
      F8FFDBF5FBFFD7F3FBFFD7F4FCFFAFD8ECFFBDE2F2FFB7DFEDFFB3DCEDFFB2DC
      EDFFC0E9F4FF7AB0D0FF15528DFF0000000000000000000000000000000000A9
      00FF00A900FF00A900FF00A900FFB1D2F1FF4897C8FF0BC7ECFF03E2FFFF00D8
      FFFF07BEECFF3587BCFF648EB6FF191919FF6D77730058786F00486C61003A5E
      5B00838594006B78A500495C8500355EB4003F71D3005798FF0064A9FF005794
      FB0097A2C60065605D0076767400E5E1DD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600F2DBCA0044606000A6D6D70047586500475865004758
      650047586500475865004758650047586500000000004D7BA9FFF1F8FAFFE7FC
      FFFFE5FBFFFFE2FAFFFFE0F9FFFFAFD8ECFFC8EAF7FFD5F5FFFFD1F2FFFFCDF1
      FFFFD4F7FFFF7EB2D1FF15528DFF000000000000000000000000000000000000
      0000000000008B8B8BFFA4B0BBFF8699A6FF2F91BEFF3AE2F7FF24E3FFFF09D9
      FFFF00C8F4FF1771A2FF6693BAFF191919FF6278A00045647F00596E6E00475C
      70006783C800B7BCCE00A0A2A5002E54A4004776CF00628BC200879DBF00648B
      CB0099A4C800585552004243410097929000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600F4E1D30044606000B2D8D9006D909000698F8F00668E
      8F008ED2D3000F2B2C00FFFFFF00FFFFFF00000000004D7BA9FFF3F8FAFFD4EE
      F3FFCCE8F0FFD5EFF6FFE2FAFEFFB0D8ECFFC2E5F3FFC2E5F1FFC7E9F6FFBDE3
      F1FFC0E6F1FF92C0DBFF15528DFF000000000000000000000000000000000000
      0000000000008B8B8BFFA2A7ABFF4498C4FF2FCFEDFF7EF5FCFF5FEFFFFF2EE5
      FFFF07D8FCFF03BAE7FF277FB3FF191919FF7396C1003D89E100407CC8004C61
      9E006166B600A0B2DB008595C3003F62B800394B850058525E00C7B09700D0C2
      BD00D7CBCE009188800077716A008F847A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600F6E7DB0044606000DBF9F900D2F7F800C8F5F600BDF3
      F400B2F1F2000F2B2C00FFFFFF00FFFFFF00000000004D7BA9FFF5F9FBFFECFF
      FFFFEBFEFFFFE9FDFFFFE6FCFFFFB0D8ECFFCCEBF7FFDEF8FFFFDAF6FFFFD6F5
      FFFFDAF9FFFF9AC7DFFF15528DFF000000000000000000000000000000000000
      0000000000008B8B8BFFB1BBC1FF78A5BEFF4F9BC0FF379AC7FF81EAF7FF4ADB
      F1FF1A86BAFF3B8EBAFF5E99C2FF191919FF6B99C3004EABFF0060CBFF0059A6
      F900826D9D003562B3002B4699002D50A0002F5AAF003A69B60084AAD00088A5
      CD008BACD4008FA4BF009A90830090887D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600DACFC700446060004460600044606000446060004460
      60004460600044606000FFFFFF00FFFFFF00000000004D7BA9FFEEF2F7FFF4F8
      FBFFF3F8FBFFF2F8FAFFF1F7FAFFD0EAF6FFE1F5F9FFDDF5F8FFD9F4F8FFCFEB
      F2FFCDEAF1FFAED2E6FF15528DFF000000000000000000000000000000000000
      0000000000008B8B8BFFE5F9FFFFDFF4FFFFD8EFFFFFADD7F3FF31B9DEFF38A4
      CCFF97C5E8FFB0D2F0FF96B5D3FF191919FF6780E1005687DF0057A2EA005874
      A100635E8300517EBB00477FBE005489BF005C8FBE006690BE005D91C9006E9C
      D1006497D2007397BF00A59C8F00A0998F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600DCD4CD00928A84009289830092888200D8CABF004138
      3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000004D7BA9FF4D7BA9FF4D7B
      A9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7BA9FF4D7B
      A9FF4D7BA9FF4D7BA9FF4D7BA9FF000000000000000000000000000000000000
      0000000000008B8B8BFFE0EFF0FFDCECF0FFD7E9F0FFD1E4F0FF65A9CFFF64A8
      CFFFBDD6EDFFB8D2EAFFA1B9D0FF191919FF7074FF006E6EF90049489F006E79
      8800A8A9C400B6B5C8006D94BD007B91AC00B8B2B4007A97BB006799CF00719C
      D1006997CF00EAF8FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600FCF6F200FBF4EE00FAF1EA00F9EEE600F8ECE2004138
      3100FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
      8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFFABB0FF00A5A8FB00C9C9F700A7EC
      DE00F8FCFB00FFFEFE007394BC007D95B300C5BDBC007C9CC3006799CF006F9B
      D000E1F2FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00625B5600625B5600625B5600625B5600625B5600625B5600625B
      5600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000004159A8FF4141
      A6FF4141A5FF4141A2FF4141A0FF41419EFF41419CFF41419AFF414198FF4141
      96FF414195FF616195FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF000000000000000000000000000000000000
      0000000000000000000000000000A59E84FF938B71FF00000000000000000000
      000000000000000000000000000000000000000000004979D0FF0003E6FF0000
      E5FF0000E5FF2A2AE9FF2323E8FF6666EEFF5A5AECFF3333E9FF0000E3FF0000
      E3FF0000E3FF2E2EC6FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FF004ED9FF89A3
      D4FF004ED9FFCBCBCCFF004ED9FF819CCDFFC2C2C3FF92A4C7FF004ED9FFBBBB
      BCFF004ED9FF004ED9FF191919FF00000000000000000000000000000000A59E
      84FF938B71FF0000000000000000A59E84FF938B71FF0000000000000000938B
      71FF938B71FF000000000000000000000000000000004971D1FF0000E8FF0000
      E8FF0000E8FF3131ECFF8686F3FF7070F1FF6C6CF1FF6E6EF1FF0000E8FF0000
      E8FF0000E8FF2F2FCCFF00000000000000000000000000000000000000000000
      000000A900FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FF4078D8FF004E
      D9FF3E76D7FFCFCFD0FF004ED9FF668DD1FF004ED9FF638ACEFF004ED9FFBEBE
      BFFF004ED9FFBABABBFF191919FF00000000000000000000000000000000A59E
      84FFD5C591FFD5C591FF938B71FFD5C591FFD5C591FF938B71FFD5C591FFD5C5
      91FF938B71FF00000000000000000000000000000000B1BBD2FFB3B3EBFFB3B3
      EBFFB2B2EAFFB3B3EBFFB3B3EBFFB3B3EBFFB3B3EBFFB3B3EBFFB3B3EBFFB3B3
      EBFFB3B3EBFFAAAAD1FF0000000000000000929292FF00000000000000000000
      000000A900FF00000000006C00FF006C00FF006C00FF006C00FF006C00FF006C
      00FF0000000000000000000000000000000000000000696969FF90ABDBFF004E
      D9FF8CA7D7FFD3D3D4FF004ED9FF004ED9FFCACACBFF004ED9FF004ED9FFC1C1
      C2FF004ED9FFBDBDBEFF191919FF0000000000000000A59E84FFBFB38CFF0000
      0000BFB38CFFD5C591FFD5C591FFD5C591FFD5C591FFD5C591FFD5C591FFBFB3
      8CFF00000000938B71FF938B71FF0000000000000000D3D3D3FFEEEEEEFF6C7F
      F1FF6D7EE7FFBEC4E3FFEDEDEDFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFEEEE
      EEFFEEEEEEFFD4D4D4FF00000000000000000000000000000000000000000000
      000000A900FF006C00FF63E170FF5BDF69FF53DC62FF4BDA5BFF44D854FF3DD6
      4DFF006C00FF00000000000000000000000000000000696969FF004ED9FF93AE
      DEFF004ED9FFD7D7D8FF004ED9FF89A4D4FFCECECFFF85A0D0FF004ED9FFC5C5
      C7FF004ED9FFC0C0C1FF191919FF0000000000000000A59E84FFD5C591FFBFB3
      8CFFD5C591FFD5C591FFD5C591FFAAA288FFAAA288FFD5C591FFD5C591FFD5C5
      91FFBFB38CFFD5C591FF938B71FF0000000000000000D4D4D4FFF1F1F1FFC7CD
      F3FF7989EBFF6175EAFFDFE0E8FFF1F1F1FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFD8D8D8FF0000000000000000929292FF00000000000000000000
      000000A900FF76E781FF6DE47AFF65E273FF5DDF6BFF006C00FF00A900FF00A9
      00FF00A900FF006C00FF000000000000000000000000696969FFE4E4E5FFE1E1
      E2FFDEDEDFFFDBDBDCFFD8D8D9FFD5D5D6FFD2D2D3FFCFCFD0FFCCCCCDFFCACA
      CBFFC7C7C8FFC3C3C4FF191919FF000000000000000000000000D5C591FFD5C5
      91FFD5C591FFD5C591FF00000000000000000000000000000000D5C591FFD5C5
      91FFD5C591FFD5C591FF000000000000000000000000D6D6D6FFF5F5F5FFF5F5
      F5FFECEDF5FF8D9CF6FF596FEDFFC5CAEBFFF1F2F2FFF4F4F4FFD7DBF1FFE8E9
      EDFFF3F3F3FFDBDBDBFF00000000000000000000000000000000000000000000
      000000A900FF80EA8BFF78E784FF70E57DFF68E375FF006C00FF000000000000
      00000000000000A900FF00A900FF0000000000000000696969FFE8E8E9FFE5E6
      E6FFE3E3E3FFE0E0E0FFDCDCDDFF006C00FFD6D6D7FFD3D3D4FFD0D0D1FFCDCD
      CEFFCBCBCCFFC8C8C9FF191919FF000000000000000000000000A59E84FFD5C5
      91FFD5C591FF000000000000000000000000000000000000000000000000D5C5
      91FFD5C591FF938B71FF000000000000000000000000D7D7D7FFF7F7F7FFF7F7
      F7FFF7F7F7FFF7F7F7FF677CF4FF9CA8EEFF8091F0FF677BF1FF2947F4FF697C
      EAFFF3F3F3FFDEDEDEFF0000000000000000929292FF00000000000000000000
      000000A900FF8BED95FF83EB8EFF7BE886FF006C00FF00000000000000000000
      00000000000000000000000000000000000000000000696969FFECECEDFFEAEA
      EAFFE7E7E7FFDEDFE1FF00A900FF73DA7EFF006C00FFD5D6D7FFD5D5D5FFD2D2
      D2FFCFCFD0FFCCCCCDFF191919FF00000000938B71FF938B71FFD5C591FFD5C5
      91FF938B71FF000000000000000000000000000000000000000000000000AAA2
      88FFD5C591FFD5C591FF938B71FF938B71FF00000000D8D8D8FFF9F9F9FFF9F9
      F9FFF9F9F9FFF9F9F9FFA8B4F9FFABB4EBFFB9C3F9FF5D73F2FFCBD2F8FFE0E3
      F9FFF7F7F7FFE0E0E0FF00000000000000000000000000000000000000000000
      000000A900FF00A900FF00A900FF00A900FF00A900FF00A900FF00A900FF006C
      00FF006C00FF006C00FF006C00FF006C00FF00000000696969FFF0F0F0FFEDED
      EEFFEBEBEBFF00A900FF73DA7EFF73DA7EFF73DA7EFF006C00FFD9D9DAFFD6D6
      D7FFD3D3D4FFD0D0D1FF191919FF00000000A59E84FFA59E84FFD5C591FFD5C5
      91FF938B71FF000000000000000000000000000000000000000000000000AAA2
      88FFD5C591FFD5C591FFA59E84FFA59E84FF00000000D9D9D9FFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFE9ECFBFF697CEDFF435DF5FFE6E8F5FFFCFCFCFFFCFC
      FCFFFAFAFAFFE2E2E2FF0000000000000000929292FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000006C
      00FF88EC93FF80EA8BFF78E784FF006C00FF00000000696969FFF4F4F4FFF1F1
      F1FF00A900FF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF006C00FFDADA
      DBFFD7D7D8FFD4D4D5FF191919FF000000000000000000000000A59E84FFD5C5
      91FFD5C591FF000000000000000000000000000000000000000000000000D5C5
      91FFD5C591FF938B71FF000000000000000000000000DADADAFFFCFCFCFFFBFB
      FBFFFCFCFCFFFBFBFBFFFBFBFBFF3C57F7FF96A3F0FFFBFBFBFFF9F9F9FFF5F5
      F5FFF2F2F2FFDCDCDCFF00000000000000000000000000000000000000000000
      00000000000000A900FF006C00FF000000000000000000000000006C00FF9BF2
      A4FF93EF9DFF8BED95FF83EB8EFF006C00FF00000000696969FFF7F7F7FF00A9
      00FF00A900FF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF00A900FF006C
      00FFDBDBDCFFD8D8D9FF191919FF000000000000000000000000D5C591FFD5C5
      91FFD5C591FFD5C591FF00000000000000000000000000000000D5C591FFD5C5
      91FFD5C591FFD5C591FF000000000000000000000000DBDBDBFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFF8F8FCFF334FF7FFE9EAF1FFF9F9F9FFF0F0F0FFE8E8
      E8FFE4E4E4FFD3D3D3FF0000000000000000929292FF00000000000000000000
      0000000000000000000000A900FF006C00FF006C00FF006C00FFACF7B4FFA5F5
      ADFF9DF2A6FF96F09FFF8EEE98FF006C00FF00000000696969FFFAFAFAFFF8F8
      F8FFF5F5F6FF00A900FF73DA7EFF73DA7EFF73DA7EFF006C00FFE5E6E6FFE3E3
      E3FFE0E0E0FFDCDCDDFF191919FF0000000000000000A59E84FFD5C591FFBFB3
      8CFFD5C591FFD5C591FFD5C591FF938B71FF938B71FFD5C591FFD5C591FFD5C5
      91FFBFB38CFFD5C591FF938B71FF0000000000000000DBDBDBFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFCAD1FBFF0E31F7FFD8DCEEFFF4F4F4FFE2E2E2FFE9E9
      E9FFDDDDDDFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000A900FFC3FECAFFBDFCC3FFB6FABDFFAFF8
      B6FFA7F5AFFFA0F3A8FF00A900FF006C00FF00000000696969FFFCFCFCFFFAFA
      FBFFF8F8F9FF00A900FF73DA7EFF73DA7EFF73DA7EFF006C00FFEAEAEAFF6969
      69FF191919FF191919FF191919FF0000000000000000A59E84FFA59E84FF0000
      0000BFB38CFFD5C591FFD5C591FFD5C591FFD5C591FFD5C591FFD5C591FFBFB3
      8CFF00000000A59E84FFA59E84FF0000000000000000DCDCDCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFCED4FBFF1A3AF6FFE0E2F1FFF2F2F2FFEFEFEFFFEDED
      EDFF00000000000000000000000000000000929292FF00000000000000000000
      00000000000000000000000000000000000000A900FF00A900FF00A900FF00A9
      00FF00A900FF00A900FF00000000006C00FF00000000696969FFFEFEFEFFFDFD
      FDFFFBFBFBFF00A900FF00A900FF00A900FF00A900FF00A900FFEDEDEEFF6969
      69FFE8E8E8FFC7C7C9FF696969FF00000000000000000000000000000000A59E
      84FFD5C591FFD5C591FFA59E84FFD5C591FFD5C591FFA59E84FFD5C591FFD5C5
      91FF938B71FF00000000000000000000000000000000DCDCDCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFEEF0FCFFFBFBFBFFF3F3F3FFE7E7E7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000A900FF00000000696969FFFFFFFFFFFFFF
      FFFFFDFDFDFFFCFCFCFFFAFAFAFFF8F8F8FFF6F6F6FFF4F4F4FFF1F1F1FF6969
      69FFC7C7C9FF696969FF0000000000000000000000000000000000000000A59E
      84FFA59E84FF0000000000000000A59E84FF938B71FF0000000000000000A59E
      84FFA59E84FF00000000000000000000000000000000E4E4E4FFF7F7F7FFF7F7
      F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF3F3F3FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A59E84FF938B71FF00000000000000000000
      00000000000000000000000000000000000000000000F1EFF000A49E9700DDD3
      CC00F5F0F000444250009E9DA5009E9B9D0028476A002F5377002B5B8C004E62
      7A00E6E0D800E7E1DC00F0F0F000E7E2DD0000000000696969FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF0000000000000000A2A2A2FF515151FF9A9A
      9AFF000000000000000000000000000000000000000000000000515151FF5151
      51FF515151FF0000000000000000000000000000000000000000000000000000
      00000000000000000000515151FF000000000000000000000000000000000000
      000000000000000000000000000000000000E7EAF100D9DCE90088868600DEDF
      DF00F5EDE700423D4A00D3CCC700CFCBC900285482004386C60099B4CD0096AA
      BE00D1CCC500D8D2CC00F0EDE800E2DDD80000000000696969FF004ED9FF89A3
      D4FF004ED9FFCBCBCCFF004ED9FF819CCDFFC2C2C3FF92A4C7FF004ED9FFBBBB
      BCFF004ED9FF004ED9FF191919FF0000000000000000515151FFB97400FF5151
      51FF000000000000000000000000000000000000000000000000515151FF546F
      EEFF515151FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000515151FF0000000000000000000000000000
      000000000000000000000000000000000000F7F4F100F7F1ED00B0ACA900DDDE
      DC00FBF5F100383F4200BCB3A700C9C3BF0021486B00527C9B00F0ECE600D2CA
      C400B9ADA400D3C9C200E7DDD500D5CCC40000000000696969FF4078D8FF004E
      D9FF3E76D7FFCFCFD0FF004ED9FF668DD1FF004ED9FF638ACEFF004ED9FFBEBE
      BFFF004ED9FFBABABBFF191919FF0000000000000000515151FFB97400FF5151
      51FF000000000000000000000000000000000000000000000000515151FF546F
      EEFF515151FF0000000000000000000000000000000000000000000000000000
      00000000000000000000515151FF515151FF515151FF00000000000000000000
      000000000000000000000000000000000000F5EFEA008E837900CCC9C5008C88
      7A00404E42001F3F3E002E454800393F43001A353E003D595200BEB49F00E0D8
      CC003B4864009FA9D200F0F0EE00E5DFD90000000000696969FF90ABDBFF004E
      D9FF8CA7D7FFD3D3D4FF004ED9FF004ED9FFCACACBFF004ED9FF004ED9FFC1C1
      C2FF004ED9FFBDBDBEFF191919FF0000000000000000515151FFB97400FF5151
      51FF000000000000000000000000000000000000000000000000515151FF546F
      EEFF515151FF0000000000000000000000000000000000000000000000000000
      0000515151FF515151FF515151FF515151FF515151FF515151FF515151FF0000
      000000000000000000000000000000000000D8D4D40054657D00919498003842
      4100142347002A2D49003F3E530049485E0046466000383F6400504E7900DFD4
      C600526CA6005B7AC500A5A5B100E6E2DD0000000000696969FF004ED9FF93AE
      DEFF004ED9FFD7D7D8FF004ED9FF89A4D4FFCECECFFF85A0D0FF004ED9FFC5C5
      C7FF004ED9FFC0C0C1FF191919FF0000000000000000515151FFB97400FF5151
      51FF000000000000000000000000000000000000000000000000515151FF5151
      51FF515151FF000000000000000000000000000000000000000000000000A1A1
      A1FFBEBBB8FF515151FFA1A1A1FFBEBBB8FF515151FFA1A1A1FFBEBBB8FF5151
      51FF000000000000000000000000000000005377B600435C8600746E7F001315
      5E003F3E6100978C8A00B7AFAD00C1B8B600BBB3B200AEA5A400837E87007F6E
      6A00435862002B4F8700788CB500E3DCD60000000000696969FFE4E4E5FFE1E1
      E2FFDEDEDFFFDBDBDCFFD8D8D9FFD5D5D6FFD2D2D3FFCFCFD0FFCCCCCDFFCACA
      CBFFC7C7C8FFC3C3C4FF191919FF0000000000000000515151FFB97400FF5151
      51FF000000000000000000000000000000000000000000000000515151FF5151
      51FF00000000000000000000000000000000000000000000000000000000A1A1
      A1FFBEBBB8FF515151FF515151FFBEBBB8FF515151FF515151FFBEBBB8FF5151
      51FF000000000000000000000000000000003C6380008497A2003B385A002740
      5A007E797700CAC1C200D3C9C900D3C9C800D8CBCA00D3C9C800A3A0A2006166
      7100465D54006B72790098979700B6AA9E0000000000696969FFE8E8E9FFE5E6
      E6FFE3E3E3FF00A900FF006C00FF006C00FF006C00FF006C00FFD0D0D1FFCDCD
      CEFFCBCBCCFFC8C8C9FF191919FF0000000000000000515151FFB97400FF5151
      51FF000000000000000000000000000000000000000000000000515151FF5151
      51FF00000000000000000000000000000000000000000000000000000000A1A1
      A1FF515151FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FF5151
      51FF0000000000000000000000000000000041665E007A8E7D00435752004A73
      6B0097919200BBB6BD00C9C1C100CAC5C500A59D990095959B00536CB400426C
      D800657AB100DAD0C700B0AAA400C0BEBB0000000000696969FFECECEDFFEAEA
      EAFFE7E7E7FF00A900FF73DA7EFF73DA7EFF73DA7EFF006C00FFD5D5D5FFD2D2
      D2FFCFCFD0FFCCCCCDFF191919FF0000000000000000515151FF515151FF5151
      51FF000000000000000000000000000000000000000000000000515151FF5151
      51FF00000000000000000000000000000000000000000000000000000000A1A1
      A1FF515151FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFA1A1A1FF5151
      51FF000000000000000000000000000000007384750063786C0042594F005077
      7400A29C9E00A1A3AE008E93A60082899C004F5C7700375AA7004C80F0005C94
      FF006285DA00DFD6CA0097928D00F6F3F00000000000696969FFF0F0F0FFEDED
      EEFFEBEBEBFF00A900FF73DA7EFF73DA7EFF73DA7EFF006C00FFD9D9DAFFD6D6
      D7FFD3D3D4FFD0D0D1FF191919FF0000000000000000A2A2A2FF515151FF0000
      0000000000000000000000000000000000000000000000000000515151FF5151
      51FF00000000000000000000000000000000000000000000000000000000A1A1
      A1FF515151FFE7E7E7FFC3C3C3FFC0C0C0FFC0C0C0FFC0C0C0FF9F9F9FFF5151
      51FF00000000000000000000000000000000EFEAE8005B7A7100486C61003A5E
      5B00838594006B78A500495C8500355EB4003F71D3005798FF0064A9FF005794
      FB00BABDCD00E5DFD90078787600E5E1DD0000000000696969FFF4F4F4FF00A9
      00FF00A900FF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF006C00FF006C
      00FFD7D7D8FFD4D4D5FF191919FF0000000000000000515151FF515151FF5151
      51FF000000000000000000000000000000000000000000000000515151FF5151
      51FF00000000000000000000000000000000000000000000000000000000A1A1
      A1FF515151FFE7E7E7FFC3C3C3FFBFBFBFFFBDBDBDFFBDBDBDFF9F9F9FFF5151
      51FF0000000000000000000000000000000093A0B900758899005A6E6E00475C
      70006783C800B7BCCE00A0A2A5002E54A4004776CF00628BC200879DBF00D0D1
      D500E6E2DF00E7E2DE00B9BAB9009792900000000000696969FFF7F7F7FFF5F5
      F5FF00A900FF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF00A900FFDEDE
      DFFFDBDBDCFFD8D8D9FF191919FF000000000000000000000000515151FF0000
      000000000000797979FF515151FF00000000515151FF515151FF515151FF5151
      51FF515151FF515151FF00000000515151FF000000000000000000000000A1A1
      A1FF515151FFE7E7E7FFB5B5B5FFC4C4C4FFD6D6D6FFD5D5D5FFA0A0A0FF5151
      51FF000000000000000000000000000000007A9AC1003D89E100407CC8004C61
      9E006166B600A0B2DB008595C3003F62B800394B850058525E00D2C0AC00D9D2
      CD00D9D4CF00DFD9D400F0EFE900B4ABA30000000000696969FFFAFAFAFFF8F8
      F8FFF5F5F6FF00A900FF73DA7EFF73DA7EFF73DA7EFF00A900FFE5E6E6FFE3E3
      E3FFE0E0E0FFDCDCDDFF191919FF000000000000000000000000515151FF0000
      000000000000797979FFBCBCC0FF515151FF515151FFBCBCC0FFBCBCC0FFBCBC
      C0FFBCBCC0FF515151FF515151FF515151FF000000000000000000000000A1A1
      A1FF515151FFE7E7E7FFB7B7B7FFBABABAFFBFBFBFFFC2C2C2FFA09F9FFF5151
      51FF00000000000000000000000000000000849AA7004EABFF0060CBFF0059A6
      F900826D9D003562B3002B4699002D50A0002F5AAF003A69B60087ACD000C3C2
      C200D8CEC400DBCFC700EFE4DA00D9D0C70000000000696969FFFCFCFCFFFAFA
      FBFFF8F8F9FFEFF1F3FF00A900FF73DA7EFF00A900FFE9EAEBFFEAEAEAFF6969
      69FF191919FF191919FF191919FF000000000000000000000000515151FF0000
      000000000000797979FFBCBCC0FFBCBCC0FFBCBCC0FFBCBCC0FFBCBCC0FFBCBC
      C0FFBCBCC0FFBCBCC0FF797979FF00000000000000000000000000000000A1A1
      A1FF515151FFE7E7E7FFD3D3D3FFD0D0D0FFCCCCCCFFDDDDDDFFA1A1A1FF5151
      51FF00000000000000000000000000000000E1DBD4006E93D60059A3EA005874
      A100645F83006A8FC300477FBE00558ABF005E90BF0086A5C700DBDEE300D5D0
      CA00E0D9D300DFD9D300F0F0E900E4DFD90000000000696969FFFEFEFEFFFDFD
      FDFFFBFBFBFFF9F9F9FFF7F7F7FF00A900FFF3F3F3FFF0F0F0FFEDEDEEFF6969
      69FFE8E8E8FFC7C7C9FF696969FF000000000000000000000000515151FF0000
      000000000000797979FFBCBCC0FF797979FF797979FFBCBCC0FFBCBCC0FFBCBC
      C0FF797979FF797979FF0000000000000000000000000000000000000000A1A1
      A1FF515151FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFDFE3E0FF9EC8AEFF5151
      51FF00000000000000000000000000000000988574006F6FF30056529D006F79
      8800ACA9BC00C4A58C00999BA000C3A18300C5A88F00C5A28400D6AD8A00C59E
      7C00C49C7A00C19A7700D1A78200C49C7B0000000000696969FFFFFFFFFFFFFF
      FFFFFDFDFDFFFCFCFCFFFAFAFAFFF8F8F8FFF6F6F6FFF4F4F4FFF1F1F1FF6969
      69FFC7C7C9FF696969FF00000000000000000000000000000000515151FF0000
      000000000000797979FF797979FF00000000797979FF797979FF797979FF7979
      79FF00000000000000000000000000000000000000000000000000000000A1A1
      A1FF515151FF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FF00000000000000000000000000000000626066007F81B600CBC2DE00AAE9
      DA00DFC0A300D6A77F00D5A88000D1A78100D2A78100D2A78100E5B68D00D5AA
      8400D2A88200D2A88400E3B58E00D5AE8A0000000000696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A9A9A9FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A9
      00FF006C00FF006C00FF006C00FF0000000000000000465764FF122C46FF122C
      46FF122C46FF122C46FF122C46FF122C46FF0000000000000000000000000000
      00000000000000000000000000000000000000000000465764FF122C46FF122C
      46FF122C46FF122C46FF122C46FF122C46FF000000FF74838AFF696969FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF0000000000000000000000000000000000000000000000000000
      0000999494FFE1DDDDFFF4F2F2FFFAF9F9FFFAF9F9FFF6F5F5FFE2DFDFFFA39D
      9DFF0000000000000000000000000000000000000000000000000000000000A9
      00FF73DA7EFF73DA7EFF006C00FF0000000000000000465764FF65A4DBFF5799
      D5FF498FCFFF3C86C9FF307DC3FF122C46FF0000000000000000000000000000
      00000000000000000000000000000000000000000000465764FF65A4DBFF5799
      D5FF498FCFFF3C86C9FF307DC3FF122C46FF74838AFF000000FF79A2B0FF4659
      5FFF3D71A2FF376C9FFF30679CFF296298FF235D95FF1D5992FF18558FFF1449
      7DFF191919FF0000000000000000000000000000000000000000000000000000
      0000D6D4D4FFF0F0F0FFF4F3F3FFF0EFEFFFE9E6E6FFDFDBDBFFCBC4C4FFA99E
      9EFF0000000000000000000000000000000000000000000000000000000000A9
      00FF73DA7EFF73DA7EFF006C00FF0000000000000000465764FF79B3E4FF6BA8
      DEFF5D9ED7FF4F94D1FF428ACCFF122C46FF0000000000000000000000000000
      00000000000000000000000000000000000000000000465764FF79B3E4FF6BA8
      DEFF5D9ED7FF4F94D1FF428ACCFF122C46FF000000004699BDFF98DBF0FF8FC2
      D4FF2D434EFF2D434EFF407CB6FF3776B1FF3070ADFF286BAAFF2165A6FF1A58
      93FF191919FF0000000000000000000000000000000000000000000000000000
      0000C8C4C4FFD7D5D5FFC6D7C4FFD1DFCFFFB7D3B5FFC8D0C4FFCEC7C7FFB8AE
      AEFF0000000000000000000000000000000000A900FF006C00FF006C00FF006C
      00FF73DA7EFF73DA7EFF006C00FF006C00FF006C00FF006C00FF8EC2EDFF7FB7
      E6FF71ADE0FF63A2DAFF5598D4FF122C46FF2442CBFF1C49A9FF1C49A9FF1C49
      A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF1C49A9FF8EC2EDFF7FB7
      E6FF71ADE0FF63A2DAFF5598D4FF122C46FF000000004699BDFF98DBF0FF196B
      ACFF3797C4FF3797C4FF2D434EFF447FB8FF3B79B3FF3373AFFF2C6DABFF235D
      95FF191919FF0000000000000000000000000000000000000000000000000000
      0000DBD7D7FFC2D0C0FF3E9C3EFF83D082FF70CA70FF4AA14AFFCDD5CAFFC5BE
      BEFF0000000000000000000000000000000000A900FF73DA7EFF73DA7EFF73DA
      7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF006C00FFA2D2F5FF94C8
      EFFF85BCE9FF77B1E3FF69A7DDFF122C46FF2442CBFF728DFAFF728DFAFF728D
      FAFF728DFAFF728DFAFF728DFAFF728DFAFF728DFAFF1C49A9FFA2D2F5FF94C8
      EFFF85BCE9FF77B1E3FF69A7DDFF122C46FF00000000000000003797C4FF3797
      C4FF3AB4EEFF3AB4EEFF3797C4FF2D434EFF4882BAFF3F7CB5FF3776B1FF2C64
      9AFF191919FF0000000000000000000000000000000000000000000000000000
      0000E6E3E3FF7FAB7FFF71B270FFF3F7F3FFE7F4E7FF76B476FF76A074FFCDC7
      C7FF0000000000000000000000000000000000A900FF73DA7EFF73DA7EFF73DA
      7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF73DA7EFF006C00FFB5E0FEFFA8D6
      F8FF9ACCF2FF8CC1ECFF7DB6E5FF122C46FF2442CBFF728DFAFF728DFAFF728D
      FAFF728DFAFF728DFAFF728DFAFF728DFAFF728DFAFF1C49A9FFB5E0FEFFA8D6
      F8FF9ACCF2FF8CC1ECFF7DB6E5FF122C46FF0000000000000000196BACFF65D4
      ECFF65D4ECFF3AB4EEFF3AB4EEFF3797C4FF2D434EFF4C85BCFF437FB8FF366C
      9FFF191919FF0000000000000000000000000000000000000000000000000000
      0000EEECECFFA6C3A5FF87BD86FFEDF6EDFFF0F7F0FF7EB97EFFB1C4AEFFD3CD
      CDFF0000000000000000000000000000000000A900FF00A900FF00A900FF00A9
      00FF73DA7EFF73DA7EFF006C00FF00A900FF00A900FF00A900FF94B1C0FF6279
      89FF5F7688FF5C7486FF7399B6FF122C46FF2442CBFF2442CBFF2442CBFF2442
      CBFF2442CBFF2442CBFF2442CBFF2442CBFF2442CBFF2442CBFF94B1C0FF6279
      89FF5F7688FF5C7486FF7399B6FF122C46FF0000000000000000696969FF196B
      ACFF65D4ECFF65D4ECFF3AB4EEFF3AB4EEFF3797C4FF2D434EFF5088BEFF4174
      A4FF191919FF0000000000000000000000000000000000000000000000000000
      0000F1F0F0FFF6F4F4FF85C184FF6ECB6EFF6ACB6AFF71B770FFEAE7E6FFD7D4
      D4FF0000000000000000000000000000000000000000000000000000000000A9
      00FF73DA7EFF73DA7EFF006C00FF435F5FFF9CEDEFFF465764FF9EB8C0FF667C
      89FF637A89FF607788FF80A2BCFF122C46FF0000000000000000000000000000
      000000000000615A55FFEED0B8FF435F5FFF9CEDEFFF465764FF9EB8C0FF667C
      89FF637A89FF607788FF80A2BCFF122C46FF0000000000000000696969FF9FC4
      E8FF196BACFF65D4ECFF65D4ECFF3AB4EEFF3AB4EEFF3797C4FF2D434EFF4C7C
      AAFF191919FF0000000000000000000000000000000000000000000000000000
      0000F2F1F1FFF6F4F4FFE0EBDFFF93DA93FF91DA91FFD6E9D6FFE9E7E5FFDDD9
      D9FF0000000000000000000000000000000000000000000000000000000000A9
      00FF73DA7EFF73DA7EFF006C00FF435F5FFFADF1F2FF465764FFE8FFFFFFDEFD
      FFFFD3F5FFFFC7EDFFFFB9E3FFFF122C46FF0000000000000000000000000000
      000000000000615A55FFF0D6C0FF435F5FFFADF1F2FF465764FFE8FFFFFFDEFD
      FFFFD3F5FFFFC7EDFFFFB9E3FFFF122C46FF0000000000000000696969FFADCF
      EFFFA4C8EAFF196BACFF65D4ECFF65D4ECFF3AB4EEFF3AB4EEFF3797C4FF2D43
      4EFF191919FF0000000000000000000000000000000000000000000000000000
      0000F2F2F2FFF6F5F5FFF6F4F4FFFDFCFDFFFEFDFEFFFBFAFAFFECE9E9FFDFDB
      DBFF0000000000000000000000000000000000000000000000000000000000A9
      00FF00A900FF00A900FF00A900FF435F5FFFA5D6D7FF465764FF465764FF4657
      64FF465764FF465764FF465764FF465764FF0000000000000000000000000000
      000000000000615A55FFF2DBCAFF435F5FFFA5D6D7FF465764FF465764FF4657
      64FF465764FF465764FF465764FF465764FF0000000000000000696969FFB9D9
      F5FFB1D2F1FFA8CCECFF196BACFF65D4ECFF65D4ECFF24A1DCFF929292FF5959
      59FF2D434EFF0000000000000000000000000000000000000000000000000000
      0000F0EFEFFFF2F0F0FFF2F2F2FFF9F8F8FFFCFCFCFFFCFBFBFFEFECECFFE0DC
      DCFF000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFF4E1D3FF435F5FFFB1D8D9FF6C8F8FFF688E8EFF658D
      8EFF8DD2D3FF0F2A2BFF00000000000000000000000000000000000000000000
      000000000000615A55FFF4E1D3FF435F5FFFB1D8D9FF6C8F8FFF688E8EFF658D
      8EFF8DD2D3FF0F2A2BFF00000000000000000000000000000000696969FFA4B0
      BBFF939BA3FF9099A2FF8E97A1FF196BACFF65D4ECFF9B9B9BFF9A9A9AFF7F7F
      7FFF392E48FF392E48FF00000000000000000000000000000000000000000000
      0000B2AEAEFFE3DFDFFFF5F4F4FFFBFBFBFFFDFDFDFFFBFBFBFFF0EDEDFFD7D1
      D1FF000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFF6E7DBFF435F5FFFDBF9F9FFD2F7F8FFC8F5F6FFBCF3
      F4FFB1F1F2FF0F2A2BFF00000000000000000000000000000000000000000000
      000000000000615A55FFF6E7DBFF435F5FFFDBF9F9FFD2F7F8FFC8F5F6FFBCF3
      F4FFB1F1F2FF0F2A2BFF00000000000000000000000000000000696969FFA2A7
      ABFFC5C9CFFFCACED4FFC9CDD3FFC9CDD3FF196BACFF7E7E7EFF9F9F9FFF7F7F
      7FFF8C00E9FF8C00E9FF392E48FF000000000000000000000000000000000000
      000000000000D8D6D6FFEEEDEDFFF8F8F8FFFCFCFCFFF6F5F5FFE9E7E7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFDACFC7FF435F5FFF435F5FFF435F5FFF435F5FFF435F
      5FFF435F5FFF435F5FFF00000000000000000000000000000000000000000000
      000000000000615A55FFDACFC7FF435F5FFF435F5FFF435F5FFF435F5FFF435F
      5FFF435F5FFF435F5FFF00000000000000000000000000000000696969FFB1BB
      C1FFAEB5BAFFADB5BCFFABB3BBFFA9B1BAFFA7B0B9FF196BACFF392E48FFA969
      EEFFA969EEFF8C00E9FF5C536EFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFDCD4CDFF918983FF918882FF918781FFD8CABEFF4037
      30FF000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFDCD4CDFF918983FF918882FF918781FFD8CABEFF4037
      30FF000000000000000000000000000000000000000000000000696969FFE5F9
      FFFFDFF4FFFFD8EFFFFFD1EAFFFFCAE4FDFFC1DEF9FFB9D8F5FFA59AB4FFC099
      F2FFA969EEFF8C00E9FF8E88A4FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFFCF6F2FFFBF4EEFFFAF1EAFFF9EEE6FFF8ECE2FF4037
      30FF000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FFFCF6F2FFFBF4EEFFFAF1EAFFF9EEE6FFF8ECE2FF4037
      30FF000000000000000000000000000000000000000000000000696969FFE0EF
      F0FFDCECF0FFD7E9F0FFD1E5F0FFCBE0F0FFC4DBEFFFBDD6EDFFB8D2EAFFA59A
      B4FFA59AB4FFAFA7C2FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FF615A55FF615A55FF615A55FF615A55FF615A55FF615A
      55FF000000000000000000000000000000000000000000000000000000000000
      000000000000615A55FF615A55FF615A55FF615A55FF615A55FF615A55FF615A
      55FF000000000000000000000000000000000000000000000000696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF000000000000000000000000424D3E000000000000003E000000
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF00FFFF0000000000000080000000000000
      007F000000000000007F000000000000003F000000000000803F000000000000
      801F000000000000C01F000000000000C00F000000000000E70F000000000000
      E787000000000000F387000000000000F3C7000000000000F9C7000000000000
      F807000000000000FFFF000000000000FFFFFFFFFFDDF807807FFCFFFFC9F807
      807FFC3FFE03F807807FE007FE03F807807FE007FE01FC07807FE007FE03FC07
      807FE007BA03FE0F807FE00793C9F81F807FE007C05DF81FFFFFE007C07FF00F
      FFFFE007807FF00FFFFFE007C07FF00FFFFFE007C07FF00FFFFFE00793FFF01F
      FFFFFCFFBBFFF83FFFFFFFFFFFFFFFFF800180010000C003800180010000C003
      800180010000C003800180010000C003800180010000C003800180010000C003
      800180010000C00380018001000FC00380018001F00FC00380018001F00FC003
      80018001F00FC00380018001F00FC00380018001FFFFC00380018001FFFFC003
      80038003FFFFC00380078007FFFFFC3FFFFFFFFFFF60FF80807FFFFFFF60FF80
      807FF7FFFF00FF80807F140FFF60FE00807F1007FF60FE00807F1003FF7FFE00
      807F1039FF60F800807F107FFF60F800803F1000FF00F8008C1F1FE0FF60F800
      9F0F19C0FF60F803BF871C00FC1FF803FFE31E00FC1FF803FFF11F02001FF80F
      FFF9FFFEFC1FF80FFFFFFFFFFC1FF80FC001F80003FFE003C001F80001FFE003
      C001F8000001E003C00100000000E003C00100000000E003C00100000000E003
      C00100000000E003E003F8000000E003F007F8000000E003F80FF8000000E003
      FC1FF8000000E003F80FF8000000E003F007F8000000E003FC1FF8000000E003
      FC1FF8000000E003FC1FF8000100E003FF80800100008F80FF80800100008F80
      FF80800100008F80FE00800100008E00FE00800100008E00FE00800100008E00
      F800800100008800F800800100008800F800800100009800F800800100008800
      F80380010000D803F80380010000D803F80380010000D803F80F80010000D80F
      F80F80030000D80FF80F80070000F80FFFFFE0008000FC008001E00000000000
      8001E00000000000800100000000000080010000000000008001000000000000
      80010000000000008001E000000000008001E000000000008001E00000000000
      8001F800000000008001F800000000008001F800000000008001F80000000000
      8001F80000000000FFFFF80000000000C003FFFF8001FE7F8003FFFF8001E667
      8003F7FF8001E0078003740F800190098003F00780018001800370038001C3C3
      8003F0398001C7E38003707F800107E08003F000800107E080037FE08001C7E3
      8003F9C08001C3C380037C00800180018007FE0080019009800F7F028001E007
      801FFFFE8003E667803FFFFF8007FE7F800080018FC7FDFF000080018FC7FEFF
      000080018FC7FC7F000080018FC7F01F000080018FC7E00F000080018FCFE00F
      000080018FCFE00F000080018FCFE00F000080019FCFE00F000080018FCFE00F
      00008001D902E00F00008001D800E00F00008001D801E00F00008001D803E00F
      00008003D90FE00F00008007FFFFF01FFEFFE180FF800007F00FE180FF800007
      F00FE180FF808007F00F000000008007F00F00000000C007F00F00000000C007
      F00F00000000C007F00FE000F800C007F00FE000F800C007F00FE000F800C007
      F00FF803F803C003F00FF803F803C001F81FF803F803C001FFFFF80FF80FC001
      FFFFF80FF80FC003FFFFF80FF80FC00700000000000000000000000000000000
      000000000000}
  end
  object MenuController: TRzMenuController
    GradientColorStyle = gcsCustom
    Left = 552
    Top = 344
  end
  object pmCollection: TPopupMenu
    Images = ilMainMenu
    OwnerDraw = True
    Left = 104
    Top = 496
  end
  object pmScripts: TPopupMenu
    Images = ilFileTypes
    OwnerDraw = True
    Left = 184
    Top = 496
    object MenuItem1: TMenuItem
      Caption = '324'
    end
    object MenuItem2: TMenuItem
      Caption = '34'
    end
    object MenuItem3: TMenuItem
      Caption = '35'
    end
  end
  object ilFileTypes: TImageList
    DrawingStyle = dsTransparent
    Left = 376
    Top = 408
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      00000000000000000000000000000000000000000000696969FF191919FF1919
      19FF191919FF191919FF191919FF191919FF191919FF191919FF191919FF1919
      19FF191919FF191919FF191919FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFD3D3D4FFD0D0
      D1FFCDCDCEFFCBCBCCFFC8C8C9FFC4C4C5FFC2C2C3FFBFBFC1FFBDBDBEFFBBBB
      BCFFB9B9BBFFB8B8B9FF191919FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFD8D8D8FFD5D5
      D5FFD2D2D2FFCFCFD0FFCCCCCDFFC9C9CAFFC5C5C7FFC3C3C4FFC0C0C1FFBEBE
      BFFFBCBCBDFFBABABBFF191919FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFDCDCDDFFD9D9
      DAFFD6D6D7FFD3D3D4FF006C00FFCDCDCEFFCACACBFFC7C7C8FFC4C4C5FFC1C1
      C2FFBFBFC0FFBDBDBEFF191919FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFE0E0E1FFE0E0
      E1FFDADADBFFD7D7D8FF00A900FF006C00FFCECECFFFCBCBCCFFC8C8C9FFC5C5
      C7FFC2C2C3FFC0C0C1FF191919FF000000000000000000000000000000000000
      000B000000B50404048A0404048A0404048A0404048A000000E3000000E30000
      00A9000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFE4E4E5FFE1E1
      E2FFDEDEDFFFDBDBDCFF00A900FF73DA7EFF006C00FFCFCFD0FFCCCCCDFFCACA
      CBFFC7C7C8FFC3C3C4FF191919FF000000000000000000000000000000000101
      01A5010101CFBBADADFF333333FFB6A9A9FFBBADADFF424242FF5D5D5DFF0101
      01CF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFE8E8E9FFE5E6
      E6FFE3E3E3FFE0E0E0FF00A900FF73DA7EFF73DA7EFF006C00FFD0D0D1FFCDCD
      CEFFCBCBCCFFC8C8C9FF191919FF000000000000000000000000000000000101
      01C7515151FFBDB7B7FF222222FFB4AEAEFFBDB7B7FF3D3D3DFF5A5A5AFF0101
      01C7000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFECECEDFFEAEA
      EAFFE7E7E7FFE4E4E4FF00A900FF73DA7EFF73DA7EFF73DA7EFF006C00FFD2D2
      D2FFCFCFD0FFCCCCCDFF191919FF000000000000000000000000000000000101
      01C1535353FFC7C6C6FFC3C2C2FFC3C2C2FFC7C6C6FF383838FF585858FF0101
      01C1000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFF0F0F0FFEDED
      EEFFEBEBEBFFE8E8E8FF00A900FF73DA7EFF73DA7EFF00A900FFD9D9DAFFD6D6
      D7FFD3D3D4FFD0D0D1FF191919FF000000000000000000000000000000000101
      01BC565656FF333333FF333333FF333333FF333333FF343434FF575757FF0101
      01BC000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFF4F4F4FFF1F1
      F1FFEFEFEFFFECECECFF00A900FF73DA7EFF00A900FFE0E0E1FFDDDDDEFFDADA
      DBFFD7D7D8FFD4D4D5FF191919FF000000000000000000000000000000000101
      01B7777777FFD6D6CCFFF6F6E9FFF6F6E9FFF6F6E9FFD6D6CCFF777777FF0101
      01B7000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFF7F7F7FFF5F5
      F5FFF2F2F2FFF0F0F0FF00A900FF00A900FFE7E7E8FFE4E4E5FFE1E1E2FFDEDE
      DFFFDBDBDCFFD8D8D9FF191919FF000000000000000000000000000000000101
      01B27C7C7CFFFAFAF3FFF5F5EEFFF5F5EEFFF5F5EEFFFAFAF3FF7C7C7CFF0101
      01B2000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFFAFAFAFFF8F8
      F8FFF5F5F6FFF3F3F3FF00A900FFEEEEEEFFEBEBECFFE8E8E9FFE5E6E6FFE3E3
      E3FFE0E0E0FFDCDCDDFF191919FF000000000000000000000000000000000101
      01AF848484FFFFFFFEFFFEFEFDFFFEFEFDFFFEFEFDFFFFFFFEFF848484FF0101
      01AF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFFCFCFCFFFAFA
      FBFFF8F8F9FFF6F6F7FFF4F4F4FFF2F2F2FFEFEFEFFFECECEDFFEAEAEAFF6969
      69FF191919FF191919FF191919FF000000000000000000000000000000000101
      0181010101ACAAAA8066AAAA8066AAAA8066AAAA8066AAAA8066010101AC0101
      0181000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFFEFEFEFFFDFD
      FDFFFBFBFBFFF9F9F9FFF7F7F7FFF5F5F5FFF3F3F3FFF0F0F0FFEDEDEEFF6969
      69FFE8E8E8FFC7C7C9FF696969FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FFFFFFFFFFFFFF
      FFFFFDFDFDFFFCFCFCFFFAFAFAFFF8F8F8FFF6F6F6FFF4F4F4FFF1F1F1FF6969
      69FFC7C7C9FF696969FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF696969FF6969
      69FF696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000069C2FDFF3DAFFDFF60BDFDFF97D4
      FCFFA0D6FDFF9CD5FDFF9CD5FDFF94D2FCFF74C5FDFF72C6FDFF6CC3FCFF69C1
      FCFF91D1FCFFACDCFDFFA0D7FDFF83CBFDFF0000000000000000000000004040
      4000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000079C8FEFF7AC9FDFF99D5FCFF96D3
      FDFFB8E1FCFFB7E0FDFFA6D9FDFF95D3FCFF82C4F0FF7EB6DCFF79C8FCFF71C5
      FDFF68C1FDFF64BFFDFF6CC2FDFF99D5FDFF00000000000000002B2B2B00E0DB
      D9004267000000808000004E1900004E1900004E1900004E1900004E1900004E
      1900004E1900004E1900004E1900003611000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFC00FEFEFC00FDFDFA00FDFDFA00FCFC
      F800FEFEF90000000000000000000000000083CDFEFF8BCFFEFF91D2FDFF8DD0
      FDFF96D5FDFFA3D9FCFF97D3F8FF8EBCDBFF89ADC5FF87B2D1FF82BCE2FF7BC9
      FEFF72C6FEFF68C1FEFF5CBDFEFF9CD6FDFF000000002B2B2B00E0DBD9000000
      00004870000000B9B9005A8A0000588800005888000058880000588800005888
      0000588800005787000053830100000000000000000000000000000000000000
      0000000000000000000000000000A49197009079810000000000000000000000
      0000000000000000000099898E00000000000000000000000000000000000000
      000000000000FEFEFC00FDFDFC00FDFDFA00FCFCF800FBFBF800FAFAF500F8F8
      F400FBFBF5000000000000000000000000008FD1FDFF98D5FDFF9DD8FDFFA3DA
      FDFFA6DCFCFF93D1FAFF91AABCFF98BCD4FF8AA3B2FF818082FF84A3B8FF85CE
      FDFF7CCAFEFF71C5FDFF66C1FDFF7AC9FDFF26262600D2CFCE00FFFDFC00CCC7
      C5005383010000000000E1F5BB00CDEF8C00C2EB7200BAE95E00B8E85900AEE5
      4200A5E22C009BDF160092DC00000036110000000000C6899D008F2648008A28
      47007A2B440078314800842B4700952F4F009731510084274500773047007B2E
      480089294800952F4F008F5A6B00000000000000000000000000000000000000
      0000CCCCBB00CBCBBA00DCDCCB00D2D2C100FBFBF800FAFAF500F8F8F400F7F7
      F200FBFBF50000000000000000000000000099D6FEFFA3D9FEFFA9DDFCFFAADC
      FDFF73C6FCFF78C7F9FF98B3C5FF82888CFF7F7F80FF7F8081FF7CB9E0FF2FAA
      FCFF4AB5FDFF5FBEFDFF67C1FCFF62BDFDFFB1AEAD00FFFBF800D5CFCB002B2B
      2B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5879B00A4516B00B068
      7F00AE647A00AA607600A7586F00A1496300AA5A7100B5718500AE647A00A75A
      7100AA5A7100AE647A008B546500000000000000000000000000000000000000
      0000EDEDDC00EDEDDC00ECECDB00EBEBDA00FAFAF500F8F8F400F7F7F200F6F6
      F000FAFAF200000000000000000000000000A3DAFEFFADDDFEFF90D2FBFF75C6
      FBFF8FC2E3FF959EA5FFA5A5A5FF807F80FF807F7FFF889199FF4DB6FBFF3CAF
      FCFF84CCFBFF0198FDFF139FFCFF63C0FDFF00000000CCC7C50000000000E0DB
      D900884D000000808000673C0000673C0000673C0000673C0000673C0000673C
      0000673C0000673C0000673C00005032000000000000C5879B00A4516B00C48E
      A000D7B0BC00DAB5C000C5879B00A1496300AA5A7100D7AFBB00DDBAC500CD9D
      AC00BD829500B0637C00844C5F0000000000000000000000000000000000FEFE
      FC00CBCBBA00DBDBCA00C9C9B800C7C7B600D7D7C600D6D6C500CCCCBB00D3D3
      C200FAFAF200000000000000000000000000ACDDFDFF95D4FCFF85C7F0FF93A6
      B3FFA3A3A3FFE2E2E2FFF8F8F8FF999999FF7F7F7FFF97B6CBFF1FA4FDFFA2D9
      FCFF95D3FCFF39AFFCFF35ADFDFF85CCFDFFA6A3A20000000000E0DBD9000000
      0000A75800001EC5C500A7580000A7580000A25700009F5600009F5600009C56
      00009654000096540000945400000000000000000000C6899D00A75A7100C689
      9D00D7B0BC00DAB5C000C1879800A34D6600AA607600D7AFBB00DDBAC500CD9D
      AC00BD829500AD6179007F45570000000000000000000000000000000000FEFE
      FC00ECECDB00EBEBDA00E9E9D800E8E8D700E7E7D600E5E5D400E4E4D300E3E3
      D200F9F9EF00000000000000000000000000B1DFFDFFBBE1F8FF8E9399FFD1D2
      D1FFAAAAA9FFEFEFEFFFD4D4D4FFCFCFCFFF858889FF73C0F4FF0299FDFF31AB
      FBFF8ACFFCFF48B4FCFF6FC4FCFFAFDEFDFF26262600D2CFCE00FFFDFC00CCC7
      C500B563060000000000FFE4B000FFDDA400FFD79800FFD18D00FFCB8100FFC5
      7600FFBF6A00FFB95F00FFB353005032000000000000C5879B00A6567000C48E
      A000D7B0BC00DAB5C000C5879B00A1496300AA5A7100D7AFBB00DAB5C000CD9D
      AC00BD829500AA5A71007B3F520000000000000000000000000000000000FDFD
      FA00C9C9B800C7C7B600C6C6B500D6D6C500C3C3B200D3D3C200D2D2C100C8C8
      B700F7F7EA00000000000000000000000000B5E1FDFFC4E6FDFFA2AFB7FFDBDB
      DBFFB5B5B5FFE5E5E5FFC7C7C7FFF7F7F7FF9CA2A7FF9BC9E7FF5CBCF9FF31AB
      FCFF19A2FDFF33ADFCFF83CBFCFFA1D8FDFFB1AEAD00FFFBF800D5CFCB002B2B
      2B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5879B00A6567000C689
      9D00D7B0BC00DAB5C000C6899D00A75A7100AE647A00D7B0BC00E0BFC900D0A3
      B200C6899D00AE647A0076394D0000000000000000000000000000000000FDFD
      FA00E9E9D800E8E8D700E7E7D600E5E5D400E4E4D300E3E3D200E2E2D100E0E0
      CF00F4F4E500000000000000000000000000B6E2FEFFC4E7FEFFC8DDECFFA4A6
      A7FFE9E9EAFFB1B1B1FFE6E6E6FFDCDCDCFFC1C1C1FF817F81FF878E92FF91A7
      B6FF84B8D9FF81C8F8FF7DCBFCFF7FCAFDFF00000000CCC7C50000000000E0DB
      D9001B145D000080800000005000000050000000500000005000000050000000
      50000000500000005000000050000000500000000000C5879B00A75A7100C490
      A200DAB5C000DAB5C000C6899D00A7586F00B0687F00DAB5C000DDBAC500D0A3
      B200C48EA000AE647A007333490000000000000000000000000000000000FCFC
      F800C6C6B500D6D6C500C3C3B200C2C2B100C1C1B000C0C0AF00CFCFBE00C6C6
      B500F3F3E200000000000000000000000000B5E0FDFFC4E6FEFFD1EBFDFFA0A8
      ADFFE6E5E5FFACACACFFEFEFEFFFDEDEDEFFE7E7E7FF808081FF807F7FFF7F7F
      7FFF807F7FFF808E96FF7FC8FAFF6BC2FDFFA6A3A20000000000E0DBD9000000
      0000201A6F001EC5C5005A0292005A0292005A0292005A0292005A0292005A02
      92005A0292005A02920053028D000000500000000000C5879B00A6567000C689
      9D00D7B0BC00DDBAC500C6899D00A7586F00AE647A00D7B0BC00E0BFC900D0A3
      B200C490A200AE647A00712E440000000000000000000000000000000000FCFC
      F600E7E7D600E5E5D400E4E4D300E3E3D200F1F1E700ECECDF00E8E8D900E6E6
      D500F2F2E100000000000000000000000000B2DFFDFFBDE3FDFFC9E9FDFFBFD4
      E1FFB4B4B5FFE9E9E9FFCBCBCBFFEAEAEAFF949494FF7F7F7FFF7F7F7FFF8081
      81FF8494A0FF84B5D5FF7DC8FCFF6EC4FCFF26262600D2CFCE00FFFDFC00CCC7
      C5005302860000000000F0BEFF00E5A3FF00DE95FF00D787FF00D27DFF00D079
      FF00CA6CFF00C063F400B55AE8001B145D0000000000C88EA100A75A7100C48E
      A000D7B0BC00DDBAC500C1879800A4516B00AE647A00D7B0BC00E0BFC900D0A3
      B200C6899D00AE647A008545590000000000000000000000000000000000FBFB
      F500C3C3B200C2C2B100D2D2C100C8C8B700ECECDF00E8E8D900E6E6D500E5E5
      D400F2F2E100000000000000000000000000B0DEFDFFB6E1FDFFC1E5FDFFC9E7
      FCFFB0B7BBFFF4F4F5FFBCBCBDFFF3F3F3FF8C8C8CFF818384FF8FA2B1FF97C6
      E5FF91D3FCFF85CCFDFF77C8FDFF6BC2FDFFB1AEAD00FFFBF800D5CFCB001812
      5400620A9A006810A000620A9A006810A000620A9A006810A000620A9A006810
      A000620A9A005F08950053028600191463000000000000000000D7AFBB00C490
      A200D7B0BC00DAB5C000C6899D00A75A7100B46E8200D7B0BC00DDBAC500D1A6
      B400C490A200D7AFBB000000000000000000000000000000000000000000FAFA
      F500F5F5EE00F4F4EC00F1F1E700ECECDF00E8E8D900E6E6D500B5B5A400B5B5
      A400B5B5A40000000000000000000000000096D2FCFFB1DEFCFFB6E1FEFFBCE3
      FDFFAAC5D5FFAFAEAFFFBBBDBBFF8D9397FF9AB2C3FFA7D5F3FFA1D8FDFF97D4
      FEFF8BCFFEFF7ECAFDFF72C6FEFF66C0FEFF00000000CCC7C500181254004B02
      7A000091910000D1D1000096960046057F004F0384004B027A004F0384004B02
      7A0050028100390A770018125400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAFA
      F200F4F4EC00F1F1E700ECECDF00E8E8D900E6E6D500E5E5D400C7C7B6000000
      0000A3A3790000000000000000000000000095D2FDFFA0D7FCFFA7DCFDFFAFDE
      FDFFB1DEFAFF91A1ACFFA1BED3FFADDBF8FFA9DCFDFFA2D9FDFF98D5FDFF8ED1
      FDFF83CCFEFF78C8FEFF6CC3FEFF61BEFEFFA6A3A20018125400201A6F000096
      960000D1D10000919100201A6F002C14740027106B002C14740027106B002C14
      740027106B001812540000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      F600F9F9EF00F6F6EA00F4F4E500F3F3E200F2F2E100F2F2E100D3D3C200A7A7
      7D00A7A77D0000000000000000000000000093D2FDFF91D1FCFFB1DEFDFFAFDE
      FDFFA5DAFDFFA5DBFCFFA6DAFDFFA2D9FDFF9DD7FEFF96D4FEFF8ED0FDFF85CD
      FEFF7AC9FEFF71C5FDFF64C0FEFF5ABCFCFF210F54001B145D00191463001914
      6300191463001914630019146300191463001914630019146300191463001B14
      5D00001D58000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF008001FFFF000000008001FFFF00000000
      8001FFFF000000008001FFFF000000008001E00F000000008001E00F00000000
      8001E00F000000008001E00F000000008001E00F000000008001E00F00000000
      8001E00F000000008001E00F000000008001E00F000000008001FFFF00000000
      8003FFFF000000008007FFFF000000000000E001FFFFFFFF0000C000FFFFFE07
      00009000FE7DF807000004008001F007000000018001F007000080008001E007
      000010008001E007000004008001E007000000018001E007000080008001E007
      000010008001E007000004008001E00700000000C003E00700008001FFFFE017
      00000003FFFFE00700000007FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object pmHeaders: TPopupMenu
    OwnerDraw = True
    Left = 184
    Top = 544
    object N3: TMenuItem
      Tag = 10
      Caption = #1040#1074#1090#1086#1088
      Checked = True
      OnClick = HeaderPopupItemClick
    end
    object N4: TMenuItem
      Tag = 11
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      OnClick = HeaderPopupItemClick
    end
    object N8: TMenuItem
      Tag = 12
      Caption = #1057#1077#1088#1080#1103
      OnClick = HeaderPopupItemClick
    end
    object N10: TMenuItem
      Tag = 13
      Caption = #8470
      OnClick = HeaderPopupItemClick
    end
    object N12: TMenuItem
      Tag = 14
      Caption = #1046#1072#1085#1088
      OnClick = HeaderPopupItemClick
    end
    object N21: TMenuItem
      Tag = 15
      Caption = #1056#1072#1079#1084#1077#1088
      OnClick = HeaderPopupItemClick
    end
    object N13: TMenuItem
      Tag = 16
      Caption = #1056#1077#1081#1090#1080#1085#1075
      OnClick = HeaderPopupItemClick
    end
    object N15: TMenuItem
      Tag = 16
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1086
      OnClick = HeaderPopupItemClick
    end
    object N22: TMenuItem
      Tag = 18
      Caption = #1050#1086#1083#1083#1077#1082#1094#1080#1103
      OnClick = HeaderPopupItemClick
    end
    object N25: TMenuItem
      Caption = '-'
    end
    object N27: TMenuItem
      Caption = #1057#1090#1072#1085#1076#1072#1088#1090#1085#1099#1077
      OnClick = N27Click
    end
  end
end
