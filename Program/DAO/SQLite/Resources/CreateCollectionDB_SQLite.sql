DROP TABLE IF EXISTS [Settings];--
CREATE TABLE [Settings] (
  [ID] INTEGER NOT NULL PRIMARY KEY,
  [SettingValue] BLOB
);--

DROP TABLE IF EXISTS [Series];--
CREATE TABLE [Series] (
  [SeriesID] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  [SeriesTitle] VARCHAR(80) NOT NULL COLLATE SYSTEM_NOCASE,
  [SearchSeriesTitle] VARCHAR(80) COLLATE SYSTEM_NOCASE
);--
CREATE INDEX [IXSeries_Title] ON [Series] ([SeriesTitle]);--
CREATE INDEX [IXSeries_SearchSeriesTitle] ON [Series] ([SearchSeriesTitle]);--
CREATE TRIGGER [TRSeries_AI] AFTER INSERT ON [Series]
  BEGIN
    UPDATE Series SET SearchSeriesTitle = UPPER(TRIM(NEW.SeriesTitle))
    WHERE SeriesID = NEW.SeriesID ;
  END;--
CREATE TRIGGER [TRSeries_AU] AFTER UPDATE ON [Series]
  BEGIN
    UPDATE Series SET SearchSeriesTitle = UPPER(TRIM(NEW.SeriesTitle))
    WHERE SeriesID = NEW.SeriesID ;
  END;--

DROP TABLE IF EXISTS [Genres];--
CREATE TABLE [Genres] (
  [GenreCode] VARCHAR(20) NOT NULL PRIMARY KEY COLLATE NOCASE,
  [ParentCode] VARCHAR(20) COLLATE NOCASE,
  [FB2Code] VARCHAR(20) COLLATE NOCASE,
  [GenreAlias] VARCHAR(50) NOT NULL COLLATE SYSTEM_NOCASE
);--
CREATE UNIQUE INDEX [IXGenres_ParentCode_GenreCode] ON [Genres] ([ParentCode], [GenreCode]);--
CREATE INDEX [IXGenres_FB2Code] ON [Genres] ([FB2Code]);--
CREATE INDEX [IXGenres_GenreAlias] ON [Genres] ([GenreAlias]);--

DROP TABLE IF EXISTS [Authors];--
CREATE TABLE [Authors] (
  [AuthorID] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  [LastName] VARCHAR(128) NOT NULL COLLATE SYSTEM_NOCASE,
  [FirstName] VARCHAR(128) COLLATE SYSTEM_NOCASE,
  [MiddleName] VARCHAR(128) COLLATE SYSTEM_NOCASE,
  [SearchName] VARCHAR(512) COLLATE SYSTEM_NOCASE
);--
CREATE INDEX [IXAuthors_FullName] ON [Authors] ([LastName], [FirstName], [MiddleName]);--
CREATE INDEX [IXAuthors_SearchName] ON [Authors] ([SearchName]);--
CREATE TRIGGER [TRAuthors_AI] AFTER INSERT ON [Authors]
  BEGIN
    UPDATE Authors SET SearchName = UPPER(TRIM(NEW.LastName)) || CASE WHEN TRIM(IFNULL(NEW.FirstName,''))='' THEN '' ELSE ' ' END || UPPER(TRIM(IFNULL(NEW.FirstName, ''))) || CASE WHEN TRIM(IFNULL(NEW.MiddleName,'')) = '' THEN '' ELSE ' ' END || UPPER(TRIM(IFNULL(NEW.MiddleName, '')))
    WHERE AuthorID = NEW.AuthorID ;
  END;--
CREATE TRIGGER [TRAuthors_AU] AFTER UPDATE ON [Authors]
  BEGIN
    UPDATE Authors SET SearchName = UPPER(TRIM(NEW.LastName)) || CASE WHEN TRIM(IFNULL(NEW.FirstName,''))='' THEN '' ELSE ' ' END || UPPER(TRIM(IFNULL(NEW.FirstName, ''))) || CASE WHEN TRIM(IFNULL(NEW.MiddleName,'')) = '' THEN '' ELSE ' ' END || UPPER(TRIM(IFNULL(NEW.MiddleName, '')))
    WHERE AuthorID = NEW.AuthorID ;
  END;--

DROP TABLE IF EXISTS [Books];--
CREATE TABLE [Books] (
  [BookID] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  [LibID] INTEGER NOT NULL,
  [Title] VARCHAR(150) NOT NULL COLLATE SYSTEM_NOCASE,
  [SeriesID] INTEGER,
  [SeqNumber] INTEGER,
  [UpdateDate] VARCHAR(23) NOT NULL,
  [LibRate] INTEGER NOT NULL DEFAULT 0,
  [Lang] VARCHAR(2) COLLATE SYSTEM_NOCASE,
  [Folder] VARCHAR(200) COLLATE SYSTEM_NOCASE,
  [FileName] VARCHAR(170) NOT NULL COLLATE SYSTEM_NOCASE,
  [InsideNo] INTEGER NOT NULL,
  [Ext] VARCHAR(10) COLLATE SYSTEM_NOCASE,
  [BookSize] INTEGER,
  [Code] INTEGER NOT NULL DEFAULT 0,
  [IsLocal] INTEGER NOT NULL DEFAULT 0,
  [IsDeleted] INTEGER NOT NULL DEFAULT 0,
  [KeyWords] VARCHAR(255) COLLATE SYSTEM_NOCASE,
  [Rate] INTEGER NOT NULL DEFAULT 0,
  [Progress] INTEGER NOT NULL DEFAULT 0,
  [Annotation] VARCHAR(4096),
  [Review] BLOB,
  [SearchTitle] VARCHAR(150) COLLATE SYSTEM_NOCASE,
  [SearchLang] VARCHAR(2) COLLATE SYSTEM_NOCASE,
  [SearchFolder] VARCHAR(200) COLLATE SYSTEM_NOCASE,
  [SearchFileName] VARCHAR(170) COLLATE SYSTEM_NOCASE,
  [SearchExt] VARCHAR(10) COLLATE SYSTEM_NOCASE,
  [SearchKeyWords] VARCHAR(255) COLLATE SYSTEM_NOCASE,
  [SearchAnnotation] VARCHAR(4096) COLLATE SYSTEM_NOCASE
);--
CREATE INDEX [IXBooks_SeriesID_SeqNumber] ON [Books] ([SeriesID], [SeqNumber]);--
CREATE INDEX [IXBooks_SeriesID_IsDeleted_IsLocal] ON [Books] ([SeriesID], [IsDeleted], [IsLocal]);--
CREATE INDEX [IXBooks_Title] ON [Books] ([Title]);--
CREATE INDEX [IXBooks_FileName] ON [Books] ([FileName]);--
CREATE INDEX [IXBooks_Folder] ON [Books] ([Folder]);--
CREATE INDEX [IXBooks_IsDeleted] ON [Books] ([IsDeleted]);--
CREATE INDEX [IXBooks_UpdateDate] ON [Books] ([UpdateDate]);--
CREATE INDEX [IXBooks_IsLocal] ON [Books] ([IsLocal]);--
CREATE INDEX [IXBooks_LibID] ON [Books] ([LibID]);--
CREATE INDEX [IXBooks_KeyWords] ON [Books] ([KeyWords]);--
CREATE INDEX [IXBooks_BookID_IsDeleted_IsLocal] ON [Books] ([BookID], [IsDeleted], [IsLocal]);--
CREATE INDEX [IXBooks_SearchTitle] ON [Books] ([SearchTitle]);--
CREATE INDEX [IXBooks_SearchLang] ON [Books] ([SearchLang]);--
CREATE INDEX [IXBooks_SearchFolder] ON [Books] ([SearchFolder]);--
CREATE INDEX [IXBooks_SearchFileName] ON [Books] ([SearchFileName]);--
CREATE INDEX [IXBooks_SearchExt] ON [Books] ([SearchExt]);--
CREATE INDEX [IXBooks_SearchKeyWords] ON [Books] ([SearchKeyWords]);--
CREATE INDEX [IXBooks_SearchAnnotation] ON [Books] ([SearchAnnotation]);--
CREATE TRIGGER [TRBooks_AI] AFTER INSERT ON [Books]
  BEGIN
    UPDATE Books
    SET SearchTitle = UPPER(TRIM(NEW.Title)),
        SearchLang = UPPER(TRIM(NEW.Lang)),
        SearchFolder = UPPER(TRIM(NEW.Folder)),
        SearchFileName = UPPER(TRIM(NEW.FileName)),
        SearchExt = UPPER(TRIM(NEW.Ext)),
        SearchKeyWords = UPPER(TRIM(NEW.KeyWords)),
        SearchAnnotation = UPPER(TRIM(NEW.Annotation))
    WHERE BookID = NEW.BookID ;
  END;--
CREATE TRIGGER [TRBooks_AU] AFTER UPDATE ON [Books]
  BEGIN
    UPDATE Books
    SET SearchTitle = UPPER(TRIM(NEW.Title)),
        SearchLang = UPPER(TRIM(NEW.Lang)),
        SearchFolder = UPPER(TRIM(NEW.Folder)),
        SearchFileName = UPPER(TRIM(NEW.FileName)),
        SearchExt = UPPER(TRIM(NEW.Ext)),
        SearchKeyWords = UPPER(TRIM(NEW.KeyWords)),
        SearchAnnotation = UPPER(TRIM(NEW.Annotation))
    WHERE BookID = NEW.BookID ;
  END;--
CREATE TRIGGER [TRBooks_BD] BEFORE DELETE ON [Books]
  BEGIN
    DELETE FROM Genre_List WHERE BookID = OLD.BookID;
    DELETE FROM Author_List WHERE BookID = OLD.BookID;
    DELETE FROM Series WHERE SeriesID IN (SELECT b.SeriesID FROM Books b WHERE  b.SeriesID = OLD.SeriesID GROUP BY b.SeriesID HAVING COUNT(b.SeriesID) <= 1);
    DELETE FROM Authors WHERE NOT AuthorID in (SELECT DISTINCT al.AuthorID FROM Author_List al);
  END;--


DROP TABLE IF EXISTS [Genre_List];--
CREATE TABLE [Genre_List] (
  [GenreCode] VARCHAR(20) NOT NULL,
  [BookID] INTEGER NOT NULL,
  CONSTRAINT "PKGenreList" PRIMARY KEY ([BookID], [GenreCode])
);--
CREATE INDEX [IXGenreList_BookID] ON [Genre_List] ([BookID]);--

DROP TABLE IF EXISTS [Author_List];--
CREATE TABLE [Author_List] (
  [AuthorID] INTEGER NOT NULL,
  [BookID] INTEGER NOT NULL,
  CONSTRAINT "PKAuthorList" PRIMARY KEY ([BookID], [AuthorID])
);--
CREATE INDEX [IXAuthorList_AuthorID_BookID] ON [Author_List] ([AuthorID], [BookID]);--


