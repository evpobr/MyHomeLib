-------------------------------------------------------------------------------
--
-- MyHomeLib
--
-- Copyright (C) 2008-2010 Aleksey Penkov
--
-- Author(s)           eg
--                     Nick Rymanov    nrymanov@gmail.com
-- Created             04.09.2010
-- Description
--
-- Id: unit_Database_SQLite.pas 764 2010-09-15 14:01:35Z eg_ $
--
-- History
--
-------------------------------------------------------------------------------

DROP TABLE IF EXISTS Bases
--@@

DROP TABLE IF EXISTS Groups
--@@

DROP TABLE IF EXISTS Books
--@@

DROP TABLE IF EXISTS BookGroups
--@@

CREATE TABLE Bases (
  ID               INTEGER      NOT NULL                        PRIMARY KEY AUTOINCREMENT,
  BaseName         VARCHAR(64)  NOT NULL  COLLATE SYSTEM_NOCASE UNIQUE,
  RootFolder       VARCHAR(128) NOT NULL  COLLATE SYSTEM_NOCASE,
  DBFileName       VARCHAR(128) NOT NULL  COLLATE SYSTEM_NOCASE,
  Notes            VARCHAR(255)           COLLATE SYSTEM_NOCASE,
  CreationDate     VARCHAR(23)  NOT NULL,
  Version          INTEGER,
  Code             INTEGER,
  AllowDelete      INTEGER      NOT NULL,
  Settings         BLOB,
  Icon             BLOB,
  URL              VARCHAR(255)           COLLATE SYSTEM_NOCASE,
  LibUser          VARCHAR(50)            COLLATE SYSTEM_NOCASE,
  LibPassword      VARCHAR(50)            COLLATE SYSTEM_NOCASE,
  ConnectionScript BLOB
)
--@@

CREATE TABLE Groups (
  GroupID     INTEGER      NOT NULL                       PRIMARY KEY AUTOINCREMENT,
  GroupName   VARCHAR(255) NOT NULL COLLATE SYSTEM_NOCASE UNIQUE,
  AllowDelete INTEGER      NOT NULL,
  Notes       BLOB,
  Icon        BLOB
)
--@@

CREATE TABLE Books (
  BookID     INTEGER      NOT NULL,
  DatabaseID INTEGER      NOT NULL,
  LibID      INTEGER      NOT NULL,
  Title      VARCHAR(150) NOT NULL  COLLATE SYSTEM_NOCASE,
  SeriesID   INTEGER,
  SeqNumber  INTEGER,
  UpdateDate VARCHAR(23)  NOT NULL,
  LibRate    INTEGER      NOT NULL,
  Lang       VARCHAR(2)             COLLATE SYSTEM_NOCASE,
  Folder     VARCHAR(255)           COLLATE SYSTEM_NOCASE,
  FileName   VARCHAR(255) NOT NULL  COLLATE SYSTEM_NOCASE,
  InsideNo   INTEGER      NOT NULL,
  Ext        VARCHAR(10)            COLLATE SYSTEM_NOCASE,
  BookSize   INTEGER,
  Code       INTEGER      NOT NULL,
  IsLocal    INTEGER      NOT NULL,
  IsDeleted  INTEGER      NOT NULL,
  KeyWords   VARCHAR(255)           COLLATE SYSTEM_NOCASE,
  Rate       INTEGER      NOT NULL,
  Progress   INTEGER      NOT NULL,
  Annotation BLOB,
  Review     BLOB,
  ExtraInfo  BLOB,
  PRIMARY KEY (BookID, DatabaseID)
)
--@@

CREATE INDEX IXBooks_FileName ON Books (FileName)
--@@

CREATE TABLE BookGroups (
  BookID     INTEGER NOT NULL,
  DatabaseID INTEGER NOT NULL,
  GroupID    INTEGER NOT NULL,
  PRIMARY KEY (GroupID, BookID, DatabaseID)
)
--@@

CREATE INDEX IXBookGroups_BookID_DatabaseID ON BookGroups (DatabaseID, BookID)
--@@

