object frmAddnonfb2: TfrmAddnonfb2
  Left = 0
  Top = 0
  HelpContext = 129
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1085#1080#1075' '#1074' '#1082#1086#1083#1083#1077#1082#1094#1080#1102
  ClientHeight = 531
  ClientWidth = 752
  Color = clBtnFace
  Constraints.MinHeight = 565
  Constraints.MinWidth = 760
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  DesignSize = (
    752
    531)
  PixelsPerInch = 96
  TextHeight = 13
  object pcPages: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 746
    Height = 489
    Margins.Bottom = 39
    ActivePage = tsFiles
    Align = alClient
    TabOrder = 0
    object tsFiles: TTabSheet
      Caption = #1060#1072#1081#1083#1099
      object Tree: TVirtualStringTree
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 732
        Height = 455
        Align = alClient
        Header.AutoSizeIndex = 0
        Header.DefaultHeight = 17
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
        PopupMenu = pmMain
        TabOrder = 0
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines]
        TreeOptions.SelectionOptions = [toFullRowSelect]
        OnChange = TreeChange
        OnCompareNodes = TreeCompareNodes
        OnDblClick = TreeDblClick
        OnFreeNode = TreeFreeNode
        OnGetText = TreeGetText
        OnPaintText = TreePaintText
        Columns = <
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coAllowFocus]
            Position = 0
            Width = 500
            WideText = #1060#1072#1081#1083
          end
          item
            Position = 1
            Width = 60
            WideText = #1058#1080#1087
          end
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coAllowFocus]
            Position = 2
            Width = 100
            WideText = #1056#1072#1079#1084#1077#1088
          end>
      end
    end
    object tsBookInfo: TTabSheet
      Caption = #1050#1085#1080#1075#1072
      DesignSize = (
        738
        461)
      object gbFile: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 732
        Height = 62
        Align = alTop
        Caption = #1060#1072#1081#1083
        TabOrder = 0
        DesignSize = (
          732
          62)
        object edFileName: TEdit
          Left = 8
          Top = 16
          Width = 635
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          PopupMenu = pmEdit
          ReadOnly = True
          TabOrder = 0
        end
        object btnCopyToFamily: TButton
          Tag = 555
          Left = 9
          Top = 42
          Width = 30
          Height = 15
          Caption = #1060
          TabOrder = 3
          TabStop = False
          OnClick = btnCopyToFamilyClick
        end
        object btnCopyToName: TButton
          Tag = 666
          Left = 43
          Top = 42
          Width = 30
          Height = 15
          Caption = #1048
          TabOrder = 4
          TabStop = False
          OnClick = btnCopyToNameClick
        end
        object btnCopyToTitle: TButton
          Left = 77
          Top = 42
          Width = 30
          Height = 15
          Caption = #1053
          TabOrder = 5
          TabStop = False
          OnClick = btnCopyToTitleClick
        end
        object btnCopyToSeries: TButton
          Left = 113
          Top = 42
          Width = 30
          Height = 15
          Caption = #1057
          TabOrder = 6
          TabStop = False
          OnClick = btnCopyToSeriesClick
        end
        object btnRenameFile: TBitBtn
          Left = 688
          Top = 14
          Width = 37
          Height = 26
          Hint = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1092#1072#1081#1083
          Anchors = [akTop, akRight]
          DoubleBuffered = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FFB88989B88989B88989B88989B88989B88989B8898965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FFB88989FEFDFB
            FEFDFBFEFDFBFEFDFBFEFDFB4D87430C85180C85180C851851BDB66ED4F93EB1
            D984D7EB078DBEFF00FFB88989FEF9F4FEF9F4FEF9F4FEF9F4FEF9F4B8898967
            CED60C85181398250C85184BB79A42B4D4AEF1F9078DBEFF00FFB88989FEF6ED
            FEF6EDFEF6EDFEF6EDFEF6EDB8898983E4FC84E4FC0C851826B73F0C851836A8
            A1B3F4F9078DBEFF00FFB88989FFF2E7FFF2E7FFF2E7FAE8DEFAE8DEB889898D
            EBFD8DEBFD5DC0A70C851837C4580C8518ACF0EB6DCAE0078DBEB88989FFEFE0
            FFEFE0FFEFE0D09F9ED0A09EC59393ACE4DA9FDBCA82AB810C85184EDB780C85
            1898BA99A3BFAC078DBEB88989FFEBD9FFEBD9F3D7C9D5ABA8D1C8C2CD999907
            87800C85180C851847D06E59E38842C6670C85180C8518078DBEB88989FFE8D2
            FFE8D2F3D4C4D9AEACCD99999AF6FE9BF5FE63C5A40C85185DE88E63EE984CD0
            750C8518F0F1E7B88989B88989B88989B88989B88989CD9999A1FAFEA1FBFEA0
            FAFEA1FBFE737E570C851846CB6E0C8518EFEDDFFEF6EDB88989FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078DBE078DBE078DBEB8898984B47B0C8518EDE8
            D7FAE8DEFAE8DEB88989FF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFB88989FFEFE0FFEFE0FFEFE0D09F9ED0A09EC59393FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB88989FFEBD9FFEBD9F3D7
            C9D5ABA8D1C8C2CD9999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFB88989FFE8D2FFE8D2F3D4C4D9AEACCD9999FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB88989B88989B88989B889
            89CD9999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentDoubleBuffered = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = miRenameFileClick
        end
        object btnOpenBook: TBitBtn
          Left = 649
          Top = 14
          Width = 33
          Height = 26
          Hint = #1054#1090#1082#1088#1099#1090#1100' '#1082#1085#1080#1075#1091
          Anchors = [akTop, akRight]
          DoubleBuffered = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF006767
            67FF676767FF676767FF666666FF666666FF666666FF666666FF666666FF6565
            65FF656565FF656565FF656565FF656565FFFF00FF00FF00FF00FF00FF007575
            75FFFCFCFCFF98A9CBFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF6F6
            F6FFF6F6F6FFF6F6F6FFFCFCFCFF737373FFFF00FF00FF00FF00FF00FF008181
            81FF7C7C7DFF98A9CBFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B0
            8CFFD9B08CFFD9B08CFFD9B08CFF7E7E7EFFFF00FF00FF00FF00FF00FF008B8B
            8BFFF8F8F8FF98A9CBFFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE3E3E3FFE2E2
            E2FFE1E1E1FFE0E0E0FFF7F7F7FF8A8A8AFFFF00FF00FF00FF00FF00FF009595
            95FFD9B08CFF98A9CBFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B0
            8CFFD9B08CFFD9B08CFFD9B08CFF929292FFFF00FF00FF00FF00FF00FF009A9A
            9AFFFAFAFAFF98A9CBFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEAEAEAFFEAEA
            EAFFE9E9E9FFE6E6E6FFF8F8F8FF999999FFFF00FF00FF00FF00FF00FF00A1A1
            A1FFD9B08CFF98A9CBFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B0
            8CFFD9B08CFFD9B08CFFD9B08CFFA0A0A0FFFF00FF00FF00FF00FF00FF00A5A5
            A5FF7C7C7DFF98A9CBFFF0F0F0FFF2F2F2FFF2F2F2FFF0F0F0FFF0F0F0FFEFEF
            EFFFEEEEEEFFEDEDEDFFFAFAFAFFA5A5A5FFFF00FF00FF00FF00FF00FF00A9A9
            A9FFD9B08CFF98A9CBFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B0
            8CFFD9B08CFFD9B08CFFD9B08CFFA7A7A7FFFF00FF00FF00FF00FF00FF00ABAB
            ABFFFCFCFCFF98A9CBFFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF4F4F4FFF3F3
            F3FFF2F2F2FFF0F0F0FFFBFBFBFFABABABFFFF00FF00FF00FF00FF00FF00ACAC
            ACFFD9B08CFF98A9CBFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B0
            8CFFD9B08CFFD9B08CFFD9B08CFFACACACFFFF00FF00FF00FF00FF00FF00ADAD
            ADFFFCFCFCFF98A9CBFFF8F8F8FFF8F8F8FFFAFAFAFFF8F8F8FFF8F8F8FFF7F7
            F7FFF6F6F6FFF3F3F3FFFCFCFCFFADADADFFFF00FF00FF00FF00FF00FF00AFAF
            AFFFD9B08CFF98A9CBFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B08CFFD9B0
            8CFFAFAFAFFFBCBCBCFFD0D0D0FFB2A2B2EFFF00FF00FF00FF00FF00FF00AFAF
            AFFF7C7C7DFF98A9CBFFFAFAFAFFFBFBFBFFFBFBFBFFFBFBFBFFFAFAFAFFF8F8
            F8FFBCBCBCFFD9D9D9FFB4A4B4EFF021F030FF00FF00FF00FF00FF00FF00AFAF
            AFFFFFFFFFFF98A9CBFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFF8F8
            F8FFD0D0D0FFB4A4B4EFF021F030FF00FF00FF00FF00FF00FF00FF00FF00AFAF
            AFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAF
            AFFFB4A4B4EFF021F030FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentDoubleBuffered = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnFileOpenClick
        end
      end
      object gbGenres: TGroupBox
        Left = 3
        Top = 362
        Width = 335
        Height = 44
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1046#1072#1085#1088#1099
        TabOrder = 4
        DesignSize = (
          335
          44)
        object lblGenre: TLabel
          Left = 8
          Top = 18
          Width = 273
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 279
        end
        object btnShowGenres: TButton
          Left = 287
          Top = 13
          Width = 41
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '...'
          TabOrder = 0
          OnClick = btnShowGenresClick
        end
      end
      object gbLang: TGroupBox
        Left = 344
        Top = 362
        Width = 60
        Height = 44
        Anchors = [akRight, akBottom]
        Caption = #1071#1079#1099#1082
        TabOrder = 5
        object cbLang: TComboBox
          Left = 8
          Top = 16
          Width = 44
          Height = 21
          Style = csDropDownList
          TabOrder = 0
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
      end
      object gbKeywords: TGroupBox
        Left = 3
        Top = 412
        Width = 580
        Height = 44
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
        TabOrder = 7
        DesignSize = (
          580
          44)
        object edKeyWords: TEdit
          Left = 8
          Top = 16
          Width = 562
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object gbSerie: TGroupBox
        Left = 3
        Top = 312
        Width = 401
        Height = 44
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1057#1077#1088#1080#1103
        TabOrder = 3
        DesignSize = (
          401
          44)
        object edSN: TEdit
          Left = 346
          Top = 16
          Width = 49
          Height = 21
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          MaxLength = 3
          NumbersOnly = True
          TabOrder = 1
        end
        object cbSeries: TComboBox
          Left = 8
          Top = 16
          Width = 332
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object gbTitle: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 71
        Width = 732
        Height = 44
        Align = alTop
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        TabOrder = 1
        DesignSize = (
          732
          44)
        object edT: TEdit
          Left = 8
          Top = 16
          Width = 717
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object gbOptions: TGroupBox
        Left = 410
        Top = 312
        Width = 325
        Height = 94
        Anchors = [akRight, akBottom]
        Caption = #1054#1087#1094#1080#1080
        TabOrder = 6
        object cbAutoSeries: TCheckBox
          Left = 8
          Top = 62
          Width = 169
          Height = 17
          Caption = #1059#1074#1077#1083#1080#1095#1080#1074#1072#1090#1100' '#1085#1086#1084#1077#1088' '#1074' '#1089#1077#1088#1080#1080
          TabOrder = 2
        end
        object cbSelectFileName: TCheckBox
          Left = 8
          Top = 16
          Width = 145
          Height = 17
          Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077
          TabOrder = 0
        end
        object cbNoAuthorAllowed: TCheckBox
          Left = 8
          Top = 39
          Width = 145
          Height = 17
          Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1073#1077#1079' '#1072#1074#1090#1086#1088#1072
          TabOrder = 1
        end
        object RzGroupBox6: TGroupBox
          AlignWithMargins = True
          Left = 166
          Top = 11
          Width = 152
          Height = 44
          Caption = #1054#1095#1080#1097#1072#1090#1100' '#1087#1086#1083#1103
          TabOrder = 3
          object cbClearOptions: TComboBox
            Left = 8
            Top = 16
            Width = 138
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = #1042#1089#1077
            Items.Strings = (
              #1042#1089#1077
              #1058#1086#1083#1100#1082#1086' '#1072#1074#1090#1086#1088#1099
              #1058#1086#1083#1100#1082#1086' '#1085#1072#1079#1074#1072#1085#1080#1077
              #1053#1077#1090)
          end
        end
      end
      object btnNext: TBitBtn
        AlignWithMargins = True
        Left = 591
        Top = 416
        Width = 144
        Height = 40
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1100#1096#1077
        DoubleBuffered = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000FF00FF000875
          0D0010A61D0013AA220016AD260017AF2A001AB12D001CB4310020B8360021B8
          390025BD3E0026BE41002AC147002CC349002FC74F0030C9520035CE590038D1
          5E003AD260003CD462003ED766003FD8680041DA6D0045DD710049E279004DE6
          7F000E7FA9000E80AA001385AF000682B600078DBB002692BF000C92C000089C
          CE00129FCB000DA2D40011A7D20020A1CA0035A7CD0030BCDD0044BADD0023D7
          FE0036D8FD004AC5DD0049C1E30049D5EE0063DAF50059EAFE006CE0F8006FE6
          FF006FF8FF0072F9FE007AFEFF0092CEE4008DE7FA0082F8FF008CFBFE0091FC
          FE0097FEFF009BFBFC00BAEEF600A0FCFE00A8FFFF00ADFFFF00B6F6FF00B3FC
          FE00B4FFFF00C6F5FF00C7FFFF00D3FFFF00E3FAFF00E4FFFF00E9F9FD00F1FB
          FD00F4FFFF00FCFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000101010100000000001B1B1B1B1B1B0001030201000000001E2D292A31
          36281B010603010000001E382F292A31010101010A07010101011E382F292A31
          0113100F0D0B0A0605011E382F292A3101161611100D0C0A08011E4140434648
          010101011513010101011E3C27242225261F35011716010000001E2B2F292A31
          362C1D011919010000001E382F292A31362C21010101010000001E382F292A31
          362C211A0000000000001E382F292A31362C211B0000000000001E3937323439
          3D2E231B0000000000001E4B4A4541413F3F321B00000000000000204A46443F
          3D3B1C0000000000000000001E1E1E1E1E1E0000000000000000}
        ParentDoubleBuffered = False
        TabOrder = 8
        OnClick = btnNextClick
      end
      object alBookAuthors: TFBDAuthorTable
        AlignWithMargins = True
        Left = 3
        Top = 121
        Width = 732
        Height = 185
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        DesignSize = (
          732
          185)
        object btnAddAuthorFromList: TBitBtn
          Left = 241
          Top = 160
          Width = 78
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = #1048#1079' '#1089#1087#1080#1089#1082#1072
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 4
          OnClick = btnAddAuthorFromListClick
        end
      end
    end
    object tsFBD: TTabSheet
      Caption = 'FBD'
      DesignSize = (
        738
        461)
      object gbFDBCover: TGroupBox
        Left = 3
        Top = 1
        Width = 239
        Height = 409
        Anchors = [akLeft, akTop, akBottom]
        Caption = #1054#1073#1083#1086#1078#1082#1072
        TabOrder = 0
        DesignSize = (
          239
          409)
        object FCover: TImage
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 229
          Height = 354
          Hint = #1054#1073#1083#1086#1078#1082#1072
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          Center = True
          ParentShowHint = False
          Proportional = True
          ShowHint = True
          Stretch = True
          ExplicitHeight = 356
        end
        object btnPasteCover: TButton
          Left = 90
          Top = 378
          Width = 79
          Height = 25
          Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1080#1079' '#1073#1091#1092#1077#1088#1072
          Anchors = [akLeft, akBottom]
          Caption = #1048#1079' '#1073#1091#1092#1077#1088#1072
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnPasteCoverClick
        end
        object btnLoad: TButton
          Left = 4
          Top = 378
          Width = 80
          Height = 25
          Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
          Anchors = [akLeft, akBottom]
          Caption = #1048#1079' '#1092#1072#1081#1083#1072
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnLoadClick
        end
      end
      object gbPublisher: TGroupBox
        Left = 248
        Top = 1
        Width = 484
        Height = 71
        Anchors = [akLeft, akTop, akRight]
        Caption = #1048#1079#1076#1072#1090#1077#1083#1100
        TabOrder = 1
        DesignSize = (
          484
          71)
        object RzLabel4: TLabel
          Left = 33
          Top = 46
          Width = 27
          Height = 13
          Caption = 'ISBN:'
          FocusControl = edISBN
        end
        object RzLabel6: TLabel
          Left = 300
          Top = 19
          Width = 35
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1043#1086#1088#1086#1076':'
          FocusControl = edCity
        end
        object RzLabel7: TLabel
          Left = 384
          Top = 46
          Width = 23
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1043#1086#1076':'
          FocusControl = edYear
        end
        object RzLabel5: TLabel
          Left = 8
          Top = 19
          Width = 52
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
          FocusControl = edPublisher
        end
        object edISBN: TEdit
          Left = 66
          Top = 43
          Width = 312
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object edPublisher: TEdit
          Left = 66
          Top = 16
          Width = 228
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object edYear: TEdit
          Left = 413
          Top = 43
          Width = 60
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 3
        end
        object edCity: TEdit
          Left = 341
          Top = 16
          Width = 132
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
      end
      object mmAnnotation: TMemo
        Left = 248
        Top = 250
        Width = 484
        Height = 160
        Anchors = [akLeft, akRight, akBottom]
        ScrollBars = ssBoth
        TabOrder = 3
        WordWrap = False
      end
      object dtnConvert: TBitBtn
        Left = 591
        Top = 416
        Width = 144
        Height = 40
        Anchors = [akRight, akBottom]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        DoubleBuffered = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000FF00FF000875
          0D0010A61D0013AA220016AD260017AF2A001AB12D001CB4310020B8360021B8
          390025BD3E0026BE41002AC147002CC349002FC74F0030C9520035CE590038D1
          5E003AD260003CD462003ED766003FD8680041DA6D0045DD710049E279004DE6
          7F000E7FA9000E80AA001385AF000682B600078DBB002692BF000C92C000089C
          CE00129FCB000DA2D40011A7D20020A1CA0035A7CD0030BCDD0044BADD0023D7
          FE0036D8FD004AC5DD0049C1E30049D5EE0063DAF50059EAFE006CE0F8006FE6
          FF006FF8FF0072F9FE007AFEFF0092CEE4008DE7FA0082F8FF008CFBFE0091FC
          FE0097FEFF009BFBFC00BAEEF600A0FCFE00A8FFFF00ADFFFF00B6F6FF00B3FC
          FE00B4FFFF00C6F5FF00C7FFFF00D3FFFF00E3FAFF00E4FFFF00E9F9FD00F1FB
          FD00F4FFFF00FCFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000101010100000000001B1B1B1B1B1B0001030201000000001E2D292A31
          36281B010603010000001E382F292A31010101010A07010101011E382F292A31
          0113100F0D0B0A0605011E382F292A3101161611100D0C0A08011E4140434648
          010101011513010101011E3C27242225261F35011716010000001E2B2F292A31
          362C1D011919010000001E382F292A31362C21010101010000001E382F292A31
          362C211A0000000000001E382F292A31362C211B0000000000001E3937323439
          3D2E231B0000000000001E4B4A4541413F3F321B00000000000000204A46443F
          3D3B1C0000000000000000001E1E1E1E1E1E0000000000000000}
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = dtnConvertClick
      end
      object cbForceConvertToFBD: TCheckBox
        Left = 12
        Top = 428
        Width = 135
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' FBD'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object alFBDAuthors: TFBDAuthorTable
        AlignWithMargins = True
        Left = 248
        Top = 78
        Width = 484
        Height = 166
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        DesignSize = (
          484
          166)
      end
    end
  end
  object btnClose: TBitBtn
    Left = 664
    Top = 498
    Width = 80
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    DoubleBuffered = True
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
      82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
      F100C56A31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
      F1EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEF1EEEEEEEEEEEEEEEEEEEEEEEEF1E3AC
      E3F1EEEEEEEEEEEEEEEEEEEEEEF1EEACE3F1EEEEEEEEEEEEEEEEEEF1E3E28257
      57E2ACE3F1EEEEEEEEEEEEF1EEE2818181E2ACEEF1EEEEEEEEEEE382578282D7
      578181E2E3EEEEEEEEEEEE81818181D7818181E2EEEEEEEEEEEE57828989ADD7
      57797979F1EEEEEEEEEE8181DEDEACD781818181F1EEEEEEEEEE57898989ADD7
      57AAAAA2D7ADEEEEEEEE81DEDEDEACD781DEDE81D7ACEEEEEEEE57898989ADD7
      57AACEA3AD10EEEEEEEE81DEDEDEACD781DEAC81AC81EEEEEEEE5789825EADD7
      57ABCFE21110EEEEEEEE81DE8181ACD781ACACE28181EEEEEEEE578957D7ADD7
      57ABDE101010101010EE81DE56D7ACD781ACDE818181818181EE57898257ADD7
      57EE10101010101010EE81DE8156ACD781E381818181818181EE57898989ADD7
      57EE82101010101010EE81DEDEDEACD781E381818181818181EE57898989ADD7
      57ACF1821110EEEEEEEE81DEDEDEACD781ACF1818181EEEEEEEE57898989ADD7
      57ABEEAB8910EEEEEEEE81DEDEDEACD781ACE3ACDE81EEEEEEEE57828989ADD7
      57ACEEA3EE89EEEEEEEE8181DEDEACD781ACE381EEDEEEEEEEEEEEDE5E8288D7
      57A2A2A2EEEEEEEEEEEEEEDE8181DED781818181EEEEEEEEEEEEEEEEEEAC8257
      57EEEEEEEEEEEEEEEEEEEEEEEEAC818181EEEEEEEEEEEEEEEEEE}
    ModalResult = 1
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object pmEdit: TPopupMenu
    Left = 280
    Top = 248
    object N1: TMenuItem
      Caption = #1060#1072#1084#1080#1083#1080#1103
      ShortCut = 16465
      OnClick = btnCopyToFamilyClick
    end
    object N2: TMenuItem
      Caption = #1048#1084#1103
      ShortCut = 16449
      OnClick = btnCopyToNameClick
    end
    object N3: TMenuItem
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      ShortCut = 16474
      OnClick = btnCopyToTitleClick
    end
    object N4: TMenuItem
      Caption = #1057#1077#1088#1080#1103
      ShortCut = 16472
      OnClick = btnCopyToSeriesClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object miClearAll: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16474
      OnClick = miClearAllClick
    end
  end
  object flFiles: TFilesList
    OnDirectory = flFilesDirectory
    OnFile = flFilesFile
    Left = 216
    Top = 248
  end
  object pmMain: TPopupMenu
    Left = 128
    Top = 248
    object miOpenFile: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      ShortCut = 16397
      OnClick = btnFileOpenClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object miOpenExplorer: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091' '#1074' '#1087#1088#1086#1074#1086#1076#1085#1080#1082#1077
      ShortCut = 16453
      OnClick = miOpenExplorerClick
    end
  end
  object FBD: TFBDDocument
    Memo = mmAnnotation
    Image = FCover
    Left = 48
    Top = 248
  end
end
