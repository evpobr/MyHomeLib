CREATE TABLE Bases (
  ID AUTOINC NOT NULL,
  BaseName WIDECHAR(64) NOT NULL,
  RootFolder WIDECHAR(128) NOT NULL,
  DBFileName WIDECHAR(128) NOT NULL,
  Notes WIDECHAR(255),
  CreationDate DATE DEFAULT CURRENT_DATE NOT NULL,
  Version INTEGER,
  Code INTEGER,
  AllowDelete LOGICAL NOT NULL,
  Settings WIDEMEMO BLOBBlockSize 102400 BLOBCompressionAlgorithm ZLIB BLOBCompressionMode 5,
  Icon BLOB BLOBBlockSize 102400 BLOBCompressionAlgorithm NONE BLOBCompressionMode 0,
  URL WIDECHAR(255),
  LibUser WIDECHAR(50),
  LibPassword WIDECHAR(50),
  ConnectionScript WIDEMEMO BLOBBlockSize 102400 BLOBCompressionAlgorithm ZLIB BLOBCompressionMode 5,
  PRIMARY KEY ID_Index (ID),
  UNIQUE INDEX Name_Index (BaseName)
);
CREATE TABLE Groups (
  GroupID AUTOINC(INTEGER, INITIALVALUE 3) NOT NULL,
  GroupName WIDECHAR(255) NOT NULL,
  AllowDelete LOGICAL DEFAULT False NOT NULL,
  Notes MEMO BLOBBlockSize 102400 BLOBCompressionAlgorithm NONE BLOBCompressionMode 0,
  Icon BLOB BLOBBlockSize 102400 BLOBCompressionAlgorithm NONE BLOBCompressionMode 0,
  PRIMARY KEY ID_Index (GroupID),
  UNIQUE INDEX NameIndex (GroupName)
);
CREATE TABLE Books (
  BookID INTEGER NOT NULL,
  DatabaseID INTEGER NOT NULL,
  LibID INTEGER NOT NULL,
  Title WIDECHAR(150),
  SeriesID INTEGER,
  SeqNumber SMALLINT,
  UpdateDate DATE DEFAULT CURRENT_DATE NOT NULL,
  LibRate INTEGER DEFAULT 0 NOT NULL,
  Lang WIDECHAR(2),
  Folder WIDECHAR(255),
  FileName WIDECHAR(255) NOT NULL,
  InsideNo INTEGER NOT NULL,
  Ext WIDECHAR(10),
  BookSize INTEGER,
  Code SMALLINT DEFAULT 0 NOT NULL,
  IsLocal LOGICAL DEFAULT False NOT NULL,
  IsDeleted LOGICAL DEFAULT False NOT NULL,
  KeyWords WIDECHAR(255),
  Rate INTEGER DEFAULT 0 NOT NULL,
  Progress SMALLINT DEFAULT 0 NOT NULL,
  Annotation WIDEMEMO BLOBBlockSize 102400 BLOBCompressionAlgorithm ZLIB BLOBCompressionMode 5,
  Review WIDEMEMO BLOBBlockSize 102400 BLOBCompressionAlgorithm ZLIB BLOBCompressionMode 5,
  ExtraInfo BLOB BLOBBlockSize 102400 BLOBCompressionAlgorithm ZLIB BLOBCompressionMode 5,
  PRIMARY KEY ID_Index (BookID, DatabaseID),
  INDEX File_Index (FileName)
);
CREATE TABLE BookGroups (
  BookID INTEGER NOT NULL,
  DatabaseID INTEGER NOT NULL,
  GroupID INTEGER NOT NULL,
  PRIMARY KEY ID_Index (GroupID, BookID, DatabaseID),
  INDEX BookDBIndex (BookID, DatabaseID)
);
