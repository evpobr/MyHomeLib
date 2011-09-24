object dmTraum: TdmTraum
  OldCreateOrder = False
  Height = 390
  Width = 390
  object Database: TABSDatabase
    Connected = True
    CurrentVersion = '6.09 '
    DatabaseFileName = 
      'D:\DelphiProjects\MyHomeLib\Traum2Inpx\OUT\Debug\BIN\DB\traum.AB' +
      'S'
    DatabaseName = 'Traum'
    Exclusive = False
    MaxConnections = 500
    MultiUser = False
    SessionName = 'Default'
    Left = 32
    Top = 16
  end
  object tblAuthor: TABSTable
    CurrentVersion = '6.09 '
    DatabaseName = 'Traum'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'IndexName'
        Fields = 'id'
        Options = [ixPrimary]
      end>
    IndexName = 'IndexName'
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'FirstName'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'MidName'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'LastName'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'lang'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'series'
        DataType = ftInteger
      end>
    TableName = 'Author'
    Exclusive = False
    MasterFields = 'author'
    MasterSource = dsBooks
    Left = 32
    Top = 160
    object tblAuthorid: TIntegerField
      FieldName = 'id'
    end
    object tblAuthorFirstName: TStringField
      FieldName = 'FirstName'
      Size = 120
    end
    object tblAuthorMidName: TStringField
      FieldName = 'MidName'
      Size = 120
    end
    object tblAuthorLastName: TStringField
      FieldName = 'LastName'
      Size = 120
    end
    object tblAuthorlang: TStringField
      FieldName = 'lang'
      Size = 2
    end
    object tblAuthorseries: TIntegerField
      FieldName = 'series'
    end
  end
  object dsAuthors: TDataSource
    DataSet = tblAuthor
    Left = 104
    Top = 160
  end
  object dsBooks: TDataSource
    DataSet = tblBooks
    Left = 256
    Top = 56
  end
  object tblBooks: TABSTable
    CurrentVersion = '6.09 '
    DatabaseName = 'Traum'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'AuthorIdIndex'
        Fields = 'author'
      end
      item
        Name = 'BookIdIndex'
        Fields = 'id'
        Options = [ixPrimary]
      end
      item
        Name = 'SeriesIDIndex'
        Fields = 'series'
      end>
    IndexName = 'BookIdIndex'
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'author'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'lang'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'series'
        DataType = ftInteger
      end
      item
        Name = 'number'
        DataType = ftInteger
      end
      item
        Name = 'transl'
        DataType = ftString
        Size = 125
      end
      item
        Name = 'path'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'fname'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'size'
        DataType = ftInteger
      end
      item
        Name = 'added'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FileType'
        DataType = ftString
        Size = 5
      end>
    TableName = 'Book'
    Exclusive = False
    Left = 184
    Top = 56
    object tblBooksid: TIntegerField
      FieldName = 'id'
    end
    object tblBooksauthor: TIntegerField
      FieldName = 'author'
    end
    object tblBooksname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object tblBookslang: TStringField
      FieldName = 'lang'
      Size = 2
    end
    object tblBooksseries: TIntegerField
      FieldName = 'series'
    end
    object tblBooksnumber: TIntegerField
      FieldName = 'number'
    end
    object tblBookstransl: TStringField
      FieldName = 'transl'
      Size = 125
    end
    object tblBookspath: TStringField
      FieldName = 'path'
      Size = 250
    end
    object tblBooksfname: TStringField
      FieldName = 'fname'
      Size = 250
    end
    object tblBookssize: TIntegerField
      FieldName = 'size'
    end
    object tblBooksadded: TStringField
      FieldName = 'added'
      Size = 10
    end
    object tblBooksFileType: TStringField
      FieldName = 'FileType'
      Size = 5
    end
  end
  object dsSeries: TDataSource
    DataSet = tblSeries
    Left = 104
    Top = 216
  end
  object tblSeries: TABSTable
    CurrentVersion = '6.09 '
    DatabaseName = 'Traum'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'SeriesIdIndex'
        Fields = 'id'
      end>
    IndexName = 'SeriesIdIndex'
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 255
      end>
    TableName = 'series'
    Exclusive = False
    MasterFields = 'series'
    MasterSource = dsBooks
    Left = 32
    Top = 216
    object tblSeriesid: TIntegerField
      FieldName = 'id'
    end
    object tblSeriesname: TStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object tblGenres: TABSTable
    CurrentVersion = '6.09 '
    DatabaseName = 'Traum'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'BookIdIndex'
        Fields = 'id'
      end>
    IndexName = 'BookIdIndex'
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'code'
        DataType = ftString
        Size = 255
      end>
    TableName = 'genres'
    Exclusive = False
    MasterFields = 'id'
    MasterSource = dsBooks
    Left = 32
    Top = 288
    object tblGenresid: TIntegerField
      FieldName = 'id'
    end
    object tblGenrescode: TStringField
      FieldName = 'code'
      Size = 255
    end
  end
  object dsGenres: TDataSource
    DataSet = tblGenres
    Left = 104
    Top = 288
  end
end
