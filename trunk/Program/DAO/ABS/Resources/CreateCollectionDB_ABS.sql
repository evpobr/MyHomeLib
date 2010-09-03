CREATE TABLE Settings (
  ID INTEGER NOT NULL,
  SettingValue WIDEMEMO BLOBBlockSize 102400 BLOBCompressionAlgorithm ZLIB BLOBCompressionMode 5,
  PRIMARY KEY PXIndex (ID)
);
CREATE TABLE Series (
  SeriesID AUTOINCINTEGER NOT NULL,
  SeriesTitle WIDESTRING(80) NOT NULL,
  HasLocalBooks LOGICAL DEFAULT False NOT NULL,
  HasNonDeletedBooks LOGICAL DEFAULT False NOT NULL,
  PRIMARY KEY ID_Index (SeriesID),
  INDEX SeriesTitleIndex (SeriesTitle NOCASE)
);
CREATE TABLE Genres (
  GenreCode WIDESTRING(20) NOT NULL,
  ParentCode WIDESTRING(20),
  FB2Code WIDESTRING(20),
  GenreAlias WIDESTRING(50) NOT NULL,
  PRIMARY KEY ID_Index (GenreCode),
  UNIQUE INDEX CodeIndex (ParentCode NOCASE, GenreCode NOCASE),
  INDEX FB2CodeIndex (FB2Code NOCASE),
  INDEX AliasIndex (GenreAlias)
);
CREATE TABLE Authors (
  AuthorID AUTOINCINTEGER NOT NULL,
  LastName WIDESTRING(128) NOT NULL,
  FirstName WIDESTRING(128),
  MiddleName WIDESTRING(128),
  HasLocalBooks LOGICAL DEFAULT False NOT NULL,
  HasNonDeletedBooks LOGICAL DEFAULT False NOT NULL,
  PRIMARY KEY ID_Index (AuthorID),
  INDEX AlphabetIndex (LastName NOCASE, FirstName NOCASE, MiddleName NOCASE)
);
CREATE TABLE Books (
  BookID AUTOINCINTEGER NOT NULL,
  LibID INTEGER NOT NULL,
  Title WIDESTRING(150),
  SeriesID INTEGER,
  SeqNumber SMALLINT,
  UpdateDate DATE DEFAULT CURRENT_DATE NOT NULL,
  LibRate INTEGER DEFAULT 0 NOT NULL,
  Lang WIDESTRING(2),
  Folder WIDESTRING(200),
  FileName WIDESTRING(170) NOT NULL,
  InsideNo INTEGER NOT NULL,
  Ext WIDESTRING(10),
  BookSize INTEGER,
  Code SMALLINT DEFAULT 0 NOT NULL,
  IsLocal LOGICAL DEFAULT False NOT NULL,
  IsDeleted LOGICAL DEFAULT False NOT NULL,
  KeyWords WIDESTRING(255),
  Rate INTEGER DEFAULT 0 NOT NULL,
  Progress INTEGER DEFAULT 0 NOT NULL,
  Annotation WIDEMEMO BLOBBlockSize 102400 BLOBCompressionAlgorithm ZLIB BLOBCompressionMode 5,
  Review WIDEMEMO BLOBBlockSize 102400 BLOBCompressionAlgorithm ZLIB BLOBCompressionMode 5,
  PRIMARY KEY ID_Index (BookID),
  INDEX Series_Index (SeriesID, SeqNumber),
  INDEX Title_Index (Title NOCASE),
  INDEX File_Index (FileName NOCASE),
  INDEX Folder_Index (Folder NOCASE),
  INDEX Deleted_Index (IsDeleted),
  INDEX Date_Index (UpdateDate),
  INDEX Local_Index (IsLocal),
  INDEX LibID_Index (LibID),
  INDEX KeyWords_Index (KeyWords NOCASE)
);
CREATE TABLE Genre_List (
  GenreCode WIDESTRING(20) NOT NULL,
  BookID INTEGER NOT NULL,
  PRIMARY KEY ID_Index (GenreCode, BookID),
  INDEX BookIndex (BookID)
);
CREATE TABLE Author_List (
  AuthorID INTEGER NOT NULL,
  BookID INTEGER NOT NULL,
  PRIMARY KEY ID_Index (AuthorID, BookID),
  INDEX BookIndex (BookID)
);

