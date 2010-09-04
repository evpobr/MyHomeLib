CREATE TABLE [Settings] (
  [ID] INTEGER NOT NULL PRIMARY KEY UNIQUE,
  [SettingValue] BLOB
);

CREATE TABLE [Series] (
  [SeriesID] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  [SeriesTitle] VARCHAR(80) NOT NULL,
  [HasLocalBooks] BOOLEAN NOT NULL DEFAULT 0,
  [HasNonDeletedBooks] BOOLEAN NOT NULL DEFAULT 0
);
CREATE INDEX [IXSeries_Title] ON [Series] ([SeriesTitle] COLLATE NOCASE ASC);

CREATE TABLE [Genres] (
  [GenreCode] VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
  [ParentCode] VARCHAR(20),
  [FB2Code] VARCHAR(20),
  [GenreAlias] VARCHAR(50) NOT NULL
);
CREATE UNIQUE INDEX [IXGenres_ParentCode_GenreCode] ON [Genres] ([ParentCode] COLLATE NOCASE ASC, [GenreCode] COLLATE NOCASE ASC);
CREATE INDEX [IXGenres_FB2Code] ON [Genres] ([FB2Code] COLLATE NOCASE ASC);
CREATE INDEX [IXGenres_GenreAlias] ON [Genres] ([GenreAlias] COLLATE NOCASE ASC);

CREATE TABLE [Authors] (
  [AuthorID] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  [LastName] VARCHAR(128) NOT NULL,
  [FirstName] VARCHAR(128),
  [MiddleName] VARCHAR(128),
  [HasLocalBooks] BOOLEAN NOT NULL DEFAULT 0,
  [HasNonDeletedBooks] BOOLEAN NOT NULL DEFAULT 0
);
CREATE INDEX [IXAuthors_LastName_FirstName_MiddleName] ON [Authors] ([LastName] COLLATE NOCASE ASC, [FirstName] COLLATE NOCASE ASC, [MiddleName] COLLATE NOCASE ASC);

CREATE TABLE [Books] (
  [BookID] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  [LibID] INTEGER NOT NULL,
  [Title] VARCHAR(150),
  [SeriesID] INTEGER,
  [SeqNumber] INTEGER,
  [UpdateDate] DATETIME NOT NULL,
  [LibRate] INTEGER NOT NULL DEFAULT 0,
  [Lang] VARCHAR(2),
  [Folder] VARCHAR(200),
  [FileName] VARCHAR(170) NOT NULL,
  [InsideNo] INTEGER NOT NULL,
  [Ext] VARCHAR(10),
  [BookSize] INTEGER,
  [Code] INTEGER NOT NULL DEFAULT 0,
  [IsLocal] BOOLEAN NOT NULL DEFAULT 0,
  [IsDeleted] BOOLEAN NOT NULL DEFAULT 0,
  [KeyWords] VARCHAR(255),
  [Rate] INTEGER NOT NULL DEFAULT 0,
  [Progress] INTEGER NOT NULL DEFAULT 0,
  [Annotation] BLOB, [Review] BLOB
);
CREATE INDEX [IXBooks_SeriesID_SeqNumber] ON [Books] ([SeriesID] ASC, [SeqNumber] ASC);
CREATE INDEX [IXBooks_Title] ON [Books] ([Title] COLLATE NOCASE ASC);
CREATE INDEX [IXBooks_FileName] ON [Books] ([FileName] COLLATE NOCASE ASC);
CREATE INDEX [IXBooks_Folder] ON [Books] ([Folder] COLLATE NOCASE ASC);
CREATE INDEX [IXBooks_IsDeleted] ON [Books] ([IsDeleted] COLLATE NOCASE ASC);
CREATE INDEX [IXBooks_UpdateDate] ON [Books] ([UpdateDate] ASC);
CREATE INDEX [IXBooks_IsLocal] ON [Books] ([IsLocal] ASC);
CREATE INDEX [IXBooks_LibID] ON [Books] ([LibID] ASC);
CREATE INDEX [IXBooks_KeyWords] ON [Books] ([KeyWords] COLLATE NOCASE ASC);

CREATE TABLE [Genre_List] (
  [GenreCode] VARCHAR(20) NOT NULL,
  [BookID] INTEGER NOT NULL,
  CONSTRAINT "PKGenreList" PRIMARY KEY ([BookID], [GenreCode])
);
CREATE INDEX [IXGenreList_BookID] ON [Genre_List] ([BookID]);

CREATE TABLE [Author_List] (
  [AuthorID] INTEGER NOT NULL,
  [BookID] INTEGER NOT NULL,
  CONSTRAINT "PKAuthorList" PRIMARY KEY ([BookID], [AuthorID])
);
CREATE INDEX [IXAuthorList_BookID] ON [Author_List] ([BookID]);


