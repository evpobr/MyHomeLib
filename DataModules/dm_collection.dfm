object DMCollection: TDMCollection
  OldCreateOrder = False
  Height = 567
  Width = 565
  object DBCollection: TABSDatabase
    Connected = True
    CurrentVersion = '6.02 '
    DatabaseFileName = 
      'D:\DelphiProjects\MyHomeLib 1.5\Debug\Bin\Data\librusec_online.h' +
      'lc'
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
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'Series_Index'
        Fields = 'SerID;SeqNumber'
      end
      item
        Name = 'File_Index'
        Fields = 'FileName'
      end>
    IndexName = 'ID_Index'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'DatabaseID'
        DataType = ftInteger
      end
      item
        Name = 'LibID'
        DataType = ftInteger
      end
      item
        Name = 'Title'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'FullName'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 120
      end
      item
        Name = 'SerID'
        DataType = ftInteger
      end
      item
        Name = 'SeqNumber'
        DataType = ftSmallint
      end
      item
        Name = 'Date'
        DataType = ftDate
      end
      item
        Name = 'LibRate'
        DataType = ftInteger
      end
      item
        Name = 'Lang'
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'DiscID'
        DataType = ftInteger
      end
      item
        Name = 'Folder'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'FileName'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'InsideNo'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Ext'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Size'
        DataType = ftInteger
      end
      item
        Name = 'URI'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'Code'
        DataType = ftSmallint
      end
      item
        Name = 'Local'
        DataType = ftBoolean
      end
      item
        Name = 'Deleted'
        DataType = ftBoolean
      end
      item
        Name = 'KeyWords'
        DataType = ftWideString
        Size = 255
      end>
    TableName = 'Books'
    Exclusive = False
    MasterFields = 'BookID'
    MasterSource = dsAuthor_List
    Left = 24
    Top = 208
    object tblBooksAID: TAutoIncField
      FieldName = 'ID'
    end
    object tblBooksASerID: TIntegerField
      FieldName = 'SerID'
    end
    object tblBooksASeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object tblBooksADate: TDateField
      FieldName = 'Date'
    end
    object tblBooksATitle: TWideStringField
      FieldName = 'Title'
      Size = 255
    end
    object tblBooksASeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesA
      LookupKeyFields = 'ID'
      LookupResultField = 'Title'
      KeyFields = 'SerID'
      Size = 100
      Lookup = True
    end
    object tblBooksARate: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Rate'
      LookupDataSet = DMUser.tblRates
      LookupKeyFields = 'BookID'
      LookupResultField = 'Rate'
      KeyFields = 'ID'
      Lookup = True
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
      Size = 255
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
      Size = 128
    end
    object tblBooksADiscID: TIntegerField
      FieldName = 'DiscID'
    end
    object tblBooksALocal: TBooleanField
      FieldName = 'Local'
    end
    object tblBooksADeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object tblBooksAProgress: TSmallintField
      FieldKind = fkLookup
      FieldName = 'Progress'
      LookupDataSet = DMUser.tblFinished
      LookupKeyFields = 'BookID'
      LookupResultField = 'Progress'
      KeyFields = 'ID'
      Lookup = True
    end
    object tblBooksADatabaseID: TIntegerField
      FieldName = 'DatabaseID'
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
      Size = 255
    end
    object tblBooksAKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
  end
  object tblBooksG: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'AuthorIndex'
        Fields = 'AuthID;SerID;SeqNumber;Title'
      end
      item
        Name = 'Series_Index'
        Fields = 'SerID;SeqNumber'
      end
      item
        Name = 'FullNameIndex'
        CaseInsFields = 'FullName;Title'
        Fields = 'FullName;Title'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'File_Index'
        Fields = 'FileName'
      end>
    IndexName = 'ID_Index'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'DatabaseID'
        DataType = ftInteger
      end
      item
        Name = 'LibID'
        DataType = ftInteger
      end
      item
        Name = 'Title'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'FullName'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 120
      end
      item
        Name = 'SerID'
        DataType = ftInteger
      end
      item
        Name = 'SeqNumber'
        DataType = ftSmallint
      end
      item
        Name = 'Date'
        DataType = ftDate
      end
      item
        Name = 'LibRate'
        DataType = ftInteger
      end
      item
        Name = 'Lang'
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'DiscID'
        DataType = ftInteger
      end
      item
        Name = 'Folder'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'FileName'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'InsideNo'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Ext'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Size'
        DataType = ftInteger
      end
      item
        Name = 'URI'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'Code'
        DataType = ftSmallint
      end
      item
        Name = 'Local'
        DataType = ftBoolean
      end
      item
        Name = 'Deleted'
        DataType = ftBoolean
      end
      item
        Name = 'KeyWords'
        DataType = ftWideString
        Size = 255
      end>
    TableName = 'Books'
    Exclusive = False
    MasterFields = 'BookID'
    MasterSource = dsGenre_List
    Left = 400
    Top = 216
    object tblBooksGID: TAutoIncField
      FieldName = 'ID'
    end
    object tblBooksGSerID: TIntegerField
      FieldName = 'SerID'
    end
    object tblBooksGSeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object tblBooksGDate: TDateField
      FieldName = 'Date'
    end
    object tblBooksGTitle: TWideStringField
      DisplayWidth = 255
      FieldName = 'Title'
      Size = 255
    end
    object tblBooksGSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesA
      LookupKeyFields = 'ID'
      LookupResultField = 'Title'
      KeyFields = 'SerID'
      Size = 100
      Lookup = True
    end
    object tblBooksGRate: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Rate'
      LookupDataSet = DMUser.tblRates
      LookupKeyFields = 'BookID'
      LookupResultField = 'Rate'
      KeyFields = 'ID'
      Lookup = True
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
      Size = 255
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
      Size = 128
    end
    object tblBooksGDiscID: TIntegerField
      FieldName = 'DiscID'
    end
    object tblBooksGLocal: TBooleanField
      FieldName = 'Local'
    end
    object tblBooksGProgress: TSmallintField
      FieldKind = fkLookup
      FieldName = 'Progress'
      LookupDataSet = DMUser.tblFinished
      LookupKeyFields = 'BookID'
      LookupResultField = 'Progress'
      KeyFields = 'ID'
      Lookup = True
    end
    object tblBooksGDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object tblBooksGDatabaseID: TIntegerField
      FieldName = 'DatabaseID'
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
      Size = 255
    end
    object tblBooksGKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
  end
  object tblGenres: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'Code'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'CodeIndex'
        Fields = 'ParentCode;Code'
      end
      item
        Name = 'FB2CodeIndex'
        Fields = 'FB2Code'
      end
      item
        Name = 'AliasIndex'
        Fields = 'Alias'
      end>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Code'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'ParentCode'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'FB2Code'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'Alias'
        DataType = ftWideString
        Size = 50
      end>
    TableName = 'Genres'
    Exclusive = False
    Left = 400
    Top = 88
    object tblGenresID: TAutoIncField
      DisplayWidth = 12
      FieldName = 'ID'
    end
    object tblGenresCode: TWideStringField
      DisplayWidth = 24
      FieldName = 'Code'
    end
    object tblGenresParentCode: TWideStringField
      DisplayWidth = 13
      FieldName = 'ParentCode'
    end
    object tblGenresFB2Code: TWideStringField
      DisplayWidth = 24
      FieldName = 'FB2Code'
    end
    object tblGenresAlias: TWideStringField
      DisplayWidth = 60
      FieldName = 'Alias'
      Size = 50
    end
  end
  object dsGenres: TDataSource
    DataSet = tblGenres
    Left = 480
    Top = 88
  end
  object dsBooksG: TDataSource
    DataSet = tblBooksG
    Left = 480
    Top = 216
  end
  object tblAuthorsS: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    TableName = 'Authors'
    Exclusive = False
    Left = 208
    Top = 216
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
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'AlphabetIndex'
        Fields = 'FullName;SerID;SeqNumber;Title'
      end
      item
        Name = 'FullNameIndex'
        CaseInsFields = 'FullName;Title'
        Fields = 'FullName;Title'
        Options = [ixCaseInsensitive]
      end>
    IndexFieldNames = 'SerID'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'DatabaseID'
        DataType = ftInteger
      end
      item
        Name = 'LibID'
        DataType = ftInteger
      end
      item
        Name = 'Title'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'FullName'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 120
      end
      item
        Name = 'SerID'
        DataType = ftInteger
      end
      item
        Name = 'SeqNumber'
        DataType = ftSmallint
      end
      item
        Name = 'Date'
        DataType = ftDate
      end
      item
        Name = 'LibRate'
        DataType = ftInteger
      end
      item
        Name = 'Lang'
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'DiscID'
        DataType = ftInteger
      end
      item
        Name = 'Folder'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'FileName'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'InsideNo'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Ext'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Size'
        DataType = ftInteger
      end
      item
        Name = 'URI'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'Code'
        DataType = ftSmallint
      end
      item
        Name = 'Local'
        DataType = ftBoolean
      end
      item
        Name = 'Deleted'
        DataType = ftBoolean
      end
      item
        Name = 'KeyWords'
        DataType = ftWideString
        Size = 255
      end>
    TableName = 'Books'
    Exclusive = False
    MasterFields = 'ID'
    MasterSource = dsSeries
    Left = 208
    Top = 160
    object tblBooksSID: TAutoIncField
      FieldName = 'ID'
    end
    object tblBooksSSerID: TIntegerField
      FieldName = 'SerID'
    end
    object tblBooksSSeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object tblBooksSDate: TDateField
      FieldName = 'Date'
    end
    object tblBooksSTitle: TWideStringField
      DisplayWidth = 255
      FieldName = 'Title'
      Size = 255
    end
    object tblBooksSSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeries
      LookupKeyFields = 'ID'
      LookupResultField = 'Title'
      KeyFields = 'SerID'
      Size = 100
      Lookup = True
    end
    object tblBooksSRate: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Rate'
      LookupDataSet = DMUser.tblRates
      LookupKeyFields = 'BookID'
      LookupResultField = 'Rate'
      KeyFields = 'ID'
      Lookup = True
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
      Size = 255
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
      Size = 128
    end
    object tblBooksSDiscID: TIntegerField
      FieldName = 'DiscID'
    end
    object tblBooksSLocal: TBooleanField
      FieldName = 'Local'
    end
    object tblBooksSProgress: TSmallintField
      FieldKind = fkLookup
      FieldName = 'Progress'
      LookupDataSet = DMUser.tblFinished
      LookupKeyFields = 'BookID'
      LookupResultField = 'Progress'
      KeyFields = 'ID'
      Lookup = True
    end
    object tblBooksSDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object tblBooksSDatabaseID: TIntegerField
      FieldName = 'DatabaseID'
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
      Size = 255
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
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BookIndex'
        Fields = 'BookID'
      end
      item
        Name = 'GenreIndex'
        Fields = 'GenreCode;Family'
      end>
    IndexName = 'BookIndex'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'GenreCode'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'BookID'
        DataType = ftInteger
      end
      item
        Name = 'Family'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Series'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Title'
        DataType = ftWideString
        Size = 10
      end>
    TableName = 'Genre_List'
    Exclusive = False
    Left = 40
    Top = 352
    object tblBooks_Genre_ListID: TAutoIncField
      FieldName = 'ID'
    end
    object tblBooks_Genre_ListGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Size = 30
    end
    object tblBooks_Genre_ListBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblBooks_Genre_ListFamily: TWideStringField
      FieldName = 'Family'
      Size = 10
    end
    object tblBooks_Genre_ListSeries: TWideStringField
      FieldName = 'Series'
      Size = 10
    end
    object tblBooks_Genre_ListTitle: TWideStringField
      FieldName = 'Title'
      Size = 10
    end
  end
  object dsBook_Genre_List: TDataSource
    DataSet = tblBooks_Genre_List
    Left = 144
    Top = 352
  end
  object dsBooks_Genres: TDataSource
    DataSet = tblGenres
    Left = 144
    Top = 424
  end
  object tblGenre_List: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BookIndex'
        Fields = 'BookID'
      end
      item
        Name = 'GenreIndex'
        Fields = 'GenreCode;Family'
      end>
    IndexFieldNames = 'GenreCode'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'GenreCode'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'BookID'
        DataType = ftInteger
      end
      item
        Name = 'Family'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Series'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Title'
        DataType = ftWideString
        Size = 10
      end>
    TableName = 'Genre_List'
    Exclusive = False
    MasterFields = 'Code'
    MasterSource = dsGenres
    Left = 400
    Top = 152
    object tblGenre_ListID: TAutoIncField
      FieldName = 'ID'
    end
    object tblGenre_ListGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Size = 30
    end
    object tblGenre_ListBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblGenre_ListFamily: TWideStringField
      FieldName = 'Family'
      Size = 10
    end
    object tblGenre_ListSeries: TWideStringField
      FieldName = 'Series'
      Size = 10
    end
    object tblGenre_ListTitle: TWideStringField
      FieldName = 'Title'
      Size = 10
    end
  end
  object dsGenre_List: TDataSource
    DataSet = tblGenre_List
    Left = 480
    Top = 152
  end
  object tblAuthor_List: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID;SerId;SerNo'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BookIndex'
        Fields = 'BookID'
      end
      item
        Name = 'AuthIndex'
        Fields = 'AuthID'
      end>
    IndexName = 'AuthIndex'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'AuthID'
        DataType = ftInteger
      end
      item
        Name = 'BookID'
        DataType = ftInteger
      end
      item
        Name = 'Series'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Title'
        DataType = ftWideString
        Size = 10
      end>
    TableName = 'author_List'
    Exclusive = False
    MasterFields = 'ID'
    MasterSource = dsAuthors
    Left = 24
    Top = 152
    object tblAuthor_ListID: TAutoIncField
      FieldName = 'ID'
    end
    object tblAuthor_ListAuthID: TIntegerField
      FieldName = 'AuthID'
    end
    object tblAuthor_ListBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblAuthor_ListSeries: TWideStringField
      FieldName = 'Series'
      Size = 10
    end
    object tblAuthor_ListTitle: TWideStringField
      FieldName = 'Title'
      Size = 10
    end
  end
  object dsAuthor_List: TDataSource
    DataSet = tblAuthor_List
    Left = 96
    Top = 152
  end
  object tblBooks: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'Series_Index'
        Fields = 'SerID;SeqNumber'
      end
      item
        Name = 'FullName_Index'
        Fields = 'Fullname;Title'
      end
      item
        Name = 'Title_Index'
        Fields = 'Title'
      end
      item
        Name = 'File_Index'
        Fields = 'FileName'
      end
      item
        Name = 'Folder_Index'
        Fields = 'DiscID;Folder'
      end>
    IndexName = 'Title_Index'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'DatabaseID'
        DataType = ftInteger
      end
      item
        Name = 'LibID'
        DataType = ftInteger
      end
      item
        Name = 'Title'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'FullName'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 120
      end
      item
        Name = 'SerID'
        DataType = ftInteger
      end
      item
        Name = 'SeqNumber'
        DataType = ftSmallint
      end
      item
        Name = 'Date'
        DataType = ftDate
      end
      item
        Name = 'LibRate'
        DataType = ftInteger
      end
      item
        Name = 'Lang'
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'DiscID'
        DataType = ftInteger
      end
      item
        Name = 'Folder'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'FileName'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'InsideNo'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Ext'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Size'
        DataType = ftInteger
      end
      item
        Name = 'URI'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'Code'
        DataType = ftSmallint
      end
      item
        Name = 'Local'
        DataType = ftBoolean
      end
      item
        Name = 'Deleted'
        DataType = ftBoolean
      end
      item
        Name = 'KeyWords'
        DataType = ftWideString
        Size = 255
      end>
    TableName = 'books'
    Exclusive = False
    Left = 288
    Top = 360
    object tblBooksID: TAutoIncField
      FieldName = 'ID'
    end
    object tblBooksSerID: TIntegerField
      FieldName = 'SerID'
    end
    object tblBooksSeqNumber: TSmallintField
      FieldName = 'SeqNumber'
    end
    object tblBooksDatabaseID: TIntegerField
      FieldName = 'DatabaseID'
    end
    object tblBooksLibID: TIntegerField
      FieldName = 'LibID'
    end
    object tblBooksDate: TDateField
      FieldName = 'Date'
    end
    object tblBooksTitle: TWideStringField
      FieldName = 'Title'
      Size = 100
    end
    object tblBooksInsideNo: TIntegerField
      FieldName = 'InsideNo'
      Required = True
    end
    object tblBooksFileName: TWideStringField
      FieldName = 'FileName'
      Required = True
      Size = 255
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
      Size = 255
    end
    object tblBooksDiscID: TIntegerField
      FieldName = 'DiscID'
    end
    object tblBooksLocal: TBooleanField
      FieldName = 'Local'
    end
    object tblBooksDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object tblBooksSeries: TWideStringField
      DisplayWidth = 255
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB
      LookupKeyFields = 'ID'
      LookupResultField = 'Title'
      KeyFields = 'SerID'
      Size = 255
      Lookup = True
    end
    object tblBooksProgress: TSmallintField
      FieldKind = fkLookup
      FieldName = 'Progress'
      LookupDataSet = DMUser.tblFinished
      LookupKeyFields = 'BookID'
      LookupResultField = 'Progress'
      KeyFields = 'ID'
      Lookup = True
    end
    object tblBooksRate: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Rate'
      LookupDataSet = DMUser.tblRates
      LookupKeyFields = 'BookID'
      LookupResultField = 'Rate'
      KeyFields = 'ID'
      Lookup = True
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
      Size = 255
    end
    object tblBooksKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
  end
  object tblSeriesA: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'Title<>"---"'
    Filtered = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'TiteIndex'
        Fields = 'Title;AuthID'
      end
      item
        Name = 'AuthorIndex'
        Fields = 'AuthID;Title'
      end
      item
        Name = 'SeqTitle'
        Fields = 'Title'
      end>
    IndexName = 'TiteIndex'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'AuthID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'GenreCode'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'Title'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 80
      end>
    TableName = 'Series'
    Exclusive = False
    Left = 40
    Top = 488
    object tblSeriesAID: TAutoIncField
      FieldName = 'ID'
    end
    object tblSeriesAAuthID: TIntegerField
      FieldName = 'AuthID'
      Required = True
    end
    object tblSeriesAGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Required = True
    end
    object tblSeriesATitle: TWideStringField
      FieldName = 'Title'
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
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'genres'
    Exclusive = False
    MasterFields = 'GenreCode'
    MasterSource = dsBook_Genre_List
    Left = 40
    Top = 424
    object tblBooks_GenresID: TAutoIncField
      FieldName = 'ID'
    end
    object tblBooks_GenresCode: TWideStringField
      FieldName = 'Code'
    end
    object tblBooks_GenresParentCode: TWideStringField
      FieldName = 'ParentCode'
    end
    object tblBooks_GenresFB2Code: TWideStringField
      FieldName = 'FB2Code'
    end
    object tblBooks_GenresAlias: TWideStringField
      FieldName = 'Alias'
      Size = 50
    end
  end
  object tblAuthor_Detail: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Authors'
    Exclusive = False
    MasterFields = 'AuthID'
    MasterSource = dsAuthor_Master
    Left = 288
    Top = 488
    object tblAuthor_DetailID: TAutoIncField
      FieldName = 'ID'
    end
    object tblAuthor_DetailFamily: TWideStringField
      FieldName = 'Family'
      Required = True
      Size = 128
    end
    object tblAuthor_DetailName: TWideStringField
      FieldName = 'Name'
      Size = 128
    end
    object tblAuthor_DetailMiddle: TWideStringField
      FieldName = 'Middle'
      Size = 128
    end
  end
  object tblAuthor_Master: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BookIndex'
        Fields = 'BookID'
      end
      item
        Name = 'AuthIndex'
        Fields = 'AuthID'
      end>
    IndexName = 'BookIndex'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'AuthID'
        DataType = ftInteger
      end
      item
        Name = 'BookID'
        DataType = ftInteger
      end
      item
        Name = 'Series'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'Title'
        DataType = ftWideString
        Size = 10
      end>
    TableName = 'Author_List'
    Exclusive = False
    Left = 288
    Top = 424
    object tblAuthor_MasterID: TAutoIncField
      FieldName = 'ID'
    end
    object tblAuthor_MasterAuthID: TIntegerField
      FieldName = 'AuthID'
    end
    object tblAuthor_MasterBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblAuthor_MasterSeries: TWideStringField
      FieldName = 'Series'
      Size = 10
    end
    object tblAuthor_MasterTitle: TWideStringField
      FieldName = 'Title'
      Size = 10
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
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'Title<>"---"'
    Filtered = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'TiteIndex'
        Fields = 'Title;AuthID'
      end
      item
        Name = 'AuthorIndex'
        Fields = 'AuthID;Title'
      end
      item
        Name = 'SeqTitle'
        Fields = 'Title'
      end>
    IndexName = 'TiteIndex'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'AuthID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'GenreCode'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'Title'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 80
      end>
    TableName = 'series'
    Exclusive = False
    Left = 496
    Top = 320
    object AutoIncField1: TAutoIncField
      FieldName = 'ID'
    end
    object IntegerField1: TIntegerField
      FieldName = 'AuthID'
      Required = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'Title'
      Required = True
      Size = 80
    end
    object WideStringField2: TWideStringField
      FieldName = 'GenreCode'
      Required = True
    end
  end
  object tblExtra: TABSTable
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BookIndex'
        Fields = 'BookID'
      end
      item
        Name = 'KeyWordIndex'
        CaseInsFields = 'KeyWords'
        Fields = 'KeyWords'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'ID_Index'
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'BookID'
        DataType = ftInteger
      end
      item
        Name = 'KeyWords'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'Annotation'
        DataType = ftMemo
      end
      item
        Name = 'Cover'
        DataType = ftBlob
      end
      item
        Name = 'Data'
        DataType = ftMemo
      end>
    TableName = 'Extra'
    Exclusive = False
    MasterFields = 'ID'
    MasterSource = dsBooks
    Left = 496
    Top = 384
    object tblExtraID: TAutoIncField
      FieldName = 'ID'
    end
    object tblExtraBookID: TIntegerField
      FieldName = 'BookID'
    end
    object tblExtraAnnotation: TMemoField
      FieldName = 'Annotation'
      BlobType = ftMemo
    end
    object tblExtraCover: TBlobField
      FieldName = 'Cover'
    end
    object tblExtraData: TMemoField
      FieldName = 'Data'
      BlobType = ftMemo
    end
  end
  object tblAuthors: TABSQuery
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'Family="'#1040'*"'
    RequestLive = True
    SQL.Strings = (
      'select a."*"'
      'from "authors" a'
      'where '
      '('
      '  :All = 0'
      '  or'
      '  a."id" in'
      '  ('
      '    select distinct l."authid"'
      '    from "books" b, "author_list" l'
      '    where l."bookid" = b."id"'
      '    and b.local = true'
      '  )'
      ')'
      'order by a.Family, a.Name, a.Middle;')
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
      FieldName = 'ID'
    end
    object tblAuthorsFamily: TWideStringField
      FieldName = 'Family'
      Required = True
      Size = 128
    end
    object tblAuthorsName: TWideStringField
      FieldName = 'Name'
      Size = 128
    end
    object tblAuthorsMiddle: TWideStringField
      FieldName = 'Middle'
      Size = 128
    end
  end
  object tblSeries: TABSQuery
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    RequestLive = True
    SQL.Strings = (
      'select s."*"'
      'from "Series" s'
      'where  Title<>"---" and '
      '('
      '  :All = 0'
      '  or'
      '  s."id" in'
      '  ('
      '    select b."SerID"'
      '    from "books" b'
      '    where b.local = true'
      '  )'
      ')'
      'order by s.Title, s.AuthID;')
    Left = 208
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'All'
        ParamType = ptInput
        Value = 0
      end>
    object tblSeriesID: TAutoIncField
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object tblSeriesAuthID: TIntegerField
      DisplayWidth = 10
      FieldName = 'AuthID'
      Required = True
    end
    object tblSeriesTitle: TWideStringField
      DisplayWidth = 80
      FieldName = 'Title'
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
    CurrentVersion = '6.02 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = True
    FilterOptions = [foCaseInsensitive, foNoPartialCompare]
    SQL.Strings = (
      'Select * FROM Books WHERE Id = 1;')
    Left = 504
    Top = 464
    object sqlBooksID: TIntegerField
      FieldName = 'ID'
    end
    object sqlBooksDatabaseID: TIntegerField
      FieldName = 'DatabaseID'
    end
    object sqlBooksLibID: TIntegerField
      FieldName = 'LibID'
    end
    object sqlBooksTitle: TWideStringField
      FieldName = 'Title'
      Size = 100
    end
    object sqlBooksSerID: TIntegerField
      FieldName = 'SerID'
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
    object sqlBooksDiscID: TIntegerField
      FieldName = 'DiscID'
    end
    object sqlBooksFolder: TWideStringField
      FieldName = 'Folder'
      Size = 255
    end
    object sqlBooksFileName: TWideStringField
      FieldName = 'FileName'
      Size = 255
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
      Size = 255
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
    object sqlBooksSeries: TWideStringField
      DisplayWidth = 255
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB
      LookupKeyFields = 'ID'
      LookupResultField = 'Title'
      KeyFields = 'SerID'
      Size = 255
      Lookup = True
    end
    object sqlBooksProgress: TSmallintField
      FieldKind = fkLookup
      FieldName = 'Progress'
      LookupDataSet = DMUser.tblFinished
      LookupKeyFields = 'BookID'
      LookupResultField = 'Progress'
      KeyFields = 'ID'
      Lookup = True
    end
    object sqlBooksRate: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Rate'
      LookupDataSet = DMUser.tblRates
      LookupKeyFields = 'BookID'
      LookupResultField = 'Rate'
      KeyFields = 'ID'
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
  end
end
