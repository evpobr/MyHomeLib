{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit unit_Consts;

interface

const
  COLLECTION_EXTENSION_SHORT = 'hlc';
  COLLECTION_EXTENSION = '.' + COLLECTION_EXTENSION_SHORT;

  FB2_EXTENSION_SHORT = 'fb2';
  FB2_EXTENSION = '.' + FB2_EXTENSION_SHORT;

  ZIP_EXTENSION_SHORT = 'zip';
  ZIP_EXTENSION = '.' + ZIP_EXTENSION_SHORT;

  FB2ZIP_EXTENSION = FB2_EXTENSION + ZIP_EXTENSION;

  UNKNOWN_GENRE_CODE = '0.0';


  // Некоторые пути

  DATA_DIR_NAME = 'Data';

  //
  // Предефайненные имена файлов
  //
  SYSTEM_DATABASE_FILENAME = 'user.dbs';
  GENRES_FB2_FILENAME = 'genres_fb2.glst';
  GENRES_NONFB2_FILENAME = 'genres_nonfb2.glst';
  SERVER_ERRORLOG_FILENAME = 'server_error.html';
  IMPORT_ERRORLOG_FILENAME = 'import_errors.log';
  APP_HELP_FILENAME = 'MyHomeLib.chm';
  FILELIST_FILENAME = 'FileList.lst';
  LIBRUSEC_UPDATE_FILENAME = 'librusec_update.zip';
  LIBRUSEC_UPDATEVERINFO_FILENAME = 'last_collection.info';
  LIBRUSEC_VERINFO_FILENAME = 'version.info';
  PROGRAM_VERINFO_FILENAME = 'last_version.info';

  //
  // Значения полей по умолчанию
  //
  NO_ACTIVECOLLECTION_ID = -1;
  UNVERSIONED_COLLECTION = -1;

  NO_SERIES_TITLE = '---';
  BOOK_NO_TITLE = 'Без названия';
  UNKNOWN_AUTHOR_LASTNAME = 'Неизвестный';


  //
  // Номера вкладок в главном окне ( = tags)
  //
  PAGE_AUTHORS = 0;  // авторы
  PAGE_SERIES = 1;  // серии
  PAGE_GENRES = 2;  // жанры
  PAGE_SEARCH = 3; // поиск
  PAGE_FAVORITES = 4; // группы
  PAGE_FILTER = 5; // фильтр
  PAGE_DOWNLOAD = 6; // фильтр

  PAGE_ALL = 99; // все вкладки

  //
  //  Теги колонок
  //

  COL_AUTHOR     = 20;
  COL_TITLE      = 11;
  COL_SERIES     = 12;
  COL_NO         = 13;
  COL_GENRE      = 14;
  COL_SIZE       = 15;
  COL_RATE       = 16;
  COL_DATE       = 17;
  COL_TYPE       = 18;
  COL_COLLECTION = 19;

  COL_STATE = 99;

  ColumnTags : array [0 .. 10] of integer = (  COL_AUTHOR,
                                              COL_TITLE,
                                              COL_SERIES,
                                              COL_NO,
                                              COL_GENRE,
                                              COL_SIZE,
                                              COL_RATE,
                                              COL_DATE,
                                              COL_TYPE,
                                              COL_COLLECTION,
                                              COL_STATE);



  //
  // названия секций колонок в файле настрок
  //

  SECTION_A_TREE = 'COLUMNS_AUTHOR_TREE';
  SECTION_A_FLAT = 'COLUMNS_AUTHOR_FLAT';

  SECTION_S_FLAT = 'COLUMNS_SERIES_FLAT';
  SECTION_S_TREE = 'COLUMNS_SERIES_TREE';


  SECTION_G_FLAT = 'COLUMNS_GENRES_FLAT';
  SECTION_G_TREE = 'COLUMNS_GENRES_TREE';

  SECTION_F_FLAT = 'COLUMNS_FAVORITES_FLAT';
  SECTION_F_TREE = 'COLUMNS_FAVORITES_TREE';

  SECTION_SR_FLAT = 'COLUMNS_SEARCH_FLAT';
  SECTION_SR_TREE = 'COLUMNS_SEARCH_TREE';

  SECTION_FL_FLAT = 'COLUMNS_FILTER_FLAT';
  SECTION_FL_TREE = 'COLUMNS_FILTER_TREE';

type
  TColumnSet = set of 0..255;

implementation

end.

