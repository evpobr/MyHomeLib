object frmAddnonfb2: TfrmAddnonfb2
  Left = 0
  Top = 0
  HelpContext = 129
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1085#1080#1075' '#1074' '#1082#1086#1083#1083#1077#1082#1094#1080#1102
  ClientHeight = 658
  ClientWidth = 822
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 830
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = pmMain
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel2: TRzPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 816
    Height = 652
    Align = alClient
    BorderOuter = fsFlatRounded
    TabOrder = 0
    object Tree: TVirtualStringTree
      Left = 2
      Top = 308
      Width = 812
      Height = 342
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
      Color = clCream
      Colors.BorderColor = clBackground
      Colors.HotColor = clBlack
      Colors.UnfocusedSelectionColor = clNavy
      Colors.UnfocusedSelectionBorderColor = clBtnShadow
      DragMode = dmAutomatic
      EditDelay = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.AutoSizeIndex = -1
      Header.Font.Charset = ANSI_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -12
      Header.Font.Name = 'Arial'
      Header.Font.Style = [fsBold]
      Header.Height = 20
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoHotTrack, hoOwnerDraw, hoRestrictDrag, hoShowHint, hoShowImages, hoShowSortGlyphs, hoVisible, hoAutoSpring]
      Header.Style = hsFlatButtons
      HintMode = hmTooltip
      HotCursor = crHandPoint
      ParentFont = False
      ParentShowHint = False
      ScrollBarOptions.AlwaysVisible = True
      SelectionBlendFactor = 0
      ShowHint = False
      TabOrder = 0
      TreeOptions.AnimationOptions = [toAnimatedToggle]
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoExpand, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
      TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toFullRowDrag]
      TreeOptions.PaintOptions = [toPopupMode, toShowBackground, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toFullVertGridLines]
      TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect, toSimpleDrawSelection]
      OnChange = TreeChange
      OnCompareNodes = TreeCompareNodes
      OnDblClick = TreeDblClick
      OnGetText = TreeGetText
      OnPaintText = TreePaintText
      Columns = <
        item
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coSmartResize, coAllowFocus]
          Position = 0
          Width = 600
          WideText = #1060#1072#1081#1083
        end
        item
          Position = 1
          WideText = #1058#1080#1087
        end
        item
          Alignment = taRightJustify
          MaxWidth = 150
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coShowDropMark, coVisible, coFixed, coAllowFocus]
          Position = 2
          Width = 100
          WideText = #1056#1072#1079#1084#1077#1088
        end
        item
          Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAutoSpring, coSmartResize, coAllowFocus]
          Position = 3
          Width = 42
        end>
    end
    object RzPanel3: TRzPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 806
      Height = 300
      Align = alTop
      BorderOuter = fsFlatRounded
      TabOrder = 1
      object RzPanel1: TRzPanel
        Left = 2
        Top = 2
        Width = 802
        Height = 57
        Align = alTop
        BorderOuter = fsFlatRounded
        TabOrder = 0
        object btnCopyToSeries: TButton
          Left = 110
          Top = 31
          Width = 23
          Height = 18
          Caption = #1057
          TabOrder = 0
          TabStop = False
          OnClick = btnCopyToSeriesClick
        end
        object btnCopyToTitle: TButton
          Left = 81
          Top = 31
          Width = 23
          Height = 18
          Caption = #1053
          TabOrder = 1
          TabStop = False
          OnClick = btnCopyToTitleClick
        end
        object btnCopyToName: TButton
          Tag = 666
          Left = 41
          Top = 31
          Width = 23
          Height = 18
          Caption = #1048
          TabOrder = 2
          TabStop = False
          OnClick = btnCopyToNameClick
        end
        object btnCopyToFamily: TButton
          Tag = 555
          Left = 16
          Top = 31
          Width = 23
          Height = 18
          Caption = #1060
          TabOrder = 3
          TabStop = False
          OnClick = btnCopyToFamilyClick
        end
        object edFileName: TEdit
          AlignWithMargins = True
          Left = 7
          Top = 5
          Width = 788
          Height = 21
          Margins.Left = 5
          Margins.Right = 5
          TabStop = False
          Align = alTop
          Color = clCream
          PopupMenu = pmEdit
          ReadOnly = True
          TabOrder = 4
        end
        object RzBitBtn1: TRzBitBtn
          AlignWithMargins = True
          Left = 667
          Top = 29
          Width = 128
          Height = 26
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 0
          Align = alRight
          Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100
          TabOrder = 5
          OnClick = miRenameFileClick
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
        end
      end
      object RzGroupBox1: TRzGroupBox
        Left = 2
        Top = 65
        Width = 607
        Height = 127
        Caption = #1040#1074#1090#1086#1088#1099
        TabOrder = 1
        object lvAuthors: TRzListView
          Left = 6
          Top = 18
          Width = 497
          Height = 103
          Columns = <
            item
              Caption = #1060#1072#1084#1080#1083#1080#1103
              Width = 170
            end
            item
              Caption = #1048#1084#1103
              Width = 150
            end
            item
              Caption = #1054#1090#1095#1077#1089#1090#1074#1086
              Width = 150
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
          OnDblClick = btnChangeAuthorClick
        end
        object btnDeleteAuthor: TRzBitBtn
          Left = 509
          Top = 96
          Width = 90
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 3
          OnClick = btnDeleteAuthorClick
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
        object btnChangeAuthor: TRzBitBtn
          Left = 509
          Top = 41
          Width = 90
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          OnClick = btnChangeAuthorClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
            FF00FF7F331B8833138A37128A3B168A3B16FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF84351E8E32107C321FFF00FFFF00FFFF00FF93
            4112853F1EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF35221D35221D
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C4219984A13984A13FF00FFFF00
            FFFF00FFFF00FFFF00FF35221D1C63780076A900699A004C88FF00FFFF00FFFF
            00FFFF00FFFF00FF9A4E15A8590FA55A12A65C14B36810AA6214FF00FF02AAD8
            00B6EA036C970930940B0983FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF0281AB00BEEE03161707119C0C16980B0C83FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0281AB
            056AF2061C7402000007119C0C17990B0C83FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0B1CBB2555FF061C7402000007119C0C
            169C0B0C82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF0F26BF2455FF061C7402000007119C0C169C0B0C83FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1028C22455FF061C7402
            000007119C0C169C0A0C83FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF1129C42454FF061C7402000007119C0B169D0B0C83FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF112CC924
            55FF061C7402000007119C07119C0A0C83FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF132FCD2354FF061C7400000007119C999C
            D9171895FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF1531D11E4EFF061C74A3A19A7B7BD700018FFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1532D2ACBFFF6C76E10000
            A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF2F31A4020EAAFF00FFFF00FFFF00FFFF00FF}
        end
        object btnAddAuthor: TRzBitBtn
          Left = 509
          Top = 15
          Width = 90
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 0
          OnClick = btnAddAuthorClick
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
      end
      object RzGroupBox2: TRzGroupBox
        Left = 2
        Top = 198
        Width = 607
        Height = 44
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        TabOrder = 2
        object edT: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 17
          Width = 599
          Height = 23
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 21
        end
      end
      object RzGroupBox3: TRzGroupBox
        Left = 615
        Top = 65
        Width = 185
        Height = 127
        TabOrder = 5
        object btnAdd: TRzBitBtn
          AlignWithMargins = True
          Left = 6
          Top = 14
          Width = 173
          Height = 40
          Margins.Left = 5
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 0
          Align = alTop
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 1
          OnClick = btnAddClick
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
        end
        object cbAutoSeries: TCheckBox
          Left = 16
          Top = 55
          Width = 169
          Height = 17
          Caption = #1059#1074#1077#1083#1080#1095#1080#1074#1072#1090#1100' '#1085#1086#1084#1077#1088' '#1074' '#1089#1077#1088#1080#1080
          TabOrder = 0
        end
        object cbSelectFileName: TCheckBox
          Left = 16
          Top = 78
          Width = 145
          Height = 17
          Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077
          TabOrder = 2
        end
        object cbNoAuthorAllowed: TCheckBox
          Left = 16
          Top = 101
          Width = 145
          Height = 17
          Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1073#1077#1079' '#1072#1074#1090#1086#1088#1072
          TabOrder = 3
        end
      end
      object RzGroupBox4: TRzGroupBox
        Left = 2
        Top = 247
        Width = 379
        Height = 49
        Caption = #1057#1077#1088#1080#1103
        TabOrder = 3
        object edSN: TRzNumericEdit
          Left = 319
          Top = 20
          Width = 49
          Height = 21
          TabOrder = 0
          DisplayFormat = ',0;(,0)'
        end
        object cbSeries: TRzComboBox
          Left = 6
          Top = 20
          Width = 307
          Height = 21
          ItemHeight = 13
          TabOrder = 1
        end
      end
      object RzGroupBox5: TRzGroupBox
        Left = 387
        Top = 247
        Width = 412
        Height = 50
        Caption = #1046#1072#1085#1088#1099
        TabOrder = 4
        object lblGenre: TLabel
          Left = 7
          Top = 21
          Width = 336
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnShowGenres: TButton
          Left = 364
          Top = 17
          Width = 41
          Height = 25
          Caption = '...'
          TabOrder = 0
          OnClick = btnShowGenresClick
        end
      end
      object RzGroupBox6: TRzGroupBox
        AlignWithMargins = True
        Left = 615
        Top = 198
        Width = 184
        Height = 44
        Caption = #1054#1095#1080#1097#1072#1090#1100' '#1087#1086#1083#1103
        TabOrder = 6
        object cbClearOptions: TRzComboBox
          AlignWithMargins = True
          Left = 8
          Top = 16
          Width = 169
          Height = 21
          Margins.Left = 5
          Margins.Right = 5
          ItemHeight = 13
          TabOrder = 0
          Text = #1042#1089#1077
          Items.Strings = (
            #1042#1089#1077
            #1058#1086#1083#1100#1082#1086' '#1072#1074#1090#1086#1088#1099
            #1058#1086#1083#1100#1082#1086' '#1085#1072#1079#1074#1072#1085#1080#1077
            #1053#1077#1090)
          ItemIndex = 0
        end
      end
    end
  end
  object dlgFolder: TRzSelDirDialog
    DriveTypes = [dtFloppy, dtFixed, dtNetwork, dtCDROM, dtRAM]
    Prompt = 'Folder Name'
    PromptFolders = 'Folders'
    PromptDrives = 'Drives'
    Caption = 'Select a Folder'
    CaptionOK = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 384
    Top = 16
  end
  object pmEdit: TPopupMenu
    Left = 376
    Top = 368
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
    Left = 480
    Top = 368
  end
  object pmMain: TPopupMenu
    Left = 432
    Top = 368
    object miAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = btnAddClick
    end
    object MenuItem6: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16474
      OnClick = miClearAllClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object miOpenExplorer: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091' '#1074' '#1087#1088#1086#1074#1086#1076#1085#1080#1082#1077
      OnClick = miOpenExplorerClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object miRenameFile: TMenuItem
      Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1092#1072#1081#1083' '
      OnClick = miRenameFileClick
    end
  end
end
