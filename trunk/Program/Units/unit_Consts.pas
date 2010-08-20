(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  * Created             12.02.2010
  * Description         Глобальные константы
  *
  * $Id$
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_Consts;

interface

resourcestring
  rstrNoTitle = 'Без названия';
  rstrUnknownAuthor = 'Неизвестный';

const
  CR = #13;
  LF = #10;
  CRLF = CR + LF;

  MHL_INVALID_ID = -1;

  INPX_FIELD_DELIMITER = Chr(4);
  INPX_ITEM_DELIMITER = ':';
  INPX_SUBITEM_DELIMITER = ',';

  COLLECTION_EXTENSION_SHORT = 'hlc';
  COLLECTION_EXTENSION = '.' + COLLECTION_EXTENSION_SHORT;          // .hlc

  FB2_EXTENSION_SHORT = 'fb2';
  FB2_EXTENSION = '.' + FB2_EXTENSION_SHORT;                        // .fb2

  ZIP_EXTENSION_SHORT = 'zip';
  ZIP_EXTENSION = '.' + ZIP_EXTENSION_SHORT;                        // .zip

  FBD_EXTENSION_SHORT = 'fbd';
  FBD_EXTENSION = '.' + FBD_EXTENSION_SHORT;                        // .fbd

  FB2ZIP_EXTENSION = FB2_EXTENSION + ZIP_EXTENSION;                 // .fb2.zip

  UNKNOWN_GENRE_CODE = '0.0';

  //
  // Некоторые пути
  //
  DATA_DIR_NAME = 'Data';
  PRESET_DIR_NAME = 'Presets';

  //
  // Предефайненные имена файлов
  //
  SETTINGS_FILE_NAME = 'myhomelib.ini';
  SYSTEM_DATABASE_FILENAME = 'user.dbs';
  GENRES_FB2_FILENAME = 'genres_fb2.glst';
  GENRES_NONFB2_FILENAME = 'genres_nonfb2.glst';
  SERVER_ERRORLOG_FILENAME = 'server_error.html';
  IMPORT_ERRORLOG_FILENAME = 'import_errors.log';
  APP_HELP_FILENAME = 'MyHomeLib.chm';
  // FILELIST_FILENAME = 'FileList.lst';
  LIBRUSEC_UPDATE_FILENAME = 'librusec_update.zip';
  // EXTRA_UPDATE_FILENAME = 'extra_update.zip';
  LIBRUSEC_UPDATEVERINFO_FILENAME = 'last_collection.info';
  EXTRA_UPDATEVERINFO_FILENAME = 'extra_collection.info';
  VERINFO_FILENAME = 'version.info';
  STRUCTUREINFO_FILENAME = 'structure.info';
  PROGRAM_VERINFO_FILENAME = 'last_version.info';
  LIBRUSEC_INPX_FILENAME = 'librusec.inpx';
  COLLECTION_VERINFO_FILENAME = 'version.info';
  COLUMNS_STORE_FILENAME = 'columns.ini';
  DOWNLOADS_STORE_FILENAME = 'downloads.sav';
  DOWNLOAD_ERRORLOG_FILENAME = 'download_errors.log';
  COLLECTIONS_FILENAME = 'collections.ini';
  PRESETS_FILENAME = 'presets.cxml';

  //
  // Значения полей по умолчанию
  //
  NO_ACTIVECOLLECTION_ID = MHL_INVALID_ID;
  UNVERSIONED_COLLECTION = MHL_INVALID_ID;

  NO_SERIE_ID = 1;
  NO_SERIES_TITLE = '---';

  FAVORITES_GROUP_ID = 1;

  //
  // Номера вкладок в главном окне ( = tags)
  //
  PAGE_AUTHORS = 0;     // авторы
  PAGE_SERIES = 1;      // серии
  PAGE_GENRES = 2;      // жанры
  PAGE_SEARCH = 3;      // поиск
  PAGE_FAVORITES = 4;   // группы
  /// REMOVE PAGE_FILTER = 5;      // фильтр
  PAGE_DOWNLOAD = 6;    // фильтр

  PAGE_ALL = 99;        // все вкладки

  //
  // Теги колонок
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
  COL_LANG       = 21;
  COL_LIBRATE    = 22;

  COL_STATE = 99;

  ColumnTags: array [0 .. 12] of Integer = (
    COL_AUTHOR,
    COL_TITLE,
    COL_SERIES,
    COL_NO,
    COL_GENRE,
    COL_SIZE,
    COL_RATE,
    COL_DATE,
    COL_TYPE,
    COL_COLLECTION,
    COL_LANG,
    COL_LIBRATE,
    COL_STATE
  );

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

  //
  // Поля поиска
  //
  SF_AUTHORS = 'Authors';
  SF_TITLE = 'Title';
  SF_SERIE = 'Serie';
  SF_GENRE_TITLE = 'Genres';
  SF_GENRE_CODES = 'GenreCodes';
  SF_ANNOTATION = 'Annotation';

  SF_FILE = 'File';
  SF_FOLDER = 'Folder';
  SF_EXTENSION = 'Extension';

  SF_DOWNLOADED = 'Downloaded';
  SF_KEYWORDS = 'Keywords';
  SF_DELETED = 'Deleted';
  SF_DATE = 'Date';
  SF_LANG = 'Lang';

  //
  // некоторые ограничения  для БД
  //
  MAXFOLDERLENGTH = 200; // максимальная длина поля folder/ все что больше - обрезается
  INDEXSIZE = 12;        // размер индексных полей

  //
  // Некоторые (чаще всего используемые) имена полей
  //
  ID_FIELD = 'ID';
  BASE_NAME_FIELD = 'BaseName';

  BOOK_ID_FIELD = 'BookID';
  BOOK_LIBID_FIELD = 'LibID';
  BOOK_FOLDER_FIELD = 'Folder';
  BOOK_FILENAME_FIELD = 'FileName';
  BOOK_TITLE_FIELD = 'Title';
  BOOK_ANNOTATION_FIELD = 'Annotation';
  BOOK_REVIEW_FIELD = 'Review';
  BOOK_RATE_FIELD = 'Rate';
  BOOK_PROGRESS_FIELD = 'Progress';

  BOOK_SEQNUMBER_FIELD = 'SeqNumber';
  BOOK_DATE_FIELD = 'Date';
  BOOK_LIBRATE_FIELD = 'LibRate';
  BOOK_LANG_FIELD = 'Lang';
  BOOK_INSIDENO_FIELD = 'InsideNo';
  BOOK_EXT_FIELD = 'Ext';
  BOOK_SIZE_FIELD = 'Size';
  BOOK_CODE_FIELD = 'Code';
  BOOK_LOCAL_FIELD = 'Local';
  BOOK_DELETED_FIELD = 'Deleted';
  BOOK_KEYWORDS_FIELD = 'KeyWords';
  BOOK_EXTRAINFO_FIELD = 'ExtraInfo';

  DB_ID_FIELD = 'DatabaseID';

  SERIE_ID_FIELD = 'SerieID';
  SERIE_TITLE_FIELD = 'SerieTitle';

  GENRE_CODE_FIELD = 'GenreCode';
  GENRE_PARENTCODE_FIELD = 'ParentCode';
  GENRE_FB2CODE_FIELD = 'FB2Code';
  GENRE_ALIAS_FIELD = 'GenreAlias';

  GROUP_ID_FIELD = 'GroupID';
  GROUP_NAME_FIELD = 'GroupName';

  AUTHOR_ID_FIELD = 'AuthorID';
  AUTHOR_LASTTNAME_FIELD = 'LastName';
  AUTHOR_FIRSTNAME_FIELD = 'FirstName';
  AUTHOR_MIDDLENAME_FIELD = 'MiddleName';

  //
  // индексные поля
  //
  AUTHOR_FULLNAME_FIELDS = AUTHOR_LASTTNAME_FIELD + ';' + AUTHOR_FIRSTNAME_FIELD + ';' + AUTHOR_MIDDLENAME_FIELD;
  AUTHOR_ID_BOOK_ID_FIELDS = AUTHOR_ID_FIELD + ';' + BOOK_ID_FIELD;

  SERIE_ID_SEQNUMBER_FIELDS = SERIE_ID_FIELD + ';' + BOOK_SEQNUMBER_FIELD;

  GENRE_PARENTCODE_CODE_FIELDS = GENRE_PARENTCODE_FIELD + ';' + GENRE_CODE_FIELD;
  GENRE_CODE_BOOK_ID_FIELDS = GENRE_CODE_FIELD + ';' + BOOK_ID_FIELD;

  BOOK_ID_DB_ID_FIELDS = BOOK_ID_FIELD + ';' + DB_ID_FIELD;
  GROUP_ID_BOOK_ID_DB_ID_FIELDS = GROUP_ID_FIELD + ';' + BOOK_ID_FIELD + ';' + DB_ID_FIELD;

  PX_INDEX = 'PXIndex';

  //
  // специальные значения фильтров
  //
  ALPHA_FILTER_ALL = '*';
  ALPHA_FILTER_NON_ALPHA = '#';

type
  TColumnSet = set of 0 .. 255;

implementation

end.
