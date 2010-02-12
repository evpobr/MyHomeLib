object Lib: TLib
  OldCreateOrder = False
  Height = 472
  Width = 564
  object Connection: TMyConnection
    Database = 'librusec'
    Options.UseUnicode = True
    Options.Charset = 'utf8'
    Username = 'lib'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 8
  end
  object dsBook: TMyDataSource
    DataSet = Book
    Left = 112
    Top = 64
  end
  object dsAvtorname: TMyDataSource
    DataSet = Avtor
    Left = 112
    Top = 128
  end
  object dsGenrelist: TMyDataSource
    DataSet = Genre
    Left = 120
    Top = 192
  end
  object dsSeqname: TMyDataSource
    DataSet = Series
    Left = 120
    Top = 256
  end
  object Avtor: TMyQuery
    Connection = Connection
    SQL.Strings = (
      'select an.LastName, an.FirstName, an.MiddleName from'
      
        '(libavtor ba left outer join libavtoraliase aa on aa.badid = ba.' +
        'avtorid)'
      
        'join libavtorname an on an.avtorid = COALESCE(aa.goodid, ba.avto' +
        'rid)'
      'WHERE  ba.bookid=25')
    Left = 56
    Top = 128
    object AvtorLastName: TWideStringField
      FieldName = 'LastName'
      Origin = 'an.LastName'
      Size = 99
    end
    object AvtorFirstName: TWideStringField
      FieldName = 'FirstName'
      Origin = 'an.FirstName'
      Size = 99
    end
    object AvtorMiddleName: TWideStringField
      FieldName = 'MiddleName'
      Origin = 'an.MiddleName'
      Size = 99
    end
  end
  object Genre: TMyQuery
    Connection = Connection
    SQL.Strings = (
      
        'SELECT G.GenreCode  FROM libgenrelist G, libgenre GL Where GL.Bo' +
        'okId = 25 AND G.genreid = GL.genreid')
    Left = 56
    Top = 192
    object GenreGenreCode: TWideStringField
      FieldName = 'GenreCode'
      Origin = 'libgenrelist.GenreCode'
      Size = 45
    end
  end
  object Series: TMyQuery
    Connection = Connection
    SQL.Strings = (
      
        'SELECT S.SeqName, SL.SeqNumb FROM libseqname S, libseq SL Where ' +
        'SL.BookID = 25 AND S.SeqID = SL.SeqId')
    Left = 56
    Top = 256
    object SeriesSeqName: TWideStringField
      FieldName = 'SeqName'
      Size = 254
    end
    object SeriesSeqNumb: TIntegerField
      FieldName = 'SeqNumb'
    end
  end
  object Book: TMyQuery
    Connection = Connection
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`' +
        'Lang`,`N`,`keywords` FROM libbook')
    AfterScroll = BookAfterScroll
    Active = True
    Left = 56
    Top = 64
  end
  object Query: TMyQuery
    Connection = Connection
    SQL.Strings = (
      'Select Count(*) From libbook')
    Left = 272
    Top = 160
  end
end
