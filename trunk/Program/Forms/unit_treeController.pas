(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors             Nick Rymanov     nrymanov@gmail.com
  * Created             05.10.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit unit_treeController;

interface

uses
  Types,
  Graphics,
  VirtualTrees,
  BookTreeView,
  unit_Globals,
  unit_Interfaces;

type
  TTreeController = class
  private
    function BooksGetColumnTag(const Sender: TBaseVirtualTree; const Column: Integer): Integer;
    function BooksGetColumnText(Tag: Integer; Data: PBookRecord): string;

    procedure GetNodeDataSize<T>(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure FreeNodeData<T>(Sender: TBaseVirtualTree; Node: PVirtualNode);

    //
    // Список авторов
    //
    procedure AuthorsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);

    //
    // Список серий
    //
    procedure SeriesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);

    //
    // Список жанров
    //
    procedure GenresGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);

    //
    // Список книг
    //
    procedure GroupsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);

    //
    // Список книг
    //
    procedure BooksInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure BooksGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure BooksBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure BooksPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure BooksAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellRect: TRect);
    procedure BooksCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);

  public
    constructor Create(SystemData: ISystemData);
    destructor Destroy; override;

    procedure ConnectAuthorsTree(tree: TVirtualStringTree);
    procedure ConnectSeriesTree(tree: TVirtualStringTree);
    procedure ConnectGenresTree(tree: TVirtualStringTree);
    procedure ConnectGroupsTree(tree: TVirtualStringTree);
    procedure ConnectBooksTree(tree: TBookTree);
  end;

implementation

uses
  SysUtils,
  Math,
  StrUtils,
  unit_Consts,
  unit_Settings,
  unit_MHLHelpers;

resourcestring
  rstrSingleSeries = 'Серия: %s';

{ TMainController }

constructor TTreeController.Create(SystemData: ISystemData);
begin
  inherited Create;
end;

destructor TTreeController.Destroy;
begin
  inherited Destroy;
end;

procedure TTreeController.ConnectAuthorsTree(tree: TVirtualStringTree);
begin
  Assert(Assigned(tree));
  tree.OnGetNodeDataSize := GetNodeDataSize<TAuthorData>;
  tree.OnGetText := AuthorsGetText;
  tree.OnFreeNode := FreeNodeData<TAuthorData>;
end;

procedure TTreeController.ConnectSeriesTree(tree: TVirtualStringTree);
begin
  Assert(Assigned(tree));
  tree.OnGetNodeDataSize := GetNodeDataSize<TSeriesData>;
  tree.OnGetText := SeriesGetText;
  tree.OnFreeNode := FreeNodeData<TSeriesData>;
end;

procedure TTreeController.ConnectGenresTree(tree: TVirtualStringTree);
begin
  Assert(Assigned(tree));
  tree.OnGetNodeDataSize := GetNodeDataSize<TGenreData>;
  tree.OnGetText := GenresGetText;
  tree.OnFreeNode := FreeNodeData<TGenreData>;
end;

procedure TTreeController.ConnectGroupsTree(tree: TVirtualStringTree);
begin
  Assert(Assigned(tree));
  tree.OnGetNodeDataSize := GetNodeDataSize<TGroupData>;
  tree.OnGetText := GroupsGetText;
  tree.OnFreeNode := FreeNodeData<TGroupData>;
end;

procedure TTreeController.ConnectBooksTree(tree: TBookTree);
begin
  Assert(Assigned(tree));
  tree.OnGetNodeDataSize := GetNodeDataSize<TBookRecord>;
  tree.OnInitNode := BooksInitNode;
  tree.OnGetText := BooksGetText;
  tree.OnFreeNode := FreeNodeData<TBookRecord>;

  tree.OnBeforeCellPaint := BooksBeforeCellPaint;
  tree.OnPaintText := BooksPaintText;
  ///tree.OnAfterCellPaint := BooksAfterCellPaint;
  tree.OnCompareNodes := BooksCompareNodes;
end;

procedure TTreeController.GetNodeDataSize<T>(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(T);
end;

procedure TTreeController.FreeNodeData<T>(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: ^T;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Finalize(Data^);
end;

procedure TTreeController.AuthorsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PAuthorData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := Data^.GetFullName;
end;

procedure TTreeController.SeriesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PSeriesData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := Data^.SeriesTitle;
end;

procedure TTreeController.GenresGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PGenreData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  CellText := Data^.GenreAlias;
end;

procedure TTreeController.GroupsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: PGroupData;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));
  CellText := Data^.Text;
end;

procedure TTreeController.BooksInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.CheckType := ctTriStateCheckBox;
  Sender.CheckState[Node] := csUncheckedNormal;
end;

function TTreeController.BooksGetColumnTag(const Sender: TBaseVirtualTree; const Column: Integer): Integer;
begin
  if Column < 0 then
    Result := -1
  else
    Result := (Sender as TBookTree).Header.Columns[Column].Tag;
end;

function TTreeController.BooksGetColumnText(Tag: Integer; Data: PBookRecord): string;
begin
  Assert(Assigned(Data));
  case Tag of
    COL_AUTHOR:
      Result := TAuthorsHelper.GetList(Data^.Authors);
    COL_TITLE:
      Result := Data^.Title;
    COL_SERIES:
      Result := Data^.Series;
    COL_NO:
      Result := IfThen(Data^.SeqNumber = 0, '', IntToStr(Data^.SeqNumber));
    COL_SIZE:
      Result := GetFormattedSize(Data^.Size);
    COL_DATE:
      Result := DateToStr(Data^.Date);
    COL_GENRE:
      Result := TGenresHelper.GetList(Data^.Genres);
    COL_TYPE:
      Result := Data^.GetFileType;
    COL_LANG:
      Result := Data^.Lang;
    // COL_LIBRATE   : Result := IntToStr(Data^.LibRate);
    COL_COLLECTION:
      Result := Data^.CollectionName;
  end;
end;

procedure TTreeController.BooksGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Page: Integer;
  Data: PBookRecord;
  ColumnID: Integer;
begin
  Page := Sender.Tag;
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  ColumnID := BooksGetColumnTag(Sender, Column);
  CellText := '';
  if Settings.TreeModes[Page] = tmTree then
  begin
    case Data^.nodeType of
      ntAuthorInfo:
        begin
          if COL_TITLE = ColumnID then
              CellText := TAuthorsHelper.GetList(Data^.Authors);
        end;

      ntSeriesInfo:
        begin
          if COL_TITLE = ColumnID then
            CellText := Format(rstrSingleSeries, [Data^.Series]);
        end;

      ntBookInfo:
        begin
          CellText := BooksGetColumnText(ColumnID, Data);
        end;
    end
  end
  else
    CellText := BooksGetColumnText(ColumnID, Data);
end;

procedure TTreeController.BooksBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
var
  Data: PBookRecord;
  Color: TColor;
begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  Color := Settings.BGColor;
  case Data^.nodeType of
    ntAuthorInfo:
      Color := Settings.AuthorColor;

    ntSeriesInfo:
      Color := Settings.SeriesColor;

    ntBookInfo:
      begin
        if Data^.Series = '' then
          Color := Settings.BookColor
        else
          Color := Settings.SeriesBookColor;
      end;
  end;

  TargetCanvas.Brush.Color := Color;
  TargetCanvas.FillRect(CellRect);
end;

procedure TTreeController.BooksPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  Data: PBookRecord;
begin
  Data := Sender.GetNodeData(Node);
  if Data^.nodeType <> ntBookInfo then
    TargetCanvas.Font.Style := [fsBold]
  else if not Sender.Selected[Node] then
  begin
    if (bpIsLocal in Data^.BookProps) then
      TargetCanvas.Font.Color := Settings.LocalColor;
    if (bpIsDeleted in Data^.BookProps) then
      TargetCanvas.Font.Color := Settings.DeletedColor;
  end;
end;

procedure TTreeController.BooksAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellRect: TRect);
var
  Data: PBookRecord;
  ColumnID: Integer;
  X: Integer;

  procedure Stars(Value: Integer);
  var
    i: Integer;
    X, Y: Integer;
    w, h: Integer;
  begin
    ///w := FStarImage.Width;
    ///h := FStarImage.Height;
    X := CellRect.Left (* + (CellRect.Right - CellRect.Left - 10 {w} * 5) div 2 *) ;
    Y := CellRect.Top + (CellRect.Bottom - CellRect.Top - h) div 2;
    for i := 0 to 4 do
    begin
      ///if Value > i then
      ///  FStarImage.Draw(TargetCanvas, Rect(X, Y, X + w, Y + h))
      ///else
      ///  FEmptyStarImage.Draw(TargetCanvas, Rect(X, Y, X + w, Y + h));
      ///Inc(X, { w } 10);
    end;
  end;

begin
  Data := Sender.GetNodeData(Node);
  Assert(Assigned(Data));

  if Data^.nodeType <> ntBookInfo then
    Exit;

  ColumnID := BooksGetColumnTag(Sender, Column);

  X := (Sender as TBookTree).Header.Columns.Items[Column].Left;

  if (ColumnID = COL_STATE) then
  begin
    //
    // The book belongs to an online collection and is available locally (already downloaded)
    //
    ///if (bpIsLocal in Data^.BookProps) and isOnlineCollection(FCollection.CollectionCode) then
    ///  ilFileTypes.Draw(TargetCanvas, X, CellRect.Top + 1, 7);

    //
    // Книга прочитана
    //
    ///if Data^.Progress = 100 then
    ///  ilFileTypes.Draw(TargetCanvas, X + 10, CellRect.Top, 8);

    //
    // У книги есть аннотация
    //
    ///if bpHasReview in Data^.BookProps then
    ///  ilFileTypes.Draw(TargetCanvas, X + 25, CellRect.Top + 1, 9);
  end
  else if (ColumnID = COL_RATE) then
    Stars(Data^.Rate)
  else if (ColumnID = COL_LIBRATE) then
  begin
    if Data^.LibRate <= 5 then
      Stars(Data^.LibRate)
    else
      Stars(0);
  end;
end;

procedure TTreeController.BooksCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PBookRecord;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);

  if NoColumn = Column then
  begin
    if Data1^.nodeType = Data2^.nodeType then
    begin
      Result := 0;
      if Data1^.nodeType = ntAuthorInfo then
        Result := CompareStr(TAuthorsHelper.GetList(Data1^.Authors), TAuthorsHelper.GetList(Data2^.Authors))
      else if Data1^.nodeType = ntSeriesInfo then
        Result := CompareStr(Data1^.Series, Data2^.Series)
      else
      begin
        Result := CompareSeqNumber(Data1^.SeqNumber, Data2^.SeqNumber);
        if Result = 0 then
          Result := CompareStr(Data1^.Title, Data2^.Title);
        if Result = 0 then
          Result := CompareStr(Data1^.Series, Data2^.Series);
      end;
    end
    else
      Result := Sign(Ord(Data1^.nodeType) - Ord(Data2^.nodeType));
  end
  else
  begin
    case (Sender as TBookTree).Header.Columns[Column].Tag of
      COL_AUTHOR:  Result := CompareStr(TAuthorsHelper.GetList(Data1^.Authors), TAuthorsHelper.GetList(Data2^.Authors));
      COL_TITLE:   Result := CompareStr(Data1^.Title, Data2^.Title);
      COL_SERIES:  Result := CompareStr(Data1^.Series, Data2^.Series);
      COL_NO:      Result := CompareSeqNumber(Data1^.SeqNumber, Data2^.SeqNumber);
      COL_SIZE:    Result := CompareInt(Data1^.Size, Data2^.Size);
      COL_RATE:    Result := CompareInt(Data1^.Rate, Data2^.Rate);
      COL_GENRE:   Result := CompareStr(TGenresHelper.GetList(Data1^.Genres), TGenresHelper.GetList(Data2^.Genres));
      COL_DATE:    Result := CompareDate(Data1^.Date, Data2^.Date);
      COL_LANG:    Result := CompareStr(Data1^.Lang, Data2^.Lang);
      COL_LIBRATE: Result := CompareInt(Data1^.LibRate, Data2^.LibRate);
    end;
  end;
end;

end.
