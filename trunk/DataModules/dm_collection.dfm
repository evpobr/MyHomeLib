object DMCollection: TDMCollection
  OldCreateOrder = False
  Height = 716
  Width = 779
  object DBCollection: TABSDatabase
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    Exclusive = True
    MaxConnections = 5
    MultiUser = False
    SessionName = 'Default'
    DisableTempFiles = True
    Left = 352
    Top = 16
  end
  object dsAuthors: TDataSource
    DataSet = Authors
    Left = 160
    Top = 96
  end
  object BooksByAuthor: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Books'
    Exclusive = False
    MasterFields = 'BookID'
    MasterSource = dsAuthorBooks
    Left = 56
    Top = 208
    object BooksByAuthorID: TAutoIncField
      FieldName = 'BookID'
    end
    object BooksByAuthorSerieID: TIntegerField
      FieldName = 'SerieID'
    end
  end
  object BooksByGenre: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Books'
    Exclusive = False
    MasterFields = 'BookID'
    MasterSource = dsGenreBooks
    Left = 496
    Top = 208
    object BooksByGenreID: TAutoIncField
      FieldName = 'BookID'
    end
    object BooksByGenreSerieID: TIntegerField
      FieldName = 'SerieID'
    end
  end
  object Genres: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    TableName = 'Genres'
    Exclusive = False
    Left = 496
    Top = 96
    object GenresGenreCode: TWideStringField
      FieldName = 'GenreCode'
    end
    object GenresG_ParentCode: TWideStringField
      FieldName = 'G_ParentCode'
    end
    object GenresG_FB2Code: TWideStringField
      FieldName = 'G_FB2Code'
    end
    object GenresG_Alias: TWideStringField
      FieldName = 'G_Alias'
      Size = 50
    end
  end
  object tblAuthorsS: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    TableName = 'Authors'
    Exclusive = False
    Left = 496
    Top = 352
    object tblAuthorsSID: TAutoIncField
      FieldName = 'ID'
    end
    object tblAuthorsSFamily: TWideStringField
      FieldName = 'Family'
      Required = True
      Size = 30
    end
    object tblAuthorsSName: TWideStringField
      FieldName = 'Name'
      Size = 15
    end
    object tblAuthorsSFullName: TWideStringField
      FieldName = 'FullName'
      Required = True
      Size = 45
    end
  end
  object BooksBySerie: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexFieldNames = 'SerieID'
    TableName = 'Books'
    Exclusive = False
    MasterFields = 'SerieID'
    MasterSource = dsSeries
    Left = 288
    Top = 152
    object BooksBySerieID: TAutoIncField
      FieldName = 'BookID'
    end
    object BooksBySerieSerieID: TIntegerField
      FieldName = 'SerieID'
    end
  end
  object dsSeries: TDataSource
    DataSet = Series
    Left = 392
    Top = 96
  end
  object dsAuthorsS: TDataSource
    DataSet = tblAuthorsS
    Left = 576
    Top = 352
  end
  object BookGenres_List: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'BookIndex'
    TableName = 'Genre_List'
    Exclusive = False
    Left = 56
    Top = 352
    object BookGenres_ListGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Size = 30
    end
    object BookGenres_ListBookID: TIntegerField
      FieldName = 'BookID'
    end
    object BookGenres_ListGL_Family: TWideStringField
      FieldName = 'GL_Family'
      Size = 7
    end
    object BookGenres_ListGL_Series: TWideStringField
      FieldName = 'GL_Series'
      Size = 7
    end
    object BookGenres_ListGL_Title: TWideStringField
      FieldName = 'GL_Title'
      Size = 7
    end
  end
  object dsBookGenres_List: TDataSource
    DataSet = BookGenres_List
    Left = 160
    Top = 352
  end
  object GenreBooks: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexFieldNames = 'GenreCode'
    TableName = 'Genre_List'
    Exclusive = False
    MasterFields = 'GenreCode'
    MasterSource = dsGenres
    Left = 496
    Top = 152
    object GenreBooksGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Size = 30
    end
    object GenreBooksBookID: TIntegerField
      FieldName = 'BookID'
    end
    object GenreBooksGL_Family: TWideStringField
      FieldName = 'GL_Family'
      Size = 7
    end
    object GenreBooksGL_Series: TWideStringField
      FieldName = 'GL_Series'
      Size = 7
    end
    object GenreBooksGL_Title: TWideStringField
      FieldName = 'GL_Title'
      Size = 7
    end
  end
  object dsGenreBooks: TDataSource
    DataSet = GenreBooks
    Left = 576
    Top = 152
  end
  object AuthorBooks: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'AuthIndex'
    TableName = 'author_List'
    Exclusive = False
    MasterFields = 'AuthorID'
    MasterSource = dsAuthors
    Left = 56
    Top = 152
    object AuthorBooksAuthorID: TIntegerField
      FieldName = 'AuthorID'
    end
    object AuthorBooksBookID: TIntegerField
      FieldName = 'BookID'
    end
    object AuthorBooksAL_Series: TWideStringField
      FieldName = 'AL_Series'
      Size = 7
    end
    object AuthorBooksAL_Title: TWideStringField
      FieldName = 'AL_Title'
      Size = 7
    end
  end
  object dsAuthorBooks: TDataSource
    DataSet = AuthorBooks
    Left = 160
    Top = 152
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
    Left = 56
    Top = 552
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
    object tblBooksURI: TWideStringField
      FieldName = 'URI'
      Size = 60
    end
    object tblBooksSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB1
      LookupKeyFields = 'SerieID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerieID'
      Size = 100
      Lookup = True
    end
    object tblBooksFullName: TWideStringField
      FieldName = 'FullName'
      Required = True
      Size = 120
    end
    object tblBooksKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
  end
  object dsBooks: TDataSource
    DataSet = tblBooks
    Left = 160
    Top = 552
  end
  object BookGenres: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'genres'
    Exclusive = False
    MasterFields = 'GenreCode'
    MasterSource = dsBookGenres_List
    Left = 56
    Top = 408
    object BookGenresGenreCode: TWideStringField
      FieldName = 'GenreCode'
    end
    object BookGenresG_ParentCode: TWideStringField
      FieldName = 'G_ParentCode'
    end
    object BookGenresG_FB2Code: TWideStringField
      FieldName = 'G_FB2Code'
    end
    object BookGenresG_Alias: TWideStringField
      FieldName = 'G_Alias'
      Size = 50
    end
  end
  object BookAuthor: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Authors'
    Exclusive = False
    MasterFields = 'AuthorID'
    MasterSource = dsBookAuthors_List
    Left = 288
    Top = 416
    object BookAuthorA_ID: TAutoIncField
      FieldName = 'AuthorID'
    end
    object BookAuthorLastName: TWideStringField
      FieldName = 'LastName'
      Required = True
      Size = 128
    end
    object BookAuthorFirstName: TWideStringField
      FieldName = 'FirstName'
      Size = 128
    end
    object BookAuthorMiddleName: TWideStringField
      FieldName = 'MiddleName'
      Size = 128
    end
  end
  object BookAuthors_List: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'BookIndex'
    TableName = 'Author_List'
    Exclusive = False
    Left = 288
    Top = 352
    object BookAuthors_ListAuthorID: TIntegerField
      FieldName = 'AuthorID'
    end
    object BookAuthors_ListBookID: TIntegerField
      FieldName = 'BookID'
    end
    object BookAuthors_ListAL_Series: TWideStringField
      FieldName = 'AL_Series'
      Size = 7
    end
    object BookAuthors_ListAL_Title: TWideStringField
      FieldName = 'AL_Title'
      Size = 7
    end
  end
  object dsBookAuthors_List: TDataSource
    DataSet = BookAuthors_List
    Left = 392
    Top = 352
  end
  object tblSeriesB1: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'S_Title<>"---"'
    Filtered = True
    IndexName = 'TiteIndex'
    TableName = 'series'
    Exclusive = False
    Left = 496
    Top = 616
    object tblSeriesB1SerieID: TAutoIncField
      FieldName = 'SerieID'
    end
    object tblSeriesB1AuthorID: TIntegerField
      FieldName = 'AuthorID'
      Required = True
    end
    object tblSeriesB1GenreCode: TWideStringField
      FieldName = 'GenreCode'
      Required = True
    end
    object tblSeriesB1S_Title: TWideStringField
      FieldName = 'S_Title'
      Required = True
      Size = 80
    end
  end
  object tblExtra: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Extra'
    Exclusive = False
    MasterFields = 'BookID'
    MasterSource = dsBooks
    Left = 56
    Top = 608
    object tblExtraBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblExtraAnnotation: TWideMemoField
      FieldName = 'Annotation'
      BlobType = ftWideMemo
    end
    object tblExtraReview: TWideMemoField
      FieldName = 'Review'
      BlobType = ftWideMemo
    end
  end
  object Authors: TABSQuery
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'LastName="'#1040'*"'
    RequestLive = True
    SQL.Strings = (
      'select a."*"'
      'from "authors" a'
      'where '
      '('
      '  :All = 0'
      '  or'
      '  a."AuthorID" in'
      '  ('
      '    select distinct l."AuthorID"'
      '    from "books" b, "author_list" l'
      '    where l."BookID" = b."BookID"'
      '    and b.local = true'
      '  )'
      ')'
      'order by a.LastName, a.FirstName, a.MiddleName;')
    Left = 56
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'All'
        ParamType = ptInput
        Value = 0
      end>
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
      'select s."*"'
      'from "Series" s'
      'where  s_Title<>"---" and '
      '('
      '  :All = 0'
      '  or'
      '  s."SerieID" in'
      '  ('
      '    select b."SerieID"'
      '    from "books" b'
      '    where b.local = true'
      '  )'
      ')'
      'order by s.s_Title, s.AuthorID;')
    Left = 288
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'All'
        ParamType = ptInput
        Value = 0
      end>
    object SeriesSerieID: TAutoIncField
      DisplayWidth = 10
      FieldName = 'SerieID'
    end
    object SeriesAuthID: TIntegerField
      DisplayWidth = 10
      FieldName = 'AuthorID'
      Required = True
    end
    object SeriesTitle: TWideStringField
      DisplayLabel = 'Title'
      DisplayWidth = 80
      FieldName = 'S_Title'
      Required = True
      Size = 80
    end
    object SeriesGenreCode: TWideStringField
      DisplayWidth = 20
      FieldName = 'GenreCode'
      Required = True
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
    Left = 688
    Top = 352
    object sqlBooksID: TIntegerField
      FieldName = 'BookID'
    end
    object sqlBooksSerieID: TIntegerField
      FieldName = 'SerieID'
    end
  end
  object dsGenres: TDataSource
    DataSet = Genres
    Left = 576
    Top = 96
  end
  object AllBooks: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Books'
    Exclusive = False
    Left = 688
    Top = 96
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
    object AllBooksFullName: TWideStringField
      FieldName = 'FullName'
      Required = True
      Size = 120
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
    object AllBooksURI: TWideStringField
      FieldName = 'URI'
      Size = 60
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
  end
  object AllSeries: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Series'
    Exclusive = False
    Left = 688
    Top = 152
    object AllSeriesSerieID: TAutoIncField
      FieldName = 'SerieID'
    end
    object AllSeriesS_Title: TWideStringField
      FieldName = 'S_Title'
      Required = True
      Size = 80
    end
  end
  object AllExtra: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Extra'
    Exclusive = False
    Left = 688
    Top = 208
    object AllExtraBookID: TIntegerField
      FieldName = 'BookID'
      Required = True
    end
    object AllExtraAnnotation: TWideMemoField
      FieldName = 'Annotation'
      BlobType = ftWideMemo
    end
    object AllExtraReview: TWideMemoField
      FieldName = 'Review'
      BlobType = ftWideMemo
    end
    object AllExtraRate: TIntegerField
      FieldName = 'Rate'
    end
    object AllExtraProgress: TIntegerField
      FieldName = 'Progress'
    end
  end
  object AllGenres: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    TableName = 'Genres'
    Exclusive = False
    Left = 688
    Top = 264
    object AllGenresGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Required = True
    end
    object AllGenresParentCode: TWideStringField
      FieldName = 'G_ParentCode'
    end
    object AllGenresFB2Code: TWideStringField
      FieldName = 'G_FB2Code'
    end
    object AllGenresAlias: TWideStringField
      FieldName = 'G_Alias'
      Required = True
      Size = 50
    end
  end
end
