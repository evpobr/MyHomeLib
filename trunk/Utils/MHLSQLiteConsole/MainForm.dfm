object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'MHL SQLite simple console'
  ClientHeight = 619
  ClientWidth = 742
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnButtons: TMHLSimplePanel
    Left = 654
    Top = 0
    Width = 88
    Height = 619
    Align = alRight
    TabOrder = 0
    DesignSize = (
      88
      619)
    object btnExecute: TButton
      Left = 6
      Top = 73
      Width = 75
      Height = 25
      Caption = '&Execute'
      Enabled = False
      TabOrder = 2
      OnClick = btnExecuteClick
    end
    object btnOpen: TButton
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = btnOpenClick
    end
    object btnSelect: TButton
      Left = 6
      Top = 42
      Width = 75
      Height = 25
      Caption = '&Select'
      Enabled = False
      TabOrder = 1
      OnClick = btnSelectClick
    end
    object btnClear: TButton
      Left = 6
      Top = 546
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Clear'
      TabOrder = 3
      OnClick = btnClearClick
    end
    object btnExplain: TButton
      Left = 6
      Top = 104
      Width = 75
      Height = 25
      Caption = 'E&xplain'
      Enabled = False
      TabOrder = 4
      OnClick = btnExplainClick
    end
  end
  object pnContent: TMHLSimplePanel
    Left = 0
    Top = 0
    Width = 654
    Height = 619
    Align = alClient
    TabOrder = 1
    object MHLSplitter1: TMHLSplitter
      Left = 0
      Top = 229
      Width = 654
      Height = 4
      Cursor = crVSplit
      Align = alTop
      ResizeControl = edQuery
      ExplicitLeft = 1
      ExplicitTop = 236
      ExplicitWidth = 779
    end
    object pnDBName: TMHLSimplePanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 648
      Height = 32
      Align = alTop
      TabOrder = 2
      object dbName: TLabel
        Left = 0
        Top = 0
        Width = 648
        Height = 32
        Align = alClient
        AutoSize = False
        EllipsisPosition = epPathEllipsis
        Layout = tlCenter
        ExplicitLeft = 176
        ExplicitTop = 16
        ExplicitWidth = 31
        ExplicitHeight = 13
      end
    end
    object edQuery: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 41
      Width = 648
      Height = 185
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object lv: TListView
      AlignWithMargins = True
      Left = 3
      Top = 236
      Width = 648
      Height = 310
      Align = alClient
      Columns = <>
      HideSelection = False
      RowSelect = True
      TabOrder = 1
      ViewStyle = vsReport
    end
    object pnStat: TGridPanel
      AlignWithMargins = True
      Left = 3
      Top = 552
      Width = 648
      Height = 64
      Align = alBottom
      BevelOuter = bvNone
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 80.000000000000000000
        end
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = Label1
          Row = 0
        end
        item
          Column = 1
          Control = prepareTime
          Row = 0
        end
        item
          Column = 0
          Control = Label3
          Row = 1
        end
        item
          Column = 1
          Control = execTime
          Row = 1
        end
        item
          Column = 0
          Control = Label5
          Row = 2
        end
        item
          Column = 1
          Control = rowsFetched
          Row = 2
        end>
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 20.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 20.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 20.000000000000000000
        end>
      ShowCaption = False
      TabOrder = 3
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 80
        Height = 20
        Align = alClient
        Caption = 'Prepare time:'
        Layout = tlCenter
        ExplicitWidth = 65
        ExplicitHeight = 13
      end
      object prepareTime: TLabel
        Left = 80
        Top = 0
        Width = 568
        Height = 20
        Align = alClient
        ExplicitWidth = 3
        ExplicitHeight = 13
      end
      object Label3: TLabel
        Left = 0
        Top = 20
        Width = 80
        Height = 20
        Align = alClient
        Caption = 'Exec time:'
        Layout = tlCenter
        ExplicitWidth = 50
        ExplicitHeight = 13
      end
      object execTime: TLabel
        Left = 80
        Top = 20
        Width = 568
        Height = 20
        Align = alClient
        ExplicitWidth = 3
        ExplicitHeight = 13
      end
      object Label5: TLabel
        Left = 0
        Top = 40
        Width = 80
        Height = 20
        Align = alClient
        Caption = 'Rows fetched:'
        Layout = tlCenter
        ExplicitWidth = 70
        ExplicitHeight = 13
      end
      object rowsFetched: TLabel
        Left = 80
        Top = 40
        Width = 568
        Height = 20
        Align = alClient
        ExplicitWidth = 3
        ExplicitHeight = 13
      end
    end
  end
  object dlgOpenDB: TOpenDialog
    Filter = 'All files (*.*)|*.*'
    Left = 88
    Top = 40
  end
end
