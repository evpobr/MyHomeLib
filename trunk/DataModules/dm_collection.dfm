object DMCollection: TDMCollection
  OldCreateOrder = False
  Height = 716
  Width = 724
  object DBCollection: TABSDatabase
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    Exclusive = True
    MaxConnections = 5
    MultiUser = False
    SessionName = 'Default'
    DisableTempFiles = True
    Left = 32
    Top = 8
  end
  object dsAuthors: TDataSource
    DataSet = tblAuthors
    Left = 96
    Top = 88
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
    MasterSource = dsAuthor_List
    Left = 24
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
    MasterSource = dsGenre_List
    Left = 400
    Top = 216
    object BooksByGenreID: TAutoIncField
      FieldName = 'BookID'
    end
    object BooksByGenreSerieID: TIntegerField
      FieldName = 'SerieID'
    end
  end
  object tblGenres: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    TableName = 'Genres'
    Exclusive = False
    Left = 400
    Top = 88
    object tblGenresG_ID: TAutoIncField
      FieldName = 'G_ID'
    end
    object tblGenresGenreCode: TWideStringField
      FieldName = 'GenreCode'
    end
    object tblGenresG_ParentCode: TWideStringField
      FieldName = 'G_ParentCode'
    end
    object tblGenresG_FB2Code: TWideStringField
      FieldName = 'G_FB2Code'
    end
    object tblGenresG_Alias: TWideStringField
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
    Left = 552
    Top = 472
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
    Left = 208
    Top = 152
    object BooksBySerieID: TAutoIncField
      FieldName = 'BookID'
    end
    object BooksBySerieSerieID: TIntegerField
      FieldName = 'SerieID'
    end
  end
  object dsSeries: TDataSource
    DataSet = tblSeries
    Left = 272
    Top = 96
  end
  object dsAuthorsS: TDataSource
    DataSet = tblAuthorsS
    Left = 616
    Top = 472
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
    object BookGenres_ListGL_ID: TAutoIncField
      FieldName = 'GL_ID'
    end
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
  object dsBook_Genre_List: TDataSource
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
    Left = 400
    Top = 152
    object GenreBooksGL_ID: TAutoIncField
      FieldName = 'GL_ID'
    end
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
  object dsGenre_List: TDataSource
    DataSet = GenreBooks
    Left = 480
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
    Left = 24
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
  object dsAuthor_List: TDataSource
    DataSet = AuthorBooks
    Left = 96
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
    Left = 320
    Top = 336
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
      LookupDataSet = tblSeriesB
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
  object tblSeriesA: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'S_Title<>"---"'
    Filtered = True
    IndexName = 'TiteIndex'
    TableName = 'Series'
    Exclusive = False
    Left = 56
    Top = 536
    object tblSeriesASerieID: TAutoIncField
      FieldName = 'SerieID'
    end
    object tblSeriesAAuthorID: TIntegerField
      FieldName = 'AuthorID'
      Required = True
    end
    object tblSeriesAGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Required = True
    end
    object tblSeriesAS_Title: TWideStringField
      FieldName = 'S_Title'
      Required = True
      Size = 80
    end
  end
  object dsBooks: TDataSource
    DataSet = tblBooks
    Left = 400
    Top = 336
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
    MasterSource = dsBook_Genre_List
    Left = 56
    Top = 408
    object BookGenresG_ID: TAutoIncField
      FieldName = 'G_ID'
    end
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
    MasterSource = dsAuthor_Master
    Left = 288
    Top = 584
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
    Top = 520
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
  object dsAuthor_Master: TDataSource
    DataSet = BookAuthors_List
    Left = 392
    Top = 520
  end
  object tblSeriesB: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'S_Title<>"---"'
    Filtered = True
    IndexName = 'TiteIndex'
    TableName = 'series'
    Exclusive = False
    Left = 56
    Top = 600
    object tblSeriesBSerieID: TAutoIncField
      FieldName = 'SerieID'
    end
    object tblSeriesBAuthorID: TIntegerField
      FieldName = 'AuthorID'
      Required = True
    end
    object tblSeriesBGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Required = True
    end
    object tblSeriesBS_Title: TWideStringField
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
    Left = 320
    Top = 392
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
  object tblAuthors: TABSQuery
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
    Left = 24
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'All'
        ParamType = ptInput
        Value = 0
      end>
    object tblAuthorsID: TAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'AuthorID'
    end
    object tblAuthorsFamily: TWideStringField
      DisplayLabel = 'Family'
      FieldName = 'LastName'
      Required = True
      Size = 128
    end
    object tblAuthorsName: TWideStringField
      DisplayLabel = 'Name'
      FieldName = 'FirstName'
      Size = 128
    end
    object tblAuthorsMiddle: TWideStringField
      DisplayLabel = 'Middle'
      FieldName = 'MiddleName'
      Size = 128
    end
  end
  object tblSeries: TABSQuery
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
    Left = 208
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'All'
        ParamType = ptInput
        Value = 0
      end>
    object tblSeriesSerieID: TAutoIncField
      DisplayWidth = 10
      FieldName = 'SerieID'
    end
    object tblSeriesAuthID: TIntegerField
      DisplayWidth = 10
      FieldName = 'AuthorID'
      Required = True
    end
    object tblSeriesTitle: TWideStringField
      DisplayLabel = 'Title'
      DisplayWidth = 80
      FieldName = 'S_Title'
      Required = True
      Size = 80
    end
    object tblSeriesGenreCode: TWideStringField
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
    Left = 656
    Top = 344
    object sqlBooksID: TIntegerField
      FieldName = 'BookID'
    end
    object sqlBooksSerieID: TIntegerField
      FieldName = 'SerieID'
    end
  end
  object dsGenres: TDataSource
    DataSet = tblGenres
    Left = 480
    Top = 88
  end
  object AllBooks: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Books'
    Exclusive = False
    Left = 664
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
    Left = 664
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
    Left = 664
    Top = 216
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
end
