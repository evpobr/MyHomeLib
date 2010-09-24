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

  INVALID_COLLECTION_ID  = MHL_INVALID_ID;
  NO_ACTIVECOLLECTION_ID = MHL_INVALID_ID;
  NO_SERIES_ID           = MHL_INVALID_ID;

  //
  // Значения полей по умолчанию
  //
  UNVERSIONED_COLLECTION = MHL_INVALID_ID;
  NO_SERIES_TITLE = '';
  FAVORITES_GROUP_ID = 1;
  UNKNOWN_GENRE_CODE = '0.0';

  //
  // Разделители полей в INPX
  //
  INPX_FIELD_DELIMITER   = Chr(4);
  INPX_ITEM_DELIMITER    = ':';
  INPX_SUBITEM_DELIMITER = ',';

  //
  // Наиболее часто используемые расширения файлов
  //
  COLLECTION_EXTENSION_SHORT = 'hlc';
  COLLECTION_EXTENSION       = '.' + COLLECTION_EXTENSION_SHORT; // .hlc

  FB2_EXTENSION_SHORT        = 'fb2';
  FB2_EXTENSION              = '.' + FB2_EXTENSION_SHORT;        // .fb2

  ZIP_EXTENSION_SHORT        = 'zip';
  ZIP_EXTENSION              = '.' + ZIP_EXTENSION_SHORT;        // .zip

  FBD_EXTENSION_SHORT        = 'fbd';
  FBD_EXTENSION              = '.' + FBD_EXTENSION_SHORT;        // .fbd

  FB2ZIP_EXTENSION           = FB2_EXTENSION + ZIP_EXTENSION;    // .fb2.zip

  //
  // Алфавиты
  //
  ENGLISH_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  RUSSIAN_ALPHABET = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЭЮЯ';

  ENGLISH_ALPHABET_SEPARATORS = '"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"';
  // As UPPER() in SQL doesn't always convert correctly, need alphabet to include lower case letters as well
  RUSSIAN_ALPHABET_SEPARATORS = '"А","Б","В","Г","Д","Е","Ё","Ж","З","И","Й","К","Л","М","Н","О","П","Р","С","Т","У","Ф","Х","Ц","Ч","Ш","Щ","Э","Ю","Я"'; //,"а","б","в","г","д","е","ё","ж","з","и","й","к","л","м","н","о","п","р","с","т","у","ф","х","ц","ч","ш","щ","э","ю","я"';

  //
  // Некоторые пути
  //
  DATA_DIR_NAME   = 'Data';

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
  LIBRUSEC_UPDATE_FILENAME = 'librusec_update.zip';
  // EXTRA_UPDATE_FILENAME = 'extra_update.zip';
  LIBRUSEC_UPDATEVERINFO_FILENAME = 'last_collection.info';
  EXTRA_UPDATEVERINFO_FILENAME = 'extra_collection.info';
  VERINFO_FILENAME = 'version.info';
  STRUCTUREINFO_FILENAME = 'structure.info';
  PROGRAM_VERINFO_FILENAME = 'last_version.info';
  LIBRUSEC_INPX_FILENAME = 'librusec.inpx';
  COLUMNS_STORE_FILENAME = 'columns.ini';
  DOWNLOADS_STORE_FILENAME = 'downloads.sav';
  DOWNLOAD_ERRORLOG_FILENAME = 'download_errors.log';
  COLLECTIONS_FILENAME = 'collections.ini';
  PRESETS_FILENAME = 'presets.cxml';

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
  SF_AUTHORS     = 'Authors';
  SF_TITLE       = 'Title';
  SF_SERIES      = 'Series';
  SF_GENRE_TITLE = 'Genres';
  SF_GENRE_CODES = 'GenreCodes';
  SF_ANNOTATION  = 'Annotation';

  SF_FILE        = 'File';
  SF_FOLDER      = 'Folder';
  SF_EXTENSION   = 'Extension';

  SF_DOWNLOADED  = 'Downloaded';
  SF_KEYWORDS    = 'Keywords';
  SF_DELETED     = 'Deleted';
  SF_DATE        = 'Date';
  SF_LANG        = 'Lang';

  //
  // Индексы свойств коллекции
  //
  SETTING_SCHEMA_VERSION  = 0;
  SETTING_CREATION_DATE   = 1;
  SETTING_NOTES           = 2;
  SETTING_DATA_VERSION    = 3;
  SETTING_CODE            = 4;
  SETTING_URL             = 6;
  SETTING_DOWNLOAD_SCRIPT = 7;
  SETTING_POSITIONS       = 8;

  //
  // специальные значения фильтров
  //
  ALPHA_FILTER_ALL       = '*';
  ALPHA_FILTER_NON_ALPHA = '#';

type
  TColumnSet = set of 0 .. 255;

implementation

end.
