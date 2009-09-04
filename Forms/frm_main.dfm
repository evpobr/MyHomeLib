object frmMain: TfrmMain
  Left = 0
  Top = 0
  HelpContext = 2
  Caption = 'MyHomeLib'
  ClientHeight = 847
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
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
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
    VisualStyle = vsGradient
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
    Top = 828
    Width = 942
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 1
    object RzVersionInfoStatus1: TRzVersionInfoStatus
      Left = 0
      Top = 0
      Height = 19
      Align = alLeft
      Alignment = taCenter
      Field = vifFileVersion
      VersionInfo = VersionInfo
    end
    object spStatus: TRzStatusPane
      Left = 100
      Top = 0
      Width = 216
      Height = 19
      Align = alLeft
      Alignment = taRightJustify
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
    DisabledImages = ilToolBar_Disabled
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
    object tbtnDownloadList_Add: TToolButton
      Left = 41
      Top = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1086#1095#1077#1088#1077#1076#1100' '#1079#1072#1075#1088#1091#1079#1082#1080
      Caption = 'tbtnDownloadList_Add'
      ImageIndex = 2
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
      Width = 20
      Caption = 'ToolButton13'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object tbtnRus: TToolButton
      Left = 156
      Top = 0
      Hint = #1056#1091#1089#1089#1082#1080#1081' '#1072#1083#1092#1072#1074#1080#1090
      Caption = 'tbtnRus'
      ImageIndex = 3
      OnClick = tbtnRusClick
    end
    object tbtnEng: TToolButton
      Left = 197
      Top = 0
      Hint = #1040#1085#1075#1083#1080#1081#1089#1082#1080#1081' '#1072#1083#1092#1072#1074#1080#1090
      Caption = 'tbtnEng'
      ImageIndex = 4
      OnClick = tbtnEngClick
    end
    object ToolButton12: TToolButton
      Left = 238
      Top = 0
      Width = 20
      Caption = 'ToolButton12'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object tbtnWizard: TToolButton
      Left = 258
      Top = 0
      Hint = #1052#1072#1089#1090#1077#1088' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1081
      Caption = 'tbtnWizard'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = ShowNewCollectionWizard
    end
    object tbtnSelect: TToolButton
      Left = 299
      Top = 0
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1086#1083#1083#1077#1082#1094#1080#1102
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1082#1086#1083#1083#1077#1082#1094#1080#1102
      DropdownMenu = pmCollection
      EnableDropdown = True
      ImageIndex = 6
      Indeterminate = True
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton3: TToolButton
      Left = 340
      Top = 0
      Width = 20
      Caption = 'ToolButton3'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object BtnFav_add: TToolButton
      Left = 360
      Top = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1080#1079#1073#1088#1072#1085#1085#1086#1077
      Caption = 'BtnFav_add'
      DropdownMenu = pmGroups
      ImageIndex = 15
      Style = tbsDropDown
      OnClick = BtnFav_addClick
    end
    object ToolButton7: TToolButton
      Left = 414
      Top = 0
      Width = 20
      Caption = 'ToolButton7'
      ImageIndex = 18
      Style = tbsSeparator
    end
    object tbSelectAll: TToolButton
      Left = 434
      Top = 0
      Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      Caption = 'tbSelectAll'
      ImageIndex = 7
      OnClick = tbSelectAllClick
    end
    object tbCollapse: TToolButton
      Left = 475
      Top = 0
      Hint = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100'/'#1057#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      Caption = 'tbCollapse'
      ImageIndex = 8
      OnClick = tbCollapseClick
    end
    object btnRefreshCollection: TToolButton
      Left = 516
      Top = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      Caption = 'btnRefreshCollection'
      ImageIndex = 9
      OnClick = miRefreshClick
    end
    object ToolButton1: TToolButton
      Left = 557
      Top = 0
      Width = 20
      Caption = 'ToolButton1'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object btnSwitchTreeMode: TToolButton
      Left = 577
      Top = 0
      Hint = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1088#1077#1078#1080#1084' "'#1058#1072#1073#1083#1080#1094#1072'"'
      Caption = 'btnSwitchTreeMode'
      ImageIndex = 10
      OnClick = btnSwitchTreeModeClick
    end
    object tbtnShowDeleted: TToolButton
      Left = 618
      Top = 0
      Hint = #1057#1082#1088#1099#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077' '#1085#1072' lib.rus.ec'
      Caption = 'tbtnShowDeleted'
      ImageIndex = 12
      OnClick = tbtnShowDeletedClick
    end
    object tbtnShowLocalOnly: TToolButton
      Left = 659
      Top = 0
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1089#1082#1072#1095#1072#1085#1085#1099#1077' '#1082#1085#1080#1075#1080
      Caption = 'tbtnShowLocalOnly'
      ImageIndex = 13
      OnClick = tbtnShowLocalOnlyClick
    end
    object tbtnShowCover: TToolButton
      Left = 700
      Top = 0
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1057#1082#1088#1099#1090#1100' '#1086#1073#1083#1086#1078#1082#1091
      Caption = 'tbtnShowCover'
      ImageIndex = 14
      OnClick = tbtnShowCoverClick
    end
    object ToolButton5: TToolButton
      Left = 741
      Top = 0
      Width = 20
      Caption = 'ToolButton5'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbtnSettings: TToolButton
      Left = 761
      Top = 0
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Caption = 'tbtnSettings'
      ImageIndex = 17
      OnClick = miSettingsClick
    end
  end
  object pgControl: TRzPageControl
    Left = 0
    Top = 144
    Width = 942
    Height = 684
    HelpContext = 1
    ActivePage = TabSheet4
    Align = alClient
    TabIndex = 3
    TabOrder = 3
    TabStop = False
    OnChange = pgControlChange
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      HelpContext = 135
      Caption = #1040#1074#1090#1086#1088#1099
      object rzsSplitterA: TRzSplitter
        Left = 0
        Top = 0
        Width = 938
        Height = 661
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
          661)
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
          Height = 655
          Margins.Right = 1
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 0
          object tvAuthors: TVirtualStringTree
            AlignWithMargins = True
            Left = 5
            Top = 52
            Width = 214
            Height = 598
            Align = alClient
            CheckImageKind = ckXP
            Colors.UnfocusedSelectionColor = clHighlight
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.DefaultHeight = 17
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
            TabOrder = 1
            TreeOptions.PaintOptions = [toPopupMode, toShowDropmark, toShowHorzGridLines, toThemeAware, toUseBlendedImages]
            TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
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
            TabOrder = 0
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
              OnKeyDown = edLocateAuthorKeyDown
            end
          end
        end
        object cpCoverA: TMHLCoverPanel
          AlignWithMargins = True
          Left = 451
          Top = 3
          Width = 250
          Height = 655
          Margins.Left = 0
          ParentCustomHint = False
          Align = alRight
          BorderOuter = fsFlatRounded
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MarginMin = 150
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          SizeBarWidth = 6
          TabOrder = 0
          OnResize = CoverPanelResize
          Fb2InfoVisible = False
          FontSize = 0
          AnnotationColor = clBlack
        end
        object RzPanel15: TRzPanel
          AlignWithMargins = True
          Left = 0
          Top = 3
          Width = 451
          Height = 655
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
            Height = 539
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
              end
              object lblAuthor: TRzLabel
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
              end
            end
            object RzPanel23: TRzPanel
              Left = 0
              Top = 31
              Width = 441
              Height = 508
              Align = alClient
              BorderOuter = fsNone
              TabOrder = 1
              object tvBooksA: TVirtualStringTree
                Left = 0
                Top = 0
                Width = 441
                Height = 508
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
                Header.DefaultHeight = 17
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
            Top = 550
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
      HelpContext = 135
      Caption = #1057#1077#1088#1080#1080
      object rzsSplitterS: TRzSplitter
        Left = 0
        Top = 0
        Width = 938
        Height = 661
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
          661)
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
          Height = 655
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 0
          object tvSeries: TVirtualStringTree
            AlignWithMargins = True
            Left = 5
            Top = 52
            Width = 231
            Height = 598
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
            Header.DefaultHeight = 17
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
            TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
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
              Left = 53
              Top = 12
              Width = 141
              Height = 21
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              TabOrder = 0
              OnChange = edLocateSeriesChange
              OnKeyDown = edLocateAuthorKeyDown
            end
          end
        end
        object cpCoverS: TMHLCoverPanel
          AlignWithMargins = True
          Left = 433
          Top = 3
          Width = 250
          Height = 655
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
          OnResize = CoverPanelResize
          Fb2InfoVisible = False
          FontSize = 0
          AnnotationColor = clBlack
        end
        object RzPanel3: TRzPanel
          AlignWithMargins = True
          Left = 0
          Top = 3
          Width = 433
          Height = 655
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
            Height = 539
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
              end
              object lblSeries: TRzLabel
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
              end
            end
            object tvBooksS: TVirtualStringTree
              Tag = 1
              Left = 0
              Top = 31
              Width = 423
              Height = 508
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
              Header.DefaultHeight = 17
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
              OnPaintText = tvBooksTreePaintText
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
            Top = 550
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
      HelpContext = 135
      Caption = #1046#1072#1085#1088#1099
      object rzsSplitterG: TRzSplitter
        Left = 0
        Top = 0
        Width = 938
        Height = 661
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
          661)
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
          Height = 655
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 0
          object tvGenres: TVirtualStringTree
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 242
            Height = 645
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Header.AutoSizeIndex = 0
            Header.DefaultHeight = 17
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
            TreeOptions.SelectionOptions = [toMultiSelect]
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
          Height = 655
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
          SizeBarWidth = 6
          TabOrder = 0
          OnResize = CoverPanelResize
          Fb2InfoVisible = False
          FontSize = 0
          AnnotationColor = clBlack
        end
        object RzPanel27: TRzPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 422
          Height = 655
          Margins.Right = 0
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 1
          object RzPanel28: TRzPanel
            AlignWithMargins = True
            Left = 5
            Top = 36
            Width = 412
            Height = 508
            Align = alClient
            BorderOuter = fsNone
            TabOrder = 0
            object tvBooksG: TVirtualStringTree
              Tag = 2
              Left = 0
              Top = 0
              Width = 412
              Height = 508
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
              Header.DefaultHeight = 17
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
            Width = 418
            Height = 31
            Align = alTop
            BorderOuter = fsNone
            TabOrder = 2
            object lblBooksTotalG: TRzLabel
              AlignWithMargins = True
              Left = 403
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
            end
          end
          object ipnlGenres: TMHLInfoPanel
            AlignWithMargins = True
            Left = 5
            Top = 550
            Width = 412
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
      HelpContext = 126
      Caption = #1055#1086#1080#1089#1082
      object rzsSplitterSR: TRzSplitter
        Left = 0
        Top = 0
        Width = 938
        Height = 661
        MarginMin = 100
        Position = 200
        Percent = 21
        RealTimeDrag = True
        SplitterWidth = 2
        Align = alClient
        TabOrder = 0
        BarSize = (
          200
          0
          202
          661)
        UpperLeftControls = (
          CategoryPanelGroup1)
        LowerRightControls = (
          cpCoverSR
          RzPanel9)
        object CategoryPanelGroup1: TCategoryPanelGroup
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 194
          Height = 655
          VertScrollBar.Tracking = True
          Align = alClient
          BevelKind = bkTile
          Color = clMenu
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          TabOrder = 0
          object ctpOther: TCategoryPanel
            Top = 392
            Height = 209
            Caption = #1056#1072#1079#1085#1086#1077
            TabOrder = 0
            object Label30: TLabel
              Left = 3
              Top = 122
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = #1044#1072#1090#1072
            end
            object Label2: TLabel
              Left = 5
              Top = 150
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = #1071#1079#1099#1082
            end
            object Label3: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 49
              Width = 180
              Height = 13
              Align = alTop
              Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
            end
            object Label4: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 180
              Height = 13
              Align = alTop
              Caption = #1056#1072#1079#1084#1077#1097#1077#1085#1080#1077
            end
            object cbDate: TRzComboBox
              Left = 35
              Top = 118
              Width = 99
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnKeyDown = edFFullNameKeyDown
              Items.Strings = (
                #1089#1077#1075#1086#1076#1085#1103
                #1079#1072' 3 '#1076#1085#1103
                #1079#1072' '#1085#1077#1076#1077#1083#1102
                #1079#1072' 2 '#1085#1077#1076#1077#1083#1080
                #1079#1072' '#1084#1077#1089#1103#1094
                #1079#1072' 3 '#1084#1077#1089#1103#1094#1072)
            end
            object cbLang: TRzComboBox
              Left = 37
              Top = 145
              Width = 54
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              OnKeyDown = edFFullNameKeyDown
              Items.Strings = (
                'be'
                'bg'
                'bo'
                'br'
                'cs'
                'cz'
                'da'
                'de'
                'en'
                'eo'
                'es'
                'fr'
                'is'
                'it'
                'ja'
                'la'
                'lt'
                'lv'
                'pl'
                'pt'
                'ro'
                'ru'
                'sp'
                'sr'
                'sv'
                'th'
                'tr'
                'ua'
                'uk'
                'zh'
                #1082
                #1088#1091)
            end
            object cbDownloaded: TRzComboBox
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 180
              Height = 21
              Align = alTop
              ItemHeight = 13
              ReadOnlyColor = clBtnHighlight
              TabOrder = 2
              Text = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077
              Items.Strings = (
                #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077
                #1058#1086#1083#1100#1082#1086' '#1089#1082#1072#1095#1072#1085#1085#1099#1077
                #1058#1086#1083#1100#1082#1086' '#1053#1045' '#1089#1082#1072#1095#1072#1085#1085#1099#1077)
              ItemIndex = 0
            end
            object edFKeyWords: TRzButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 68
              Width = 180
              Height = 21
              Hint = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
              Align = alTop
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnKeyDown = edFFullNameKeyDown
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = edFFullNameButtonClick
            end
            object cbDeleted: TCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 95
              Width = 178
              Height = 17
              Margins.Left = 5
              Align = alTop
              Caption = #1057#1082#1088#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077
              TabOrder = 4
            end
          end
          object ctpFile: TCategoryPanel
            Top = 215
            Height = 177
            Caption = #1060#1072#1081#1083
            TabOrder = 1
            object Label27: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 180
              Height = 13
              Align = alTop
              Caption = #1048#1084#1103
            end
            object Label29: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 95
              Width = 180
              Height = 13
              Align = alTop
              Caption = #1058#1080#1087
            end
            object Label28: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 49
              Width = 180
              Height = 13
              Align = alTop
              Caption = #1055#1072#1087#1082#1072' ('#1072#1088#1093#1080#1074')'
            end
            object edFFile: TRzButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 180
              Height = 21
              Align = alTop
              TabOrder = 0
              OnKeyDown = edFFullNameKeyDown
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = edFFullNameButtonClick
            end
            object edFFolder: TRzButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 68
              Width = 180
              Height = 21
              Align = alTop
              TabOrder = 1
              OnKeyDown = edFFullNameKeyDown
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = edFFullNameButtonClick
            end
            object edFExt: TRzButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 114
              Width = 180
              Height = 21
              Align = alTop
              TabOrder = 2
              OnKeyDown = edFFullNameKeyDown
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = edFFullNameButtonClick
            end
          end
          object ctpBook: TCategoryPanel
            Top = 0
            Height = 215
            Caption = #1050#1085#1080#1075#1072
            TabOrder = 2
            object Label5: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 180
              Height = 13
              Align = alTop
              Caption = #1040#1074#1090#1086#1088
            end
            object Label24: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 49
              Width = 180
              Height = 13
              Align = alTop
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            end
            object Label26: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 141
              Width = 180
              Height = 13
              Align = alTop
              Caption = #1046#1072#1085#1088
            end
            object Label6: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 95
              Width = 180
              Height = 13
              Align = alTop
              Caption = #1057#1077#1088#1080#1103
            end
            object edFFullName: TRzButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 180
              Height = 21
              Align = alTop
              TabOrder = 0
              OnKeyDown = edFFullNameKeyDown
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = edFFullNameButtonClick
            end
            object edFTitle: TRzButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 68
              Width = 180
              Height = 21
              Align = alTop
              TabOrder = 1
              OnKeyDown = edFFullNameKeyDown
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = edFFullNameButtonClick
            end
            object edFSeries: TRzButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 114
              Width = 180
              Height = 21
              Align = alTop
              TabOrder = 2
              OnKeyDown = edFFullNameKeyDown
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = edFFullNameButtonClick
            end
            object edFGenre: TRzButtonEdit
              AlignWithMargins = True
              Left = 3
              Top = 160
              Width = 180
              Height = 21
              Align = alTop
              TabOrder = 3
              OnKeyPress = edFGenreKeyPress
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = edFGenreButtonClick
            end
          end
        end
        object cpCoverSR: TMHLCoverPanel
          AlignWithMargins = True
          Left = 511
          Top = 3
          Width = 222
          Height = 655
          Hint = '<b>'#1087#1088#1086#1074#1077#1088#1082#1072'</b>'#1093#1080#1085#1090#1086#1074
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
          ParentShowHint = False
          ShowHint = True
          SizeBarWidth = 5
          TabOrder = 0
          Visible = False
          OnResize = CoverPanelResize
          Fb2InfoVisible = False
          FontSize = 0
          AnnotationColor = clBlack
        end
        object RzPanel9: TRzPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 508
          Height = 655
          Margins.Right = 0
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 1
          object RzPanel10: TRzPanel
            AlignWithMargins = True
            Left = 5
            Top = 49
            Width = 498
            Height = 495
            Align = alClient
            BorderOuter = fsNone
            TabOrder = 0
            object tvBooksSR: TVirtualStringTree
              Tag = 3
              Left = 0
              Top = 0
              Width = 498
              Height = 495
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
              Header.DefaultHeight = 17
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
          object ipnlSearch: TMHLInfoPanel
            AlignWithMargins = True
            Left = 5
            Top = 550
            Width = 498
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
          object pnlFullSearch: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 2
            Width = 498
            Height = 44
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
            object RzGroupBox2: TRzGroupBox
              AlignWithMargins = True
              Left = 225
              Top = 0
              Width = 270
              Height = 43
              Margins.Left = 225
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              TabOrder = 1
              object lblTotalBooksFL: TRzLabel
                AlignWithMargins = True
                Left = 254
                Top = 17
                Width = 12
                Height = 22
                Align = alRight
                Alignment = taRightJustify
                Caption = '()'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                CenterPoint = cpLeftCenter
              end
              object Label1: TLabel
                AlignWithMargins = True
                Left = 4
                Top = 17
                Width = 36
                Height = 22
                Align = alLeft
                Alignment = taRightJustify
                Caption = #1055#1088#1077#1089#1077#1090
              end
              object cbPresetName: TRzComboBox
                Left = 43
                Top = 14
                Width = 126
                Height = 21
                AutoComplete = False
                ItemHeight = 13
                TabOrder = 0
                OnChange = cbPresetNameChange
                OnSelect = cbPresetNameSelect
              end
              object btnDeletePreset: TRzBitBtn
                Left = 214
                Top = 14
                Width = 31
                Height = 21
                Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1077#1089#1077#1090
                Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
                Enabled = False
                LightTextStyle = True
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = btnDeletePresetClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  0800000000000001000000000000000000000001000000000000000000000101
                  0100020202000303030004040400050505000606060007070700080808000909
                  09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
                  1100121212001313130014141400151515001616160017171700181818001919
                  19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020001F25
                  1F001D2A1D001C2E1C001B331B001A371A00183D18001542150013471300114B
                  11000F500F000D540D000A570A00095A0900075D0700065E0600046004000461
                  040003620300046104000461040005600500065F0600085E08000A5D0A000C5B
                  0C000F5A0F0012581200155615001A541A001E521E0023502300284D28002F4B
                  2F00334A3300374937003B483B00404740004646460047474700484848004949
                  49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
                  5100525252005353530054545400555555005656560057575700585858005959
                  59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
                  6100626262006363630064646400656565006666660067676700686868006969
                  69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
                  7100727272007373730074747400757575007676760077777700787878007979
                  79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
                  8100828282008383830084848400858585008686860087878700888888008989
                  89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
                  9100929292009393930094949400959595009696960097979700989898009999
                  99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
                  A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
                  A900AAAAAA00ABABAB00B1B0B000BFBDBC00CECCCA00DEDCD900EBE9E600F5F2
                  EF00FAF7F400FDFAF600FDFBF800FEFBF800FEFCF900FEFCF900FEFCF900FEFB
                  F800FEFAF600FEF9F300FEF8F000FEF7EE00FEF6ED00FEF6EB00FEF5EA00FEF4
                  E800FEF3E600FEF2E400FEF1E100FEF0DF00FEEEDC00FEEDDA00FEECD800FEEC
                  D700FEECD600FEEBD400FEEAD300FDE9D100FDE8CF00FDE7CD00FCE6CB00FAE0
                  C300F7D8B600F1C99E00E7AF7500DE985100D5812D00D0761B00CE6E0F00CC69
                  0700CB670300CA660200C9640200C7630100C6610100C25D0000BD580000B852
                  0000B04A0000A8420000A23C00009F3900009D3700009B3500009A3400009B34
                  02009E330900A3301500AC2B2C00B9244E00C81C7400D9139F00E80BC600F803
                  ED00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                  FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00F8F8F8F8F8F8
                  F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8DADADADADADA
                  DADADAF8F8F8F8F8F8F8B7B9BCC1C4C7CCCFDAF8F8F8F8F8F8F8B7B6BBBEC3C6
                  CBCFDAF8F8F8F8F8F8F8B7B7BABDC2C5C9CDDAF8F8F8F8F8F8F8E8E8E8E8E8E8
                  E8E8E8E8E8DAF832F8F8B7B6BABCC0C3C5C8CCCFD0DAF83232F8B7B7BABBBEC2
                  C4C7CBCED0DAF8329A32B7B7B9BBBDC1C4C6CBCDCFDAF83232F8E8E8E8E8E8E8
                  E8E8E8E8E8DAF832F8F8B7B7BABDC3C6CBCFDAF8F8F8F8F8F8F8B7B7B9BCC1C5
                  C9CEDAF8F8F8F8F8F8F8B7B7B7BABEC3C7CBDAF8F8F8F8F8F8F8DADADADADADA
                  DADADAF8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8}
              end
              object btnSavePreset: TRzBitBtn
                Left = 177
                Top = 14
                Width = 31
                Height = 21
                Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1077#1089#1077#1090
                Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
                Enabled = False
                LightTextStyle = True
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = btnSavePresetClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF7F2B287F2B28A18283A18283A18283A1
                  8283A18283A18283A182837A1C1C7F2B28FF00FFFF00FFFF00FFFF00FF7F2B28
                  CA4D4DB64545DDD4D5791617791617DCE0E0D7DADECED5D7BDBABD76100F9A2D
                  2D7F2B28FF00FFFF00FFFF00FF7F2B28C24A4BB14444E2D9D9791617791617D9
                  D8DAD9DEE1D3D9DCC1BDC1761111982D2D7F2B28FF00FFFF00FFFF00FF7F2B28
                  C24A4AB04242E6DCDC791617791617D5D3D5D8DEE1D7DDE0C6C2C5700F0F962C
                  2C7F2B28FF00FFFF00FFFF00FF7F2B28C24A4AB04141EADEDEE7DDDDDDD4D5D7
                  D3D5D5D7D9D7D8DACAC2C57E17179E31317F2B28FF00FFFF00FFFF00FF7F2B28
                  BF4748B84545BA4C4CBD5757BB5756B64E4EB44949BD5251BB4B4CB54242BF4A
                  4A7F2B28FF00FFFF00FFFF00FF7F2B28A33B39B1605DC68684CB918FCC9190CC
                  908FCB8988C98988CB9391CC9696BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
                  BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
                  4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
                  F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
                  BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
                  4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
                  F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
                  BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
                  4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
                  F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FFFF00FF
                  7F2B28F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F77F2B
                  28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
            object RzGroupBox5: TRzGroupBox
              Left = 4
              Top = 1
              Width = 217
              Height = 42
              TabOrder = 0
              object btnClearFilterEdits: TRzBitBtn
                Left = 127
                Top = 10
                Width = 83
                Caption = #1054#1095#1080#1089#1090#1080#1090#1100
                TabOrder = 1
                OnClick = btnClearFilterEditsClick
                Kind = bkRetry
              end
              object btnApplyFilter: TRzBitBtn
                Left = 7
                Top = 10
                Width = 114
                Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
                TabOrder = 0
                OnClick = btnApplyFilterClick
                Kind = bkOK
              end
            end
          end
        end
      end
    end
    object TabSheet5: TRzTabSheet
      HelpContext = 125
      Caption = #1043#1088#1091#1087#1087#1099
      object cpCoverF: TMHLCoverPanel
        AlignWithMargins = True
        Left = 685
        Top = 3
        Width = 250
        Height = 655
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
        OnResize = CoverPanelResize
        Fb2InfoVisible = False
        FontSize = 0
        AnnotationColor = clBlack
      end
      object rzsSplitterF: TRzSplitter
        Left = 0
        Top = 0
        Width = 685
        Height = 661
        Position = 239
        Percent = 35
        Align = alClient
        TabOrder = 1
        BarSize = (
          239
          0
          243
          661)
        UpperLeftControls = (
          RzPanel7)
        LowerRightControls = (
          RzPanel20)
        object RzPanel7: TRzPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 233
          Height = 655
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 0
          object tvGroups: TVirtualStringTree
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 223
            Height = 610
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
            Header.DefaultHeight = 17
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'Tahoma'
            Header.Font.Style = []
            Header.MainColumn = -1
            Header.Options = [hoColumnResize, hoDrag]
            ParentFont = False
            TabOrder = 0
            TreeOptions.PaintOptions = [toPopupMode, toShowHorzGridLines, toThemeAware, toUseBlendedImages]
            TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
            OnChange = tvGroupsChange
            OnDragOver = tvGroupsDragOver
            OnDragDrop = tvGroupsDragDrop
            OnGetText = tvGroupsGetText
            OnGetNodeDataSize = tvGroupsGetNodeDataSize
            Columns = <>
          end
          object RzPanel8: TRzPanel
            AlignWithMargins = True
            Left = 5
            Top = 621
            Width = 223
            Height = 29
            Align = alBottom
            BorderOuter = fsFlatRounded
            TabOrder = 1
            DesignSize = (
              223
              29)
            object RzToolButton2: TRzToolButton
              Left = 250
              Top = 8
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100
              ImageIndex = 36
              Images = ilMainMenu
              Anchors = [akTop, akRight]
              ParentShowHint = False
              ShowHint = True
              OnClick = btnClearEdSeriesClick
            end
            object btnAddGroup: TRzBitBtn
              Left = 6
              Top = 2
              Width = 29
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnAddGroupClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                0800000000000001000000000000000000000001000000000000000000000101
                0100020202000303030004040400050505000606060007070700080808000909
                09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
                1100121212001313130014141400151515001616160017171700181818001919
                19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
                2100222222002323230024242400252525002626260027272700282828002929
                29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
                3100323232003333330034343400353535003636360037373700383838003939
                39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
                410042424200434343004444440045454500464646004747470059454E006C43
                57008143590093435B00A1425600A1434B009C454100964738008C492F00834A
                2700794C2000704E1A006051140052530F0046560B003B580800325A05002A5B
                0400245D03001C5E020016600100106100000C62000008630000066400000564
                000003640000076B070009700C000B740F000F75120013761300157513001B70
                100028670C00365C0700494E0000594900006A440000754000007D3E0000893A
                0000913700009635000098350000993600009A3600009B3700009E3A0000A23E
                0000A9440000AF4A0000B5500000BC560000C05B0000C5600000C8630000CA65
                0100CB660100CB660100CB660100CB660100CB660100CB660100CB660100CA65
                0100CA650100C9650200C8640300C6640500C5650800C3660C00C1681200BE6B
                1A00BA702700B5783A00AE7E4D00A7856400A28B7300A08E7C009E9285009C96
                8F009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
                A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
                A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
                B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
                B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
                C100C2C2C200C6C5C400CAC9C700CFCDCA00D3D0CC00D6D3CE00DCD7D200E1DB
                D400EBE5DD00F3EDE500F8F2EA00FBF5ED00FDF7F000FEF8F100FEF9F200FEF9
                F300FEFAF400FEFAF500FEF9F200FEF8EF00FEF6EC00FEF5EA00FEF4E800FEF3
                E600FEF2E300FEF0E100FEEFDE00FEEEDC00FEEDDB00FEECD800FEEBD700FEEA
                D400FEEAD300FEE7D300FEE1D400FED1D700FEB8DB00FE93E100FE68E900FE4A
                EF00FE21F700FE0CFC00FE03FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00F6F6F6F6F6F6
                F6F6F6F6F6F6F6F6F6F686868686868686F6F6F6F6F6F6F6F6F6D3D0D8DDE2E3
                86F6F6F6F6F6F6F6F6F6D3D3D6DADFE386F6F6F6F6F6F6F6F6F6D3D3CFD8DDE2
                86F6F6F6F6F6F6F6F6F674747474747486F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
                F6F662F6867474747474F6F6F6F6F6F6F66262F686D0D8DDE2E3F6F6F6F6F6F6
                629662F686D3D6DADFE3F6F6F6F6F6F6F66262F686D3CFD8DDE2F6F6F6F6F6F6
                F6F662F686747474747474747474747486F6F6F6F6F6F6F6F6F6D3D0D8DDE2E3
                86F6F6F6F6F6F6F6F6F6D3D3D6DADFE386F6F6F6F6F6F6F6F6F6D3D3CFD8DDE2
                86F6F6F6F6F6F6F6F6F686868686868686F6F6F6F6F6F6F6F6F6}
            end
            object btnDeleteGroup: TRzBitBtn
              Left = 184
              Top = 2
              Width = 29
              Hint = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btnDeleteGroupClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                0800000000000001000000000000000000000001000000000000000000000101
                0100020202000303030004040400050505000606060007070700080808000909
                09000A0A0A000B0B0B000B0F0B000B140B000B180B000B1C0B000B200B000A26
                0A000A2B0A00092F09000833080007370700063A0600053E0500044004000343
                0300034403000246020002460200024702000247020002460200034603000445
                0400054405000643060008420800094109000B3F0B000E3D0E00113B1100143A
                1400173817001B361B001F341F002233220025332500293229002D312D003131
                3100323232003333330034343400353535003636360037373700383838003939
                39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
                4100424242004343430044444400454545004646460047474700484848004949
                49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
                5100525252005353530054545400555555005656560057575700585858005959
                59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
                6100626262006363630064646400656565006666660067676700686868006969
                69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
                7100727272007373730074747400757575007676760077777700787878007979
                79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
                8100828282008383830084848400858585008686860087878700888888008989
                89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
                9100929292009393930094949400959595009696960097979700989898009999
                99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
                A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
                A900AAAAAA00ABABAB00B1B0AF00BFBDBB00CECBC800E0DDD900EDEAE700F6F3
                EF00FBF7F300FDF9F600FEFBF800FEFBF800FEFBF800FEFAF600FEF9F400FEF8
                F200FEF7F000FEF6ED00FEF5EB00FEF4E900FEF3E700FEF2E500FEF1E300FEF0
                E000FEEFDE00FEEEDB00FEECD800FEEAD400FEE8D000FEE7CE00FEE7CC00FEE6
                CB00FEE6CA00FEE5C800FEE4C600FDE3C400FDE2C300FDE1C100FBDCBB00F8D6
                B300F4CDA900ECBA9100E3A77800D98F5900CF793D00C7692900C25C1800BF54
                0E00BC4F0700BB4C0200BB4B0100BB4A0000B8480000B4450000AF410000A83C
                00009E340000932C00008B2500008823000085210000831F0000831F0000841F
                0200881F08008E1D150099192E00AB155200BF107B00D50AA900E905D300F602
                ED00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
                FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00F8F8F8F8F8F8
                F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8DBDBDBDBDBDB
                DBDBDBF8F8F8F8F8F8F8B5B8BCC0C4C7CDCFDBF8F8F8F8F8F8F8B5B6BABEC3C6
                CBCFDBF8F8F8F8F8F8F8B5B5B9BDC2C5C9CEDBF8F8F8F8F8F8F8E7E7E7E7E7E7
                E7E7E7E7E7DBF81DF8F8B5B6B9BCC0C3C5C8CCCFD0DBF81D1DF8B5B5B8BABEC2
                C4C6CBCFD0DBF81D821DB5B5B7BABEC1C4C6CBCECFDBF81D1DF8E7E7E7E7E7E7
                E7E7E7E7E7DBF81DF8F8B5B5B9BEC3C5CBCFDBF8F8F8F8F8F8F8B5B5B7BCC1C5
                C9CFDBF8F8F8F8F8F8F8B5B5B5BABEC3C6CCDBF8F8F8F8F8F8F8DBDBDBDBDBDB
                DBDBDBF8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8}
            end
          end
        end
        object RzPanel20: TRzPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 439
          Height = 655
          Margins.Right = 0
          Align = alClient
          BorderOuter = fsFlatRounded
          TabOrder = 0
          object RzPanel21: TRzPanel
            AlignWithMargins = True
            Left = 5
            Top = 5
            Width = 429
            Height = 539
            Align = alClient
            BorderOuter = fsNone
            TabOrder = 0
            object tvBooksF: TVirtualStringTree
              Tag = 4
              AlignWithMargins = True
              Left = 3
              Top = 34
              Width = 423
              Height = 502
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
              Header.DefaultHeight = 17
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
            object RzPanel6: TRzPanel
              Left = 0
              Top = 0
              Width = 429
              Height = 31
              Align = alTop
              BorderOuter = fsNone
              TabOrder = 1
              object lblBooksTotalF: TRzLabel
                AlignWithMargins = True
                Left = 414
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
              end
              object lblGroups: TRzLabel
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
              end
            end
          end
          object ipnlFavorites: TMHLInfoPanel
            AlignWithMargins = True
            Left = 5
            Top = 550
            Width = 429
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
              429
              100)
            object lblTotalBooksF: TRzLabel
              AlignWithMargins = True
              Left = 1601
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
            end
            object btnClearFavorites: TRzBitBtn
              Left = 795
              Top = 66
              Width = 118
              Anchors = [akRight, akBottom]
              Caption = #1054#1095#1080#1089#1090#1080#1090#1100
              Enabled = False
              TabOrder = 0
              OnClick = btnClearFavoritesClick
              Kind = bkRetry
            end
            object btnClearGroup: TRzBitBtn
              Left = 304
              Top = 66
              Width = 118
              Anchors = [akRight, akBottom]
              Caption = #1054#1095#1080#1089#1090#1080#1090#1100
              TabOrder = 1
              OnClick = btnClearFavoritesClick
              Kind = bkRetry
            end
          end
        end
      end
    end
    object TabSheet7: TRzTabSheet
      HelpContext = 108
      Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1095#1077#1082
      object tlbrDownloadList: TRzToolbar
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 42
        Height = 655
        Align = alLeft
        AutoStyle = False
        Images = ilDownloadToolBar
        TopMargin = 20
        ButtonWidth = 30
        TextOptions = ttoCustom
        AutoSize = True
        BorderInner = fsNone
        BorderOuter = fsFlatRounded
        BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
        BorderWidth = 5
        FullRepaint = True
        GradientColorStyle = gcsCustom
        GradientDirection = gdVerticalCenter
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        VisualStyle = vsClassic
        ToolbarControls = (
          btnStartDownload
          btnPauseDownload
          RzSpacer1
          BtnFirstRecord
          BtnDwnldUp
          BtnDwnldDown
          BtnLastRecord
          RzSpacer2
          BtnDelete
          RzSpacer3
          BtnSave)
        object RzSpacer1: TRzSpacer
          Left = 5
          Top = 70
          Width = 26
        end
        object BtnDwnldUp: TRzToolButton
          Tag = 21
          Left = 5
          Top = 120
          Hint = #1042#1074#1077#1088#1093
          DisabledIndex = 1
          ImageIndex = 0
          Caption = 'Up'
          OnClick = MoveDwnldListNodes
        end
        object BtnDwnldDown: TRzToolButton
          Tag = 22
          Left = 5
          Top = 145
          Hint = #1042#1085#1080#1079
          DisabledIndex = 3
          ImageIndex = 2
          Caption = 'Down'
          OnClick = MoveDwnldListNodes
        end
        object BtnDelete: TRzToolButton
          Left = 5
          Top = 220
          Hint = #1059#1076#1072#1083#1080#1090#1100
          DisabledIndex = 5
          ImageIndex = 4
          Caption = 'Delete'
          OnClick = btnDeleteDownloadClick
        end
        object BtnFirstRecord: TRzToolButton
          Tag = 20
          Left = 5
          Top = 95
          Hint = #1042' '#1085#1072#1095#1072#1083#1086
          DisabledIndex = 7
          ImageIndex = 6
          Caption = 'First Record'
          OnClick = MoveDwnldListNodes
        end
        object BtnLastRecord: TRzToolButton
          Tag = 23
          Left = 5
          Top = 170
          Hint = #1042' '#1082#1086#1085#1077#1094
          DisabledIndex = 9
          ImageIndex = 8
          Caption = 'Last Record'
          OnClick = MoveDwnldListNodes
        end
        object RzSpacer2: TRzSpacer
          Left = 5
          Top = 195
          Width = 27
        end
        object btnStartDownload: TRzToolButton
          Left = 5
          Top = 20
          Hint = #1057#1090#1072#1088#1090
          DisabledIndex = 11
          ImageIndex = 10
          Caption = 'Play'
          OnClick = btnStartDownloadClick
        end
        object btnPauseDownload: TRzToolButton
          Left = 5
          Top = 45
          Hint = #1057#1090#1086#1087
          DisabledIndex = 15
          ImageIndex = 14
          Caption = 'Stop'
          OnClick = btnPauseDownloadClick
        end
        object BtnSave: TRzToolButton
          Left = 5
          Top = 270
          Hint = 'Save'
          DisabledIndex = 17
          ImageIndex = 16
          Caption = 'Save'
          OnClick = BtnSaveClick
        end
        object RzSpacer3: TRzSpacer
          Left = 5
          Top = 245
          Width = 32
        end
      end
      object Panel1: TPanel
        Left = 48
        Top = 0
        Width = 890
        Height = 661
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 1
        object RzPanel2: TRzPanel
          AlignWithMargins = True
          Left = 3
          Top = 597
          Width = 884
          Height = 61
          Align = alBottom
          BorderOuter = fsFlatRounded
          TabOrder = 0
          DesignSize = (
            884
            61)
          object pbDownloadProgress: TRzProgressBar
            Left = 6
            Top = 22
            BorderWidth = 0
            InteriorOffset = 0
            PartsComplete = 0
            Percent = 0
            TotalParts = 0
            Visible = False
          end
          object lblDownloadState: TLabel
            Left = 6
            Top = 3
            Width = 53
            Height = 13
            Caption = #1054#1078#1080#1076#1072#1085#1080#1077
          end
          object lblDnldAuthor: TLabel
            Left = 224
            Top = 8
            Width = 6
            Height = 13
            Caption = '  '
          end
          object lblDnldTitle: TLabel
            Left = 224
            Top = 27
            Width = 8
            Height = 16
            Caption = '  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDownloadCount: TRzLabel
            AlignWithMargins = True
            Left = 867
            Top = 5
            Width = 12
            Height = 51
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
          end
          object btnClearDownload: TRzBitBtn
            Left = 763
            Top = 31
            Width = 118
            Margins.Right = 8
            Margins.Bottom = 8
            Anchors = [akRight, akBottom]
            Caption = #1054#1095#1080#1089#1090#1080#1090#1100
            TabOrder = 0
            OnClick = btnClearDownloadClick
            Kind = bkRetry
          end
        end
        object tvDownloadList: TVirtualStringTree
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 884
          Height = 588
          Align = alClient
          Header.AutoSizeIndex = 0
          Header.DefaultHeight = 17
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -12
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = [fsBold]
          Header.Options = [hoColumnResize, hoDrag, hoVisible]
          PopupMenu = pmDownloadList
          TabOrder = 1
          TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines]
          TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect]
          OnGetText = tvDownloadListGetText
          OnPaintText = tvDownloadListPaintText
          OnLoadNode = tvDownloadListLoadNode
          OnSaveNode = tvDownloadListSaveNode
          Columns = <
            item
              Position = 0
              Width = 200
              WideText = #1040#1074#1090#1086#1088
            end
            item
              Position = 1
              Width = 200
              WideText = #1053#1072#1079#1074#1072#1085#1080#1077
            end
            item
              Alignment = taRightJustify
              Position = 2
              Width = 100
              WideText = #1056#1072#1079#1084#1077#1088
            end
            item
              Alignment = taCenter
              Position = 3
              Width = 100
              WideText = #1057#1090#1072#1090#1091#1089
            end>
        end
      end
    end
  end
  object MainMenu: TMainMenu
    Images = ilMainMenu
    OwnerDraw = True
    Left = 616
    Top = 288
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
      object miDownloadBooks: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1095#1082#1080
        ImageIndex = 20
        OnClick = miDownloadBooksClick
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
      object miFastBookSearch: TMenuItem
        Caption = #1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082
        ShortCut = 114
        OnClick = miFastBookSearchClick
      end
      object N31: TMenuItem
        Caption = '-'
      end
      object miDeleteBook: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        ImageIndex = 0
        OnClick = miDeleteBookClick
      end
      object miDeleteFiles: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083'('#1099')'
        OnClick = miDeleteFilesClick
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
      Caption = #1050#1086#1083#1083#1077#1082#1094#1080#1103
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
      object N38: TMenuItem
        Caption = '-'
      end
      object N39: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090
        object miCollectionImport: TMenuItem
          Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1079' xml'
          Enabled = False
          ImageIndex = 5
          OnClick = miCollectionImportClick
        end
        object N14: TMenuItem
          Caption = '-'
        end
        object miImportUserData: TMenuItem
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1077' '#1076#1072#1085#1085#1099#1077
          OnClick = miImportUserDataClick
        end
      end
      object N40: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090
        object miCollectionExport: TMenuItem
          Caption = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' xml'
          Enabled = False
          ImageIndex = 10
          OnClick = miCollectionExportClick
        end
        object miINPXCollectionExport: TMenuItem
          Caption = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' inpx'
          Enabled = False
          OnClick = miINPXCollectionExportClick
        end
        object N41: TMenuItem
          Caption = '-'
        end
        object miExportUserData: TMenuItem
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1077' '#1076#1072#1085#1085#1099#1077
          OnClick = miExportUserDataClick
        end
      end
      object N6: TMenuItem
        Caption = #1054#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1077
        object miRepairDataBase: TMenuItem
          Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1086#1096#1080#1073#1082#1080
          OnClick = miRepairDataBaseClick
        end
        object miCompactDataBase: TMenuItem
          Caption = #1057#1078#1072#1090#1100
          OnClick = miCompactDataBaseClick
        end
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object miDeleteCol: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        ImageIndex = 2
        OnClick = miDeleteColClick
      end
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
      object N9: TMenuItem
        Caption = '-'
      end
      object miRefreshGenres: TMenuItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082'  '#1078#1072#1085#1088#1086#1074
        Enabled = False
        ImageIndex = 25
        OnClick = miRefreshGenresClick
      end
      object miUpdate: TMenuItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1082#1072#1090#1072#1083#1086#1075#1080'  lib.rus.ec'
        ImageIndex = 34
        OnClick = miUpdateClick
      end
      object miSyncOnline: TMenuItem
        Caption = #1057#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083#1099
        OnClick = miSyncOnlineClick
      end
      object N26: TMenuItem
        Caption = '-'
      end
      object N34: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1087#1082#1091' "'#1044#1083#1103' '#1095#1090#1077#1085#1080#1103'"'
        OnClick = N34Click
      end
      object N36: TMenuItem
        Caption = '-'
      end
      object miSettings: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        ImageIndex = 11
        OnClick = miSettingsClick
      end
    end
    object N5: TMenuItem
      Caption = '?'
      object miShowHelp: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
        ImageIndex = 17
        OnClick = miShowHelpClick
      end
      object miCheckUpdates: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1085#1072#1083#1080#1095#1080#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
        OnClick = miCheckUpdatesClick
      end
      object N30: TMenuItem
        Caption = '-'
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
    OnPopup = pmMainPopup
    Left = 368
    Top = 312
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
    object N44: TMenuItem
      Caption = '-'
    end
    object miReaded: TMenuItem
      Caption = #1055#1088#1086#1095#1080#1090#1072#1085#1086
      ShortCut = 16466
      OnClick = miReadedClick
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object pmiDownloadBooks: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1095#1077#1082
      ImageIndex = 20
      ShortCut = 16460
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
      Tag = 1
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1080#1079#1073#1088#1072#1085#1085#1086#1077
      ImageIndex = 13
      ShortCut = 16454
      OnClick = miAddFavoritesClick
    end
    object pmiGroups: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1075#1088#1091#1087#1087#1091
    end
    object miDelFavorites: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1075#1088#1091#1087#1087#1099
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
    object pmiCheckAll: TMenuItem
      Tag = 2
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 24
      ShortCut = 16449
      OnClick = pmiCheckAllClick
    end
    object pmiSelectAll: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16467
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
  object VersionInfo: TRzVersionInfo
    FilePath = 'MyHomeLib.exe'
    Left = 568
    Top = 528
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 488
    Top = 528
  end
  object pmAuthor: TPopupMenu
    OwnerDraw = True
    OnPopup = pmAuthorPopup
    Left = 448
    Top = 312
    object miCopyAuthor: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088' '
      ShortCut = 16451
      OnClick = miCopyAuthorClick
    end
    object N37: TMenuItem
      Caption = '-'
    end
    object miAddToSearch: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' "'#1055#1086#1080#1089#1082'"'
      OnClick = miAddToSearchClick
    end
  end
  object ilToolBar: TImageList
    ColorDepth = cd32Bit
    BlendColor = clWhite
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Left = 280
    Top = 312
    Bitmap = {
      494C010118001A00480020002000FFFFFF002110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000E0000000010020000000000000C0
      0100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000595656CA595656CA5956
      56CA595656CA595656CA595656CA595656CA595656CA595656CA595656CA5956
      56CA595656CA595656CA595656CA777777CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FCA3F3F3FCA3F3F3FCA3F3F3FCA3F3F3FCA3F3F3FCA3F3F
      3FCA3F3F3FCA3F3F3FCA777777CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000817076CAB29FA5FFBFBFBFFFBFBF
      BFFFBFBFBFFFBFBFBFFFBD9DA7FFA78590FFD1D0D1FFBFBFBFFFBFBFBFFFBFBF
      BFFFC9B9BEFFAF949DFF595656CA777777CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFEFFFEFEFCFFFDFDFCFFFDFDFAFFFCFCF8FFFBFBF8FFFAFAF5FFF8F8
      F4FFFBFBF5FF3F3F3FCA777777CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000013421E019E894403DE0401002C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000010101040101010401010104010101040101
      0104010101040101010401010103000000000000000000000000000000000000
      00000000000000000000000000000000000000000000323232CA202121CA2323
      23CA232323CA222323CA222323CA222323CAC28498FF8F2547FF8A2646FF7D2A
      44FF7E314AFF862A47FF952E4EFF973050FF852644FF7D2F48FF802D48FF8927
      46FF932A4CFFA36176FF595656CA777777CA0000000000000000000000000000
      00000000000000000000000000000000000000000000323232CA202121CA2323
      23CA232323CA222323CA222323CA222323CA222323CA222223CA222323CA2323
      23CACCCCBBFFCBCBBAFFDCDCCBFFD2D2C1FFFBFBF8FFFAFAF5FFF8F8F4FFF7F7
      F2FFFBFBF5FF3F3F3FCA777777CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000021407005993581CE3D2C8ADFFD9C79EFF743800CD0000
      000C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010122010101220101
      0122010101220101012201010122010101220101012201010122010101220101
      0122010101220101012201010122010101220101012201010122010101220101
      0122010101220101012201010106000000000000000000000000000000000000
      000000000000000000000000000000000000777777CA313030FF323232FF3635
      36FF363433FF363432FF383535FF383531FFC18296FFA4506AFFB0677EFFAD64
      7AFFAA5F75FFA7576EFFA14862FFAA5870FFB56F85FFAC6278FFA75970FFAA5D
      75FFAF5F79FF9D5A70FF595656CA777777CA0000000000000000000000000000
      000000000000000000000000000000000000777777CA313030FF323232FF3635
      36FF363433FF363432FF383535FF383531FF363431FF363532FF353332FF3330
      2EFFEDEDDCFFEDEDDCFFECECDBFFEBEBDAFFFAFAF5FFF8F8F4FFF7F7F2FFF6F6
      F0FFFAFAF2FF3F3F3FCA777777CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000002010022602B00BEC59E67FFD6E5EBFFD3ECFFFFDFF9FFFFD6B885FF3F1A
      009B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010103010101080101
      010B0101010B0101010B0101010B0101010B525252FF525252FF525252FF5252
      52FF525252FF525252FF525252FF525252FF535353FF555555FF565656FF5656
      56FF565656FF565656FF565656FF565656FF565656FF565656FF565656FF5656
      56FF565656FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000474748CA605B5AFF87807BFF7D76
      70FF8D8586FF867C7DFF7E7874FF7A7470FFC18296FFA6556EFFC48D9EFFD7B0
      BCFFDAB5BFFFC18798FFA34C65FFAB5C73FFD5ABB7FFDDBAC5FFCC9DACFFBD82
      95FFB0627BFF5D3240CA595656CA777777CA0000000000000000000000000000
      000000000000000000000000000000000000474748CA605B5AFF87807BFF7D76
      70FF8D8586FF867C7DFF7E7874FF7A7470FF78726EFF726C69FF67605CFF8077
      78FFCBCBBAFFDBDBCAFFC9C9B8FFC7C7B6FFD7D7C6FFD6D6C5FFCCCCBBFFD3D3
      C2FFFAFAF2FF3F3F3FCA777777CA000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000C260E
      007B9F682FEED0CAB7FFD5EBFDFFCDE4F9FFC0BFC1FFCDD3DAFFE2FAFFFFCD9A
      57FF1C0A006A0000000000000000000000000000000600000011000000000000
      0000000000000000000000000000000000000101010301010111010101270101
      013501010138010101380101013801010138434343FFAEAFB1FFAEAFB1FFAEAF
      B1FFAEAFB1FFAEAFB1FFAEAFB1FFB1B2B3FFBDBEC0FFD1D2D3FFDDDEE0FFE0E1
      E3FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1
      E3FFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000414141CA66615FFF8C8884FF7A75
      71FF989391FF888080FF7E7876FF7B7571FFC18296FFA6556FFFC48D9EFFD7B0
      BCFFDAB5BFFFC18798FFA34C65FFAB5C73FFD5ABB7FFDDBAC5FFCC9DACFFBD82
      95FFAE5F79FF592C3BCA595656CA777777CA0000000000000000000000000000
      000000000000000000000000000000000000414141CA66615FFF8C8884FF7A75
      71FF989391FF888080FF7E7876FF7B7571FF7A736FFF736D6AFF5F5A55FF8983
      80FFECECDBFFEBEBDAFFE9E9D8FFE8E8D7FFE7E7D6FFE5E5D4FFE4E4D3FFE3E3
      D2FFF9F9EFFF3F3F3FCA777777CA000000000000000000000000000000000000
      000000000000000000000000000000000000000000000D040049773F0DD4C7AF
      8EFFD5E7F2FFD2ECFFFFC5D1DEFFBC9674FFCC8124FFC38745FFCFDDEBFFE1F0
      EEFFBB782AF90C04004500000000000000001E1C2C9748499AF6110F157A0000
      0004000000000000000000000000000000000101010801010127010101540101
      01730101017B0101017B0101017B0101017B2D2D2DFF848484FF7A7A7BFF7A7A
      7BFF7A7A7BFF7A7A7BFF7A7A7BFF818182FF9C9D9EFFC6C7C8FFE2E3E5FFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000434343CA757171FF96918EFF7E78
      74FF6E6965FF726D68FF797471FF7C7673FFC18296FFA6556FFFC48D9EFFD7B0
      BCFFDAB5BFFFC18798FFA34C65FFAB5C73FFD5ABB7FFDDBAC5FFCC9DACFFBD82
      95FFAC5D77FF562937CA595656CA777777CA0000000000000000000000000000
      000000000000000000000000000000000000434343CA757171FF96918EFF7E78
      74FF6E6965FF726D68FF797471FF7C7673FF7D7774FF77716EFF68625DFF5E59
      55FFC9C9B8FFC7C7B6FFC6C6B5FFD6D6C5FFC3C3B2FFD3D3C2FFD2D2C1FFC8C8
      B7FFF7F7EAFF3F3F3FCA777777CA000000000000000000000000000000000000
      000000000000000000000000000000000012401A00A0B6834AFFCFD4CFFFD5EE
      FFFFCADFF3FFBEB5B2FFC07E3AFFD78919FFE09F32FFDA9329FFBF8D5FFFD7EF
      FFFFDFE4D7FF8F4B0ADC00000012100F18824A55CFFF5280FDFF5377E6FF1915
      229A000000000000000000000000000000000101010B2543CBFF1D4AA9FF1D4A
      A9FF1D4AA9FF1D4AA9FF1D4AA9FF1D4AA9FF1D4AA9FF1D4AA9FF1D4AA9FF1D4A
      A9FF1D4AA9FF1D4AA9FF1D4AA9FF1D4AA9FF818182FFB9BABBFFDFE0E2FFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000474747CA7B7877FF979291FF8781
      80FF7B7876FF7D7978FF837D7BFF817B7AFFC18296FFA7566FFFC48E9FFFD8B1
      BEFFDBB6C1FFC48C9CFFA7556DFFB0667BFFD8B1BCFFDFBFC9FFD0A3B2FFC189
      9BFFAD5F78FF853A52FF595656CA777777CA0000000000000000000000000000
      000000000000000000000000000000000000474747CA7B7877FF979291FF8781
      80FF7B7876FF7D7978FF837D7BFF817B7AFF847D7AFF7E7976FF716C68FF6A66
      64FFE9E9D8FFE8E8D7FFE7E7D6FFE5E5D4FFE4E4D3FFE3E3D2FFE2E2D1FFE0E0
      CFFFF4F4E5FF3F3F3FCA777777CA000000000000000000000000000000000000
      000000000000000000011C0A006A894E17E6C4B69EFFD5EBFAFFCFE7FDFFC2C9
      D2FFBD8E5FFFCD7B13FFDC931EFFDD9A2EFFDD9C35FFE0A33EFFD99432FFC4AA
      94FFDCF8FFFFDECCA2FF573C3FE1414EC7F96591FFFF68A7FFFF4C75F8FF4E51
      B1FE020202330000000000000000000000000101010B2543CBFFA4B5FCFF9DAF
      FCFF93A7FBFF889EFBFF7D95FAFF708AFAFF6381F9FF5576F9FF486BF8FF3B61
      F8FF2F57F7FF254FF7FF1C48F6FF1D4AA9FF7A7A7BFFB6B7B8FFDFE0E2FFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000464646CA4B4848FF5E595BFF645F
      60FF615B5CFF686363FF7D7476FF706567FFC18296FFA7566FFFC48EA0FFD8B2
      BEFFDCB6C2FFC48C9CFFA7566DFFB0667CFFD8B1BCFFE0BFC9FFD1A6B3FFC48E
      A0FFAF657DFF81334CFF595656CA777777CA0000000000000000000000000000
      000000000000000000000000000000000000464646CA4B4848FF5E595BFF645F
      60FF615B5CFF686363FF7D7476FF706567FF676062FF4F484AFF3A3333FF352E
      2DFFC6C6B5FFD6D6C5FFC3C3B2FFC2C2B1FFC1C1B0FFC0C0AFFFCFCFBEFFC6C6
      B5FFF3F3E2FF3F3F3FCA777777CA000000000000000000000000000000000000
      000003010025592601BEB6936BFFD2DEE4FFD3EDFFFFC8DCF0FFBBA08DFFC477
      1CFFD8880EFFDC9521FFDB9629FFDC9A2FFFDD9D36FFDFA13EFFE3A846FFD38F
      38FFCDBFB0FF8F9CD4FF4250D6FF6894FEFF6FACFFFF4F80FFFF485AE7FF4E52
      B6FF0504053E0000000000000000000000000101010B2543CBFFA6B6FCFF9FB0
      FCFF96A9FBFF8BA1FBFF8097FAFF738DFAFF6682F9FF5878F9FF4B6DF8FF3E63
      F8FF3259F7FF2751F7FF1E49F6FF1D4AA9FF818182FFB9BABBFFDFE0E2FFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000414141CA565252FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFC08195FFA6566FFFC48E9FFFD8B1
      BDFFDBB6C1FFC38B9BFFA7546CFFB0657AFFD7B0BCFFDFBFC9FFD1A5B3FFC38E
      9FFFAF637BFF7D2D48FF595656CA777777CA0000000000000000000000000000
      000000000000000000000000000000000000414141CA565252FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFA4A2A3FFA09D9EFF9B999AFF9C99
      9AFFE7E7D6FFE5E5D4FFE4E4D3FFE3E3D2FFF1F1E7FFECECDFFFE8E8D9FFE6E6
      D5FFF2F2E1FF3F3F3FCA777777CA0000000000000000000000000000000A2810
      00809F6530F9C3BDAFFFD6EDFFFFCEE5FAFFBFBABBFFBE8344FFCE7805FFDA8D
      12FFD9911DFFDA9323FFDB962AFFDC9B31FFDE9E38FFDFA241FFE3A948FFE7AB
      47FF84626AFF4150D1FF6C99FFFF6EACFFFF4D82FEFF485EF0FF4B50B8FD100E
      126D00000000000000000000000000000000010101082543CBFFA7B7FCFFA0B2
      FCFF98ABFBFF8EA3FBFF8299FAFF768FFAFF6985F9FF5C7BF9FF4E70F8FF4165
      F8FF355CF7FF2953F7FF204BF6FF1D4AA9FF6F6064FF8B797EFF9F898FFFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7B7879FF868483FF1311
      10FF1B1918FF1A1818FF1A1717FF1A1818FFC3879AFFA6556FFFC48D9EFFD7B1
      BDFFDBB5C1FFC38A9BFFA6536AFFAF6379FFD7B0BBFFDFBEC9FFD0A4B2FFC38D
      9EFFAD627AFF91445BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7B7879FF868483FF1311
      10FF1B1918FF1A1818FF1A1717FF1A1818FF1A1919FF1B1916FF191818FF1B1A
      1AFFF2F2E1FFC2C2B1FFD2D2C1FFC8C8B7FFECECDFFFE8E8D9FFE6E6D5FFE5E5
      D4FFF2F2E1FF3F3F3FCA777777CA00000000000000000F05004F70380CD7B69E
      84FFD4E6F3FFD4EEFFFFC4D0DDFFBD956EFFC77208FFD68302FFD88D12FFD88E
      18FFD9911EFFDA9425FFDB982CFFDD9B33FFDE9F3BFFE2A542FFE7AB45FF8A71
      7AFF3F4FD8FF6B99FDFF72AFFFFF4D7EFDFF465AEEFF434BB9FA0B0B0E5F0000
      000000000000000000000000000000000000010101032543CBFF2543CBFF2543
      CBFF2543CBFF2543CBFF2543CBFF2543CBFF2543CBFF2543CBFF2543CBFF2543
      CBFF2543CBFF2543CBFF2543CBFF2543CBFF323232FF383838FF4B4C4CFF5758
      58FF5A5B5BFF6E6E70FFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7B7878FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFF9F4F6FFD2AAB7FFC794A4FFD7B0
      BCFFDBB5C0FFC3899AFFAA5B70FFB56F83FFD7AFBBFFDFBEC8FFD0A4B2FFC490
      A2FFC490A2FFF4ECEEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7B7878FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFF4F2
      F2FFF5F5EEFFF4F4ECFFF1F1E7FFECECDFFFE8E8D9FFE6E6D5FFB5B5A4FFB5B5
      A4FFB5B5A4FF3F3F3FCA777777CA00000000220E0075A57449FFC8CECDFFD7F0
      FFFFCBE0F4FFBDACA3FFC07623FFD27900FFD78707FFD6890FFFD78B13FFD88E
      19FFD99220FFDB9527FFDC992EFFDD9D35FFE1A23CFFE6A83FFF8E7271FF3F50
      D8FF6F9CFFFF73B0FFFF4D7EFDFF455AF0FF4A53CCFF5E4138DB0000000F0000
      0000000000000000000000000000000000000000000001010103010101080101
      010B0101010B0101010B0101010B0101010B525252FFF4F4F4FFDFE0E2FFB1A3
      A7FFB1A3A7FFB1A3A7FF393939FF6E5952FF6F5B53FF69544FFF735E56FF7963
      5BFF7B655DFF76625BFF4F383CFFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA807A7AFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC490A2FFC490
      A2FFC490A2FFC490A2FFC490A2FFC490A2FFC490A2FFC490A2FFC490A2FFC490
      A2FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA807A7AFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFF2F2E1FFF1F1E7FFECECDFFFE8E8D9FFE6E6D5FFE5E5D4FFC7C7B6FFFFFF
      FEFFA3A378FF3F3F3FCA777777CA00000000803F0EE7C9D5DAFFD3EEFFFFC2C5
      CEFFBD864CFFCA7001FFD58000FFD58506FFD5870BFFD68910FFD78C15FFD890
      1BFFDA9322FFDB9629FFDC9A30FFDF9E36FFE5A43AFF8A6F75FF4254DBFF72A1
      FFFF70ADFFFF4E84FEFF465BF0FF4148C3FFA2B1D9FFE0C999FF401B009A0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFFAFB0B1FF555555FF9DA28FFFA0A38FFF898C7CFF858777FF8A8C
      7CFF868878FF9B9E8BFFAAAE99FF60615FFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA807A7AFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FF948E8FFF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA807A7AFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF2F2E1FFF6F6EAFFF2F2E1FFF2F2E1FFF2F2E1FFF2F2E1FFD3D3C2FFA7A7
      7CFFA7A77CFF000000000000000000000000532504BBB2ABA5FFBEA086FFC473
      12FFD37A00FFD58300FFD48303FFD58507FFDA8A0CFFDE8F11FFE09217FFE095
      1DFFDD9624FFDC972BFFDD9B31FFE3A137FF8D7170FF3E50DBFF6092FFFF70AD
      FFFF4D81FEFF475EF1FF434CCAFF916F6EFFCEBEAEFFE1FDFFFFD1A971FF290F
      007E000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFBAAB
      AFFF8F797FFF432C31FF77625BFF806B62FF816D65FF755F58FF69534DFF6C56
      50FF68524CFF745F57FF826F65FF7D6860FF4F383DFFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA827B7CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA827B7CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF3F3F3FCA0000000000000000000000000000
      00000000000000000000000000000000000010060052AE5A0AFFD17801FFD581
      00FFD38100FFD58201FFDC8802FFD58506FFBB760EFFA96D12FFA76D15FFB076
      1BFFCC8A23FFE29C2CFFE6A233FFD89A37FF604F76FF456BF1FF559AFFFF4E81
      FDFF465EF3FF424BCCFF998384FFF2C373FFD19A5EFFCACFD6FFE2F8FDFFC084
      40FA0A0300400000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFEAEB
      EDFF424243FF6F7267FFA5A894FFACAE9AFFB0B59EFF999D89FF848677FF8687
      78FF828675FF9A9D8AFFAEB19DFFABAE9AFF6B6C67FFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF3F3F3FCA0000000000000000000000000000
      000000000000000000000000000000000000000000002811007BD07C00FFD483
      00FFD78400FFD58200FF9B6310FF624622FF503E2FFF4C3932FF4F3D38FF4E3D
      33FF4E3C28FF775627FFB37E2FFFB9916DFFC8AEA5FF63619EFF4669F5FF465B
      F1FF424AC7FF9A8381FFF2C26FFFEDC27CFFECC07AFFCB9969FFD0DFECFFE1EE
      E9FF8C531ADC0100001B00000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFBAAB
      AFFF86777CFF6C5751FF7D6860FF816B64FF7B655DFF6C564FFF68514BFF735E
      56FF79645CFF7F6A61FF806A62FF7F6B62FF7D6760FF51393EFFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA83807EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817C7DFF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA83807EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817C7DFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000592A00B4DA85
      00FFCC7B00FF6F4A16FF433732FF75594DFFB58B75FFD0A290FFD4A696FFCA9D
      8BFF9B7766FF5D4941FF4C4039FF907772FFFFFBF7FFC8B1A4FF574C90FF3E48
      C5FF957E80FFF0BE6AFFEBBE75FFEAC07CFFEDC887FFEABB78FFC49F80FFD8F2
      FFFFDDD8BDFF622E02BD00000004000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFEAEB
      EDFF515253FF999D8BFFAFB49EFFB7BCA5FF999D89FF858778FF818274FFB3B8
      A1FFACB09AFFABAF9AFFAAAC99FFACB09AFFA8AC98FF5D5D5EFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000404040CA7D7877FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF797575FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000404040CA7D7877FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF797575FF3F3F3FCA0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000011703A
      00CC63461DFF51403AFFB68A74FFE2B4A1FFE3B9A8FFDEB4A3FFDCB1A0FFDCAF
      A0FFE2B5A5FFD7A896FF947263FF4F4239FF856D64FFD7B8B1FF9F7C6CFFA284
      6BFFECBA66FFEABC70FFEABE77FFEBC17EFFECC486FFF0CD90FFE2B171FFC2A8
      94FFDDF9FFFFD9C298FF2F130086000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFF9982
      87FF4E373CFF766159FF614A46FF624B46FF644E48FF66504AFF614A46FF816D
      64FF7F6A62FF7F6A62FF806B62FF7B655DFF7C675FFF50383DFFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000434343CA837E7EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF767272FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000434343CA837E7EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF767272FF3F3F3FCA0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000150E
      0B99534036FFC1947DFFE6BCAAFFDCB1A0FFD5A594FFD3A191FFD2A191FFD2A2
      92FFD4A393FFD7A799FFDEAC9DFF947262FF3C2F28FF8A6850FFDEAB5DFFF0BA
      61FFE8B86AFFE9BB72FFEABF79FFEBC281FFEDC787FFEEC98DFFF2D297FFDCA8
      6CFFC5B8B0FFE2FFFFFFD0A86FFF110700530000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFEAEB
      EDFF6C6D6EFF7A645EFF8B8C7CFF88897AFF898B7BFF898B7BFF818273FFB0B3
      9EFFAFB39EFFAEB29CFFA6A894FF9EA08DFFA5AA96FF626263FFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000474747CA8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF757271FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000474747CA8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF757271FF3F3F3FCA0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000026382D
      28F0A27966FFE8BEABFFDAAE9CFFD3A18FFFD3A190FFD4A493FFD5A595FFD5A6
      96FFD5A697FFD4A597FFD5A698FFD9A899FF685248FF69502FFFEBB55DFFE7B6
      66FFE7B86DFFE9BC74FFEAC07BFFECC383FFEDC889FFEECA8FFFEFCE95FFF3D3
      9AFFD29E6BFFCED4DAFFE4F0DFFF824505D50000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFA58E
      94FF654D52FF654E4FFF77615AFF66504AFF69534DFF6B554FFF68524DFF705A
      53FF715D55FF6D5851FF725E56FF79635CFF553F40FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF767171FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF767171FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100C09905C48
      40FDCBA192F8DCB19EFFD29F8DFFD4A291FFD6A796FFD8AB9BFFD9AE9EFFDAAF
      9FFFD9AE9FFFD8AC9DFFD6A89AFFDCAC9FFFAE8778FF45372CFFC49853FFEDBB
      69FFE8BA6EFFE9BD76FFEBC17DFFECC485FFEDC88BFFEECB91FFEFCE96FFF1D2
      9CFFF1CF97FFCFA57EFF94755BDF140800590000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFF666668FFA0A492FFA8AC97FF888A7BFF888A7AFF888A7AFF8687
      78FF999C89FFB5B9A3FFAEB39EFFA4A995FF5F5F60FFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF767271FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF767271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000201812D07059
      56E9B79694E5D2A08EFFD3A390FFD6A997FFDAB09EFFDDB5A4FFDFB8A9FFDFBA
      AAFFDEB8AAFFDCB5A6FFDAB0A2FFD9AC9FFFCFA193FF503F37FF88693EFFEFBD
      6CFFE9BB71FFEABF78FFEBC280FFECC586FFEDC98CFFEFCC92FFF0CE97FFF0D0
      9BFFF3D6A2FFF2D39FFF4F2D11A7000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFA58E
      94FFA58E94FFA58E94FF533B40FF77625CFF776259FF6E5852FF6B554FFF888A
      7AFF6D5851FF79655CFF7B655EFF513A3FFFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000484848CA979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF767271FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000484848CA979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF767271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000005281F1AD7886D
      6AEE9E8384D5B48983EED5A694FFDAB09EFFDFB8A7FFE2BFAFFFE5C4B5FFE5C7
      B6FFE4C4B4FFE1BEB0FFDEB7A9FFDAB0A3FFDCAEA0FF685048FF60492DFFEDBD
      6DFFE9BC73FFEABF7AFFECC382FFEDC788FFEECA8EFFEFCD93FFEFCF98FFF0D1
      9DFFF5DAA8FFF3D7A4FF83542DCE000000080000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFF68686AFF797B78FF9BA08EFFA9AD98FFA9AD
      98FFA0A391FF82857DFF626263FFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000454545CA8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF767272FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000454545CA8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF767272FF3F3F3FCA0000000000000000000000000000
      000000000000000000000000000000000000000000000000000529201AD78B70
      6DF09C7F7FD6977879D9C49B91F5DDB5A3FFE3C0AFFFE7CAB9FFEBD1C0FFEBD2
      C2FFE9CFC0FFE6C8B9FFE1BEB1FFDCB5A8FFDFB2A6FF705851FF5B472DFFEDBD
      6EFFEABD75FFEAC07CFFECC383FFEDC88AFFEECB90FFEFCD94FFF2D49EFFF5DB
      A8FFD2A36CFA321907870000000E000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FF664E53FF5C454AFF543C42FF523B
      40FF5A4248FF654D52FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000464646CA8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF777271FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000464646CA8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF777271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000004271E19D57F63
      60EC9C7A7AD7977A7AD8A38585DDD3AEA3FAE6C5B4FFEBD1C0FFEFDACAFFF0DC
      CDFFEED7C9FFE9CEC0FFE3C3B6FFDFB9ACFFDBB0A2FF614C44FF6D5435FFEFC0
      72FFEABE77FFEBC17EFFECC585FFEDC88BFFEFCD93FFF4D7A0FFE9C18BFF7349
      24C3070300370000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64C30FFF2D2C5FF787270FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64C30FFF2D2C5FF787270FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000241D19BE6F59
      54EF977575D69A7B7BD99B8182D7AE9593E2E2C3B4FEECD5C3FFF2DECEFFF3E1
      D2FFEFDACCFFEAD0C2FFE5C5B8FFE3BDB1FFC9A194FF493A33FFA5834EFFF1C2
      75FFEABE79FFEBC280FFECC587FFF0CF93FFEFCD94FFA57747E2180A01600000
      0002000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      000000000000000000000000000000000000535353CA989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF757172FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000535353CA989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF757172FF3F3F3FCA0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000705045F6355
      4FFD856766D59F7E7EDA9D8282D99E8889D7BEA6A2E9E9CFBEFFEFDACAFFF0DC
      CDFFEDD7C9FFE9CEC0FFE3C3B6FFE9C1B5FF95766BFF4D3D2EFFDBAD65FFECBF
      75FFEABF7AFFEDC785FFF2D193FFE0AE70FF42220A9B00000012000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5ACA888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7D7D81FF77787AFF6D6E71FF6869
      6CFF5C5E60FF59595BFF3C3636FF727171FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5ACA888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7D7D81FF77787AFF6D6E71FF6869
      6CFF5C5E60FF59595BFF3C3636FF474747CA0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000D352D
      28D66F5955E9977777D59D8181D9A08787D9A39090D8CCB2AAF1EACFBFFFEBD3
      C3FFE9CFC0FFE5C8BAFFE8C4B8FFCDA798FF4C3E37FF8B6C43FFF0BF70FFEABE
      76FFEFC985FFE8BC7BFF805025CE0A0400400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6ECA787878FF828282FF6C6C
      6CFF626262FF656565FF5A5A5AFF4D4D4DFF4D4D4DFF4E4E4EFF464646FF4444
      44FF424242FF282828CA232323CAA6A6A6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6ECA787878FF828282FF6C6C
      6CFF626262FF656565FF5A5A5AFF4D4D4DFF4D4D4DFF4E4E4EFF464646FF4444
      44FF292929CA282828CA383838FF686868CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000403
      025042362EFD6A5350E1997B7BD5A28787DA9F8787D8A38E8ED9D2B3AAF6E5C5
      B6FFE5C4B7FFEAC7B9FFD4AE9FFF604E46FF5C4935FFDEAE63FFEEC277FFEBC0
      79FFB37D42EC1D0E026A00000007000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF565656FF01010109000000000000000000000000000000000000
      00000000000000000000000000000000000000000000626262CA565656CA4F4F
      4FCA4B4B4BCA4D4D4DCA4B4B4BCA494949CA494949CA4A4A4ACA494949CA4848
      48CA494949CA474747CA535353CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000626262CA565656CA4F4F
      4FCA4B4B4BCA4D4D4DCA4B4B4BCA494949CA494949CA4A4A4ACA494949CA4848
      48CA494949CA474747CA535353CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000009060570443831FF66514CEA8A6E6DD59D8282D6A08787D5AB908FDCDEB7
      ABFBE0B8AAFEB79585FF56463EFF4F3D2CFFCC9F59FFF2C474FFDFAA61FF542D
      0EAD0200001D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FFFFFFFFFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE0E1E3FF565656FF01010106000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000402024B281F19DA4B3B34FE6E5954F6806864F6836B68F77F65
      5FFB665146FF403026FD715735FFD7AB5DFFECB764FF895422D50E06004C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000565656FF565656FF565656FF5656
      56FF565656FF565656FF565656FF565656FF565656FF565656FF565656FF5656
      56FF565656FF565656FF565656FF565656FF565656FF565656FF565656FF5656
      56FF565656FF565656FF01010103000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000C0503035716110EA51E1712C11F1712C21A14
      10BA0B0807850301003D6A3C11C3C0772EF62913037C00000007000000000000
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
      0000000000001515158615151586151515861515158615151586151515861515
      1586151515861515158615151586343434860000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007777
      77CA777777CA323232CA323232CA323232CA323232CA323232CA323232CA3232
      32CA323232CA323232CA777777CA777777CA0000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF505050FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000505050FF505050FF505050FF505050FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003E779ECA70C4FCFF62869DCA66879DCA5E849DCA4A7999CA467A9CCA497B
      9DCA57819DCA56819DCA15151586343434860000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007777
      77CA9F9F9FCA757575CA494F3BFF02291FFF001C08FF001C08FF001C08FF001C
      08FF001C08FF627A6AFF323232CA777777CA0000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF688EB1FF658C
      AFFF628AAEFF6087ACFF5D85ABFF5A83AAFF5881A8FF557EA7FF537DA6FF507B
      A4FF4E79A3FF4C77A2FF4976A1FF4774A0FF45739FFF43719EFF42709DFF406F
      9CFF3E6D9BFF505050FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000505050FF000000000000
      00000000000000000000505050FFD6C484FFD6C382FF505050FF000000000000
      00000000000000000000505050FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000323232CA202121CA2323
      23CA232323CA222323CA222323CA222323CA222323CA222223CA222323CA2323
      23CA52809ECA91D2FDFF99D5FCFFA2D7F9FF94C6E8FF86AFCCFF80B9E0FF74C6
      FDFF3F789ECA82CCFDFF15151586343434860000000000000000000000000000
      00000000000000000000000000000000000000000000323232CA202121CA2323
      23CA232323CA222323CA222323CA222323CA222323CA222223CA222323CA2323
      23CABABABAFFADABAAFF9CAF76FF30A076FF518718FF4D8512FF4C8510FF4B84
      0CFF488307FF193B05FF323232CA777777CA0000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF6C91B3FF6A8F
      B1FF678DB0FF648BAEFF6188ADFF5E86ACFF5C84AAFF5982A9FF5680A8FF547D
      A6FF517CA5FF4F7AA4FF4D78A3FF4A76A1FF4875A0FF46739FFF44729EFF4270
      9DFF416F9CFF505050FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FFDCCD95FF505050FF0000
      00000000000000000000505050FFD7C587FFD6C484FF505050FF000000000000
      000000000000505050FFD2BE77FF505050FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBFFF313030FF323232FF3635
      36FF363433FF363432FF383535FF383531FF363431FF363532FF353332FF3330
      2EFF5D849ECAA2D9FCFF99D6FCFF8AC5EBFF8FA6B6FF828A90FF7AA4BFFF5DBD
      FDFF3F789DCA42799DCA15151586343434860000000000000000000000000000
      000000000000000000000000000000000000777777CA313030FF323232FF3635
      36FF363433FF363432FF383535FF383531FF363431FF363532FF353332FF3330
      2EFF9A9897FFDBD8D5FF515C3BFF707566FF69774DFF5E7434FF5A722AFF5370
      1AFF4C6E08FF6A8954FF323232CA777777CA0000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF7194B5FF6E92
      B4FF6B90B2FF688EB1FF658CAFFF6289AEFF6087ACFF5D85ABFF5A83A9FF5781
      A8FF557EA7FF527DA6FF507BA4FF4E79A3FF4B77A2FF4976A1FF4774A0FF4573
      9FFF43719EFF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000676767FFDECF9AFFDDCE98FFDCCD95FF5050
      50FF00000000505050FFD9C88BFFD8C789FFD7C587FFD6C484FF505050FF0000
      0000505050FFD4C07BFFD3BF79FFD2BE77FF505050FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000737374FF605B5AFF87807BFF7D76
      70FF8D8586FF867C7DFF7E7874FF7A7470FF78726EFF726C69FF67605CFF8077
      78FF66889ECA94D1F7FF89BDDFFFA6B6C1FF999A9CFF83888CFF58ACE3FF69C1
      FBFF29A8FCFF32739DCA15151586343434860000000000000000000000000000
      000000000000000000000000000000000000474748CA605B5AFF87807BFF7D76
      70FF8D8586FF867C7DFF7E7874FF7A7470FF78726EFF726C69FF67605CFF8077
      78FFC7C5C4FF747270FFA78A65FF2E674FFF693A00FF673A00FF673900FF6539
      00FF643900FF583C12FF323232CA777777CA2341CBFF1B48A9FF1B48A9FF1B48
      A9FF1B48A9FF1B48A9FF1B48A9FF1B48A9FF1B48A9FF1B48A9FF1B48A9FF1B48
      A9FF1B48A9FF1B48A9FF1B48A9FF668DB0FF648AAEFF37ABDAFF4091B9FF408F
      B8FF5982A9FF5680A7FF547DA6FF517CA5FF3A95C5FF408EB6FF408EB6FF4875
      A0FF46739FFF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000676767FFDFD19DFFDECF9AFFDDCE98FFDCCD
      95FF505050FFDACB90FFDAC98EFFD9C88BFFD8C789FFD7C587FFD6C484FF5050
      50FFD5C280FFD4C17DFFD4C07BFFD3BF79FF505050FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000686868FF66615FFF8C8884FF7A75
      71FF989391FF888080FF7E7876FF7B7571FF7A736FFF736D6AFF5F5A55FF8983
      80FF6C8A9DCA99B7CBFFB0B4B6FFDFDFDFFFC9C9C9FF8199A9FF32A8F6FF73C6
      FBFF50B8FCFF527F9DCA15151586343434860000000000000000000000000000
      000000000000000000000000000000000000414141CA66615FFF8C8884FF7A75
      71FF989391FF888080FF7E7876FF7B7571FF7A736FFF736D6AFF5F5A55FF8983
      80FF656464FFD4D2D0FFC79D6EFFB8C9ADFFDEAC68FFDBA55BFFDA9F50FFD899
      45FFD79239FF6E4812FF323232CA777777CA2341CBFFA4B5FCFF9DAFFCFF93A7
      FBFF889EFBFF7B95FAFF6E8AFAFF6180F9FF5374F9FF4669F8FF395FF8FF2D55
      F7FF234DF7FF1A46F6FF1B48A9FF6B90B2FF688EB1FF36A9D8FF48E5FFFF41D4
      F6FF4090B8FF418FB8FF4898C4FF3BA4D3FF38CAF6FF38D5FFFF408EB6FF4B77
      A2FF4976A1FF505050FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FFDFD19DFFDECF9AFFDDCE
      98FFDCCD95FFDBCC93FFDACB90FFDAC98EFFD9C88BFFD8C789FFD7C587FFD6C4
      84FFD6C382FFD5C280FFD4C17DFF505050FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6CFF757171FF96918EFF7E78
      74FF6E6965FF726D68FF797471FF7C7673FF7D7774FF77716EFF68625DFF5E59
      55FF748E9ECAB7CAD7FFC7C7C8FFD0D0D0FFE3E3E3FFA0ADB6FF71ABCFFF4AA9
      E8FF59BAF9FF56819DCA15151586343434860000000000000000000000000000
      000000000000000000000000000000000000434343CA757171FF96918EFF7E78
      74FF6E6965FF726D68FF797471FF7C7673FF7D7774FF77716EFF68625DFF5E59
      55FFD9D6D5FF9C9896FF3B3946FF001D28FF00001CFF00001DFF00001DFF0000
      1DFF00001DFF626281FF323232CA777777CA2341CBFFA6B6FCFF9FB0FCFF96A9
      FBFF8BA1FBFF7E97FAFF718DFAFF6482F9FF5676F9FF496BF8FF3C61F8FF3057
      F7FF254FF7FF1C47F6FF1B48A9FF6F93B4FF6F94B5FF459ECBFF47DEFBFF48E6
      FFFF44E2FFFF3DCBF2FF3CC9F2FF3EDBFFFF3CDAFFFF39D0FBFF3F93BFFF537D
      A6FF4C78A2FF505050FF00000000000000000000000000000000000000000000
      0000505050FF505050FF0000000000000000676767FFDFD29FFFDFD19DFFDECF
      9AFFDDCE98FFDCCD95FFDBCC93FFDACB90FFDAC98EFFCBBB85FFCABA83FFCAB9
      81FFC9B87EFFD6C382FFD5C280FF505050FF0000000000000000505050FF5050
      50FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000727272FF7B7877FF979291FF8781
      80FF7B7876FF7D7978FF837D7BFF817B7AFF847D7AFF7E7976FF716C68FF6A66
      64FF748E9ECAC5DFF1FFC2C6C9FFC7C7C7FFE2E2E2FFB4B3B4FF818284FF828C
      93FF80A9C3FF487B9DCA15151586343434860000000000000000000000000000
      000000000000000000000000000000000000474747CA7B7877FF979291FF8781
      80FF7B7876FF7D7978FF837D7BFF817B7AFF847D7AFF7E7976FF716C68FF6A66
      64FF888686FF9C9A98FF8A82ADFF387CA6FF54158FFF52128FFF51108FFF500E
      8FFF4D0C8CFF1D0565FF323232CA777777CA2341CBFFA7B7FCFFA0B2FCFF98AB
      FBFF8EA3FBFF8299FAFF748FFAFF6785F9FF5A79F9FF4C6EF8FF3F63F8FF335A
      F7FF2751F7FF1E49F6FF1B48A9FF7496B7FF7194B5FF4D9DCAFF47D8F6FF49E6
      FFFF46E2FFFF45E2FFFF43E0FFFF40DBFFFF3DDAFFFF3ACCF6FF4799C7FF527C
      A5FF507BA4FF505050FF00000000000000000000000000000000000000006767
      67FFE4D9AEFFE4D8ACFF505050FF505050FFE1D4A4FFE0D3A2FFDFD29FFFDFD1
      9DFFDECF9AFFDDCE98FFDCCD95FFDBCC93FFCDBD8AFFB0A47AFFAFA479FFAFA3
      77FFBCAF7BFFC9B87EFFD6C382FFD5C280FF505050FF505050FFD3BF79FFD2BE
      77FF505050FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000707070FF4B4848FF5E595BFF645F
      60FF615B5CFF686363FF7D7476FF706567FF676062FF4F484AFF3A3333FF352E
      2DFF708B9ECAC2E4FBFFBBC9D3FFDCDCDDFFDEDEDEFF8A8A8AFF858F95FF8BAB
      C0FF82C0EAFF467B9DCA15151586343434860000000000000000000000000000
      000000000000000000000000000000000000464646CA4B4848FF5E595BFF645F
      60FF615B5CFF686363FF7D7476FF706567FF676062FF4F484AFF3A3333FF352E
      2DFF9A9897FFDAD6D8FF65388EFFA56DC6FFA75CCEFF9F4DCDFF9B44CDFF993E
      CEFF8D33C2FF401C80FF323232CA777777CA2341CBFF2341CBFF2341CBFF2341
      CBFF2341CBFF2341CBFF2341CBFF2341CBFF2341CBFF2341CBFF2341CBFF2341
      CBFF2341CBFF2341CBFF2341CBFF789AB9FF7598B7FF63A3C9FF48CEEEFF53EB
      FFFF4CE4FFFF46E2FFFF44DFFFFF42DDFFFF40DEFFFF39C2EEFF5B9CC3FF5680
      A7FF537DA6FF505050FF00000000000000000000000000000000676767FFE6DB
      B3FFE5DAB1FFE4D9AEFFE4D8ACFFE3D7A9FFE2D5A7FFE1D4A4FFE0D3A2FFDFD2
      9FFFDFD19DFFDECF9AFFDDCE98FFDCCD95FFDBCC93FFDACB90FFDAC98EFF938B
      6CFF928A6BFFBCAF7BFFC9B87EFFD6C382FFD5C280FFD4C17DFFD4C07BFFD3BF
      79FFD2BE77FF505050FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000686868FF565252FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFA4A2A3FFA09D9EFF9B999AFF9C99
      9AFF63869DCAB2DFFDFFB3D5EBFFB0B8BEFFA8B5BDFF9DBFD5FF9CCFF1FF8FD0
      FCFF7AC9FDFF41789ECA15151586343434860000000000000000000000000000
      000000000000000000000000000000000000414141CA565252FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFA4A2A3FFA09D9EFF9B999AFF9C99
      9AFFC9C6CCFF4D477CFF1E5B8FFF0D94ACFF302B85FF46067EFF46067EFF4606
      7CFF3F1977FFAEA9C5FF777777CA000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF8DA9C3FF8AA7
      C2FF87A4C0FF84A2BEFF81A0BDFF7D9DBBFF7A9BBAFF4CA1CDFF61E1F7FF64EE
      FFFF5BE8FFFF52E5FFFF49E1FFFF43DFFFFF42DFFFFF3DD0F6FF408FB7FF5A83
      A9FF5781A8FF505050FF00000000000000000000000000000000000000006767
      67FFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFFE3D7A9FFE2D5A7FFE1D4A4FFE0D3
      A2FFDFD29FFFDFD19DFF787878FF787878FF787878FF787878FFDACB90FFDAC9
      8EFFD9C88BFF7E7863FFBCAF7BFFC9B87EFFD6C382FFD5C280FFD4C17DFFD4C0
      7BFF676767FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF7B7879FF868483FF1311
      10FF1B1918FF1A1818FF1A1717FF1A1818FF1A1919FF1B1916FF191818FF1B1A
      1AFF5C839DCA68889DCA6C8A9DCA637F8FCA678599CA62869ECA5A839ECA507F
      9ECA467B9ECA3B779ECA00000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7B7879FF868483FF1311
      10FF1B1918FF1A1818FF1A1717FF1A1818FF1A1919FF1B1916FF191818FF1B1A
      1AFF3C3267FF181A64FF0E4E81FF113973FF1D1367FF1D1266FF1E1265FF1715
      61FFAAAAC2FF777777CA00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF92ACC5FF8EAA
      C4FF8BA8C2FF88A5C1FF85A3BFFF82A1BEFF49A0CCFF72E3F5FF83F6FFFF78EF
      FFFF6FEDFFFF63EAFFFF57E5FFFF4AE2FFFF43DFFFFF42E0FFFF3DCEF4FF408F
      B7FF5B84AAFF505050FF00000000000000000000000000000000000000000000
      0000676767FFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFFE3D7A9FFE2D5A7FFE1D4
      A4FFE0D3A2FF787878FF00000000000000000000000000000000787878FFDACB
      90FFDAC98EFFD9C88BFF7E7863FFBCAF7BFFC9B87EFFD6C382FFD5C280FF6767
      67FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF7B7878FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFF4F2
      F2FFE9E8E8FFE1DFDFFF878384FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7B7878FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFF4F2
      F2FFE9E8E8FFE1DFDFFF878384FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF96B0C9FF93AD
      C7FF90ABC5FF8DA9C3FF8AA6C1FF51A4CEFF86E6F5FFA2FEFFFF99F6FFFF90F4
      FFFF85F1FFFF76EEFFFF67EAFFFF57E5FFFF4AE2FFFF44DFFFFF43E2FFFF3DCE
      F4FF408FB7FF505050FF00000000000000000000000000000000000000000000
      000000000000676767FFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFFE3D7A9FFE2D5
      A7FF787878FF0000000000000000000000000000000000000000000000007878
      78FFDACB90FFDAC98EFFD9C88BFF7E7863FFCAB981FFD6C484FF505050FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF807A7AFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFF4F4F4FFE7E6E7FF918C8CFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA807A7AFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFF4F4F4FFE7E6E7FF918C8CFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF9AB3CBFF97B1
      C9FF94AEC8FF91ACC5FF69A9CFFF69CAE5FFA4F4FAFFAEF7FEFFB5FCFFFFAFFC
      FFFF9BF5FFFF8AF1FFFF77EEFFFF65EAFFFF56E9FFFF48E3FFFF43DCFCFF40D6
      F9FF38B6E3FF558BA6FF00000000000000000000000000000000000000000000
      0000505050FFE8DEB8FFE7DCB6FFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFF5050
      50FF000000000000000000000000000000000000000000000000000000000000
      0000787878FFDACB90FFDAC98EFF7E7863FFBCAF7BFFCAB981FFD6C484FF5050
      50FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF807A7AFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FF948E8FFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA807A7AFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FF948E8FFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF9FB6CDFF9CB4
      CCFF99B2CAFF96B0C9FF9AB8D1FF73AED1FF62A8CFFF5BA8D0FF54B2DAFF74CB
      E7FFAFF8FFFF9DF6FFFF87F2FFFF71EDFFFF46BFE5FF37A9D8FF449FCDFF559F
      C9FF63A2C9FF505050FF000000000000000000000000505050FF505050FF5050
      50FFE9E0BDFFE9DFBBFFE8DEB8FFE7DCB6FFE6DBB3FFE5DAB1FF505050FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000787878FFDACB90FFDAC98EFF928A6BFFCABA83FFD7C587FFD6C4
      84FF505050FF505050FF505050FF000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF827B7CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA827B7CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFA3BAD0FFA0B7
      CEFF9DB5CDFF9AB3CBFF97B1C9FF94AEC8FF91ACC5FF92ADC7FF95B2CBFF5AA3
      CDFF97E1F2FFB2FCFFFF97F8FFFF68D8F1FF4692BBFF7597B7FF7699B8FF6F93
      B4FF6C90B2FF505050FF0000000000000000000000005F5F5FFFECE3C4FFEBE2
      C1FFEAE1BFFFE9E0BDFFE9DFBBFFE8DEB8FFE7DCB6FFE6DBB3FF505050FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000787878FFDBCC93FFDACB90FFAFA377FFD9C88BFFD8C789FFD7C5
      87FFD6C484FFD6C382FF505050FF000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFA7BDD2FFA5BB
      D0FFA2B8CFFF9FB6CDFF9CB4CCFF99B2CAFF96AFC9FF93ADC7FF90ABC4FF95B5
      CFFF6AB0D2FFBAFDFFFF9FF9FFFF4C9DC3FF7C9DBBFF799BB9FF7698B8FF7396
      B6FF7094B5FF505050FF000000000000000000000000626262FFECE4C7FFECE3
      C4FFEBE2C1FFEAE1BFFFE9E0BDFFE9DFBBFFF1E9CFFFE7DCB6FF505050FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000787878FFDCCD95FFDBCC93FFCDBD8AFFDAC98EFFD9C88BFFD8C7
      89FFD7C587FFD6C484FF505050FF000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF83807EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817C7DFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA83807EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817C7DFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFACC0D4FFA9BE
      D2FFA6BCD1FFA3B9CFFFA0B7CEFF9DB5CCFF9AB3CBFF97B0C9FF94AEC8FF91AC
      C5FF5FA6CEFF9BE9F6FF8EE6F6FF5BA4CDFF82A0BDFF7E9EBCFF7A9CBAFF7799
      B9FF7497B7FF505050FF000000000000000000000000626262FF626262FF6262
      62FFECE3C4FFEBE2C1FFEAE1BFFFF2ECCFFFF2EAD1FFE8DEB8FF505050FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000787878FFDDCE98FFDCCD95FFDBCC93FFDACB90FFDAC98EFFD9C8
      8BFF676767FF676767FF676767FF000000000000000000000000000000000000
      000000000000000000000000000000000000676767FF7D7877FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF797575FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000404040CA7D7877FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF797575FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFB0C3D6FFADC1
      D4FFAABFD3FFA7BDD2FFA4BAD0FFA2B8CFFF9FB6CDFF9CB4CCFF99B2CAFF96AF
      C8FF99B8D1FF6AB3D5FF68B2D4FF89A6C1FF86A4C0FF83A1BEFF809FBCFF7C9D
      BBFF799AB9FF505050FF00000000000000000000000000000000000000000000
      0000626262FFECE3C4FFEBE2C1FFF3EDD1FFF3EED9FFE9DFBBFFE8DEB8FF5050
      50FF000000000000000000000000000000000000000000000000000000000000
      0000787878FFDFD19DFFDECF9AFFDDCE98FFDCCD95FFDBCC93FFDACB90FF5050
      50FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6B6BFF837E7EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF767272FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000434343CA837E7EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF767272FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFB4C7D8FFB1C4
      D7FFAEC2D5FFABC0D4FFA9BED2FFA6BCD1FFA3B9CFFFA0B7CEFF9DB5CCFF9AB3
      CBFF97B0C9FF86B4D3FF84B3D2FF8EA9C4FF8BA7C2FF88A5C0FF85A2BFFF81A0
      BDFF7D9EBCFF505050FF00000000000000000000000000000000000000000000
      000000000000626262FFECE3C4FFEEE5C7FFF4F0DDFFF9F5EAFFE9DFBBFFE8DE
      B8FF505050FF0000000000000000000000000000000000000000000000005050
      50FFE0D3A2FFDFD29FFFDFD19DFFDECF9AFFDDCE98FFDCCD95FF505050FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171FF8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF757271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000474747CA8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF757271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFB7CADAFFB5C8
      D9FFB2C5D7FFB0C3D6FFADC1D4FFAABFD3FFA7BDD2FFA4BAD0FFA1B8CFFF9EB6
      CDFF9BB4CCFF98B1CAFF95AFC8FF92ADC7FF8FABC4FF8CA8C3FF89A6C1FF86A4
      C0FF83A1BEFF505050FF00000000000000000000000000000000000000000000
      0000626262FFEDE5C8FFECE4C7FFECE3C4FFF3EDD2FFFFFFFFFFEFE7CBFFE9DF
      BBFFE8DEB8FF505050FF00000000000000000000000000000000505050FFE2D5
      A7FFE1D4A4FFE0D3A2FFDFD29FFFDFD19DFFDECF9AFFDDCE98FFDCCD95FF5050
      50FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000787878FF9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF767171FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF767171FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFBBCCDCFFB9CB
      DAFFA1A1A1FF787878FF787878FF787878FF787878FF787878FF787878FF7878
      78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF8BA7
      C2FF87A5C0FF505050FF00000000000000000000000000000000000000006262
      62FFEEE6CBFFEDE6CAFFEDE5C8FFECE4C7FFECE3C4FFF3EDD2FFFFFFFFFFEFE7
      CBFFE9DFBBFFE8DEB8FF505050FF505050FF505050FF505050FFE4D8ACFFE3D7
      A9FFE2D5A7FFE1D4A4FFE0D3A2FFDFD29FFFDFD19DFFDECF9AFFDDCE98FFDCCD
      95FF505050FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000787878FF9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF767271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF767271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFBECFDDFFBCCD
      DCFFA1A1A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF787878FF8FAA
      C4FF8CA8C3FF505050FF00000000000000000000000000000000626262FFEEE7
      CDFFEEE7CCFFEEE6CBFFEDE6CAFFEDE5C8FFECE4C7FFECE3C4FFF3EDD2FFFFFF
      FFFFF3EDD9FFEEE6C9FFE8DEB8FFE7DCB6FFE6DBB3FFE5DAB1FFE4D9AEFFE4D8
      ACFFE3D7A9FFE2D5A7FFE1D4A4FFE0D3A2FFDFD29FFFDFD19DFFDECF9AFFDDCE
      98FFDCCD95FF505050FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000747474FF979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF767271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000484848CA979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF767271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFC2D1DFFFC0D0
      DEFFA1A1A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF787878FF94AE
      C8FF91ACC5FF505050FF00000000000000000000000000000000000000006262
      62FFEEE7CDFFEEE7CCFF676767FF676767FFEDE5C8FFECE4C7FFECE3C4FFEBE2
      C1FFFFFFFFFFF9F5EAFFF1EAD2FFEEE5C7FFF1E8CDFFE6DBB3FFE5DAB1FFE4D9
      AEFFE4D8ACFFE3D7A9FFE2D5A7FFE1D4A4FF676767FF676767FFDFD19DFFDECF
      9AFF676767FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6F6FFF8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF767272FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000454545CA8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF767272FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFC5D4E1FFC3D2
      E0FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FF98B1
      CAFF95AFC8FF505050FF00000000000000000000000000000000000000000000
      0000626262FF626262FF0000000000000000676767FFEDE5C8FFECE4C7FFECE3
      C4FFEBE2C1FFEAE1BFFFF2EAD2FFF2EAD1FFE8DEB8FFE7DCB6FFE6DBB3FFE5DA
      B1FFE4D9AEFFE4D8ACFFE3D7A9FF505050FF0000000000000000676767FF6767
      67FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000707070FF8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF777271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000464646CA8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF777271FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFC9D6E2FFC7D5
      E1FFC4D3E0FFC2D1DFFFBFD0DEFFBDCEDDFFBBCCDCFFB8CADAFFB6C8D9FFB3C7
      D8FFB1C4D6FFAEC2D5FFABBFD4FFA8BDD2FFA5BBD1FFA2B9CFFFA0B7CEFF9DB5
      CCFF9AB2CBFF505050FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FFEDE6CAFFEDE5C8FFECE4
      C7FFECE3C4FFEBE2C1FFEAE1BFFFE9E0BDFFE9DFBBFFE8DEB8FFE7DCB6FFE6DB
      B3FFE5DAB1FFE4D9AEFFE4D8ACFF505050FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000777777FF8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64C30FFF2D2C5FF787270FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64C30FFF2D2C5FF787270FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFCBD8E4FFCAD7
      E3FFC8D5E2FFC5D4E1FFC3D2E0FFC0D1DFFFBECFDDFFBCCDDCFFB9CBDBFFB7C9
      DAFFB4C7D8FFB2C4D7FFAFC2D6FFACC0D4FFAABED3FFA7BCD1FFA4BAD0FFA1B8
      CEFF9EB6CDFF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000676767FFEEE7CCFFEEE6CBFFEDE6CAFFEDE5
      C8FF676767FFECE3C4FFEBE2C1FFEAE1BFFFE9E0BDFFE9DFBBFFE8DEB8FF6767
      67FFE6DBB3FFE5DAB1FFE4D9AEFFE4D8ACFF505050FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000868686FF989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF757172FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000535353CA989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF757172FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFCEDAE5FFCCD9
      E4FFCAD7E3FFC9D6E2FFC7D4E1FFC4D3E0FFC1D1DFFFBFD0DEFFBDCEDDFFBBCC
      DBFFB8CADAFFB6C8D9FFB3C5D8FFB0C3D6FFAEC1D5FFABBFD3FFA8BDD2FFA5BB
      D1FFA2B9CFFF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000676767FFEEE7CDFFEEE7CCFFEEE6CBFF6767
      67FF00000000676767FFECE3C4FFEBE2C1FFEAE1BFFFE9E0BDFF505050FF0000
      0000676767FFE6DBB3FFE5DAB1FFE4D9AEFF505050FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000929292FF888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7D7D81FF77787AFF6D6E71FF6869
      6CFF5C5E60FF59595BFF3C3636FF474747CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5ACA888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7D7D81FF77787AFF6D6E71FF6869
      6CFF5C5E60FF59595BFF3C3636FF474747CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFD0DCE6FFCFDA
      E5FFCDD9E4FFCBD8E4FFC9D7E3FFC8D5E2FFC5D4E1FFC2D2E0FFC0D0DEFFBECF
      DDFFBCCDDCFFB9CBDBFFB7C9DAFFB4C7D8FFB2C4D7FFAFC2D6FFACC0D4FFA9BE
      D3FFA7BCD1FF505050FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FFEEE7CDFF676767FF0000
      00000000000000000000676767FFECE3C4FFEBE2C1FF505050FF000000000000
      000000000000676767FFE6DBB3FF676767FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0B0B0FF787878FF828282FF6C6C
      6CFF626262FF656565FF5A5A5AFF4D4D4DFF4D4D4DFF4E4E4EFF464646FF4444
      44FF424242FF404040FF383838FF686868CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6ECA787878FF828282FF6C6C
      6CFF626262FF656565FF5A5A5AFF4D4D4DFF4D4D4DFF4E4E4EFF464646FF4444
      44FF424242FF404040FF383838FF686868CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFD2DDE7FFD1DC
      E6FFCFDBE6FFCEDAE5FFCCD9E4FFCAD7E3FFC8D6E2FFC7D4E1FFC3D3E0FFC1D1
      DFFFBFD0DEFFBDCEDDFFBACCDBFFB8CADAFFB5C8D9FFB3C5D8FFB0C3D6FFAEC1
      D5FFABBFD3FF505050FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000676767FF000000000000
      00000000000000000000676767FFECE4C7FFECE3C4FF505050FF000000000000
      00000000000000000000676767FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F9F9FFF8C8C8CFF8080
      80FF797979FF7B7B7BFF797979FF757575FF757575FF777777FF757575FF7474
      74FF757575FF717171FF868686FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000626262CA565656CA4F4F
      4FCA4B4B4BCA4D4D4DCA4B4B4BCA494949CA494949CA4A4A4ACA494949CA4848
      48CA494949CA474747CA535353CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000676767FF676767FF676767FF676767FF000000000000
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
      0000000000000000000000000000505050FF505050FF505050FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D9D59FF4D9D59FF4D9D59FF4D9D59FF4D9D59FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000030000000B00000013000000160000001600000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      0016000000130000000B00000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000505050FF000000000000000000000000505050FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D9D59FF87D490FF82D28AFF7BD085FF4D9D59FF505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF505050FF505050FF00000000000000000000000000000000000000000000
      00000000000000000000A1A1A1FF656565FF656565FF656565FF656565FF6565
      65FF656565FF656565FF656565FF656565FF656565FF656565FFC3B89BFFC3B8
      9BFFC3B89BFFC3B89BFFC3B89BFFC3B89BFFC3B89BFFC3B89BFFC3B89BFFC3B8
      9BFFC3B89BFF0000000000000000000000000000000000000000000000000000
      0003000000110000002300000030000000350000003500000035000000350000
      0035000000350000003500000035000000350000003500000035000000350000
      0035000000350000003500000035000000350000003500000035000000350000
      0035000000300000002300000011000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000505050FF000000000000000000000000505050FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D9D59FF8DD795FF87D490FF82D28AFF4D9D59FF688EB1FF658C
      AFFF628AAEFF6087ACFF5D85ABFF5A83AAFF5881A8FF557EA7FF537DA6FF507B
      A4FF4E79A3FF4C77A2FF4976A1FF4774A0FF45739FFF43719EFF42709DFF406F
      9CFF3E6D9BFF505050FF00000000000000000000000000000000000000000000
      00000000000000000000A1A1A1FFDBDBDBFFD9D9D9FFD7D7D7FFD5D5D5FFD3D3
      D3FFD1D1D1FFCFCFCFFFCCCCCDFFCACACBFFC8C8C9FF656565FFF6D2B7FFF6D2
      B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2
      B7FFC3B89BFF0000000000000000000000000000000000000000000000030000
      001500000051545454FF545454FF545454FF545454FF545454FF545454FF5759
      56FF575955FF575955FF575955FF565855FF575955FF575955FF575956FF5759
      56FF575956FF575955FF545454FF545454FF545454FF545454FF545454FF5454
      54FF545454FF000000710000001D000000080000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000505050FF000000000000000000000000505050FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D9D59FF93D99AFF8DD795FF87D490FF4D9D59FF6C91B3FF6A8F
      B1FF678DB0FF648BAEFF6188ADFF5E86ACFF5C84AAFF5982A9FF5680A8FF547D
      A6FF517CA5FF4F7AA4FF4D78A3FF4A76A1FF4875A0FF46739FFF44729EFF4270
      9DFF416F9CFF505050FF00000000000000000000000000000000000000000000
      00000000000000000000A1A1A1FFDCDCDCFFDADADAFFD8D8D8FFD6D6D6FFD4D4
      D4FFD2D2D2FFD0D0D0FFCECECEFFCCCCCCFFCACACAFF656565FF505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FFF6D2B7FFF6D2
      B7FFC3B89BFF0000000000000000000000000000000000000000000000080000
      0046545454FF67697AFF67697AFF67697AFF545454FFEDEDEFFFEDEDEFFFEDED
      EFFFEDEDEFFFEDEDEFFFEDEDEFFFEDEDEFFFEDEDEFFFEDEDEFFFEDEDEFFFEDED
      EFFFEDEDEFFF545454FF67697AFF67697AFF67697AFF67697AFF67697AFF6769
      7AFF67697AFF545454FF000000260000000B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000505050FF505050FF505050FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D9D59FF98DBA0FF93D99AFF8DD795FF4D9D59FF7194B5FF6E92
      B4FF6B90B2FF688EB1FF658CAFFF6289AEFF6087ACFF5D85ABFF5A83A9FF5781
      A8FF557EA7FF527DA6FF507BA4FF4E79A3FF4B77A2FF4976A1FF4774A0FF4573
      9FFF43719EFF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFDBDBDCFFD9D9DAFFD7D7D8FFD5D5
      D6FFD3D3D3FFD1D1D1FFCFCFCFFFCDCDCDFFCBCBCBFF656565FF608EB6FF5D8C
      B5FF5A8AB4FF5889B2FF5687B1FF5486B0FF5284B0FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FF545454FFEDEDEFFFD8DEE0FF5454
      54FF545454FF545454FF545454FFD8DEE0FFD8DEE0FFD8DEE0FFD8DEE0FFD8DE
      E0FFEDEDEFFF545454FF67697AFF67697AFF67697AFF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000505050FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000074B47DFF4D9D59FF4D9D59FF4D9D
      59FF4D9D59FF4D9D59FF9EDDA5FF98DBA0FF93D99AFF4D9D59FF4D9D59FF4D9D
      59FF4D9D59FF4D9D59FF4D9D59FF668DB0FF648AAEFF37ABDAFF4091B9FF408F
      B8FF5982A9FF5680A7FF547DA6FF517CA5FF3A95C5FF408EB6FF408EB6FF4875
      A0FF46739FFF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FF656565FFDBDBDBFFD8D8D9FFD6D6
      D7FFD4D4D5FF656565FF656565FFCECECEFFCCCCCCFF656565FF6592B8FF6290
      B7FF5F8DB6FF5C8CB4FF5A8AB3FF5788B2FF5587B1FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FF545454FFEDEDEFFFD8DEE0FF5454
      54FFA9AD98FFA9AD98FF545454FFD8DEE0FFD8DEE0FFD8DEE0FFD8DEE0FFD8DE
      E0FFEDEDEFFF545454FF67697AFF67697AFF67697AFF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B0000000000000000505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF505050FF505050FF000000000000000074B47DFFC0EAC4FFBBE8BFFFB5E6
      BAFFB0E3B5FFAAE1B0FFA4DFAAFF9EDDA5FF98DBA0FF93D99AFF8DD795FF87D4
      90FF82D28AFF7BD085FF4D9D59FF6B90B2FF688EB1FF36A9D8FF48E5FFFF41D4
      F6FF4090B8FF418FB8FF4898C4FF3BA4D3FF38CAF6FF38D5FFFF408EB6FF4B77
      A2FF4976A1FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFDEDEDEFF656565FFDADADAFFD8D8
      D8FFA1A1A1FFD3D3D4FFD1D1D2FF656565FFCDCDCEFF656565FF6B96BBFF6793
      B9FF6491B8FF618FB7FF5E8DB5FF5B8BB4FF5989B3FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FF545454FFEDEDEFFFD8DEE0FF5454
      54FFA9AD98FFA9AD98FF545454FFD8DEE0FFD8DEE0FFD8DEE0FFD8DEE0FFD8DE
      E0FFEDEDEFFF545454FF67697AFF67697AFF67697AFF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B0000000000000000A1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FF000000000000000074B47DFFC5ECCAFFC0EAC4FFBBE8
      BFFFB5E6BAFFB0E3B5FFAAE1B0FFA4DFAAFF9EDDA5FF98DBA0FF93D99AFF8DD7
      95FF87D490FF82D28AFF4D9D59FF6F93B4FF6F94B5FF459ECBFF47DEFBFF48E6
      FFFF44E2FFFF3DCBF2FF3CC9F2FF3EDBFFFF3CDAFFFF39D0FBFF3F93BFFF537D
      A6FF4C78A2FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFDFDFDFFF656565FFDBDBDBFFD9D9
      D9FFA1A1A1FFD5D5D5FFD3D3D3FF656565FFCECECFFF656565FF719ABEFF6D97
      BCFF6A95BBFF6693B9FF6390B8FF608EB6FF5D8CB5FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FF545454FFEDEDEFFFD8DEE0FF5454
      54FFA9AD98FFA9AD98FF545454FFD8DEE0FFD8DEE0FFD8DEE0FFD8DEE0FFD8DE
      E0FFEDEDEFFF545454FF67697AFF67697AFF67697AFF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1E1FFE0E0E0FFBEB3ABFFDDDD
      DDFFBEB3ABFFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFBEB3
      ABFFBEB3ABFFD0D0D0FFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFFCBCBCBFFCACA
      CAFFD09476FF00000000000000000000000074B47DFFCBEDCFFFC5ECCAFFC0EA
      C4FFBBE8BFFFB5E6BAFFB0E3B5FFAAE1B0FFA4DFAAFF9EDDA5FF98DBA0FF93D9
      9AFF8DD795FF87D490FF4D9D59FF7496B7FF7194B5FF4D9DCAFF47D8F6FF49E6
      FFFF46E2FFFF45E2FFFF43E0FFFF40DBFFFF3DDAFFFF3ACCF6FF4799C7FF527C
      A5FF507BA4FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE0E0E0FF656565FFDCDCDCFFDADA
      DAFFA1A1A1FFD6D6D6FFD4D4D4FF656565FFD0D0D0FF656565FF779EC1FF739C
      BFFF7099BDFF6C97BCFF6994BAFF6592B9FF6290B7FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FF545454FFEDEDEFFFD8DEE0FF5454
      54FFA9AD98FFA9AD98FF545454FFD8DEE0FFD8DEE0FFD8DEE0FFD8DEE0FFD8DE
      E0FFEDEDEFFF545454FF67697AFF67697AFF67697AFF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFE8E8E8FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1E1FFDFDFDFFFDEDE
      DEFFDDDDDDFFDBDBDBFFDADADAFFD8D8D8FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3
      D3FFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFFCBCB
      CBFFD09476FF00000000000000000000000074B47DFF74B47DFF74B47DFF74B4
      7DFF74B47DFF74B47DFFB5E6BAFFB0E3B5FFAAE1B0FF4D9D59FF4D9D59FF4D9D
      59FF4D9D59FF4D9D59FF4D9D59FF789AB9FF7598B7FF63A3C9FF48CEEEFF53EB
      FFFF4CE4FFFF46E2FFFF44DFFFFF42DDFFFF40DEFFFF39C2EEFF5B9CC3FF5680
      A7FF537DA6FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE1E1E1FF656565FFDDDDDDFFDBDB
      DBFFA1A1A1FFD7D7D7FFD5D5D5FF656565FFD1D1D1FF656565FF7EA3C4FF7AA0
      C2FF769EC0FF729BBEFF6F98BDFF6B96BBFF6894BAFF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FF545454FFEDEDEFFFD8DEE0FF5454
      54FF545454FF545454FF545454FFD8DEE0FFD8DEE0FFD8DEE0FFD8DEE0FFD8DE
      E0FFEDEDEFFF545454FF67697AFF67697AFF67697AFF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFEAEAEAFFE8E8E8FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFBEB3ABFFDFDF
      DFFFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1
      B1FFB2B1B1FFB2B1B1FFB2B1B1FFB2B1B1FFBEB3ABFFCECECEFFCDCDCDFFCCCC
      CCFFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000074B47DFFBBE8BFFFB5E6BAFFB0E3B5FF4D9D59FF8DA9C3FF8AA7
      C2FF87A4C0FF84A2BEFF81A0BDFF7D9DBBFF7A9BBAFF4CA1CDFF61E1F7FF64EE
      FFFF5BE8FFFF52E5FFFF49E1FFFF43DFFFFF42DFFFFF3DD0F6FF408FB7FF5A83
      A9FF5781A8FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE2E2E2FF656565FFDEDEDFFFDCDC
      DDFFA1A1A1FFD8D8D9FFD6D6D7FF656565FFD2D2D3FF656565FF86A8C8FF82A5
      C5FF7DA2C3FF79A0C1FF759DC0FF719ABEFF6E98BCFF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FF545454FFEDEDEFFFEDEDEFFFEDED
      EFFFEDEDEFFFE5E9E7FFEAEDECFFEEF0EFFFEBEEECFFE8EBE9FFE5E8E7FFEDED
      EFFFEDEDEFFF545454FF67697AFF67697AFF4D4E58FF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFEBEBEBFFEAEAEAFFE8E8E8FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1
      E1FFDFDFDFFFDEDEDEFFDCDCDCFFDBDBDBFFDADADAFFD8D8D8FFD7D7D7FFD6D6
      D6FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFCECECEFFCDCD
      CDFFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000074B47DFFC0EAC4FFBBE8BFFFB5E6BAFF4D9D59FF92ACC5FF8EAA
      C4FF8BA8C2FF88A5C1FF85A3BFFF82A1BEFF49A0CCFF72E3F5FF83F6FFFF78EF
      FFFF6FEDFFFF63EAFFFF57E5FFFF4AE2FFFF43DFFFFF42E0FFFF3DCEF4FF408F
      B7FF5B84AAFF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE3E3E3FF656565FFDFDFE0FFDEDE
      DEFFA1A1A1FFDADADAFFD8D8D8FF656565FFD3D3D4FF656565FF8DADCBFF88AA
      C9FF84A7C7FF80A4C4FF7BA1C3FF789FC1FF749CBFFF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FF4D4E58FF545454FF545454FF5454
      54FF545454FF525654FF525654FF525654FF525654FF525654FF525654FF5454
      54FF545454FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFECECECFFEBEBEBFFE9E9E9FFE8E8E8FFE7E7E7FFE5E5E5FFBEB3ABFFE2E2
      E2FFB5B4B4FFB4B4B4FFB4B3B3FFB3B2B2FFB2B2B2FFB2B1B1FFB1B1B1FFB1B0
      B0FFB0B0B0FFB0AFAFFFAFAFAFFFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFCECE
      CEFFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000074B47DFFC5ECCAFFC0EAC4FFBBE8BFFF4D9D59FF96B0C9FF93AD
      C7FF90ABC5FF8DA9C3FF8AA6C1FF51A4CEFF86E6F5FFA2FEFFFF99F6FFFF90F4
      FFFF85F1FFFF76EEFFFF67EAFFFF57E5FFFF4AE2FFFF44DFFFFF43E2FFFF3DCE
      F4FF408FB7FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE4E4E4FF656565FFE1E1E1FFDFDF
      DFFFA1A1A1FFDBDBDBFFD9D9D9FF656565FFD5D5D5FF656565FF94B2CEFF8FAF
      CCFF8BACCAFF87A9C9FF83A6C7FF7EA3C4FF7AA1C2FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E
      58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E
      58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFEEEEEEFFECECECFFEBEBEBFFE9E9E9FFE8E8E8FFE7E7E7FFE5E5E5FFE4E4
      E4FFE2E2E2FFE1E1E1FFDFDFDFFFDEDEDEFFDCDCDCFFDBDBDBFFDADADAFFD8D8
      D8FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFCFCF
      CFFFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000074B47DFFCBEDCFFFC5ECCAFFC0EAC4FF4D9D59FF9AB3CBFF97B1
      C9FF94AEC8FF91ACC5FF69A9CFFF69CAE5FFA4F4FAFFAEF7FEFFB5FCFFFFAFFC
      FFFF9BF5FFFF8AF1FFFF77EEFFFF65EAFFFF56E9FFFF48E3FFFF43DCFCFF40D6
      F9FF38B6E3FF558BA6FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE5E5E5FF656565FFE2E2E2FFE0E0
      E0FFA1A1A1FFDCDCDCFFDADADAFF656565FFD6D6D6FF656565FF9BB6D1FF96B4
      CFFF92B1CEFF8EAECCFF8AABCAFF86A8C8FF82A5C5FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FF4D4E58FFA9AD98FFA9AD98FFA9AD98FFA9AD
      98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD
      98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FF4D4E58FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFEFEFEFFFEEEEEEFFECECECFFEBEBEBFFE9E9E9FFE8E8E8FFE6E6E6FFE5E5
      E5FFE4E4E4FFE2E2E2FFE1E1E1FFDFDFDFFFDEDEDEFFDCDCDCFFDBDBDBFFD9D9
      D9FFD8D8D8FFD7D7D7FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0
      D0FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000074B47DFF74B47DFF74B47DFF74B47DFF74B47DFF9FB6CDFF9CB4
      CCFF99B2CAFF96B0C9FF9AB8D1FF73AED1FF62A8CFFF5BA8D0FF54B2DAFF74CB
      E7FFAFF8FFFF9DF6FFFF87F2FFFF71EDFFFF46BFE5FF37A9D8FF449FCDFF559F
      C9FF63A2C9FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE6E6E6FF656565FFE3E3E3FFE1E1
      E1FFA1A1A1FFDDDDDDFFDBDBDBFF656565FFD7D7D7FF656565FFA1BBD4FF9DB8
      D3FF99B6D1FF95B3CFFF91B0CDFF8DADCBFF89AAC9FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFA9AD98FFC9CBBCFFC9CBBCFFC6C8
      B9FFB7B9ABFF9C9E92FF8F9086FF9A9C90FFB2B4A7FFC4C6B7FFC9CBBCFFC9CB
      BCFFC9CBBCFFC9CBBCFFC9CBBCFFC9CBBCFFA9AD98FFA9AD98FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFF0F0F0FFEFEFEFFFEEEEEEFFECECECFFEBEBEBFFE9E9E9FFA1A1A1FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF505050FF505050FF505050FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1
      D1FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFA3BAD0FFA0B7
      CEFF9DB5CDFF9AB3CBFF97B1C9FF94AEC8FF91ACC5FF92ADC7FF95B2CBFF5AA3
      CDFF97E1F2FFB2FCFFFF97F8FFFF68D8F1FF4692BBFF7597B7FF7699B8FF6F93
      B4FF6C90B2FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE7E7E7FF656565FFE4E4E4FFE2E2
      E2FFA1A1A1FFDEDEDEFFDCDCDDFF656565FFD8D8D9FF656565FFA8C0D8FFA4BD
      D6FFA0BAD4FF9CB8D2FF98B5D0FF94B2CEFF90AFCCFF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFC9CBBCFFD8DACFFFD1D3
      C8FFB4B6ACFF878881FF6C6D67FF7A7B75FF9FA098FFC0C2B8FFD2D4CAFFD8DA
      CFFFD8DACFFFD8DACFFFD8DACFFFC9CBBCFFC9CBBCFFA9AD98FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFF2F2F2FFF0F0F0FFEFEFEFFFEEEEEEFFECECECFFEBEBEBFFA1A1A1FFBBE7
      F7FFC8E8F1FF8AA19FFF225668FF225066FF27516AFFB0D4E3FFC7EAF4FFA7B3
      D4FF5E6886FF91A7CBFF505050FFD7D7D7FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2
      D2FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFA7BDD2FFA5BB
      D0FFA2B8CFFF9FB6CDFF9CB4CCFF99B2CAFF96AFC9FF93ADC7FF90ABC4FF95B5
      CFFF6AB0D2FFBAFDFFFF9FF9FFFF4C9DC3FF7C9DBBFF799BB9FF7698B8FF7396
      B6FF7094B5FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE8E8E8FF656565FFE5E5E5FFE3E3
      E3FFA1A1A1FFDFDFE0FFDDDDDEFF656565FFD9D9DAFF656565FF787878FF7878
      78FF787878FF787878FF787878FF787878FF97B4D0FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFD8DACFFFD8DACFFFCCCE
      C3FFA6A79FFF4D9D59FF50514CFF575753FF787973FF9FA098FFC0C2B8FFD2D4
      CAFFD8DACFFFD8DACFFFD8DACFFFD8DACFFFC9CBBCFFA9AD98FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFF3F3F3FFF2F2F2FFF0F0F0FFEFEFEFFFEDEDEDFFECECECFFA1A1A1FFBCE9
      F8FFC1E3F2FF8395A7FF3F808AFF2C6474FF8FB1C3FFD2F5FFFF96B0B9FFA5BD
      BEFF6A7D7EFFA4B8BCFF505050FFD8D8D8FFD7D7D7FFD5D5D5FFD4D4D4FFD3D3
      D3FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFACC0D4FFA9BE
      D2FFA6BCD1FFA3B9CFFFA0B7CEFF9DB5CCFF9AB3CBFF97B0C9FF94AEC8FF91AC
      C5FF5FA6CEFF9BE9F6FF8EE6F6FF5BA4CDFF82A0BDFF7E9EBCFF7A9CBAFF7799
      B9FF7497B7FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE9E9E9FF656565FFE6E6E6FFE4E4
      E4FFA1A1A1FFE1E1E1FFDFDFDFFF656565FFDBDBDBFF656565FFCCD0D6FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FF787878FF9EB9D3FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFD8DACFFFD5D7CCFFC2C4
      BAFF5FA369FF85DB8FFF4D9D59FF444541FF575753FF787973FF9FA098FFC0C2
      B8FFD2D4CAFFD8DACFFFD8DACFFFD8DACFFFC9CBBCFFA9AD98FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFF4F4F4FFF3F3F3FFF1F1F1FFF0F0F0FFEFEFEFFFEDEDEDFFA1A1A1FFC2ED
      FCFFB9DBEDFF8FB3C8FF3D7783FF3F6D82FFCBEDF9FFCEF0FDFFC3E3EFFFA7BE
      CEFF8A9AB8FF91A4ABFF505050FFD9D9D9FFD8D8D8FFD7D7D7FFD5D5D5FFD4D4
      D4FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFB0C3D6FFADC1
      D4FFAABFD3FFA7BDD2FFA4BAD0FFA2B8CFFF9FB6CDFF9CB4CCFF99B2CAFF96AF
      C8FF99B8D1FF6AB3D5FF68B2D4FF89A6C1FF86A4C0FF83A1BEFF809FBCFF7C9D
      BBFF799AB9FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFE9E9E9FF656565FFE7E7E7FFE5E5
      E5FFA1A1A1FFE2E2E2FFE0E0E0FF656565FFDCDCDCFF656565FFCCD0D6FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FF787878FFA5BED6FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFC9CBBCFFC0C2B3FFA3A4
      98FF5FA369FF8FDE97FF84DB8DFF4D9D59FF41413CFF50514BFF6F7068FF9495
      8AFFB2B4A7FFC4C6B7FFC9CBBCFFC9CBBCFFC9CBBCFFA9AD98FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFF5F5F5FFF4F4F4FFF3F3F3FFF1F1F1FFF0F0F0FFEFEFEFFFA1A1A1FFC1EB
      FAFFCEF1FEFFBBE3ECFF397383FF5C8599FFD5F6FFFFD0F2FDFFC8E7FFFFA3B5
      E5FFAAC1D4FF8186BBFF505050FFDBDBDBFFD9D9D9FFD8D8D8FFD7D7D7FFD5D5
      D5FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFB4C7D8FFB1C4
      D7FFAEC2D5FFABC0D4FFA9BED2FFA6BCD1FFA3B9CFFFA0B7CEFF9DB5CCFF9AB3
      CBFF97B0C9FF86B4D3FF84B3D2FF8EA9C4FF8BA7C2FF88A5C0FF85A2BFFF81A0
      BDFF7D9EBCFF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFEAEAEAFF656565FFE7E7E7FFE6E6
      E6FFA1A1A1FFE3E3E3FFE1E1E1FF656565FFDDDDDDFF656565FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFABC2D9FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFD5D7CCFFC2C4BAFF9799
      91FF5FA369FF98E1A0FF8EDE96FF83DB8CFF4D9D59FF4D4E4AFF595A55FF7879
      73FF9FA098FFC0C2B8FFD2D4CAFFD8DACFFFC9CBBCFFA9AD98FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFF1F1F1FFF0F0F0FFA1A1A1FFC0EB
      FAFFD1F5FFFFB6E0EBFF205167FF577C93FFDDFCFFFFD0F1F9FFCAEAFBFFB0C4
      FBFFC0E5F3FFBDDEF9FF505050FFDCDCDCFFDBDBDBFFD9D9D9FFD8D8D8FFD6D6
      D6FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFB7CADAFFB5C8
      D9FFB2C5D7FFB0C3D6FFADC1D4FFAABFD3FFA7BDD2FFA4BAD0FFA1B8CFFF9EB6
      CDFF9BB4CCFF98B1CAFF95AFC8FF92ADC7FF8FABC4FF8CA8C3FF89A6C1FF86A4
      C0FF83A1BEFF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFEBEBEBFF656565FFE8E8E8FFE7E7
      E7FFA1A1A1FFE4E4E4FFE2E2E2FF656565FFDEDEDEFF656565FFC7D6E5FFC3D4
      E4FFC0D2E2FFBCCFE1FFB9CDDFFFB5CADEFFB2C8DCFF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFD1D3C8FFB4B6ACFF5FA3
      69FFACE7B2FFA2E4A9FF97E19FFF8CDD95FF82DA8BFF4D9D59FF575753FF5C5D
      58FF787973FF9FA098FFC0C2B8FFD2D4CAFFC9CBBCFFA9AD98FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFF1F1F1FFA1A1A1FFC4EC
      FBFFD0F4FFFFA7D4DFFF3A6F7EFF486D87FFBDE1ECFF567D90FF5C8494FF4F75
      87FF2C4D62FF82A8B5FF505050FFDDDDDDFFDCDCDCFFDADADAFFD9D9D9FFD8D8
      D8FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFBBCCDCFFB9CB
      DAFFA1A1A1FF787878FF787878FF787878FF787878FF787878FF787878FF7878
      78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF8BA7
      C2FF87A5C0FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFEBEBEBFF656565FFE9E9E9FFE8E8
      E8FFA1A1A1FFE5E5E5FFE3E3E3FF656565FFDFDFE0FF656565FFCCD9E7FFC9D7
      E6FFC5D5E5FFC2D3E3FFBFD1E2FFBBCFE0FFB8CCDFFF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFCED0C6FFAFB0A8FF5FA3
      69FFB5EABBFF74B47DFF74B47DFF74B47DFF8BDD94FF81DA8AFF4D9D59FF6468
      5FFF60615CFF7A7B75FF9FA098FFC0C2B8FFC4C6B7FFA9AD98FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFF9F9F9FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFA1A1A1FFC3EB
      F9FFD3F6FFFF95C7D0FF1F5064FF7296ACFF86A6B7FF113855FF3D6E80FF4070
      80FF376C78FF355C6CFF505050FFDFDFDFFFDDDDDDFFDCDCDCFFDADADAFFD9D9
      D9FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFBECFDDFFBCCD
      DCFFA1A1A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF787878FF8FAA
      C4FF8CA8C3FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFA1A1A1FFEBEBEBFFEAEAEAFFE8E8
      E9FFE7E7E7FFA1A1A1FFA1A1A1FFE2E2E2FFE0E0E1FF656565FFD0DCE9FFCDDA
      E8FFCBD9E7FFC8D7E6FFC4D5E4FFC1D2E3FFBED0E1FF505050FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFD1D3C8FF5FA369FFC8EF
      CCFF74B47DFFC0C2B8FFD3D5CAFF74B47DFF74B47DFF8ADD93FF80DA89FF4D9D
      59FF71746DFF696A65FF7D7E77FF9FA098FFB2B4A7FFA5A894FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFFAFAFAFFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFA1A1A1FFC2EB
      FAFFC7EDFAFF5A969EFF123B54FF93B5C5FFD6F7FFFF739FB1FF82B2BEFFABD7
      E1FF74AEB6FF417481FF505050FFE0E0E0FFDFDFDFFFDDDDDDFFDCDCDCFFDADA
      DAFFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFC2D1DFFFC0D0
      DEFFA1A1A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF787878FF94AE
      C8FF91ACC5FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A1FFECECECFFEBEBEBFFEAEAEAFFE9E9
      E9FFE8E8E8FFE6E6E7FFE5E5E5FFE3E3E3FFE2E2E2FF656565FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFF6D2B7FFC3B8
      9BFF0000000000000000000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFD5D7CCFF5FA369FF5FA3
      69FFC7C9BFFFD2D4CAFFD8DACFFFD8DACFFFD8DACFFF74B47DFF89DC92FF7ED9
      88FF4D9D59FF80827AFF6E6F6AFF7D7E77FF96988CFF9A9E8AFF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFA1A1A1FFCCF1
      FFFF88BCC7FF3A7982FF123853FF80A3B7FFD8F5FAFFCBE4E5FFC3DEE2FFD0EA
      EDFFC5E9F4FF568C97FF505050FFE1E1E1FFE0E0E0FFDFDFDFFFDDDDDDFFDCDC
      DCFFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFC5D4E1FFC3D2
      E0FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FF98B1
      CAFF95AFC8FF505050FF00000000000000000000000000000000000000000000
      000000000000A1A1A1FF656565FF656565FF656565FF656565FF656565FF6565
      65FF656565FF656565FF656565FF656565FF656565FF656565FFF6D2B7FFF6D2
      B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2
      B7FFC3B89BFFC3B89BFF000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFC9CBBCFF5FA369FFC5C7
      B9FFC6C8B9FFC9CBBCFFC9CBBCFFC9CBBCFFC9CBBCFFC9CBBDFF74B47DFF74B4
      7DFF7DD987FF4D9D59FF7C8075FF6B6C64FF84857AFF8F9280FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFA1A1A1FFA4D2
      DEFF4B8D94FF336E7AFF0E304CFF6A8FA4FFD6EAE7FFCDDDD4FFCCDED8FFCADA
      D5FFCDEFF7FF4E7586FF505050FFE3E3E3FFE1E1E1FFE0E0E0FFDFDFDFFFDDDD
      DDFFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFC9D6E2FFC7D5
      E1FFC4D3E0FFC2D1DFFFBFD0DEFFBDCEDDFFBBCCDCFFB8CADAFFB6C8D9FFB3C7
      D8FFB1C4D6FFAEC2D5FFABBFD4FFA8BDD2FFA5BBD1FFA2B9CFFFA0B7CEFF9DB5
      CCFF9AB2CBFF505050FF00000000000000000000000000000000000000000000
      000000000000A1A1A1FFEBEBEBFFE9E9E9FFE7E7E8FFE6E6E6FFE4E4E4FFE2E2
      E2FFDFDFE0FFDDDDDDFFDBDBDBFFD8D8D8FFD6D6D6FF656565FFF6D2B7FFF6D2
      B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2
      B7FFF6D2B7FFC3B89BFF000000000000000000000000000000000000000B5454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFD8DACFFFD8DACFFFD8DA
      CFFFD8DACFFFD8DACFFFD8DACFFFD8DACFFFD8DACFFFD8DACFFFD8DACFFFD8DA
      CFFF74B47DFF7BD986FF4D9D59FF959890FF8F9086FF919482FF4D4E58FF4D4E
      58FF67697AFF545454FF000000260000000B000000000000000000000000D7B4
      A3FFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFA1A1A1FF4E8E
      97FF43878EFF316574FF0F304EFF4E6F85FF5C8091FF5D8494FF83AAB9FFA3C8
      D6FF81A4B1FF2D4A5EFF505050FFE4E4E4FFE3E3E3FFE1E1E1FFE0E0E0FFDEDE
      DEFFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFCBD8E4FFCAD7
      E3FFC8D5E2FFC5D4E1FFC3D2E0FFC0D1DFFFBECFDDFFBCCDDCFFB9CBDBFFB7C9
      DAFFB4C7D8FFB2C4D7FFAFC2D6FFACC0D4FFAABED3FFA7BCD1FFA4BAD0FFA1B8
      CEFF9EB6CDFF505050FF00000000000000000000000000000000000000000000
      000000000000A1A1A1FFA1A1A1FFE9E9E9FFE8E8E8FFE6E6E6FFE4E4E4FFE2E2
      E2FFE0E0E0FFDDDDDDFFDBDBDBFFD8D8D9FFD6D6D6FF656565FFF6D2B7FFF6D2
      B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2B7FFF6D2
      B7FFF6D2B7FFC3B89BFF00000000000000000000000000000000000000085454
      54FF67697AFF4D4E58FF4D4E58FFA9AD98FFC9CBBCFFD8DACFFFD8DACFFFD8DA
      CFFFD8DACFFFD8DACFFFD8DACFFFD8DACFFFD8DACFFFD8DACFFFD8DACFFFD8DA
      CFFFD2D9CAFF74B47DFF7AD885FF4D9D59FFACAEA1FF9DA18DFF4D4E58FF4D4E
      58FF67697AFF545454FF0000001D00000008000000000000000000000000D7B4
      A3FFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFA1A1A1FF4A88
      91FF40838BFF265567FF173A58FF153954FF10344CFF143850FF1B3D55FF2343
      57FF1C384EFF27485BFF505050FFE6E6E6FFE4E4E4FFE3E3E3FFE1E1E1FFE0E0
      E0FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFCEDAE5FFCCD9
      E4FFCAD7E3FFC9D6E2FFC7D4E1FFC4D3E0FFC1D1DFFFBFD0DEFFBDCEDDFFBBCC
      DBFFB8CADAFFB6C8D9FFB3C5D8FFB0C3D6FFAEC1D5FFABBFD3FFA8BDD2FFA5BB
      D1FFA2B9CFFF505050FF00000000000000000000000000000000000000000000
      00000000000000000000A1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FF656565FFC3B89BFFC3B8
      9BFFC3B89BFFC3B89BFFC3B89BFFC3B89BFFC3B89BFFC3B89BFFC3B89BFFC3B8
      9BFFC3B89BFF0000000000000000000000000000000000000000000000035454
      54FF67697AFF67697AFF67697AFFA9AD98FFC9CBBCFFC9CBBCFFC9CBBCFFC9CB
      BCFFC9CBBCFFC9CBBCFFC9CBBCFFC9CBBCFFC9CBBCFFC9CBBCFFC9CBBCFFC9CB
      BCFFC9CBBCFFC9CBBCFF74B47DFF74B47DFFC2C4B6FFA7AA96FF67697AFF6769
      7AFF67697AFF545454FF0000001100000003000000000000000000000000D7B4
      A3FFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFA1A1A1FF4081
      8AFF3D7B85FF215266FF193E5BFF193C57FF183B55FF1D4058FF22445BFF1B3C
      54FF22425BFF4F7287FF505050FFE7E7E7FFE6E6E6FFE4E4E4FFE3E3E3FFE1E1
      E1FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFD0DCE6FFCFDA
      E5FFCDD9E4FFCBD8E4FFC9D7E3FFC8D5E2FFC5D4E1FFC2D2E0FFC0D0DEFFBECF
      DDFFBCCDDCFFB9CBDBFFB7C9DAFFB4C7D8FFB2C4D7FFAFC2D6FFACC0D4FFA9BE
      D3FFA7BCD1FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A1FF00000000000000000000000000000000000000000000
      0000A1A1A1FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0026545454FF545454FF545454FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD
      98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD
      98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FFA9AD98FF545454FF5454
      54FF545454FF000000360000000400000000000000000000000000000000D7B4
      A3FFFEFEFEFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFE8E8E8FFE7E7E7FFE6E6E6FFE4E4E4FFE3E3
      E3FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFD2DDE7FFD1DC
      E6FFCFDBE6FFCEDAE5FFCCD9E4FFCAD7E3FFC8D6E2FFC7D4E1FFC3D3E0FFC1D1
      DFFFBFD0DEFFBDCEDDFFBACCDBFFB8CADAFFB5C8D9FFB3C5D8FFB0C3D6FFAEC1
      D5FFABBFD3FF505050FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D7B4
      A3FFFFFFFFFFFEFEFEFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9
      F9FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFF3F3F3FFF2F2F2FFF1F1F1FFEFEF
      EFFFEEEEEEFFEDEDEDFFEBEBEBFFEAEAEAFFE8E8E8FFE7E7E7FFE5E5E5FFE4E4
      E4FFD09476FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009897970066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600666666009897970066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600666666008B8B8B0019191900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      1900191919001919190019191900191919008B8B8B0019191900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      19001919190019191900191919001919190098979700FAE4D300F9E3D200F9E3
      D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DDC800F8DD
      C700F8DCC500F8DBC400F8DAC300F8DAC100F7D9C000F7D8BF00F7D8BE00F7D7
      BD00F7D7BC00F7D6BB00F7D5BB00F7D5BA00F6D4B900F6D4B800F6D4B700F6D3
      B700F6D3B600F6D2B600F6D2B5006666660098979700FAE4D300F9E3D200F9E3
      D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DDC800F8DD
      C700F8DCC500F8DBC400F8DAC300F8DAC100F7D9C000F7D8BF00F7D8BE00F7D7
      BD00F7D7BC00F7D6BB00F7D5BB00F7D5BA00F6D4B900F6D4B800F6D4B700F6D3
      B700F6D3B600F6D2B600F6D2B500666666008B8B8B00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8
      CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2C200FFE1
      C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDEBC00FFDDBB00FFDDBA00FFDC
      B900FFDCB800FFDBB700FFDBB700191919008B8B8B00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8
      CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2C200FFE1
      C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDEBC00FFDDBB00FFDDBA00FFDC
      B900FFDCB800FFDBB700FFDBB7001919190098979700FAE5D400FAE4D300F9E3
      D200F9E3D100F9E2D000F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900B1B9
      BF00F8DDC700F8DCC500F8DBC400F8DAC300F8DAC100A1A1A100666666006666
      660066666600666666006666660066666600F7D5BA00F6D4B900F6D4B800F6D4
      B700F6D3B700F6D3B600F6D2B6006666660098979700FAE5D400FAE4D30000A9
      0000F9E3D100F9E2D000F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900B1B9
      BF00F8DDC700F8DCC500F8DBC400F8DAC300F8DAC100A1A1A100666666006666
      660066666600666666006666660066666600F7D5BA00F6D4B900F6D4B800F6D4
      B700F6D3B700F6D3B600F6D2B600666666008B8B8B00FFF3DE00FFF2DC00FFF1
      DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9
      CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2
      C200FFE1C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDEBC00FFDDBB00FFDD
      BA00FFDCB900FFDCB800FFDBB700191919008B8B8B00FFF3DE00FFF2DC00FFF1
      DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9
      CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2
      C200FFE1C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDEBC00FFDDBB00FFDD
      BA00FFDCB900FFDCB800FFDBB7001919190098979700FAE6D600FAE5D400FAE4
      D300F9E3D200F9E3D100F9E2D000F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DE
      C900F8DDC800F8DDC700F8DCC500F8DBC400F8DAC300A1A1A100EAEAEA00EDED
      ED00F1F1F100F5F5F500F8F8F80066666600F7D5BB00F7D5BA00F6D4B900F6D4
      B800F6D4B700F6D3B700F6D3B6006666660098979700FAE6D600FAE5D40000A9
      0000F9E3D200006C0000006C0000006C0000006C0000006C0000006C0000F8DE
      C900F8DDC800F8DDC700F8DCC500F8DBC400F8DAC300A1A1A100EAEAEA00EDED
      ED00F1F1F100F5F5F500F8F8F80066666600F7D5BB00F7D5BA00F6D4B900F6D4
      B800F6D4B700F6D3B700F6D3B600666666008B8B8B00FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C500FFE3
      C400FFE2C200FFE1C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDEBC00FFDD
      BB00FFDDBA00FFDCB900FFDCB800191919008B8B8B00FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C500FFE3
      C400FFE2C200FFE1C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDEBC00FFDD
      BB00FFDDBA00FFDCB900FFDCB8001919190098979700FAE7D700FAE6D600FAE5
      D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00B1B9
      BF00F8DEC900B1B9BF00F8DDC700B1B9BF00F8DBC400A1A1A100E6E6E600EAEA
      EA00EDEDED00F1F1F100F5F5F50066666600F7D6BB00F7D5BB00F7D5BA00F6D4
      B900F6D4B800F6D3B700F6D3B7006666660098979700FAE7D700FAE6D60000A9
      0000006C000063E170005BDF690053DC62004BDA5B0044D854003DD64D00006C
      0000F8DEC900B1B9BF00F8DDC700B1B9BF00F8DBC400A1A1A100E6E6E600EAEA
      EA00EDEDED00F1F1F100F5F5F50066666600F7D6BB00F7D5BB00F7D5BA00F6D4
      B900F6D4B800F6D3B700F6D3B700666666008B8B8B00FFF5E100FFF4DF00A1A1
      A100A1A1A100A1A1A100FFF0D900A1A1A100A1A1A100A1A1A100A1A1A100FFEB
      D100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFE1C100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFDDBA00FFDCB900191919008B8B8B00FFF5E100FFF4DF00FFF3
      DE00FFF2DC00FFF1DB00FFF0D900A1A1A100A1A1A100A1A1A100FFECD300FFEB
      D100FFEAD000A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFE0C000A1A1A100A1A1A100A1A1A100A1A1
      A100FFDDBB00FFDDBA00FFDCB9001919190098979700FAE7D800FAE7D700FAE6
      D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0
      CC00F9DFCB00F8DEC900F8DDC800F8DDC700F8DCC500A1A1A100E3E3E300E6E6
      E600EAEAEA00EDEDED00F1F1F10066666600F7D7BC00F7D6BB00F7D5BB00F7D5
      BA00F6D4B900F6D4B800F6D3B7006666660098979700FAE7D800FAE7D70000A9
      000076E781006DE47A0065E273005DDF6B00006C000000A9000000A9000000A9
      0000006C0000F8DEC900F8DDC800F8DDC700F8DCC500A1A1A100E3E3E300E6E6
      E600EAEAEA00EDEDED00F1F1F10066666600F7D7BC00F7D6BB00F7D5BB00F7D5
      BA00F6D4B900F6D4B800F6D3B700666666008B8B8B00FFF5E300FFF5E100A1A1
      A100FFF3DE00A1A1A100FFF1DB00A1A1A100A1A1A100A1A1A100A1A1A100FFEC
      D300A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFE2C200A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFDDBB00FFDDBA00191919008B8B8B00FFF5E300FFF5E100FFF4
      DF00A1A1A100CBCBCD00A1A1A100A1A1A100FFEFD800A1A1A100FFEDD500FFEC
      D300FFEBD100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFE1C100A1A1A100A1A1A100A1A1A100A1A1
      A100FFDEBC00FFDDBB00FFDDBA001919190098979700FAE8D900FAE7D800FAE7
      D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00B1B9
      BF00F9E0CC00F9DFCB00F8DEC900F8DDC800F8DDC700A1A1A100E0E0E000E3E3
      E300E6E6E600EAEAEA00EDEDED0066666600F7D7BD00F7D7BC00F7D6BB00F7D5
      BB00F7D5BA00F6D4B900F6D4B8006666660098979700FAE8D900FAE7D80000A9
      000080EA8B0078E7840070E57D0068E37500006C0000F9E2CF00F9E1CE00B1B9
      BF0000A9000000A90000F8DEC900F8DDC800F8DDC700A1A1A100E0E0E000E3E3
      E300E6E6E600EAEAEA00EDEDED0066666600F7D7BD00F7D7BC00F7D6BB00F7D5
      BB00F7D5BA00F6D4B900F6D4B800666666008B8B8B00FFF6E400FFF5E300A1A1
      A100A1A1A100A1A1A100FFF2DC00A1A1A100A1A1A100A1A1A100A1A1A100FFED
      D500A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFE3C400A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFDEBC00FFDDBB00191919008B8B8B00FFF6E400FFF5E300FFF5
      E100CBCBCD00FFF3DE00FFF2DC00A1A1A100A1A1A100A1A1A100FFEED600FFED
      D500FFECD300A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFE2C200A1A1A100A1A1A100A1A1A100A1A1
      A100FFDEBD00FFDEBC00FFDDBB001919190098979700FBE9DB00FAE8D900FAE7
      D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1
      CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DDC800A1A1A100DEDEDE00E0E0
      E000E3E3E300E6E6E600EAEAEA0066666600F7D8BE00F7D7BD00F7D7BC00F7D6
      BB00F7D5BB00F7D5BA00F6D4B9006666660098979700FBE9DB00FAE8D90000A9
      00008BED950083EB8E007BE88600006C0000F9E3D200F9E3D100F9E2CF00F9E1
      CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DDC800A1A1A100DEDEDE00E0E0
      E000E3E3E300E6E6E600EAEAEA0066666600F7D8BE00F7D7BD00F7D7BC00F7D6
      BB00F7D5BB00F7D5BA00F6D4B900666666008B8B8B00FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8CD00FFE7CC00FFE6
      CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2C200FFE1C100FFE0C000FFE0
      BF00FFDFBE00FFDEBD00FFDEBC00191919008B8B8B00FFF7E600FFF6E400FFF5
      E300A1A1A100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8CD00FFE7CC00FFE6
      CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2C200FFE1C100FFE0C000FFE0
      BF00FFDFBE00FFDEBD00FFDEBC001919190098979700FBEADC00FBE9DB00FAE8
      D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3D100B1B9
      BF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100F7D8BF00F7D8BE00F7D7BD00F7D7
      BC00F7D6BB00F7D5BB00F7D5BA006666660098979700FBEADC00FBE9DB0000A9
      000000A9000000A9000000A9000000A9000000A9000000A90000F9E3D100B1B9
      BF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100F7D8BF00F7D8BE00F7D7BD00F7D7
      BC00F7D6BB00F7D5BB00F7D5BA00666666008B8B8B00FFF8E700FFF7E600A1A1
      A100A1A1A100A1A1A100FFF4DF00A1A1A100A1A1A100A1A1A100A1A1A100FFEF
      D800A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFE4C700A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFDFBE00FFDEBD00191919008B8B8B00FFF8E700FFF7E600A1A1
      A100A1A1A100A1A1A100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEF
      D800FFEED600A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFE4C500A1A1A100A1A1A100A1A1A100A1A1
      A100FFE0BF00FFDFBE00FFDEBD001919190098979700FBEADD00FBEADC00FBE9
      DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3
      D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DDC800F8DD
      C700F8DCC500F8DBC400F8DAC300F8DAC100F7D9C000F7D8BF00F7D8BE00F7D7
      BD00F7D7BC00F7D6BB00F7D5BB006666660098979700FBEADD00FBEADC00FBE9
      DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3
      D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DDC800F8DD
      C700F8DCC500F8DBC400F8DAC300F8DAC100F7D9C000F7D8BF00F7D8BE00F7D7
      BD00F7D7BC00F7D6BB00F7D5BB00666666008B8B8B00FFF9E900FFF8E700A1A1
      A100FFF6E400A1A1A100FFF5E100A1A1A100A1A1A100A1A1A100A1A1A100FFF0
      D900A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFE5C900A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFE0BF00FFDFBE00191919008B8B8B00FFF9E900FFF8E700A1A1
      A100FFF6E400A1A1A100FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0
      D900FFEFD800A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFE4C700A1A1A100A1A1A100A1A1A100A1A1
      A100FFE0C000FFE0BF00FFDFBE001919190098979700FBEBDE00FBEADD00FBEA
      DC00FBE9DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300B1B9
      BF00F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DD
      C800F8DDC700F8DCC500F8DBC400F8DAC300F8DAC100F7D9C000F7D8BF00F7D8
      BE00F7D7BD00F7D7BC00F7D6BB006666660098979700FBEBDE00FBEADD00FBEA
      DC00FBE9DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300B1B9
      BF00F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DD
      C800F8DDC700F8DCC500F8DBC400F8DAC300F8DAC100F7D9C000F7D8BF00F7D8
      BE00F7D7BD00F7D7BC00F7D6BB00666666008B8B8B00FFFAEA00FFF9E900A1A1
      A100A1A1A100A1A1A100FFF5E300A1A1A100A1A1A100A1A1A100A1A1A100FFF1
      DB00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFE6CA00A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFE0C000FFE0BF00191919008B8B8B00FFFAEA00FFF9E900A1A1
      A100A1A1A100A1A1A100FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1
      DB00FFF0D900A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFE5C900A1A1A100A1A1A100A1A1A100A1A1
      A100FFE1C100FFE0C000FFE0BF001919190098979700FBECDF00FBEBDE00FBEA
      DD00FBEADC00FBE9DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4
      D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0CD00A1A1A100666666006666
      660066666600666666006666660066666600F8DAC300F8DAC100F7D9C000F7D8
      BF00F7D8BE00F7D7BD00F7D7BC006666660098979700FBECDF00FBEBDE00FBEA
      DD00FBEADC00FBE9DB00FAE8D900FAE7D800006C0000006C0000006C0000006C
      0000006C0000006C0000006C0000F9E1CE00F9E0CD00A1A1A100666666006666
      660066666600666666006666660066666600F8DAC300F8DAC100F7D9C000F7D8
      BF00F7D8BE00F7D7BD00F7D7BC00666666008B8B8B00FFFBEB00FFFAEA00FFF9
      E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C500FFE3
      C400FFE2C200FFE1C100FFE0C000191919008B8B8B00FFFBEB00FFFAEA00FFF9
      E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C500FFE3
      C400FFE2C200FFE1C100FFE0C0001919190098979700FBEDE000FBECDF00FBEB
      DE00FBEADD00FBEADC00FBE9DB00FAE8D900FAE7D800FAE7D700FAE6D600B1B9
      BF00FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00A1A1A100EAEAEA00EDED
      ED00F1F1F100F5F5F500F8F8F80066666600F8DBC400F8DAC300F8DAC100F7D9
      C000F7D8BF00F7D8BE00F7D7BD006666660098979700FBEDE000FBECDF00FBEB
      DE00FBEADD00FBEADC00FBE9DB00FAE8D900FAE7D800FAE7D700006C000088EC
      930080EA8B0078E78400006C0000F9E2CF00F9E1CE00A1A1A100EAEAEA00EDED
      ED00F1F1F100F5F5F500F8F8F80066666600F8DBC400F8DAC300F8DAC100F7D9
      C000F7D8BF00F7D8BE00F7D7BD00666666008B8B8B00FFFCED00FFFBEB00A1A1
      A100A1A1A100A1A1A100FFF7E600A1A1A100A1A1A100A1A1A100A1A1A100FFF3
      DE00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFE8CD00A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFE2C200FFE1C100191919008B8B8B00FFFCED00FFFBEB00FFFA
      EA00FFF9E900FFF8E700FFF7E600A1A1A100A1A1A100A1A1A100FFF4DF00FFF3
      DE00FFF2DC00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFE7CC00A1A1A100A1A1A100A1A1A100A1A1
      A100FFE3C400FFE2C200FFE1C1001919190098979700FBEDE200FBEDE000FBEC
      DF00FBEBDE00FBEADD00FBEADC00FBE9DB00FAE8D900FAE7D800FAE7D700FAE6
      D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00A1A1A100E6E6E600EAEA
      EA00EDEDED00F1F1F100F5F5F50066666600F8DCC500F8DBC400F8DAC300F8DA
      C100F7D9C000F7D8BF00F7D8BE006666660098979700FBEDE200FBEDE000FBEC
      DF0000A90000006C0000FBEADC00FBE9DB00FAE8D900006C00009BF2A40093EF
      9D008BED950083EB8E00006C0000F9E3D100F9E2CF00A1A1A100E6E6E600EAEA
      EA00EDEDED00F1F1F100F5F5F50066666600F8DCC500F8DBC400F8DAC300F8DA
      C100F7D9C000F7D8BF00F7D8BE00666666008B8B8B00FFFDEE00FFFCED00A1A1
      A100FFFAEA00A1A1A100FFF8E700A1A1A100A1A1A100A1A1A100A1A1A100FFF4
      DF00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFE9CE00A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFE3C400FFE2C200191919008B8B8B00FFFDEE00FFFCED00FFFB
      EB00A1A1A100CBCBCD00A1A1A100A1A1A100FFF6E400A1A1A100FFF5E100FFF4
      DF00FFF3DE00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFE8CD00A1A1A100A1A1A100A1A1A100A1A1
      A100FFE4C500FFE3C400FFE2C2001919190098979700FCEEE300FBEDE200FBED
      E000FBECDF00FBEBDE00FBEADD00FBEADC00FBE9DB00FAE8D900FAE7D800B1B9
      BF00FAE6D600B1B9BF00FAE4D300B1B9BF00F9E3D100A1A1A100E3E3E300E6E6
      E600EAEAEA00EDEDED00F1F1F10066666600F8DDC700F8DCC500F8DBC400F8DA
      C300F8DAC100F7D9C000F7D8BF006666660098979700FCEEE300FBEDE200FBED
      E000FBECDF0000A90000006C0000006C0000006C0000ACF7B400A5F5AD009DF2
      A60096F09F008EEE9800006C0000B1B9BF00F9E3D100A1A1A100E3E3E300E6E6
      E600EAEAEA00EDEDED00F1F1F10066666600F8DDC700F8DCC500F8DBC400F8DA
      C300F8DAC100F7D9C000F7D8BF00666666008B8B8B00FFFEF000FFFDEE00A1A1
      A100A1A1A100A1A1A100FFF9E900A1A1A100A1A1A100A1A1A100A1A1A100FFF5
      E100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFEAD000A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFE4C500FFE3C400191919008B8B8B00FFFEF000FFFDEE00FFFC
      ED00CBCBCD00FFFAEA00FFF9E900A1A1A100A1A1A100A1A1A100FFF5E300FFF5
      E100FFF4DF00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFE9CE00A1A1A100A1A1A100A1A1A100A1A1
      A100FFE4C700FFE4C500FFE3C4001919190098979700FCEFE400FCEEE300FBED
      E200FBEDE000FBECDF00FBEBDE00FBEADD00FBEADC00FBE9DB00FAE8D900FAE7
      D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200A1A1A100E0E0E000E3E3
      E300E6E6E600EAEAEA00EDEDED0066666600F8DDC800F8DDC700F8DCC500F8DB
      C400F8DAC300F8DAC100F7D9C0006666660098979700FCEFE400FCEEE300FBED
      E200FBEDE000FBECDF0000A90000C3FECA00BDFCC300B6FABD00AFF8B600A7F5
      AF00A0F3A80000A90000006C0000FAE4D300F9E3D200A1A1A100E0E0E000E3E3
      E300E6E6E600EAEAEA00EDEDED0066666600F8DDC800F8DDC700F8DCC500F8DB
      C400F8DAC300F8DAC100F7D9C000666666008B8B8B00FFFEF100FFFEF000FFFD
      EE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8CD00FFE7CC00FFE6
      CA00FFE5C900FFE4C700FFE4C500191919008B8B8B00FFFEF100FFFEF000FFFD
      EE00A1A1A100FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8CD00FFE7CC00FFE6
      CA00FFE5C900FFE4C700FFE4C5001919190098979700FCEFE500FCEFE400FCEE
      E300FBEDE200FBEDE000FBECDF00FBEBDE00FBEADD00FBEADC00FBE9DB00B1B9
      BF00FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300A1A1A100DEDEDE00E0E0
      E000E3E3E300E6E6E600EAEAEA0066666600F8DEC900F8DDC800F8DDC700F8DC
      C500F8DBC400F8DAC300F8DAC1006666660098979700FCEFE500FCEFE400FCEE
      E300FBEDE200FBEDE000FBECDF0000A9000000A9000000A9000000A9000000A9
      000000A90000FAE7D700006C0000FAE5D400FAE4D300A1A1A100DEDEDE00E0E0
      E000E3E3E300E6E6E600EAEAEA0066666600F8DEC900F8DDC800F8DDC700F8DC
      C500F8DBC400F8DAC300F8DAC100666666008B8B8B00FFFFF200FFFEF100A1A1
      A100A1A1A100A1A1A100FFFBEB00A1A1A100A1A1A100A1A1A100A1A1A100FFF6
      E400A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFECD300A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFE5C900FFE4C700191919008B8B8B00FFFFF200FFFEF100FFFE
      F000CBCBCD00FFFCED00FFFBEB00A1A1A100A1A1A100A1A1A100FFF7E600FFF6
      E400FFF5E300A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFEBD100A1A1A100A1A1A100A1A1A100A1A1
      A100FFE6CA00FFE5C900FFE4C7001919190098979700FCF0E600FCEFE500FCEF
      E400FCEEE300FBEDE200FBEDE000FBECDF00FBEBDE00FBEADD00FBEADC00FBE9
      DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100F9DFCB00F8DEC900F8DDC800F8DD
      C700F8DCC500F8DBC400F8DAC3006666660098979700FCF0E600FCEFE500FCEF
      E400FCEEE300FBEDE200FBEDE000FBECDF00FBEBDE00FBEADD00FBEADC00FBE9
      DB00FAE8D900FAE7D80000A90000FAE6D600FAE5D400A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100F9DFCB00F8DEC900F8DDC800F8DD
      C700F8DCC500F8DBC400F8DAC300666666008B8B8B00FFFFF300FFFFF200A1A1
      A100FFFEF000A1A1A100FFFCED00A1A1A100A1A1A100A1A1A100A1A1A100FFF7
      E600A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFEDD500A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFE6CA00FFE5C900191919008B8B8B00FFFFF300FFFFF200FFFE
      F100A1A1A100CBCBCD00A1A1A100A1A1A100FFFAEA00A1A1A100FFF8E700FFF7
      E600FFF6E400A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFECD300A1A1A100A1A1A100A1A1A100A1A1
      A100FFE7CC00FFE6CA00FFE5C9001919190098979700FCF0E700FCF0E600FCEF
      E500FCEFE400FCEEE300FBEDE200FBEDE000FBECDF00FBEBDE00FBEADD00B1B9
      BF00FBE9DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3
      D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DD
      C800F8DDC700F8DCC500F8DBC4006666660098979700FCF0E700FCF0E600FCEF
      E500FCEFE400FCEEE300FBEDE200FBEDE000FBECDF00FBEBDE00FBEADD00B1B9
      BF00FBE9DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3
      D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DEC900F8DD
      C800F8DDC700F8DCC500F8DBC400666666008B8B8B00FFFFF500FFFFF300A1A1
      A100A1A1A100A1A1A100FFFDEE00A1A1A100A1A1A100A1A1A100A1A1A100FFF8
      E700A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFEED600A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFE7CC00FFE6CA00191919008B8B8B00FFFFF500FFFFF300FFFF
      F200CBCBCD00FFFEF000FFFDEE00A1A1A100A1A1A100A1A1A100FFF9E900FFF8
      E700FFF7E600A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFEDD500A1A1A100A1A1A100A1A1A100A1A1
      A100FFE8CD00FFE7CC00FFE6CA001919190098979700FCF1E800FCF0E700FCF0
      E600FCEFE500FCEFE400FCEEE300FBEDE200A1A1A10066666600666666006666
      6600666666006666660066666600FAE7D800FAE7D700FAE6D600FAE5D400FAE4
      D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DE
      C900F8DDC800F8DDC700F8DCC5006666660098979700FCF1E800FCF0E700FCF0
      E600FCEFE500FCEFE400FCEEE300FBEDE200A1A1A10066666600666666006666
      6600666666006666660066666600FAE7D800FAE7D700FAE6D600FAE5D400FAE4
      D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DFCB00F8DE
      C900F8DDC800F8DDC700F8DCC500666666008B8B8B00FFFFF600FFFFF500FFFF
      F300FFFFF200FFFEF100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9
      E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC00191919008B8B8B00FFFFF600FFFFF500FFFF
      F300A1A1A100FFFEF100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9
      E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC001919190098979700FCF2E800FCF1E800FCF0
      E700FCF0E600FCEFE500FCEFE400FCEEE300A1A1A100EAEAEA00EDEDED00F1F1
      F100F5F5F500F8F8F80066666600FAE8D900FAE7D800FAE7D700FAE6D600FAE5
      D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DF
      CB00F8DEC900F8DDC800F8DDC7006666660098979700FCF2E800FCF1E800FCF0
      E700FCF0E600FCEFE500FCEFE400FCEEE300A1A1A100EAEAEA00EDEDED00F1F1
      F100F5F5F500F8F8F80066666600FAE8D900FAE7D800FAE7D700FAE6D600FAE5
      D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0CC00F9DF
      CB00F8DEC900F8DDC800F8DDC700666666008B8B8B00FFFFF700FFFFF600A1A1
      A100A1A1A100A1A1A100FFFEF100A1A1A100A1A1A100A1A1A100A1A1A100FFFA
      EA00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFF0D900A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFE9CE00FFE8CD00191919008B8B8B00FFFFF700FFFFF600A1A1
      A100A1A1A100A1A1A100FFFEF100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFA
      EA00FFF9E900A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFEFD800A1A1A100A1A1A100A1A1A100A1A1
      A100FFEAD000FFE9CE00FFE8CD001919190098979700FCF2E900FCF2E800FCF1
      E800FCF0E700FCF0E600FCEFE500FCEFE400A1A1A100E6E6E600EAEAEA00EDED
      ED00F1F1F100F5F5F50066666600FBE9DB00FAE8D900FAE7D800FAE7D700FAE6
      D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0
      CC00F9DFCB00F8DEC900F8DDC8006666660098979700FCF2E900FCF2E800FCF1
      E800FCF0E700FCF0E600FCEFE500FCEFE400A1A1A100E6E6E600EAEAEA00EDED
      ED00F1F1F100F5F5F50066666600FBE9DB00FAE8D900FAE7D800FAE7D700FAE6
      D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0CD00F9E0
      CC00F9DFCB00F8DEC900F8DDC800666666008B8B8B00FFFFF800FFFFF700A1A1
      A100FFFFF500A1A1A100FFFFF200A1A1A100A1A1A100A1A1A100A1A1A100FFFB
      EB00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFF1DB00A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFEAD000FFE9CE00191919008B8B8B00FFFFF800FFFFF700A1A1
      A100FFFFF500A1A1A100FFFFF200FFFEF100FFFEF000FFFDEE00FFFCED00FFFB
      EB00FFFAEA00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFF0D900A1A1A100A1A1A100A1A1A100A1A1
      A100FFEBD100FFEAD000FFE9CE001919190098979700FDF3EA00FCF2E900FCF2
      E800B1B9BF00FCF0E700B1B9BF00FCEFE500A1A1A100E3E3E300E6E6E600EAEA
      EA00EDEDED00F1F1F10066666600FBEADC00FBE9DB00FAE8D900FAE7D800FAE7
      D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0
      CD00F9E0CC00F9DFCB00F8DEC9006666660098979700FDF3EA00FCF2E900FCF2
      E800B1B9BF00FCF0E700B1B9BF00FCEFE500A1A1A100E3E3E300E6E6E600EAEA
      EA00EDEDED00F1F1F10066666600FBEADC00FBE9DB00FAE8D900FAE7D800FAE7
      D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1CE00F9E0
      CD00F9E0CC00F9DFCB00F8DEC900666666008B8B8B00FFFFF900FFFFF800A1A1
      A100A1A1A100A1A1A100FFFFF300A1A1A100A1A1A100A1A1A100A1A1A100FFFC
      ED00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100FFF2DC00A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100FFEBD100FFEAD000191919008B8B8B00FFFFF900FFFFF800A1A1
      A100A1A1A100A1A1A100FFFFF300FFFFF200FFFEF100FFFEF000FFFDEE00FFFC
      ED00FFFBEB00A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FFF1DB00A1A1A100A1A1A100A1A1A100A1A1
      A100FFECD300FFEBD100FFEAD0001919190098979700FDF3EB00FDF3EA00FCF2
      E900FCF2E800FCF1E800FCF0E700FCF0E600A1A1A100E0E0E000E3E3E300E6E6
      E600EAEAEA00EDEDED0066666600FBEADD00FBEADC00FBE9DB00FAE8D900FAE7
      D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1
      CE00F9E0CD00F9E0CC00F9DFCB006666660098979700FDF3EB00FDF3EA00FCF2
      E900FCF2E800FCF1E800FCF0E700FCF0E600A1A1A100E0E0E000E3E3E300E6E6
      E600EAEAEA00EDEDED0066666600FBEADD00FBEADC00FBE9DB00FAE8D900FAE7
      D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2CF00F9E1
      CE00F9E0CD00F9E0CC00F9DFCB00666666008B8B8B00FFFFFA00FFFFF900FFFF
      F800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFEF000FFFD
      EE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100191919008B8B8B00FFFFFA00FFFFF900FFFF
      F800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFEF000FFFD
      EE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD1001919190098979700FDF3EC00FDF3EB00FDF3
      EA00FCF2E900FCF2E800FCF1E800FCF0E700A1A1A100DEDEDE00E0E0E000E3E3
      E300E6E6E600EAEAEA0066666600FBEBDE00FBEADD00FBEADC00FBE9DB00FAE8
      D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2
      CF00F9E1CE00F9E0CD00F9E0CC006666660098979700FDF3EC00FDF3EB00FDF3
      EA00FCF2E900FCF2E800FCF1E800FCF0E700A1A1A100DEDEDE00E0E0E000E3E3
      E300E6E6E600EAEAEA0066666600FBEBDE00FBEADD00FBEADC00FBE9DB00FAE8
      D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3D100F9E2
      CF00F9E1CE00F9E0CD00F9E0CC00666666008B8B8B00FFFFFB00FFFFFA00FFFF
      F900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFE
      F000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6
      E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEF
      D800FFEED600FFEDD500FFECD300191919008B8B8B00FFFFFB00FFFFFA00FFFF
      F900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFE
      F000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6
      E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEF
      D800FFEED600FFEDD500FFECD3001919190098979700FDF4EC00FDF3EC00FDF3
      EB00FDF3EA00FCF2E900FCF2E800FCF1E800A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FBECDF00FBEBDE00FBEADD00FBEADC00FBE9
      DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3
      D100F9E2CF00F9E1CE00F9E0CD006666660098979700FDF4EC00FDF3EC00FDF3
      EB00FDF3EA00FCF2E900FCF2E800FCF1E800A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A1A1A100A1A1A100FBECDF00FBEBDE00FBEADD00FBEADC00FBE9
      DB00FAE8D900FAE7D800FAE7D700FAE6D600FAE5D400FAE4D300F9E3D200F9E3
      D100F9E2CF00F9E1CE00F9E0CD00666666008B8B8B00FFFFFC00FFFFFB00FFFF
      FA00FFFFF900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFE
      F100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7
      E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD500191919008B8B8B00FFFFFC00FFFFFB00FFFF
      FA00FFFFF900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFE
      F100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7
      E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD5001919190098979700D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB6006666660098979700D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600666666008B8B8B00D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600191919008B8B8B00D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600191919009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700666666009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700666666008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B00191919008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B001919190098979700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE0098979700DEDEDE00DEDEDE006666660098979700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE0098979700DEDEDE00DEDEDE00666666008B8B8B00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE008B8B8B00DEDEDE00DEDEDE00DEDEDE00DEDEDE008B8B
      8B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE008B8B8B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00191919008B8B8B00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE008B8B8B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE008B8B8B00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE001919190098979700EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00DEDE
      DE0098979700EAE9EA00EAE9EA006666660098979700EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00DEDE
      DE0098979700EAE9EA00EAE9EA00666666008B8B8B00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00DEDEDE008B8B8B00EAE9EA00EAE9EA00EAE9EA00DEDEDE008B8B
      8B00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00DEDEDE008B8B8B00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00191919008B8B8B00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00DEDE
      DE008B8B8B00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00DEDEDE008B8B8B00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA001919190098979700F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600EAE9
      EA0098979700F5F5F600F5F5F6006666660098979700F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600EAE9
      EA0098979700F5F5F600F5F5F600666666008B8B8B00F5F5F600F5F5F600F5F5
      F600F5F5F600EAE9EA008B8B8B00F5F5F600F5F5F600F5F5F600EAE9EA008B8B
      8B00F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600EAE9EA008B8B8B00F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600191919008B8B8B00F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600EAE9
      EA008B8B8B00F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600EAE9EA008B8B8B00F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600191919009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797009897970098979700989797009897
      9700989797009897970098979700989797008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      0113000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B0019191900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      1900191919001919190019191900191919001919190019191900191919001919
      1900191919001919190019191900191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006667
      69BB20262EFF565A60FB76777ADD1C1C1C590000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8
      CD00FFE7CC00FFE6CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2C200FFE1
      C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDEBC00FFDDBB00FFDDBA00FFDC
      B900FFDCB800FFDBB700FFDBB700191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6F
      72F15C6268FF9A9CA0FF171E26FF2E3032A70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00FFF3DE00FFF2DC00FFF1
      DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD0008B8B
      8B0019191900191919001919190019191900191919001919190019191900FFE2
      C200FFE1C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDEBC00FFDDBB00FFDD
      BA00FFDCB900FFDCB800FFDBB700191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000455663FF112B45FF112B45FF112B
      45FF112B45FF112B45FF112B45FF000000000000000000000000000000004045
      4BFEA6AAAFFFF3F6F7FF52565CFF121212550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1A1A1FF505050FF505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF505050FF505050FF00000000000000008B8B8B00FFF4DF00FFF3DE00FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD1008B8B
      8B00E4EAEA00E9EDED00EDF1F100F2F5F500F6F8F800FAFBFB0019191900FFE3
      C400FFE2C200FFE1C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDEBC00FFDD
      BB00FFDDBA00FFDCB900FFDCB800191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000455663FF64A4DBFF5699D5FF488F
      CFFF3B86C9FF2F7CC3FF112B45FF000000000000000000000000010101132429
      31FFD8DBDFFFF3F6F7FF52565CFF212121620000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1A1A1FF709ABEFF6D97BCFF6995
      BAFF6692B9FF6390B7FF608EB6FF5D8CB5FF5A8AB4FF5889B2FF5687B1FF5486
      B0FF5284B0FF505050FF00000000000000008B8B8B00FFF5E100FFF4DF00FFF3
      DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD3008B8B
      8B00E0E6E600E4EAEA00E1E5E400006C0000F2F5F500F6F8F80019191900FFE4
      C500FFE3C400FFE2C200FFE1C100FFE0C000FFE0BF00FFDFBE00FFDEBD00FFDE
      BC00FFDDBB00FFDDBA00FFDCB900191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000455663FF78B3E4FF6AA8DEFF5C9E
      D7FF4E94D1FF418ACCFF112B45FF000000000000000000000000424242902C32
      3AFFF9FBFCFFCDD1D5FF282E36FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1A1A1FF779EC0FF739CBFFF6F99
      BDFF6C96BBFF6894BAFF6592B8FF6290B7FF5F8DB6FF5C8CB4FF5A8AB3FF5788
      B2FF5587B1FF505050FF00000000000000008B8B8B00FFF5E300FFF5E100FFF4
      DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD5008B8B
      8B00DCE3E300E0E6E60000A9000073DA7E00006C0000F2F5F50019191900FFE4
      C700FFE4C500FFE3C400FFE2C200FFE1C100FFE0C000FFE0BF00FFDFBE00FFDE
      BD00FFDEBC00FFDDBB00FFDDBA00191919000000000037373796505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF373737960000000037373796505050FF505050FF505050FF505050FF3737
      3796000000000000000000000000000000000000000037373796505050FF5050
      50FF505050FF505050FF37373796000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000425E5EFF0E292AFF0E292AFF455663FF8EC2EDFF7EB7E6FF70AD
      E0FF62A2DAFF5498D4FF112B45FF000000000000000000000000727579E4545A
      61FFFFFFFFFF959A9FFF505359FC000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF505050FF5050
      50FF505050FF505050FF505050FF505050FFA1A1A1FF7DA3C3FF79A0C2FF769D
      C0FF729BBEFF6E98BDFF6B96BBFF6793B9FF6491B8FF618FB7FF5E8DB5FF5B8B
      B4FF5989B3FF505050FF00000000000000008B8B8B00FFF6E400FFF5E300FFF5
      E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEED6008B8B
      8B00D8E0E000DCE3E30000A9000082DE8C0073DA7E00006C000019191900FFE5
      C900FFE4C700FFE4C500FFE3C400FFE2C200FFE1C100FFE0C000FFE0BF00FFDF
      BE00FFDEBD00FFDEBC00FFDDBB001919190000000000505050FFEBC8ABFFEBC7
      AAFFEAC4A8FFEAC3A6FFE9C2A5FFE9C1A3FFE9C0A1FFE8BFA0FFE8BE9FFFE8BE
      9EFF505050FF00000000505050FFEFD3BCFFEED1BAFFEED0B8FFEDCEB5FF5050
      50FF0000000000000000000000000000000037373796505050FFE9C2A5FFE9C1
      A3FFE9C0A2FFE8BFA0FF505050FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000425E5EFF63E3E6FF56E1E4FF455663FFA2D2F5FF94C8EFFF85BC
      E9FF76B1E3FF68A7DDFF112B45FF00000000000000000000000053575DFC989D
      A2FFFFFFFFFF5B6067FF717478E4000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF6ECFECFF6BCE
      ECFF67CDECFF64CCECFF61CBECFF5ECAECFFA1A1A1FF85A8C8FF81A5C5FF7CA2
      C3FF789FC1FF749DBFFF719ABEFF6D97BCFF6A95BBFF6693B9FF6390B8FF608E
      B6FF5D8CB5FF505050FF00000000000000008B8B8B00FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD8008B8B
      8B00D5DEDE00D8E0E00000A9000091E29A0082DE8C0073DA7E00006C0000FFE6
      CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2C200FFE1C100FFE0C000FFE0
      BF00FFDFBE00FFDEBD00FFDEBC001919190000000000505050FFECCAAFFFEBC9
      ADFFEBC8ABFFEAC5A9FFEAC4A8FFEAC3A6FFE9C2A4FFE9C1A3FFE9C0A1FFE8BF
      A0FF505050FF00000000505050FFF0D5BFFFEFD3BDFFEFD2BAFFEED0B8FF5050
      50FF00000000000000000000000000000000505050FFEAC5A9FFEAC4A7FFEAC3
      A5FFE9C2A4FFE9C0A2FF505050FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000425E5EFF76E7E9FF69E4E7FF455663FFB5E0FEFFA8D6F8FF9ACC
      F2FF8CC1ECFF7CB6E5FF112B45FF000000000000000000000000393F46FF2A30
      37FF666A70FF252C34FF4040418E000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A1FF74D0ECFF71CF
      ECFF6DCEECFF69CDECFF66CCECFF63CBECFFA1A1A1FF8CACCBFF88AAC9FF84A7
      C7FF80A4C4FF7BA1C2FF779EC1FF739CBFFF7099BDFF6C97BCFF6994BAFF6592
      B9FF6290B7FF505050FF00000000000000008B8B8B00FFF8E700FFF7E600FFF6
      E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D9008B8B
      8B00D3DCDC0000A90000AEEAB400A0E6A70091E29A0082DE8C0073DA7E00006C
      0000FFE6CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2C200FFE1C100FFE0
      C000FFE0BF00FFDFBE00FFDEBD001919190000000000505050FFEDCCB2FFECCB
      B0FFECCAAEFFEBC9ADFFEBC7ABFFEAC5A9FFEAC4A7FFEAC3A5FFE9C2A4FFE9C1
      A2FF505050FF00000000505050FFF0D7C2FFF0D5BFFFEFD4BDFFEFD2BBFF5050
      50FF00000000000000000000000037373796505050FFEBC8ABFFEBC5A9FFEAC4
      A8FFEAC3A6FFE9C2A4FF505050FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000605954FF3F36
      2FFF3F362FFF425E5EFF89EAECFF7BE8EAFF455663FF94B1C0FF617889FF5E75
      88FF5B7386FF7299B6FF112B45FF000000000000000016171750151B24FF2026
      2EFF151B23FF1F252DFF00000010000000000000000000000000A1A1A1FF5050
      50FF505050FF505050FF505050FF505050FF505050FFA1A1A1FF7BD2EDFF77D1
      EDFF73D0ECFF70CFECFF6CCEECFF68CDECFFA1A1A1FF93B1CEFF8FAECCFF8BAC
      CAFF87A9C8FF83A6C5FF7EA3C4FF7AA0C2FF769EC0FF729BBEFF6F98BDFF6B96
      BBFF6894BAFF505050FF00000000000000008B8B8B00FFF9E900FFF8E700FFF7
      E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB008B8B
      8B008B8B8B0000A90000BBEDC00000A9000000A9000000A9000082DE8C0073DA
      7E00006C0000FFE6CA00FFE5C900FFE4C700FFE4C500FFE3C400FFE2C200FFE1
      C100FFE0C000FFE0BF00FFDFBE001919190000000000505050FFEECFB6FFEDCD
      B4FFEDCCB2FFECCBB0FFECCAAEFFEBC8ACFFEBC7AAFFEAC5A9FFEAC4A7FFE9C3
      A5FF505050FF00000000505050FFF1D8C5FFF0D7C2FFF0D5C0FFEFD4BEFF5050
      50FF000000000000000000000000505050FFECCBB0FFECC9AEFFEBC8ACFFEBC7
      AAFFEAC4A8FFEAC3A6FF505050FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000605954FFEED0
      B8FFEDCDB4FF425E5EFF9CEDEFFF8FEBEDFF455663FF9EB8C0FF657B89FF6279
      89FF5F7688FF80A2BCFF112B45FF0000000000000000727476CB0B1119FF2228
      30FF1A2028FF51555BFE00000000000000000000000000000000A1A1A1FFF4D7
      BFFFF4D6BEFFF3D5BCFFF3D4BBFFF3D3B9FFF3D2B8FFA1A1A1FF83D4EDFF7ED3
      EDFF7AD2EDFF76D1ECFF72D0ECFF6ECFECFFA1A1A1FF9AB6D1FF96B3CFFF92B0
      CDFF8EAECBFF8AABCAFF86A8C8FF82A5C5FF7DA2C3FF79A0C1FF759DC0FF719A
      BEFF6E98BCFF505050FF00000000000000008B8B8B00FFFAEA00FFF9E900FFF8
      E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1
      DB0000A90000D1F3D40000A90000FFEDD500FDEBD30000A9000000A9000082DE
      8C0073DA7E00006C0000F9E4C800FFE5C900FFE4C700FFE4C500FFE3C400FFE2
      C200FFE1C100FFE0C000FFE0BF001919190000000000505050FFEED1BAFFEED0
      B8FFEDCFB6FFEDCDB4FF505050FF505050FF505050FF505050FF505050FF5050
      50FF3737379600000000505050FFF2DAC8FFF1D9C5FFF1D7C3FFF0D6C0FF5050
      50FF000000000000000037373796505050FFEDCDB3FFECCBB0FFECCAAEFFEBC8
      ACFFEBC7AAFFEAC5A8FF505050FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000605954FFF0D6
      C0FFEFD3BCFF425E5EFFADF1F2FFA1EEF0FF455663FFE8FFFFFFDEFDFFFFD3F5
      FFFFC7EDFFFFB9E3FFFF112B45FF000000000000000076787EF710161FFF2228
      30FF0F141DFF7C7F82F300000000000000000000000000000000A1A1A1FFF4D9
      C2FFF4D8C1FFF4D6BFFFF4D5BDFFF3D4BCFFF3D4BAFFA1A1A1FF89D6EDFF85D5
      EDFF81D4EDFF7CD3EDFF79D2EDFF75D0ECFFA1A1A1FFA1BBD4FF9DB8D2FF99B5
      D1FF95B2CFFF91B0CDFF8DADCBFF88AAC9FF84A7C7FF80A4C4FF7BA1C3FF789F
      C1FF749CBFFF505050FF00000000000000008B8B8B00FFFBEB00FFFAEA00FFF9
      E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3DE00FFF2
      DC0000A9000000A90000FEEED800FFEED600FFEDD500FFECD300FFEBD10000A9
      000082DE8C0073DA7E00006C0000FCE6CA00FFE5C900FFE4C700FFE4C500FFE3
      C400FFE2C200FFE1C100FFE0C0001919190000000000505050FFEFD4BEFFEFD2
      BBFFEED1B9FFEED0B7FF505050FF000000000000000000000000000000000000
      00000000000000000000505050FFF2DCCBFFF2DAC9FFF1D9C5FFF1D7C3FF5050
      50FF0000000037373796505050FFEED0B8FFEDCEB5FFEDCDB3FFECCBB1FFECCA
      AFFFEBC9ADFFEBC7ABFF505050FF000000000000000000000000000000000081
      C4FF005995FF005895FF00000000000000000000000000000000006AAEFF0056
      92FF005691FF425E5EFFA5D6D7FF668E8EFF455663FF455663FF455663FF4556
      63FF455663FF455663FF455663FF0000000000000000484D54FF1B2129FF2228
      30FF0A1119FF666768BA00000000000000000000000000000000A1A1A1FFF5DB
      C5FFF5DAC4FFF4D8C2FFF4D7C0FFF4D6BFFFF3D5BDFFA1A1A1FF90D8EEFF8CD7
      EDFF88D6EDFF84D5EDFF80D3EDFF7BD2EDFFA1A1A1FFA8C0D7FFA4BDD6FFA0BA
      D4FF9CB7D2FF98B4D0FF94B2CEFF8FAFCCFF8BACCAFF87A9C9FF83A6C7FF7EA3
      C4FF7AA1C2FF505050FF00000000000000008B8B8B00FFFCED00FFFBEB00FFFA
      EA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4DF00FFF3
      DE0000A90000FEF0DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FEEB
      D20000A9000000A9000073DA7E00006C0000FAE5CA00FFE5C900FFE4C700FFE4
      C500FFE3C400FFE2C200FFE1C1001919190000000000505050FFF0D6C1FFF0D5
      BFFFEFD4BDFFEFD2BBFF505050FF505050FF505050FF505050FF505050FF5050
      50FF3737379600000000505050FFF3DECDFFF2DCCBFFF2DBC9FFF1D9C7FF5050
      50FF00000000505050FFEFD3BDFFEFD2BAFFEED0B8FFEDCFB6FFEDCDB4FFECCC
      B1FFECCAAFFFEBC9ADFF505050FF00000000000000000000000000000000007D
      C1FF04DCFFFF00C4F4FF005894FF005995FF0572AFFF0081C1FF00B6F4FF00C5
      FFFF005691FF425E5EFFB1D8D9FF6B8F8FFF678E8EFF648D8EFF8DD2D3FF0E29
      2AFF000000000000000000000000000000000505052620262EFF222830FF2329
      31FF171E26FF0F0F0F4100000000000000000000000000000000A1A1A1FFF6DD
      CAFFF5DCC8FFF5DAC5FFF5D9C3FFF4D8C2FFF4D7C0FFA1A1A1FF97DAEEFF93D9
      EEFF8FD8EDFF8BD7EDFF87D5EDFF83D4EDFFA1A1A1FFAEC4DAFFABC2D9FFA7BF
      D7FFA3BCD5FF9FB9D3FF9BB6D1FF96B4CFFF92B1CEFF8EAECCFF8AABCAFF86A8
      C8FF82A5C5FF505050FF00000000000000008B8B8B00FFFDEE00FFFCED00FFFB
      EB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5E100FFF4
      DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFEC
      D300FFEBD200FFEAD00000A9000073DA7E00006C0000FAE5CB00FFE5C900FFE4
      C700FFE4C500FFE3C400FFE2C2001919190000000000505050FFF1D9C5FFF1D7
      C3FFF0D6C1FFF0D5BFFFEFD3BDFFEFD2BBFFEED0B9FFEECFB6FFEDCEB4FFEDCC
      B2FF505050FF00000000505050FFF3DFD0FFF3DECEFFF2DDCCFFF2DBC9FF5050
      50FF37373796505050FFF0D5BFFFEFD3BDFFEFD2BBFF505050FFEECFB6FFEDCD
      B4FFECCCB2FFECCAB0FF505050FF000000000000000000000000000000000577
      B5FF03D3FBFF04DEFFFF00D8FFFF00B7EEFF00B4EEFF00CEFFFF00CDFFFF00BE
      FBFF0063A2FF425E5EFFDBF9F9FFD2F7F8FFC8F5F6FFBCF3F4FFB1F1F2FF0E29
      2AFF00000000000000000000000000000000545555A40B121AFF222830FF1E24
      2CFF3D434AFF0000000000000000000000000000000000000000A1A1A1FFF6DF
      CDFFF6DECBFFF6DDC9FFF5DBC7FFF5DAC5FFF5D9C3FFA1A1A1FF9EDCEEFF9ADB
      EEFF96DAEEFF92D9EEFF8ED7EDFF8AD6EDFFA1A1A1FFB5CADDFFB1C7DCFFADC4
      DAFFA9C1D8FFA5BED6FFA1BBD4FF9DB8D3FF99B6D1FF95B3CFFF91B0CDFF8DAD
      CBFF89AAC9FF505050FF00000000000000008B8B8B00FFFEF000FFFDEE00FFFC
      ED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5E300FFF5
      E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEED600FFED
      D500FFECD300FFEBD100F3E7CC0000A9000073DA7E00006C0000FFE6CA00FFE5
      C900FFE4C700FFE4C500FFE3C4001919190000000000505050FFF2DBCAFFF1DA
      C8FFF1D9C5FFF1D7C3FFF0D6C1FFEFD4BEFFEFD3BCFFEED2BAFFEED0B8FFEECF
      B6FF505050FF00000000505050FFF4E1D2FFF4E0D0FFF3DECEFFF3DDCCFF5050
      50FF505050FFF1D8C4FFF0D7C2FFF0D5C0FFEFD4BDFF505050FFEED1B9FFEECF
      B7FFEDCEB4FFEDCCB2FF505050FF000000000000000000000000000000000B77
      B4FF03CAF4FF05DEFFFF01D8FFFF00D8FFFF00D5FFFF00CEFFFF00CDFFFF00B9
      F4FF0472B1FF425E5EFF425E5EFF425E5EFF425E5EFF425E5EFF425E5EFF425E
      5EFF00000000000000000000000000000000808386ED0A1018FF222830FF1219
      21FF6D7176FA0000000000000000000000000000000000000000A1A1A1FFF7E1
      D1FFF7E0CFFFF6DFCDFFF6DECBFFF5DCC9FFF5DBC7FFA1A1A1FFA5DEEEFFA1DD
      EEFF9DDCEEFF99DAEEFF95D9EEFF91D8EEFFA1A1A1FFBBCEE0FFB7CCDEFFB4C9
      DDFFB0C5DBFFACC3D9FFA8C0D8FFA4BDD6FFA0BAD4FF9CB8D2FF98B5D0FF94B2
      CEFF90AFCCFF505050FF00000000000000008B8B8B00FFFEF100FFFEF000FFFD
      EE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E600FFF6E400FFF5
      E300FFF5E100FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD100FFEAD00000A9000000A90000FFE7CC00FFE6
      CA00FFE5C900FFE4C700FFE4C5001919190000000000505050FFF3DECDFFF2DC
      CBFFF2DBC9FFF1DAC7FFF1D8C4FFF0D7C2FFF0D5C0FFEFD4BEFFEFD3BCFFEED1
      BAFF505050FF00000000505050FFF5E3D5FFF4E1D3FFF4E0D1FFF3DECFFF5050
      50FFF2DCCAFFF2DAC8FFF1D9C5FFF0D7C2FF505050FF505050FFEFD2BCFFEED1
      B9FFEECFB7FFEDCEB5FF505050FF000000000000000000000000000000002E84
      B7FF04BBE9FF12E5FFFF0ADBFFFF01D8FFFF00D4FFFF00D1FFFF00D3FFFF00AC
      E9FF267DB1FF918882FF918781FFD8CABEFF3F362FFF00000000000000000000
      000000000000000000000000000000000000555A60FE2A3038FF171D25FF0910
      17FF7C7E7FDA0000000000000000000000000000000000000000A1A1A1FFF8E4
      D4FFF7E2D2FFF7E1D0FFF6E0CEFFF6DFCCFFF6DDCAFFA1A1A1FFABE0EFFFA7DF
      EEFFA3DEEEFF9FDCEEFF9BDBEEFF97DAEEFFA1A1A1FFC0D2E3FFA1A1A1FF7878
      78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
      78FF97B4D0FF505050FF00000000000000008B8B8B00FFFFF200FFFEF100FFFE
      F000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E700FFF7E6008B8B
      8B0019191900191919001919190019191900191919001919190019191900FFEF
      D800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8CD00FFE7
      CC00FFE6CA00FFE5C900FFE4C7001919190000000000505050FFF4E0D1FFF3DF
      CFFFF3DDCDFFF2DCCBFFF2DBC9FFF1D9C7FFF1D8C4FFF0D7C2FFF0D5C0FFEFD4
      BEFF505050FF00000000505050FFF5E4D7FFF5E3D5FFF4E2D3FFF4E0D1FF5050
      50FFF3DDCDFFF2DCCBFFF2DAC8FF505050FF37373796505050FFEFD4BEFFEFD3
      BCFFEED1BAFFEED0B7FF505050FF000000000000000000000000000000000B7C
      B8FF26D7F5FF2AE9FFFF1DE0FFFF12DCFFFF05D7FFFF00D4FFFF00D4FFFF00BE
      F4FF005793FFFAF1EAFFF9EEE6FFF8ECE2FF3F362FFF00000000000000000000
      000000000000000000000000000000000000222830FFDDE0E3FFE2E5E8FF1A20
      29FF2D2E2E740000000000000000000000000000000000000000A1A1A1FFF8E6
      D8FFF8E5D6FFF7E3D4FFF7E2D2FFF7E1D0FFF6E0CEFFA1A1A1FFB1E1EFFFAEE0
      EFFFAADFEFFFA6DEEEFFA2DDEEFF9EDCEEFFA1A1A1FFC7D6E5FFA1A1A1FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF7878
      78FF9EB9D3FF505050FF00000000000000008B8B8B00FFFFF300FFFFF200FFFE
      F100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E900FFF8E7008B8B
      8B00E4EAEA00E9EDED00EDF1F100F2F5F500F6F8F800FAFBFB0019191900FFF0
      D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9CE00FFE8
      CD00FFE7CC00FFE6CA00FFE5C9001919190000000000505050FFF4E2D4FFF4E1
      D2FFF4E0D0FFF3DECFFF505050FF505050FF505050FF505050FF505050FF5050
      50FF3737379600000000505050FFF6E5D9FFF5E4D7FFF5E3D6FFF4E2D4FFF4E0
      D2FFF3DFCFFFF3DECDFFF2DCCBFF505050FF00000000505050FFF0D6C1FFF0D5
      BFFFEFD3BCFFEED2BAFF505050FF0000000000000000000000000A78B5FF3DDA
      F3FF54F4FFFF46EAFFFF39E7FFFF29E3FFFF18DCFFFF07D8FFFF00D4FFFF00D5
      FFFF00BBF1FF005793FF605954FF605954FF605954FF00000000000000000000
      00000000000000000000000000002828286D272D35FFF5F8FAFFD9DCE0FF272D
      34FF000000040000000000000000000000000000000000000000A1A1A1FFF9E8
      DBFFF8E7D9FFF8E6D7FFF8E4D5FFF7E3D3FFF7E2D1FFA1A1A1FFB7E3EFFFB4E2
      EFFFB0E1EFFFADE0EFFFA9DFEEFFA5DEEEFFA1A1A1FFCBD9E7FFA1A1A1FFCCD0
      D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FF7878
      78FFA5BED6FF505050FF00000000000000008B8B8B00FFFFF500FFFFF300FFFF
      F200FFFEF100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA00FFF9E9008B8B
      8B00E0E6E600E4EAEA00E1E5E400006C0000F2F5F500F6F8F80019191900FFF1
      DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEAD000FFE9
      CE00FFE8CD00FFE7CC00FFE6CA001919190000000000505050FFF5E4D7FFF5E3
      D6FFF4E2D4FFF4E1D2FF505050FF000000000000000000000000000000000000
      00000000000000000000505050FFF6E7DBFFF6E6DAFFF5E5D8FFF5E3D6FFF4E2
      D4FFF4E1D2FFF3DFD0FF505050FF3737379600000000505050FFF1D8C4FFF0D6
      C2FFF0D5BFFFEFD3BDFF505050FF00000000000000001080B9FF58DEF3FF80FF
      FFFF72F4FFFF66F1FFFF56EDFFFF43E9FFFF2EE3FFFF18DCFFFF07D8FFFF00D4
      FFFF00D8FFFF00BBF1FF005793FF000000000000000000000000000000000000
      0000000000000000000000000000717375D84E535AFFFFFFFFFFA2A6ABFF4449
      4FFE000000000000000000000000000000000000000000000000A1A1A1FFF9EB
      DFFFF9E9DDFFF9E8DBFFF8E7D9FFF8E5D7FFF8E4D5FFA1A1A1FFBDE5EFFFA1A1
      A1FF787878FF787878FF787878FF787878FFA1A1A1FFCFDCE9FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFABC2D9FF505050FF00000000000000008B8B8B00FFFFF600FFFFF500FFFF
      F300FFFFF200FFFEF100FFFEF000FFFDEE00FFFCED00FFFBEB00FFFAEA008B8B
      8B00DCE3E300E0E6E60000A9000082DE8C00006C0000F2F5F50019191900FFF2
      DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEBD100FFEA
      D000FFE9CE00FFE8CD00FFE7CC001919190000000000505050FFF6E6DAFFF6E5
      D9FFF5E4D7FFF5E3D5FF505050FF505050FF505050FF505050FF505050FF5050
      50FF3737379600000000505050FFF7E8DDFFF6E7DCFFF6E6DAFFF5E5D8FFF5E4
      D6FFF4E2D4FF505050FF373737960000000000000000505050FFF1DAC7FFF1D8
      C4FFF0D7C2FFF0D5C0FF505050FF00000000318ABDFF31B6DCFF82F1F9FF90F5
      FFFF9AFCFFFF92FCFFFF75F3FFFF5DEDFFFF44E9FFFF2BE3FFFF17E2FFFF04DA
      FFFF00D0FCFF00C7F8FF009BDAFF237EB4FF0000000000000000000000000000
      00000000000000000000000000005A5E63FA878C92FFFFFFFFFF676C73FF6D71
      75EE000000000000000000000000000000000000000000000000A1A1A1FFFAED
      E2FFFAEBE0FFF9EADEFFF9E9DCFFF9E8DBFFF8E6D9FFA1A1A1FFC2E6EFFFA1A1
      A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFA1A1A1FFD3DEEAFFD1DDEAFFCFDB
      E9FFCCDAE7FFCAD8E6FFC7D6E5FFC3D4E4FFC0D2E2FFBCCFE1FFB9CDDFFFB5CA
      DEFFB2C8DCFF505050FF00000000000000008B8B8B00FFFFF700FFFFF600FFFF
      F500FFFFF300FFFFF200FFFEF100FFFEF000FFFDEE00FFFCED00FFFBEB008B8B
      8B00D8E0E000DCE3E30000A900008DE196007FDD8900006C000019191900FFF3
      DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFECD300FFEB
      D100FFEAD000FFE9CE00FFE8CD001919190000000000505050FFF7E8DDFFF6E7
      DBFFF6E6DAFFF5E5D8FFF5E4D7FFF5E3D5FFF4E1D3FFF4E0D1FFF3DFCFFFF3DE
      CDFF505050FF00000000505050FFF7E9DFFFF7E8DDFFF6E7DCFFF6E6DAFFF5E5
      D8FFF5E4D7FF505050FF000000000000000000000000505050FFF2DBCAFFF2DA
      C8FFF1D9C5FFF0D7C2FF505050FF00000000000000004193C0FF2588BCFF1A87
      BCFF038BC4FF40B7DFFF92F7FFFF78F4FFFF59EEFFFF3CE7FFFF01A8DCFF007D
      C1FF0578B7FF167CB5FF3187B8FF0607072E1A2E3A860472B1FF101316540000
      000000000000000000000000000032373EFFC8CCCFFFFDFFFFFF363C44FF5859
      5AAD000000000000000000000000000000000000000000000000A1A1A1FFFBEF
      E5FFFAEEE4FFFAECE2FFFAEBE0FFF9EADEFFF9E9DCFFA1A1A1FFC7E8F0FFA1A1
      A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFA1A1A1FFD4DFEBFFD4DFEBFFD2DE
      EAFFD0DCE9FFCEDBE8FFCCD9E7FFC9D7E6FFC5D5E5FFC2D3E3FFBFD1E2FFBBCF
      E0FFB8CCDFFF505050FF00000000000000008B8B8B00FFFFF800FFFFF700FFFF
      F600FFFFF500FFFFF300FFFFF200FFFEF100FFFEF000FFFDEE00FFFCED008B8B
      8B00D5DEDE00D8E0E00000A9000099E4A1008AE093007BDC8600006C0000FFF4
      DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEED600FFEDD500FFEC
      D300FFEBD100FFEAD000FFE9CE001919190000000000505050FFF7E9DFFFF7E9
      DEFFF6E8DDFFF6E7DBFFF6E6DAFFF5E5D8FFF5E4D6FFF5E2D5FFF4E1D3FFF4E0
      D1FF505050FF00000000505050FFF7EAE0FFF7E9DFFFF7E8DEFFF6E7DCFFF6E6
      DBFF505050FF37373796000000000000000000000000505050FFF3DDCDFFF2DC
      CBFFF2DAC8FFF1D9C5FF505050FF000000000000000000000000000000000000
      000000000000197EB8FF6FD7EEFF96FCFFFF6FF7FFFF30CAEDFF005F9AFF0202
      0219008DCFFF00BCECFF006EABFD0076B9FD00A7E9FF0085D3FF161D226D0000
      0000000000000000000000000000050C14FFBDC1C5FFE5E8EBFF1F252DFF0707
      072D000000000000000000000000000000000000000000000000A1A1A1FFFBF1
      E8FFA1A1A1FF787878FF787878FF787878FF787878FFA1A1A1FFCBE9F0FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFD4DFEBFFD4DFEBFFD4DF
      EBFFD3DFEBFFD2DDEAFFD0DCE9FFCDDAE8FFCBD9E7FFC8D7E6FFC4D5E4FFC1D2
      E3FFBED0E1FF505050FF00000000000000008B8B8B00FFFFF900FFFFF800FFFF
      F700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFEF000FFFDEE008B8B
      8B00D3DCDC0000A90000B1EBB700A4E7AB0095E39E0087DF900078DB8300006C
      0000FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEED600FFED
      D500FFECD300FFEBD100FFEAD0001919190000000000505050FFF8EBE1FFF7EA
      E0FFF7E9DFFFF7E8DEFFF6E8DCFFF6E7DBFFF6E6D9FFF5E4D8FFF5E3D6FFF4E2
      D4FF505050FF00000000505050FFF8EBE2FFF7EAE1FFF7EADFFFF7E9DEFFF6E8
      DCFF505050FF00000000000000000000000000000000505050FFF3DFCFFFF3DE
      CDFFF2DCCBFFF2DBC9FF505050FF000000000000000000000000000000000000
      000000000000000000003395C2FFA1FEFFFF7AF8FFFF0071A8FF000000000101
      02180086C1FD00DCFFFF00D7FFFF00CBFFFF00CEFFFF0092DBFF161D22670000
      000000000000000000000000000065696DF9343941FF1B2129FF393E45FF0000
      0000000000000000000000000000000000000000000000000000A1A1A1FFFCF2
      EBFFA1A1A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFA1A1A1FFCFEAF0FFCDE9
      F0FFCBE8F0FFC8E8F0FFC5E7F0FFC2E6EFFFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FF00000000000000008B8B8B00FFFFFA00FFFFF900FFFF
      F800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFEF0008B8B
      8B008B8B8B0000A90000BBEDC00000A9000000A9000000A9000084DE8D0075DA
      8000006C0000FFF4DF00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEFD800FFEE
      D600FFEDD500FFECD300FFEBD1001919190000000000505050FFF8ECE3FFF8EB
      E2FFF8EBE1FFF7EAE0FFF7E9DFFFF7E8DDFFF6E7DCFFF6E6DBFFF6E5D9FFF5E4
      D7FF505050FF00000000505050FFF8ECE3FFF8EBE2FFF7EBE1FFF7EAE0FF5050
      50FF3737379600000000000000000000000000000000505050FFF4E1D2FFF3DF
      D0FFF3DECEFFF2DCCBFF505050FF000000000000000000000000000000000000
      000000000000000000002185BAFF75E2F4FF63DEF4FF1C81B8FF000000000000
      000F0087BFFD00DEFEFF00D8FFFF00D0FFFF00D0FFFF008BD1FF15191C610000
      0000000000000000000000000000000000000000000008080830434444900000
      0000000000000000000000000000000000000000000000000000A1A1A1FFFCF4
      EDFFA1A1A1FFCCD0D6FFCCD0D6FFCCD0D6FFCCD0D6FFA1A1A1FFD0EAF0FFD0EA
      F0FFCEE9F0FFCCE9F0FFCAE8F0FFC8E8F0FFC4E7F0FFC1E6EFFFBEE5EFFFBBE4
      EFFFB8E3EFFFB4E2EFFF505050FF000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00FFFFFB00FFFFFA00FFFF
      F900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFEF100FFFE
      F00000A90000CEF2D20000A90000FFFAEA00FDF8E80000A9000000A9000080DE
      8A0072DA7D00006C0000F9F0DC00FFF3DE00FFF2DC00FFF1DB00FFF0D900FFEF
      D800FFEED600FFEDD500FFECD300191919000000000037373796505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF5050
      50FF373737960000000037373796505050FF505050FF505050FF505050FF3737
      3796000000000000000000000000000000000000000037373796505050FF5050
      50FF505050FF505050FF37373796000000000000000000000000000000000000
      00000000000000000000000000003298C5FF3097C3FF00000000000000063395
      C2FF1FD4EEFF2CECFFFF12E1FFFF00D7FFFF00D1FFFF00C3F7FF006492E2070B
      0E45005E94E3005588ED002743A700669EE9004C82EA00010228000000000000
      0000000000000000000000000000000000000000000000000000A1A1A1FFFDF5
      F0FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFD0EAF0FFD0EA
      F0FFD0EAF0FFCFEAF0FFCEE9F0FFCCE9F0FFC9E8F0FFC7E7F0FFC3E7F0FFC0E6
      EFFFBDE5EFFFBAE4EFFF505050FF000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00FFFFFC00FFFFFB00FFFF
      FA00FFFFF900FFFFF800FFFFF700FFFFF600FFFFF500FFFFF300FFFFF200FFFE
      F10000A9000000A90000FEFBED00FFFBEB00FFFAEA00FFF9E900FFF8E70000A9
      00007DDD87006FD97A00006C0000FCF2DE00FFF3DE00FFF2DC00FFF1DB00FFF0
      D900FFEFD800FFEED600FFEDD500191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005F9FC4FF5E9EC4FF000000003395C2FF24C3
      E3FF74FCFFFF6CF8FFFF46EDFFFF1AE2FFFF00DDFFFF00D1FFFF00B4F3FF0062
      9DF00078BDFF00C1E8FF00B0DDFF02C1F1FF086E9AE400020327000000000000
      0000000000000000000000000000000000000000000000000000A1A1A1FFFDF7
      F1FFFDF6F0FFFDF5EFFFFCF4EEFFFCF4EDFFFCF3EBFFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FF000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8CF
      B60000A90000D8D0B800D8CFB600D8CFB600D8CFB600D8CFB600D8CFB600D8D0
      B80000A9000000A900006BD87700006C0000D7D0B800D8CFB600D8CFB600D8CF
      B600D8CFB600D8CFB600D8CFB600191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191F23651A87
      BCFF1A87BCFF038BC4FF74F5FEFF47F4FFFF00AEDFFF0578B7FF0578B7FF2344
      56A70078BDFF1AE7FFFF06EAFFFF00D7FFFF096F9CE900020429000000000000
      0000000000000000000000000000000000000000000000000000A1A1A1FFFDF7
      F2FFFDF7F2FFFDF6F1FFFDF6F0FFFCF5EFFFFCF4EEFFFCF3EDFFFCF3EBFFFBF2
      EAFFFBF1E8FFFBEFE6FFFBEEE5FF505050FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B0000A9000068D77400006C00008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B00191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000151B206355CDE5FF50E9F5FF237EB4FF00000001000000003395
      C2FF40D6EFFF6FFBFFFF34E6FFFF0CE3FFFF00BAE6FF0075B4FF000000000000
      0000000000000000000000000000000000000000000000000000A1A1A1FFFDF7
      F2FFFDF7F2FFFDF7F2FFFDF7F2FFFDF6F1FFFDF6F0FFFCF5EFFFFCF4EEFFFCF3
      ECFFFCF2EBFFFBF1E9FFFBF0E8FF505050FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00D8DDD70000A9000065D67100006C0000DEDEDE00DEDE
      DE008B8B8B00DEDEDE00DEDEDE00191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000E3395C2FF28AACEF90E11124A00000000000000003395
      C2FF3395C2FF56BAD3F573F7FFFF16B4DEFF0394CEFF0C4665BD000000000000
      0000000000000000000000000000000000000000000000000000A1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1
      A1FFA1A1A1FFA1A1A1FFA1A1A1FFA1A1A1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA00EAE9
      EA00EAE9EA00EAE9EA00EAE9EA00EAE9EA0000A9000000A90000EAE9EA00DEDE
      DE008B8B8B00EAE9EA00EAE9EA00191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000021292E765E9EC4FF0000000000000000000000000000
      00120001021B3395C2FF42C2E0FF5E9EC4FF0001021C00000012000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600EAE9
      EA008B8B8B00F5F5F600F5F5F600191919000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000060D114D2185BAFF081116570000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B8B008B8B
      8B008B8B8B008B8B8B008B8B8B008B8B8B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000003000000110000002700000035000000380000
      0035000000270000001100000003000000000000000000000000000000000000
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
      00000000000000000000000000080000002700000054000000730000007B0000
      0073000000540000002700000008000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D91B3FF4371
      9EFF43719EFF43719EFF43719EFF43719EFF43719EFF35587AFF35587AFF3558
      7AFF35587AFF35587AFF35587AFF35587AFF35587AFF35587AFF35587AFF3558
      7AFF35587AFF35587AFF35587AFF35587AFF35587AFF35587AFF35587AFF3558
      7AFF35587AFF35587AFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A0A0A362C2C2CE11D1E1EEA1E1E
      1EE71E1E1EE71C1D1DE71C1D1DE71C1D1DE71C1D1DE71C1C1DE71C1D1DE71D1D
      1DE71D1D1EE71C1C1CE9262626E81111114A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B4D9D59FF4D9D59FF4D9D59FF4D9D59FF4D9D
      59FF00000073000000350000000B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D91B3FF425A
      71CC3F5770CC3D566DCC3A536DCC38526BCC364F69CC334E69CC314C68CC2F4B
      66CC2C4965CC2B4864CC294662CC274662CC264562CC264461CC264461CC2644
      61CC264461CC264461CC2B4E70DB3B6B99FF3B6B99FF3B6B99FF3B6B99FF3B6B
      99FF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E4E4EB1313030FF323232FF3635
      36FF363433FF363432FF383535FF383531FF363431FF363532FF353332FF3330
      2EFF2F2E2CFF2C292CFF2E2A2AFF5C5C5CC30000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B4D9D59FF87D490FF82D28AFF7BD085FF4D9D
      59FF0000007B000000380000000B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D91B3FF6D91
      B3FFB8D7E7FF92BCD4FF92BCD4FF92BCD4FF92BCD4FF6AA1BFFF6AA1BFFF6AA1
      BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1
      BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1BFFF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000707071FD605B5AFF87807BFF7D76
      70FF8D8586FF867C7DFF7E7874FF7A7470FF78726EFF726C69FF67605CFF8077
      78FF807777FF78706BFF5F5751FF737273FC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      00080000000B0000000B000000164D9D59FF8DD795FF87D490FF82D28AFF4D9D
      59FF00000080000000430000001A0000000F0000000F0000000C000000070000
      0004000000040000000400000004000000040000000400000004000000040000
      0004000000040000000400000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D91B3FF7194
      B5FFCEE9F5FFCDE9F4FFCCE8F4FFCBE8F4FFCAE7F4FFC9E7F3FFC8E6F3FFC7E6
      F3FFC5E5F3FFC4E5F2FFBADAE9FFA8CBDDFFC2E4F2FFC2E4F2FFC2E4F2FFC2E4
      F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FD66615FFF8C8884FF7A75
      71FF989391FF888080FF7E7876FF7B7571FF7A736FFF736D6AFF5F5A55FF8983
      80FF817777FF76706EFF5E5855FF636363FC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000003000000110000
      00270000003500000038000000404D9D59FF93D99AFF8DD795FF87D490FF4D9D
      59FF0000009B0000007400000059000000530000005000000044000000310000
      0025000000220000002200000022000000220000002200000022000000220000
      0022000000220000002200000006000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D91B3FF7698
      B8FFD0EAF5FFCFE9F5FFCDE9F4FFCCE8F4FFCBE8F4FFCAE7F4FFC9E7F3FFC8E6
      F3FFC7E6F3FFC5E5F3FFBADBE9FF9DC3D9FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4
      F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6CFF757171FF96918EFF7E78
      74FF6E6965FF726D68FF797471FF7C7673FF7D7774FF77716EFF68625DFF5E59
      55FF67605BFF706A66FF635A54FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000008000000270000
      0054000000730000007B0000007E4D9D59FF98DBA0FF93D99AFF8DD795FF4D9D
      59FF1E1E1EFF252525FF2A2A2AFF2B2B2BFF2D2D2DFF383838FF474747FF5151
      51FF545454FF545454FF545454FF545454FF545454FF545454FF545454FF5454
      54FF545454FF545454FF00000009000000000000000037373796505050FF5050
      50FF505050FF505050FF37373796000000000000000037373796505050FF5050
      50FF505050FF505050FF505050FF373737960000000000000000000000000000
      00000000000037373796505050FF505050FF505050FF505050FF505050FF3737
      37960000000000000000000000000000000000000000000000006D91B3FF7A9B
      BAFFD1EBF5FFD0EAF5FFCFE9F5FFCEE9F4FFCCE8F4FFCBE8F4FFCAE7F4FFC9E7
      F3FFC8E6F3FFC7E6F3FFBBDBE9FFA8CBDDFFC3E5F2FFC3E5F2FFC2E4F2FFC2E4
      F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FFC2E4F2FF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000727272FF7B7877FF979291FF8781
      80FF7B7876FF7D7978FF837D7BFF817B7AFF847D7AFF7E7976FF716C68FF6A66
      64FF6B6663FF6D6764FF554D4BFF656565FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000B74B47DFF4D9D
      59FF4D9D59FF4D9D59FF4D9D59FF4D9D59FF9EDDA5FF98DBA0FF93D99AFF4D9D
      59FF4D9D59FF4D9D59FF4D9D59FF4D9D59FF4D9D59FF797A7BFFB1B2B3FFD6D7
      D9FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1E3FFE0E1
      E3FFE0E1E3FF545454FF000000090000000000000000505050FFECB68DFFEBB3
      89FFEAB186FFE9AF82FF505050FF0000000000000000505050FFE5A471FFE4A2
      6EFFE4A06BFFE39F69FFE39D67FF505050FF0000000000000000000000003737
      3796505050FF505050FFE8AC7EFFE7AA7AFFE7A877FFE6A674FFE5A471FF5050
      50FF505050FF37373796000000000000000000000000000000006D91B3FF809F
      BDFFD3EBF6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFFC8E6F3FFBCDBE9FF9DC3D9FFC4E5F3FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFC2E4F2FFC2E4F2FFC2E4F2FF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000707070FF4B4848FF5E595BFF645F
      60FF615B5CFF686363FF7D7476FF706567FF676062FF4F484AFF3A3333FF352E
      2DFF312929FF2D2526FF241E1FFF656565FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000B74B47DFFC0EA
      C4FFBBE8BFFFB5E6BAFFB0E3B5FFAAE1B0FFA4DFAAFF9EDDA5FF98DBA0FF93D9
      9AFF8DD795FF87D490FF82D28AFF7BD085FF4D9D59FF787879FFB6B7B8FFDFE0
      E2FFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFEDB992FFECB7
      8EFFEBB48BFFEAB287FF505050FF0000000037373796505050FFE6A775FFE5A5
      72FFE5A36FFFE4A16CFF505050FF373737960000000000000000373737965050
      50FFEBB58BFFEAB287FFE9B084FFE8AD80FFE8AB7BFFE7A978FFE6A675FFE5A4
      72FFE5A26FFF505050FF373737960000000000000000000000006D91B3FF85A2
      BFFFD5ECF6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFFBCDBEAFFA8CBDDFFC5E6F3FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFC2E4F2FFC2E4F2FF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000686868FF565252FFC0BDBDFF9F9C
      9DFF9E9B9CFFA3A1A1FFAAA6A8FFA6A4A4FFA4A2A3FFA09D9EFF9B999AFF9C99
      9AFF9A9798FFBDBABBFF615C5DFF656565FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000B74B47DFFC5EC
      CAFFC0EAC4FFBBE8BFFFB5E6BAFFB0E3B5FFAAE1B0FFA4DFAAFF9EDDA5FF98DB
      A0FF93D99AFF8DD795FF87D490FF82D28AFF4D9D59FF644D52FF877074FF9F88
      8DFFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFEEBD98FFEDBA
      94FFECB890FFEBB58CFF505050FF37373796505050FFE8AC7DFFE7A979FFE6A7
      76FFE6A573FF505050FF37373796000000000000000000000000505050FFEDBA
      94FFECB890FFEBB58CFFEAB388FFEAB085FFE9AE81FFE8AC7CFFE7A979FFE6A7
      76FFE6A573FFE5A370FF505050FF0000000000000000000000006D91B3FF89A6
      C1FFD6EDF6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFFBDDCEAFF9DC3D9FFC8E6F3FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFC2E4F2FFC2E4F2FF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF7B7879FF868483FF1311
      10FF1B1918FF1A1818FF1A1717FF1A1818FF1A1919FF1B1916FF191818FF1B1A
      1AFF171616FF606060FF8C8A8AFF656565FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000874B47DFFCBED
      CFFFC5ECCAFFC0EAC4FFBBE8BFFFB5E6BAFFB0E3B5FFAAE1B0FFA4DFAAFF9EDD
      A5FF98DBA0FF93D99AFF8DD795FF87D490FF4D9D59FF3A3A3AFF4A4B4BFF5556
      56FF585959FF6C6C6EFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFEFC09DFFEFBE
      99FFEEBB95FFEDB991FF505050FF505050FFEAB186FFE9AF83FFE8AD7EFFE7AA
      7BFFE7A877FF505050FF00000000000000000000000037373796505050FFEEBE
      99FFEEBB95FFEDB991FFECB68DFFEBB389FFEAB186FFE9AF82FFE8AC7DFFE7AA
      7AFFE7A877FFE6A674FF505050FF3737379600000000000000006D91B3FF8EA9
      C4FFD8EDF7FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFFCDE9F4FFCCE8F4FFBDDCEAFFA8CBDDFFC9E7F3FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFC2E4F2FF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF7B7878FFE9E6E6FFEEED
      EDFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFF4F2
      F2FFE9E8E8FFE1DFDFFF878384FF656565FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000374B47DFF74B4
      7DFF74B47DFF74B47DFF74B47DFF74B47DFFB5E6BAFFB0E3B5FFAAE1B0FF4D9D
      59FF4D9D59FF4D9D59FF4D9D59FF4D9D59FF4D9D59FF69534EFF715C54FF7761
      59FF79635BFF746059FF4D363AFFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFF1C4A2FFF0C2
      9FFFEFBF9BFFEEBC97FF505050FFECB78FFFEBB58BFFEAB288FFE9B084FFE9AD
      80FF505050FF37373796000000000000000000000000505050FFF1C4A2FFF0C1
      9EFFEFBF9AFFEEBC96FFEDB992FF505050FF505050FF505050FFE9AF83FFE8AD
      7EFFE8AB7BFFE7A878FFE6A674FF505050FF00000000000000006D91B3FF92AC
      C7FFECF3F6FFD8EDF7FFD7EDF6FFD5ECF6FFD4ECF6FFD3EBF6FFD2EBF5FFD0EA
      F5FFCFE9F5FFCEE9F4FFBDDCEAFF9DC3D9FFCAE7F4FFC9E7F3FFC8E6F3FFC7E6
      F3FFC5E6F3FFC4E5F3FFC3E5F2FFC3E5F2FFC2E4F2FFC2E4F2FFC2E4F2FF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF807A7AFFEDEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFF4F4F4FFE7E6E7FF918C8CFF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      00080000000B0000000B0000001674B47DFFBBE8BFFFB5E6BAFFB0E3B5FF4D9D
      59FF757576FFAFB0B1FF535353FF9DA28FFFA0A38FFF898C7AFF858775FF8A8C
      7AFF868876FF9B9E8BFFAAAE99FF5E5F5DFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFF2C9A8FFF1C5
      A4FFF0C2A0FFEFC09CFF505050FFEDBB94FFECB890FFECB68DFFEBB389FF5050
      50FF3737379600000000000000000000000000000000505050FFF2C8A7FFF1C5
      A3FFF0C29FFFEFBF9BFF505050FF373737960000000037373796505050FFE9B0
      84FFE9AE80FFE8AB7CFFE7A979FF505050FF00000000000000006D91B3FF96AF
      C9FFECF3F6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFFBDDCEAFFA8CBDDFFCCE8F4FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFC2E4F2FFC2E4F2FF6AA1
      BFFF3B6B99FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF807A7AFFFAF9F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FF948E8FFF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B74B47DFFC0EAC4FFBBE8BFFFB5E6BAFF4D9D
      59FF60484DFF412A2FFF756059FF7E6960FF816B63FF735D56FF67514BFF6A54
      4EFF66504AFF725D55FF826D63FF7B665EFF4D363BFFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFF3CCADFFF2CA
      A9FFF1C7A5FFF1C3A2FFF0C19EFFEFBE9AFFEEBC96FFEDB992FFECB78EFF5050
      50FF505050FF37373796000000000000000000000000505050FFF3CCACFFF2C9
      A8FFF1C5A4FFF0C3A0FF505050FF000000000000000000000000505050FFEBB3
      89FFEAB185FFE9AE81FFE8AC7DFF505050FF00000000000000006D91B3FF9AB2
      CBFFECF3F6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFFBDDCEAFF9DC3D9FFCDE9F4FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFC2E4F2FF6AA1
      BFFF3C6B9AFF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF827B7CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FDFFFFFFFFFFFFFFFFFF8F8B8BFF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B74B47DFFC5ECCAFFC0EAC4FFBBE8BFFF4D9D
      59FF404041FF6D7065FFA5A894FFACAE9AFFB0B59EFF999D89FF848675FF8687
      76FF828673FF9A9D8AFFAEB19DFFABAE9AFF696A65FFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFF5D0B2FFF4CD
      AFFFF3CBABFFF2C8A7FFF1C4A3FFF0C29FFFEFBF9BFFEEBD97FFEDBA93FFECB8
      90FFEBB58CFF505050FF373737960000000000000000505050FFF4CFB1FFF3CC
      ADFFF2CAA9FFF1C7A6FF505050FF000000000000000000000000505050FFECB6
      8EFFEBB48AFFEAB186FFE9AF82FF505050FF00000000000000006D91B3FF9EB5
      CDFFECF3F6FFDDEFF8FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFFD2EBF5FFBDDCEAFFA8CBDDFFCFE9F5FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFC4E5F3FFC3E5F2FF6AA1
      BFFF3E6D9BFF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF848181FFFBF9F8FFCDCC
      CCFFEAE9E9FFEAE9E9FFD4D1D2FFCCCACBFFCBC9C9FFCCCACBFFCCCACBFFDDDA
      DAFFFFFFFFFFFFFFFFFF888485FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000874B47DFFCBEDCFFFC5ECCAFFC0EAC4FF4D9D
      59FF424344FF6A554FFF7B665EFF816962FF79635BFF6A544DFF664F49FF715C
      54FF77625AFF7D685FFF7E6860FF7D6960FF7B655EFF4F373CFFA58E94FFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFF6D3B7FFF5D1
      B4FFF4CEB0FFF3CCACFFF2C9A8FFF1C5A5FFF0C3A1FFEFC09DFFEEBE99FFEDBB
      95FFEDB991FFECB68DFF505050FF3737379600000000505050FFF5D2B6FFF5D0
      B2FFF4CDAEFFF3CBABFF505050FF000000000000000000000000505050FFEDBA
      93FFECB78FFFEBB58BFFEAB287FF505050FF00000000000000006D91B3FFA2B8
      CFFFECF3F6FF89B8CDFFDDF0F8FFDCEFF8FFDAEFF7FFD9EEF7FFD8EDF7FFD7ED
      F6FFD5ECF6FFD4ECF6FFC3DEEBFF9DC3D9FFD0EAF5FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFC5E6F3FFC4E5F3FF6AA1
      BFFF406F9CFF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF83807EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF817C7DFF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000374B47DFF74B47DFF74B47DFF74B47DFF74B4
      7DFF4F5051FF999D8BFFAFB49EFFB7BCA5FF999D89FF858776FF818272FFB3B8
      A1FFACB09AFFABAF9AFFAAAC99FFACB09AFFA8AC98FF5B5B5CFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFF7D6BCFFF6D4
      B9FFF5D2B5FFF4CFB2FF505050FF505050FF505050FF505050FFF0C19EFFEFBF
      9AFFEEBC96FFEDBA93FFECB78FFF505050FF00000000505050FFF7D5BBFFF6D3
      B7FFF5D0B3FFF4CEB0FF505050FF000000000000000000000000505050FFEEBD
      98FFEDBA94FFECB890FFEBB58CFF505050FF00000000000000006D91B3FFA5BB
      D1FFECF3F6FFE0F1F8FFDEF0F8FFDDF0F8FFDCEFF8FFDBEFF7FFD9EEF7FFD8EE
      F7FFD7EDF6FFD6ECF6FFCDE5F1FFA8CBDDFFD2EBF5FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFFCAE7F4FFC9E7F3FFC8E6F3FFC7E6F3FFC5E6F3FF6AA1
      BFFF43719EFF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FF7D7877FFFFFFFFFFCECC
      CDFFCDCBCCFFD5D3D4FFFFFFFFFFFFFFFFFFCBC9CAFFCDCBCBFFCDCBCCFFCDCB
      CCFFFFFFFFFFFFFFFFFF797575FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000064E4E4EFFE9E9E9FFD5D6D8FF9982
      87FF4C353AFF745F57FF5F4844FF604944FF624C46FF644E48FF5F4844FF816B
      62FF7D6860FF7D6860FF7E6960FF79635BFF7A655DFF4E363BFFA58E94FFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFF8DAC1FFF7D7
      BEFFF6D5BAFFF6D3B7FF505050FF000000000000000037373796505050FFF0C2
      A0FFEFC09CFFEEBD98FFEDBB94FF505050FF00000000505050FFF8D8BFFFF7D6
      BCFFF6D4B8FFF5D1B5FF505050FF000000000000000000000000505050FFEFC0
      9DFFEEBE99FFEEBB95FFEDB991FF505050FF00000000000000006D91B3FFA8BD
      D3FFECF3F6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFFD7EDF7FFCDE5F1FFA3C8DBFFD3EBF6FFD2EBF5FFD1EAF5FFCFEA
      F5FFCEE9F5FFCDE9F4FFCCE8F4FFCAE8F4FFC9E7F3FFC8E7F3FFC7E6F3FF6AA1
      BFFF46739FFF35587AFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6B6BFF837E7EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFFFFEFDFFFFFFFFFFFDFB
      FAFFFFFFFFFFFFFFFFFF767272FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFEAEB
      EDFF6A6B6CFF78625CFF8B8C7AFF888978FF898B79FF898B79FF808271FFB0B3
      9EFFAFB39EFFAEB29CFFA6A894FF9EA08DFFA5AA96FF606061FFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFF9DDC7FFF8DA
      C2FFF8D8BFFFF7D6BCFF505050FF000000000000000000000000505050FFF1C7
      A5FFF0C3A1FFF0C19DFFEFBE99FF505050FF00000000505050FFF9DBC4FFF8D9
      C0FFF7D7BDFFF6D4B9FF505050FF000000000000000000000000505050FFF1C4
      A2FFF0C19EFFEFBF9AFFEEBC96FF505050FF00000000000000006D91B3FFABBF
      D4FFECF3F6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFFCDE5F1FFA8CBDDFFD5ECF6FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFCBE8F4FFCAE7F4FFC9E7F3FF6AA1
      BFFF4976A1FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171FF8C8989FFFFFFFFFFCDCC
      CCFFEAE9EAFFEAE9EAFFDDDADAFFCCCACBFFCCCACAFFD5D1D2FFEAE9EAFFCDCB
      CBFFFFFFFFFFFFFFFFFF757271FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFA58E
      94FF634B50FF634C4DFF755F58FF644E48FF67514BFF69534DFF66504BFF6E58
      51FF6F5B53FF6B564FFF705C54FF77615AFF533D3EFFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFFADFCBFFF9DD
      C8FFF9DBC4FFF8D9C0FF505050FF000000000000000037373796505050FFF3CA
      AAFFF2C8A7FFF1C4A3FFF0C29FFF505050FF00000000505050FFFADEC9FFF9DC
      C5FFF8DAC1FFF7D7BEFF505050FF000000000000000000000000505050FFF2C8
      A7FFF1C5A3FFF0C29FFFEFBF9BFF505050FF00000000000000006D91B3FFAEC1
      D5FFECF3F6FF89B8CDFF89B8CDFFE1F1F9FFE0F1F9FFDFF1F8FFDEF0F8FFDDF0
      F8FFDCEFF7FFDAEEF7FFCDE5F1FFA3C8DBFFD6EDF6FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFCAE7F4FF6AA1
      BFFF4D78A3FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000787878FF9B9797FFFEFEFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFEFFFDFD
      FEFFFFFFFFFFFFFFFFFF767171FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFF646466FFA0A492FFA8AC97FF888A79FF888A78FF888A78FF8687
      76FF999C89FFB5B9A3FFAEB39EFFA4A995FF5D5D5EFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFFBE2CFFFFAE0
      CCFFFADEC9FFF9DCC5FF505050FF505050FF505050FF505050FFF5D0B4FFF4CE
      B0FFF3CBACFFF2C9A8FFF1C5A4FF505050FF00000000505050FFFBE1CDFFFADF
      CAFFF9DDC7FFF8DAC2FF505050FF000000000000000000000000505050FFF3CC
      ACFFF2C9A8FFF1C5A4FFF0C3A0FF505050FF00000000000000006D91B3FFB1C3
      D7FFECF3F6FFE4F3F9FFE3F2F9FFE3F2F9FFE2F2F9FFE0F1F9FFDFF1F8FFDEF0
      F8FFDDF0F8FFDCEFF8FFCDE5F1FFA8CBDDFFD8EDF7FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFCCE8F4FFCBE8F4FF6AA1
      BFFF507BA5FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000787878FF9B9898FFFFFFFFFFCBC4
      C5FFC9C2C3FFE8E6E6FFCCC5C7FFEAE7E7FFEAE7E7FFDCD8D8FFC9C3C3FFC9C3
      C3FFFFFEFEFFFFFFFFFF767271FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFA58E
      94FFA58E94FFA58E94FF51393EFF75605AFF756057FF6C5650FF69534DFF888A
      78FF6B564FFF77635AFF79635CFF4F383DFFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFFCE4D3FFFBE3
      D0FFFBE1CDFFFADFCAFFF9DDC7FFF9DBC3FFF8D8C0FFF7D6BCFFF6D4B9FFF5D1
      B5FFF4CFB1FFF3CCADFFF2CAAAFF505050FF00000000505050FFFBE3D0FFFBE1
      CEFFFADFCBFFF9DDC8FF505050FF000000000000000000000000505050FFF4CF
      B1FFF3CCADFFF2CAA9FFF1C7A6FF505050FF00000000000000006D91B3FFB3C5
      D8FFECF3F6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFFDDF0F8FFCDE5F1FFA5C9DCFFDAEEF7FFD8EEF7FFD7EDF6FFD6EC
      F6FFD4ECF6FFD3EBF6FFD2EBF5FFD0EAF5FFCFEAF5FFCEE9F4FFCDE8F4FF92BC
      D4FF547EA7FF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000747474FF979393FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF767271FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFF666668FF777976FF9BA08EFFA9AD98FFA9AD
      98FFA0A391FF82857BFF606061FFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFFDE7D6FFFCE5
      D3FFFCE3D1FFFBE2CEFFFAE0CBFFFADEC8FFF9DCC4FFF8D9C1FFF7D7BEFFF6D5
      BAFFF5D2B6FFF5D0B3FF505050FF3737379600000000505050FFFCE5D4FFFCE3
      D1FFFBE2CFFFFAE0CCFF505050FF000000000000000000000000505050FFF5D2
      B6FFF5D0B2FFF4CDAEFFF3CBABFF505050FF00000000000000006D91B3FFB3C5
      D8FFECF3F6FF89B8CDFF89B8CDFF89B8CDFFE4F3F9FFE3F2F9FFE2F2F9FFE1F1
      F9FFE0F1F8FFDFF0F8FFCDE5F1FFA8CBDDFFDBEFF7FF89B8CDFF89B8CDFF89B8
      CDFFD6EDF6FFD5ECF6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFFCEE9F5FF92BC
      D4FF5882A9FF35587AFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6F6FFF8F8B8BFFFFFFFFFFFFFF
      FFFFFDFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFEFFFCFEFEFFFCFE
      FFFFFDFEFFFFFFFFFFFF767272FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FF644C51FF5A4348FF523A40FF5039
      3EFF584046FF634B50FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFFDE8D9FFFDE7
      D7FFFCE6D4FFFCE4D2FFFBE2CFFFFBE0CDFFFADECAFFF9DCC5FFF8DAC2FFF8D8
      BFFFF7D6BBFF505050FF373737960000000000000000505050FFFDE7D7FFFCE6
      D4FFFCE4D2FFFBE2CFFF505050FF000000000000000000000000505050FFF7D5
      BBFFF6D3B7FFF5D0B3FFF4CEB0FF505050FF00000000000000006D91B3FFB3C5
      D8FFECF3F6FF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFE3F2F9FFE2F2
      F9FFE1F1F9FFE0F1F8FFCDE5F1FFA5C9DCFFDDEFF8FF89B8CDFF89B8CDFF89B8
      CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFF89B8CDFFD0EAF5FF92BC
      D4FF5D85ABFF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000707070FF8C8989FFF3E9E2FFFDF7
      F4FFF9EEEBFFF6EAE8FFF6EAE8FFF9EDEBFFF5E8E5FFF5E9E6FFF4E8E5FFDDC3
      BDFFDFC5C0FFFEF5F3FF777271FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF000000090000000000000000505050FFFEEADBFFFEE9
      D9FFFDE8D7FFFDE6D5FFFCE5D3FFFBE3D0FFFBE1CEFFFADFCBFFF9DDC8FF5050
      50FF505050FF37373796000000000000000000000000505050FFFEE9D9FFFDE8
      D7FFFDE6D5FFFCE4D3FF505050FF000000000000000000000000505050FFF8D8
      BFFFF7D6BCFFF6D4B8FFF5D1B5FF505050FF00000000000000006D91B3FFB3C5
      D8FFECF3F6FFE7F4FAFFE7F4FAFFE6F4FAFFE6F3FAFFE5F3FAFFE4F3F9FFE3F2
      F9FFE2F2F9FFE1F2F9FFCDE5F1FFA8CBDDFFDEF0F8FFD8EDF7FFDCEFF7FFDAEE
      F7FFD9EEF7FFD8EDF7FFD7EDF6FFD5ECF6FFD4ECF6FFD3EBF6FFD1EAF5FF92BC
      D4FF6188ADFF35587AFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000777777FF8F8B8AFFF1E0D5FFEBDC
      CAFFEDC3B5FFE5B5A6FFE1AD9DFFE0AE9EFFDDA194FFE3AD9FFFE0A798FFE0A6
      96FFB64C30FFF2D2C5FF787270FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF545454FF00000009000000000000000037373796505050FF5050
      50FF505050FF505050FF505050FF505050FF505050FF505050FF505050FF3737
      3796000000000000000000000000000000000000000037373796505050FF5050
      50FF505050FF505050FF37373796000000000000000000000000373737965050
      50FF505050FF505050FF505050FF3737379600000000000000006D91B3FFB3C5
      D8FFECF3F6FFE7F4FAFFE7F4FAFFE7F4FAFFE7F4FAFFE6F4FAFFE5F3FAFFE4F3
      F9FFE4F2F9FFE3F2F9FFCDE5F1FFB5D3E3FFDFF1F8FFD8EDF7FFDDF0F8FFDCEF
      F8FFDBEFF7FFD9EEF7FFD8EDF7FFD7EDF6FFD5ECF6FFD4ECF6FFD3EBF6FFD2EB
      F5FF668CAFFF43719EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000868686FF989696FFF8EEE6FFF8E5
      D6FFF9E6DAFFFBE7DBFFF9E3D6FFF6DED1FFF2D9CCFFECD2C4FFE6CCC0FFE3C9
      BBFFE2C5B9FFEEDDD5FF757172FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D91B3FFB3C5
      D8FFECF3F6FFECF3F6FFECF3F6FFECF3F6FFECF3F6FFECF3F6FFECF3F6FFECF3
      F6FFECF3F6FFECF3F6FFE9F3F7FFC9DFECFFE9F3F7FFE9F3F7FFD8EDF7FFD8ED
      F7FFD8EDF7FFD8EDF7FFC9DFECFFC7DEEBFFC4DDEBFFC2DCEAFFC0DBE9FFBEDA
      E9FF6A8FB2FF43719EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000707070E9888585FFA0A0A2FF9596
      98FF949597FF959598FF8E8F91FF848587FF7D7D81FF77787AFF6D6E71FF6869
      6CFF5C5E60FF59595BFF3C3636FF504F4FE60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E
      94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFA58E94FFEAEB
      EDFFE0E1E3FF545454FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D91B3FFB3C5
      D8FFB3C5D8FFB3C5D8FFB3C5D8FFB3C5D8FFB3C5D8FFB3C5D8FFB1C4D7FFAFC2
      D6FFADC0D5FFAABED3FFA7BCD2FFA4BAD0FFA1B7CFFF9DB5CDFF9AB2CBFF96AF
      C9FF92ACC7FF8EA9C4FF8AA6C2FF85A3BFFF81A0BDFF7C9CBBFF7799B9FF7396
      B6FF6F93B4FF43719EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000005E5E5EC8787878FF828282FF6C6C
      6CFF626262FF656565FF5A5A5AFF4D4D4DFF4D4D4DFF4E4E4EFF464646FF4444
      44FF424242FF404040FF383838FF565656C80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEBEDFFEAEB
      EDFFE0E1E3FF545454FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006D91B3FF6D91
      B3FF6D91B3FF6D91B3FF6D91B3FF6D91B3FF6D91B3FF6D91B3FF6D91B3FF6D91
      B3FF6D91B3FF6D91B3FF8FAAC4FF8FAAC4FF8FAAC4FF6D91B3FF6D91B3FF6D91
      B3FF6D91B3FF6D91B3FF6D91B3FF6D91B3FF6D91B3FF6D91B3FF6D91B3FF6D91
      B3FF6D91B3FF6D91B3FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000606062A484848C0505050D44242
      42D13C3C3CD03E3E3ED03C3C3CD03A3A3AD13A3A3AD13C3C3CD13A3A3AD13838
      38D03A3A3AD1393939D33C3C3CC7080808310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454FFFFFFFFFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE0E1E3FF545454FF00000006000000000000000000000000000000000000
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
      000000000000000000000000000000000000545454FF545454FF545454FF5454
      54FF545454FF545454FF545454FF545454FF545454FF545454FF545454FF5454
      54FF545454FF545454FF545454FF545454FF545454FF545454FF545454FF5454
      54FF545454FF545454FF00000003000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000E00000000100010000000000000E00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ilMainMenu: TImageList
    DrawingStyle = dsTransparent
    Left = 280
    Top = 256
    Bitmap = {
      494C010125002700480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
    Left = 576
    Top = 576
  end
  object pmCollection: TPopupMenu
    Images = ilMainMenu
    OwnerDraw = True
    Left = 448
    Top = 368
  end
  object pmScripts: TPopupMenu
    Images = ilFileTypes
    OwnerDraw = True
    Left = 448
    Top = 256
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
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 280
    Top = 368
    Bitmap = {
      494C010108000A00080010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6BFF1B1B1BFF1B1B
      1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B1BFF1B1B
      1BFF1B1B1BFF1B1B1BFF1B1B1BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6BFFD3D3D4FFD0D0
      D1FFCDCDCEFFCBCBCCFFC8C8C9FFC4C4C5FFC2C2C3FFBFBFC1FFBDBDBEFFBBBB
      BCFFB9B9BBFFB8B8B9FF1B1B1BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101030101
      0106010101030000000000000000000000000101010301010106010101030000
      000000000000000000000000000000000000000000006B6B6BFFD8D8D8FFD5D5
      D5FFD2D2D2FFCFCFD0FFCCCCCDFFC9C9CAFFC5C5C7FFC3C3C4FFC0C0C1FFBEBE
      BFFFBCBCBDFFBABABBFF1B1B1BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      010300000000000000000000000000000000000000006B6B6BFFDCDCDDFFD9D9
      DAFFD6D6D7FFD3D3D4FF026E02FFCDCDCEFFCACACBFFC7C7C8FFC4C4C5FFC1C1
      C2FFBFBFC0FFBDBDBEFF1B1B1BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000303F0173379601FF3C9501FF4F6801BF000000000000
      000000000000000000000000000000000000010101030101010E010101160101
      010E01010103000000000101010601010111010101140101010B000000000101
      010600000000000000000000000000000000000000006B6B6BFFE0E0E1FFE0E0
      E1FFDADADBFFD7D7D8FF02A902FF026E02FFCECECFFFCBCBCCFFC8C8C9FFC5C5
      C7FFC2C2C3FFC0C0C1FF1B1B1BFF000000000000000000000000000000000C0C
      0C0B363636B54242428A4242428A4242428A4242428A1B1B1BE31B1B1BE33A3A
      3AA9000000000000000000000000000000000000000000000000000000000000
      0000000000002B3801665C8D01FF2AAD01FF0BAB01FF5C7901E11D2601440000
      000000000000000000000000000000000000010101080101011F0101012D0101
      011F010101080101010601010116010101240101012201010114000000000101
      010300000000000000000000000000000000000000006B6B6BFFE4E4E5FFE1E1
      E2FFDEDEDFFFDBDBDCFF02A902FF75DA80FF026E02FFCFCFD0FFCCCCCDFFCACA
      CBFFC7C7C8FFC3C3C4FF1B1B1BFF000000000000000000000000000000003C3C
      3CA5292929CFBBADADFF353535FFB6A9A9FFBBADADFF444444FF5F5F5FFF2929
      29CF000000000000000000000000000000000000000000000000000000000000
      000004050108516901C31EAB01FF33D901FF31D601FF2E9C01FF5A7D01E5161C
      0133000000000000000000000000000000000101010B0134FFFF010101400101
      0132010101190101011C0101012D0134FFFF0101012401010111000000000000
      000000000000000000000000000000000000000000006B6B6BFFE8E8E9FFE5E6
      E6FFE3E3E3FFE0E0E0FF02A902FF75DA80FF75DA80FF026E02FFD0D0D1FFCDCD
      CEFFCBCBCCFFC8C8C9FF1B1B1BFF000000000000000000000000000000002E2E
      2EC7535353FFBDB7B7FF242424FFB4AEAEFFBDB7B7FF3F3F3FFF5C5C5CFF2E2E
      2EC7000000000000000000000000000000000000000000000000000000000000
      00003545017F509001FF1EC101FF30D501FF34DA01FF2BD001FF379601FF3545
      017F000000000000000000000000000000000101010B0134FFFF010101510101
      014C0101013B0101013E0134FFFF010101380101011C01010106000000000000
      000000000000000000000000000000000000000000006B6B6BFFECECEDFFEAEA
      EAFFE7E7E7FFE4E4E4FF02A902FF75DA80FF75DA80FF75DA80FF026E02FFD2D2
      D2FFCFCFD0FFCCCCCDFF1B1B1BFF000000000000000000000000000000003131
      31C1555555FFC7C6C6FFC3C2C2FFC3C2C2FFC7C6C6FF3A3A3AFF5A5A5AFF3131
      31C1000000000000000000000000000000000000000000000000000000001015
      0126377701CC26BB01FF19BB01FF0E7F01B2149D01D933D901FF28B001FF5A8D
      01FF000000000000000000000000000000000101010B0134FFFF0101015A0101
      015A0101014C0134FFFF0101014E0101013E0101011901010103000000000000
      000000000000000000000000000000000000000000006B6B6BFFF0F0F0FFEDED
      EEFFEBEBEBFFE8E8E8FF02A902FF75DA80FF75DA80FF02A902FFD9D9DAFFD6D6
      D7FFD3D3D4FFD0D0D1FF1B1B1BFF000000000000000000000000000000003434
      34BC585858FF353535FF353535FF353535FF353535FF363636FF595959FF3434
      34BC000000000000000000000000000000000000000000000000000000005A7D
      01E5309801FF0A9901E501170122010C01110111011916A601E51EC101FF4894
      01FF485D01AE080A011100000000000000000101010B0134FFFF0134FFFF0134
      FFFF0134FFFF0134FFFF010101430101013E0101012201010108000000000000
      000000000000000000000000000000000000000000006B6B6BFFF4F4F4FFF1F1
      F1FFEFEFEFFFECECECFF02A902FF75DA80FF02A902FFE0E0E1FFDDDDDEFFDADA
      DBFFD7D7D8FFD4D4D5FF1B1B1BFF000000000000000000000000000000003636
      36B7797979FFD6D6CCFFF6F6E9FFF6F6E9FFF6F6E9FFD6D6CCFF797979FF3636
      36B7000000000000000000000000000000000000000000000000000000003088
      01E6036201990119012600000000000000000000000001190126139401CC1CBE
      01FF4B9101FF3545017F00000000000000000101010B0134FFFF010101490101
      013E01010122010101220134FFFF0101013E010101270101010B000000000000
      000000000000000000000000000000000000000000006B6B6BFFF7F7F7FFF5F5
      F5FFF2F2F2FFF0F0F0FF02A902FF02A902FFE7E7E8FFE4E4E5FFE1E1E2FFDEDE
      DFFFDBDBDCFFD8D8D9FF1B1B1BFF000000000000000000000000000000003838
      38B27E7E7EFFFAFAF3FFF5F5EEFFF5F5EEFFF5F5EEFFFAFAF3FF7E7E7EFF3838
      38B200000000000000000000000000000000000000000000000000000000022A
      0140000000000000000000000000000000000000000000000000021C012B1196
      01D41E9C01FF567201D41218012A000000000101010B0134FFFF0101014C0101
      014901010135010101320134FFFF0101013B0101012201010108000000000000
      000000000000000000000000000000000000000000006B6B6BFFFAFAFAFFF8F8
      F8FFF5F5F6FFF3F3F3FF02A902FFEEEEEEFFEBEBECFFE8E8E9FFE5E6E6FFE3E3
      E3FFE0E0E0FFDCDCDDFF1B1B1BFF000000000000000000000000000000003939
      39AF848484FFFFFFFEFFFEFEFDFFFEFEFDFFFEFEFDFFFFFFFEFF848484FF3939
      39AF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000109
      010D088901D9309801FF5E8401F200000000010101080134FFFF010101430101
      014C01010146010101400134FFFF0101012D0101011401010103000000000000
      000000000000000000000000000000000000000000006B6B6BFFFCFCFCFFFAFA
      FBFFF8F8F9FFF6F6F7FFF4F4F4FFF2F2F2FFEFEFEFFFECECEDFFEAEAEAFF6B6B
      6BFF1B1B1BFF1B1B1BFF1B1B1BFF000000000000000000000000000000004242
      42813A3A3AAC59595366595953665959536659595366595953663A3A3AAC4242
      4281000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000001170122037C01C3509001FF00000000010101030134FFFF0134FFFF0134
      FFFF0134FFFF0134FFFF01010122010101140101010600000000000000000000
      000000000000000000000000000000000000000000006B6B6BFFFEFEFEFFFDFD
      FDFFFBFBFBFFF9F9F9FFF7F7F7FFF5F5F5FFF3F3F3FFF0F0F0FFEDEDEEFF6B6B
      6BFFE8E8E8FFC7C7C9FF6B6B6BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000001170122198001D0000000000000000001010103010101080101
      010B0101010B0101010B01010108010101030000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6BFFFFFFFFFFFFFF
      FFFFFDFDFDFFFCFCFCFFFAFAFAFFF8F8F8FFF6F6F6FFF4F4F4FFF1F1F1FF6B6B
      6BFFC7C7C9FF6B6B6BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6BFF6B6B6BFF6B6B
      6BFF6B6B6BFF6B6B6BFF6B6B6BFF6B6B6BFF6B6B6BFF6B6B6BFF6B6B6BFF6B6B
      6BFF6B6B6BFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006BC2FDFF3FAFFDFF62BDFDFF97D4
      FCFFA0D6FDFF9CD5FDFF9CD5FDFF94D2FCFF76C5FDFF74C6FDFF6EC3FCFF6BC1
      FCFF91D1FCFFACDCFDFFA0D7FDFF83CBFDFF0000000000000000000000004040
      4000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007BC8FEFF7CC9FDFF99D5FCFF96D3
      FDFFB8E1FCFFB7E0FDFFA6D9FDFF95D3FCFF82C4F0FF80B6DCFF7BC8FCFF73C5
      FDFF6AC1FDFF66BFFDFF6EC2FDFF99D5FDFF00000000000000002B2B2B00E0DB
      D9004267000000808000004E1900004E1900004E1900004E1900004E1900004E
      1900004E1900004E1900004E1900003611000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFC00FEFEFC00FDFDFA00FDFDFA00FCFC
      F800FEFEF90000000000000000000000000083CDFEFF8BCFFEFF91D2FDFF8DD0
      FDFF96D5FDFFA3D9FCFF97D3F8FF8EBCDBFF89ADC5FF87B2D1FF82BCE2FF7DC9
      FEFF74C6FEFF6AC1FEFF5EBDFEFF9CD6FDFF000000002B2B2B00E0DBD9000000
      00004870000000B9B9005A8A0000588800005888000058880000588800005888
      0000588800005787000053830100000000000000000000000000000000000000
      0000000000000000000000000000A49197009079810000000000000000000000
      0000000000000000000099898E00000000000000000000000000000000000000
      000000000000FEFEFC00FDFDFC00FDFDFA00FCFCF800FBFBF800FAFAF500F8F8
      F400FBFBF5000000000000000000000000008FD1FDFF98D5FDFF9DD8FDFFA3DA
      FDFFA6DCFCFF93D1FAFF91AABCFF98BCD4FF8AA3B2FF818182FF84A3B8FF85CE
      FDFF7ECAFEFF73C5FDFF68C1FDFF7CC9FDFF26262600D2CFCE00FFFDFC00CCC7
      C5005383010000000000E1F5BB00CDEF8C00C2EB7200BAE95E00B8E85900AEE5
      4200A5E22C009BDF160092DC00000036110000000000C6899D008F2648008A28
      47007A2B440078314800842B4700952F4F009731510084274500773047007B2E
      480089294800952F4F008F5A6B00000000000000000000000000000000000000
      0000CCCCBB00CBCBBA00DCDCCB00D2D2C100FBFBF800FAFAF500F8F8F400F7F7
      F200FBFBF50000000000000000000000000099D6FEFFA3D9FEFFA9DDFCFFAADC
      FDFF75C6FCFF7AC7F9FF98B3C5FF82888CFF818181FF818181FF7EB9E0FF31AA
      FCFF4CB5FDFF61BEFDFF69C1FCFF64BDFDFFB1AEAD00FFFBF800D5CFCB002B2B
      2B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5879B00A4516B00B068
      7F00AE647A00AA607600A7586F00A1496300AA5A7100B5718500AE647A00A75A
      7100AA5A7100AE647A008B546500000000000000000000000000000000000000
      0000EDEDDC00EDEDDC00ECECDB00EBEBDA00FAFAF500F8F8F400F7F7F200F6F6
      F000FAFAF200000000000000000000000000A3DAFEFFADDDFEFF90D2FBFF77C6
      FBFF8FC2E3FF959EA5FFA5A5A5FF818181FF818181FF889199FF4FB6FBFF3EAF
      FCFF84CCFBFF0398FDFF159FFCFF65C0FDFF00000000CCC7C50000000000E0DB
      D900884D000000808000673C0000673C0000673C0000673C0000673C0000673C
      0000673C0000673C0000673C00005032000000000000C5879B00A4516B00C48E
      A000D7B0BC00DAB5C000C5879B00A1496300AA5A7100D7AFBB00DDBAC500CD9D
      AC00BD829500B0637C00844C5F0000000000000000000000000000000000FEFE
      FC00CBCBBA00DBDBCA00C9C9B800C7C7B600D7D7C600D6D6C500CCCCBB00D3D3
      C200FAFAF200000000000000000000000000ACDDFDFF95D4FCFF85C7F0FF93A6
      B3FFA3A3A3FFE2E2E2FFF8F8F8FF999999FF818181FF97B6CBFF21A4FDFFA2D9
      FCFF95D3FCFF3BAFFCFF37ADFDFF85CCFDFFA6A3A20000000000E0DBD9000000
      0000A75800001EC5C500A7580000A7580000A25700009F5600009F5600009C56
      00009654000096540000945400000000000000000000C6899D00A75A7100C689
      9D00D7B0BC00DAB5C000C1879800A34D6600AA607600D7AFBB00DDBAC500CD9D
      AC00BD829500AD6179007F45570000000000000000000000000000000000FEFE
      FC00ECECDB00EBEBDA00E9E9D800E8E8D700E7E7D600E5E5D400E4E4D300E3E3
      D200F9F9EF00000000000000000000000000B1DFFDFFBBE1F8FF8E9399FFD1D2
      D1FFAAAAA9FFEFEFEFFFD4D4D4FFCFCFCFFF858889FF75C0F4FF0499FDFF33AB
      FBFF8ACFFCFF4AB4FCFF71C4FCFFAFDEFDFF26262600D2CFCE00FFFDFC00CCC7
      C500B563060000000000FFE4B000FFDDA400FFD79800FFD18D00FFCB8100FFC5
      7600FFBF6A00FFB95F00FFB353005032000000000000C5879B00A6567000C48E
      A000D7B0BC00DAB5C000C5879B00A1496300AA5A7100D7AFBB00DAB5C000CD9D
      AC00BD829500AA5A71007B3F520000000000000000000000000000000000FDFD
      FA00C9C9B800C7C7B600C6C6B500D6D6C500C3C3B200D3D3C200D2D2C100C8C8
      B700F7F7EA00000000000000000000000000B5E1FDFFC4E6FDFFA2AFB7FFDBDB
      DBFFB5B5B5FFE5E5E5FFC7C7C7FFF7F7F7FF9CA2A7FF9BC9E7FF5EBCF9FF33AB
      FCFF1BA2FDFF35ADFCFF83CBFCFFA1D8FDFFB1AEAD00FFFBF800D5CFCB002B2B
      2B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5879B00A6567000C689
      9D00D7B0BC00DAB5C000C6899D00A75A7100AE647A00D7B0BC00E0BFC900D0A3
      B200C6899D00AE647A0076394D0000000000000000000000000000000000FDFD
      FA00E9E9D800E8E8D700E7E7D600E5E5D400E4E4D300E3E3D200E2E2D100E0E0
      CF00F4F4E500000000000000000000000000B6E2FEFFC4E7FEFFC8DDECFFA4A6
      A7FFE9E9EAFFB1B1B1FFE6E6E6FFDCDCDCFFC1C1C1FF818181FF878E92FF91A7
      B6FF84B8D9FF81C8F8FF7FCBFCFF81CAFDFF00000000CCC7C50000000000E0DB
      D9001B145D000080800000005000000050000000500000005000000050000000
      50000000500000005000000050000000500000000000C5879B00A75A7100C490
      A200DAB5C000DAB5C000C6899D00A7586F00B0687F00DAB5C000DDBAC500D0A3
      B200C48EA000AE647A007333490000000000000000000000000000000000FCFC
      F800C6C6B500D6D6C500C3C3B200C2C2B100C1C1B000C0C0AF00CFCFBE00C6C6
      B500F3F3E200000000000000000000000000B5E0FDFFC4E6FEFFD1EBFDFFA0A8
      ADFFE6E5E5FFACACACFFEFEFEFFFDEDEDEFFE7E7E7FF818181FF818181FF8181
      81FF818181FF818E96FF81C8FAFF6DC2FDFFA6A3A20000000000E0DBD9000000
      0000201A6F001EC5C5005A0292005A0292005A0292005A0292005A0292005A02
      92005A0292005A02920053028D000000500000000000C5879B00A6567000C689
      9D00D7B0BC00DDBAC500C6899D00A7586F00AE647A00D7B0BC00E0BFC900D0A3
      B200C490A200AE647A00712E440000000000000000000000000000000000FCFC
      F600E7E7D600E5E5D400E4E4D300E3E3D200F1F1E700ECECDF00E8E8D900E6E6
      D500F2F2E100000000000000000000000000B2DFFDFFBDE3FDFFC9E9FDFFBFD4
      E1FFB4B4B5FFE9E9E9FFCBCBCBFFEAEAEAFF949494FF818181FF818181FF8181
      81FF8494A0FF84B5D5FF7FC8FCFF70C4FCFF26262600D2CFCE00FFFDFC00CCC7
      C5005302860000000000F0BEFF00E5A3FF00DE95FF00D787FF00D27DFF00D079
      FF00CA6CFF00C063F400B55AE8001B145D0000000000C88EA100A75A7100C48E
      A000D7B0BC00DDBAC500C1879800A4516B00AE647A00D7B0BC00E0BFC900D0A3
      B200C6899D00AE647A008545590000000000000000000000000000000000FBFB
      F500C3C3B200C2C2B100D2D2C100C8C8B700ECECDF00E8E8D900E6E6D500E5E5
      D400F2F2E100000000000000000000000000B0DEFDFFB6E1FDFFC1E5FDFFC9E7
      FCFFB0B7BBFFF4F4F5FFBCBCBDFFF3F3F3FF8C8C8CFF818384FF8FA2B1FF97C6
      E5FF91D3FCFF85CCFDFF79C8FDFF6DC2FDFFB1AEAD00FFFBF800D5CFCB001812
      5400620A9A006810A000620A9A006810A000620A9A006810A000620A9A006810
      A000620A9A005F08950053028600191463000000000000000000D7AFBB00C490
      A200D7B0BC00DAB5C000C6899D00A75A7100B46E8200D7B0BC00DDBAC500D1A6
      B400C490A200D7AFBB000000000000000000000000000000000000000000FAFA
      F500F5F5EE00F4F4EC00F1F1E700ECECDF00E8E8D900E6E6D500B5B5A400B5B5
      A400B5B5A40000000000000000000000000096D2FCFFB1DEFCFFB6E1FEFFBCE3
      FDFFAAC5D5FFAFAEAFFFBBBDBBFF8D9397FF9AB2C3FFA7D5F3FFA1D8FDFF97D4
      FEFF8BCFFEFF80CAFDFF74C6FEFF68C0FEFF00000000CCC7C500181254004B02
      7A000091910000D1D1000096960046057F004F0384004B027A004F0384004B02
      7A0050028100390A770018125400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAFA
      F200F4F4EC00F1F1E700ECECDF00E8E8D900E6E6D500E5E5D400C7C7B6000000
      0000A3A3790000000000000000000000000095D2FDFFA0D7FCFFA7DCFDFFAFDE
      FDFFB1DEFAFF91A1ACFFA1BED3FFADDBF8FFA9DCFDFFA2D9FDFF98D5FDFF8ED1
      FDFF83CCFEFF7AC8FEFF6EC3FEFF63BEFEFFA6A3A20018125400201A6F000096
      960000D1D10000919100201A6F002C14740027106B002C14740027106B002C14
      740027106B001812540000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      F600F9F9EF00F6F6EA00F4F4E500F3F3E200F2F2E100F2F2E100D3D3C200A7A7
      7D00A7A77D000000000000000000000000000000000091D1FCFFB1DEFDFFAFDE
      FDFFA5DAFDFFA5DBFCFFA6DAFDFFA2D9FDFF9DD7FEFF96D4FEFF8ED0FDFF85CD
      FEFF7CC9FEFF73C5FDFF66C0FEFF5CBCFCFF210F54001B145D00191463001914
      6300191463001914630019146300191463001914630019146300191463001B14
      5D00001D58000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008001FFFF000000008001FFFF00000000
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
    Images = ilFileTypes
    OwnerDraw = True
    Left = 368
    Top = 256
    object N3: TMenuItem
      Tag = 20
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
      Tag = 17
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1086
      OnClick = HeaderPopupItemClick
    end
    object N28: TMenuItem
      Tag = 18
      Caption = #1058#1080#1087
      OnClick = HeaderPopupItemClick
    end
    object N22: TMenuItem
      Tag = 19
      Caption = #1050#1086#1083#1083#1077#1082#1094#1080#1103
      OnClick = HeaderPopupItemClick
    end
    object N42: TMenuItem
      Tag = 21
      Caption = #1071#1079#1099#1082
      OnClick = HeaderPopupItemClick
    end
    object N45: TMenuItem
      Tag = 22
      Caption = 'N'
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
  object TrayIcon: TTrayIcon
    Hint = 'MyHomeLib'
    BalloonHint = 'MyHomeLib'
    PopupMenu = pmTray
    OnDblClick = TrayIconDblClick
    Left = 672
    Top = 576
  end
  object pmTray: TPopupMenu
    OwnerDraw = True
    Left = 368
    Top = 480
    object N29: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100'/'#1057#1074#1077#1088#1085#1091#1090#1100
      OnClick = TrayIconDblClick
    end
    object N32: TMenuItem
      Caption = '-'
    end
    object N33: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N33Click
    end
  end
  object pmDownloadList: TPopupMenu
    Images = ilMainMenu
    OwnerDraw = True
    Left = 368
    Top = 424
    object mi_dwnl_LocateAuthor: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1072#1074#1090#1086#1088#1091
      ImageIndex = 35
      OnClick = mi_dwnl_LocateAuthorClick
    end
    object N35: TMenuItem
      Caption = '-'
    end
    object mi_dwnl_Delete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      OnClick = btnDeleteDownloadClick
    end
  end
  object ilToolBar_Disabled: TImageList
    ColorDepth = cd32Bit
    BlendColor = clWhite
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Left = 288
    Top = 480
    Bitmap = {
      494C010118001A00480020002000FFFFFF002110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000E0000000010020000000000000C0
      0100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000535353CA535353CA5353
      53CA535353CA535353CA535353CA535353CA535353CA535353CA535353CA5353
      53CA535353CA535353CA535353CA737373CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3FCA3F3F3FCA3F3F3FCA3F3F3FCA3F3F3FCA3F3F3FCA3F3F
      3FCA3F3F3FCA3F3F3FCA737373CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000003000000110000002700000035000000380000
      0035000000270000001100000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6F6FCA9C9C9CFFB8B8B8FFB8B8
      B8FFB8B8B8FFB8B8B8FF9C9C9CFF868686FFC8C8C8FFB8B8B8FFB8B8B8FFB8B8
      B8FFB5B5B5FF939393FF535353CA737373CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F4F4FFF3F3F3FFF2F2F2FFF2F2F2FFF1F1F1FFF0F0F0FFEFEFEFFFEEEE
      EEFFF0F0F0FF3F3F3FCA737373CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000131C1C1C9E3E3E3EDE0101012C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000080000002700000054000000730000007B0000
      0073000000540000002700000008000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000323232CA222222CA2525
      25CA252525CA242424CA242424CA242424CA898989FF363636FF363636FF3838
      38FF3E3E3EFF393939FF3E3E3EFF404040FF363636FF3C3C3CFF3B3B3BFF3737
      37FF3B3B3BFF696969FF535353CA737373CA0000000000000000000000000000
      00000000000000000000000000000000000000000000323232CA222222CA2525
      25CA252525CA242424CA242424CA242424CA242424CA242424CA242424CA2525
      25CAC1C1C1FFC0C0C0FFD0D0D0FFC7C7C7FFF0F0F0FFEFEFEFFFEEEEEEFFECEC
      ECFFF0F0F0FF3F3F3FCA737373CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000207070759525252E3BEBEBEFFBBBBBBFF333333CD0000
      000C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B858585FF858585FF858585FF858585FF8585
      85FF00000073000000350000000B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000737373CA333333FF353535FF3737
      37FF363636FF363636FF373737FF363636FF878787FF5C5C5CFF6F6F6FFF6C6C
      6CFF686868FF606060FF545454FF616161FF767676FF6A6A6AFF626262FF6666
      66FF696969FF626262FF535353CA737373CA0000000000000000000000000000
      000000000000000000000000000000000000737373CA333333FF353535FF3838
      38FF363636FF363636FF383838FF373737FF363636FF373737FF353535FF3232
      32FFE0E0E0FFE0E0E0FFDFDFDFFFDEDEDEFFEFEFEFFFEEEEEEFFECECECFFEBEB
      EBFFEFEFEFFF3F3F3FCA737373CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000001010122282828BE949494FFDDDDDDFFE6E6E6FFF0F0F0FFACACACFF1818
      189B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B858585FFB9B9B9FFB6B6B6FFB3B3B3FF8585
      85FF0000007B000000380000000B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000474747CA5A5A5AFF7B7B7BFF7373
      73FF828282FF797979FF747474FF717171FF878787FF5F5F5FFF909090FFAFAF
      AFFFB3B3B3FF8B8B8BFF585858FF656565FFABABABFFB8B8B8FF9E9E9EFF8787
      87FF6B6B6BFF383838CA535353CA737373CA0000000000000000000000000000
      000000000000000000000000000000000000474747CA5C5C5CFF7C7C7CFF7373
      73FF828282FF7A7A7AFF757575FF717171FF6F6F6FFF6A6A6AFF5E5E5EFF7575
      75FFC0C0C0FFCFCFCFFFBEBEBEFFBCBCBCFFCCCCCCFFCBCBCBFFC1C1C1FFC8C8
      C8FFEFEFEFFF3F3F3FCA737373CA000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000C0E0E
      0E7B616161EEC1C1C1FFE5E5E5FFDFDFDFFFBBBBBBFFCDCDCDFFF1F1F1FF8F8F
      8FFF0A0A0A6A0000000000000000000000000000000600000011000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      00080000000B0000000B00000016858585FFBDBDBDFFB9B9B9FFB6B6B6FF8585
      85FF01010180000000430000001A0000000F0000000F0000000C000000070000
      0004000000040000000400000004000000040000000400000004000000040000
      0004000000040000000400000003000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA5F5F5FFF848484FF7272
      72FF8E8E8EFF7C7C7CFF757575FF727272FF878787FF606060FF909090FFAFAF
      AFFFB3B3B3FF8B8B8BFF585858FF656565FFABABABFFB8B8B8FF9E9E9EFF8787
      87FF696969FF333333CA535353CA737373CA0000000000000000000000000000
      000000000000000000000000000000000000404040CA5F5F5FFF848484FF7272
      72FF8E8E8EFF7D7D7DFF767676FF727272FF707070FF6B6B6BFF5A5A5AFF7E7E
      7EFFDFDFDFFFDEDEDEFFDDDDDDFFDCDCDCFFDBDBDBFFD9D9D9FFD8D8D8FFD7D7
      D7FFEDEDEDFF3F3F3FCA737373CA000000000000000000000000000000000000
      00000000000000000000000000000000000000000000040404493B3B3BD4A7A7
      A7FFE0E0E0FFE6E6E6FFCCCCCCFF919191FF737373FF7D7D7DFFD8D8D8FFE7E7
      E7FF6E6E6EF9040404450000000000000000212121975C5C5CF61212127A0000
      0004000000000000000000000000000000000000000000000003000000110000
      0027000000350000003800000040858585FFC0C0C0FFBDBDBDFFB9B9B9FF8585
      85FF0101019B0000007400000059000000530000005000000044000000310000
      0025000000220000002200000022000000220000002200000022000000220000
      0022000000220000002200000006000000000000000000000000000000000000
      000000000000000000000000000000000000424242CA6F6F6FFF8C8C8CFF7474
      74FF666666FF6A6A6AFF717171FF737373FF878787FF606060FF909090FFAFAF
      AFFFB3B3B3FF8B8B8BFF585858FF656565FFABABABFFB8B8B8FF9E9E9EFF8787
      87FF676767FF2F2F2FCA535353CA737373CA0000000000000000000000000000
      000000000000000000000000000000000000434343CA6F6F6FFF8D8D8DFF7575
      75FF676767FF6B6B6BFF717171FF737373FF747474FF6E6E6EFF606060FF5959
      59FFBEBEBEFFBCBCBCFFBCBCBCFFCBCBCBFFB9B9B9FFC8C8C8FFC7C7C7FFBDBD
      BDFFEBEBEBFF3F3F3FCA737373CA000000000000000000000000000000000000
      0000000000000000000000000000000000121A1A1AA07A7A7AFFCCCCCCFFE8E8
      E8FFDBDBDBFFB1B1B1FF757575FF777777FF8C8C8CFF828282FF868686FFE9E9
      E9FFD9D9D9FF454545DC00000012121212826F6F6FFF959595FF8C8C8CFF1A1A
      1A9A000000000000000000000000000000000000000000000008000000270000
      0054000000730000007B0000007E858585FFC2C2C2FFC0C0C0FFBDBDBDFF8585
      85FF222222FF292929FF2D2D2DFF2E2E2EFF303030FF3A3A3AFF494949FF5252
      52FF555555FF555555FF555555FF555555FF555555FF555555FF555555FF5555
      55FF555555FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000464646CA757575FF8E8E8EFF7D7D
      7DFF757575FF767676FF7A7A7AFF787878FF878787FF606060FF919191FFB0B0
      B0FFB4B4B4FF8F8F8FFF5F5F5FFF6E6E6EFFB0B0B0FFBCBCBCFFA4A4A4FF8D8D
      8DFF686868FF464646FF535353CA737373CA0000000000000000000000000000
      000000000000000000000000000000000000464646CA767676FF8E8E8EFF7D7D
      7DFF757575FF777777FF7A7A7AFF797979FF7A7A7AFF767676FF6A6A6AFF6464
      64FFDDDDDDFFDCDCDCFFDBDBDBFFD9D9D9FFD8D8D8FFD7D7D7FFD6D6D6FFD4D4
      D4FFE8E8E8FF3F3F3FCA737373CA000000000000000000000000000000000000
      000000000000000000010A0A0A6A494949E6AFAFAFFFE5E5E5FFE2E2E2FFC5C5
      C5FF878787FF6C6C6CFF808080FF888888FF8A8A8AFF919191FF858585FFA5A5
      A5FFEFEFEFFFBFBFBFFF414141E1686868F9A2A2A2FFB1B1B1FF8D8D8DFF6767
      67FE02020233000000000000000000000000000000000000000B9F9F9FFF8585
      85FF858585FF858585FF858585FF858585FFC5C5C5FFC2C2C2FFC0C0C0FF8585
      85FF858585FF858585FF858585FF858585FF858585FF787878FFACACACFFD0D0
      D0FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9
      D9FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000444444CA494949FF585858FF5E5E
      5EFF5A5A5AFF626262FF737373FF656565FF878787FF606060FF919191FFB1B1
      B1FFB5B5B5FF8F8F8FFF5F5F5FFF6E6E6EFFB0B0B0FFBCBCBCFFA6A6A6FF9191
      91FF6E6E6EFF3F3F3FFF535353CA737373CA0000000000000000000000000000
      000000000000000000000000000000000000444444CA4A4A4AFF5A5A5AFF5E5E
      5EFF5C5C5CFF626262FF737373FF656565FF5F5F5FFF4A4A4AFF363636FF3131
      31FFBCBCBCFFCBCBCBFFB9B9B9FFB8B8B8FFB7B7B7FFB6B6B6FFC4C4C4FFBCBC
      BCFFE6E6E6FF3F3F3FCA737373CA000000000000000000000000000000000000
      000001010125252525BE8C8C8CFFD7D7D7FFE7E7E7FFD8D8D8FF9C9C9CFF6C6C
      6CFF747474FF828282FF848484FF888888FF8B8B8BFF909090FF979797FF8282
      82FFB8B8B8FFA3A3A3FF6C6C6CFFA4A4A4FFB5B5B5FF959595FF767676FF6868
      68FF0404043E000000000000000000000000000000000000000B9F9F9FFFD7D7
      D7FFD4D4D4FFD1D1D1FFCDCDCDFFCBCBCBFFC8C8C8FFC5C5C5FFC2C2C2FFC0C0
      C0FFBDBDBDFFB9B9B9FFB6B6B6FFB3B3B3FF858585FF767676FFB1B1B1FFD8D8
      D8FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA535353FFB7B7B7FF9797
      97FF979797FF9C9C9CFFA1A1A1FF9F9F9FFF868686FF606060FF919191FFB0B0
      B0FFB4B4B4FF8E8E8EFF5F5F5FFF6D6D6DFFAFAFAFFFBCBCBCFFA6A6A6FF9191
      91FF6C6C6CFF3B3B3BFF535353CA737373CA0000000000000000000000000000
      000000000000000000000000000000000000404040CA535353FFB7B7B7FF9898
      98FF979797FF9D9D9DFFA1A1A1FF9F9F9FFF9E9E9EFF999999FF959595FF9595
      95FFDBDBDBFFD9D9D9FFD8D8D8FFD7D7D7FFE5E5E5FFE0E0E0FFDCDCDCFFDADA
      DAFFE5E5E5FF3F3F3FCA737373CA0000000000000000000000000000000A0F0F
      0F80606060F9B7B7B7FFE7E7E7FFE0E0E0FFB7B7B7FF7A7A7AFF686868FF7878
      78FF7D7D7DFF818181FF848484FF898989FF8C8C8CFF919191FF989898FF9999
      99FF686868FF6B6B6BFFA8A8A8FFB5B5B5FF969696FF7B7B7BFF676767FD1010
      106D00000000000000000000000000000000000000000000000B9F9F9FFFD9D9
      D9FFD7D7D7FFD4D4D4FFD1D1D1FFCDCDCDFFCBCBCBFFC8C8C8FFC5C5C5FFC2C2
      C2FFC0C0C0FFBDBDBDFFB9B9B9FFB6B6B6FF858585FF515151FF717171FF8787
      87FF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA757575FF808080FF1515
      15FF1C1C1CFF1C1C1CFF1B1B1BFF1C1C1CFF8C8C8CFF606060FF909090FFB0B0
      B0FFB4B4B4FF8D8D8DFF5E5E5EFF6C6C6CFFAFAFAFFFBBBBBBFFA5A5A5FF9090
      90FF6B6B6BFF4F4F4FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA767676FF808080FF1515
      15FF1C1C1CFF1C1C1CFF1B1B1BFF1C1C1CFF1D1D1DFF1C1C1CFF1C1C1CFF1E1E
      1EFFE5E5E5FFB8B8B8FFC7C7C7FFBDBDBDFFE0E0E0FFDCDCDCFFDADADAFFD9D9
      D9FFE5E5E5FF3F3F3FCA737373CA00000000000000000505054F353535D79898
      98FFDFDFDFFFE8E8E8FFCCCCCCFF8F8F8FFF646464FF6E6E6EFF787878FF7A7A
      7AFF7D7D7DFF828282FF868686FF8A8A8AFF8E8E8EFF949494FF999999FF7676
      76FF6C6C6CFFA7A7A7FFB7B7B7FF949494FF787878FF626262FA0C0C0C5F0000
      00000000000000000000000000000000000000000000000000089F9F9FFFDBDB
      DBFFD9D9D9FFD7D7D7FFD4D4D4FFD1D1D1FFCDCDCDFFCBCBCBFFC8C8C8FFC5C5
      C5FFC2C2C2FFC0C0C0FFBDBDBDFFB9B9B9FF858585FF3C3C3CFF4C4C4CFF5656
      56FF595959FF6B6B6BFFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA757575FFDDDDDDFFE4E4
      E4FFF5F5F5FFF5F5F5FFF4F4F4FFF5F5F5FFEAEAEAFFAAAAAAFF979797FFAFAF
      AFFFB4B4B4FF8D8D8DFF646464FF767676FFAEAEAEFFBBBBBBFFA5A5A5FF9393
      93FF939393FFE4E4E4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA767676FFDEDEDEFFE4E4
      E4FFF5F5F5FFF5F5F5FFF4F4F4FFF5F5F5FFF4F4F4FFF5F5F5FFF5F5F5FFE9E9
      E9FFEAEAEAFFE9E9E9FFE5E5E5FFE0E0E0FFDCDCDCFFDADADAFFACACACFFACAC
      ACFFACACACFF3F3F3FCA737373CA000000000D0D0D75707070FFC8C8C8FFE9E9
      E9FFDBDBDBFFA9A9A9FF6C6C6CFF676767FF727272FF757575FF777777FF7A7A
      7AFF808080FF838383FF878787FF8B8B8BFF909090FF969696FF757575FF6C6C
      6CFFAAAAAAFFB7B7B7FF949494FF787878FF6D6D6DFF434343DB0000000F0000
      00000000000000000000000000000000000000000000000000039F9F9FFF9F9F
      9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFD1D1D1FFCDCDCDFFCBCBCBFF8585
      85FF858585FF858585FF858585FF858585FF858585FF545454FF5C5C5CFF6060
      60FF626262FF5F5F5FFF3B3B3BFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA777777FFE2E2E2FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FF939393FF9393
      93FF939393FF939393FF939393FF939393FF939393FF939393FF939393FF9393
      93FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA787878FFE2E2E2FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF4F4F4FFF5F5
      F5FFE5E5E5FFE5E5E5FFE0E0E0FFDCDCDCFFDADADAFFD9D9D9FFBCBCBCFFF4F4
      F4FF969696FF3F3F3FCA737373CA000000003C3C3CE7CECECEFFE8E8E8FFC2C2
      C2FF7D7D7DFF626262FF6B6B6BFF707070FF737373FF757575FF787878FF7C7C
      7CFF818181FF848484FF898989FF8C8C8CFF929292FF737373FF707070FFADAD
      ADFFB5B5B5FF979797FF797979FF636363FFB4B4B4FFBCBCBCFF1919199A0000
      0000000000000000000000000000000000000000000000000000000000030000
      00080000000B0000000B000000169F9F9FFFD4D4D4FFD1D1D1FFCDCDCDFF8585
      85FF737373FFAAAAAAFF545454FF999999FF9A9A9AFF858585FF808080FF8585
      85FF818181FF959595FFA4A4A4FF5E5E5EFFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA777777FFEEEEEEFFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFF5F5F5FFEEEEEEFF8A8A8AFF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA787878FFEFEFEFFFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFE5E5E5FFEAEAEAFFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFC8C8C8FF9999
      99FF999999FF000000000000000000000000242424BBA8A8A8FF9B9B9BFF6767
      67FF686868FF6E6E6EFF6E6E6EFF707070FF757575FF797979FF7D7D7DFF8282
      82FF838383FF858585FF8A8A8AFF8F8F8FFF747474FF6D6D6DFFA2A2A2FFB5B5
      B5FF959595FF7B7B7BFF676767FF727272FFB8B8B8FFF3F3F3FF9E9E9EFF0F0F
      0F7E000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B9F9F9FFFD7D7D7FFD4D4D4FFD1D1D1FF8585
      85FF4C4C4CFF303030FF606060FF676767FF696969FF5E5E5EFF525252FF5555
      55FF515151FF5D5D5DFF6B6B6BFF646464FF3B3B3BFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA787878FFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF4F4F4FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF3F3
      F3FFF5F5F5FFF5F5F5FF878787FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA797979FFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF4F4F4FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF3F3
      F3FFF5F5F5FFF5F5F5FF888888FF3F3F3FCA0000000000000000000000000000
      00000000000000000000000000000000000006060652535353FF676767FF6C6C
      6CFF6C6C6CFF6D6D6DFF727272FF707070FF676767FF606060FF616161FF6969
      69FF797979FF898989FF8F8F8FFF8A8A8AFF5B5B5BFF848484FFA7A7A7FF9595
      95FF7B7B7BFF676767FF848484FFB2B2B2FF919191FFCACACAFFEFEFEFFF7A7A
      7AFA030303400000000000000000000000000000000000000000000000000000
      000000000000000000000000000B9F9F9FFFD9D9D9FFD7D7D7FFD4D4D4FF8585
      85FF424242FF6C6C6CFF9E9E9EFFA4A4A4FFAAAAAAFF949494FF7E7E7EFF8080
      80FF7E7E7EFF949494FFA7A7A7FFA4A4A4FF676767FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7D7D7DFFEFEFEFFFC5C5
      C5FFE0E0E0FFE0E0E0FFC9C9C9FFC3C3C3FFC2C2C2FFC3C3C3FFC3C3C3FFD2D2
      D2FFF5F5F5FFF5F5F5FF818181FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7D7D7DFFEFEFEFFFC5C5
      C5FFE0E0E0FFE0E0E0FFCACACAFFC3C3C3FFC2C2C2FFC3C3C3FFC3C3C3FFD2D2
      D2FFF5F5F5FFF5F5F5FF818181FF3F3F3FCA0000000000000000000000000000
      000000000000000000000000000000000000000000001010107B696969FF6D6D
      6DFF6E6E6EFF6D6D6DFF595959FF444444FF414141FF3E3E3EFF424242FF4141
      41FF3E3E3EFF525252FF727272FF8B8B8BFFABABABFF6F6F6FFF848484FF7979
      79FF656565FF848484FFB1B1B1FFB3B3B3FFB1B1B1FF919191FFDADADAFFE4E4
      E4FF4D4D4DDC0000001B00000000000000000000000000000000000000000000
      00000000000000000000000000089F9F9FFFDBDBDBFFD9D9D9FFD7D7D7FF8585
      85FF454545FF565656FF646464FF686868FF626262FF555555FF505050FF5C5C
      5CFF606060FF666666FF666666FF676767FF646464FF3C3C3CFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7C7C7CFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FF797979FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA7C7C7CFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FF7A7A7AFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000262626B46F6F
      6FFF686868FF464646FF3B3B3BFF5B5B5BFF898989FF9F9F9FFFA4A4A4FF9A9A
      9AFF777777FF4C4C4CFF444444FF797979FFF2F2F2FFACACACFF5D5D5DFF6363
      63FF808080FFADADADFFAFAFAFFFB1B1B1FFB9B9B9FFAEAEAEFF999999FFEBEB
      EBFFCDCDCDFF2B2B2BBD00000004000000000000000000000000000000000000
      00000000000000000000000000039F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F
      9FFF515151FF959595FFAAAAAAFFB0B0B0FF949494FF808080FF7B7B7BFFACAC
      ACFFA6A6A6FFA5A5A5FFA3A3A3FFA6A6A6FFA2A2A2FF5B5B5BFFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA757575FFF5F5F5FFC5C5
      C5FFC4C4C4FFCBCBCBFFF5F5F5FFF5F5F5FFC2C2C2FFC4C4C4FFC4C4C4FFC4C4
      C4FFF5F5F5FFF5F5F5FF737373FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA767676FFF5F5F5FFC5C5
      C5FFC4C4C4FFCCCCCCFFF5F5F5FFF5F5F5FFC2C2C2FFC4C4C4FFC4C4C4FFC4C4
      C4FFF5F5F5FFF5F5F5FF737373FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000113434
      34CC444444FF444444FF888888FFB0B0B0FFB5B5B5FFB0B0B0FFADADADFFACAC
      ACFFB1B1B1FFA5A5A5FF737373FF454545FF6E6E6EFFB5B5B5FF7B7B7BFF8181
      81FFAAAAAAFFADADADFFB0B0B0FFB2B2B2FFB6B6B6FFBEBEBEFFA5A5A5FFA3A3
      A3FFEFEFEFFFB7B7B7FF12121286000000000000000000000000000000000000
      0000000000000000000000000000000000064F4F4FFFE0E0E0FFCFCFCFFF8282
      82FF3A3A3AFF5F5F5FFF4A4A4AFF4B4B4BFF4E4E4EFF505050FF4A4A4AFF6969
      69FF666666FF666666FF676767FF626262FF636363FF3B3B3BFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000414141CA7B7B7BFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF0F0F0FFF3F3F3FFF5F5F5FFF0F0
      F0FFF5F5F5FFF5F5F5FF707070FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424242CA7C7C7CFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF0F0F0FFF3F3F3FFF5F5F5FFF0F0
      F0FFF5F5F5FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      1099444444FF919191FFB8B8B8FFADADADFFA2A2A2FF9F9F9FFF9F9F9FFFA0A0
      A0FFA1A1A1FFA5A5A5FFAAAAAAFF727272FF343434FF676767FF9D9D9DFFA9A9
      A9FFA9A9A9FFACACACFFB0B0B0FFB4B4B4FFB8B8B8FFBABABAFFC2C2C2FF9D9D
      9DFFB4B4B4FFF4F4F4FF9D9D9DFF060606530000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FF696969FF616161FF858585FF828282FF848484FF848484FF7B7B7BFFA9A9
      A9FFA9A9A9FFA8A8A8FF9E9E9EFF989898FFA0A0A0FF5F5F5FFFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000454545CA868686FFF5F5F5FFC5C5
      C5FFE0E0E0FFE0E0E0FFD2D2D2FFC3C3C3FFC3C3C3FFC9C9C9FFE0E0E0FFC4C4
      C4FFF5F5F5FFF5F5F5FF707070FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000454545CA868686FFF5F5F5FFC5C5
      C5FFE1E1E1FFE1E1E1FFD2D2D2FFC3C3C3FFC3C3C3FFCACACAFFE1E1E1FFC4C4
      C4FFF5F5F5FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000263131
      31F0787878FFBABABAFFAAAAAAFF9E9E9EFF9F9F9FFFA1A1A1FFA3A3A3FFA4A4
      A4FFA4A4A4FFA3A3A3FFA4A4A4FFA6A6A6FF555555FF4F4F4FFFA4A4A4FFA6A6
      A6FFA9A9A9FFAEAEAEFFB1B1B1FFB5B5B5FFB9B9B9FFBBBBBBFFC0C0C0FFC4C4
      C4FF959595FFCECECEFFE4E4E4FF3F3F3FD50000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF4F4F4FFF4F4F4FFF606060FF505050FF525252FF545454FF515151FF5959
      59FF5B5B5BFF575757FF5C5C5CFF606060FF414141FF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000494949CA939393FFF3F3F3FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF3F3F3FFF3F3F3FFF3F3
      F3FFF5F5F5FFF5F5F5FF6F6F6FFF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA939393FFF3F3F3FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF3F3F3FFF3F3F3FFF3F3
      F3FFF5F5F5FFF5F5F5FF6F6F6FFF3F3F3FCA0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000D0D0D904B4B
      4BFD9E9E9EF8ADADADFF9D9D9DFFA0A0A0FFA4A4A4FFA8A8A8FFAAAAAAFFABAB
      ABFFABABABFFA9A9A9FFA6A6A6FFAAAAAAFF868686FF3A3A3AFF8C8C8CFFABAB
      ABFFABABABFFAFAFAFFFB2B2B2FFB6B6B6FFB9B9B9FFBDBDBDFFC0C0C0FFC3C3
      C3FFC1C1C1FF9E9E9EFF727272DF070707590000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FF636363FF9B9B9BFFA2A2A2FF838383FF838383FF838383FF8080
      80FF939393FFAEAEAEFFA9A9A9FF9F9F9FFF5D5D5DFFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000494949CA949494FFF5F5F5FFBDBD
      BDFFBBBBBBFFDDDDDDFFBEBEBEFFDEDEDEFFDEDEDEFFD0D0D0FFBCBCBCFFBCBC
      BCFFF4F4F4FFF5F5F5FF707070FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4ACA949494FFF5F5F5FFBEBE
      BEFFBCBCBCFFDEDEDEFFBFBFBFFFDFDFDFFFDFDFDFFFD1D1D1FFBDBDBDFFBDBD
      BDFFF4F4F4FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      00000000000000000000000000000000000000000000000000001B1B1BD05B5B
      5BE9969696E59D9D9DFFA0A0A0FFA6A6A6FFACACACFFB1B1B1FFB4B4B4FFB6B6
      B6FFB4B4B4FFB1B1B1FFADADADFFAAAAAAFF9F9F9FFF434343FF646464FFADAD
      ADFFACACACFFB0B0B0FFB3B3B3FFB7B7B7FFBABABAFFBEBEBEFFC0C0C0FFC2C2
      C2FFC7C7C7FFC5C5C5FF2B2B2BA7000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF8D8D8DFF8D8D8DFF3E3E3EFF606060FF5F5F5FFF575757FF545454FF8383
      83FF575757FF616161FF626262FF3D3D3DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000474747CA8F8F8FFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FF707070FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000474747CA8F8F8FFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000005232323D76E6E
      6EEE828282D5888888EEA3A3A3FFACACACFFB4B4B4FFBABABAFFBFBFBFFFC0C0
      C0FFBEBEBEFFBABABAFFB3B3B3FFADADADFFABABABFF535353FF494949FFADAD
      ADFFADADADFFB0B0B0FFB5B5B5FFB8B8B8FFBBBBBBFFBEBEBEFFC1C1C1FFC3C3
      C3FFCCCCCCFFC9C9C9FF505050CE000000080000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FF656565FF767676FF979797FFA3A3A3FFA3A3
      A3FF9A9A9AFF808080FF5F5F5FFFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000444444CA878787FFF5F5F5FFF5F5
      F5FFF4F4F4FFF3F3F3FFF5F5F5FFF5F5F5FFF5F5F5FFF3F3F3FFF3F3F3FFF4F4
      F4FFF4F4F4FFF5F5F5FF707070FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000444444CA888888FFF5F5F5FFF5F5
      F5FFF4F4F4FFF3F3F3FFF5F5F5FFF5F5F5FFF5F5F5FFF3F3F3FFF3F3F3FFF4F4
      F4FFF4F4F4FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000005242424D77171
      71F07E7E7ED6797979D99A9A9AF5B1B1B1FFBBBBBBFFC3C3C3FFC9C9C9FFCACA
      CAFFC8C8C8FFC2C2C2FFBABABAFFB2B2B2FFAFAFAFFF5B5B5BFF474747FFADAD
      ADFFAFAFAFFFB1B1B1FFB5B5B5FFB9B9B9FFBCBCBCFFBFBFBFFFC5C5C5FFCCCC
      CCFF999999FA181818870000000E000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF505050FF474747FF3F3F3FFF3E3E
      3EFF454545FF4F4F4FFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000444444CA868686FFDFDFDFFFEDED
      EDFFE5E5E5FFE1E1E1FFE1E1E1FFE4E4E4FFDFDFDFFFE0E0E0FFDFDFDFFFBCBC
      BCFFBFBFBFFFEBEBEBFF707070FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000444444CA868686FFE0E0E0FFEDED
      EDFFE5E5E5FFE1E1E1FFE1E1E1FFE4E4E4FFE0E0E0FFE1E1E1FFE0E0E0FFBDBD
      BDFFBFBFBFFFECECECFF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000004222222D56666
      66EC7A7A7AD77A7A7AD8848484DDABABABFABFBFBFFFC9C9C9FFD2D2D2FFD4D4
      D4FFCFCFCFFFC8C8C8FFBEBEBEFFB6B6B6FFADADADFF4F4F4FFF535353FFB0B0
      B0FFB0B0B0FFB2B2B2FFB7B7B7FFB9B9B9FFBEBEBEFFC8C8C8FFB5B5B5FF4545
      45C3030303370000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000494949CA878787FFD6D6D6FFD1D1
      D1FFBCBCBCFFAFAFAFFFA8A8A8FFA8A8A8FF9E9E9EFFA8A8A8FFA3A3A3FFA2A2
      A2FF4F4F4FFFC9C9C9FF707070FF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000494949CA888888FFD7D7D7FFD1D1
      D1FFBDBDBDFFB0B0B0FFA8A8A8FFA9A9A9FF9E9E9EFFA9A9A9FFA3A3A3FFA2A2
      A2FF505050FFCACACAFF707070FF3F3F3FCA0000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F1F1FBE5C5C
      5CEF767676D67B7B7BD9808080D7939393E2BEBEBEFECDCDCDFFD6D6D6FFD8D8
      D8FFD2D2D2FFCACACAFFC0C0C0FFBABABAFF9F9F9FFF3E3E3EFF7A7A7AFFB2B2
      B2FFB0B0B0FFB3B3B3FFB7B7B7FFC0C0C0FFBFBFBFFF6F6F6FE20A0A0A600000
      0002000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000515151CA929292FFE4E4E4FFDADA
      DAFFDCDCDCFFDDDDDDFFD9D9D9FFD5D5D5FFD0D0D0FFC9C9C9FFC4C4C4FFC1C1
      C1FFBDBDBDFFD4D4D4FF6F6F6FFF646464FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000515151CA929292FFE4E4E4FFDBDB
      DBFFDCDCDCFFDEDEDEFFD9D9D9FFD5D5D5FFD0D0D0FFC9C9C9FFC4C4C4FFC1C1
      C1FFBEBEBEFFD4D4D4FF6F6F6FFF3F3F3FCA0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000606065F5757
      57FD686868D57E7E7EDA818181D9888888D7A2A2A2E9C8C8C8FFD2D2D2FFD4D4
      D4FFCFCFCFFFC8C8C8FFBEBEBEFFBDBDBDFF777777FF404040FF9F9F9FFFAFAF
      AFFFB0B0B0FFB7B7B7FFC1C1C1FFA2A2A2FF2020209B00000012000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000585858CA828282FF9B9B9BFF9292
      92FF919191FF919191FF8B8B8BFF828282FF7A7A7AFF757575FF6C6C6CFF6767
      67FF5D5D5DFF585858FF383838FF6F6F6FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000585858CA828282FF9C9C9CFF9292
      92FF919191FF919191FF8C8C8CFF828282FF7B7B7BFF767676FF6D6D6DFF6868
      68FF5E5E5EFF5A5A5AFF393939FF454545CA0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000D3030
      30D65B5B5BE9787878D5808080D9878787D98C8C8CD8AEAEAEF1C8C8C8FFCBCB
      CBFFC8C8C8FFC2C2C2FFC0C0C0FFA4A4A4FF424242FF686868FFAFAFAFFFAFAF
      AFFFB9B9B9FFAFAFAFFF4B4B4BCE040404400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6ACA757575FF7E7E7EFF6A6A
      6AFF616161FF646464FF595959FF4E4E4EFF4E4E4EFF4F4F4FFF474747FF4545
      45FF444444FF292929CA242424CAA1A1A1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6B6BCA767676FF7E7E7EFF6B6B
      6BFF616161FF646464FF5B5B5BFF4E4E4EFF4E4E4EFF4F4F4FFF484848FF4646
      46FF2A2A2ACA292929CA3B3B3BFF646464CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      03503A3A3AFD555555E17B7B7BD5868686DA878787D88C8C8CD9AFAFAFF6C0C0
      C0FFBFBFBFFFC1C1C1FFAAAAAAFF515151FF4A4A4AFF9F9F9FFFB2B2B2FFB1B1
      B1FF737373EC0D0D0D6A00000007000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F5F5FCA545454CA4E4E
      4ECA4A4A4ACA4A4A4ACA4A4A4ACA474747CA474747CA494949CA474747CA4747
      47CA474747CA454545CA515151CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000606060CA555555CA4E4E
      4ECA4A4A4ACA4B4B4BCA4A4A4ACA474747CA474747CA494949CA474747CA4747
      47CA474747CA454545CA515151CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000070707703C3C3CFF535353EA6E6E6ED5818181D6858585D58E8E8EDCB4B4
      B4FBB4B4B4FE939393FF494949FF3F3F3FFF929292FFB3B3B3FF9D9D9DFF2B2B
      2BAD0000001D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF5F5F5FFF5F5F5FFF5F5
      F5FFF4F4F4FFF4F4F4FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFD9D9D9FF555555FF00000006000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000303034B222222DA3F3F3FFE5C5C5CF6696969F66D6D6DF76767
      67FB545454FF343434FD555555FF9C9C9CFFA7A7A7FF4F4F4FD50505054C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FF555555FF555555FF5555
      55FF555555FF555555FF555555FF555555FF555555FF555555FF555555FF5555
      55FF555555FF555555FF555555FF555555FF555555FF555555FF555555FF5555
      55FF555555FF555555FF00000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000C04040457131313A5191919C1191919C21717
      17BA0A0A0A850202023D383838C36D6D6DF61212127C00000007000000000000
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
      0000000000001616168616161686161616861616168616161686161616861616
      1686161616861616168616161686323232860000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73CA737373CA313131CA313131CA313131CA313131CA313131CA313131CA3131
      31CA313131CA313131CA737373CA737373CA0000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF5858
      58FF585858FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000585858FF585858FF585858FF585858FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000777777CAC1C1C1FF828282CA848484CA818181CA777777CA787878CA7A7A
      7ACA7F7F7FCA7F7F7FCA16161686323232860000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73CA989898CA717171CA4A4A4AFF262626FF191919FF191919FF191919FF1919
      19FF191919FF727272FF313131CA737373CA0000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FF969696FF9595
      95FF939393FF909090FF8E8E8EFF8C8C8CFF8A8A8AFF888888FF878787FF8585
      85FF848484FF838383FF828282FF808080FF7E7E7EFF7C7C7CFF7B7B7BFF7A7A
      7AFF787878FF585858FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000585858FF000000000000
      00000000000000000000585858FFBBBBBBFFBABABAFF585858FF000000000000
      00000000000000000000585858FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000323232CA222222CA2525
      25CA252525CA232323CA232323CA232323CA232323CA232323CA232323CA2424
      24CA7E7E7ECACECECEFFD0D0D0FFD1D1D1FFC1C1C1FFACACACFFB6B6B6FFC3C3
      C3FF777777CAC9C9C9FF16161686323232860000000000000000000000000000
      00000000000000000000000000000000000000000000313131CA212121CA2525
      25CA252525CA232323CA232323CA232323CA232323CA232323CA232323CA2424
      24CAB3B3B3FFA4A4A4FF9C9C9CFF8A8A8AFF686868FF656565FF656565FF6363
      63FF626262FF2F2F2FFF313131CA737373CA0000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FF999999FF9797
      97FF969696FF949494FF919191FF8F8F8FFF8D8D8DFF8B8B8BFF898989FF8787
      87FF868686FF858585FF848484FF828282FF818181FF7E7E7EFF7D7D7DFF7B7B
      7BFF7A7A7AFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6EFFC3C3C3FF585858FF0000
      00000000000000000000585858FFBBBBBBFFBBBBBBFF585858FF000000000000
      000000000000585858FFB4B4B4FF585858FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B8FF333333FF343434FF3838
      38FF363636FF363636FF383838FF373737FF363636FF373737FF353535FF3232
      32FF818181CAD3D3D3FFD1D1D1FFC1C1C1FFA2A2A2FF878787FFA1A1A1FFBCBC
      BCFF777777CA777777CA16161686323232860000000000000000000000000000
      000000000000000000000000000000000000737373CA323232FF343434FF3737
      37FF353535FF353535FF373737FF363636FF353535FF363636FF343434FF3131
      31FF929292FFCFCFCFFF535353FF6E6E6EFF6A6A6AFF636363FF5F5F5FFF5A5A
      5AFF555555FF777777FF313131CA737373CA0000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FF9C9C9CFF9A9A
      9AFF989898FF969696FF959595FF929292FF909090FF8E8E8EFF8C8C8CFF8A8A
      8AFF888888FF878787FF858585FF848484FF828282FF828282FF808080FF7E7E
      7EFF7C7C7CFF585858FF00000000000000000000000000000000000000000000
      00000000000000000000000000006E6E6EFFC6C6C6FFC5C5C5FFC3C3C3FF5858
      58FF00000000585858FFBEBEBEFFBDBDBDFFBBBBBBFFBBBBBBFF585858FF0000
      0000585858FFB6B6B6FFB5B5B5FFB4B4B4FF585858FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000717171FF5A5A5AFF7B7B7BFF7373
      73FF828282FF797979FF757575FF717171FF6F6F6FFF6A6A6AFF5E5E5EFF7575
      75FF848484CACCCCCCFFB9B9B9FFB1B1B1FF969696FF858585FFABABABFFBEBE
      BEFFAAAAAAFF727272CA16161686323232860000000000000000000000000000
      000000000000000000000000000000000000464646CA5A5A5AFF7B7B7BFF7272
      72FF818181FF797979FF747474FF707070FF6E6E6EFF696969FF5E5E5EFF7474
      74FFBDBDBDFF6E6E6EFF818181FF5C5C5CFF333333FF333333FF323232FF3232
      32FF323232FF373737FF313131CA737373CA626262FF5F5F5FFF5F5F5FFF5F5F
      5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F
      5FFF5F5F5FFF5F5F5FFF5F5F5FFF969696FF939393FFAEAEAEFF979797FF9595
      95FF8B8B8BFF898989FF878787FF868686FF9B9B9BFF949494FF949494FF8181
      81FF7E7E7EFF585858FF00000000000000000000000000000000000000000000
      00000000000000000000000000006E6E6EFFC8C8C8FFC6C6C6FFC5C5C5FFC3C3
      C3FF585858FFC1C1C1FFBFBFBFFFBEBEBEFFBDBDBDFFBBBBBBFFBBBBBBFF5858
      58FFB8B8B8FFB7B7B7FFB6B6B6FFB5B5B5FF585858FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000666666FF5F5F5FFF848484FF7272
      72FF8E8E8EFF7C7C7CFF757575FF727272FF707070FF6B6B6BFF585858FF7E7E
      7EFF868686CAB2B2B2FFAEAEAEFFD7D7D7FFC2C2C2FF969696FFA9A9A9FFC3C3
      C3FFB7B7B7FF7E7E7ECA16161686323232860000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA5F5F5FFF838383FF7171
      71FF8E8E8EFF7C7C7CFF757575FF717171FF6F6F6FFF6A6A6AFF585858FF7E7E
      7EFF626262FFC9C9C9FF929292FFBBBBBBFF9C9C9CFF959595FF8E8E8EFF8888
      88FF818181FF414141FF313131CA737373CA626262FFC3C3C3FFBFBFBFFFB8B8
      B8FFB2B2B2FFAAAAAAFFA2A2A2FF9A9A9AFF929292FF8A8A8AFF828282FF7979
      79FF737373FF6E6E6EFF5F5F5FFF989898FF969696FFACACACFFDBDBDBFFCECE
      CEFF969696FF959595FF9E9E9EFFA8A8A8FFC7C7C7FFCFCFCFFF949494FF8282
      82FF828282FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6EFFC8C8C8FFC6C6C6FFC5C5
      C5FFC3C3C3FFC2C2C2FFC1C1C1FFBFBFBFFFBEBEBEFFBDBDBDFFBBBBBBFFBBBB
      BBFFBABABAFFB8B8B8FFB7B7B7FF585858FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6AFF6F6F6FFF8C8C8CFF7575
      75FF676767FF6A6A6AFF717171FF737373FF747474FF6E6E6EFF606060FF5757
      57FF8A8A8ACAC4C4C4FFC0C0C0FFC8C8C8FFDADADAFFA8A8A8FFA8A8A8FFA9A9
      A9FFB9B9B9FF7F7F7FCA16161686323232860000000000000000000000000000
      000000000000000000000000000000000000424242CA6F6F6FFF8C8C8CFF7474
      74FF666666FF6A6A6AFF707070FF727272FF737373FF6E6E6EFF5F5F5FFF5757
      57FFCECECEFF929292FF3D3D3DFF202020FF090909FF090909FF090909FF0909
      09FF090909FF666666FF313131CA737373CA626262FFC4C4C4FFBFBFBFFFBABA
      BAFFB3B3B3FFACACACFFA5A5A5FF9B9B9BFF939393FF8B8B8BFF838383FF7B7B
      7BFF747474FF6E6E6EFF5F5F5FFF9B9B9BFF9B9B9BFFA4A4A4FFD6D6D6FFDCDC
      DCFFDADADAFFC7C7C7FFC5C5C5FFD4D4D4FFD3D3D3FFCCCCCCFF999999FF8787
      87FF838383FF585858FF00000000000000000000000000000000000000000000
      0000585858FF585858FF00000000000000006E6E6EFFC9C9C9FFC8C8C8FFC6C6
      C6FFC5C5C5FFC3C3C3FFC2C2C2FFC1C1C1FFBFBFBFFFB4B4B4FFB2B2B2FFB1B1
      B1FFB0B0B0FFBABABAFFB8B8B8FF585858FF0000000000000000585858FF5858
      58FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000707070FF757575FF8E8E8EFF7D7D
      7DFF757575FF777777FF7A7A7AFF787878FF7A7A7AFF767676FF696969FF6464
      64FF8A8A8ACAD8D8D8FFBFBFBFFFC0C0C0FFD9D9D9FFADADADFF7E7E7EFF8989
      89FFA5A5A5FF797979CA16161686323232860000000000000000000000000000
      000000000000000000000000000000000000454545CA757575FF8E8E8EFF7D7D
      7DFF747474FF767676FF797979FF787878FF797979FF757575FF696969FF6363
      63FF828282FF949494FF878787FF7C7C7CFF353535FF333333FF313131FF3030
      30FF2D2D2DFF1E1E1EFF313131CA737373CA626262FFC5C5C5FFC1C1C1FFBBBB
      BBFFB5B5B5FFAEAEAEFFA5A5A5FF9E9E9EFF969696FF8D8D8DFF858585FF7C7C
      7CFF767676FF6F6F6FFF5F5F5FFF9E9E9EFF9C9C9CFFA3A3A3FFD1D1D1FFDCDC
      DCFFDADADAFFDADADAFFD8D8D8FFD4D4D4FFD3D3D3FFC8C8C8FF9F9F9FFF8686
      86FF858585FF585858FF00000000000000000000000000000000000000006E6E
      6EFFD0D0D0FFCFCFCFFF585858FF585858FFCCCCCCFFCBCBCBFFC9C9C9FFC8C8
      C8FFC6C6C6FFC5C5C5FFC3C3C3FFC2C2C2FFB6B6B6FFA0A0A0FFA0A0A0FF9F9F
      9FFFA9A9A9FFB0B0B0FFBABABAFFB8B8B8FF585858FF585858FFB5B5B5FFB4B4
      B4FF585858FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6EFF494949FF585858FF5E5E
      5EFF5A5A5AFF626262FF737373FF656565FF5F5F5FFF494949FF363636FF3131
      31FF878787CADDDDDDFFC3C3C3FFD4D4D4FFD6D6D6FF868686FF8B8B8BFFA7A7
      A7FFBDBDBDFF787878CA16161686323232860000000000000000000000000000
      000000000000000000000000000000000000444444CA494949FF585858FF5E5E
      5EFF5A5A5AFF616161FF727272FF646464FF5F5F5FFF494949FF353535FF3030
      30FF929292FFCECECEFF4D4D4DFF818181FF767676FF6C6C6CFF666666FF6161
      61FF575757FF353535FF313131CA737373CA626262FF626262FF626262FF6262
      62FF626262FF626262FF626262FF626262FF626262FF626262FF626262FF6262
      62FF626262FF626262FF626262FFA1A1A1FF9F9F9FFFA8A8A8FFC9C9C9FFE0E0
      E0FFDCDCDCFFDADADAFFD7D7D7FFD6D6D6FFD6D6D6FFC0C0C0FFA3A3A3FF8989
      89FF878787FF585858FF000000000000000000000000000000006E6E6EFFD3D3
      D3FFD2D2D2FFD0D0D0FFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFFCBCBCBFFC9C9
      C9FFC8C8C8FFC6C6C6FFC5C5C5FFC3C3C3FFC2C2C2FFC1C1C1FFBFBFBFFF8B8B
      8BFF8A8A8AFFA9A9A9FFB0B0B0FFBABABAFFB8B8B8FFB7B7B7FFB6B6B6FFB5B5
      B5FFB4B4B4FF585858FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000666666FF535353FFB7B7B7FF9898
      98FF979797FF9C9C9CFFA1A1A1FF9F9F9FFF9D9D9DFF999999FF959595FF9595
      95FF828282CAD9D9D9FFCECECEFFB2B2B2FFAFAFAFFFBABABAFFCACACAFFCCCC
      CCFFC6C6C6FF777777CA16161686323232860000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA515151FFB6B6B6FF9797
      97FF969696FF9C9C9CFFA1A1A1FF9F9F9FFF9D9D9DFF989898FF949494FF9494
      94FFC0C0C0FF525252FF5F5F5FFF8A8A8AFF3F3F3FFF272727FF272727FF2626
      26FF323232FFA9A9A9FF737373CA000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFAFAFAFFFADAD
      ADFFAAAAAAFFA8A8A8FFA6A6A6FFA4A4A4FFA2A2A2FFA6A6A6FFDADADAFFE4E4
      E4FFDFDFDFFFDCDCDCFFD9D9D9FFD7D7D7FFD7D7D7FFCBCBCBFF959595FF8C8C
      8CFF8A8A8AFF585858FF00000000000000000000000000000000000000006E6E
      6EFFD3D3D3FFD2D2D2FFD0D0D0FFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFFCBCB
      CBFFC9C9C9FFC8C8C8FF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFFC1C1C1FFBFBF
      BFFFBEBEBEFF7B7B7BFFA9A9A9FFB0B0B0FFBABABAFFB8B8B8FFB7B7B7FFB6B6
      B6FF6E6E6EFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000646464FF767676FF808080FF1515
      15FF1C1C1CFF1C1C1CFF1B1B1BFF1C1C1CFF1D1D1DFF1C1C1CFF1C1C1CFF1E1E
      1EFF818181CA848484CA868686CA7B7B7BCA818181CA838383CA818181CA7E7E
      7ECA797979CA767676CA00000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3ECA757575FF808080FF1414
      14FF1C1C1CFF1C1C1CFF1B1B1BFF1C1C1CFF1D1D1DFF1C1C1CFF1C1C1CFF1E1E
      1EFF3F3F3FFF2C2C2CFF535353FF434343FF282828FF272727FF272727FF2727
      27FFA8A8A8FF737373CA00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFB1B1B1FFB0B0
      B0FFAEAEAEFFABABABFFA9A9A9FFA7A7A7FFA5A5A5FFDCDCDCFFEBEBEBFFE6E6
      E6FFE4E4E4FFE1E1E1FFDCDCDCFFDADADAFFD7D7D7FFD8D8D8FFC9C9C9FF9595
      95FF8D8D8DFF585858FF00000000000000000000000000000000000000000000
      00006E6E6EFFD3D3D3FFD2D2D2FFD0D0D0FFCFCFCFFFCECECEFFCDCDCDFFCCCC
      CCFFCBCBCBFF7E7E7EFF000000000000000000000000000000007E7E7EFFC1C1
      C1FFBFBFBFFFBEBEBEFF7B7B7BFFA9A9A9FFB0B0B0FFBABABAFFB8B8B8FF6E6E
      6EFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000646464FF767676FFDDDDDDFFE4E4
      E4FFF5F5F5FFF5F5F5FFF4F4F4FFF5F5F5FFF4F4F4FFF5F5F5FFF5F5F5FFE9E9
      E9FFDFDFDFFFD7D7D7FF808080FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3ECA757575FFDDDDDDFFE3E3
      E3FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF3F3F3FFF4F4F4FFF4F4F4FFE8E8
      E8FFDFDFDFFFD6D6D6FF808080FF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFB5B5B5FFB2B2
      B2FFB1B1B1FFAFAFAFFFACACACFFA9A9A9FFDFDFDFFFF3F3F3FFEDEDEDFFEBEB
      EBFFE8E8E8FFE5E5E5FFE1E1E1FFDCDCDCFFDADADAFFD7D7D7FFD9D9D9FFC9C9
      C9FF959595FF585858FF00000000000000000000000000000000000000000000
      0000000000006E6E6EFFD3D3D3FFD2D2D2FFD0D0D0FFCFCFCFFFCECECEFFCDCD
      CDFF7E7E7EFF0000000000000000000000000000000000000000000000007E7E
      7EFFC1C1C1FFBFBFBFFFBEBEBEFF7B7B7BFFB1B1B1FFBBBBBBFF585858FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000646464FF787878FFE2E2E2FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF4F4F4FFF5F5
      F5FFEAEAEAFFDDDDDDFF898989FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3ECA777777FFE2E2E2FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF3F3F3FFF4F4
      F4FFEAEAEAFFDDDDDDFF888888FF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFB7B7B7FFB5B5
      B5FFB3B3B3FFB1B1B1FFAEAEAEFFC7C7C7FFECECECFFEFEFEFFFF3F3F3FFF3F3
      F3FFEDEDEDFFE9E9E9FFE5E5E5FFE1E1E1FFDFDFDFFFDBDBDBFFD5D5D5FFCFCF
      CFFFB7B7B7FF919191FF00000000000000000000000000000000000000000000
      0000585858FFD6D6D6FFD4D4D4FFD3D3D3FFD2D2D2FFD0D0D0FFCFCFCFFF5858
      58FF000000000000000000000000000000000000000000000000000000000000
      00007E7E7EFFC1C1C1FFBFBFBFFF7B7B7BFFA9A9A9FFB1B1B1FFBBBBBBFF5858
      58FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000646464FF787878FFEEEEEEFFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFF5F5F5FFEEEEEEFF8A8A8AFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3ECA777777FFEEEEEEFFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFEEEEEEFF8A8A8AFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFBABABAFFB8B8
      B8FFB6B6B6FFB5B5B5FFBCBCBCFFB3B3B3FFADADADFFADADADFFB4B4B4FFC9C9
      C9FFF0F0F0FFEDEDEDFFE9E9E9FFE4E4E4FFBFBFBFFFACACACFFA4A4A4FFA4A4
      A4FFA7A7A7FF585858FF000000000000000000000000585858FF585858FF5858
      58FFD9D9D9FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FFD2D2D2FF585858FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7EFFC1C1C1FFBFBFBFFF8A8A8AFFB2B2B2FFBBBBBBFFBBBB
      BBFF585858FF585858FF585858FF000000000000000000000000000000000000
      000000000000000000000000000000000000646464FF787878FFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF4F4F4FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF3F3
      F3FFF5F5F5FFF5F5F5FF888888FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3ECA787878FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF3F3F3FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF3F3
      F3FFF4F4F4FFF4F4F4FF878787FF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFBEBEBEFFBBBB
      BBFFB9B9B9FFB7B7B7FFB5B5B5FFB3B3B3FFB1B1B1FFB2B2B2FFB6B6B6FFA8A8
      A8FFDCDCDCFFF3F3F3FFEEEEEEFFD2D2D2FF989898FF9E9E9EFFA0A0A0FF9B9B
      9BFF989898FF585858FF000000000000000000000000666666FFDCDCDCFFDBDB
      DBFFDADADAFFD9D9D9FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FF585858FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7EFFC2C2C2FFC1C1C1FF9F9F9FFFBEBEBEFFBDBDBDFFBBBB
      BBFFBBBBBBFFBABABAFF585858FF000000000000000000000000000000000000
      000000000000000000000000000000000000646464FF7D7D7DFFEEEEEEFFC5C5
      C5FFE0E0E0FFE0E0E0FFCACACAFFC3C3C3FFC2C2C2FFC3C3C3FFC3C3C3FFD2D2
      D2FFF5F5F5FFF5F5F5FF818181FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3ECA7D7D7DFFEEEEEEFFC4C4
      C4FFE0E0E0FFE0E0E0FFC9C9C9FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFD2D2
      D2FFF4F4F4FFF4F4F4FF808080FF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFC1C1C1FFBFBF
      BFFFBCBCBCFFBABABAFFB8B8B8FFB6B6B6FFB5B5B5FFB2B2B2FFB0B0B0FFB9B9
      B9FFB3B3B3FFF4F4F4FFEFEFEFFFA2A2A2FFA4A4A4FFA2A2A2FF9F9F9FFF9D9D
      9DFF9C9C9CFF585858FF000000000000000000000000696969FFDDDDDDFFDCDC
      DCFFDBDBDBFFDADADAFFD9D9D9FFD7D7D7FFE2E2E2FFD4D4D4FF585858FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7EFFC3C3C3FFC2C2C2FFB6B6B6FFBFBFBFFFBEBEBEFFBDBD
      BDFFBBBBBBFFBBBBBBFF585858FF000000000000000000000000000000000000
      000000000000000000000000000000000000646464FF7C7C7CFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FF797979FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3ECA7C7C7CFFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FF797979FF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFC4C4C4FFC2C2
      C2FFC0C0C0FFBDBDBDFFBBBBBBFFB9B9B9FFB7B7B7FFB5B5B5FFB3B3B3FFB1B1
      B1FFABABABFFE3E3E3FFE0E0E0FFA9A9A9FFA6A6A6FFA5A5A5FFA3A3A3FFA0A0
      A0FF9E9E9EFF585858FF000000000000000000000000696969FF696969FF6969
      69FFDCDCDCFFDBDBDBFFDADADAFFE4E4E4FFE3E3E3FFD6D6D6FF585858FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7EFFC5C5C5FFC3C3C3FFC2C2C2FFC1C1C1FFBFBFBFFFBEBE
      BEFF6E6E6EFF6E6E6EFF6E6E6EFF000000000000000000000000000000000000
      000000000000000000000000000000000000656565FF767676FFF5F5F5FFC5C5
      C5FFC4C4C4FFCBCBCBFFF5F5F5FFF5F5F5FFC2C2C2FFC4C4C4FFC4C4C4FFC4C4
      C4FFF5F5F5FFF5F5F5FF737373FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FCA757575FFF4F4F4FFC4C4
      C4FFC3C3C3FFCBCBCBFFF4F4F4FFF4F4F4FFC2C2C2FFC3C3C3FFC3C3C3FFC3C3
      C3FFF4F4F4FFF4F4F4FF727272FF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFC5C5C5FFC4C4
      C4FFC3C3C3FFC1C1C1FFBEBEBEFFBCBCBCFFBABABAFFB8B8B8FFB6B6B6FFB4B4
      B4FFBCBCBCFFB6B6B6FFB5B5B5FFACACACFFAAAAAAFFA7A7A7FFA5A5A5FFA4A4
      A4FFA1A1A1FF585858FF00000000000000000000000000000000000000000000
      0000696969FFDCDCDCFFDBDBDBFFE5E5E5FFE7E7E7FFD7D7D7FFD6D6D6FF5858
      58FF000000000000000000000000000000000000000000000000000000000000
      00007E7E7EFFC8C8C8FFC6C6C6FFC5C5C5FFC3C3C3FFC2C2C2FFC1C1C1FF5858
      58FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000696969FF7B7B7BFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF0F0F0FFF3F3F3FFF5F5F5FFF0F0
      F0FFF5F5F5FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000414141CA7B7B7BFFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF0F0F0FFF3F3F3FFF4F4F4FFF0F0
      F0FFF4F4F4FFF4F4F4FF6F6F6FFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFC8C8C8FFC6C6
      C6FFC4C4C4FFC4C4C4FFC2C2C2FFC0C0C0FFBDBDBDFFBBBBBBFFB9B9B9FFB7B7
      B7FFB5B5B5FFB8B8B8FFB7B7B7FFAFAFAFFFADADADFFABABABFFA8A8A8FFA6A6
      A6FFA5A5A5FF585858FF00000000000000000000000000000000000000000000
      000000000000696969FFDCDCDCFFDEDEDEFFEAEAEAFFF0F0F0FFD7D7D7FFD6D6
      D6FF585858FF0000000000000000000000000000000000000000000000005858
      58FFCBCBCBFFC9C9C9FFC8C8C8FFC6C6C6FFC5C5C5FFC3C3C3FF585858FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6F6FFF868686FFF5F5F5FFC5C5
      C5FFE0E0E0FFE0E0E0FFD2D2D2FFC3C3C3FFC3C3C3FFCACACAFFE0E0E0FFC4C4
      C4FFF5F5F5FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000454545CA858585FFF4F4F4FFC4C4
      C4FFE0E0E0FFE0E0E0FFD2D2D2FFC2C2C2FFC2C2C2FFC9C9C9FFE0E0E0FFC3C3
      C3FFF4F4F4FFF4F4F4FF6F6F6FFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFCACACAFFC9C9
      C9FFC7C7C7FFC5C5C5FFC4C4C4FFC3C3C3FFC1C1C1FFBEBEBEFFBCBCBCFFBABA
      BAFFB8B8B8FFB6B6B6FFB4B4B4FFB2B2B2FFB0B0B0FFAEAEAEFFACACACFFAAAA
      AAFFA7A7A7FF585858FF00000000000000000000000000000000000000000000
      0000696969FFDEDEDEFFDDDDDDFFDCDCDCFFE6E6E6FFFBFBFBFFE0E0E0FFD7D7
      D7FFD6D6D6FF585858FF00000000000000000000000000000000585858FFCDCD
      CDFFCCCCCCFFCBCBCBFFC9C9C9FFC8C8C8FFC6C6C6FFC5C5C5FFC3C3C3FF5858
      58FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000757575FF939393FFF3F3F3FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF3F3F3FFF3F3F3FFF3F3
      F3FFF5F5F5FFF5F5F5FF6F6F6FFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000494949CA929292FFF3F3F3FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF3F3F3FFF3F3F3FFF3F3
      F3FFF4F4F4FFF4F4F4FF6F6F6FFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFCDCDCDFFCBCB
      CBFFA4A4A4FF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFFADAD
      ADFFABABABFF585858FF00000000000000000000000000000000000000006969
      69FFDFDFDFFFDFDFDFFFDEDEDEFFDDDDDDFFDCDCDCFFE6E6E6FFFBFBFBFFE0E0
      E0FFD7D7D7FFD6D6D6FF585858FF585858FF585858FF585858FFCFCFCFFFCECE
      CEFFCDCDCDFFCCCCCCFFCBCBCBFFC9C9C9FFC8C8C8FFC6C6C6FFC5C5C5FFC3C3
      C3FF585858FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000757575FF949494FFF5F5F5FFBDBD
      BDFFBBBBBBFFDDDDDDFFBEBEBEFFDEDEDEFFDEDEDEFFD0D0D0FFBCBCBCFFBCBC
      BCFFF4F4F4FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000494949CA939393FFF4F4F4FFBDBD
      BDFFBBBBBBFFDDDDDDFFBEBEBEFFDEDEDEFFDEDEDEFFD0D0D0FFBCBCBCFFBCBC
      BCFFF3F3F3FFF4F4F4FF6F6F6FFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFCFCFCFFFCDCD
      CDFFA4A4A4FFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF7E7E7EFFB0B0
      B0FFAEAEAEFF585858FF00000000000000000000000000000000696969FFE1E1
      E1FFE0E0E0FFDFDFDFFFDFDFDFFFDEDEDEFFDDDDDDFFDCDCDCFFE6E6E6FFFBFB
      FBFFE7E7E7FFDFDFDFFFD6D6D6FFD4D4D4FFD3D3D3FFD2D2D2FFD0D0D0FFCFCF
      CFFFCECECEFFCDCDCDFFCCCCCCFFCBCBCBFFC9C9C9FFC8C8C8FFC6C6C6FFC5C5
      C5FFC3C3C3FF585858FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000727272FF8F8F8FFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000474747CA8F8F8FFFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FF6F6F6FFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD1D1D1FFD0D0
      D0FFA4A4A4FFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF7E7E7EFFB3B3
      B3FFB1B1B1FF585858FF00000000000000000000000000000000000000006969
      69FFE1E1E1FFE0E0E0FF6E6E6EFF6E6E6EFFDEDEDEFFDDDDDDFFDCDCDCFFDBDB
      DBFFFBFBFBFFF0F0F0FFE3E3E3FFDEDEDEFFE1E1E1FFD3D3D3FFD2D2D2FFD0D0
      D0FFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFF6E6E6EFF6E6E6EFFC8C8C8FFC6C6
      C6FF6E6E6EFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFF888888FFF5F5F5FFF5F5
      F5FFF4F4F4FFF3F3F3FFF5F5F5FFF5F5F5FFF5F5F5FFF3F3F3FFF3F3F3FFF4F4
      F4FFF4F4F4FFF5F5F5FF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000444444CA878787FFF4F4F4FFF4F4
      F4FFF3F3F3FFF2F2F2FFF4F4F4FFF4F4F4FFF4F4F4FFF2F2F2FFF2F2F2FFF3F3
      F3FFF3F3F3FFF4F4F4FF6F6F6FFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD3D3D3FFD2D2
      D2FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFB6B6
      B6FFB4B4B4FF585858FF00000000000000000000000000000000000000000000
      0000696969FF696969FF00000000000000006E6E6EFFDEDEDEFFDDDDDDFFDCDC
      DCFFDBDBDBFFDADADAFFE3E3E3FFE3E3E3FFD6D6D6FFD4D4D4FFD3D3D3FFD2D2
      D2FFD0D0D0FFCFCFCFFFCECECEFF585858FF00000000000000006E6E6EFF6E6E
      6EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6EFF868686FFDFDFDFFFEDED
      EDFFE5E5E5FFE1E1E1FFE1E1E1FFE4E4E4FFDFDFDFFFE0E0E0FFDFDFDFFFBCBC
      BCFFBFBFBFFFEBEBEBFF707070FF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000444444CA858585FFDFDFDFFFECEC
      ECFFE4E4E4FFE1E1E1FFE1E1E1FFE3E3E3FFDFDFDFFFE0E0E0FFDFDFDFFFBCBC
      BCFFBEBEBEFFEBEBEBFF6F6F6FFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD5D5D5FFD4D4
      D4FFD3D3D3FFD1D1D1FFD0D0D0FFCECECEFFCDCDCDFFCBCBCBFFC9C9C9FFC8C8
      C8FFC6C6C6FFC4C4C4FFC3C3C3FFC1C1C1FFBFBFBFFFBDBDBDFFBBBBBBFFB9B9
      B9FFB7B7B7FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6EFFDFDFDFFFDEDEDEFFDDDD
      DDFFDCDCDCFFDBDBDBFFDADADAFFD9D9D9FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3
      D3FFD2D2D2FFD0D0D0FFCFCFCFFF585858FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000747474FF888888FFD6D6D6FFD1D1
      D1FFBCBCBCFFAFAFAFFFA8A8A8FFA9A9A9FF9E9E9EFFA9A9A9FFA3A3A3FFA2A2
      A2FF4F4F4FFFCACACAFF6F6F6FFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000484848CA878787FFD6D6D6FFD0D0
      D0FFBCBCBCFFAFAFAFFFA7A7A7FFA8A8A8FF9D9D9DFFA8A8A8FFA2A2A2FFA1A1
      A1FF4F4F4FFFC9C9C9FF6F6F6FFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD7D7D7FFD6D6
      D6FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1D1FFCFCFCFFFCDCDCDFFCCCCCCFFCACA
      CAFFC8C8C8FFC6C6C6FFC4C4C4FFC4C4C4FFC2C2C2FFC0C0C0FFBEBEBEFFBCBC
      BCFFBABABAFF585858FF00000000000000000000000000000000000000000000
      00000000000000000000000000006E6E6EFFE0E0E0FFDFDFDFFFDFDFDFFFDEDE
      DEFF6E6E6EFFDCDCDCFFDBDBDBFFDADADAFFD9D9D9FFD7D7D7FFD6D6D6FF6E6E
      6EFFD3D3D3FFD2D2D2FFD0D0D0FFCFCFCFFF585858FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000838383FF929292FFE4E4E4FFDADA
      DAFFDCDCDCFFDDDDDDFFD9D9D9FFD5D5D5FFD0D0D0FFC9C9C9FFC4C4C4FFC1C1
      C1FFBDBDBDFFD4D4D4FF6F6F6FFF3F3F3FCA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000505050CA919191FFE3E3E3FFDADA
      DAFFDCDCDCFFDDDDDDFFD9D9D9FFD4D4D4FFD0D0D0FFC9C9C9FFC3C3C3FFC0C0
      C0FFBDBDBDFFD3D3D3FF6F6F6FFF3E3E3ECA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD9D9D9FFD8D8
      D8FFD6D6D6FFD5D5D5FFD3D3D3FFD3D3D3FFD1D1D1FFD0D0D0FFCECECEFFCCCC
      CCFFCBCBCBFFC9C9C9FFC7C7C7FFC5C5C5FFC4C4C4FFC3C3C3FFC1C1C1FFBFBF
      BFFFBDBDBDFF585858FF00000000000000000000000000000000000000000000
      00000000000000000000000000006E6E6EFFE1E1E1FFE0E0E0FFDFDFDFFF6E6E
      6EFF000000006E6E6EFFDCDCDCFFDBDBDBFFDADADAFFD9D9D9FF585858FF0000
      00006E6E6EFFD3D3D3FFD2D2D2FFD0D0D0FF585858FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E8E8EFF828282FF9B9B9BFF9292
      92FF919191FF919191FF8B8B8BFF828282FF7A7A7AFF767676FF6C6C6CFF6868
      68FF5D5D5DFF585858FF383838FF454545CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000585858CA818181FF9B9B9BFF9191
      91FF919191FF919191FF8B8B8BFF818181FF7A7A7AFF757575FF6C6C6CFF6767
      67FF5D5D5DFF585858FF383838FF454545CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFDBDBDBFFD9D9
      D9FFD8D8D8FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FFD2D2D2FFD0D0D0FFCFCF
      CFFFCDCDCDFFCCCCCCFFCACACAFFC8C8C8FFC6C6C6FFC4C4C4FFC4C4C4FFC2C2
      C2FFC0C0C0FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006E6E6EFFE1E1E1FF6E6E6EFF0000
      000000000000000000006E6E6EFFDCDCDCFFDBDBDBFF585858FF000000000000
      0000000000006E6E6EFFD3D3D3FF6E6E6EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AAAAAAFF757575FF7E7E7EFF6A6A
      6AFF616161FF646464FF595959FF4E4E4EFF4E4E4EFF4F4F4FFF474747FF4545
      45FF444444FF424242FF3A3A3AFF646464CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6ACA757575FF7E7E7EFF6A6A
      6AFF606060FF636363FF595959FF4E4E4EFF4E4E4EFF4F4F4FFF474747FF4545
      45FF434343FF414141FF3A3A3AFF646464CA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFDCDCDCFFDBDB
      DBFFDADADAFFD9D9D9FFD8D8D8FFD6D6D6FFD5D5D5FFD3D3D3FFD3D3D3FFD1D1
      D1FFD0D0D0FFCECECEFFCCCCCCFFCBCBCBFFC9C9C9FFC7C7C7FFC5C5C5FFC4C4
      C4FFC3C3C3FF585858FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E6E6EFF000000000000
      000000000000000000006E6E6EFFDDDDDDFFDCDCDCFF585858FF000000000000
      000000000000000000006E6E6EFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009A9A9AFF888888FF7C7C
      7CFF767676FF787878FF767676FF737373FF737373FF747474FF737373FF7272
      72FF737373FF6F6F6FFF838383FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F5F5FCA545454CA4E4E
      4ECA4A4A4ACA4A4A4ACA4A4A4ACA474747CA474747CA484848CA474747CA4747
      47CA474747CA454545CA505050CA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF000000000000
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
      0000000000000000000000000000595959FF595959FF595959FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000030000000B00000013000000160000001600000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      0016000000130000000B00000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000595959FF000000000000000000000000595959FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D8D8DFFC0C0C0FFBDBDBDFFBABABAFF8D8D8DFF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF5858
      58FF585858FF585858FF00000000000000000000000000000000000000000000
      00000000000000000000A5A5A5FF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFB6B6B6FFB6B6
      B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
      B6FFB6B6B6FF0000000000000000000000000000000000000000000000000000
      0003000000110000002300000030000000350000003500000035000000350000
      0035000000350000003500000035000000350000003500000035000000350000
      0035000000350000003500000035000000350000003500000035000000350000
      0035000000300000002300000011000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000595959FF000000000000000000000000595959FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D8D8DFFC3C3C3FFC0C0C0FFBDBDBDFF8D8D8DFF969696FF9494
      94FF939393FF909090FF8E8E8EFF8C8C8CFF8A8A8AFF898989FF888888FF8686
      86FF848484FF838383FF818181FF808080FF7E7E7EFF7C7C7CFF7B7B7BFF7A7A
      7AFF797979FF585858FF00000000000000000000000000000000000000000000
      00000000000000000000A5A5A5FFDADADAFFD8D8D8FFD6D6D6FFD4D4D4FFD2D2
      D2FFD0D0D0FFCFCFCFFFCDCDCDFFCBCBCBFFC9C9C9FF6D6D6DFFCECECEFFCECE
      CEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECE
      CEFFB6B6B6FF0000000000000000000000000000000000000000000000030000
      001500000051555555FF555555FF555555FF555555FF555555FF555555FF5959
      59FF595959FF595959FF595959FF585858FF595959FF595959FF595959FF5959
      59FF595959FF595959FF555555FF555555FF555555FF555555FF555555FF5555
      55FF555555FF000000710000001D000000080000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000595959FF000000000000000000000000595959FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D8D8DFFC5C5C5FFC3C3C3FFC0C0C0FF8D8D8DFF999999FF9797
      97FF959595FF939393FF919191FF8F8F8FFF8D8D8DFF8B8B8BFF8A8A8AFF8888
      88FF878787FF858585FF848484FF818181FF808080FF7E7E7EFF7D7D7DFF7B7B
      7BFF7A7A7AFF585858FF00000000000000000000000000000000000000000000
      00000000000000000000A5A5A5FFDBDBDBFFD9D9D9FFD7D7D7FFD5D5D5FFD3D3
      D3FFD1D1D1FFCFCFCFFFCFCFCFFFCDCDCDFFCBCBCBFF6D6D6DFF595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FFCECECEFFCECE
      CEFFB6B6B6FF0000000000000000000000000000000000000000000000080000
      0046555555FF6B6B6BFF6B6B6BFF6B6B6BFF555555FFE5E5E5FFE5E5E5FFE5E5
      E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5
      E5FFE5E5E5FF555555FF6B6B6BFF6B6B6BFF6B6B6BFF6B6B6BFF6B6B6BFF6B6B
      6BFF6B6B6BFF555555FF000000260000000B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000595959FF595959FF595959FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D8D8DFFC8C8C8FFC5C5C5FFC3C3C3FF8D8D8DFF9C9C9CFF9A9A
      9AFF989898FF969696FF949494FF929292FF909090FF8E8E8EFF8C8C8CFF8A8A
      8AFF898989FF888888FF868686FF848484FF828282FF818181FF808080FF7E7E
      7EFF7C7C7CFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFDADADAFFD8D8D8FFD6D6D6FFD4D4
      D4FFD2D2D2FFD0D0D0FFCFCFCFFFCECECEFFCCCCCCFF6D6D6DFF979797FF9595
      95FF939393FF939393FF919191FF909090FF8E8E8EFF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FF555555FFE5E5E5FFD6D6D6FF5555
      55FF555555FF555555FF555555FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
      D6FFE5E5E5FF555555FF6B6B6BFF6B6B6BFF6B6B6BFF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000595959FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7A7A7FF8D8D8DFF8D8D8DFF8D8D
      8DFF8D8D8DFF8D8D8DFFCBCBCBFFC8C8C8FFC5C5C5FF8D8D8DFF8D8D8DFF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF959595FF939393FFAEAEAEFF979797FF9696
      96FF8B8B8BFF8A8A8AFF888888FF878787FF9B9B9BFF949494FF949494FF8080
      80FF7E7E7EFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FF6D6D6DFFDADADAFFD7D7D7FFD5D5
      D5FFD3D3D3FF6D6D6DFF6D6D6DFFCFCFCFFFCDCDCDFF6D6D6DFF9B9B9BFF9999
      99FF969696FF959595FF939393FF929292FF919191FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FF555555FFE5E5E5FFD6D6D6FF5555
      55FFA3A3A3FFA3A3A3FF555555FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
      D6FFE5E5E5FF555555FF6B6B6BFF6B6B6BFF6B6B6BFF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B0000000000000000595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF0000000000000000A7A7A7FFDCDCDCFFDADADAFFD7D7
      D7FFD4D4D4FFD1D1D1FFCECECEFFCBCBCBFFC8C8C8FFC5C5C5FFC3C3C3FFC0C0
      C0FFBDBDBDFFBABABAFF8D8D8DFF989898FF969696FFACACACFFDCDCDCFFCECE
      CEFF969696FF969696FF9E9E9EFFA8A8A8FFC6C6C6FFD0D0D0FF949494FF8282
      82FF818181FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFDDDDDDFF6D6D6DFFD9D9D9FFD7D7
      D7FFA5A5A5FFD2D2D2FFD0D0D0FF6D6D6DFFCECECEFF6D6D6DFF9F9F9FFF9C9C
      9CFF9A9A9AFF989898FF969696FF949494FF939393FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FF555555FFE5E5E5FFD6D6D6FF5555
      55FFA3A3A3FFA3A3A3FF555555FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
      D6FFE5E5E5FF555555FF6B6B6BFF6B6B6BFF6B6B6BFF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B0000000000000000A5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FF0000000000000000A7A7A7FFDFDFDFFFDCDCDCFFDADA
      DAFFD7D7D7FFD4D4D4FFD1D1D1FFCECECEFFCBCBCBFFC8C8C8FFC5C5C5FFC3C3
      C3FFC0C0C0FFBDBDBDFF8D8D8DFF9B9B9BFF9B9B9BFFA4A4A4FFD6D6D6FFDDDD
      DDFFDADADAFFC7C7C7FFC5C5C5FFD4D4D4FFD3D3D3FFCCCCCCFF999999FF8888
      88FF838383FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFDEDEDEFF6D6D6DFFDADADAFFD8D8
      D8FFA5A5A5FFD4D4D4FFD2D2D2FF6D6D6DFFCFCFCFFF6D6D6DFFA2A2A2FFA0A0
      A0FF9E9E9EFF9C9C9CFF999999FF979797FF959595FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FF555555FFE5E5E5FFD6D6D6FF5555
      55FFA3A3A3FFA3A3A3FF555555FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
      D6FFE5E5E5FF555555FF6B6B6BFF6B6B6BFF6B6B6BFF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0E0FFDFDFDFFFDEDEDEFFB5B5B5FFDCDC
      DCFFB5B5B5FFB4B4B4FFB4B4B4FFB4B4B4FFB4B4B4FFB4B4B4FFB4B4B4FFB5B5
      B5FFB5B5B5FFCFCFCFFFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFFCCCCCCFFCBCB
      CBFF979797FF000000000000000000000000A7A7A7FFE1E1E1FFDFDFDFFFDCDC
      DCFFDADADAFFD7D7D7FFD4D4D4FFD1D1D1FFCECECEFFCBCBCBFFC8C8C8FFC5C5
      C5FFC3C3C3FFC0C0C0FF8D8D8DFF9E9E9EFF9C9C9CFFA3A3A3FFD2D2D2FFDDDD
      DDFFDADADAFFDADADAFFD8D8D8FFD4D4D4FFD3D3D3FFC8C8C8FF9F9F9FFF8787
      87FF868686FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFDFDFDFFF6D6D6DFFDBDBDBFFD9D9
      D9FFA5A5A5FFD5D5D5FFD3D3D3FF6D6D6DFFCFCFCFFF6D6D6DFFA6A6A6FFA3A3
      A3FFA2A2A2FFA0A0A0FF9D9D9DFF9B9B9BFF999999FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FF555555FFE5E5E5FFD6D6D6FF5555
      55FFA3A3A3FFA3A3A3FF555555FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
      D6FFE5E5E5FF555555FF6B6B6BFF6B6B6BFF6B6B6BFF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFE6E6E6FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0E0FFDFDFDFFFDDDDDDFFDCDC
      DCFFDCDCDCFFDADADAFFD9D9D9FFD7D7D7FFD6D6D6FFD5D5D5FFD3D3D3FFD2D2
      D2FFD1D1D1FFD0D0D0FFCFCFCFFFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFFCCCC
      CCFF979797FF000000000000000000000000A7A7A7FFA7A7A7FFA7A7A7FFA7A7
      A7FFA7A7A7FFA7A7A7FFD7D7D7FFD4D4D4FFD1D1D1FF8D8D8DFF8D8D8DFF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFFA1A1A1FF9F9F9FFFA9A9A9FFC9C9C9FFE0E0
      E0FFDCDCDCFFDADADAFFD7D7D7FFD6D6D6FFD6D6D6FFC2C2C2FFA2A2A2FF8A8A
      8AFF888888FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFDFDFDFFF6D6D6DFFDCDCDCFFDADA
      DAFFA5A5A5FFD6D6D6FFD4D4D4FF6D6D6DFFD0D0D0FF6D6D6DFFAAAAAAFFA7A7
      A7FFA5A5A5FFA3A3A3FFA1A1A1FF9F9F9FFF9D9D9DFF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FF555555FFE5E5E5FFD6D6D6FF5555
      55FF555555FF555555FF555555FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
      D6FFE5E5E5FF555555FF6B6B6BFF6B6B6BFF6B6B6BFF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFE8E8E8FFE6E6E6FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0E0FFB5B5B5FFDDDD
      DDFFB4B4B4FFB4B4B4FFB4B4B4FFB4B4B4FFB4B4B4FFB4B4B4FFB4B4B4FFB4B4
      B4FFB4B4B4FFB4B4B4FFB4B4B4FFB4B4B4FFB5B5B5FFCECECEFFCDCDCDFFCCCC
      CCFF979797FF0000000000000000000000000000000000000000000000000000
      000000000000A7A7A7FFDADADAFFD7D7D7FFD4D4D4FF8D8D8DFFAFAFAFFFADAD
      ADFFAAAAAAFFA9A9A9FFA7A7A7FFA4A4A4FFA2A2A2FFA6A6A6FFD9D9D9FFE4E4
      E4FFE0E0E0FFDDDDDDFFD9D9D9FFD7D7D7FFD7D7D7FFCBCBCBFF959595FF8C8C
      8CFF8A8A8AFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE0E0E0FF6D6D6DFFDDDDDDFFDBDB
      DBFFA5A5A5FFD7D7D7FFD5D5D5FF6D6D6DFFD1D1D1FF6D6D6DFFAFAFAFFFACAC
      ACFFA9A9A9FFA7A7A7FFA5A5A5FFA2A2A2FFA1A1A1FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FF555555FFE5E5E5FFE5E5E5FFE5E5
      E5FFE5E5E5FFE0E0E0FFE4E4E4FFE6E6E6FFE5E5E5FFE2E2E2FFDFDFDFFFE5E5
      E5FFE5E5E5FF555555FF6B6B6BFF6B6B6BFF515151FF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFE9E9E9FFE8E8E8FFE6E6E6FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0E0FFDFDF
      DFFFDDDDDDFFDCDCDCFFDBDBDBFFDADADAFFD9D9D9FFD7D7D7FFD6D6D6FFD5D5
      D5FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFCFCFCFFFCECECEFFCDCD
      CDFF979797FF0000000000000000000000000000000000000000000000000000
      000000000000A7A7A7FFDCDCDCFFDADADAFFD7D7D7FF8D8D8DFFB1B1B1FFB0B0
      B0FFADADADFFABABABFFA9A9A9FFA8A8A8FFA5A5A5FFDCDCDCFFECECECFFE6E6
      E6FFE4E4E4FFE1E1E1FFDDDDDDFFDADADAFFD7D7D7FFD8D8D8FFC9C9C9FF9595
      95FF8D8D8DFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE1E1E1FF6D6D6DFFDEDEDEFFDDDD
      DDFFA5A5A5FFD9D9D9FFD7D7D7FF6D6D6DFFD2D2D2FF6D6D6DFFB3B3B3FFB1B1
      B1FFAEAEAEFFABABABFFA8A8A8FFA6A6A6FFA4A4A4FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FF515151FF555555FF555555FF5555
      55FF555555FF565656FF565656FF565656FF565656FF565656FF565656FF5555
      55FF555555FF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFEAEAEAFFE9E9E9FFE7E7E7FFE6E6E6FFE5E5E5FFE3E3E3FFB5B5B5FFE0E0
      E0FFB7B7B7FFB7B7B7FFB6B6B6FFB5B5B5FFB5B5B5FFB4B4B4FFB4B4B4FFB3B3
      B3FFB3B3B3FFB2B2B2FFB2B2B2FFD1D1D1FFD0D0D0FFCFCFCFFFCFCFCFFFCECE
      CEFF979797FF0000000000000000000000000000000000000000000000000000
      000000000000A7A7A7FFDFDFDFFFDCDCDCFFDADADAFF8D8D8DFFB5B5B5FFB2B2
      B2FFB1B1B1FFAFAFAFFFACACACFFA8A8A8FFDFDFDFFFF3F3F3FFEDEDEDFFEBEB
      EBFFE8E8E8FFE5E5E5FFE1E1E1FFDDDDDDFFDADADAFFD7D7D7FFD9D9D9FFC9C9
      C9FF959595FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE2E2E2FF6D6D6DFFDFDFDFFFDEDE
      DEFFA5A5A5FFDADADAFFD8D8D8FF6D6D6DFFD4D4D4FF6D6D6DFFB8B8B8FFB5B5
      B5FFB3B3B3FFB0B0B0FFADADADFFAAAAAAFFA8A8A8FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FF515151FF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FF515151FF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFECECECFFEAEAEAFFE9E9E9FFE7E7E7FFE6E6E6FFE5E5E5FFE3E3E3FFE2E2
      E2FFE0E0E0FFDFDFDFFFDDDDDDFFDCDCDCFFDBDBDBFFDADADAFFD9D9D9FFD7D7
      D7FFD6D6D6FFD5D5D5FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFCFCF
      CFFF979797FF0000000000000000000000000000000000000000000000000000
      000000000000A7A7A7FFE1E1E1FFDFDFDFFFDCDCDCFF8D8D8DFFB8B8B8FFB6B6
      B6FFB3B3B3FFB1B1B1FFAEAEAEFFC7C7C7FFECECECFFEFEFEFFFF3F3F3FFF3F3
      F3FFEDEDEDFFE9E9E9FFE5E5E5FFE1E1E1FFE0E0E0FFDBDBDBFFD5D5D5FFD0D0
      D0FFB7B7B7FF919191FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE3E3E3FF6D6D6DFFE0E0E0FFDFDF
      DFFFA5A5A5FFDBDBDBFFD9D9D9FF6D6D6DFFD5D5D5FF6D6D6DFFBBBBBBFFBABA
      BAFFB7B7B7FFB4B4B4FFB2B2B2FFAFAFAFFFACACACFF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FF515151FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3
      A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3
      A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FF515151FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFECECECFFECECECFFEAEAEAFFE9E9E9FFE7E7E7FFE6E6E6FFE4E4E4FFE3E3
      E3FFE2E2E2FFE0E0E0FFDFDFDFFFDDDDDDFFDCDCDCFFDBDBDBFFDADADAFFD8D8
      D8FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFCFCF
      CFFF979797FF0000000000000000000000000000000000000000000000000000
      000000000000A7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFBABABAFFB9B9
      B9FFB7B7B7FFB5B5B5FFBCBCBCFFB2B2B2FFACACACFFACACACFFB5B5B5FFC9C9
      C9FFF0F0F0FFEEEEEEFFE9E9E9FFE4E4E4FFBEBEBEFFACACACFFA4A4A4FFA5A5
      A5FFA8A8A8FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE4E4E4FF6D6D6DFFE1E1E1FFDFDF
      DFFFA5A5A5FFDCDCDCFFDADADAFF6D6D6DFFD6D6D6FF6D6D6DFFC0C0C0FFBDBD
      BDFFBBBBBBFFB9B9B9FFB6B6B6FFB3B3B3FFB1B1B1FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFA3A3A3FFC1C1C1FFC1C1C1FFBEBE
      BEFFB0B0B0FF979797FF8A8A8AFF959595FFACACACFFBCBCBCFFC1C1C1FFC1C1
      C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFA3A3A3FFA3A3A3FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFEDEDEDFFECECECFFECECECFFEAEAEAFFE9E9E9FFE7E7E7FFA5A5A5FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF595959FF595959FF595959FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0
      D0FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFBEBEBEFFBBBB
      BBFFB9B9B9FFB8B8B8FFB6B6B6FFB3B3B3FFB1B1B1FFB2B2B2FFB7B7B7FFA9A9
      A9FFDCDCDCFFF3F3F3FFEFEFEFFFD3D3D3FF999999FF9E9E9EFFA0A0A0FF9B9B
      9BFF989898FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE5E5E5FF6D6D6DFFE2E2E2FFE0E0
      E0FFA5A5A5FFDDDDDDFFDBDBDBFF6D6D6DFFD7D7D7FF6D6D6DFFC4C4C4FFC2C2
      C2FFBFBFBFFFBDBDBDFFBABABAFFB8B8B8FFB5B5B5FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFC1C1C1FFD0D0D0FFC9C9
      C9FFAEAEAEFF838383FF6A6A6AFF777777FF9A9A9AFFB9B9B9FFCACACAFFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFC1C1C1FFC1C1C1FFA3A3A3FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFEFEFEFFFEDEDEDFFECECECFFECECECFFEAEAEAFFE9E9E9FFA5A5A5FFE4E4
      E4FFE5E5E5FFA2A2A2FF5D5D5DFF595959FF5B5B5BFFD3D3D3FFE7E7E7FFBBBB
      BBFF747474FFB0B0B0FF595959FFD6D6D6FFD4D4D4FFD3D3D3FFD2D2D2FFD1D1
      D1FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFC0C0C0FFBFBF
      BFFFBCBCBCFFBABABAFFB9B9B9FFB7B7B7FFB4B4B4FFB2B2B2FFB0B0B0FFB9B9
      B9FFB3B3B3FFF4F4F4FFF0F0F0FFA2A2A2FFA4A4A4FFA2A2A2FF9F9F9FFF9D9D
      9DFF9C9C9CFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE6E6E6FF6D6D6DFFE3E3E3FFE1E1
      E1FFA5A5A5FFDEDEDEFFDCDCDCFF6D6D6DFFD8D8D8FF6D6D6DFF7E7E7EFF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFFBABABAFF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFD0D0D0FFD0D0D0FFC4C4
      C4FFA1A1A1FF868686FF515151FF575757FF757575FF9A9A9AFFB9B9B9FFCACA
      CAFFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFC1C1C1FFA3A3A3FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF0F0F0FFEFEFEFFFEDEDEDFFECECECFFEBEBEBFFEAEAEAFFA5A5A5FFE6E6
      E6FFE1E1E1FF9C9C9CFF838383FF6A6A6AFFB5B5B5FFF1F1F1FFB2B2B2FFBDBD
      BDFF828282FFBABABAFF595959FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FFD2D2
      D2FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFC3C3C3FFC1C1
      C1FFC0C0C0FFBDBDBDFFBBBBBBFFB9B9B9FFB8B8B8FFB5B5B5FFB3B3B3FFB1B1
      B1FFABABABFFE3E3E3FFE0E0E0FFA9A9A9FFA7A7A7FFA5A5A5FFA3A3A3FFA0A0
      A0FF9E9E9EFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE7E7E7FF6D6D6DFFE4E4E4FFE2E2
      E2FFA5A5A5FFDFDFDFFFDEDEDEFF6D6D6DFFDADADAFF6D6D6DFFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FF7E7E7EFFBEBEBEFF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFD0D0D0FFCDCDCDFFBBBB
      BBFF8E8E8EFFBEBEBEFF868686FF464646FF575757FF757575FF9A9A9AFFB9B9
      B9FFCACACAFFD0D0D0FFD0D0D0FFD0D0D0FFC1C1C1FFA3A3A3FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF1F1F1FFF0F0F0FFEEEEEEFFEDEDEDFFECECECFFEBEBEBFFA5A5A5FFEAEA
      EAFFDBDBDBFFB7B7B7FF7A7A7AFF747474FFEAEAEAFFEDEDEDFFE1E1E1FFC1C1
      C1FFA3A3A3FFA8A8A8FF595959FFD8D8D8FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3
      D3FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFC6C6C6FFC4C4
      C4FFC2C2C2FFC0C0C0FFBEBEBEFFBCBCBCFFBABABAFFB9B9B9FFB7B7B7FFB4B4
      B4FFBCBCBCFFB6B6B6FFB5B5B5FFACACACFFAAAAAAFFA8A8A8FFA6A6A6FFA4A4
      A4FFA1A1A1FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE7E7E7FF6D6D6DFFE5E5E5FFE3E3
      E3FFA5A5A5FFE0E0E0FFDFDFDFFF6D6D6DFFDBDBDBFF6D6D6DFFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FF7E7E7EFFC2C2C2FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFC1C1C1FFB8B8B8FF9D9D
      9DFF8E8E8EFFC2C2C2FFBDBDBDFF868686FF424242FF515151FF6D6D6DFF8F8F
      8FFFACACACFFBCBCBCFFC1C1C1FFC1C1C1FFC1C1C1FFA3A3A3FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF2F2F2FFF1F1F1FFF0F0F0FFEEEEEEFFEDEDEDFFECECECFFA5A5A5FFE8E8
      E8FFEEEEEEFFE0E0E0FF787878FF8B8B8BFFF2F2F2FFEEEEEEFFE7E7E7FFBFBF
      BFFFC4C4C4FF969696FF595959FFDADADAFFD8D8D8FFD7D7D7FFD6D6D6FFD4D4
      D4FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFC8C8C8FFC7C7
      C7FFC5C5C5FFC3C3C3FFC1C1C1FFC0C0C0FFBDBDBDFFBBBBBBFFB9B9B9FFB8B8
      B8FFB5B5B5FFB8B8B8FFB7B7B7FFAFAFAFFFADADADFFABABABFFA9A9A9FFA7A7
      A7FFA5A5A5FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE8E8E8FF6D6D6DFFE5E5E5FFE4E4
      E4FFA5A5A5FFE1E1E1FFDFDFDFFF6D6D6DFFDCDCDCFF6D6D6DFFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFC6C6C6FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFCDCDCDFFBBBBBBFF9393
      93FF8E8E8EFFC6C6C6FFC1C1C1FFBDBDBDFF868686FF4F4F4FFF595959FF7575
      75FF9A9A9AFFB9B9B9FFCACACAFFD0D0D0FFC1C1C1FFA3A3A3FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF3F3F3FFF2F2F2FFF1F1F1FFF0F0F0FFEEEEEEFFEDEDEDFFA5A5A5FFE8E8
      E8FFF1F1F1FFDEDEDEFF5A5A5AFF848484FFF7F7F7FFEDEDEDFFE9E9E9FFCECE
      CEFFE3E3E3FFDFDFDFFF595959FFDBDBDBFFDADADAFFD8D8D8FFD7D7D7FFD5D5
      D5FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFCACACAFFC9C9
      C9FFC8C8C8FFC6C6C6FFC4C4C4FFC2C2C2FFC0C0C0FFBEBEBEFFBCBCBCFFBABA
      BAFFB9B9B9FFB6B6B6FFB4B4B4FFB2B2B2FFB0B0B0FFAEAEAEFFACACACFFAAAA
      AAFFA8A8A8FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE9E9E9FF6D6D6DFFE6E6E6FFE5E5
      E5FFA5A5A5FFE2E2E2FFE0E0E0FF6D6D6DFFDDDDDDFF6D6D6DFFD6D6D6FFD5D5
      D5FFD2D2D2FFD2D2D2FFCFCFCFFFCDCDCDFFCBCBCBFF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFC9C9C9FFAEAEAEFF8E8E
      8EFFD0D0D0FFCBCBCBFFC6C6C6FFC1C1C1FFBCBCBCFF868686FF575757FF5C5C
      5CFF757575FF9A9A9AFFB9B9B9FFCACACAFFC1C1C1FFA3A3A3FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF4F4F4FFF3F3F3FFF2F2F2FFF1F1F1FFF0F0F0FFEEEEEEFFA5A5A5FFEAEA
      EAFFF0F0F0FFD2D2D2FF747474FF767676FFDEDEDEFF848484FF8A8A8AFF7C7C
      7CFF575757FFABABABFF595959FFDCDCDCFFDBDBDBFFD9D9D9FFD8D8D8FFD7D7
      D7FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFCDCDCDFFCBCB
      CBFFA4A4A4FF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D
      7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFFADAD
      ADFFABABABFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFE9E9E9FF6D6D6DFFE7E7E7FFE6E6
      E6FFA5A5A5FFE3E3E3FFE1E1E1FF6D6D6DFFDEDEDEFF6D6D6DFFD9D9D9FFD7D7
      D7FFD6D6D6FFD4D4D4FFD2D2D2FFD1D1D1FFCFCFCFFF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFC6C6C6FFA9A9A9FF8E8E
      8EFFD4D4D4FF9F9F9FFF9F9F9FFF9F9F9FFFC1C1C1FFBCBCBCFF868686FF6565
      65FF606060FF777777FF9A9A9AFFB9B9B9FFBCBCBCFFA3A3A3FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF6F6F6FFF4F4F4FFF3F3F3FFF2F2F2FFF1F1F1FFF0F0F0FFA5A5A5FFE8E8
      E8FFF2F2F2FFC6C6C6FF595959FF9C9C9CFFAAAAAAFF444444FF747474FF7676
      76FF717171FF646464FF595959FFDDDDDDFFDCDCDCFFDBDBDBFFD9D9D9FFD8D8
      D8FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFCFCFCFFFCDCD
      CDFFA4A4A4FFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF7D7D7DFFB0B0
      B0FFAEAEAEFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFA5A5A5FFE9E9E9FFE8E8E8FFE6E6
      E6FFE5E5E5FFA5A5A5FFA5A5A5FFE0E0E0FFDFDFDFFF6D6D6DFFDCDCDCFFDADA
      DAFFD9D9D9FFD7D7D7FFD5D5D5FFD3D3D3FFD2D2D2FF595959FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFC9C9C9FF8E8E8EFFDCDC
      DCFF9F9F9FFFB9B9B9FFCBCBCBFF9F9F9FFF9F9F9FFFC0C0C0FFBCBCBCFF8686
      86FF717171FF676767FF7A7A7AFF9A9A9AFFACACACFF9F9F9FFF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF7F7F7FFF5F5F5FFF4F4F4FFF3F3F3FFF2F2F2FFF1F1F1FFA5A5A5FFE8E8
      E8FFEAEAEAFF979797FF464646FFB8B8B8FFF3F3F3FFA3A3A3FFB3B3B3FFD4D4
      D4FFAEAEAEFF797979FF595959FFDEDEDEFFDDDDDDFFDCDCDCFFDBDBDBFFD9D9
      D9FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD1D1D1FFD0D0
      D0FFA4A4A4FFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF7D7D7DFFB3B3
      B3FFB1B1B1FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFEAEAEAFFE9E9E9FFE8E8E8FFE7E7
      E7FFE6E6E6FFE4E4E4FFE3E3E3FFE1E1E1FFE0E0E0FF6D6D6DFFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFCECECEFFB6B6
      B6FF0000000000000000000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFCDCDCDFF8E8E8EFF8E8E
      8EFFC0C0C0FFCACACAFFD0D0D0FFD0D0D0FFD0D0D0FF9F9F9FFFBFBFBFFFBBBB
      BBFF868686FF7D7D7DFF6C6C6CFF7A7A7AFF919191FF959595FF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFF2F2F2FFA5A5A5FFEEEE
      EEFFBCBCBCFF7B7B7BFF444444FFA8A8A8FFF0F0F0FFE0E0E0FFDBDBDBFFE6E6
      E6FFE6E6E6FF8F8F8FFF595959FFDFDFDFFFDEDEDEFFDDDDDDFFDCDCDCFFDBDB
      DBFF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD4D4D4FFD2D2
      D2FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFB6B6
      B6FFB4B4B4FF585858FF00000000000000000000000000000000000000000000
      000000000000A5A5A5FF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFCECECEFFCECE
      CEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECE
      CEFFB6B6B6FFB6B6B6FF000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFC1C1C1FF8E8E8EFFBDBD
      BDFFBEBEBEFFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FF9F9F9FFF9F9F
      9FFFBABABAFF868686FF7A7A7AFF696969FF808080FF8B8B8BFF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFA5A5A5FFD0D0
      D0FF8E8E8EFF727272FF3D3D3DFF959595FFE5E5E5FFD8D8D8FFDADADAFFD6D6
      D6FFEBEBEBFF7C7C7CFF595959FFE1E1E1FFDFDFDFFFDEDEDEFFDDDDDDFFDCDC
      DCFF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD6D6D6FFD5D5
      D5FFD3D3D3FFD1D1D1FFD0D0D0FFCECECEFFCDCDCDFFCBCBCBFFC9C9C9FFC8C8
      C8FFC7C7C7FFC5C5C5FFC3C3C3FFC0C0C0FFBFBFBFFFBDBDBDFFBBBBBBFFB9B9
      B9FFB7B7B7FF585858FF00000000000000000000000000000000000000000000
      000000000000A5A5A5FFE9E9E9FFE7E7E7FFE5E5E5FFE4E4E4FFE2E2E2FFE0E0
      E0FFDEDEDEFFDCDCDCFFDADADAFFD7D7D7FFD5D5D5FF6D6D6DFFCECECEFFCECE
      CEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECE
      CEFFCECECEFFB6B6B6FF000000000000000000000000000000000000000B5555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FF9F9F9FFFBABABAFF868686FF929292FF8A8A8AFF8D8D8DFF515151FF5151
      51FF6B6B6BFF555555FF000000260000000B000000000000000000000000B6B6
      B6FFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFA5A5A5FF9090
      90FF898989FF6B6B6BFF3E3E3EFF777777FF868686FF8A8A8AFFADADADFFC8C8
      C8FFA7A7A7FF545454FF595959FFE2E2E2FFE1E1E1FFDFDFDFFFDEDEDEFFDCDC
      DCFF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD8D8D8FFD7D7
      D7FFD5D5D5FFD4D4D4FFD2D2D2FFD1D1D1FFCFCFCFFFCDCDCDFFCBCBCBFFCACA
      CAFFC8C8C8FFC7C7C7FFC5C5C5FFC3C3C3FFC2C2C2FFC0C0C0FFBEBEBEFFBCBC
      BCFFBABABAFF585858FF00000000000000000000000000000000000000000000
      000000000000A5A5A5FFA5A5A5FFE7E7E7FFE6E6E6FFE4E4E4FFE2E2E2FFE0E0
      E0FFDFDFDFFFDCDCDCFFDADADAFFD7D7D7FFD5D5D5FF6D6D6DFFCECECEFFCECE
      CEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECE
      CEFFCECECEFFB6B6B6FF00000000000000000000000000000000000000085555
      55FF6B6B6BFF515151FF515151FFA3A3A3FFC1C1C1FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFCECECEFF9F9F9FFFB9B9B9FF868686FFA6A6A6FF989898FF515151FF5151
      51FF6B6B6BFF555555FF0000001D00000008000000000000000000000000B6B6
      B6FFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFA5A5A5FF8B8B
      8BFF858585FF5D5D5DFF474747FF454545FF404040FF444444FF494949FF4D4D
      4DFF444444FF525252FF595959FFE4E4E4FFE2E2E2FFE1E1E1FFDFDFDFFFDEDE
      DEFF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFD9D9D9FFD8D8
      D8FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FFD1D1D1FFD0D0D0FFCECECEFFCCCC
      CCFFCBCBCBFFC9C9C9FFC8C8C8FFC6C6C6FFC4C4C4FFC2C2C2FFC0C0C0FFBFBF
      BFFFBDBDBDFF585858FF00000000000000000000000000000000000000000000
      00000000000000000000A5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FF6D6D6DFFB6B6B6FFB6B6
      B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
      B6FFB6B6B6FF0000000000000000000000000000000000000000000000035555
      55FF6B6B6BFF6B6B6BFF6B6B6BFFA3A3A3FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
      C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
      C1FFC1C1C1FFC1C1C1FF9F9F9FFF9F9F9FFFBBBBBBFFA0A0A0FF6B6B6BFF6B6B
      6BFF6B6B6BFF555555FF0000001100000003000000000000000000000000B6B6
      B6FFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFA5A5A5FF8383
      83FF7E7E7EFF5B5B5BFF4A4A4AFF484848FF474747FF4B4B4BFF4F4F4FFF4848
      48FF4E4E4EFF7A7A7AFF595959FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1E1FFDFDF
      DFFF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFDBDBDBFFD9D9
      D9FFD8D8D8FFD8D8D8FFD7D7D7FFD5D5D5FFD4D4D4FFD2D2D2FFD0D0D0FFCFCF
      CFFFCDCDCDFFCBCBCBFFCACACAFFC8C8C8FFC7C7C7FFC5C5C5FFC3C3C3FFC1C1
      C1FFC0C0C0FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A5FF00000000000000000000000000000000000000000000
      0000A5A5A5FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0026555555FF555555FF555555FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3
      A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3
      A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FF555555FF5555
      55FF555555FF000000360000000400000000000000000000000000000000B6B6
      B6FFFBFBFBFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFE6E6E6FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1
      E1FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFDCDCDCFFDBDB
      DBFFDADADAFFD9D9D9FFD8D8D8FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FFD1D1
      D1FFD0D0D0FFCECECEFFCCCCCCFFCBCBCBFFC9C9C9FFC8C8C8FFC6C6C6FFC4C4
      C4FFC2C2C2FF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B6B6
      B6FFFCFCFCFFFBFBFBFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6
      F6FFF5F5F5FFF4F4F4FFF3F3F3FFF2F2F2FFF0F0F0FFEFEFEFFFEEEEEEFFECEC
      ECFFECECECFFEBEBEBFFE9E9E9FFE8E8E8FFE6E6E6FFE5E5E5FFE3E3E3FFE2E2
      E2FF979797FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A9A9A006C6C6C006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C008F8F8F0024242400242424002424
      2400242424002424240024242400242424002424240024242400242424002424
      2400242424002424240024242400242424002424240024242400242424002424
      2400242424002424240024242400242424002424240024242400242424002424
      2400242424002424240024242400242424008F8F8F0023232300232323002323
      2300232323002323230023232300232323002323230023232300232323002323
      2300232323002323230023232300232323002323230023232300232323002323
      2300232323002323230023232300232323002323230023232300232323002323
      2300232323002323230023232300232323008F8F8F0024242400242424002424
      2400242424002424240024242400242424002424240024242400242424002424
      2400242424002424240024242400242424002424240024242400242424002424
      2400242424002424240024242400242424002424240024242400242424002424
      2400242424002424240024242400242424009A9A9A00E0E0E000DFDFDF00DEDE
      DE00DDDDDD00DCDCDC00DBDBDB00DBDBDB00DADADA00D9D9D900D8D8D800D8D8
      D800D7D7D700D6D6D600D5D5D500D5D5D500D5D5D500D4D4D400D4D4D400D3D3
      D300D2D2D200D2D2D200D1D1D100D1D1D100D0D0D000CFCFCF00CFCFCF00CECE
      CE00CECECE00CECECE00CDCDCD006C6C6C008F8F8F00EBEBEB00EAEAEA00E9E9
      E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E4E4E400E2E2E200E2E2
      E200E1E1E100DFDFDF00DFDFDF00DDDDDD00DDDDDD00DCDCDC00DBDBDB00DADA
      DA00DADADA00D9D9D900D8D8D800D7D7D700D7D7D700D6D6D600D6D6D600D5D5
      D500D5D5D500D5D5D500D5D5D500242424008F8F8F00EAEAEA00E9E9E900E9E9
      E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3E300E2E2E200E1E1
      E100E0E0E000DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADA
      DA00D9D9D900D9D9D900D8D8D800D7D7D700D7D7D700D6D6D600D6D6D600D5D5
      D500D5D5D500D4D4D400D4D4D400232323008F8F8F00EBEBEB00EAEAEA00E9E9
      E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3E300E2E2E200E1E1
      E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DBDBDB00DADA
      DA00DADADA00D9D9D900D8D8D800D7D7D700D7D7D700D6D6D600D6D6D600D5D5
      D500D5D5D500D4D4D400D4D4D400242424009A9A9A00E1E1E100E0E0E0007D7D
      7D00DEDEDE00DDDDDD00DCDCDC00DBDBDB00DBDBDB00DADADA00D9D9D900BBBB
      BB00D8D8D800D7D7D700D6D6D600D5D5D500D5D5D500A4A4A4006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C00D1D1D100D0D0D000CFCFCF00CFCF
      CF00CECECE00CECECE00CECECE006C6C6C008F8F8F00ECECEC00EBEBEB00EAEA
      EA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E4E4E4008F8F
      8F0024242400242424002424240024242400242424002424240024242400DBDB
      DB00DADADA00DADADA00D9D9D900D8D8D800D7D7D700D7D7D700D6D6D600D6D6
      D600D5D5D500D5D5D500D5D5D500242424008F8F8F00EBEBEB00EAEAEA00E9E9
      E900E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3E300E2E2
      E200E1E1E100E0E0E000DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDB
      DB00DADADA00D9D9D900D9D9D900D8D8D800D7D7D700D7D7D700D6D6D600D6D6
      D600D5D5D500D5D5D500D4D4D400232323008F8F8F00ECECEC00EBEBEB00EAEA
      EA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3E300E2E2
      E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DBDB
      DB00DADADA00DADADA00D9D9D900D8D8D800D7D7D700D7D7D700D6D6D600D6D6
      D600D5D5D500D5D5D500D4D4D400242424009A9A9A00E1E1E100E1E1E1007D7D
      7D00DFDFDF00545454005454540054545400545454005454540054545400D9D9
      D900D8D8D800D8D8D800D7D7D700D6D6D600D5D5D500A4A4A400E7E7E700E9E9
      E900EDEDED00F1F1F100F4F4F4006C6C6C00D1D1D100D1D1D100D0D0D000CFCF
      CF00CFCFCF00CECECE00CECECE006C6C6C008F8F8F00EDEDED00ECECEC00EBEB
      EB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E4008F8F
      8F00E7E7E700E9E9E900EDEDED00F1F1F100F4F4F400F7F7F70024242400DCDC
      DC00DBDBDB00DADADA00DADADA00D9D9D900D8D8D800D7D7D700D7D7D700D6D6
      D600D6D6D600D5D5D500D5D5D500242424008F8F8F00ECECEC00EBEBEB00EAEA
      EA00E9E9E900E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3
      E300E2E2E200E1E1E100E0E0E000DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDC
      DC00DBDBDB00DADADA00D9D9D900D9D9D900D8D8D800D7D7D700D7D7D700D6D6
      D600D6D6D600D5D5D500D5D5D500232323008F8F8F00EDEDED00ECECEC00EBEB
      EB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3
      E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDC
      DC00DBDBDB00DADADA00DADADA00D9D9D900D8D8D800D7D7D700D7D7D700D6D6
      D600D6D6D600D5D5D500D5D5D500242424009A9A9A00E2E2E200E1E1E1007D7D
      7D0054545400BFBFBF00BCBCBC00B7B7B700B4B4B400B1B1B100AEAEAE005454
      5400D9D9D900BBBBBB00D8D8D800BBBBBB00D6D6D600A4A4A400E3E3E300E7E7
      E700E9E9E900EDEDED00F1F1F1006C6C6C00D2D2D200D1D1D100D1D1D100D0D0
      D000CFCFCF00CECECE00CECECE006C6C6C008F8F8F00EEEEEE00EDEDED00ECEC
      EC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E5008F8F
      8F00E3E3E300E7E7E700E2E2E20054545400F1F1F100F4F4F40024242400DDDD
      DD00DCDCDC00DBDBDB00DADADA00DADADA00D9D9D900D8D8D800D7D7D700D7D7
      D700D6D6D600D6D6D600D5D5D500242424008F8F8F00EDEDED00ECECEC00A3A3
      A300A3A3A300A3A3A300E9E9E900A3A3A300A3A3A300A3A3A300A3A3A300E4E4
      E400A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300DADADA00A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300D6D6D600D5D5D500232323008F8F8F00EEEEEE00EDEDED00ECEC
      EC00EBEBEB00EAEAEA00E9E9E900A4A4A400A4A4A400A4A4A400E5E5E500E4E4
      E400E3E3E300A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400DADADA00A4A4A400A4A4A400A4A4A400A4A4
      A400D6D6D600D6D6D600D5D5D500242424009A9A9A00E3E3E300E2E2E2007D7D
      7D00C8C8C800C4C4C400C0C0C000BCBCBC00545454007D7D7D007D7D7D007D7D
      7D0054545400D9D9D900D8D8D800D8D8D800D7D7D700A4A4A400E0E0E000E3E3
      E300E7E7E700E9E9E900EDEDED006C6C6C00D2D2D200D2D2D200D1D1D100D1D1
      D100D0D0D000CFCFCF00CECECE006C6C6C008F8F8F00EEEEEE00EEEEEE00EDED
      ED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E6008F8F
      8F00E0E0E000E3E3E3007D7D7D00BFBFBF0054545400F1F1F10024242400DDDD
      DD00DDDDDD00DCDCDC00DBDBDB00DADADA00DADADA00D9D9D900D8D8D800D7D7
      D700D7D7D700D6D6D600D6D6D600242424008F8F8F00EEEEEE00EDEDED00A3A3
      A300EBEBEB00A3A3A300E9E9E900A3A3A300A3A3A300A3A3A300A3A3A300E5E5
      E500A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300DBDBDB00A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300D6D6D600D6D6D600232323008F8F8F00EEEEEE00EEEEEE00EDED
      ED00A4A4A400CACACA00A4A4A400A4A4A400E8E8E800A4A4A400E6E6E600E5E5
      E500E4E4E400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400DADADA00A4A4A400A4A4A400A4A4A400A4A4
      A400D7D7D700D6D6D600D6D6D600242424009A9A9A00E4E4E400E3E3E3007D7D
      7D00CDCDCD00C9C9C900C5C5C500C2C2C20054545400DDDDDD00DCDCDC00BBBB
      BB007D7D7D007D7D7D00D9D9D900D8D8D800D8D8D800A4A4A400DDDDDD00E0E0
      E000E3E3E300E7E7E700E9E9E9006C6C6C00D3D3D300D2D2D200D2D2D200D1D1
      D100D1D1D100D0D0D000CFCFCF006C6C6C008F8F8F00EFEFEF00EEEEEE00EEEE
      EE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E7008F8F
      8F00DDDDDD00E0E0E0007D7D7D00C5C5C500BFBFBF005454540024242400DFDF
      DF00DDDDDD00DDDDDD00DCDCDC00DBDBDB00DADADA00DADADA00D9D9D900D8D8
      D800D7D7D700D7D7D700D6D6D600242424008F8F8F00EFEFEF00EEEEEE00A3A3
      A300A3A3A300A3A3A300EAEAEA00A3A3A300A3A3A300A3A3A300A3A3A300E6E6
      E600A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300DCDCDC00A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300D7D7D700D6D6D600232323008F8F8F00EFEFEF00EEEEEE00EEEE
      EE00CACACA00ECECEC00EBEBEB00A4A4A400A4A4A400A4A4A400E7E7E700E6E6
      E600E5E5E500A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400DBDBDB00A4A4A400A4A4A400A4A4A400A4A4
      A400D7D7D700D7D7D700D6D6D600242424009A9A9A00E5E5E500E4E4E4007D7D
      7D00D1D1D100CECECE00CACACA0054545400DFDFDF00DEDEDE00DDDDDD00DCDC
      DC00DBDBDB00DBDBDB00DADADA00D9D9D900D8D8D800A4A4A400DBDBDB00DDDD
      DD00E0E0E000E3E3E300E7E7E7006C6C6C00D4D4D400D3D3D300D2D2D200D2D2
      D200D1D1D100D1D1D100D0D0D0006C6C6C008F8F8F00F0F0F000EFEFEF00EEEE
      EE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E8008F8F
      8F00DBDBDB00DDDDDD007D7D7D00CCCCCC00C5C5C500BFBFBF0054545400DFDF
      DF00DFDFDF00DDDDDD00DDDDDD00DCDCDC00DBDBDB00DADADA00DADADA00D9D9
      D900D8D8D800D7D7D700D7D7D700242424008F8F8F00F0F0F000EFEFEF00EEEE
      EE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E9E9E900E8E8E800E7E7
      E700E6E6E600E5E5E500E4E4E400E3E3E300E2E2E200E1E1E100E0E0E000DFDF
      DF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADADA00D9D9D900D9D9
      D900D8D8D800D7D7D700D7D7D700232323008F8F8F00F0F0F000EFEFEF00EEEE
      EE00A4A4A400EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7
      E700E6E6E600E5E5E500E4E4E400E3E3E300E2E2E200E1E1E100E0E0E000DFDF
      DF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DBDBDB00DADADA00DADADA00D9D9
      D900D8D8D800D7D7D700D7D7D700242424009A9A9A00E6E6E600E5E5E5007D7D
      7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D00DEDEDE00BBBB
      BB00DCDCDC00DBDBDB00DBDBDB00DADADA00D9D9D900A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400A4A4A400D4D4D400D4D4D400D3D3D300D2D2
      D200D2D2D200D1D1D100D1D1D1006C6C6C008F8F8F00F1F1F100F0F0F000EFEF
      EF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E9008F8F
      8F00D9D9D9007D7D7D00D8D8D800D2D2D200CCCCCC00C5C5C500BFBFBF005454
      5400DFDFDF00DFDFDF00DDDDDD00DDDDDD00DCDCDC00DBDBDB00DADADA00DADA
      DA00D9D9D900D8D8D800D7D7D700242424008F8F8F00F0F0F000F0F0F000A3A3
      A300A3A3A300A3A3A300ECECEC00A3A3A300A3A3A300A3A3A300A3A3A300E8E8
      E800A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300DDDDDD00A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300D8D8D800D7D7D700232323008F8F8F00F1F1F100F0F0F000A4A4
      A400A4A4A400A4A4A400EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8
      E800E7E7E700A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400DDDDDD00A4A4A400A4A4A400A4A4A400A4A4
      A400D9D9D900D8D8D800D7D7D700242424009A9A9A00E6E6E600E6E6E600E5E5
      E500E4E4E400E3E3E300E2E2E200E1E1E100E1E1E100E0E0E000DFDFDF00DEDE
      DE00DDDDDD00DCDCDC00DBDBDB00DBDBDB00DADADA00D9D9D900D8D8D800D8D8
      D800D7D7D700D6D6D600D5D5D500D5D5D500D5D5D500D4D4D400D4D4D400D3D3
      D300D2D2D200D2D2D200D1D1D1006C6C6C008F8F8F00F2F2F200F1F1F100F0F0
      F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA008F8F
      8F008F8F8F007D7D7D00DDDDDD007D7D7D007D7D7D007D7D7D00C5C5C500BFBF
      BF0054545400DFDFDF00DFDFDF00DDDDDD00DDDDDD00DCDCDC00DBDBDB00DADA
      DA00DADADA00D9D9D900D8D8D800242424008F8F8F00F2F2F200F0F0F000A3A3
      A300EFEFEF00A3A3A300EDEDED00A3A3A300A3A3A300A3A3A300A3A3A300E9E9
      E900A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300DEDEDE00A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300D9D9D900D8D8D800232323008F8F8F00F2F2F200F1F1F100A4A4
      A400EFEFEF00A4A4A400EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9
      E900E8E8E800A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400DEDEDE00A4A4A400A4A4A400A4A4A400A4A4
      A400DADADA00D9D9D900D8D8D800242424009A9A9A00E6E6E600E6E6E600E6E6
      E600E5E5E500E4E4E400E3E3E300E2E2E200E1E1E100E1E1E100E0E0E000BBBB
      BB00DEDEDE00DDDDDD00DCDCDC00DBDBDB00DBDBDB00DADADA00D9D9D900D8D8
      D800D8D8D800D7D7D700D6D6D600D5D5D500D5D5D500D5D5D500D4D4D400D4D4
      D400D3D3D300D2D2D200D2D2D2006C6C6C008F8F8F00F3F3F300F2F2F200F1F1
      F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEA
      EA007D7D7D00E6E6E6007D7D7D00E6E6E600E5E5E5007D7D7D007D7D7D00C5C5
      C500BFBFBF0054545400DDDDDD00DFDFDF00DDDDDD00DDDDDD00DCDCDC00DBDB
      DB00DADADA00DADADA00D9D9D900242424008F8F8F00F3F3F300F2F2F200A3A3
      A300A3A3A300A3A3A300EEEEEE00A3A3A300A3A3A300A3A3A300A3A3A300E9E9
      E900A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300DFDFDF00A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300D9D9D900D9D9D900232323008F8F8F00F3F3F300F2F2F200A4A4
      A400A4A4A400A4A4A400EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEA
      EA00E9E9E900A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400DFDFDF00A4A4A400A4A4A400A4A4A400A4A4
      A400DADADA00DADADA00D9D9D900242424009A9A9A00E7E7E700E6E6E600E6E6
      E600E6E6E600E5E5E500E4E4E400E3E3E3005454540054545400545454005454
      5400545454005454540054545400DCDCDC00DBDBDB00A4A4A4006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C00D5D5D500D5D5D500D5D5D500D4D4
      D400D4D4D400D3D3D300D2D2D2006C6C6C008F8F8F00F4F4F400F3F3F300F2F2
      F200F1F1F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEB
      EB007D7D7D007D7D7D00E7E7E700E7E7E700E6E6E600E5E5E500E4E4E4007D7D
      7D00C5C5C500BFBFBF0054545400DFDFDF00DFDFDF00DDDDDD00DDDDDD00DCDC
      DC00DBDBDB00DADADA00DADADA00242424008F8F8F00F3F3F300F3F3F300F2F2
      F200F0F0F000F0F0F000EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEA
      EA00E9E9E900E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3
      E300E2E2E200E1E1E100E0E0E000DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDC
      DC00DBDBDB00DADADA00D9D9D900232323008F8F8F00F4F4F400F3F3F300F2F2
      F200F1F1F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEB
      EB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3
      E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDC
      DC00DBDBDB00DADADA00DADADA00242424009A9A9A00E8E8E800E7E7E700E6E6
      E600E6E6E600E6E6E600E5E5E500E4E4E400E3E3E300E2E2E20054545400D0D0
      D000CDCDCD00C9C9C90054545400DDDDDD00DCDCDC00A4A4A400E7E7E700E9E9
      E900EDEDED00F1F1F100F4F4F4006C6C6C00D6D6D600D5D5D500D5D5D500D5D5
      D500D4D4D400D4D4D400D3D3D3006C6C6C008F8F8F00F5F5F500F4F4F400F3F3
      F300F2F2F200F1F1F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECEC
      EC007D7D7D00E9E9E900E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E5E5
      E5007D7D7D007D7D7D00BFBFBF0054545400DEDEDE00DFDFDF00DDDDDD00DDDD
      DD00DCDCDC00DBDBDB00DADADA00242424008F8F8F00F5F5F500F3F3F300A3A3
      A300A3A3A300A3A3A300F0F0F000A3A3A300A3A3A300A3A3A300A3A3A300EBEB
      EB00A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300E1E1E100A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300DBDBDB00DADADA00232323008F8F8F00F5F5F500F4F4F400F3F3
      F300F2F2F200F1F1F100F0F0F000A4A4A400A4A4A400A4A4A400EDEDED00ECEC
      EC00EBEBEB00A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E0E0E000A4A4A400A4A4A400A4A4A400A4A4
      A400DCDCDC00DBDBDB00DADADA00242424009A9A9A00E8E8E800E8E8E800E7E7
      E7007D7D7D0054545400E6E6E600E5E5E500E4E4E40054545400D9D9D900D5D5
      D500D1D1D100CECECE0054545400DEDEDE00DDDDDD00A4A4A400E3E3E300E7E7
      E700E9E9E900EDEDED00F1F1F1006C6C6C00D7D7D700D6D6D600D5D5D500D5D5
      D500D5D5D500D4D4D400D4D4D4006C6C6C008F8F8F00F6F6F600F5F5F500F4F4
      F400F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDED
      ED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5
      E500E5E5E500E4E4E4007D7D7D00BFBFBF0054545400DFDFDF00DFDFDF00DDDD
      DD00DDDDDD00DCDCDC00DBDBDB00242424008F8F8F00F6F6F600F5F5F500A3A3
      A300F3F3F300A3A3A300F0F0F000A3A3A300A3A3A300A3A3A300A3A3A300ECEC
      EC00A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300E2E2E200A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300DCDCDC00DBDBDB00232323008F8F8F00F6F6F600F5F5F500F4F4
      F400A4A4A400CACACA00A4A4A400A4A4A400EFEFEF00A4A4A400EEEEEE00EDED
      ED00ECECEC00A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E1E1E100A4A4A400A4A4A400A4A4A400A4A4
      A400DDDDDD00DCDCDC00DBDBDB00242424009A9A9A00E9E9E900E8E8E800E8E8
      E800E7E7E7007D7D7D00545454005454540054545400E1E1E100DEDEDE00D9D9
      D900D6D6D600D3D3D30054545400BBBBBB00DEDEDE00A4A4A400E0E0E000E3E3
      E300E7E7E700E9E9E900EDEDED006C6C6C00D8D8D800D7D7D700D6D6D600D5D5
      D500D5D5D500D5D5D500D4D4D4006C6C6C008F8F8F00F7F7F700F6F6F600F5F5
      F500F4F4F400F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EEEEEE00EEEE
      EE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6
      E600E5E5E500E4E4E400E0E0E0007D7D7D00BFBFBF0054545400DFDFDF00DFDF
      DF00DDDDDD00DDDDDD00DCDCDC00242424008F8F8F00F7F7F700F6F6F600A3A3
      A300A3A3A300A3A3A300F2F2F200A3A3A300A3A3A300A3A3A300A3A3A300EDED
      ED00A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300E3E3E300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300DCDCDC00DCDCDC00232323008F8F8F00F7F7F700F6F6F600F5F5
      F500CACACA00F3F3F300F2F2F200A4A4A400A4A4A400A4A4A400EEEEEE00EEEE
      EE00EDEDED00A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E2E2E200A4A4A400A4A4A400A4A4A400A4A4
      A400DEDEDE00DDDDDD00DCDCDC00242424009A9A9A00EAEAEA00E9E9E900E8E8
      E800E8E8E800E7E7E7007D7D7D00EBEBEB00E8E8E800E5E5E500E2E2E200DEDE
      DE00DBDBDB007D7D7D0054545400E0E0E000DFDFDF00A4A4A400DDDDDD00E0E0
      E000E3E3E300E7E7E700E9E9E9006C6C6C00D8D8D800D8D8D800D7D7D700D6D6
      D600D5D5D500D5D5D500D5D5D5006C6C6C008F8F8F00F7F7F700F7F7F700F6F6
      F600F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EEEE
      EE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7
      E700E6E6E600E5E5E500E4E4E400E4E4E4007D7D7D007D7D7D00E1E1E100DFDF
      DF00DFDFDF00DDDDDD00DDDDDD00242424008F8F8F00F7F7F700F7F7F700F6F6
      F600F5F5F500F3F3F300F3F3F300F2F2F200F0F0F000F0F0F000EFEFEF00EEEE
      EE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E9E9E900E8E8E800E7E7
      E700E6E6E600E5E5E500E4E4E400E3E3E300E2E2E200E1E1E100E0E0E000DFDF
      DF00DEDEDE00DDDDDD00DCDCDC00232323008F8F8F00F7F7F700F7F7F700F6F6
      F600A4A4A400F4F4F400F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EEEE
      EE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7
      E700E6E6E600E5E5E500E4E4E400E3E3E300E2E2E200E1E1E100E0E0E000DFDF
      DF00DFDFDF00DEDEDE00DDDDDD00242424009A9A9A00EAEAEA00EAEAEA00E9E9
      E900E8E8E800E8E8E800E7E7E7007D7D7D007D7D7D007D7D7D007D7D7D007D7D
      7D007D7D7D00E2E2E20054545400E1E1E100E0E0E000A4A4A400DBDBDB00DDDD
      DD00E0E0E000E3E3E300E7E7E7006C6C6C00D9D9D900D8D8D800D8D8D800D7D7
      D700D6D6D600D5D5D500D5D5D5006C6C6C008F8F8F00F8F8F800F7F7F700F7F7
      F700F6F6F600F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F0F0F0008F8F
      8F0024242400242424002424240024242400242424002424240024242400E8E8
      E800E7E7E700E6E6E600E5E5E500E4E4E400E4E4E400E2E2E200E2E2E200E1E1
      E100DFDFDF00DFDFDF00DDDDDD00242424008F8F8F00F8F8F800F7F7F700A3A3
      A300A3A3A300A3A3A300F3F3F300A3A3A300A3A3A300A3A3A300A3A3A300EFEF
      EF00A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300E5E5E500A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300DEDEDE00DDDDDD00232323008F8F8F00F8F8F800F7F7F700F7F7
      F700CACACA00F5F5F500F4F4F400A4A4A400A4A4A400A4A4A400F0F0F000EFEF
      EF00EEEEEE00A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E4E4E400A4A4A400A4A4A400A4A4A400A4A4
      A400DFDFDF00DFDFDF00DEDEDE00242424009A9A9A00EBEBEB00EAEAEA00EAEA
      EA00E9E9E900E8E8E800E8E8E800E7E7E700E6E6E600E6E6E600E6E6E600E5E5
      E500E4E4E400E3E3E3007D7D7D00E1E1E100E1E1E100A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400A4A4A400DADADA00D9D9D900D8D8D800D8D8
      D800D7D7D700D6D6D600D5D5D5006C6C6C008F8F8F00F8F8F800F8F8F800F7F7
      F700F7F7F700F6F6F600F5F5F500F4F4F400F3F3F300F2F2F200F1F1F1008F8F
      8F00E7E7E700E9E9E900EDEDED00F1F1F100F4F4F400F7F7F70024242400E9E9
      E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E4E4E400E2E2E200E2E2
      E200E1E1E100DFDFDF00DFDFDF00242424008F8F8F00F8F8F800F8F8F800A3A3
      A300F7F7F700A3A3A300F5F5F500A3A3A300A3A3A300A3A3A300A3A3A300F0F0
      F000A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300E6E6E600A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300DFDFDF00DEDEDE00232323008F8F8F00F8F8F800F8F8F800F7F7
      F700A4A4A400CACACA00A4A4A400A4A4A400F3F3F300A4A4A400F1F1F100F0F0
      F000EFEFEF00A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E5E5E500A4A4A400A4A4A400A4A4A400A4A4
      A400E0E0E000DFDFDF00DFDFDF00242424009A9A9A00EBEBEB00EBEBEB00EAEA
      EA00EAEAEA00E9E9E900E8E8E800E8E8E800E7E7E700E6E6E600E6E6E600BBBB
      BB00E5E5E500E4E4E400E3E3E300E2E2E200E1E1E100E1E1E100E0E0E000DFDF
      DF00DEDEDE00DDDDDD00DCDCDC00DBDBDB00DBDBDB00DADADA00D9D9D900D8D8
      D800D8D8D800D7D7D700D6D6D6006C6C6C008F8F8F00F8F8F800F8F8F800F8F8
      F800F7F7F700F7F7F700F6F6F600F5F5F500F4F4F400F3F3F300F2F2F2008F8F
      8F00E3E3E300E7E7E700E2E2E20054545400F1F1F100F4F4F40024242400EAEA
      EA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E4E4E400E2E2
      E200E2E2E200E1E1E100DFDFDF00242424008F8F8F00F8F8F800F8F8F800A3A3
      A300A3A3A300A3A3A300F6F6F600A3A3A300A3A3A300A3A3A300A3A3A300F0F0
      F000A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300E7E7E700A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300E0E0E000DFDFDF00232323008F8F8F00F8F8F800F8F8F800F8F8
      F800CACACA00F7F7F700F6F6F600A4A4A400A4A4A400A4A4A400F2F2F200F1F1
      F100F0F0F000A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E6E6E600A4A4A400A4A4A400A4A4A400A4A4
      A400E1E1E100E0E0E000DFDFDF00242424009A9A9A00ECECEC00EBEBEB00EBEB
      EB00EAEAEA00EAEAEA00E9E9E900E8E8E800A4A4A4006C6C6C006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C00E3E3E300E2E2E200E1E1E100E1E1E100E0E0
      E000DFDFDF00DEDEDE00DDDDDD00DCDCDC00DBDBDB00DBDBDB00DADADA00D9D9
      D900D8D8D800D8D8D800D7D7D7006C6C6C008F8F8F00F8F8F800F8F8F800F8F8
      F800F8F8F800F7F7F700F7F7F700F6F6F600F5F5F500F4F4F400F3F3F3008F8F
      8F00E0E0E000E3E3E3007D7D7D00C5C5C50054545400F1F1F10024242400EBEB
      EB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E4E4
      E400E2E2E200E2E2E200E1E1E100242424008F8F8F00F9F9F900F8F8F800F8F8
      F800F8F8F800F7F7F700F7F7F700F6F6F600F5F5F500F3F3F300F3F3F300F2F2
      F200F0F0F000F0F0F000EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEA
      EA00E9E9E900E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3
      E300E2E2E200E1E1E100E0E0E000232323008F8F8F00F9F9F900F8F8F800F8F8
      F800A4A4A400F7F7F700F7F7F700F6F6F600F5F5F500F4F4F400F3F3F300F2F2
      F200F1F1F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEB
      EB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3
      E300E2E2E200E1E1E100E0E0E000242424009A9A9A00EDEDED00ECECEC00EBEB
      EB00EBEBEB00EAEAEA00EAEAEA00E9E9E900A4A4A400E7E7E700E9E9E900EDED
      ED00F1F1F100F4F4F4006C6C6C00E4E4E400E3E3E300E2E2E200E1E1E100E1E1
      E100E0E0E000DFDFDF00DEDEDE00DDDDDD00DCDCDC00DBDBDB00DBDBDB00DADA
      DA00D9D9D900D8D8D800D8D8D8006C6C6C008F8F8F00F9F9F900F8F8F800F8F8
      F800F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600F5F5F500F4F4F4008F8F
      8F00DDDDDD00E0E0E0007D7D7D00CACACA00C3C3C3005454540024242400ECEC
      EC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4
      E400E4E4E400E2E2E200E2E2E200242424008F8F8F00F9F9F900F9F9F900A3A3
      A300A3A3A300A3A3A300F7F7F700A3A3A300A3A3A300A3A3A300A3A3A300F3F3
      F300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300E9E9E900A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300E2E2E200E1E1E100232323008F8F8F00F9F9F900F9F9F900A4A4
      A400A4A4A400A4A4A400F7F7F700F7F7F700F6F6F600F5F5F500F4F4F400F3F3
      F300F2F2F200A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E8E8E800A4A4A400A4A4A400A4A4A400A4A4
      A400E3E3E300E2E2E200E1E1E100242424009A9A9A00EDEDED00EDEDED00ECEC
      EC00EBEBEB00EBEBEB00EAEAEA00EAEAEA00A4A4A400E3E3E300E7E7E700E9E9
      E900EDEDED00F1F1F1006C6C6C00E5E5E500E4E4E400E3E3E300E2E2E200E1E1
      E100E1E1E100E0E0E000DFDFDF00DEDEDE00DDDDDD00DCDCDC00DBDBDB00DBDB
      DB00DADADA00D9D9D900D8D8D8006C6C6C008F8F8F00F9F9F900F9F9F900F8F8
      F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600F5F5F5008F8F
      8F00DBDBDB00DDDDDD007D7D7D00CFCFCF00C8C8C800C2C2C20054545400EDED
      ED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5
      E500E4E4E400E4E4E400E2E2E200242424008F8F8F00F9F9F900F9F9F900A3A3
      A300F8F8F800A3A3A300F8F8F800A3A3A300A3A3A300A3A3A300A3A3A300F3F3
      F300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300E9E9E900A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300E3E3E300E2E2E200232323008F8F8F00F9F9F900F9F9F900A4A4
      A400F8F8F800A4A4A400F8F8F800F7F7F700F7F7F700F6F6F600F5F5F500F4F4
      F400F3F3F300A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E9E9E900A4A4A400A4A4A400A4A4A400A4A4
      A400E4E4E400E3E3E300E2E2E200242424009A9A9A00EEEEEE00EDEDED00EDED
      ED00BBBBBB00EBEBEB00BBBBBB00EAEAEA00A4A4A400E0E0E000E3E3E300E7E7
      E700E9E9E900EDEDED006C6C6C00E6E6E600E5E5E500E4E4E400E3E3E300E2E2
      E200E1E1E100E1E1E100E0E0E000DFDFDF00DEDEDE00DDDDDD00DCDCDC00DBDB
      DB00DBDBDB00DADADA00D9D9D9006C6C6C008F8F8F00F9F9F900F9F9F900F9F9
      F900F8F8F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F6F6F6008F8F
      8F00D9D9D9007D7D7D00DADADA00D4D4D400CDCDCD00C6C6C600C1C1C1005454
      5400EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6
      E600E5E5E500E4E4E400E4E4E400242424008F8F8F00F9F9F900F9F9F900A3A3
      A300A3A3A300A3A3A300F8F8F800A3A3A300A3A3A300A3A3A300A3A3A300F5F5
      F500A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300A3A3A300EAEAEA00A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300A3A3A300E4E4E400E3E3E300232323008F8F8F00F9F9F900F9F9F900A4A4
      A400A4A4A400A4A4A400F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600F5F5
      F500F4F4F400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400EAEAEA00A4A4A400A4A4A400A4A4A400A4A4
      A400E5E5E500E4E4E400E3E3E300242424009A9A9A00EEEEEE00EEEEEE00EDED
      ED00EDEDED00ECECEC00EBEBEB00EBEBEB00A4A4A400DDDDDD00E0E0E000E3E3
      E300E7E7E700E9E9E9006C6C6C00E6E6E600E6E6E600E5E5E500E4E4E400E3E3
      E300E2E2E200E1E1E100E1E1E100E0E0E000DFDFDF00DEDEDE00DDDDDD00DCDC
      DC00DBDBDB00DBDBDB00DADADA006C6C6C008F8F8F00F9F9F900F9F9F900F9F9
      F900F9F9F900F8F8F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7F7008F8F
      8F008F8F8F007D7D7D00DDDDDD007D7D7D007D7D7D007D7D7D00C5C5C500BFBF
      BF0054545400EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7
      E700E6E6E600E5E5E500E4E4E400242424008F8F8F00F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F6F6
      F600F5F5F500F3F3F300F3F3F300F2F2F200F0F0F000F0F0F000EFEFEF00EEEE
      EE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E9E9E900E8E8E800E7E7
      E700E6E6E600E5E5E500E4E4E400232323008F8F8F00F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F6F6
      F600F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EEEE
      EE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7
      E700E6E6E600E5E5E500E4E4E400242424009A9A9A00EFEFEF00EEEEEE00EEEE
      EE00EDEDED00EDEDED00ECECEC00EBEBEB00A4A4A400DBDBDB00DDDDDD00E0E0
      E000E3E3E300E7E7E7006C6C6C00E6E6E600E6E6E600E6E6E600E5E5E500E4E4
      E400E3E3E300E2E2E200E1E1E100E1E1E100E0E0E000DFDFDF00DEDEDE00DDDD
      DD00DCDCDC00DBDBDB00DBDBDB006C6C6C008F8F8F00F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F8F8F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7
      F7007D7D7D00E5E5E5007D7D7D00F3F3F300F1F1F1007D7D7D007D7D7D00C4C4
      C400BEBEBE0054545400E9E9E900ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8
      E800E7E7E700E6E6E600E5E5E500242424008F8F8F00F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8F800F8F8F800F7F7F700F7F7
      F700F6F6F600F5F5F500F3F3F300F3F3F300F2F2F200F0F0F000F0F0F000EFEF
      EF00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E9E9E900E8E8
      E800E7E7E700E6E6E600E5E5E500232323008F8F8F00FAFAFA00F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8F800F8F8F800F7F7F700F7F7
      F700F6F6F600F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F0F0F000EFEF
      EF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8
      E800E7E7E700E6E6E600E5E5E500242424009A9A9A00EFEFEF00EFEFEF00EEEE
      EE00EEEEEE00EDEDED00EDEDED00ECECEC00A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E7E7E700E6E6E600E6E6E600E6E6E600E5E5
      E500E4E4E400E3E3E300E2E2E200E1E1E100E1E1E100E0E0E000DFDFDF00DEDE
      DE00DDDDDD00DCDCDC00DBDBDB006C6C6C008F8F8F00FAFAFA00F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8F800F8F8F800F8F8F800F7F7
      F7007D7D7D007D7D7D00F5F5F500F4F4F400F3F3F300F2F2F200F1F1F1007D7D
      7D00C3C3C300BDBDBD0054545400EBEBEB00ECECEC00EBEBEB00EAEAEA00E9E9
      E900E8E8E800E7E7E700E6E6E600242424008F8F8F00FAFAFA00F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8F800F8F8F800F7F7
      F700F7F7F700F6F6F600F5F5F500F3F3F300F3F3F300F2F2F200F0F0F000F0F0
      F000EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E9E9
      E900E8E8E800E7E7E700E6E6E600232323008F8F8F00FAFAFA00FAFAFA00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8F800F8F8F800F7F7
      F700F7F7F700F6F6F600F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F0F0
      F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9
      E900E8E8E800E7E7E700E6E6E600242424009A9A9A00C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C9006C6C6C008F8F8F00C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C9007D7D7D00CACACA00C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900CACA
      CA007D7D7D007D7D7D00BBBBBB0054545400CACACA00C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900242424008F8F8F00C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8C800C8C8
      C800C8C8C800C8C8C800C8C8C800232323008F8F8F00CACACA00CACACA00CACA
      CA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00CACACA00CACACA00CACACA00242424009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A006C6C6C008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F007D7D7D00BABABA00545454008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F00242424008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F00232323008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F00242424009A9A9A00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB009A9A9A00DBDBDB00DBDBDB006C6C6C008F8F8F00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00D9D9D9007D7D7D00B8B8B80054545400DBDBDB00DBDB
      DB008F8F8F00DBDBDB00DBDBDB00242424008F8F8F00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB008F8F8F00DBDBDB00DBDBDB00DBDBDB00DBDBDB008F8F
      8F00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB008F8F8F00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00232323008F8F8F00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB008F8F8F00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB008F8F8F00DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00242424009A9A9A00E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600DBDB
      DB009A9A9A00E6E6E600E6E6E6006C6C6C008F8F8F00E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E6007D7D7D007D7D7D00E6E6E600DBDB
      DB008F8F8F00E6E6E600E6E6E600242424008F8F8F00E6E6E600E6E6E600E6E6
      E600E6E6E600DBDBDB008F8F8F00E6E6E600E6E6E600E6E6E600DBDBDB008F8F
      8F00E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600DBDBDB008F8F8F00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600232323008F8F8F00E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600DBDB
      DB008F8F8F00E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600DBDBDB008F8F8F00E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600242424009A9A9A00F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200E6E6
      E6009A9A9A00F2F2F200F2F2F2006C6C6C008F8F8F00F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100E6E6
      E6008F8F8F00F1F1F100F1F1F100242424008F8F8F00F1F1F100F1F1F100F1F1
      F100F1F1F100E6E6E6008F8F8F00F1F1F100F1F1F100F1F1F100E6E6E6008F8F
      8F00F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100F1F1F100E6E6E6008F8F8F00F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100232323008F8F8F00F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200E6E6
      E6008F8F8F00F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200E6E6E6008F8F8F00F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200242424009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F
      8F008F8F8F008F8F8F008F8F8F008F8F8F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      0113000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006969
      69BB323232FF626262FB7B7B7BDD1B1B1B590000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00E0E0E000DFDFDF00DFDF
      DF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADADA00D9D9D900D9D9
      D900D8D8D800D7D7D700D6D6D600D6D6D600D5D5D500D4D4D400D4D4D400D3D3
      D300D3D3D300D2D2D200D1D1D100D1D1D100D0D0D000D0D0D000D0D0D000CFCF
      CF00CFCFCF00CECECE00CECECE006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73F16A6A6AFFA0A0A0FF2A2A2AFF323232A70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00E1E1E100E0E0E000DFDF
      DF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADADA00BCBC
      BC00D9D9D900D8D8D800D7D7D700D6D6D600D6D6D600A4A4A4006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D00D1D1D100D0D0D000D0D0D000D0D0
      D000CFCFCF00CFCFCF00CECECE006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5FFF393939FF393939FF3939
      39FF393939FF393939FF393939FF000000000000000000000000000000004E4E
      4EFEADADADFFF3F3F3FF5E5E5EFF121212550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A5FF585858FF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF5858
      58FF585858FF585858FF00000000000000009B9B9B00E2E2E200E1E1E100E0E0
      E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADA
      DA00D9D9D900D9D9D900D8D8D800D7D7D700D6D6D600A4A4A400E7E7E700EAEA
      EA00EEEEEE00F2F2F200F4F4F4006D6D6D00D1D1D100D1D1D100D0D0D000D0D0
      D000D0D0D000CFCFCF00CFCFCF006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5FFFADADADFFA3A3A3FF9B9B
      9BFF939393FF8B8B8BFF393939FF000000000000000000000000010101133535
      35FFDADADAFFF3F3F3FF5E5E5EFF212121620000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A5FFA2A2A2FFA0A0A0FF9E9E
      9EFF9B9B9BFF999999FF979797FF959595FF949494FF939393FF919191FF9090
      90FF8F8F8FFF585858FF00000000000000009B9B9B00E3E3E300E2E2E200E1E1
      E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00BCBC
      BC00DADADA00BCBCBC00D9D9D900BCBCBC00D7D7D700A4A4A400E3E3E300E7E7
      E700EAEAEA00EEEEEE00F2F2F2006D6D6D00D2D2D200D1D1D100D1D1D100D0D0
      D000D0D0D000CFCFCF00CFCFCF006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5FFFBABABAFFB1B1B1FFA8A8
      A8FF9F9F9FFF969696FF393939FF000000000000000000000000424242903D3D
      3DFFF7F7F7FFD0D0D0FF3A3A3AFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A5FFA6A6A6FFA4A4A4FFA1A1
      A1FF9F9F9FFF9D9D9DFF9B9B9BFF999999FF969696FF959595FF949494FF9292
      92FF919191FF585858FF00000000000000009B9B9B00E3E3E300E3E3E300E2E2
      E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDC
      DC00DBDBDB00DADADA00D9D9D900D9D9D900D8D8D800A4A4A400E1E1E100E3E3
      E300E7E7E700EAEAEA00EEEEEE006D6D6D00D3D3D300D2D2D200D1D1D100D1D1
      D100D0D0D000D0D0D000CFCFCF006D6D6D000000000038383896585858FF5858
      58FF585858FF585858FF38383896000000000000000038383896585858FF5858
      58FF585858FF585858FF585858FF383838960000000000000000000000000000
      000038383896585858FF585858FF585858FF585858FF585858FF383838960000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636363FF313131FF313131FF5F5F5FFFC8C8C8FFBEBEBEFFB5B5
      B5FFABABABFFA3A3A3FF393939FF000000000000000000000000797979E46262
      62FFFBFBFBFF9E9E9EFF5B5B5BFC000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A5FF585858FF5858
      58FF585858FF585858FF585858FF585858FFA5A5A5FFAAAAAAFFA8A8A8FFA5A5
      A5FFA3A3A3FFA1A1A1FF9F9F9FFF9C9C9CFF9A9A9AFF989898FF969696FF9595
      95FF939393FF585858FF00000000000000009B9B9B00E4E4E400E3E3E300E3E3
      E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00BCBC
      BC00DCDCDC00DBDBDB00DADADA00D9D9D900D9D9D900A4A4A400DEDEDE00E1E1
      E100E3E3E300E7E7E700EAEAEA006D6D6D00D3D3D300D3D3D300D2D2D200D1D1
      D100D1D1D100D0D0D000D0D0D0006D6D6D0000000000585858FFC9C9C9FFC9C9
      C9FFC8C8C8FFC7C7C7FF585858FF0000000000000000585858FFBFBFBFFFBEBE
      BEFFBDBDBDFFBCBCBCFFBBBBBBFF585858FF0000000000000000383838965858
      58FF585858FFC5C5C5FFC3C3C3FFC2C2C2FFC1C1C1FFC0C0C0FF585858FF5858
      58FF383838960000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636363FFD8D8D8FFD5D5D5FF5F5F5FFFD4D4D4FFCCCCCCFFC2C2
      C2FFB9B9B9FFB0B0B0FF393939FF0000000000000000000000005F5F5FFCA1A1
      A1FFFBFBFBFF686868FF797979E4000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A5FFCECECEFFCDCD
      CDFFCCCCCCFFCBCBCBFFCACACAFFC9C9C9FFA5A5A5FFAFAFAFFFACACACFFA9A9
      A9FFA7A7A7FFA5A5A5FFA3A3A3FFA0A0A0FF9E9E9EFF9C9C9CFF999999FF9797
      97FF959595FF585858FF00000000000000009B9B9B00E5E5E500E4E4E400E3E3
      E300E3E3E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDD
      DD00DCDCDC00DCDCDC00DBDBDB00DADADA00D9D9D900A4A4A400DCDCDC00DEDE
      DE00E1E1E100E3E3E300E7E7E7006D6D6D00D4D4D400D3D3D300D3D3D300D2D2
      D200D1D1D100D1D1D100D0D0D0006D6D6D0000000000585858FFCBCBCBFFCACA
      CAFFC9C9C9FFC9C9C9FF585858FF0000000038383896585858FFC1C1C1FFC0C0
      C0FFBFBFBFFFBEBEBEFF585858FF383838960000000038383896585858FFC9C9
      C9FFC9C9C9FFC8C8C8FFC6C6C6FFC4C4C4FFC3C3C3FFC1C1C1FFC0C0C0FFBFBF
      BFFF585858FF3838389600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636363FFDDDDDDFFD9D9D9FF5F5F5FFFE0E0E0FFD8D8D8FFD0D0
      D0FFC7C7C7FFBDBDBDFF393939FF000000000000000000000000494949FF3B3B
      3BFF717171FF373737FF4040408E000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A5FFCFCFCFFFCECE
      CEFFCDCDCDFFCCCCCCFFCBCBCBFFCACACAFFA5A5A5FFB3B3B3FFB1B1B1FFAEAE
      AEFFABABABFFA8A8A8FFA6A6A6FFA4A4A4FFA2A2A2FFA0A0A0FF9D9D9DFF9B9B
      9BFF999999FF585858FF00000000000000009B9B9B00E6E6E600E5E5E500E4E4
      E400E3E3E300E3E3E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDFDF00BCBC
      BC00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADADA00A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400A4A4A400D4D4D400D4D4D400D3D3D300D3D3
      D300D2D2D200D1D1D100D1D1D1006D6D6D0000000000585858FFCECECEFFCCCC
      CCFFCACACAFFC9C9C9FF585858FF38383896585858FFC5C5C5FFC3C3C3FFC2C2
      C2FFC0C0C0FF585858FF383838960000000000000000585858FFCCCCCCFFCACA
      CAFFC9C9C9FFC9C9C9FFC8C8C8FFC6C6C6FFC4C4C4FFC3C3C3FFC1C1C1FFC0C0
      C0FFBFBFBFFF585858FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000606060FF3F3F
      3FFF3F3F3FFF636363FFE1E1E1FFDEDEDEFF5F5F5FFFB4B4B4FF808080FF7C7C
      7CFF7B7B7BFF9F9F9FFF393939FF000000000000000016161650282828FF3232
      32FF282828FF313131FF00000010000000000000000000000000A5A5A5FF5858
      58FF585858FF585858FF585858FF585858FF585858FFA5A5A5FFD0D0D0FFD0D0
      D0FFCFCFCFFFCECECEFFCDCDCDFFCCCCCCFFA5A5A5FFB7B7B7FFB5B5B5FFB3B3
      B3FFB0B0B0FFADADADFFABABABFFA8A8A8FFA5A5A5FFA3A3A3FFA1A1A1FF9F9F
      9FFF9D9D9DFF585858FF00000000000000009B9B9B00E6E6E600E6E6E600E5E5
      E500E4E4E400E3E3E300E3E3E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDF
      DF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADADA00D9D9D900D9D9
      D900D8D8D800D7D7D700D6D6D600D6D6D600D5D5D500D4D4D400D4D4D400D3D3
      D300D3D3D300D2D2D200D1D1D1006D6D6D0000000000585858FFD0D0D0FFCFCF
      CFFFCDCDCDFFCBCBCBFF585858FF585858FFC9C9C9FFC7C7C7FFC5C5C5FFC3C3
      C3FFC2C2C2FF585858FF000000000000000038383896585858FFCFCFCFFFCDCD
      CDFFCBCBCBFFC9C9C9FFC9C9C9FFC8C8C8FFC7C7C7FFC5C5C5FFC3C3C3FFC2C2
      C2FFC1C1C1FF585858FF38383896000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000606060FFCCCC
      CCFFCACACAFF636363FFE5E5E5FFE2E2E2FF5F5F5FFFBABABAFF828282FF8181
      81FF7D7D7DFFA8A8A8FF393939FF0000000000000000767676CB1D1D1DFF3434
      34FF2C2C2CFF5D5D5DFE00000000000000000000000000000000A5A5A5FFD3D3
      D3FFD3D3D3FFD1D1D1FFD0D0D0FFCFCFCFFFCFCFCFFFA5A5A5FFD2D2D2FFD1D1
      D1FFD0D0D0FFD0D0D0FFCFCFCFFFCECECEFFA5A5A5FFBCBCBCFFB9B9B9FFB6B6
      B6FFB4B4B4FFB2B2B2FFAFAFAFFFACACACFFAAAAAAFFA7A7A7FFA5A5A5FFA3A3
      A3FFA1A1A1FF585858FF00000000000000009B9B9B00E7E7E700E6E6E600E6E6
      E600E5E5E500E4E4E400E3E3E300E3E3E300E2E2E200E1E1E100E0E0E000BCBC
      BC00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADADA00D9D9
      D900D9D9D900D8D8D800D7D7D700D6D6D600D6D6D600D5D5D500D4D4D400D4D4
      D400D3D3D300D3D3D300D2D2D2006D6D6D0000000000585858FFD3D3D3FFD1D1
      D1FFCFCFCFFFCECECEFF585858FFCACACAFFC9C9C9FFC9C9C9FFC8C8C8FFC6C6
      C6FF585858FF383838960000000000000000585858FFD3D3D3FFD1D1D1FFCFCF
      CFFFCDCDCDFFCBCBCBFF585858FF585858FF585858FFC7C7C7FFC6C6C6FFC4C4
      C4FFC3C3C3FFC1C1C1FF585858FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000606060FFD2D2
      D2FFCFCFCFFF636363FFE9E9E9FFE6E6E6FF5F5F5FFFFAFAFAFFF7F7F7FFF1F1
      F1FFEBEBEBFFE3E3E3FF393939FF00000000000000007F7F7FF7232323FF3434
      34FF212121FF838383F300000000000000000000000000000000A5A5A5FFD6D6
      D6FFD5D5D5FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFA5A5A5FFD3D3D3FFD2D2
      D2FFD1D1D1FFD0D0D0FFD0D0D0FFCFCFCFFFA5A5A5FFC0C0C0FFBDBDBDFFBBBB
      BBFFB8B8B8FFB6B6B6FFB4B4B4FFB1B1B1FFAEAEAEFFABABABFFA9A9A9FFA7A7
      A7FFA4A4A4FF585858FF00000000000000009B9B9B00E8E8E800E7E7E700E6E6
      E600E6E6E600E5E5E500E4E4E400E3E3E300E3E3E300E2E2E200E1E1E100E0E0
      E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00A4A4A4006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D00D6D6D600D6D6D600D5D5D500D4D4
      D400D4D4D400D3D3D300D3D3D3006D6D6D0000000000585858FFD5D5D5FFD3D3
      D3FFD2D2D2FFD0D0D0FF585858FFCCCCCCFFCBCBCBFFC9C9C9FFC9C9C9FF5858
      58FF38383896000000000000000000000000585858FFD5D5D5FFD3D3D3FFD2D2
      D2FFCFCFCFFF585858FF383838960000000038383896585858FFC8C8C8FFC6C6
      C6FFC4C4C4FFC3C3C3FF585858FF000000000000000000000000000000008A8A
      8AFF656565FF656565FF00000000000000000000000000000000767676FF6363
      63FF626262FF636363FFD1D1D1FF909090FF5F5F5FFF5F5F5FFF5F5F5FFF5F5F
      5FFF5F5F5FFF5F5F5FFF5F5F5FFF0000000000000000565656FF2D2D2DFF3434
      34FF1D1D1DFF686868BA00000000000000000000000000000000A5A5A5FFD7D7
      D7FFD7D7D7FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2D2FFA5A5A5FFD6D6D6FFD4D4
      D4FFD3D3D3FFD2D2D2FFD1D1D1FFD0D0D0FFA5A5A5FFC4C4C4FFC2C2C2FFC0C0
      C0FFBDBDBDFFBABABAFFB8B8B8FFB5B5B5FFB3B3B3FFB0B0B0FFADADADFFABAB
      ABFFA8A8A8FF585858FF00000000000000009B9B9B00E9E9E900E8E8E800E7E7
      E700E6E6E600E6E6E600E5E5E500E4E4E400E3E3E300E3E3E300E2E2E200BCBC
      BC00E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00A4A4A400E7E7E700EAEA
      EA00EEEEEE00F2F2F200F4F4F4006D6D6D00D7D7D700D6D6D600D6D6D600D5D5
      D500D4D4D400D4D4D400D3D3D3006D6D6D0000000000585858FFD7D7D7FFD5D5
      D5FFD4D4D4FFD2D2D2FFD1D1D1FFCFCFCFFFCDCDCDFFCBCBCBFFCACACAFF5858
      58FF585858FF383838960000000000000000585858FFD6D6D6FFD5D5D5FFD4D4
      D4FFD2D2D2FF585858FF000000000000000000000000585858FFC9C9C9FFC8C8
      C8FFC7C7C7FFC5C5C5FF585858FF000000000000000000000000000000008787
      87FFD1D1D1FFC0C0C0FF646464FF656565FF7C7C7CFF898989FFB6B6B6FFC3C3
      C3FF626262FF636363FFD4D4D4FF919191FF909090FF8F8F8FFFCCCCCCFF3131
      31FF0000000000000000000000000000000005050526323232FF343434FF3535
      35FF2A2A2AFF0F0F0F4100000000000000000000000000000000A5A5A5FFDADA
      DAFFD9D9D9FFD7D7D7FFD6D6D6FFD5D5D5FFD4D4D4FFA5A5A5FFD8D8D8FFD7D7
      D7FFD5D5D5FFD4D4D4FFD3D3D3FFD2D2D2FFA5A5A5FFC8C8C8FFC6C6C6FFC4C4
      C4FFC1C1C1FFBFBFBFFFBCBCBCFFB9B9B9FFB7B7B7FFB5B5B5FFB2B2B2FFAFAF
      AFFFACACACFF585858FF00000000000000009B9B9B00E9E9E900E9E9E900E8E8
      E800E7E7E700E6E6E600E6E6E600E5E5E500E4E4E400E3E3E300E3E3E300E2E2
      E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00A4A4A400E3E3E300E7E7
      E700EAEAEA00EEEEEE00F2F2F2006D6D6D00D8D8D800D7D7D700D6D6D600D6D6
      D600D5D5D500D4D4D400D4D4D4006D6D6D0000000000585858FFD9D9D9FFD7D7
      D7FFD6D6D6FFD5D5D5FFD3D3D3FFD2D2D2FFCFCFCFFFCECECEFFCCCCCCFFCACA
      CAFFC9C9C9FF585858FF3838389600000000585858FFD9D9D9FFD7D7D7FFD5D5
      D5FFD4D4D4FF585858FF000000000000000000000000585858FFCACACAFFC9C9
      C9FFC9C9C9FFC7C7C7FF585858FF000000000000000000000000000000008181
      81FFCACACAFFD3D3D3FFCECECEFFB6B6B6FFB4B4B4FFC7C7C7FFC7C7C7FFBDBD
      BDFF6F6F6FFF636363FFF3F3F3FFF1F1F1FFEEEEEEFFECECECFFE9E9E9FF3131
      31FF00000000000000000000000000000000555555A41E1E1EFF343434FF3030
      30FF4D4D4DFF0000000000000000000000000000000000000000A5A5A5FFDCDC
      DCFFDBDBDBFFDADADAFFD8D8D8FFD7D7D7FFD6D6D6FFA5A5A5FFDADADAFFD8D8
      D8FFD7D7D7FFD7D7D7FFD5D5D5FFD4D4D4FFA5A5A5FFCCCCCCFFCACACAFFC8C8
      C8FFC5C5C5FFC3C3C3FFC0C0C0FFBEBEBEFFBCBCBCFFB9B9B9FFB6B6B6FFB4B4
      B4FFB1B1B1FF585858FF00000000000000009B9B9B00EAEAEA00E9E9E900E9E9
      E900E8E8E800E7E7E700E6E6E600E6E6E600E5E5E500E4E4E400E3E3E300BCBC
      BC00E2E2E200BCBCBC00E0E0E000BCBCBC00DFDFDF00A4A4A400E1E1E100E3E3
      E300E7E7E700EAEAEA00EEEEEE006D6D6D00D9D9D900D8D8D800D7D7D700D6D6
      D600D6D6D600D5D5D500D4D4D4006D6D6D0000000000585858FFDADADAFFDADA
      DAFFD8D8D8FFD6D6D6FFD5D5D5FFD4D4D4FFD2D2D2FFD0D0D0FFCFCFCFFFCDCD
      CDFFCBCBCBFFC9C9C9FF585858FF38383896585858FFDADADAFFD9D9D9FFD7D7
      D7FFD6D6D6FF585858FF000000000000000000000000585858FFCCCCCCFFCACA
      CAFFC9C9C9FFC9C9C9FF585858FF000000000000000000000000000000008181
      81FFC4C4C4FFD3D3D3FFCECECEFFCECECEFFCCCCCCFFC7C7C7FFC7C7C7FFB9B9
      B9FF7C7C7CFF636363FF636363FF636363FF636363FF636363FF636363FF6363
      63FF00000000000000000000000000000000878787ED1C1C1CFF343434FF2525
      25FF777777FA0000000000000000000000000000000000000000A5A5A5FFDEDE
      DEFFDDDDDDFFDCDCDCFFDBDBDBFFD9D9D9FFD8D8D8FFA5A5A5FFDBDBDBFFDADA
      DAFFD9D9D9FFD8D8D8FFD7D7D7FFD6D6D6FFA5A5A5FFD0D0D0FFCECECEFFCCCC
      CCFFC9C9C9FFC7C7C7FFC4C4C4FFC2C2C2FFC0C0C0FFBDBDBDFFBBBBBBFFB8B8
      B8FFB5B5B5FF585858FF00000000000000009B9B9B00EBEBEB00EAEAEA00E9E9
      E900E9E9E900E8E8E800E7E7E700E6E6E600E6E6E600E5E5E500E4E4E400E3E3
      E300E3E3E300E2E2E200E1E1E100E0E0E000DFDFDF00A4A4A400DEDEDE00E1E1
      E100E3E3E300E7E7E700EAEAEA006D6D6D00D9D9D900D9D9D900D8D8D800D7D7
      D700D6D6D600D6D6D600D5D5D5006D6D6D0000000000585858FFDCDCDCFFDBDB
      DBFFDADADAFFD9D9D9FF585858FF585858FF585858FF585858FFD1D1D1FFCFCF
      CFFFCDCDCDFFCCCCCCFFCACACAFF585858FF585858FFDCDCDCFFDADADAFFDADA
      DAFFD8D8D8FF585858FF000000000000000000000000585858FFCECECEFFCCCC
      CCFFCACACAFFC9C9C9FF585858FF000000000000000000000000000000008D8D
      8DFFB8B8B8FFD8D8D8FFD1D1D1FFCECECEFFCBCBCBFFC9C9C9FFCACACAFFADAD
      ADFF878787FF8C8C8CFF8B8B8BFFC9C9C9FF3F3F3FFF00000000000000000000
      000000000000000000000000000000000000626262FE3B3B3BFF2A2A2AFF1C1C
      1CFF7F7F7FDA0000000000000000000000000000000000000000A5A5A5FFE0E0
      E0FFDFDFDFFFDEDEDEFFDDDDDDFFDCDCDCFFDADADAFFA5A5A5FFDEDEDEFFDCDC
      DCFFDBDBDBFFDADADAFFD9D9D9FFD8D8D8FFA5A5A5FFD4D4D4FFA5A5A5FF7E7E
      7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
      7EFFBABABAFF585858FF00000000000000009B9B9B00EBEBEB00EBEBEB00EAEA
      EA00E9E9E900E9E9E900E8E8E800E7E7E700E6E6E600E6E6E600E5E5E500BCBC
      BC00E3E3E300E3E3E300E2E2E200E1E1E100E0E0E000A4A4A400DCDCDC00DEDE
      DE00E1E1E100E3E3E300E7E7E7006D6D6D00DADADA00D9D9D900D9D9D900D8D8
      D800D7D7D700D6D6D600D6D6D6006D6D6D0000000000585858FFDEDEDEFFDDDD
      DDFFDBDBDBFFDADADAFF585858FF000000000000000038383896585858FFD2D2
      D2FFD0D0D0FFCECECEFFCCCCCCFF585858FF585858FFDDDDDDFFDCDCDCFFDBDB
      DBFFDADADAFF585858FF000000000000000000000000585858FFD0D0D0FFCFCF
      CFFFCDCDCDFFCBCBCBFF585858FF000000000000000000000000000000008585
      85FFCECECEFFDDDDDDFFD5D5D5FFD2D2D2FFCECECEFFCBCBCBFFCBCBCBFFBBBB
      BBFF636363FFEDEDEDFFEBEBEBFFE8E8E8FF3F3F3FFF00000000000000000000
      000000000000000000000000000000000000343434FFDEDEDEFFE3E3E3FF2C2C
      2CFF2D2D2D740000000000000000000000000000000000000000A5A5A5FFE2E2
      E2FFE1E1E1FFE0E0E0FFDFDFDFFFDEDEDEFFDDDDDDFFA5A5A5FFDFDFDFFFDEDE
      DEFFDDDDDDFFDBDBDBFFDBDBDBFFDADADAFFA5A5A5FFD7D7D7FFA5A5A5FFD1D1
      D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FF7E7E
      7EFFBEBEBEFF585858FF00000000000000009B9B9B00EBEBEB00EBEBEB00EBEB
      EB00EAEAEA00E9E9E900E9E9E900E8E8E800E7E7E700E6E6E600E6E6E600E5E5
      E500E4E4E400E3E3E300E3E3E300E2E2E200E1E1E100A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400A4A4A400DBDBDB00DADADA00D9D9D900D9D9
      D900D8D8D800D7D7D700D6D6D6006D6D6D0000000000585858FFE0E0E0FFDFDF
      DFFFDDDDDDFFDCDCDCFF585858FF000000000000000000000000585858FFD4D4
      D4FFD2D2D2FFD1D1D1FFCFCFCFFF585858FF585858FFDFDFDFFFDEDEDEFFDCDC
      DCFFDBDBDBFF585858FF000000000000000000000000585858FFD3D3D3FFD1D1
      D1FFCFCFCFFFCDCDCDFF585858FF000000000000000000000000828282FFD2D2
      D2FFE7E7E7FFDFDFDFFFDCDCDCFFD8D8D8FFD3D3D3FFCFCFCFFFCBCBCBFFCCCC
      CCFFB9B9B9FF636363FF606060FF606060FF606060FF00000000000000000000
      00000000000000000000000000002828286D393939FFF5F5F5FFDBDBDBFF3838
      38FF000000040000000000000000000000000000000000000000A5A5A5FFE4E4
      E4FFE3E3E3FFE2E2E2FFE1E1E1FFE0E0E0FFDFDFDFFFA5A5A5FFE1E1E1FFE0E0
      E0FFDFDFDFFFDEDEDEFFDCDCDCFFDBDBDBFFA5A5A5FFD9D9D9FFA5A5A5FFD1D1
      D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FF7E7E
      7EFFC3C3C3FF585858FF00000000000000009B9B9B00ECECEC00EBEBEB00EBEB
      EB00EBEBEB00EAEAEA00E9E9E900E9E9E900E8E8E800E7E7E700E6E6E600BCBC
      BC00E5E5E500E4E4E400E3E3E300E3E3E300E2E2E200E1E1E100E0E0E000DFDF
      DF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADADA00D9D9
      D900D9D9D900D8D8D800D7D7D7006D6D6D0000000000585858FFE2E2E2FFE0E0
      E0FFDFDFDFFFDEDEDEFF585858FF000000000000000038383896585858FFD5D5
      D5FFD5D5D5FFD3D3D3FFD1D1D1FF585858FF585858FFE1E1E1FFE0E0E0FFDEDE
      DEFFDDDDDDFF585858FF000000000000000000000000585858FFD5D5D5FFD3D3
      D3FFD2D2D2FFCFCFCFFF585858FF0000000000000000888888FFD7D7D7FFF2F2
      F2FFE9E9E9FFE6E6E6FFE3E3E3FFDEDEDEFFD9D9D9FFD3D3D3FFCFCFCFFFCBCB
      CBFFCECECEFFB9B9B9FF636363FF000000000000000000000000000000000000
      0000000000000000000000000000767676D85C5C5CFFFBFBFBFFAAAAAAFF5252
      52FE000000000000000000000000000000000000000000000000A5A5A5FFE7E7
      E7FFE5E5E5FFE4E4E4FFE3E3E3FFE1E1E1FFE1E1E1FFA5A5A5FFE2E2E2FFA5A5
      A5FF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFFA5A5A5FFDCDCDCFFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFC6C6C6FF585858FF00000000000000009B9B9B00EDEDED00ECECEC00EBEB
      EB00EBEBEB00EBEBEB00EAEAEA00E9E9E900A4A4A4006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D00E3E3E300E3E3E300E2E2E200E1E1E100E0E0
      E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DADA
      DA00D9D9D900D9D9D900D8D8D8006D6D6D0000000000585858FFE3E3E3FFE2E2
      E2FFE1E1E1FFE0E0E0FF585858FF585858FF585858FF585858FFDADADAFFD8D8
      D8FFD6D6D6FFD5D5D5FFD4D4D4FF585858FF585858FFE2E2E2FFE1E1E1FFE0E0
      E0FFDFDFDFFF585858FF000000000000000000000000585858FFD6D6D6FFD5D5
      D5FFD4D4D4FFD2D2D2FF585858FF00000000929292FFB5B5B5FFE7E7E7FFECEC
      ECFFF2F2F2FFF1F1F1FFE9E9E9FFE3E3E3FFDFDFDFFFD8D8D8FFD6D6D6FFD0D0
      D0FFC8C8C8FFC2C2C2FF9F9F9FFF888888FF0000000000000000000000000000
      0000000000000000000000000000656565FA919191FFFBFBFBFF737373FF7676
      76EE000000000000000000000000000000000000000000000000A5A5A5FFE9E9
      E9FFE8E8E8FFE6E6E6FFE5E5E5FFE4E4E4FFE2E2E2FFA5A5A5FFE3E3E3FFA5A5
      A5FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFA5A5A5FFDEDEDEFFDDDDDDFFDBDB
      DBFFDADADAFFD8D8D8FFD7D7D7FFD5D5D5FFD3D3D3FFD1D1D1FFCFCFCFFFCDCD
      CDFFCBCBCBFF585858FF00000000000000009B9B9B00EDEDED00EDEDED00ECEC
      EC00EBEBEB00EBEBEB00EBEBEB00EAEAEA00A4A4A400E7E7E700EAEAEA00EEEE
      EE00F2F2F200F4F4F4006D6D6D00E4E4E400E3E3E300E3E3E300E2E2E200E1E1
      E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00DBDB
      DB00DADADA00D9D9D900D9D9D9006D6D6D0000000000585858FFE5E5E5FFE4E4
      E4FFE2E2E2FFE1E1E1FFE0E0E0FFDFDFDFFFDDDDDDFFDCDCDCFFDBDBDBFFDADA
      DAFFD9D9D9FFD7D7D7FFD5D5D5FF585858FF585858FFE4E4E4FFE3E3E3FFE2E2
      E2FFE0E0E0FF585858FF000000000000000000000000585858FFD9D9D9FFD7D7
      D7FFD5D5D5FFD4D4D4FF585858FF00000000000000009A9A9AFF8F8F8FFF8E8E
      8EFF919191FFB8B8B8FFEEEEEEFFEAEAEAFFE4E4E4FFDDDDDDFFA9A9A9FF8787
      87FF828282FF868686FF8F8F8FFF0707072E303030867C7C7CFF141414540000
      0000000000000000000000000000414141FFCDCDCDFFFBFBFBFF474747FF5959
      59AD000000000000000000000000000000000000000000000000A5A5A5FFEBEB
      EBFFEAEAEAFFE9E9E9FFE8E8E8FFE6E6E6FFE5E5E5FFA5A5A5FFE5E5E5FFA5A5
      A5FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFA5A5A5FFDFDFDFFFDFDFDFFFDEDE
      DEFFDCDCDCFFDBDBDBFFD9D9D9FFD8D8D8FFD6D6D6FFD4D4D4FFD3D3D3FFD1D1
      D1FFCFCFCFFF585858FF00000000000000009B9B9B00EDEDED00EDEDED00EDED
      ED00ECECEC00EBEBEB00EBEBEB00EBEBEB00A4A4A400E3E3E300E7E7E700EAEA
      EA00EEEEEE00F2F2F2006D6D6D00E5E5E500E4E4E400E3E3E300E3E3E300E2E2
      E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDCDC00DCDC
      DC00DBDBDB00DADADA00D9D9D9006D6D6D0000000000585858FFE6E6E6FFE5E5
      E5FFE4E4E4FFE3E3E3FFE2E2E2FFE1E1E1FFDFDFDFFFDEDEDEFFDDDDDDFFDBDB
      DBFFDADADAFFD9D9D9FF585858FF38383896585858FFE5E5E5FFE4E4E4FFE3E3
      E3FFE2E2E2FF585858FF000000000000000000000000585858FFDADADAFFD9D9
      D9FFD7D7D7FFD6D6D6FF585858FF000000000000000000000000000000000000
      000000000000888888FFD2D2D2FFF1F1F1FFEBEBEBFFC6C6C6FF6B6B6BFF0202
      0219949494FFB8B8B8FF787878FD808080FDAAAAAAFF909090FF1E1E1E6D0000
      0000000000000000000000000000191919FFC3C3C3FFE6E6E6FF313131FF0707
      072D000000000000000000000000000000000000000000000000A5A5A5FFEDED
      EDFFA5A5A5FF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFFA5A5A5FFE6E6E6FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDDDDDDFFDCDCDCFFDADADAFFD9D9D9FFD7D7D7FFD6D6D6FFD4D4
      D4FFD2D2D2FF585858FF00000000000000009B9B9B00EEEEEE00EDEDED00EDED
      ED00BCBCBC00ECECEC00BCBCBC00EBEBEB00A4A4A400E1E1E100E3E3E300E7E7
      E700EAEAEA00EEEEEE006D6D6D00E6E6E600E5E5E500E4E4E400E3E3E300E3E3
      E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDDDD00DCDC
      DC00DCDCDC00DBDBDB00DADADA006D6D6D0000000000585858FFE8E8E8FFE6E6
      E6FFE5E5E5FFE5E5E5FFE3E3E3FFE2E2E2FFE1E1E1FFE0E0E0FFDFDFDFFFDDDD
      DDFFDCDCDCFF585858FF3838389600000000585858FFE6E6E6FFE5E5E5FFE5E5
      E5FFE3E3E3FF585858FF000000000000000000000000585858FFDCDCDCFFDADA
      DAFFDADADAFFD8D8D8FF585858FF000000000000000000000000000000000000
      000000000000000000009B9B9BFFF4F4F4FFEDEDEDFF797979FF000000000101
      01188C8C8CFDD1D1D1FFCDCDCDFFC6C6C6FFC7C7C7FF999999FF1E1E1E670000
      00000000000000000000000000006F6F6FF9444444FF2D2D2DFF484848FF0000
      0000000000000000000000000000000000000000000000000000A5A5A5FFEFEF
      EFFFA5A5A5FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFA5A5A5FFE7E7E7FFE6E6
      E6FFE5E5E5FFE5E5E5FFE4E4E4FFE3E3E3FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FF00000000000000009B9B9B00EFEFEF00EEEEEE00EDED
      ED00EDEDED00EDEDED00ECECEC00EBEBEB00A4A4A400DEDEDE00E1E1E100E3E3
      E300E7E7E700EAEAEA006D6D6D00E6E6E600E6E6E600E5E5E500E4E4E400E3E3
      E300E3E3E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDEDE00DDDD
      DD00DCDCDC00DCDCDC00DBDBDB006D6D6D0000000000585858FFE8E8E8FFE8E8
      E8FFE7E7E7FFE6E6E6FFE5E5E5FFE4E4E4FFE3E3E3FFE2E2E2FFE0E0E0FF5858
      58FF585858FF383838960000000000000000585858FFE8E8E8FFE7E7E7FFE6E6
      E6FFE5E5E5FF585858FF000000000000000000000000585858FFDDDDDDFFDCDC
      DCFFDBDBDBFFDADADAFF585858FF000000000000000000000000000000000000
      000000000000000000008D8D8DFFDBDBDBFFD8D8D8FF8A8A8AFF000000000000
      000F8C8C8CFDD2D2D2FFCECECEFFC8C8C8FFC8C8C8FF939393FF191919610000
      0000000000000000000000000000000000000000000008080830434343900000
      0000000000000000000000000000000000000000000000000000A5A5A5FFF1F1
      F1FFA5A5A5FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFA5A5A5FFE7E7E7FFE7E7
      E7FFE6E6E6FFE6E6E6FFE5E5E5FFE5E5E5FFE4E4E4FFE3E3E3FFE2E2E2FFE1E1
      E1FFE1E1E1FFE0E0E0FF585858FF000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00EFEFEF00EFEFEF00EEEE
      EE00EDEDED00EDEDED00EDEDED00ECECEC00A4A4A400DCDCDC00DEDEDE00E1E1
      E100E3E3E300E7E7E7006D6D6D00E7E7E700E6E6E600E6E6E600E5E5E500E4E4
      E400E3E3E300E3E3E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDFDF00DEDE
      DE00DDDDDD00DCDCDC00DCDCDC006D6D6D000000000038383896585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF3838
      38960000000000000000000000000000000038383896585858FF585858FF5858
      58FF585858FF3838389600000000000000000000000038383896585858FF5858
      58FF585858FF585858FF38383896000000000000000000000000000000000000
      00000000000000000000000000009E9E9EFF9C9C9CFF00000000000000069B9B
      9BFFCACACAFFDFDFDFFFD5D5D5FFCDCDCDFFC9C9C9FFC0C0C0FF696969E20C0C
      0C45666666E35F5F5FED2D2D2DA76E6E6EE9575757EA01010128000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5FFF1F1
      F1FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFE7E7E7FFE7E7
      E7FFE7E7E7FFE7E7E7FFE6E6E6FFE6E6E6FFE5E5E5FFE4E4E4FFE4E4E4FFE3E3
      E3FFE2E2E2FFE1E1E1FF585858FF000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00F0F0F000EFEFEF00EFEF
      EF00EEEEEE00EDEDED00EDEDED00EDEDED00A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400E8E8E800E7E7E700E6E6E600E6E6E600E5E5
      E500E4E4E400E3E3E300E3E3E300E2E2E200E1E1E100E0E0E000DFDFDF00DFDF
      DF00DEDEDE00DDDDDD00DCDCDC006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5FFA4A4A4FF000000009B9B9BFFBFBF
      BFFFEFEFEFFFEBEBEBFFE2E2E2FFD6D6D6FFD1D1D1FFC9C9C9FFB5B5B5FF6B6B
      6BF0838383FFBBBBBBFFAEAEAEFFBDBDBDFF737373E402020227000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5FFF3F3
      F3FFF2F2F2FFF1F1F1FFF1F1F1FFF1F1F1FFEFEFEFFFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FF000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00CACACA00CACACA00CACA
      CA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00CACACA00CACACA00CACACA006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F1F1F658E8E
      8EFF8E8E8EFF919191FFEAEAEAFFE6E6E6FFADADADFF828282FF828282FF4747
      47A7838383FFDADADAFFDBDBDBFFCDCDCDFF757575E902020229000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5FFF3F3
      F3FFF3F3F3FFF2F2F2FFF2F2F2FFF1F1F1FFF1F1F1FFF0F0F0FFEFEFEFFFEEEE
      EEFFEDEDEDFFECECECFFEBEBEBFF585858FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C1C1C63C8C8C8FFDEDEDEFF888888FF00000001000000009B9B
      9BFFCECECEFFEEEEEEFFDBDBDBFFD6D6D6FFB7B7B7FF7E7E7EFF000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5FFF3F3
      F3FFF3F3F3FFF3F3F3FFF3F3F3FFF2F2F2FFF2F2F2FFF1F1F1FFF1F1F1FFF0F0
      F0FFEFEFEFFFEDEDEDFFEDEDEDFF585858FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC009B9B9B00DCDCDC00DCDCDC006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000E9B9B9BFFAAAAAAF91111114A00000000000000009B9B
      9BFF9B9B9BFFB8B8B8F5EBEBEBFFB2B2B2FF999999FF4B4B4BBD000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DCDC
      DC009B9B9B00E7E7E700E7E7E7006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002A2A2A76A4A4A4FF0000000000000000000000000000
      00120101011B9B9B9BFFBFBFBFFFA4A4A4FF0101011C00000012000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B00F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200E7E7
      E7009B9B9B00F2F2F200F2F2F2006D6D6D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000E0E0E4D8D8D8DFF121212570000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000003000000110000002700000035000000380000
      0035000000270000001100000003000000000000000000000000000000000000
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
      00000000000000000000000000080000002700000054000000730000007B0000
      0073000000540000002700000008000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000979797FF7979
      79FF797979FF797979FF797979FF797979FF797979FF5E5E5EFF5E5E5EFF5E5E
      5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E
      5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E5EFF5E5E
      5EFF5E5E5EFF5E5E5EFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000009090936343434E1272727EA2828
      28E7282828E7262626E7262626E7262626E7262626E7262626E7262626E72727
      27E7272727E7262626E9303030E81111114A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B858585FF858585FF858585FF858585FF8585
      85FF00000073000000350000000B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000979797FF5E5E
      5ECC5C5C5CCC595959CC585858CC565656CC545454CC525252CC515151CC4F4F
      4FCC4E4E4ECC4D4D4DCC4C4C4CCC4A4A4ACC4A4A4ACC494949CC494949CC4949
      49CC494949CC494949CC545454DB737373FF737373FF737373FF737373FF7373
      73FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F4F4FB13B3B3BFF3D3D3DFF4040
      40FF3E3E3EFF3E3E3EFF404040FF3F3F3FFF3E3E3EFF3F3F3FFF3D3D3DFF3A3A
      3AFF383838FF343434FF353535FF5F5F5FC30000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B858585FFB9B9B9FFB6B6B6FFB3B3B3FF8585
      85FF0000007B000000380000000B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000979797FF9797
      97FFD8D8D8FFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFA4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4
      A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4A4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000777777FD636363FF858585FF7C7C
      7CFF8B8B8BFF848484FF7E7E7EFF7A7A7AFF787878FF737373FF676767FF7E7E
      7EFF7E7E7EFF767676FF5F5F5FFF797979FC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      00080000000B0000000B00000016858585FFBDBDBDFFB9B9B9FFB6B6B6FF8585
      85FF01010180000000430000001A0000000F0000000F0000000C000000070000
      0004000000040000000400000004000000040000000400000004000000040000
      0004000000040000000400000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000979797FF9A9A
      9AFFE9E9E9FFE9E9E9FFE8E8E8FFE8E8E8FFE7E7E7FFE7E7E7FFE6E6E6FFE6E6
      E6FFE5E5E5FFE5E5E5FFDADADAFFCCCCCCFFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFD686868FF8D8D8DFF7B7B
      7BFF979797FF868686FF808080FF7B7B7BFF797979FF747474FF616161FF8888
      88FF7E7E7EFF777777FF606060FF6B6B6BFC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000003000000110000
      0027000000350000003800000040858585FFC0C0C0FFBDBDBDFFB9B9B9FF8585
      85FF0101019B0000007400000059000000530000005000000044000000310000
      0025000000220000002200000022000000220000002200000022000000220000
      0022000000220000002200000006000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000979797FF9D9D
      9DFFEAEAEAFFE9E9E9FFE9E9E9FFE8E8E8FFE8E8E8FFE7E7E7FFE7E7E7FFE6E6
      E6FFE6E6E6FFE5E5E5FFDBDBDBFFC5C5C5FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000737373FF787878FF959595FF7E7E
      7EFF707070FF737373FF7A7A7AFF7C7C7CFF7D7D7DFF777777FF696969FF6161
      61FF676767FF717171FF616161FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000008000000270000
      0054000000730000007B0000007E858585FFC2C2C2FFC0C0C0FFBDBDBDFF8585
      85FF222222FF292929FF2D2D2DFF2E2E2EFF303030FF3A3A3AFF494949FF5252
      52FF555555FF555555FF555555FF555555FF555555FF555555FF555555FF5555
      55FF555555FF555555FF00000009000000000000000038383896595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF383838960000000038383896595959FF595959FF595959FF595959FF3838
      3896000000000000000000000000000000000000000038383896595959FF5959
      59FF595959FF595959FF38383896000000000000000000000000979797FFA0A0
      A0FFEBEBEBFFEAEAEAFFE9E9E9FFE9E9E9FFE8E8E8FFE8E8E8FFE7E7E7FFE7E7
      E7FFE6E6E6FFE6E6E6FFDBDBDBFFCCCCCCFFE5E5E5FFE5E5E5FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000797979FF808080FF979797FF8787
      87FF7E7E7EFF818181FF848484FF838383FF848484FF808080FF727272FF6D6D
      6DFF6D6D6DFF6E6E6EFF565656FF6D6D6DFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000B9F9F9FFF8585
      85FF858585FF858585FF858585FF858585FFC5C5C5FFC2C2C2FFC0C0C0FF8585
      85FF858585FF858585FF858585FF858585FF858585FF787878FFACACACFFD0D0
      D0FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9
      D9FFD9D9D9FF555555FF000000090000000000000000595959FFC5C5C5FFC5C5
      C5FFC3C3C3FFC2C2C2FFC1C1C1FFC0C0C0FFBFBFBFFFBEBEBEFFBDBDBDFFBDBD
      BDFF595959FF00000000595959FFD0D0D0FFCFCFCFFFCECECEFFCCCCCCFF5959
      59FF0000000000000000000000000000000038383896595959FFC1C1C1FFC0C0
      C0FFBFBFBFFFBEBEBEFF595959FF000000000000000000000000979797FFA4A4
      A4FFEBEBEBFFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFE6E6E6FFDBDBDBFFC5C5C5FFE5E5E5FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE4E4E4FFE4E4E4FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000777777FF525252FF626262FF6767
      67FF636363FF6B6B6BFF7C7C7CFF6E6E6EFF686868FF525252FF3E3E3EFF3939
      39FF343434FF313131FF2A2A2AFF6D6D6DFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000B9F9F9FFFD7D7
      D7FFD4D4D4FFD1D1D1FFCDCDCDFFCBCBCBFFC8C8C8FFC5C5C5FFC2C2C2FFC0C0
      C0FFBDBDBDFFB9B9B9FFB6B6B6FFB3B3B3FF858585FF767676FFB1B1B1FFD8D8
      D8FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFC8C8C8FFC7C7
      C7FFC5C5C5FFC4C4C4FFC3C3C3FFC2C2C2FFC1C1C1FFC0C0C0FFBFBFBFFFBEBE
      BEFF595959FF00000000595959FFD2D2D2FFD0D0D0FFD0D0D0FFCECECEFF5959
      59FF00000000000000000000000000000000595959FFC4C4C4FFC3C3C3FFC2C2
      C2FFC1C1C1FFBFBFBFFF595959FF000000000000000000000000979797FFA7A7
      A7FFECECECFFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFDCDCDCFFCCCCCCFFE6E6E6FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE4E4E4FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000707070FF5B5B5BFFC0C0C0FFA1A1
      A1FFA0A0A0FFA5A5A5FFAAAAAAFFA8A8A8FFA6A6A6FFA2A2A2FF9E9E9EFF9E9E
      9EFF9C9C9CFFBDBDBDFF646464FF6D6D6DFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000B9F9F9FFFD9D9
      D9FFD7D7D7FFD4D4D4FFD1D1D1FFCDCDCDFFCBCBCBFFC8C8C8FFC5C5C5FFC2C2
      C2FFC0C0C0FFBDBDBDFFB9B9B9FFB6B6B6FF858585FF515151FF717171FF8787
      87FF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFCACACAFFC9C9
      C9FFC8C8C8FFC7C7C7FFC5C5C5FFC4C4C4FFC3C3C3FFC2C2C2FFC1C1C1FFBFBF
      BFFF595959FF00000000595959FFD4D4D4FFD2D2D2FFD0D0D0FFD0D0D0FF5959
      59FF00000000000000000000000038383896595959FFC5C5C5FFC4C4C4FFC3C3
      C3FFC2C2C2FFC1C1C1FF595959FF000000000000000000000000979797FFAAAA
      AAFFEDEDEDFFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFDCDCDCFFC5C5C5FFE6E6E6FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE4E4E4FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFF808080FF898989FF1D1D
      1DFF242424FF242424FF232323FF242424FF252525FF242424FF242424FF2626
      26FF222222FF686868FF909090FF6D6D6DFF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000089F9F9FFFDBDB
      DBFFD9D9D9FFD7D7D7FFD4D4D4FFD1D1D1FFCDCDCDFFCBCBCBFFC8C8C8FFC5C5
      C5FFC2C2C2FFC0C0C0FFBDBDBDFFB9B9B9FF858585FF3C3C3CFF4C4C4CFF5656
      56FF595959FF6B6B6BFFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFCDCDCDFFCBCB
      CBFFCACACAFFC9C9C9FFC8C8C8FFC6C6C6FFC5C5C5FFC4C4C4FFC3C3C3FFC1C1
      C1FF595959FF00000000595959FFD5D5D5FFD4D4D4FFD2D2D2FFD1D1D1FF5959
      59FF000000000000000000000000595959FFC9C9C9FFC7C7C7FFC6C6C6FFC5C5
      C5FFC3C3C3FFC2C2C2FF595959FF000000000000000000000000979797FFAEAE
      AEFFEDEDEDFFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFE9E9E9FFE8E8E8FFDCDCDCFFCCCCCCFFE7E7E7FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFF808080FFE5E5E5FFEBEB
      EBFFFCFCFCFFFCFCFCFFFBFBFBFFFCFCFCFFFBFBFBFFFCFCFCFFFCFCFCFFF0F0
      F0FFE6E6E6FFDEDEDEFF898989FF6D6D6DFF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000039F9F9FFF9F9F
      9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFD1D1D1FFCDCDCDFFCBCBCBFF8585
      85FF858585FF858585FF858585FF858585FF858585FF545454FF5C5C5CFF6060
      60FF626262FF5F5F5FFF3B3B3BFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFCFCFCFFFCECE
      CEFFCDCDCDFFCBCBCBFF595959FF595959FF595959FF595959FF595959FF5959
      59FF3838389600000000595959FFD7D7D7FFD6D6D6FFD4D4D4FFD3D3D3FF5959
      59FF000000000000000038383896595959FFCBCBCBFFC9C9C9FFC8C8C8FFC6C6
      C6FFC5C5C5FFC4C4C4FF595959FF000000000000000000000000979797FFB1B1
      B1FFF3F3F3FFEDEDEDFFEDEDEDFFECECECFFECECECFFEBEBEBFFEBEBEBFFEAEA
      EAFFE9E9E9FFE9E9E9FFDCDCDCFFC5C5C5FFE7E7E7FFE7E7E7FFE6E6E6FFE6E6
      E6FFE6E6E6FFE5E5E5FFE5E5E5FFE5E5E5FFE4E4E4FFE4E4E4FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFF828282FFE9E9E9FFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFFCFC
      FCFFF2F2F2FFE5E5E5FF929292FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      00080000000B0000000B000000169F9F9FFFD4D4D4FFD1D1D1FFCDCDCDFF8585
      85FF737373FFAAAAAAFF545454FF999999FF9A9A9AFF858585FF808080FF8585
      85FF818181FF959595FFA4A4A4FF5E5E5EFFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFD1D1D1FFD0D0
      D0FFCFCFCFFFCECECEFF595959FF000000000000000000000000000000000000
      00000000000000000000595959FFD9D9D9FFD7D7D7FFD6D6D6FFD4D4D4FF5959
      59FF0000000038383896595959FFCECECEFFCCCCCCFFCBCBCBFFC9C9C9FFC8C8
      C8FFC7C7C7FFC5C5C5FF595959FF000000000000000000000000979797FFB4B4
      B4FFF3F3F3FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFDCDCDCFFCCCCCCFFE8E8E8FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE4E4E4FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFF828282FFF5F5F5FFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFF5F5F5FF949494FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B9F9F9FFFD7D7D7FFD4D4D4FFD1D1D1FF8585
      85FF4C4C4CFF303030FF606060FF676767FF696969FF5E5E5EFF525252FF5555
      55FF515151FF5D5D5DFF6B6B6BFF646464FF3B3B3BFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFD3D3D3FFD2D2
      D2FFD0D0D0FFD0D0D0FF595959FF595959FF595959FF595959FF595959FF5959
      59FF3838389600000000595959FFDBDBDBFFD9D9D9FFD8D8D8FFD6D6D6FF5959
      59FF00000000595959FFD0D0D0FFD0D0D0FFCECECEFFCDCDCDFFCBCBCBFFCACA
      CAFFC8C8C8FFC7C7C7FF595959FF000000000000000000000000979797FFB6B6
      B6FFF3F3F3FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFDCDCDCFFC5C5C5FFE9E9E9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE4E4E4FFA4A4
      A4FF737373FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFF838383FFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFBFBFBFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFAFA
      FAFFFCFCFCFFFCFCFCFF919191FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000B9F9F9FFFD9D9D9FFD7D7D7FFD4D4D4FF8585
      85FF424242FF6C6C6CFF9E9E9EFFA4A4A4FFAAAAAAFF949494FF7E7E7EFF8080
      80FF7E7E7EFF949494FFA7A7A7FFA4A4A4FF676767FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFD6D6D6FFD4D4
      D4FFD3D3D3FFD2D2D2FFD0D0D0FFD0D0D0FFCECECEFFCDCDCDFFCCCCCCFFCACA
      CAFF595959FF00000000595959FFDCDCDCFFDBDBDBFFDADADAFFD8D8D8FF5959
      59FF38383896595959FFD2D2D2FFD0D0D0FFD0D0D0FF595959FFCDCDCDFFCBCB
      CBFFCACACAFFC8C8C8FF595959FF000000000000000000000000979797FFB9B9
      B9FFF3F3F3FFEFEFEFFFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFEBEBEBFFDCDCDCFFCCCCCCFFE9E9E9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE5E5E5FFE5E5E5FFA4A4
      A4FF757575FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFF878787FFF5F5F5FFCDCD
      CDFFE7E7E7FFE7E7E7FFD2D2D2FFCBCBCBFFCACACAFFCBCBCBFFCBCBCBFFD9D9
      D9FFFCFCFCFFFCFCFCFF8A8A8AFF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000089F9F9FFFDBDBDBFFD9D9D9FFD7D7D7FF8585
      85FF454545FF565656FF646464FF686868FF626262FF555555FF505050FF5C5C
      5CFF606060FF666666FF666666FF676767FF646464FF3C3C3CFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFD8D8D8FFD7D7
      D7FFD6D6D6FFD4D4D4FFD3D3D3FFD1D1D1FFD0D0D0FFD0D0D0FFCECECEFFCDCD
      CDFF595959FF00000000595959FFDEDEDEFFDDDDDDFFDBDBDBFFDADADAFF5959
      59FF595959FFD5D5D5FFD4D4D4FFD2D2D2FFD0D0D0FF595959FFCFCFCFFFCDCD
      CDFFCCCCCCFFCACACAFF595959FF000000000000000000000000979797FFBCBC
      BCFFF3F3F3FFB9B9B9FFF0F0F0FFEFEFEFFFEFEFEFFFEEEEEEFFEDEDEDFFEDED
      EDFFECECECFFECECECFFDEDEDEFFC5C5C5FFEAEAEAFFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE6E6E6FFE5E5E5FFA4A4
      A4FF777777FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFF868686FFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFF848484FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000039F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F
      9FFF515151FF959595FFAAAAAAFFB0B0B0FF949494FF808080FF7B7B7BFFACAC
      ACFFA6A6A6FFA5A5A5FFA3A3A3FFA6A6A6FFA2A2A2FF5B5B5BFFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFDBDBDBFFD9D9
      D9FFD8D8D8FFD7D7D7FFD5D5D5FFD4D4D4FFD2D2D2FFD1D1D1FFD0D0D0FFCFCF
      CFFF595959FF00000000595959FFE0E0E0FFDEDEDEFFDDDDDDFFDBDBDBFF5959
      59FFD9D9D9FFD7D7D7FFD6D6D6FFD4D4D4FF595959FF595959FFD0D0D0FFCFCF
      CFFFCDCDCDFFCCCCCCFF595959FF000000000000000000000000979797FFBFBF
      BFFFF3F3F3FFF1F1F1FFF0F0F0FFF0F0F0FFEFEFEFFFEFEFEFFFEEEEEEFFEEEE
      EEFFEDEDEDFFECECECFFE5E5E5FFCCCCCCFFEBEBEBFFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFE7E7E7FFE7E7E7FFE6E6E6FFE6E6E6FFE6E6E6FFA4A4
      A4FF797979FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6F6FFF808080FFFCFCFCFFCDCD
      CDFFCCCCCCFFD4D4D4FFFCFCFCFFFCFCFCFFCACACAFFCCCCCCFFCCCCCCFFCCCC
      CCFFFCFCFCFFFCFCFCFF7C7C7CFF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000064F4F4FFFE0E0E0FFCFCFCFFF8282
      82FF3A3A3AFF5F5F5FFF4A4A4AFF4B4B4BFF4E4E4EFF505050FF4A4A4AFF6969
      69FF666666FF666666FF676767FF626262FF636363FF3B3B3BFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFDDDDDDFFDCDC
      DCFFDADADAFFD9D9D9FFD8D8D8FFD6D6D6FFD5D5D5FFD4D4D4FFD2D2D2FFD1D1
      D1FF595959FF00000000595959FFE1E1E1FFE0E0E0FFDFDFDFFFDDDDDDFF5959
      59FFDADADAFFD9D9D9FFD7D7D7FF595959FF38383896595959FFD1D1D1FFD0D0
      D0FFCFCFCFFFCECECEFF595959FF000000000000000000000000979797FFC1C1
      C1FFF3F3F3FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFEDEDEDFFE5E5E5FFC9C9C9FFEBEBEBFFEBEBEBFFEAEAEAFFEAEA
      EAFFE9E9E9FFE9E9E9FFE8E8E8FFE8E8E8FFE7E7E7FFE7E7E7FFE6E6E6FFA4A4
      A4FF7A7A7AFF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000737373FF858585FFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF7F7F7FFFAFAFAFFFCFCFCFFF7F7
      F7FFFCFCFCFFFCFCFCFF797979FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FF696969FF616161FF858585FF828282FF848484FF848484FF7B7B7BFFA9A9
      A9FFA9A9A9FFA8A8A8FF9E9E9EFF989898FFA0A0A0FF5F5F5FFFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFDFDFDFFFDEDE
      DEFFDDDDDDFFDBDBDBFF595959FF595959FF595959FF595959FF595959FF5959
      59FF3838389600000000595959FFE2E2E2FFE1E1E1FFE0E0E0FFDFDFDFFFDDDD
      DDFFDCDCDCFFDBDBDBFFD9D9D9FF595959FF00000000595959FFD3D3D3FFD2D2
      D2FFD0D0D0FFD0D0D0FF595959FF000000000000000000000000979797FFC3C3
      C3FFF3F3F3FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFE5E5E5FFCCCCCCFFECECECFFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE8E8E8FFE7E7E7FFE7E7E7FFA4A4
      A4FF7D7D7DFF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000787878FF8F8F8FFFFCFCFCFFCDCD
      CDFFE7E7E7FFE7E7E7FFD9D9D9FFCBCBCBFFCBCBCBFFD2D2D2FFE7E7E7FFCCCC
      CCFFFCFCFCFFFCFCFCFF797979FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF4F4F4FFF4F4F4FFF606060FF505050FF525252FF545454FF515151FF5959
      59FF5B5B5BFF575757FF5C5C5CFF606060FF414141FF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFE1E1E1FFE0E0
      E0FFDFDFDFFFDEDEDEFF595959FF000000000000000000000000000000000000
      00000000000000000000595959FFE3E3E3FFE2E2E2FFE1E1E1FFE0E0E0FFDFDF
      DFFFDEDEDEFFDCDCDCFF595959FF3838389600000000595959FFD5D5D5FFD3D3
      D3FFD2D2D2FFD0D0D0FF595959FF000000000000000000000000979797FFC4C4
      C4FFF3F3F3FFB9B9B9FFB9B9B9FFF1F1F1FFF1F1F1FFF1F1F1FFF0F0F0FFF0F0
      F0FFEFEFEFFFEEEEEEFFE5E5E5FFC9C9C9FFEDEDEDFFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE7E7E7FFA4A4
      A4FF808080FF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF9C9C9CFFFAFAFAFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFAFAFAFFFAFAFAFFFAFA
      FAFFFCFCFCFFFCFCFCFF787878FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FF636363FF9B9B9BFFA2A2A2FF838383FF838383FF838383FF8080
      80FF939393FFAEAEAEFFA9A9A9FF9F9F9FFF5D5D5DFFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFE2E2E2FFE2E2
      E2FFE1E1E1FFE0E0E0FF595959FF595959FF595959FF595959FF595959FF5959
      59FF3838389600000000595959FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1E1FFE1E1
      E1FFDFDFDFFF595959FF383838960000000000000000595959FFD7D7D7FFD5D5
      D5FFD4D4D4FFD2D2D2FF595959FF000000000000000000000000979797FFC7C7
      C7FFF3F3F3FFF3F3F3FFF2F2F2FFF2F2F2FFF2F2F2FFF1F1F1FFF1F1F1FFF0F0
      F0FFF0F0F0FFEFEFEFFFE5E5E5FFCCCCCCFFEDEDEDFFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE8E8E8FFE8E8E8FFA4A4
      A4FF838383FF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080FF9D9D9DFFFCFCFCFFC6C6
      C6FFC5C5C5FFE5E5E5FFC7C7C7FFE5E5E5FFE5E5E5FFD7D7D7FFC5C5C5FFC5C5
      C5FFFBFBFBFFFCFCFCFF797979FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF8D8D8DFF8D8D8DFF3E3E3EFF606060FF5F5F5FFF575757FF545454FF8383
      83FF575757FF616161FF626262FF3D3D3DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFE5E5E5FFE3E3
      E3FFE2E2E2FFE1E1E1FFE1E1E1FFE0E0E0FFDEDEDEFFDDDDDDFFDCDCDCFFDBDB
      DBFF595959FF00000000595959FFE6E6E6FFE5E5E5FFE4E4E4FFE2E2E2FFE1E1
      E1FFE1E1E1FF595959FF000000000000000000000000595959FFD8D8D8FFD7D7
      D7FFD6D6D6FFD4D4D4FF595959FF000000000000000000000000979797FFC8C8
      C8FFF3F3F3FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFF0F0F0FFE5E5E5FFCACACAFFEEEEEEFFEEEEEEFFEDEDEDFFECEC
      ECFFECECECFFEBEBEBFFEBEBEBFFEAEAEAFFEAEAEAFFE9E9E9FFE8E8E8FFBEBE
      BEFF868686FF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7BFF989898FFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFF797979FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FF656565FF767676FF979797FFA3A3A3FFA3A3
      A3FF9A9A9AFF808080FF5F5F5FFFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFE6E6E6FFE5E5
      E5FFE5E5E5FFE3E3E3FFE2E2E2FFE1E1E1FFE1E1E1FFDFDFDFFFDEDEDEFFDDDD
      DDFF595959FF00000000595959FFE6E6E6FFE6E6E6FFE5E5E5FFE4E4E4FFE3E3
      E3FF595959FF38383896000000000000000000000000595959FFDADADAFFD9D9
      D9FFD7D7D7FFD6D6D6FF595959FF000000000000000000000000979797FFC8C8
      C8FFF3F3F3FFB9B9B9FFB9B9B9FFB9B9B9FFF3F3F3FFF2F2F2FFF2F2F2FFF1F1
      F1FFF1F1F1FFF0F0F0FFE5E5E5FFCCCCCCFFEFEFEFFFB9B9B9FFB9B9B9FFB9B9
      B9FFEDEDEDFFECECECFFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFE9E9E9FFBEBE
      BEFF898989FF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000767676FF919191FFFCFCFCFFFCFC
      FCFFFBFBFBFFFAFAFAFFFCFCFCFFFCFCFCFFFCFCFCFFFAFAFAFFFAFAFAFFFBFB
      FBFFFBFBFBFFFCFCFCFF797979FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF505050FF474747FF3F3F3FFF3E3E
      3EFF454545FF4F4F4FFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFE7E7E7FFE6E6
      E6FFE6E6E6FFE5E5E5FFE4E4E4FFE3E3E3FFE2E2E2FFE1E1E1FFE0E0E0FFDFDF
      DFFF595959FF00000000595959FFE8E8E8FFE7E7E7FFE6E6E6FFE5E5E5FFE4E4
      E4FF595959FF00000000000000000000000000000000595959FFDCDCDCFFDBDB
      DBFFD9D9D9FFD8D8D8FF595959FF000000000000000000000000979797FFC8C8
      C8FFF3F3F3FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFF2F2F2FFF2F2
      F2FFF1F1F1FFF1F1F1FFE5E5E5FFCACACAFFEFEFEFFFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFEAEAEAFFBEBE
      BEFF8C8C8CFF5E5E5EFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000777777FF8F8F8FFFE6E6E6FFF4F4
      F4FFECECECFFE8E8E8FFE8E8E8FFEBEBEBFFE6E6E6FFE7E7E7FFE6E6E6FFC5C5
      C5FFC8C8C8FFF3F3F3FF797979FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF000000090000000000000000595959FFE9E9E9FFE8E8
      E8FFE7E7E7FFE6E6E6FFE6E6E6FFE5E5E5FFE4E4E4FFE3E3E3FFE2E2E2FFE1E1
      E1FF595959FF00000000595959FFE9E9E9FFE8E8E8FFE7E7E7FFE6E6E6FF5959
      59FF3838389600000000000000000000000000000000595959FFDEDEDEFFDCDC
      DCFFDBDBDBFFD9D9D9FF595959FF000000000000000000000000979797FFC8C8
      C8FFF3F3F3FFF4F4F4FFF4F4F4FFF4F4F4FFF3F3F3FFF3F3F3FFF3F3F3FFF2F2
      F2FFF2F2F2FFF2F2F2FFE5E5E5FFCCCCCCFFF0F0F0FFEDEDEDFFEFEFEFFFEEEE
      EEFFEEEEEEFFEDEDEDFFEDEDEDFFECECECFFECECECFFEBEBEBFFEAEAEAFFBEBE
      BEFF8E8E8EFF5E5E5EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E7E7EFF919191FFDEDEDEFFD8D8
      D8FFC5C5C5FFB8B8B8FFB1B1B1FFB2B2B2FFA6A6A6FFB2B2B2FFACACACFFABAB
      ABFF575757FFD2D2D2FF797979FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000038383896595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF595959FF595959FF5959
      59FF383838960000000038383896595959FF595959FF595959FF595959FF3838
      3896000000000000000000000000000000000000000038383896595959FF5959
      59FF595959FF595959FF38383896000000000000000000000000979797FFC8C8
      C8FFF3F3F3FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF3F3F3FFF3F3
      F3FFF2F2F2FFF2F2F2FFE5E5E5FFD4D4D4FFF1F1F1FFEDEDEDFFF0F0F0FFEFEF
      EFFFEFEFEFFFEEEEEEFFEDEDEDFFEDEDEDFFECECECFFECECECFFEBEBEBFFEBEB
      EBFF929292FF797979FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8CFF9B9B9BFFEBEBEBFFE2E2
      E2FFE3E3E3FFE4E4E4FFE0E0E0FFDCDCDCFFD7D7D7FFD2D2D2FFCCCCCCFFC9C9
      C9FFC6C6C6FFDBDBDBFF787878FF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000979797FFC8C8
      C8FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
      F3FFF3F3F3FFF3F3F3FFF3F3F3FFE0E0E0FFF3F3F3FFF3F3F3FFEDEDEDFFEDED
      EDFFEDEDEDFFEDEDEDFFE0E0E0FFDFDFDFFFDEDEDEFFDDDDDDFFDCDCDCFFDBDB
      DBFF959595FF797979FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000767676E98B8B8BFFA5A5A5FF9B9B
      9BFF9A9A9AFF9A9A9AFF949494FF8B8B8BFF848484FF808080FF757575FF7171
      71FF666666FF626262FF414141FF565656E60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
      8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000979797FFC8C8
      C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC7C7C7FFC5C5
      C5FFC4C4C4FFC2C2C2FFC0C0C0FFBEBEBEFFBBBBBBFFB9B9B9FFB6B6B6FFB4B4
      B4FFB1B1B1FFAEAEAEFFABABABFFA8A8A8FFA5A5A5FFA1A1A1FF9E9E9EFF9B9B
      9BFF999999FF797979FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000616161C8808080FF888888FF7373
      73FF6A6A6AFF6D6D6DFF626262FF565656FF565656FF575757FF505050FF4E4E
      4EFF4C4C4CFF4A4A4AFF424242FF5A5A5AC80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFD9D9D9FF555555FF00000009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000979797FF9797
      97FF979797FF979797FF979797FF979797FF979797FF979797FF979797FF9797
      97FF979797FF979797FFAEAEAEFFAEAEAEFFAEAEAEFF979797FF979797FF9797
      97FF979797FF979797FF979797FF979797FF979797FF979797FF979797FF9797
      97FF979797FF979797FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000606062A4B4B4BC0555555D44848
      48D1424242D0444444D0424242D0414141D1414141D1424242D1404040D13F3F
      3FD0404040D13F3F3FD3414141C7080808310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000555555FFF5F5F5FFF4F4F4FFF4F4
      F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF5F5F5FFF5F5F5FFF5F5
      F5FFF4F4F4FFF4F4F4FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
      F5FFD9D9D9FF555555FF00000006000000000000000000000000000000000000
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
      000000000000000000000000000000000000555555FF555555FF555555FF5555
      55FF555555FF555555FF555555FF555555FF555555FF555555FF555555FF5555
      55FF555555FF555555FF555555FF555555FF555555FF555555FF555555FF5555
      55FF555555FF555555FF00000003000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000E00000000100010000000000000E00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ilDownloadToolBar: TImageList
    Left = 280
    Top = 424
    Bitmap = {
      494C010112004800480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300009933000099330000000000000000000000000000999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      000099330000E5E5E500CC66000099330000E5E5E500E5E5E500E5E5E5009933
      0000CC660000CC66000099330000000000000000000099999900CCCCCC00CCCC
      CC0099999900E5E5E500CCCCCC0099999900E5E5E500E5E5E500E5E5E5009999
      9900CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      000099330000E5E5E500CC66000099330000E5E5E500E5E5E500E5E5E5009933
      0000CC660000CC66000099330000000000000000000099999900CCCCCC00CCCC
      CC0099999900E5E5E500CCCCCC0099999900E5E5E500E5E5E500E5E5E5009999
      9900CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      000099330000E5E5E500CC66000099330000E5E5E500E5E5E500E5E5E5009933
      0000CC660000CC66000099330000000000000000000099999900CCCCCC00CCCC
      CC0099999900E5E5E500CCCCCC0099999900E5E5E500E5E5E500E5E5E5009999
      9900CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      000099330000E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E5009933
      0000CC660000CC66000099330000000000000000000099999900CCCCCC00CCCC
      CC0099999900E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E5009999
      9900CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000993300009933000099330000993300009933000099330000CC66
      0000CC660000CC66000099330000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00999999009999990099999900999999009999990099999900CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000CC66000099330000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000993300009933000099330000993300009933000099330000993300009933
      0000CC660000CC66000099330000000000000000000099999900CCCCCC00CCCC
      CC00999999009999990099999900999999009999990099999900999999009999
      9900CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC6600009933
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099330000CC66000099330000000000000000000099999900CCCCCC009999
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099999900CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC6600009933
      0000FFFFFF00993300009933000099330000993300009933000099330000FFFF
      FF0099330000CC66000099330000000000000000000099999900CCCCCC009999
      9900FFFFFF00999999009999990099999900999999009999990099999900FFFF
      FF0099999900CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC6600009933
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099330000CC66000099330000000000000000000099999900CCCCCC009999
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099999900CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000E5E5E5009933
      0000FFFFFF00993300009933000099330000993300009933000099330000FFFF
      FF00993300009933000099330000000000000000000099999900E5E5E5009999
      9900FFFFFF00999999009999990099999900999999009999990099999900FFFF
      FF00999999009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC6600009933
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099330000CC66000099330000000000000000000099999900CCCCCC009999
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0099999900CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300009933000099330000000000000000000099999900999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999009999990099999900000000000000000000000000000000000000
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
      0000000000009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900000000000000000000000000000000000000
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
      0000000000000000000000000000000000009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099330000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099999900CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC66000099330000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC66000099330000CC66000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC0099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC66000099330000CC660000CC660000CC66000099330000CC66
      0000CC660000CC6600009933000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC0099999900CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000993300009933
      00009933000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000993300009933000099330000000000000000000000000000999999009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900999999009999990099999900000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC6600009933000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000CC6600009933000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      00000000000099330000CC660000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000993300009933
      00009933000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000993300009933000099330000000000000000000000000000999999009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900999999009999990099999900000000000000000000000000000000000000
      00000000000099330000CC660000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000993300009933000099330000993300009933
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900999999009999990099999900999999009999
      9900000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000009999
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CCCCCC00000000000000000000000000000000000000
      0000000000009933000099330000993300009933000099330000993300009933
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900999999009999990099999900999999009999
      99000000000000000000000000000000000000000000000000003333CC000000
      FF00000099000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099999900CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      99000000000000000000000000000000000000000000000000003333CC003399
      FF000000FF000000990000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000000000000000000099999900E5E5
      E500CCCCCC009999990000000000000000000000000000000000000000000000
      000000000000CCCCCC0000000000000000000000000000000000993300009933
      00009933000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000993300009933000099330000000000000000000000000000999999009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900999999009999990099999900000000000000000000000000000000003333
      CC000066FF000000CC0000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000009999
      9900E5E5E5009999990000000000000000000000000000000000000000000000
      0000CCCCCC00000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000CC6600009933000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      00000000CC000000FF0000009900000000000000000000000000000000000000
      FF00000099000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC009999990000000000000000000000000000000000CCCC
      CC00999999000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC6600009933000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      0000000000000000CC000000FF000000990000000000000000000000FF000000
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      000000000000000000000000CC000000FF00000099000000FF00000099000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC0099999900CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000993300009933
      00009933000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000993300009933000099330000000000000000000000000000999999009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900999999009999990099999900000000000000000000000000000000000000
      00000000000000000000000000000000CC000000FF0000009900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099999900CCCCCC0099999900000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC66000099330000CC660000CC660000CC66000099330000CC66
      0000CC660000CC6600009933000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC0099999900CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      000000000000000000000000CC000000FF00000099000000CC00000099000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC009999990099999900999999000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC66000099330000CC66000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC0099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      0000000000000000CC000000FF000000990000000000000000000000CC000000
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000999999009999
      9900000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC66000099330000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      CC000000FF000000FF0000009900000000000000000000000000000000000000
      CC00000099000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC0099999900000000000000000000000000000000009999
      9900999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      99000000000000000000000000000000000000000000000000000000CC003399
      FF000000FF000000990000000000000000000000000000000000000000000000
      00000000CC00000099000000000000000000000000000000000099999900E5E5
      E500CCCCCC009999990000000000000000000000000000000000000000000000
      0000999999009999990000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000666699000000
      CC00666699000000000000000000000000000000000000000000000000000000
      000000000000000000000000CC00000000000000000000000000CCCCCC009999
      9900CCCCCC000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900000000000000000000000000000000000000
      000000000000000000000000000099330000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099999900CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009999990000000000000000000000
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
      0000000000009933000099330000993300009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900999999009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000993300009933
      00009933000099330000CC660000CC660000CC66000099330000993300009933
      0000993300000000000000000000000000000000000000000000999999009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC0099999900999999009999
      990099999900000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0099999900000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000993300009933
      00009933000099330000CC660000CC660000CC66000099330000993300009933
      0000993300000000000000000000000000000000000000000000999999009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC0099999900999999009999
      990099999900000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000993300009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900999999009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C001C00100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF9FFF9FFE007E007F8FFF8FFE007E007F87FF87FE007E007
      F83FF83FE007E007F81FF81FE007E007F80FF80FE007E007F81FF81FE007E007
      F83FF83FE007E007F87FF87FE007E007F8FFF8FFE007E007F9FFF9FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7FFFFFFFFF
      FE3FFE3FFFFFFFFFFC1FFC1FF9FFF9FFF80FF80FF8FFF8FFF007F007F87FF87F
      E003E003F83FF83FC001C001F81FF81FC001C001F80FF80FF007F007F81FF81F
      E003E003F83FF83FC001C001F87FF87FC001C001F8FFF8FFF80FF80FF9FFF9FF
      F80FF80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFDEFFDF80FF80F
      C7FFC7FFF80FF80FC3FBC3FBC001C001E3F7E3F7C001C001F1E7F1E7E003E003
      F8CFF8CFF007F007FC1FFC1FC001C001FE3FFE3FC001C001FC1FFC1FE003E003
      F8CFF8CFF007F007E1E7E1E7F80FF80FC3F3C3F3FC1FFC1FC7FDC7FDFE3FFE3F
      FFFFFFFFFF7FFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF83FF83FFEFFFEFF
      F83FF83FFC7FFC7FF83FF83FF83FF83FF83FF83FF01FF01FF83FF83FE00FE00F
      F83FF83FC007C007C007C007C007C007C007C007C007C007C007C007F83FF83F
      E00FE00FF83FF83FF01FF01FF83FF83FF83FF83FF83FF83FFC7FFC7FF83FF83F
      FEFFFEFFF83FF83FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object IdCookieManager: TIdCookieManager
    Left = 488
    Top = 584
  end
  object FilesList: TFilesList
    OnFile = FilesListFile
    Left = 616
    Top = 352
  end
  object pmGroups: TPopupMenu
    Images = ilMainMenu
    OwnerDraw = True
    Left = 368
    Top = 368
    object GroupMenuItem: TMenuItem
      OnClick = GroupMenuItemClick
    end
  end
  object BalloonHint1: TBalloonHint
    Left = 784
    Top = 320
  end
end
