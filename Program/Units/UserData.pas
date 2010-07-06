unit UserData;

interface

uses
  msxml,
  ComObj,
  Generics.Collections;

type
  TBookInfo = class
  private
    FNodeName: string;
    FBookID: Integer;
    FLibID: Integer;

    procedure Load(element: IXMLDOMNode);
    procedure Save(doc: IXMLDOMDocument; parentElement: IXMLDOMElement);

  protected
    constructor Create(const nodeName: string); overload;
    constructor Create(const nodeName: string; BookID: Integer; LibID: Integer); overload;
    constructor Create(const nodeName: string; element: IXMLDOMNode); overload;

    procedure SaveData(doc: IXMLDOMDocument; thisElement: IXMLDOMElement); virtual;

  public
    property BookID: Integer read FBookID write FBookID;
    property LibID: Integer read FLibID write FLibID;
  end;

  TBookExtra = class(TBookInfo)
  private
    FRating: Integer;
    FProgress: Integer;
    FReview: string;

    procedure Load(element: IXMLDOMNode);

  protected
    procedure SaveData(doc: IXMLDOMDocument; thisElement: IXMLDOMElement); override;

  public
    constructor Create(
      BookID: Integer;
      LibID: Integer;
      Rating: Integer;
      Progress: Integer;
      const Review: string
    ); overload;
    constructor Create(element: IXMLDOMNode); overload;

    property Rating: Integer read FRating write FRating;
    property Progress: Integer read FProgress write FProgress;
    property Review: string read FReview write FReview;
  end;

  TBookExtras = class(TObjectList<TBookExtra>)
  private
    procedure Load(element: IXMLDOMElement);
    procedure Save(doc: IXMLDOMDocument; parentElement: IXMLDOMElement);

  public
    procedure AddExtra(
      BookID: Integer;
      LibID: Integer;
      Rating: Integer;
      Progress: Integer;
      const Review: string
    );
  end;

  TGroupBook = class(TBookInfo)
  protected
    constructor Create(BookID: Integer; LibID: Integer); overload;
    constructor Create(element: IXMLDOMNode); overload;
  end;

  TBookGroup = class(TObjectList<TGroupBook>)
  private
    FGroupID: Integer;
    FGroupName: string;

    constructor Create(GroupID: Integer; const GroupName: string); overload;
    constructor Create(element: IXMLDOMNode); overload;

    procedure Load(element: IXMLDOMNode);
    procedure Save(doc: IXMLDOMDocument; parentElement: IXMLDOMElement);

  public
    procedure AddBook(BookID: Integer; LibID: Integer);

    property GroupID: Integer read FGroupID write FGroupID;
    property GroupName: string read FGroupName write FGroupName;
  end;

  TBookGroups = class(TObjectList<TBookGroup>)
  private
    procedure Load(element: IXMLDOMNode);
    procedure Save(doc: IXMLDOMDocument; parentElement: IXMLDOMElement);

  public
    function AddGroup(GroupID: Integer; const GroupName: string): TBookGroup;
  end;

  TUserData = class
  private
    FExtras: TBookExtras;
    FGroups: TBookGroups;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Load(const FileName: string);
    procedure Save(const FileName: string);

    property Extras: TBookExtras read FExtras;
    property Groups: TBookGroups read FGroups;
  end;

implementation

uses
  msxmldom,
  SysUtils;

{ TBookInfo }

const
  ATTRIBUTE_ID       = 'id';
  ATTRIBUTE_LIBID    = 'libid';
  ATTRIBUTE_NAME     = 'name';
  ATTRIBUTE_RATE     = 'rate';
  ATTRIBUTE_PROGRESS = 'progress';

  ELEMENT_BOOK       = 'Book';
  ELEMENT_REVIEW     = 'Review';
  ELEMENT_EXTRAS     = 'Extras';
  ELEMENT_GROUP      = 'Group';
  ELEMENT_GROUPS     = 'Groups';
  ELEMENT_USERDATA   = 'UserData';

constructor TBookInfo.Create(const nodeName: string);
begin
  inherited Create;
  FNodeName := nodeName;
end;

constructor TBookInfo.Create(const nodeName: string; BookID: Integer; LibID: Integer);
begin
  Create(nodeName);
  FBookID := BookID;
  FLibID := LibID;
end;

constructor TBookInfo.Create(const nodeName: string; element: IXMLDOMNode);
begin
  Create(nodeName);
  Load(element);
end;

procedure TBookInfo.Load(element: IXMLDOMNode);
begin
  FBookID := StrToIntDef(element.attributes.getNamedItem(ATTRIBUTE_ID).Text, 0);
  FLibID := StrToIntDef(element.attributes.getNamedItem(ATTRIBUTE_LIBID).Text, 0);
end;

procedure TBookInfo.Save(doc: IXMLDOMDocument; parentElement: IXMLDOMElement);
var
  xmlExtra: IXMLDOMElement;
begin
  xmlExtra := doc.createElement(FNodeName);
  SaveData(doc, xmlExtra);
  parentElement.appendChild(xmlExtra);
end;

procedure TBookInfo.SaveData(doc: IXMLDOMDocument; thisElement: IXMLDOMElement);
begin
  if FBookID <> 0 then
  begin
    thisElement.setAttribute(ATTRIBUTE_ID, FBookID);
  end;

  if FLibID <> 0 then
  begin
    thisElement.setAttribute(ATTRIBUTE_LIBID, FLibID);
  end;
end;

{ TBookExtra }

constructor TBookExtra.Create(element: IXMLDOMNode);
begin
  inherited Create(ELEMENT_BOOK);
  Load(element);
end;

constructor TBookExtra.Create(
  BookID: Integer;
  LibID: Integer;
  Rating: Integer;
  Progress: Integer;
  const Review: string
  );
begin
  inherited Create(ELEMENT_BOOK, BookID, LibID);
  FRating := Rating;
  FProgress := Progress;
  FReview := Review;
end;

procedure TBookExtra.Load(element: IXMLDOMNode);
var
  n: IXMLDOMNode;
begin
  inherited Load(element);

  n := element.attributes.getNamedItem(ATTRIBUTE_RATE);
  if Assigned(n) then
  begin
    FRating := StrToIntDef(n.Text, 0);
  end;

  n := element.attributes.getNamedItem(ATTRIBUTE_PROGRESS);
  if Assigned(n) then
  begin
    FProgress := StrToIntDef(n.Text, 0);
  end;

  n := element.selectSingleNode(ELEMENT_REVIEW);
  if Assigned(n) then
  begin
    FReview := n.Text;
  end;
end;

procedure TBookExtra.SaveData(doc: IXMLDOMDocument; thisElement: IXMLDOMElement);
var
  xmlElement: IXMLDOMElement;
begin
  inherited SaveData(doc, thisElement);

  if FRating <> 0 then
  begin
    thisElement.setAttribute(ATTRIBUTE_RATE, FRating);
  end;

  if FProgress <> 0 then
  begin
    thisElement.setAttribute(ATTRIBUTE_PROGRESS, FProgress);
  end;

  if FReview <> '' then
  begin
    xmlElement := doc.createElement(ELEMENT_REVIEW);
    xmlElement.appendChild(doc.createCDATASection(FReview));
    thisElement.appendChild(xmlElement);
  end;
end;

{ TBookExtras }

procedure TBookExtras.AddExtra(BookID, LibID, Rating, Progress: Integer; const Review: string);
begin
  Add(TBookExtra.Create(BookID, LibID, Rating, Progress, Review));
end;

procedure TBookExtras.Load(element: IXMLDOMElement);
var
  xmlExtras: IXMLDOMNodeList;
  xmlExtra: IXMLDOMNode;
begin
  Clear;

  xmlExtras := element.selectNodes(ELEMENT_EXTRAS + '/' + ELEMENT_BOOK);
  xmlExtra := xmlExtras.nextNode;
  while Assigned(xmlExtra) do
  begin
    Add(TBookExtra.Create(xmlExtra));

    xmlExtra := xmlExtras.nextNode;
  end;
end;

procedure TBookExtras.Save(doc: IXMLDOMDocument; parentElement: IXMLDOMElement);
var
  xmlExtras: IXMLDOMElement;
  info: TBookExtra;
begin
  if 0 = Count then
    Exit;

  xmlExtras := doc.createElement(ELEMENT_EXTRAS);
  for info in Self do
  begin
    info.Save(doc, xmlExtras);
  end;
  parentElement.appendChild(xmlExtras);
end;

{ TGroupBook }

constructor TGroupBook.Create(BookID, LibID: Integer);
begin
  inherited Create(ELEMENT_BOOK, BookID, LibID);
end;

constructor TGroupBook.Create(element: IXMLDOMNode);
begin
  inherited Create(ELEMENT_BOOK, element);
end;

{ TBookGroup }

constructor TBookGroup.Create(element: IXMLDOMNode);
begin
  inherited Create;
  Load(element);
end;

constructor TBookGroup.Create(GroupID: Integer; const GroupName: string);
begin
  inherited Create;
  FGroupID := GroupID;
  FGroupName := GroupName;
end;

procedure TBookGroup.Load(element: IXMLDOMNode);
var
  xmlBooks: IXMLDOMNodeList;
  xmlBook: IXMLDOMNode;
begin
  Clear;

  FGroupID := StrToIntDef(element.attributes.getNamedItem(ATTRIBUTE_ID).Text, -1);
  FGroupName := element.attributes.getNamedItem(ATTRIBUTE_NAME).Text;

  xmlBooks := element.selectNodes(ELEMENT_BOOK);
  xmlBook := xmlBooks.nextNode;
  while Assigned(xmlBook) do
  begin
    Add(TGroupBook.Create(xmlBook));

    xmlBook := xmlBooks.nextNode;
  end;
end;

procedure TBookGroup.Save(doc: IXMLDOMDocument; parentElement: IXMLDOMElement);
var
  xmlGroup: IXMLDOMElement;
  book: TBookInfo;
begin
  xmlGroup := doc.createElement(ELEMENT_GROUP);

  xmlGroup.setAttribute(ATTRIBUTE_ID, FGroupID);
  xmlGroup.setAttribute(ATTRIBUTE_NAME, FGroupName);

  for book in Self do
  begin
    book.Save(doc, xmlGroup);
  end;

  parentElement.appendChild(xmlGroup);
end;

procedure TBookGroup.AddBook(BookID, LibID: Integer);
begin
  Add(TGroupBook.Create(BookID, LibID));
end;

{ TBookGroups }

procedure TBookGroups.Load(element: IXMLDOMNode);
var
  xmlGroups: IXMLDOMNodeList;
  xmlGroup: IXMLDOMNode;
begin
  Clear;

  xmlGroups := element.selectNodes(ELEMENT_GROUPS + '/' + ELEMENT_GROUP);
  xmlGroup := xmlGroups.nextNode;
  while Assigned(xmlGroup) do
  begin
    Add(TBookGroup.Create(xmlGroup));

    xmlGroup := xmlGroups.nextNode;
  end;
end;

procedure TBookGroups.Save(doc: IXMLDOMDocument; parentElement: IXMLDOMElement);
var
  xmlGroups: IXMLDOMElement;
  group: TBookGroup;
begin
  if 0 = Count then
    Exit;

  xmlGroups := doc.createElement(ELEMENT_GROUPS);
  for group in Self do
  begin
    group.Save(doc, xmlGroups);
  end;
  parentElement.appendChild(xmlGroups);
end;

function TBookGroups.AddGroup(GroupID: Integer; const GroupName: string): TBookGroup;
begin
  Result := Items[Add(TBookGroup.Create(GroupID, GroupName))];
end;

{ TUserData }

constructor TUserData.Create;
begin
  inherited;

  FExtras := TBookExtras.Create;
  FGroups := TBookGroups.Create;
end;

destructor TUserData.Destroy;
begin
  FreeAndNil(FExtras);
  FreeAndNil(FGroups);
  inherited;
end;

procedure TUserData.Load(const FileName: string);
begin

end;

procedure TUserData.Save(const FileName: string);
var
  xmlDoc : IXMLDOMDocument;
  xmlPI: IXMLDOMProcessingInstruction;
  xmlRoot: IXMLDOMElement;
begin
  xmlDoc := msxmldom.CreateDOMDocument;
  xmlDoc.async := False;

  // Create a processing instruction targeted for xml.
  xmlPI := xmlDoc.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"');
  xmlDoc.appendChild(xmlPI);

  // Create the root element (i.e., the documentElement).
  xmlRoot := xmlDoc.createElement(ELEMENT_USERDATA);

  FExtras.Save(xmlDoc, xmlRoot);
  FGroups.Save(xmlDoc, xmlRoot);

  xmlDoc.appendChild(xmlRoot);

  xmlDoc.save(FileName);
end;

end.
