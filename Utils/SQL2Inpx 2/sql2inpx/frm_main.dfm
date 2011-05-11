object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'SQL 2 INPX: librusec'
  ClientHeight = 513
  ClientWidth = 660
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
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 660
    Height = 494
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    OnChange = PagesChange
    object tsParams: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 646
        Height = 62
        Caption = #1050#1086#1083#1083#1077#1082#1094#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object edTitle: TLabeledEdit
          Left = 8
          Top = 32
          Width = 286
          Height = 21
          EditLabel.Width = 87
          EditLabel.Height = 13
          EditLabel.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = #1051#1086#1082#1072#1083#1100#1085#1072#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1103' Lib.rus.ec'
        end
        object edDescr: TLabeledEdit
          Left = 300
          Top = 32
          Width = 262
          Height = 21
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = #1040#1088#1093#1080#1074#1099' '#1089#1072#1081#1090#1072' lib.rus.ec [fb2] '
        end
        object edCode: TLabeledEdit
          Left = 568
          Top = 32
          Width = 75
          Height = 21
          EditLabel.Width = 20
          EditLabel.Height = 13
          EditLabel.Caption = #1050#1086#1076
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '134283264'
        end
      end
      object GroupBox2: TGroupBox
        Left = 518
        Top = 71
        Width = 131
        Height = 172
        Caption = #1054#1087#1094#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object cbFb2Only: TCheckBox
          Left = 16
          Top = 18
          Width = 97
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' fb2'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
        object cbOldFormat: TCheckBox
          Left = 16
          Top = 41
          Width = 97
          Height = 17
          Caption = 'Old format'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
        end
        object cbUseRole: TCheckBox
          Left = 16
          Top = 64
          Width = 97
          Height = 17
          Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1086#1083#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = cbUseRoleClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 132
        Width = 297
        Height = 111
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object edInpxName: TLabeledEdit
          Left = 8
          Top = 36
          Width = 158
          Height = 21
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Inpx'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'librusec'
        end
        object edUpdateName: TLabeledEdit
          Left = 8
          Top = 76
          Width = 158
          Height = 21
          EditLabel.Width = 35
          EditLabel.Height = 13
          EditLabel.Caption = 'Update'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'librusec_update'
        end
        object edInfoName: TLabeledEdit
          Left = 179
          Top = 76
          Width = 110
          Height = 21
          EditLabel.Width = 50
          EditLabel.Height = 13
          EditLabel.Caption = 'Info Name'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'last_librusec.info'
        end
        object cbMaxCompress: TCheckBox
          Left = 179
          Top = 38
          Width = 110
          Height = 17
          Caption = #1057#1078#1080#1084#1072#1090#1100
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 306
        Top = 132
        Width = 206
        Height = 111
        Caption = 'Extra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object edExtraInfo: TLabeledEdit
          Left = 10
          Top = 76
          Width = 190
          Height = 21
          EditLabel.Width = 76
          EditLabel.Height = 13
          EditLabel.Caption = 'Extra info name'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'last_extra.info'
        end
        object edExtraName: TLabeledEdit
          Left = 10
          Top = 36
          Width = 110
          Height = 21
          EditLabel.Width = 26
          EditLabel.Height = 13
          EditLabel.Caption = 'Extra'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'extra_update'
        end
        object edStartID: TLabeledEdit
          Left = 126
          Top = 36
          Width = 74
          Height = 21
          EditLabel.Width = 66
          EditLabel.Height = 13
          EditLabel.Caption = 'Extra start ID'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '175951'
        end
      end
      object Описание: TGroupBox
        Left = 3
        Top = 249
        Width = 646
        Height = 213
        Caption = 'INPX-'#1057#1082#1088#1080#1087#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object edURL: TLabeledEdit
          Left = 6
          Top = 34
          Width = 622
          Height = 21
          EditLabel.Width = 19
          EditLabel.Height = 13
          EditLabel.Caption = 'URL'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'http://lib.rus.ec/'
        end
        object mmScript: TMemo
          AlignWithMargins = True
          Left = 6
          Top = 61
          Width = 622
          Height = 140
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'ADD name %USER%'
            'ADD password %PASS%'
            'POST %URL%b/%LIBID%/get'
            'GET %RESURL%'
            'CHECK')
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox5: TGroupBox
        Left = 3
        Top = 71
        Width = 509
        Height = 58
        Caption = #1040#1088#1093#1080#1074#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object Label1: TLabel
          Left = 9
          Top = 16
          Width = 31
          Height = 13
          Caption = #1055#1072#1087#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edFolder: TRzButtonEdit
          Left = 8
          Top = 31
          Width = 338
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = edFolderButtonClick
        end
        object edFileMask: TLabeledEdit
          Left = 352
          Top = 31
          Width = 151
          Height = 21
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = #1052#1072#1089#1082#1072
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '*.zip'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1099
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label2: TLabel
        Left = 507
        Top = 11
        Width = 15
        Height = 13
        Caption = 'ID:'
      end
      object DBGrid3: TDBGrid
        Left = 329
        Top = 391
        Width = 320
        Height = 70
        DataSource = Lib.dsGenre
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid4: TDBGrid
        Left = 329
        Top = 316
        Width = 320
        Height = 69
        DataSource = Lib.dsSeries
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
            Width = 220
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
        Top = 316
        Width = 320
        Height = 145
        DataSource = Lib.dsAvtor
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
        Height = 164
        DataSource = Lib.dsLibBook
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KeyWords'
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
        Top = 4
        Width = 240
        Height = 25
        DataSource = Lib.dsLibBook
        TabOrder = 4
      end
      object edIDSearch: TEdit
        Left = 528
        Top = 7
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 5
        OnKeyDown = edIDSearchKeyDown
      end
      object GroupBox6: TGroupBox
        Left = 3
        Top = 204
        Width = 646
        Height = 106
        TabOrder = 6
        object Label3: TLabel
          Left = 11
          Top = 8
          Width = 33
          Height = 13
          Caption = 'BookId'
          FocusControl = DBEdit1
        end
        object Label4: TLabel
          Left = 71
          Top = 11
          Width = 20
          Height = 13
          Caption = 'Title'
          FocusControl = DBEdit2
        end
        object Label5: TLabel
          Left = 11
          Top = 56
          Width = 35
          Height = 13
          Caption = 'FileSize'
          FocusControl = DBEdit3
        end
        object Label6: TLabel
          Left = 71
          Top = 54
          Width = 40
          Height = 13
          Caption = 'FileType'
          FocusControl = DBEdit4
        end
        object Label7: TLabel
          Left = 133
          Top = 54
          Width = 37
          Height = 13
          Caption = 'Deleted'
          FocusControl = DBEdit5
        end
        object Label8: TLabel
          Left = 176
          Top = 54
          Width = 22
          Height = 13
          Caption = 'Time'
          FocusControl = DBEdit6
        end
        object Label9: TLabel
          Left = 270
          Top = 54
          Width = 23
          Height = 13
          Caption = 'Lang'
          FocusControl = DBEdit7
        end
        object Label11: TLabel
          Left = 312
          Top = 51
          Width = 46
          Height = 13
          Caption = 'keywords'
          FocusControl = DBEdit9
        end
        object DBEdit1: TDBEdit
          Left = 11
          Top = 27
          Width = 54
          Height = 21
          DataField = 'BookId'
          DataSource = Lib.dsLibBook
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 71
          Top = 27
          Width = 562
          Height = 21
          DataField = 'Title'
          DataSource = Lib.dsLibBook
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 11
          Top = 72
          Width = 54
          Height = 21
          DataField = 'FileSize'
          DataSource = Lib.dsLibBook
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 71
          Top = 70
          Width = 56
          Height = 21
          DataField = 'FileType'
          DataSource = Lib.dsLibBook
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 133
          Top = 70
          Width = 37
          Height = 21
          DataField = 'Deleted'
          DataSource = Lib.dsLibBook
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 176
          Top = 70
          Width = 88
          Height = 21
          DataField = 'Time'
          DataSource = Lib.dsLibBook
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 270
          Top = 70
          Width = 30
          Height = 21
          DataField = 'Lang'
          DataSource = Lib.dsLibBook
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 304
          Top = 70
          Width = 329
          Height = 21
          DataField = 'keywords'
          DataSource = Lib.dsLibBook
          ReadOnly = True
          TabOrder = 7
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1044#1072#1084#1087
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TGroupBox
        Left = 0
        Top = 0
        Width = 652
        Height = 105
        Align = alTop
        Caption = #1041#1044
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object edSQLUrl: TLabeledEdit
          Left = 8
          Top = 34
          Width = 389
          Height = 21
          EditLabel.Width = 63
          EditLabel.Height = 13
          EditLabel.Caption = 'SQL dump url'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'http://lib.rus.ec/sql/'
        end
        object edDBName: TLabeledEdit
          Left = 403
          Top = 34
          Width = 230
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'librusec'
        end
        object edMySQL: TLabeledEdit
          Left = 8
          Top = 78
          Width = 625
          Height = 21
          EditLabel.Width = 82
          EditLabel.Height = 13
          EditLabel.Caption = #1055#1091#1090#1100' '#1082' mysqlexe'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'c:\Program Files\MySQL\MySQL Server 5.1\bin\mysql.exe'
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 105
        Width = 652
        Height = 154
        Align = alTop
        Caption = #1060#1072#1081#1083#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object mmTables: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 642
          Height = 131
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
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
          ParentFont = False
          TabOrder = 0
        end
      end
      object GroupBox8: TGroupBox
        Left = 0
        Top = 259
        Width = 652
        Height = 207
        Align = alClient
        Caption = #1055#1086#1089#1090#1079#1072#1087#1088#1086#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object mmQuery: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 642
          Height = 184
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'ALTER ignore TABLE `libbook` CHANGE `bid` `BookId` int(10);'
            ''
            'ALTER ignore TABLE `libavtor` CHANGE `bid` `BookId` int(10);'
            'ALTER ignore TABLE `libavtor` CHANGE `aid` `AvtorId` int(10);'
            
              'ALTER ignore TABLE `libavtorname` CHANGE `aid` `AvtorId` int(10)' +
              ';'
            ''
            'ALTER ignore TABLE `libfilename` CHANGE `bid` `BookId` int(10);'
            ''
            'ALTER ignore TABLE `libgenre` CHANGE `bid` `BookId` int(10);'
            'ALTER ignore TABLE `libgenre` CHANGE `gid` `GenreId` int(10);'
            
              'ALTER ignore TABLE `libgenrelist` CHANGE `gid` `GenreId` int(10)' +
              ';'
            ''
            'ALTER ignore TABLE `libseq` CHANGE `bid` `BookId` int(10);'
            'ALTER ignore TABLE `libseq` CHANGE `sid` `SeqId` int(10);'
            'ALTER ignore TABLE `libseqname` CHANGE `sid` `SeqId` int(10);'
            ''
            'ALTER ignore TABLE `librate` CHANGE `bid` `BookId` int(10);')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1051#1086#1075
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblS1: TLabel
        Left = 304
        Top = 438
        Width = 93
        Height = 13
        Caption = '                               '
      end
      object mmLog: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 646
        Height = 424
        Align = alTop
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Bar: TProgressBar
        Left = 3
        Top = 433
        Width = 278
        Height = 23
        TabOrder = 1
      end
    end
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 494
    Width = 660
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
      Field = vifFileVersion
      VersionInfo = RzVersionInfo1
      ExplicitLeft = 660
      ExplicitHeight = 20
    end
  end
  object MainMenu: TMainMenu
    Left = 552
    Top = 352
    object N1: TMenuItem
      Caption = #1055#1088#1086#1092#1080#1083#1100
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
      object N15: TMenuItem
        Action = dbConnect
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N14: TMenuItem
        Action = dbImport
        Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1084#1087#1072' ('#1042#1085#1091#1090#1088'.)'
      end
      object N18: TMenuItem
        Action = dbImportExt
        Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1084#1087#1072' ('#1042#1085#1077#1096#1085'.)'
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
    Left = 472
    Top = 344
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
    object dbImportExt: TAction
      Category = 'Database'
      Caption = 'dbImportExt'
      OnExecute = dbImportExtExecute
    end
  end
  object Zip: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clFastest
    CompressionMode = 1
    CurrentVersion = '5.05 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = False
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.FlushBuffers = True
    Options.OEMFileNames = False
    InMemory = False
    Zip64Mode = zmDisabled
    UnicodeFilenames = True
    EncryptionMethod = caPkzipClassic
    Left = 376
    Top = 416
  end
  object dlgOpen: TOpenDialog
    Filter = 'zip|*.zip'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 208
    Top = 408
  end
  object idFTP: TIdFTP
    IPVersion = Id_IPv4
    TransferType = ftBinary
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 408
    Top = 416
  end
  object HTTP: TIdHTTP
    OnWork = HTTPWork
    OnWorkBegin = HTTPWorkBegin
    OnWorkEnd = HTTPWorkEnd
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 440
    Top = 416
  end
  object dlgSave: TSaveDialog
    DefaultExt = 'profile'
    Filter = 'Profile|*.profile'
    Left = 168
    Top = 408
  end
  object dlgFolder: TRzSelectFolderDialog
    Left = 520
    Top = 416
  end
  object RzVersionInfo1: TRzVersionInfo
    FilePath = 'sql2inpx.exe'
    Left = 112
    Top = 376
  end
  object FilesFinder: TFilesList
    OnFile = FilesFinderFile
    Left = 592
    Top = 416
  end
  object XPManifest1: TXPManifest
    Left = 504
    Top = 144
  end
end
