
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}

unit unit_MHL_xml;

interface

uses
  xmldom,
  XMLDoc,
  XMLIntf,
  unit_Interfaces;

type

{ Forward Decls }

  TXMLCollection = class;
  TXMLInfo = class;
  TXMLBookList = class;
  TXMLBook = class;
  TXMLGenreList = class;
  TXMLGenre = class;
  TXMLFile_ = class;
  TXMLAuthorList = class;
  TXMLAuthor = class;

{ TXMLCollection }

  TXMLCollection = class(TXMLNode, IXMLCollection)
  private
    FBooks:IXMLBookList;
  protected
    { IXMLCollection }
    function Get_Info: IXMLInfo;
    function Get_BookList: IXMLBookList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfo }

  TXMLInfo = class(TXMLNode, IXMLInfo)
  protected
    { IXMLInfo }
    function Get_Name: WideString;
    function Get_Code: LongWord;
    function Get_Type_: LongWord;
    function Get_Comment: WideString;
    procedure Set_Name(Value: WideString);
    procedure Set_Code(Value: LongWord);
    procedure Set_Type_(Value: LongWord);
    procedure Set_Comment(Value: WideString);
  end;

{ TXMLBookList }

  TXMLBookList = class(TXMLNodeCollection, IXMLBookList)
  protected
    { IXMLBookList }
    function Add: IXMLBook;
    function Insert(const Index: Integer): IXMLBook;
    function Get_Item(Index: Integer): IXMLBook;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLBook }

  TXMLBook = class(TXMLNode, IXMLBook)
  private
    FGenres:IXMLGenreList;
    FAuthors:IXMLAuthorList;
  protected
    { IXMLBook }
    function Get_Date: WideString;
    function Get_Title: WideString;
    function Get_Series: WideString;
    function Get_No: LongWord;
    function Get_Rate: LongWord;
    function Get_GenreList: IXMLGenreList;
    function Get_File_: IXMLFile_;
    function Get_AuthorList: IXMLAuthorList;
    procedure Set_Title(Value: WideString);
    procedure Set_Series(Value: WideString);
    procedure Set_No(Value: LongWord);
    procedure Set_Rate(Value: LongWord);
    procedure Set_Date(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLGenreList }

  TXMLGenreList = class(TXMLNodeCollection, IXMLGenreList)
  protected
    { IXMLGenreList }
    function Add: IXMLGenre;
    function Insert(const Index: Integer): IXMLGenre;
    function Get_Item(Index: Integer): IXMLGenre;
  end;

{ TXMLGenre }

  TXMLGenre = class(TXMLNode, IXMLGenre)
  protected
    { IXMLGenre }
    function Get_Alias: WideString;
    function Get_MHL_Code: WideString;
    function Get_Fb2_Code: WideString;
    procedure Set_Alias(Value: WideString);
    procedure Set_MHL_Code(Value: WideString);
    procedure Set_Fb2_Code(Value: WideString);
  end;

{ TXMLFile_ }

  TXMLFile_ = class(TXMLNode, IXMLFile_)
  protected
    { IXMLFile_ }
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
  end;

{ TXMLAuthorList }

  TXMLAuthorList = class(TXMLNodeCollection, IXMLAuthorList)
  protected
    { IXMLAuthorList }
    function Add: IXMLAuthor;
    function Insert(const Index: Integer): IXMLAuthor;
    function Get_Item(Index: Integer): IXMLAuthor;
  end;

{ TXMLAuthor }

  TXMLAuthor = class(TXMLNode, IXMLAuthor)
  protected
    { IXMLAuthor }
    function Get_Name: WideString;
    function Get_Family: WideString;
    function Get_Middle: WideString;
    procedure Set_Name(Value: WideString);
    procedure Set_Family(Value: WideString);
    procedure Set_Middle(Value: WideString);
  end;

{ Global Functions }

function GetCollection(Doc: IXMLDocument): IXMLCollection;
function LoadCollection(const FileName: WideString): IXMLCollection;
function NewCollection: IXMLCollection;

const
  TargetNamespace = 'http://home-lib.net/xml/myhomelib/1.0';

implementation

uses Variants, SysUtils;
{ Global Functions }

function GetCollection(Doc: IXMLDocument): IXMLCollection;
begin
  Result := Doc.GetDocBinding('Collection', TXMLCollection, TargetNamespace) as IXMLCollection;
end;

function LoadCollection(const FileName: WideString): IXMLCollection;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Collection', TXMLCollection, TargetNamespace) as IXMLCollection;
end;

function NewCollection: IXMLCollection;
begin
  Result := NewXMLDocument.GetDocBinding('Collection', TXMLCollection, TargetNamespace) as IXMLCollection;
end;

{ TXMLCollection }

procedure TXMLCollection.AfterConstruction;
begin
  RegisterChildNode('Info', TXMLInfo);
  RegisterChildNode('Book', TXMLBook);
  FBooks:= CreateCollection(TXMLBookList, IXMLBook, 'Book') as IXMLBookList;
  inherited;
end;

function TXMLCollection.Get_Info: IXMLInfo;
begin
  Result := ChildNodes['Info'] as IXMLInfo;
end;

function TXMLCollection.Get_BookList: IXMLBookList;
begin
  Result := FBooks;
end;

{ TXMLInfo }

function TXMLInfo.Get_Name: WideString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLInfo.Set_Name(Value: WideString);
begin
  SetAttribute('Name', Value);
end;

function TXMLInfo.Get_Code: LongWord;
begin
  Result := AttributeNodes['Code'].NodeValue;
end;

procedure TXMLInfo.Set_Code(Value: LongWord);
begin
  SetAttribute('Code', Value);
end;

function TXMLInfo.Get_Type_: LongWord;
begin
  Result := AttributeNodes['Type'].NodeValue;
end;

procedure TXMLInfo.Set_Type_(Value: LongWord);
begin
  SetAttribute('Type', Value);
end;

function TXMLInfo.Get_Comment: WideString;
begin
  Result := AttributeNodes['Comment'].Text;
end;

procedure TXMLInfo.Set_Comment(Value: WideString);
begin
  SetAttribute('Comment', Value);
end;

{ TXMLBookList }

function TXMLBookList.Add: IXMLBook;
begin
   Result:=AddItem(-1) as IXMLBook;
end;

procedure TXMLBookList.AfterConstruction;
begin
  RegisterChildNode('Book', TXMLBook);
  inherited;
end;

function TXMLBookList.Get_Item(Index: Integer): IXMLBook;
begin
  if List.Count>0 then Result:=List[Index] as IXMLBook;
end;

function TXMLBookList.Insert(const Index: Integer): IXMLBook;
begin
   Result:=AddItem(Index) as IXMLBook;
end;

{ TXMLBook }

procedure TXMLBook.AfterConstruction;
begin
  RegisterChildNode('Genre', TXMLGenre);
  RegisterChildNode('File', TXMLFile_);
  RegisterChildNode('Author', TXMLAuthor);
  FGenres:= CreateCollection(TXMLGenreList, IXMLGenre, 'Genre') as IXMLGenreList;
  FAuthors:= CreateCollection(TXMLAuthorList, IXMLAuthor, 'Author') as IXMLAuthorList;
  inherited;
end;

function TXMLBook.Get_Title: WideString;
begin
  Result := AttributeNodes['Title'].Text;
end;

procedure TXMLBook.Set_Title(Value: WideString);
begin
  SetAttribute('Title', Value);
end;

function TXMLBook.Get_Series: WideString;
begin
  Result := AttributeNodes['Series'].Text;
end;

procedure TXMLBook.Set_Series(Value: WideString);
begin
  SetAttribute('Series', Value);
end;

function TXMLBook.Get_No: LongWord;
begin
  Result := AttributeNodes['No'].NodeValue;
end;

procedure TXMLBook.Set_Date(Value: WideString);
begin
  SetAttribute('Date', Value);
end;

procedure TXMLBook.Set_No(Value: LongWord);
begin
  SetAttribute('No', Value);
end;

function TXMLBook.Get_Rate: LongWord;
begin
  Result := AttributeNodes['Rate'].NodeValue;
end;

procedure TXMLBook.Set_Rate(Value: LongWord);
begin
  SetAttribute('Rate', Value);
end;

function TXMLBook.Get_GenreList: IXMLGenreList;
begin
  Result := FGenres;
end;

function TXMLBook.Get_File_: IXMLFile_;
begin
  Result := ChildNodes['File'] as IXMLFile_;
end;

function TXMLBook.Get_AuthorList: IXMLAuthorList;
begin
  Result := FAuthors;
end;

function TXMLBook.Get_Date: WideString;
var
  basicType : Integer;
begin
  basicType := VarType(AttributeNodes['Date'].NodeValue) and VarTypeMask;

  if  basicType <> varNull then
    Result := AttributeNodes['Date'].NodeValue
  else
    Result := DateToStr(Now);
end;

{ TXMLGenreList }

function TXMLGenreList.Add: IXMLGenre;
begin
  Result:=AddItem(-1) as IXMLGenre;
end;

function TXMLGenreList.Get_Item(Index: Integer): IXMLGenre;
begin
  if List.Count>0 then Result:=List[Index] as IXMLGenre;
end;

function TXMLGenreList.Insert(const Index: Integer): IXMLGenre;
begin
  Result:=AddItem(Index) as IXMLGenre;
end;

{ TXMLGenre }

function TXMLGenre.Get_Alias: WideString;
begin
  Result := AttributeNodes['Alias'].Text;
end;

procedure TXMLGenre.Set_Alias(Value: WideString);
begin
  SetAttribute('Alias', Value);
end;

function TXMLGenre.Get_MHL_Code: WideString;
begin
  Result := AttributeNodes['MHL_Code'].Text;
end;

procedure TXMLGenre.Set_MHL_Code(Value: WideString);
begin
  SetAttribute('MHL_Code', Value);
end;

function TXMLGenre.Get_Fb2_Code: WideString;
begin
  Result := AttributeNodes['fb2_Code'].Text;
end;

procedure TXMLGenre.Set_Fb2_Code(Value: WideString);
begin
  SetAttribute('fb2_Code', Value);
end;

{ TXMLFile_ }

function TXMLFile_.Get_Folder: WideString;
begin
  Result := AttributeNodes['Folder'].Text;
end;

procedure TXMLFile_.Set_Folder(Value: WideString);
begin
  SetAttribute('Folder', Value);
end;

function TXMLFile_.Get_Name: WideString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLFile_.Set_Name(Value: WideString);
begin
  SetAttribute('Name', Value);
end;

function TXMLFile_.Get_Ext: WideString;
begin
  Result := AttributeNodes['Ext'].Text;
end;

procedure TXMLFile_.Set_Ext(Value: WideString);
begin
  SetAttribute('Ext', Value);
end;

function TXMLFile_.Get_Size: LongWord;
begin
  Result := AttributeNodes['Size'].NodeValue;
end;

procedure TXMLFile_.Set_Size(Value: LongWord);
begin
  SetAttribute('Size', Value);
end;

function TXMLFile_.Get_Inside_no: LongWord;
begin
  Result := AttributeNodes['Inside_no'].NodeValue;
end;

procedure TXMLFile_.Set_Inside_no(Value: LongWord);
begin
  SetAttribute('Inside_no', Value);
end;

{ TXMLAuthorList }

function TXMLAuthorList.Add: IXMLAuthor;
begin
  Result:=AddItem(-1) as IXMLAuthor;
end;

function TXMLAuthorList.Get_Item(Index: Integer): IXMLAuthor;
begin
  if List.Count>0 then Result:=List[Index] as IXMLAuthor;
end;

function TXMLAuthorList.Insert(const Index: Integer): IXMLAuthor;
begin
  Result:=AddItem(Index) as IXMLAuthor;
end;

{ TXMLAuthor }

function TXMLAuthor.Get_Name: WideString;
begin
  Result := AttributeNodes['Name'].Text;
end;

procedure TXMLAuthor.Set_Name(Value: WideString);
begin
  SetAttribute('Name', Value);
end;

function TXMLAuthor.Get_Family: WideString;
begin
  Result := AttributeNodes['Family'].Text;
end;

procedure TXMLAuthor.Set_Family(Value: WideString);
begin
  SetAttribute('Family', Value);
end;

function TXMLAuthor.Get_Middle: WideString;
begin
  Result := AttributeNodes['Middle'].Text;
end;

procedure TXMLAuthor.Set_Middle(Value: WideString);
begin
  SetAttribute('Middle', Value);
end;

end.