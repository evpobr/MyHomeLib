object frmEditBookInfo: TfrmEditBookInfo
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmEditBookInfo'
  ClientHeight = 342
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 342
    Align = alClient
    BorderOuter = fsGroove
    TabOrder = 0
    object RzPanel2: TRzPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 615
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BorderOuter = fsGroove
      Caption = '  '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077'  '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1082#1085#1080#1075#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      VisualStyle = vsGradient
    end
    object RzPanel3: TRzPanel
      AlignWithMargins = True
      Left = 5
      Top = 35
      Width = 615
      Height = 302
      Align = alClient
      BorderOuter = fsFlatRounded
      TabOrder = 1
      object btnSave: TRzBitBtn
        Left = 333
        Top = 270
        Width = 105
        Default = True
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 4
        OnClick = btnSaveClick
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
      object btnCancel: TRzBitBtn
        Left = 512
        Top = 270
        Width = 97
        Cancel = True
        ModalResult = 2
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 5
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF7F4026814125814125814125814125814125FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824125814125CB6600CB6600CB
          6600CB6600CB6600CB6600814125814125FF00FFFF00FFFF00FFFF00FFFF00FF
          9B4E18C56203CA6500CA6500CA6500CA6500CA6500CB6600CB6600CB6600C563
          03814125FF00FFFF00FFFF00FF994D19C46202C86300C66100C66100C66100C6
          6100C86300C96400CB6600CB6600CB6600C56303814125FF00FFFF00FFBB5D06
          C66201C46002C25E02BF5B02CE833FD6955AD8975BD68F4BD07720CB6600CB66
          00CB6600824125FF00FFA85411C96707C7680AC56809C26608C16405E7C3A0FE
          FEFEFEFEFEFEFEFEFEFEFEDB9957CB6600CB6600CB66007F4026AC570FCD7114
          CA7218C8721AC7711AC56F17C56F18C6711CC46E1AC56D1EE4B78DFEFEFECA65
          00CB6600CB6600824125AB5812D48434CF7F2ECD7E2DCD7F2FCC7D2CEACCACC6
          7019C2680CBF6003C66915FEFEFECA6500CB6600CB6600824125AC5915DEA264
          D7934DD38B41D48D44ECCFB1FEFEFECB7B2AC67019C3670BD7985DFEFEFECA65
          00CB6600CB6600824125AA5711E6B482E3B17CDA9854F4E0CCFEFEFEFEFEFEF8
          EEE3F3E1CFF2DFCCFEFEFEE5B88DCA6500CB6600CB6600824125AA550EE7B27D
          F0D3B5E5B079F5E1CCFEFEFEFEFEFEF4E2D0EBCBABE9C7A4DB9E60C76303CA65
          00CB6600CB66007F4026FF00FFAF6221F3D9BFF4D9BEEABB8BF2D8BDFEFEFED5
          8E45D08232CD7720CB6F11CA6604CA6500CB6600824125FF00FFFF00FFAA550E
          E9B782F8E7D5F6DFC8E9BB8BEFCFAED78F45D38433D07A22CF7417CB6808CB66
          00C563037D3F27FF00FFFF00FFFF00FFAB5610EBB986F6E0CAF7E6D4F0D1B1E8
          B98AE3AA71DFA060D98F44CE7111C563038F481EFF00FFFF00FFFF00FFFF00FF
          FF00FFAC570FB36728ECBC8BF0CBA6EECAA4EABC8EE1A263D47E28B05C158945
          21FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE5911B05D17B2
          611DB1601AB05B149C5019FF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object RzGroupBox4: TRzGroupBox
        Left = 6
        Top = 157
        Width = 307
        Height = 54
        Caption = #1057#1077#1088#1080#1103
        TabOrder = 2
        object edSN: TRzNumericEdit
          Left = 255
          Top = 20
          Width = 49
          Height = 21
          TabOrder = 0
          DisplayFormat = ',0;(,0)'
        end
        object cbSeries: TRzComboBox
          Left = 8
          Top = 21
          Width = 241
          Height = 21
          ItemHeight = 13
          TabOrder = 1
        end
      end
      object RzGroupBox2: TRzGroupBox
        Left = 6
        Top = 111
        Width = 603
        Height = 44
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        TabOrder = 1
        object edT: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 17
          Width = 595
          Height = 23
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 21
        end
      end
      object RzGroupBox1: TRzGroupBox
        Left = 6
        Top = 0
        Width = 603
        Caption = #1040#1074#1090#1086#1088#1099
        TabOrder = 0
        object lvAuthors: TRzListView
          Left = 6
          Top = 18
          Width = 497
          Height = 83
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
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = btnAChangeClick
        end
        object btnADelete: TRzBitBtn
          Left = 524
          Top = 75
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 3
          OnClick = btnADeleteClick
        end
        object btnAChange: TRzBitBtn
          Left = 524
          Top = 41
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 2
          OnClick = btnAChangeClick
        end
        object btnAddAuthor: TRzBitBtn
          Left = 524
          Top = 15
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 1
          OnClick = btnAddAuthorClick
        end
      end
      object RzGroupBox5: TRzGroupBox
        Left = 319
        Top = 161
        Width = 290
        Height = 50
        Caption = #1046#1072#1085#1088#1099
        TabOrder = 3
        object lblGenre: TLabel
          Left = 14
          Top = 21
          Width = 224
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnGenres: TButton
          Left = 244
          Top = 17
          Width = 41
          Height = 25
          Caption = '...'
          TabOrder = 0
          OnClick = btnGenresClick
        end
      end
      object RzGroupBox3: TRzGroupBox
        Left = 6
        Top = 217
        Width = 518
        Height = 44
        Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
        TabOrder = 6
        object edKeyWords: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 17
          Width = 510
          Height = 23
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 21
        end
      end
      object RzGroupBox6: TRzGroupBox
        Left = 530
        Top = 217
        Width = 79
        Height = 44
        Caption = #1071#1079#1099#1082
        TabOrder = 7
        object cbLang: TRzComboBox
          Left = 8
          Top = 18
          Width = 66
          Height = 21
          ItemHeight = 13
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
    end
  end
end
