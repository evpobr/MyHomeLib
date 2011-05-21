object frmEditBookInfo: TfrmEditBookInfo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '  '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077'  '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1082#1085#1080#1075#1077
  ClientHeight = 384
  ClientWidth = 608
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
  object Label1: TLabel
    Left = 8
    Top = 19
    Width = 52
    Height = 13
    Caption = '&'#1053#1072#1079#1074#1072#1085#1080#1077':'
    FocusControl = edT
  end
  object pnButtons: TPanel
    Left = 0
    Top = 343
    Width = 608
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnButtons'
    ShowCaption = False
    TabOrder = 3
    DesignSize = (
      608
      41)
    object btnOk: TButton
      Left = 444
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TButton
      Left = 525
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object btnNextBook: TButton
      Left = 89
      Top = 10
      Width = 75
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1087#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1082#1085#1080#1075#1077
      Caption = '&>>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnNextBookClick
    end
    object btnPrevBook: TButton
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1087#1077#1088#1077#1081#1090#1080' '#1082' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1082#1085#1080#1075#1077
      Caption = '&<<<'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnPrevBookClick
    end
  end
  object edT: TEdit
    AlignWithMargins = True
    Left = 66
    Top = 16
    Width = 534
    Height = 21
    TabOrder = 0
    OnChange = edTChange
  end
  object gbAuthors: TGroupBox
    Left = 8
    Top = 43
    Width = 593
    Height = 153
    Caption = '&'#1040#1074#1090#1086#1088#1099
    TabOrder = 1
    object lvAuthors: TListView
      Left = 16
      Top = 22
      Width = 484
      Height = 111
      BevelKind = bkFlat
      BorderStyle = bsNone
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
          AutoSize = True
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        end>
      ColumnClick = False
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = btnAChangeClick
    end
    object btnAddAuthor: TButton
      Left = 506
      Top = 22
      Width = 75
      Height = 25
      Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 1
      OnClick = btnAddAuthorClick
    end
    object btnAChange: TButton
      Left = 506
      Top = 53
      Width = 75
      Height = 25
      Caption = #1048'&'#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = btnAChangeClick
    end
    object btnADelete: TButton
      Left = 506
      Top = 84
      Width = 75
      Height = 25
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = btnADeleteClick
    end
  end
  object gbExtraInfo: TGroupBox
    Left = 8
    Top = 202
    Width = 593
    Height = 135
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' &'#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
    TabOrder = 2
    object Label6: TLabel
      Left = 16
      Top = 24
      Width = 40
      Height = 13
      Caption = '&'#1046#1072#1085#1088#1099':'
      FocusControl = lblGenre
    end
    object Label3: TLabel
      Left = 16
      Top = 50
      Width = 35
      Height = 13
      Caption = #1057'&'#1077#1088#1080#1103':'
      FocusControl = cbSeries
    end
    object Label4: TLabel
      Left = 424
      Top = 50
      Width = 76
      Height = 13
      Caption = #1053#1086'&'#1084#1077#1088' '#1074' '#1089#1077#1088#1080#1080':'
      FocusControl = edSN
    end
    object Label5: TLabel
      Left = 16
      Top = 77
      Width = 90
      Height = 13
      Caption = '&'#1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072':'
      FocusControl = edKeyWords
    end
    object Label7: TLabel
      Left = 16
      Top = 104
      Width = 30
      Height = 13
      Caption = '&'#1071#1079#1099#1082':'
      FocusControl = cbLang
    end
    object lblGenre: TEdit
      Left = 112
      Top = 21
      Width = 388
      Height = 20
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      ParentColor = True
      ReadOnly = True
      TabOrder = 0
    end
    object btnGenres: TButton
      Left = 506
      Top = 19
      Width = 75
      Height = 25
      Caption = '&'#1042#1099#1073#1088#1072#1090#1100
      TabOrder = 1
      OnClick = btnGenresClick
    end
    object cbLang: TComboBox
      Left = 112
      Top = 101
      Width = 66
      Height = 21
      TabOrder = 5
      OnChange = edTChange
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
    object cbSeries: TComboBox
      Left = 112
      Top = 47
      Width = 306
      Height = 21
      TabOrder = 2
      OnChange = edTChange
    end
    object edKeyWords: TEdit
      AlignWithMargins = True
      Left = 112
      Top = 74
      Width = 469
      Height = 21
      TabOrder = 4
      OnChange = edTChange
    end
    object edSN: TEdit
      Left = 506
      Top = 47
      Width = 75
      Height = 21
      Alignment = taRightJustify
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 3
      OnChange = edTChange
    end
  end
end
