object DMCollection: TDMCollection
  OldCreateOrder = False
  Height = 567
  Width = 565
  object DBCollection: TABSDatabase
    CurrentVersion = '6.04 '
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
    CurrentVersion = '6.04 '
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
        Name = 'Title_Index'
        CaseInsFields = 'FullName;Title'
        Fields = 'FullName;Title'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'File_Index'
        CaseInsFields = 'FileName'
        Fields = 'FileName'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'Folder_Index'
        Fields = 'DiscID;Folder'
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
    MasterFields = 'AL_BookID'
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
      LookupKeyFields = 'S_ID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerID'
      Size = 100
      Lookup = True
    end
  end
  object tblBooksG: TABSTable
    CurrentVersion = '6.04 '
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
        Name = 'Title_Index'
        CaseInsFields = 'FullName;Title'
        Fields = 'FullName;Title'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'File_Index'
        CaseInsFields = 'FileName'
        Fields = 'FileName'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'Folder_Index'
        Fields = 'DiscID;Folder'
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
    MasterFields = 'GL_BookID'
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
      DisplayWidth = 150
      FieldName = 'Title'
      Size = 150
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
      Size = 60
    end
    object tblBooksGSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB
      LookupKeyFields = 'S_ID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerID'
      Size = 100
      Lookup = True
    end
    object tblBooksGKeyWords: TWideStringField
      FieldName = 'KeyWords'
      Size = 255
    end
  end
  object tblGenres: TABSTable
    CurrentVersion = '6.04 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'G_Code'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'CodeIndex'
        Fields = 'G_ParentCode;G_Code'
      end
      item
        Name = 'FB2CodeIndex'
        Fields = 'G_FB2Code'
      end
      item
        Name = 'AliasIndex'
        Fields = 'G_Alias'
      end>
    FieldDefs = <
      item
        Name = 'G_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'G_Code'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'G_ParentCode'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'G_FB2Code'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'G_Alias'
        DataType = ftWideString
        Size = 50
      end>
    TableName = 'Genres'
    Exclusive = False
    Left = 400
    Top = 88
    object tblGenresG_ID: TAutoIncField
      FieldName = 'G_ID'
    end
    object tblGenresG_Code: TWideStringField
      FieldName = 'G_Code'
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
    CurrentVersion = '6.04 '
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
    CurrentVersion = '6.04 '
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
    MasterFields = 'S_ID'
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
      DisplayWidth = 150
      FieldName = 'Title'
      Size = 150
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
      Size = 60
    end
    object tblBooksSSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeries
      LookupKeyFields = 'S_ID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerID'
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
    CurrentVersion = '6.04 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'GL_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BookIndex'
        Fields = 'GL_BookID'
      end
      item
        Name = 'GenreIndex'
        Fields = 'GL_Code;GL_Family;GL_Series;GL_Title'
      end>
    IndexName = 'BookIndex'
    FieldDefs = <
      item
        Name = 'GL_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'GL_Code'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'GL_BookID'
        DataType = ftInteger
      end
      item
        Name = 'GL_Family'
        DataType = ftWideString
        Size = 7
      end
      item
        Name = 'GL_Series'
        DataType = ftWideString
        Size = 7
      end
      item
        Name = 'GL_Title'
        DataType = ftWideString
        Size = 7
      end>
    TableName = 'Genre_List'
    Exclusive = False
    Left = 40
    Top = 352
    object tblBooks_Genre_ListGL_ID: TAutoIncField
      FieldName = 'GL_ID'
    end
    object tblBooks_Genre_ListGL_Code: TWideStringField
      FieldName = 'GL_Code'
      Size = 30
    end
    object tblBooks_Genre_ListGL_BookID: TIntegerField
      FieldName = 'GL_BookID'
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
    Top = 352
  end
  object dsBooks_Genres: TDataSource
    DataSet = tblGenres
    Left = 144
    Top = 424
  end
  object tblGenre_List: TABSTable
    CurrentVersion = '6.04 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'GL_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'BookIndex'
        Fields = 'GL_BookID'
      end
      item
        Name = 'GenreIndex'
        Fields = 'GL_Code;GL_Family;GL_Series;GL_Title'
      end>
    IndexFieldNames = 'GL_Code'
    FieldDefs = <
      item
        Name = 'GL_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'GL_Code'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'GL_BookID'
        DataType = ftInteger
      end
      item
        Name = 'GL_Family'
        DataType = ftWideString
        Size = 7
      end
      item
        Name = 'GL_Series'
        DataType = ftWideString
        Size = 7
      end
      item
        Name = 'GL_Title'
        DataType = ftWideString
        Size = 7
      end>
    TableName = 'Genre_List'
    Exclusive = False
    MasterFields = 'G_Code'
    MasterSource = dsGenres
    Left = 400
    Top = 152
    object tblGenre_ListGL_ID: TAutoIncField
      FieldName = 'GL_ID'
    end
    object tblGenre_ListGL_Code: TWideStringField
      FieldName = 'GL_Code'
      Size = 30
    end
    object tblGenre_ListGL_BookID: TIntegerField
      FieldName = 'GL_BookID'
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
    CurrentVersion = '6.04 '
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
        Name = 'AL_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'AL_AuthID'
        DataType = ftInteger
      end
      item
        Name = 'AL_BookID'
        DataType = ftInteger
      end
      item
        Name = 'AL_Series'
        DataType = ftWideString
        Size = 7
      end
      item
        Name = 'AL_Title'
        DataType = ftWideString
        Size = 7
      end>
    TableName = 'author_List'
    Exclusive = False
    MasterFields = 'A_ID'
    MasterSource = dsAuthors
    Left = 24
    Top = 152
    object tblAuthor_ListAL_ID: TAutoIncField
      FieldName = 'AL_ID'
    end
    object tblAuthor_ListAL_AuthID: TIntegerField
      FieldName = 'AL_AuthID'
    end
    object tblAuthor_ListAL_BookID: TIntegerField
      FieldName = 'AL_BookID'
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
    CurrentVersion = '6.04 '
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
      Size = 150
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
    object tblBooksDiscID: TIntegerField
      FieldName = 'DiscID'
    end
    object tblBooksLocal: TBooleanField
      FieldName = 'Local'
    end
    object tblBooksDeleted: TBooleanField
      FieldName = 'Deleted'
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
      Size = 60
    end
    object tblBooksSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB
      LookupKeyFields = 'S_ID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerID'
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
    CurrentVersion = '6.04 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'S_Title<>"---"'
    Filtered = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'S_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'TiteIndex'
        Fields = 'S_Title;S_AuthID'
      end
      item
        Name = 'AuthorIndex'
        Fields = 'S_AuthID;S_Title'
      end
      item
        Name = 'SeqTitle'
        CaseInsFields = 'S_Title'
        Fields = 'S_Title'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'TiteIndex'
    FieldDefs = <
      item
        Name = 'S_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'S_AuthID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'S_GenreCode'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'S_Title'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 80
      end>
    TableName = 'Series'
    Exclusive = False
    Left = 40
    Top = 488
    object tblSeriesAS_ID: TAutoIncField
      FieldName = 'S_ID'
    end
    object tblSeriesAS_AuthID: TIntegerField
      FieldName = 'S_AuthID'
      Required = True
    end
    object tblSeriesAS_GenreCode: TWideStringField
      FieldName = 'S_GenreCode'
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
    CurrentVersion = '6.04 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_Index'
        Fields = 'G_Code'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'CodeIndex'
        Fields = 'G_ParentCode;G_Code'
      end
      item
        Name = 'FB2CodeIndex'
        Fields = 'G_FB2Code'
      end
      item
        Name = 'AliasIndex'
        Fields = 'G_Alias'
      end>
    IndexName = 'ID_Index'
    FieldDefs = <
      item
        Name = 'G_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'G_Code'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'G_ParentCode'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'G_FB2Code'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'G_Alias'
        DataType = ftWideString
        Size = 50
      end>
    TableName = 'genres'
    Exclusive = False
    MasterFields = 'GL_Code'
    MasterSource = dsBook_Genre_List
    Left = 40
    Top = 424
    object tblBooks_GenresG_ID: TAutoIncField
      FieldName = 'G_ID'
    end
    object tblBooks_GenresG_Code: TWideStringField
      FieldName = 'G_Code'
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
    CurrentVersion = '6.04 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    IndexName = 'ID_Index'
    TableName = 'Authors'
    Exclusive = False
    MasterFields = 'AL_AuthID'
    MasterSource = dsAuthor_Master
    Left = 288
    Top = 488
    object tblAuthor_DetailA_ID: TAutoIncField
      FieldName = 'A_ID'
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
    CurrentVersion = '6.04 '
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
        Name = 'AL_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'AL_AuthID'
        DataType = ftInteger
      end
      item
        Name = 'AL_BookID'
        DataType = ftInteger
      end
      item
        Name = 'AL_Series'
        DataType = ftWideString
        Size = 7
      end
      item
        Name = 'AL_Title'
        DataType = ftWideString
        Size = 7
      end>
    TableName = 'Author_List'
    Exclusive = False
    Left = 288
    Top = 424
    object tblAuthor_MasterAL_ID: TAutoIncField
      FieldName = 'AL_ID'
    end
    object tblAuthor_MasterAL_AuthID: TIntegerField
      FieldName = 'AL_AuthID'
    end
    object tblAuthor_MasterAL_BookID: TIntegerField
      FieldName = 'AL_BookID'
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
    CurrentVersion = '6.04 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = False
    Filter = 'S_Title<>"---"'
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
        Name = 'S_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'S_AuthID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'S_GenreCode'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'S_Title'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 80
      end>
    TableName = 'series'
    Exclusive = False
    Left = 496
    Top = 320
    object tblSeriesBS_ID: TAutoIncField
      FieldName = 'S_ID'
    end
    object tblSeriesBS_AuthID: TIntegerField
      FieldName = 'S_AuthID'
      Required = True
    end
    object tblSeriesBS_GenreCode: TWideStringField
      FieldName = 'S_GenreCode'
      Required = True
    end
    object tblSeriesBS_Title: TWideStringField
      FieldName = 'S_Title'
      Required = True
      Size = 80
    end
  end
  object tblExtra: TABSTable
    CurrentVersion = '6.04 '
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
        Name = 'Annotation'
        DataType = ftWideMemo
      end
      item
        Name = 'Review'
        DataType = ftWideMemo
      end
      item
        Name = 'Cover'
        DataType = ftBlob
      end
      item
        Name = 'Data'
        DataType = ftWideMemo
      end>
    TableName = 'Extra'
    Exclusive = False
    MasterFields = 'ID'
    MasterSource = dsBooks
    Left = 496
    Top = 376
    object tblExtraID: TAutoIncField
      FieldName = 'ID'
    end
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
    object tblExtraCover: TBlobField
      FieldName = 'Cover'
    end
    object tblExtraData: TWideMemoField
      FieldName = 'Data'
      BlobType = ftWideMemo
    end
  end
  object tblAuthors: TABSQuery
    CurrentVersion = '6.04 '
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
      '  a."a_id" in'
      '  ('
      '    select distinct l."al_authid"'
      '    from "books" b, "author_list" l'
      '    where l."al_bookid" = b."id"'
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
      FieldName = 'A_ID'
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
    CurrentVersion = '6.04 '
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
      '  s."s_id" in'
      '  ('
      '    select b."SerID"'
      '    from "books" b'
      '    where b.local = true'
      '  )'
      ')'
      'order by s.s_Title, s.s_AuthID;')
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
      FieldName = 'S_ID'
    end
    object tblSeriesAuthID: TIntegerField
      DisplayWidth = 10
      FieldName = 'S_AuthID'
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
      DisplayLabel = 'GenreCode'
      DisplayWidth = 20
      FieldName = 'S_GenreCode'
      Required = True
    end
  end
  object sqlBooks: TABSQuery
    CurrentVersion = '6.04 '
    DatabaseName = 'Collection'
    InMemory = False
    ReadOnly = True
    FilterOptions = [foCaseInsensitive, foNoPartialCompare]
    SQL.Strings = (
      'select * from books where ID=1')
    Left = 504
    Top = 464
    object sqlBooksDatabaseID: TIntegerField
      FieldName = 'DatabaseID'
    end
    object sqlBooksLibID: TIntegerField
      FieldName = 'LibID'
    end
    object sqlBooksTitle: TWideStringField
      FieldName = 'Title'
      Size = 150
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
    object sqlBooksSeries: TWideStringField
      FieldKind = fkLookup
      FieldName = 'Series'
      LookupDataSet = tblSeriesB
      LookupKeyFields = 'S_ID'
      LookupResultField = 'S_Title'
      KeyFields = 'SerID'
      Size = 80
      Lookup = True
    end
    object sqlBooksID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsGenres: TDataSource
    DataSet = tblGenres
    Left = 480
    Top = 88
  end
end
