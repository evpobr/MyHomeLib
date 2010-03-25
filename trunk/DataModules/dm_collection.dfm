object DMCollection: TDMCollection
  OldCreateOrder = False
  Height = 567
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
  object dsBooksA: TDataSource
    DataSet = tblBooksA
    Left = 96
    Top = 208
  end
  object tblBooksA: TABSTable
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
    object tblBooksAID: TAutoIncField
      FieldName = 'BookID'
    end
    object tblBooksASerieID: TIntegerField
      FieldName = 'SerieID'
    end
    object tblBooksASeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object tblBooksADate: TDateField
      FieldName = 'Date'
    end
    object tblBooksALibID: TIntegerField
      FieldName = 'LibID'
    end
    object tblBooksAInsideNo: TIntegerField
      FieldName = 'InsideNo'
      Required = True
    end
    object tblBooksAFileName: TWideStringField
      FieldName = 'FileName'
      Required = True
      Size = 170
    end
    object tblBooksAext: TWideStringField
      FieldName = 'ext'
      Size = 10
    end
    object tblBooksASize: TIntegerField
      FieldName = 'Size'
    end
    object tblBooksACode: TSmallintField
      FieldName = 'Code'
    end
    object tblBooksAFolder: TWideStringField
      FieldName = 'Folder'
      Size = 200
    end
    object tblBooksALocal: TBooleanField
      FieldName = 'Local'
    end
    object tblBooksADeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object tblBooksALibRate: TIntegerField
      FieldName = 'LibRate'
    end
    object tblBooksALang: TWideStringField
      FieldName = 'Lang'
      Size = 2
    end
    object tblBooksAURI: TWideStringField
      FieldName = 'URI'
      Size = 60
    end
    object tblBooksAKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
    object tblBooksATitle: TWideStringField
      FieldName = 'Title'
      Size = 150
    end
    object tblBooksAFullName: TWideStringField
      FieldName = 'FullName'
      Required = True
      Size = 120
    end
    object tblBooksASeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB
      LookupKeyFields = 'SerieID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerieID'
      Size = 100
      Lookup = True
    end
  end
  object tblBooksG: TABSTable
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
    object tblBooksGID: TAutoIncField
      FieldName = 'BookID'
    end
    object tblBooksGSerieID: TIntegerField
      FieldName = 'SerieID'
    end
    object tblBooksGSeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object tblBooksGDate: TDateField
      FieldName = 'Date'
    end
    object tblBooksGTitle: TWideStringField
      DisplayWidth = 150
      FieldName = 'Title'
      Size = 150
    end
    object tblBooksGLibID: TIntegerField
      FieldName = 'LibID'
    end
    object tblBooksGInsideNo: TIntegerField
      FieldName = 'InsideNo'
      Required = True
    end
    object tblBooksGFileName: TWideStringField
      FieldName = 'FileName'
      Required = True
      Size = 170
    end
    object tblBooksGext: TWideStringField
      FieldName = 'ext'
      Size = 10
    end
    object tblBooksGSize: TIntegerField
      FieldName = 'Size'
    end
    object tblBooksGCode: TSmallintField
      FieldName = 'Code'
    end
    object tblBooksGFolder: TWideStringField
      FieldName = 'Folder'
      Size = 200
    end
    object tblBooksGLocal: TBooleanField
      FieldName = 'Local'
    end
    object tblBooksGDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object tblBooksGLibRate: TIntegerField
      FieldName = 'LibRate'
    end
    object tblBooksGLang: TWideStringField
      FieldName = 'Lang'
      Size = 2
    end
    object tblBooksGURI: TWideStringField
      FieldName = 'URI'
      Size = 60
    end
    object tblBooksGSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB
      LookupKeyFields = 'SerieID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerieID'
      Size = 100
      Lookup = True
    end
    object tblBooksGKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
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
  object dsBooksG: TDataSource
    DataSet = tblBooksG
    Left = 480
    Top = 216
  end
  object tblAuthorsS: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    TableName = 'Authors'
    Exclusive = False
    Left = 208
    Top = 160
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
  object tblBooksS: TABSTable
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
    Top = 224
    object tblBooksSID: TAutoIncField
      FieldName = 'BookID'
    end
    object tblBooksSSerieID: TIntegerField
      FieldName = 'SerieID'
    end
    object tblBooksSSeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object tblBooksSDate: TDateField
      FieldName = 'Date'
    end
    object tblBooksSTitle: TWideStringField
      DisplayWidth = 150
      FieldName = 'Title'
      Size = 150
    end
    object tblBooksSLibID: TIntegerField
      FieldName = 'LibID'
    end
    object tblBooksSInsideNo: TIntegerField
      FieldName = 'InsideNo'
      Required = True
    end
    object tblBooksSFileName: TWideStringField
      FieldName = 'FileName'
      Required = True
      Size = 170
    end
    object tblBooksSext: TWideStringField
      FieldName = 'ext'
      Size = 10
    end
    object tblBooksSSize: TIntegerField
      FieldName = 'Size'
    end
    object tblBooksSCode: TSmallintField
      FieldName = 'Code'
    end
    object tblBooksSFolder: TWideStringField
      FieldName = 'Folder'
      Size = 200
    end
    object tblBooksSLocal: TBooleanField
      FieldName = 'Local'
    end
    object tblBooksSDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object tblBooksSLibRate: TIntegerField
      FieldName = 'LibRate'
    end
    object tblBooksSLang: TWideStringField
      FieldName = 'Lang'
      Size = 2
    end
    object tblBooksSURI: TWideStringField
      FieldName = 'URI'
      Size = 60
    end
    object tblBooksSSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeries
      LookupKeyFields = 'SerieID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerieID'
      Size = 100
      Lookup = True
    end
    object tblBooksSKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
  end
  object dsSeries: TDataSource
    DataSet = tblSeries
    Left = 272
    Top = 96
  end
  object dsAuthorsS: TDataSource
    DataSet = tblAuthorsS
    Left = 272
    Top = 160
  end
  object dsBooksS: TDataSource
    DataSet = tblBooksS
    Left = 272
    Top = 224
  end
  object tblBooks_Genre_List: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'BookIndex'
    TableName = 'Genre_List'
    Exclusive = False
    Left = 40
    Top = 368
    object tblBooks_Genre_ListGL_ID: TAutoIncField
      FieldName = 'GL_ID'
    end
    object tblBooks_Genre_ListGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Size = 30
    end
    object tblBooks_Genre_ListBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblBooks_Genre_ListGL_Family: TWideStringField
      FieldName = 'GL_Family'
      Size = 7
    end
    object tblBooks_Genre_ListGL_Series: TWideStringField
      FieldName = 'GL_Series'
      Size = 7
    end
    object tblBooks_Genre_ListGL_Title: TWideStringField
      FieldName = 'GL_Title'
      Size = 7
    end
  end
  object dsBook_Genre_List: TDataSource
    DataSet = tblBooks_Genre_List
    Left = 144
    Top = 368
  end
  object dsBooks_Genres: TDataSource
    DataSet = tblGenres
    Left = 144
    Top = 312
  end
  object tblGenre_List: TABSTable
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
    object tblGenre_ListGL_ID: TAutoIncField
      FieldName = 'GL_ID'
    end
    object tblGenre_ListGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Size = 30
    end
    object tblGenre_ListBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblGenre_ListGL_Family: TWideStringField
      FieldName = 'GL_Family'
      Size = 7
    end
    object tblGenre_ListGL_Series: TWideStringField
      FieldName = 'GL_Series'
      Size = 7
    end
    object tblGenre_ListGL_Title: TWideStringField
      FieldName = 'GL_Title'
      Size = 7
    end
  end
  object dsGenre_List: TDataSource
    DataSet = tblGenre_List
    Left = 480
    Top = 152
  end
  object tblAuthor_List: TABSTable
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
    object tblAuthor_ListAuthorID: TIntegerField
      FieldName = 'AuthorID'
    end
    object tblAuthor_ListBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblAuthor_ListAL_Series: TWideStringField
      FieldName = 'AL_Series'
      Size = 7
    end
    object tblAuthor_ListAL_Title: TWideStringField
      FieldName = 'AL_Title'
      Size = 7
    end
  end
  object dsAuthor_List: TDataSource
    DataSet = tblAuthor_List
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
    Left = 288
    Top = 360
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
    Left = 40
    Top = 424
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
    Left = 392
    Top = 352
  end
  object tblBooks_Genres: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'genres'
    Exclusive = False
    MasterFields = 'GenreCode'
    MasterSource = dsBook_Genre_List
    Left = 40
    Top = 312
    object tblBooks_GenresG_ID: TAutoIncField
      FieldName = 'G_ID'
    end
    object tblBooks_GenresGenreCode: TWideStringField
      FieldName = 'GenreCode'
    end
    object tblBooks_GenresG_ParentCode: TWideStringField
      FieldName = 'G_ParentCode'
    end
    object tblBooks_GenresG_FB2Code: TWideStringField
      FieldName = 'G_FB2Code'
    end
    object tblBooks_GenresG_Alias: TWideStringField
      FieldName = 'G_Alias'
      Size = 50
    end
  end
  object tblAuthor_Detail: TABSTable
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
    Top = 488
    object tblAuthor_DetailA_ID: TAutoIncField
      FieldName = 'AuthorID'
    end
    object tblAuthor_DetailA_Family: TWideStringField
      FieldName = 'A_Family'
      Required = True
      Size = 128
    end
    object tblAuthor_DetailA_Name: TWideStringField
      FieldName = 'A_Name'
      Size = 128
    end
    object tblAuthor_DetailA_Middle: TWideStringField
      FieldName = 'A_Middle'
      Size = 128
    end
  end
  object tblAuthor_Master: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'BookIndex'
    TableName = 'Author_List'
    Exclusive = False
    Left = 288
    Top = 424
    object tblAuthor_MasterAuthorID: TIntegerField
      FieldName = 'AuthorID'
    end
    object tblAuthor_MasterBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblAuthor_MasterAL_Series: TWideStringField
      FieldName = 'AL_Series'
      Size = 7
    end
    object tblAuthor_MasterAL_Title: TWideStringField
      FieldName = 'AL_Title'
      Size = 7
    end
  end
  object dsAuthor_Detail: TDataSource
    DataSet = tblAuthor_Detail
    Left = 392
    Top = 488
  end
  object dsAuthor_Master: TDataSource
    DataSet = tblAuthor_Master
    Left = 392
    Top = 424
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
    Left = 496
    Top = 320
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
    Left = 496
    Top = 376
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
    Filter = 'A_Family="'#1040'*"'
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
      'order by a.A_Family, a.A_Name, a.A_Middle;')
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
      FieldName = 'A_Family'
      Required = True
      Size = 128
    end
    object tblAuthorsName: TWideStringField
      DisplayLabel = 'Name'
      FieldName = 'A_Name'
      Size = 128
    end
    object tblAuthorsMiddle: TWideStringField
      DisplayLabel = 'Middle'
      FieldName = 'A_Middle'
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
    Left = 496
    Top = 432
    object sqlBooksID: TIntegerField
      FieldName = 'BookID'
    end
    object sqlBooksLibID: TIntegerField
      FieldName = 'LibID'
    end
    object sqlBooksTitle: TWideStringField
      FieldName = 'Title'
      Size = 150
    end
    object sqlBooksSerieID: TIntegerField
      FieldName = 'SerieID'
    end
    object sqlBooksSeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object sqlBooksDate: TDateField
      FieldName = 'Date'
    end
    object sqlBooksLibRate: TIntegerField
      FieldName = 'LibRate'
    end
    object sqlBooksLang: TWideStringField
      FieldName = 'Lang'
      Size = 2
    end
    object sqlBooksFolder: TWideStringField
      FieldName = 'Folder'
      Size = 200
    end
    object sqlBooksFileName: TWideStringField
      FieldName = 'FileName'
      Size = 170
    end
    object sqlBooksInsideNo: TIntegerField
      FieldName = 'InsideNo'
    end
    object sqlBooksExt: TWideStringField
      FieldName = 'Ext'
      Size = 10
    end
    object sqlBooksSize: TIntegerField
      FieldName = 'Size'
    end
    object sqlBooksURI: TWideStringField
      FieldName = 'URI'
      Size = 60
    end
    object sqlBooksCode: TSmallintField
      FieldName = 'Code'
    end
    object sqlBooksLocal: TBooleanField
      FieldName = 'Local'
    end
    object sqlBooksDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object sqlBooksRate: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Rate'
      LookupKeyFields = 'BookID'
      LookupResultField = 'Rate'
      KeyFields = 'BookID'
      Lookup = True
    end
    object sqlBooksKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
    object sqlBooksFullName: TWideStringField
      FieldName = 'FullName'
      Size = 120
    end
    object sqlBooksSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB
      LookupKeyFields = 'SerieID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerieID'
      Size = 80
      Lookup = True
    end
  end
  object dsGenres: TDataSource
    DataSet = tblGenres
    Left = 480
    Top = 88
  end
  object Books: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Books'
    Exclusive = False
    Left = 664
    Top = 88
    object BooksBookID: TAutoIncField
      FieldName = 'BookID'
    end
    object BooksLibID: TIntegerField
      FieldName = 'LibID'
    end
    object BooksTitle: TWideStringField
      FieldName = 'Title'
      Size = 150
    end
    object BooksFullName: TWideStringField
      FieldName = 'FullName'
      Required = True
      Size = 120
    end
    object BooksSerieID: TIntegerField
      FieldName = 'SerieID'
    end
    object BooksSeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object BooksDate: TDateField
      FieldName = 'Date'
    end
    object BooksLibRate: TIntegerField
      FieldName = 'LibRate'
    end
    object BooksLang: TWideStringField
      FieldName = 'Lang'
      Size = 2
    end
    object BooksFolder: TWideStringField
      FieldName = 'Folder'
      Size = 200
    end
    object BooksFileName: TWideStringField
      FieldName = 'FileName'
      Required = True
      Size = 170
    end
    object BooksInsideNo: TIntegerField
      FieldName = 'InsideNo'
      Required = True
    end
    object BooksExt: TWideStringField
      FieldName = 'Ext'
      Size = 10
    end
    object BooksSize: TIntegerField
      FieldName = 'Size'
    end
    object BooksURI: TWideStringField
      FieldName = 'URI'
      Size = 60
    end
    object BooksCode: TSmallintField
      FieldName = 'Code'
    end
    object BooksLocal: TBooleanField
      FieldName = 'Local'
    end
    object BooksDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object BooksKeyWords: TWideStringField
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
  object Extra: TABSTable
    CurrentVersion = '6.05 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Extra'
    Exclusive = False
    Left = 664
    Top = 216
    object ExtraBookID: TIntegerField
      FieldName = 'BookID'
      Required = True
    end
    object ExtraAnnotation: TWideMemoField
      FieldName = 'Annotation'
      BlobType = ftWideMemo
    end
    object ExtraReview: TWideMemoField
      FieldName = 'Review'
      BlobType = ftWideMemo
    end
    object ExtraRate: TIntegerField
      FieldName = 'Rate'
    end
    object ExtraProgress: TIntegerField
      FieldName = 'Progress'
    end
  end
end
