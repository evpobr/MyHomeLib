object frmAddnonfb2: TfrmAddnonfb2
  Left = 0
  Top = 0
  HelpContext = 129
  ActiveControl = pcPages
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1085#1080#1075' '#1074' '#1082#1086#1083#1083#1077#1082#1094#1080#1102
  ClientHeight = 696
  ClientWidth = 983
  Color = clBtnFace
  Constraints.MinHeight = 739
  Constraints.MinWidth = 994
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  DesignSize = (
    983
    696)
  PixelsPerInch = 120
  TextHeight = 17
  object pcPages: TPageControl
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 975
    Height = 641
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 51
    ActivePage = tsFiles
    Align = alClient
    TabOrder = 0
    object tsFiles: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1060#1072#1081#1083#1099
      object Tree: TVirtualStringTree
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 959
        Height = 482
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
      object gbOptions: TGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 494
        Width = 959
        Height = 111
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Caption = #1054#1087#1094#1080#1080
        TabOrder = 1
        object Label1: TLabel
          Left = 286
          Top = 52
          Width = 160
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1055#1086#1089#1083#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1082#1085#1080#1075#1080
        end
        object cbAutoSeries: TCheckBox
          Left = 10
          Top = 81
          Width = 221
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1059#1074#1077#1083#1080#1095#1080#1074#1072#1090#1100' '#1085#1086#1084#1077#1088' '#1074' '#1089#1077#1088#1080#1080
          TabOrder = 2
        end
        object cbSelectFileName: TCheckBox
          Left = 10
          Top = 21
          Width = 190
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077
          TabOrder = 0
        end
        object cbNoAuthorAllowed: TCheckBox
          Left = 10
          Top = 51
          Width = 190
          Height = 22
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1073#1077#1079' '#1072#1074#1090#1086#1088#1072
          TabOrder = 1
        end
        object cbClearOptions: TComboBox
          Left = 464
          Top = 48
          Width = 249
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          TabOrder = 3
          Items.Strings = (
            #1054#1095#1080#1097#1072#1090#1100' '#1074#1089#1077' '#1087#1086#1083#1103
            #1054#1095#1080#1097#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1072#1074#1090#1086#1088#1086#1074
            #1054#1095#1080#1097#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1083#1077' '#1085#1072#1079#1074#1072#1085#1080#1103
            #1053#1077' '#1086#1095#1080#1097#1072#1090#1100' '#1087#1086#1083#1103)
        end
        object cbForceConvertToFBD: TCheckBox
          Left = 286
          Top = 25
          Width = 177
          Height = 18
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' FBD'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
      end
    end
    object tsBookInfo: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #1050#1085#1080#1075#1072
      object Label2: TLabel
        Left = 10
        Top = 22
        Width = 38
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1060#1072#1081#1083':'
      end
      object Label3: TLabel
        Left = 10
        Top = 98
        Width = 64
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      end
      object gbExtraInfo: TGroupBox
        Left = 4
        Top = 458
        Width = 714
        Height = 141
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' &'#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        TabOrder = 0
        object lblGenre: TLabel
          Left = 135
          Top = 31
          Width = 461
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          AutoSize = False
          Caption = '-------'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 9
          Top = 31
          Width = 52
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '&'#1046#1072#1085#1088#1099':'
          FocusControl = lblGenre
        end
        object Label4: TLabel
          Left = 9
          Top = 69
          Width = 44
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1057'&'#1077#1088#1080#1103':'
          FocusControl = lblGenre
        end
        object Label5: TLabel
          Left = 531
          Top = 69
          Width = 99
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #1053#1086'&'#1084#1077#1088' '#1074' '#1089#1077#1088#1080#1080':'
          FocusControl = edSN
        end
        object Label7: TLabel
          Left = 9
          Top = 105
          Width = 112
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '&'#1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072':'
          FocusControl = edKeyWords
        end
        object Label8: TLabel
          Left = 531
          Top = 105
          Width = 37
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '&'#1071#1079#1099#1082':'
          FocusControl = cbLang
        end
        object btnShowGenres: TButton
          Left = 604
          Top = 25
          Width = 98
          Height = 33
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '&'#1042#1099#1073#1088#1072#1090#1100
          TabOrder = 0
          OnClick = btnShowGenresClick
        end
        object cbSeries: TComboBox
          Left = 135
          Top = 65
          Width = 363
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
        end
        object edSN: TEdit
          Left = 638
          Top = 65
          Width = 64
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Alignment = taRightJustify
          MaxLength = 3
          NumbersOnly = True
          TabOrder = 2
        end
        object edKeyWords: TEdit
          Left = 135
          Top = 101
          Width = 363
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 3
        end
        object cbLang: TComboBox
          Left = 638
          Top = 101
          Width = 64
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          TabOrder = 4
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
      object btnNext: TBitBtn
        AlignWithMargins = True
        Left = 728
        Top = 548
        Width = 189
        Height = 51
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
        TabOrder = 1
        OnClick = btnNextClick
      end
      object gbFDBCover: TGroupBox
        Left = 4
        Top = 129
        Width = 227
        Height = 321
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1054#1073#1083#1086#1078#1082#1072
        TabOrder = 2
        DesignSize = (
          227
          321)
        object FCover: TImage
          AlignWithMargins = True
          Left = 6
          Top = 23
          Width = 215
          Height = 245
          Hint = #1054#1073#1083#1086#1078#1082#1072
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Center = True
          ParentShowHint = False
          Proportional = True
          ShowHint = True
          Stretch = True
          ExplicitLeft = 7
          ExplicitTop = 24
          ExplicitWidth = 214
        end
        object btnPasteCover: TButton
          Left = 118
          Top = 280
          Width = 103
          Height = 34
          Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1080#1079' '#1073#1091#1092#1077#1088#1072
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akBottom]
          Caption = #1048#1079' '#1073#1091#1092#1077#1088#1072
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnPasteCoverClick
        end
        object btnLoad: TButton
          Left = 5
          Top = 280
          Width = 105
          Height = 34
          Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akBottom]
          Caption = #1048#1079' '#1092#1072#1081#1083#1072
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnLoadClick
        end
      end
      object btnCopyToFamily: TButton
        Tag = 555
        Left = 143
        Top = 54
        Width = 85
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1060#1072#1084#1080#1083#1080#1103
        TabOrder = 3
        TabStop = False
        OnClick = btnCopyToFamilyClick
      end
      object btnCopyToName: TButton
        Tag = 666
        Left = 235
        Top = 54
        Width = 85
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1048#1084#1103
        TabOrder = 4
        TabStop = False
        OnClick = btnCopyToNameClick
      end
      object btnCopyToSeries: TButton
        Left = 421
        Top = 54
        Width = 85
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1057#1077#1088#1080#1103
        TabOrder = 5
        TabStop = False
        OnClick = btnCopyToSeriesClick
      end
      object btnCopyToTitle: TButton
        Left = 328
        Top = 54
        Width = 85
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        TabOrder = 6
        TabStop = False
        OnClick = btnCopyToTitleClick
      end
      object btnOpenBook: TBitBtn
        Left = 514
        Top = 16
        Width = 98
        Height = 32
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1082#1085#1080#1075#1091
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1054#1090#1082#1088#1099#1090#1100
        DoubleBuffered = True
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = btnFileOpenClick
      end
      object btnRenameFile: TBitBtn
        Left = 620
        Top = 16
        Width = 117
        Height = 32
        Hint = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1092#1072#1081#1083
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100
        DoubleBuffered = True
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = miRenameFileClick
      end
      object edFileName: TEdit
        Left = 88
        Top = 18
        Width = 418
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        PopupMenu = pmEdit
        ReadOnly = True
        TabOrder = 9
      end
      object edTitle: TEdit
        Left = 86
        Top = 94
        Width = 620
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 10
      end
      object MHLSimplePanel1: TMHLSimplePanel
        Left = 239
        Top = 129
        Width = 479
        Height = 321
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 11
        object PageControl1: TPageControl
          Left = 0
          Top = 0
          Width = 479
          Height = 321
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ActivePage = TabSheet1
          Align = alClient
          TabOrder = 0
          object TabSheet1: TTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #1040#1074#1090#1086#1088#1099' '#1082#1085#1080#1075#1080
            object alBookAuthors: TFBDAuthorTable
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 463
              Height = 281
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              TabOrder = 0
              DesignSize = (
                463
                281)
            end
          end
          object TabSheet2: TTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #1040#1074#1090#1086#1088#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            ImageIndex = 1
            object alFBDAuthors: TFBDAuthorTable
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 463
              Height = 281
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              TabOrder = 0
              DesignSize = (
                463
                281)
            end
          end
          object TabSheet3: TTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #1040#1085#1085#1086#1090#1072#1094#1080#1103
            ImageIndex = 2
            object mmAnnotation: TMemo
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 463
              Height = 281
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              ScrollBars = ssBoth
              TabOrder = 0
              WordWrap = False
            end
          end
          object TabSheet4: TTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #1048#1079#1076#1072#1090#1077#1083#1100
            ImageIndex = 3
            DesignSize = (
              471
              289)
            object RzLabel4: TLabel
              Left = 43
              Top = 60
              Width = 34
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'ISBN:'
              FocusControl = edISBN
            end
            object RzLabel6: TLabel
              Left = 160
              Top = 25
              Width = 44
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akTop, akRight]
              Caption = #1043#1086#1088#1086#1076':'
              FocusControl = edCity
            end
            object RzLabel7: TLabel
              Left = 269
              Top = 60
              Width = 28
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akTop, akRight]
              Caption = #1043#1086#1076':'
              FocusControl = edYear
            end
            object RzLabel5: TLabel
              Left = 10
              Top = 25
              Width = 64
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
              FocusControl = edPublisher
            end
            object edISBN: TEdit
              Left = 86
              Top = 56
              Width = 176
              Height = 25
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edPublisher: TEdit
              Left = 86
              Top = 21
              Width = 66
              Height = 25
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object edYear: TEdit
              Left = 307
              Top = 56
              Width = 79
              Height = 25
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akTop, akRight]
              TabOrder = 2
            end
            object edCity: TEdit
              Left = 213
              Top = 21
              Width = 173
              Height = 25
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akTop, akRight]
              TabOrder = 3
            end
          end
        end
      end
    end
  end
  object btnClose: TBitBtn
    Left = 622
    Top = 652
    Width = 105
    Height = 34
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    DoubleBuffered = True
    ModalResult = 1
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object pmEdit: TPopupMenu
    Left = 640
    Top = 216
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
    Left = 640
    Top = 168
  end
  object pmMain: TPopupMenu
    Left = 640
    Top = 120
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
    Left = 640
    Top = 72
  end
end
