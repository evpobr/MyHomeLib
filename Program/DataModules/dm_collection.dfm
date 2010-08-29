object DMCollection: TDMCollection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 331
  Width = 209
  object DBCollection: TABSDatabase
    CurrentVersion = '6.06 '
    DatabaseName = 'Collection'
    Exclusive = True
    MaxConnections = 5
    MultiUser = False
    SessionName = 'Default'
    DisableTempFiles = True
    Left = 136
    Top = 16
  end
  object AllAuthors: TABSTable
    CurrentVersion = '6.06 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Authors'
    Exclusive = False
    Left = 136
    Top = 144
    object AllAuthorsAuthorID: TAutoIncField
      FieldName = 'AuthorID'
    end
    object AllAuthorsLastName: TWideStringField
      FieldName = 'LastName'
      Required = True
      Size = 128
    end
    object AllAuthorsFirstName: TWideStringField
      FieldName = 'FirstName'
      Size = 128
    end
    object AllAuthorsMiddleName: TWideStringField
      FieldName = 'MiddleName'
      Size = 128
    end
  end
  object Series: TABSQuery
    CurrentVersion = '6.06 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    RequestLive = True
    SQL.Strings = (
      'select s.SerieID, s.SerieTitle'
      'from "Series" s'
      'where s.SerieTitle <> "---"'
      'order by s.SerieTitle')
    Left = 8
    Top = 16
    object SeriesSeriesID: TAutoIncField
      DisplayWidth = 10
      FieldName = 'SeriesID'
    end
    object SeriesTitle: TWideStringField
      DisplayLabel = 'Title'
      DisplayWidth = 80
      FieldName = 'SeriesTitle'
      Required = True
      Size = 80
    end
  end
  object AllBooks: TABSTable
    CurrentVersion = '6.06 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Books'
    Exclusive = False
    Left = 136
    Top = 88
    object AllBooksBookID: TAutoIncField
      FieldName = 'BookID'
    end
    object AllBooksLibID: TIntegerField
      FieldName = 'LibID'
    end
    object AllBooksTitle: TWideStringField
      FieldName = 'Title'
      Size = 150
    end
    object AllBooksSeriesID: TIntegerField
      FieldName = 'SeriesID'
    end
    object AllBooksSeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object AllBooksDate: TDateField
      FieldName = 'Date'
    end
    object AllBooksLibRate: TIntegerField
      FieldName = 'LibRate'
    end
    object AllBooksLang: TWideStringField
      FieldName = 'Lang'
      Size = 2
    end
    object AllBooksFolder: TWideStringField
      FieldName = 'Folder'
      Size = 200
    end
    object AllBooksFileName: TWideStringField
      FieldName = 'FileName'
      Required = True
      Size = 170
    end
    object AllBooksInsideNo: TIntegerField
      FieldName = 'InsideNo'
      Required = True
    end
    object AllBooksExt: TWideStringField
      FieldName = 'Ext'
      Size = 10
    end
    object AllBooksSize: TIntegerField
      FieldName = 'Size'
    end
    object AllBooksCode: TSmallintField
      FieldName = 'Code'
    end
    object AllBooksLocal: TBooleanField
      FieldName = 'Local'
    end
    object AllBooksDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object AllBooksKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
    object AllBooksRate: TIntegerField
      FieldName = 'Rate'
    end
    object AllBooksProgress: TIntegerField
      FieldName = 'Progress'
    end
    object AllBooksAnnotation: TWideMemoField
      FieldName = 'Annotation'
      BlobType = ftWideMemo
    end
    object AllBooksReview: TWideMemoField
      FieldName = 'Review'
      BlobType = ftWideMemo
    end
  end
  object AllSeries: TABSTable
    CurrentVersion = '6.06 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Series'
    Exclusive = False
    Left = 136
    Top = 200
    object AllSeriesSeriesID: TAutoIncField
      FieldName = 'SeriesID'
    end
    object AllSeriesSeriesTitle: TWideStringField
      FieldName = 'SeriesTitle'
      Required = True
      Size = 80
    end
  end
  object AllGenres: TABSTable
    CurrentVersion = '6.06 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Genres'
    Exclusive = False
    Left = 136
    Top = 256
    object AllGenresGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Required = True
    end
    object AllGenresParentCode: TWideStringField
      FieldName = 'ParentCode'
    end
    object AllGenresFB2Code: TWideStringField
      FieldName = 'FB2Code'
    end
    object AllGenresAlias: TWideStringField
      FieldName = 'GenreAlias'
      Required = True
      Size = 50
    end
  end
end
