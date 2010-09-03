unit unit_Interfaces;

interface

uses
  xmldom,
  XMLDoc,
  XMLIntf,
  unit_Globals;

type
  IIterator<T> = interface
    function Next(out v: T): Boolean;
    function GetNumRecords: Integer;
  end;

  IBookIterator = IIterator<TBookRecord>;
  IAuthorIterator = IIterator<TAuthorData>;
  IGenreIterator = IIterator<TGenreData>;
  ISeriesIterator = IIterator<TSeriesData>;
  IGroupIterator = IIterator<TGroupData>;

  ILogger = interface
    procedure Log(const logMessage: string; const extraInfo: string);
  end;

  IIntervalLogger = interface(ILogger)
  end;

  IParamsParser<T> = interface
    function CheckLiteral(const literalValue: string): Boolean;
    function CheckParam(const paramName: string): Boolean;
    function GetValue(const params: T; const paramName: string): string;
  end;

  { Forward Decls }

  IXMLCollection = interface;
  IXMLInfo = interface;
  IXMLBookList = interface;
  IXMLBook = interface;
  IXMLGenreList = interface;
  IXMLGenre = interface;
  IXMLFile_ = interface;
  IXMLAuthorList = interface;
  IXMLAuthor = interface;

  { IXMLCollection }

  IXMLCollection = interface(IXMLNode)
    ['{0922A469-C73E-4CB5-801A-4B6BFC171761}']
    { Property Accessors }
    function Get_Info: IXMLInfo;
    function Get_BookList: IXMLBookList;
    { Methods & Properties }
    property Info: IXMLInfo read Get_Info;
    property BookList: IXMLBookList read Get_BookList;
  end;

  { IXMLInfo }

  IXMLInfo = interface(IXMLNode)
    ['{ADD0877C-BEE6-4899-9CAD-46D0925BB4C6}']
    { Property Accessors }
    function Get_Name: WideString;
    function Get_Code: LongWord;
    function Get_Type_: LongWord;
    function Get_Comment: WideString;
    procedure Set_Name(Value: WideString);
    procedure Set_Code(Value: LongWord);
    procedure Set_Type_(Value: LongWord);
    procedure Set_Comment(Value: WideString);
    { Methods & Properties }
    property Name: WideString read Get_Name write Set_Name;
    property Code: LongWord read Get_Code write Set_Code;
    property Type_: LongWord read Get_Type_ write Set_Type_;
    property Comment: WideString read Get_Comment write Set_Comment;
  end;

  { IXMLBookList }

  IXMLBookList = interface(IXMLNodeCollection)
    ['{37A73CF9-4707-477D-A4EF-4255AC239156}']
    function Add: IXMLBook;
    function Insert(const Index: Integer): IXMLBook;
    function Get_Item(Index: Integer): IXMLBook;
    property Items[Index: Integer]: IXMLBook read Get_Item; default;
  end;

  { IXMLBook }

  IXMLBook = interface(IXMLNode)
    ['{3342BDAB-5C8E-4854-AA5B-1F316E3FD76B}']
    { Property Accessors }
    function Get_Date: WideString;
    function Get_Title: WideString;
    function Get_Series: WideString;
    function Get_No: LongWord;
    function Get_Rate: LongWord;
    function Get_GenreList: IXMLGenreList;
    function Get_File_: IXMLFile_;
    function Get_AuthorList: IXMLAuthorList;

    procedure Set_Date(Value: WideString);
    procedure Set_Title(Value: WideString);
    procedure Set_Series(Value: WideString);
    procedure Set_No(Value: LongWord);
    procedure Set_Rate(Value: LongWord);
    { Methods & Properties }
    property Title: WideString read Get_Title write Set_Title;
    property Series: WideString read Get_Series write Set_Series;
    property No: LongWord read Get_No write Set_No;
    property Rate: LongWord read Get_Rate write Set_Rate;
    property GenreList: IXMLGenreList read Get_GenreList;
    property File_: IXMLFile_ read Get_File_;
    property AuthorList: IXMLAuthorList read Get_AuthorList;
    property Date:WideString read Get_Date write Set_Date;
  end;

  { IXMLGenreList }

  IXMLGenreList = interface(IXMLNodeCollection)
    ['{D12BC883-FE17-4D5E-A2D0-C98A22BE6FAC}']
    { Property Accessors }
    function Get_Item(Index:integer): IXMLGenre;
    function Add:IXMLGenre;
    Function Insert(const Index: integer):IXMLGenre;
    { Methods & Properties }
    property Items[Index:integer]: IXMLGenre read Get_Item; default;
  end;

  { IXMLGenre }

  IXMLGenre = interface(IXMLNode)
    ['{1CD8364D-AECC-464D-809F-9AE56B106AEC}']
    { Property Accessors }
    function Get_Alias: WideString;
    function Get_MHL_Code: WideString;
    function Get_Fb2_Code: WideString;
    procedure Set_Alias(Value: WideString);
    procedure Set_MHL_Code(Value: WideString);
    procedure Set_Fb2_Code(Value: WideString);
    { Methods & Properties }
    property Alias: WideString read Get_Alias write Set_Alias;
    property MHL_Code: WideString read Get_MHL_Code write Set_MHL_Code;
    property Fb2_Code: WideString read Get_Fb2_Code write Set_Fb2_Code;
  end;

  { IXMLFile_ }

  IXMLFile_ = interface(IXMLNode)
    ['{A8173C10-508A-4341-A7A3-32DEEEAC09AA}']
    { Property Accessors }
    function Get_Folder: WideString;
    function Get_Name: WideString;
    function Get_Ext: WideString;
    function Get_Size: LongWord;
    function Get_Inside_no: LongWord;
    procedure Set_Folder(Value: WideString);
    procedure Set_Name(Value: WideString);
    procedure Set_Ext(Value: WideString);
    procedure Set_Size(Value: LongWord);
    procedure Set_Inside_no(Value: LongWord);
    { Methods & Properties }
    property Folder: WideString read Get_Folder write Set_Folder;
    property Name: WideString read Get_Name write Set_Name;
    property Ext: WideString read Get_Ext write Set_Ext;
    property Size: LongWord read Get_Size write Set_Size;
    property Inside_no: LongWord read Get_Inside_no write Set_Inside_no;
  end;

  { IXMLAuthorList }

  IXMLAuthorList = interface(IXMLNodeCollection)
    ['{1A75DDE5-1584-4554-A866-8EED8A47ABE8}']
    { Property Accessors }
    function Add:IXMLAuthor;
    function Insert(const Index:integer):IXMLAuthor;
    function Get_Item(Index: Integer): IXMLAuthor;
    property Items[Index:integer]: IXMLAuthor read Get_Item; default;
  end;

  { IXMLAuthor }

  IXMLAuthor = interface(IXMLNode)
    ['{241046FE-EFA7-40B7-BAB8-A4DC01242883}']
    { Property Accessors }
    function Get_Name: WideString;
    function Get_Family: WideString;
    function Get_Middle: WideString;
    procedure Set_Name(Value: WideString);
    procedure Set_Family(Value: WideString);
    procedure Set_Middle(Value: WideString);
    { Methods & Properties }
    property Name: WideString read Get_Name write Set_Name;
    property Family: WideString read Get_Family write Set_Family;
    property Middle: WideString read Get_Middle write Set_Middle;
  end;

implementation

end.
