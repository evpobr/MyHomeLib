object DMCollection: TDMCollection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 438
  Width = 291
  object DBCollection: TABSDatabase
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    Exclusive = True
    MaxConnections = 5
    MultiUser = False
    SessionName = 'Default'
    DisableTempFiles = True
    Left = 136
    Top = 16
  end
  object Genres: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    TableName = 'Genres'
    Exclusive = False
    Left = 56
    Top = 256
    object GenresGenreCode: TWideStringField
      FieldName = 'GenreCode'
    end
    object GenresParentCode: TWideStringField
      FieldName = 'ParentCode'
    end
    object GenresFB2Code: TWideStringField
      FieldName = 'FB2Code'
    end
    object GenresGenreAlias: TWideStringField
      FieldName = 'GenreAlias'
      Size = 50
    end
  end
  object BookGenres: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'BookIndex'
    TableName = 'Genre_List'
    Exclusive = False
    Left = 216
    Top = 208
    object BookGenresGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Size = 30
    end
    object BookGenresBookID: TIntegerField
      FieldName = 'BookID'
    end
  end
  object tblBooks: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexName = 'Title_Index'
    TableName = 'books'
    Exclusive = False
    Left = 88
    Top = 376
    object tblBooksID: TAutoIncField
      FieldName = 'BookID'
    end
    object tblBooksSerieID: TIntegerField
      FieldName = 'SerieID'
    end
    object tblBooksSeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object tblBooksLibID: TIntegerField
      FieldName = 'LibID'
    end
    object tblBooksDate: TDateField
      FieldName = 'Date'
    end
    object tblBooksInsideNo: TIntegerField
      FieldName = 'InsideNo'
      Required = True
    end
    object tblBooksFileName: TWideStringField
      FieldName = 'FileName'
      Required = True
      Size = 170
    end
    object tblBooksTitle: TWideStringField
      FieldName = 'Title'
      Size = 150
    end
    object tblBooksExt: TWideStringField
      FieldName = 'Ext'
      Size = 10
    end
    object tblBooksSize: TIntegerField
      FieldName = 'Size'
    end
    object tblBooksCode: TSmallintField
      FieldName = 'Code'
    end
    object tblBooksFolder: TWideStringField
      FieldName = 'Folder'
      Size = 200
    end
    object tblBooksLocal: TBooleanField
      FieldName = 'Local'
    end
    object tblBooksDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object tblBooksLibRate: TIntegerField
      FieldName = 'LibRate'
    end
    object tblBooksLang: TWideStringField
      FieldName = 'Lang'
      Size = 2
    end
    object tblBooksSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB1
      LookupKeyFields = 'SerieID'
      LookupResultField = 'SerieTitle'
      KeyFields = 'SerieID'
      Size = 100
      Lookup = True
    end
    object tblBooksKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
  end
  object AllAuthors: TABSTable
    CurrentVersion = '6.05 '
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
  object BookAuthors: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'BookIndex'
    TableName = 'Author_List'
    Exclusive = False
    Left = 216
    Top = 144
    object BookAuthorsAuthorID: TIntegerField
      FieldName = 'AuthorID'
    end
    object BookAuthorsBookID: TIntegerField
      FieldName = 'BookID'
    end
  end
  object tblSeriesB1: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'SerieTitle <> "---"'
    Filtered = True
    IndexName = 'SerieTitleIndex'
    TableName = 'series'
    Exclusive = False
    Left = 160
    Top = 376
    object tblSeriesB1SerieID: TAutoIncField
      FieldName = 'SerieID'
    end
    object tblSeriesB1SerieTitle: TWideStringField
      FieldName = 'SerieTitle'
      Required = True
      Size = 80
    end
  end
  object Authors: TABSQuery
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    RequestLive = True
    SQL.Strings = (
      'select a.AuthorID, a.LastName, a.FirstName, a.MiddleName'
      'from "authors" a'
      'order by a.LastName, a.FirstName, a.MiddleName')
    Left = 56
    Top = 144
    object AuthorsID: TAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'AuthorID'
    end
    object AuthorsFamily: TWideStringField
      DisplayLabel = 'Family'
      FieldName = 'LastName'
      Required = True
      Size = 128
    end
    object AuthorsName: TWideStringField
      DisplayLabel = 'Name'
      FieldName = 'FirstName'
      Size = 128
    end
    object AuthorsMiddle: TWideStringField
      DisplayLabel = 'Middle'
      FieldName = 'MiddleName'
      Size = 128
    end
  end
  object Series: TABSQuery
    CurrentVersion = '6.05 '
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
    Left = 56
    Top = 200
    object SeriesSerieID: TAutoIncField
      DisplayWidth = 10
      FieldName = 'SerieID'
    end
    object SeriesTitle: TWideStringField
      DisplayLabel = 'Title'
      DisplayWidth = 80
      FieldName = 'SerieTitle'
      Required = True
      Size = 80
    end
  end
  object sqlBooks: TABSQuery
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = True
    FilterOptions = [foCaseInsensitive, foNoPartialCompare]
    SQL.Strings = (
      'select * from books where BookID=1')
    Left = 216
    Top = 88
    object sqlBooksID: TIntegerField
      FieldName = 'BookID'
    end
  end
  object AllBooks: TABSTable
    CurrentVersion = '6.05 '
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
    object AllBooksSerieID: TIntegerField
      FieldName = 'SerieID'
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
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Series'
    Exclusive = False
    Left = 136
    Top = 200
    object AllSeriesSerieID: TAutoIncField
      FieldName = 'SerieID'
    end
    object AllSeriesSerieTitle: TWideStringField
      FieldName = 'SerieTitle'
      Required = True
      Size = 80
    end
  end
  object AllGenres: TABSTable
    CurrentVersion = '6.05 '
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
