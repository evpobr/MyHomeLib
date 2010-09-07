DROP TABLE IF EXISTS [Settings];
CREATE TABLE [Settings] (
  [ID] INTEGER NOT NULL PRIMARY KEY,
  [SettingValue] BLOB
);

DROP TABLE IF EXISTS [Series];
CREATE TABLE [Series] (
  [SeriesID] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  [SeriesTitle] VARCHAR(80) NOT NULL COLLATE SYSTEM_NOCASE
);
CREATE INDEX [IXSeries_Title] ON [Series] ([SeriesTitle]);

DROP TABLE IF EXISTS [Genres];
CREATE TABLE [Genres] (
  [GenreCode] VARCHAR(20) NOT NULL PRIMARY KEY COLLATE NOCASE,
  [ParentCode] VARCHAR(20) COLLATE NOCASE,
  [FB2Code] VARCHAR(20) COLLATE NOCASE,
  [GenreAlias] VARCHAR(50) NOT NULL SYSTEM_NOCASE
);
CREATE UNIQUE INDEX [IXGenres_ParentCode_GenreCode] ON [Genres] ([ParentCode], [GenreCode]);
CREATE INDEX [IXGenres_FB2Code] ON [Genres] ([FB2Code]);
CREATE INDEX [IXGenres_GenreAlias] ON [Genres] ([GenreAlias]);

DROP TABLE IF EXISTS [Authors];
CREATE TABLE [Authors] (
  [AuthorID] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  [LastName] VARCHAR(128) NOT NULL COLLATE SYSTEM_NOCASE,
  [FirstName] VARCHAR(128) COLLATE SYSTEM_NOCASE,
  [MiddleName] VARCHAR(128) COLLATE SYSTEM_NOCASE
);
CREATE INDEX [IXAuthors_FullName] ON [Authors] ([LastName], [FirstName], [MiddleName]);

DROP TABLE IF EXISTS [Books];
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
  [Annotation] BLOB,
  [Review] BLOB
);
CREATE INDEX [IXBooks_SeriesID_SeqNumber] ON [Books] ([SeriesID], [SeqNumber]);
CREATE INDEX [IXBooks_Title] ON [Books] ([Title]);
CREATE INDEX [IXBooks_FileName] ON [Books] ([FileName]);
CREATE INDEX [IXBooks_Folder] ON [Books] ([Folder]);
CREATE INDEX [IXBooks_IsDeleted] ON [Books] ([IsDeleted]);
CREATE INDEX [IXBooks_UpdateDate] ON [Books] ([UpdateDate]);
CREATE INDEX [IXBooks_IsLocal] ON [Books] ([IsLocal]);
CREATE INDEX [IXBooks_LibID] ON [Books] ([LibID]);
CREATE INDEX [IXBooks_KeyWords] ON [Books] ([KeyWords]);

DROP TABLE IF EXISTS [Genre_List];
CREATE TABLE [Genre_List] (
  [GenreCode] VARCHAR(20) NOT NULL,
  [BookID] INTEGER NOT NULL,
  CONSTRAINT "PKGenreList" PRIMARY KEY ([BookID], [GenreCode])
);
CREATE INDEX [IXGenreList_BookID] ON [Genre_List] ([BookID]);

DROP TABLE IF EXISTS [Author_List];
CREATE TABLE [Author_List] (
  [AuthorID] INTEGER NOT NULL,
  [BookID] INTEGER NOT NULL,
  CONSTRAINT "PKAuthorList" PRIMARY KEY ([BookID], [AuthorID])
);
CREATE INDEX [IXAuthorList_BookID] ON [Author_List] ([BookID]);


