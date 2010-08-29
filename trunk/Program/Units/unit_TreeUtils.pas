(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Aleksey Penkov  alex.penkov@gmail.com
  * Created             12.02.2010
  * Description
  *
  * $Id$
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_TreeUtils;

interface

uses
  VirtualTrees,
  BookTreeView,
  SysUtils,
  unit_Globals,
  unit_Consts;

type
  TSelectionList = array of PVirtualNode;

function FindParentInTree(Tree: TVirtualStringTree; const Folder: string): PVirtualNode;
function FindSeriesInTree(Tree: TBookTree; Parent: PVirtualNode; SeriesID: Integer): PVirtualNode;
procedure SelectBookById(Tree: TBookTree; ID: Integer);
procedure GetSelections(Tree: TBookTree; out List: TSelectionList);

procedure FillAuthorTree(Tree: TVirtualStringTree; AuthorIterator: IAuthorIterator; SelectID: Integer = MHL_INVALID_ID);
procedure FillSeriesTree(Tree: TVirtualStringTree; SeriesIterator: ISeriesIterator; SelectID: Integer = MHL_INVALID_ID);
procedure FillGenresTree(Tree: TVirtualStringTree; FillFB2: Boolean = False; const SelectCode: string = '');
procedure FillGroupsList(Tree: TVirtualStringTree; SelectID: Integer = MHL_INVALID_ID);

implementation

uses
  dm_user,
  dm_collection,
  UserData,
  Generics.Collections;

procedure GetSelections(Tree: TBookTree; out List: TSelectionList);
var
  Node: PVirtualNode;
  i: Integer;
begin
  SetLength(List, Tree.SelectedCount);
  Node := Tree.GetFirstSelected;
  for i := 0 to Tree.SelectedCount - 1 do
  begin
    List[i] := Node;
    Node := Tree.GetNextSelected(Node);
  end;
end;

function FindParentInTree(Tree: TVirtualStringTree; const Folder: string): PVirtualNode;
var
  Node: PVirtualNode;
  Data: PFileData;
begin
  Result := nil;
  Node := Tree.GetFirst;
  Data := Tree.GetNodeData(Node);
  if Data = nil then
    Exit;

  while Node <> nil do
  begin
    Data := Tree.GetNodeData(Node);
    if (Data.DataType = dtFolder) and (Data.Folder = Folder) then
    begin
      Result := Node;
      Break;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

function FindSeriesInTree(Tree: TBookTree; Parent: PVirtualNode; SeriesID: Integer): PVirtualNode;
var
  Node: PVirtualNode;
  Data: PBookRecord;
begin
  Result := nil;
  if Assigned(Parent) then
    Node := Parent.FirstChild
  else
    Node := Tree.GetFirst;

  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if (Data^.nodeType = ntSeriesInfo) and (Data.SeriesID = SeriesID) then
    begin
      Result := Node;
      Break;
    end;
    Node := Tree.GetNextSibling(Node);
  end;
end;

procedure SelectBookById(Tree: TBookTree; ID: Integer);
var
  Node: PVirtualNode;
  Data: PBookRecord;
begin
  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if Data.BookKey.BookID = ID then
    begin
      Tree.Selected[Node] := True;
      Break;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

// ============================================================================
procedure SafeSelectNode(Tree: TVirtualStringTree; Node: PVirtualNode);
begin
  Assert(Assigned(Tree));

  if not Assigned(Node) then
    Node := Tree.GetFirst;

  if Assigned(Node) then
  begin
    Tree.Selected[Node] := True;
    Tree.FocusedNode := Node;
    //Tree.FullyVisible[Node] := True;
    Tree.ScrollIntoView(Node, True);
  end;
end;

procedure FillAuthorTree(Tree: TVirtualStringTree;  AuthorIterator: IAuthorIterator; SelectID: Integer = MHL_INVALID_ID);
var
  Node: PVirtualNode;
  NodeData: PAuthorData;
  AuthorData: TAuthorData;
  SelectedNode: PVirtualNode;
begin
  Tree.NodeDataSize := SizeOf(TAuthorData);

  Tree.BeginSynch;
  try
    Tree.BeginUpdate;
    try
      Tree.Clear;
      SelectedNode := nil;

      while AuthorIterator.Next(AuthorData) do
      begin
        Node := Tree.AddChild(nil);
        NodeData := Tree.GetNodeData(Node);

        Initialize(NodeData^);
        NodeData^ := AuthorData;
        Include(Node^.States, vsInitialUserData);

        if NodeData^.AuthorID = SelectID then
          SelectedNode := Node;
      end;

      SafeSelectNode(Tree, SelectedNode);
    finally
      Tree.EndUpdate;
    end;
  finally
    Tree.EndSynch;
  end;
end;

procedure FillSeriesTree(Tree: TVirtualStringTree; SeriesIterator: ISeriesIterator; SelectID: Integer = MHL_INVALID_ID);
var
  Node: PVirtualNode;
  Data: PSeriesData;
  SelectedNode: PVirtualNode;
  SeriesData: TSeriesData;
begin
  Tree.NodeDataSize := SizeOf(TSeriesData);

  Tree.BeginSynch;
  try
    Tree.BeginUpdate;
    try
      Tree.Clear;
      SelectedNode := nil;

      while SeriesIterator.Next(SeriesData) do
      begin
        Node := Tree.AddChild(nil);
        Data := Tree.GetNodeData(Node);

        Initialize(Data^);
        Data^ := SeriesData;
        Include(Node.States, vsInitialUserData);

        if Data^.SeriesID = SelectID then
          SelectedNode := Node;
      end;

      SafeSelectNode(Tree, SelectedNode);
    finally
      Tree.EndUpdate;
    end;
  finally
    Tree.EndSynch;
  end;
end;

procedure FillGenresTree(Tree: TVirtualStringTree; FillFB2: Boolean = False; const SelectCode: string = '');
var
  GenreNode: PVirtualNode;
  Data: PGenreData;
  Genre: TGenreData;
  Nodes: TDictionary<string, PVirtualNode>;
  ParentNode: PVirtualNode;
  SelectedNode: PVirtualNode;
  GenreIterator: IGenreIterator;
begin
  Tree.NodeDataSize := SizeOf(TGenreData);

  Nodes := TDictionary<string, PVirtualNode>.Create;
  try
    Tree.BeginSynch;
    try
      Tree.BeginUpdate;
      try
        Tree.Clear;
        SelectedNode := nil;

        GenreIterator := DMCollection.GetGenreIterator(gmAll);
        while GenreIterator.Next(Genre) do
        begin
          ParentNode := nil;
          if (Genre.ParentCode <> '0') and Nodes.ContainsKey(Genre.ParentCode) then
            ParentNode := Nodes[Genre.ParentCode];

          GenreNode := Tree.AddChild(ParentNode);
          Data := Tree.GetNodeData(GenreNode);

          Initialize(Data^);
          Data^ := Genre;
          if not FillFB2 then
            Data^.FB2GenreCode := '';
          Include(GenreNode.States, vsInitialUserData);

          Nodes.AddOrSetValue(Data^.GenreCode, GenreNode);

          if Data^.GenreCode = SelectCode then
            SelectedNode := GenreNode;
        end;

        SafeSelectNode(Tree, SelectedNode);
      finally
        Tree.EndUpdate;
      end;
    finally
      Tree.EndSynch;
    end;
  finally
    Nodes.Free;
  end;
end;

procedure FillGroupsList(Tree: TVirtualStringTree; SelectID: Integer = MHL_INVALID_ID);
var
  Node: PVirtualNode;
  Data: PGroupData;
  SelectedNode: PVirtualNode;
  GroupIterator: IGroupIterator;
  Group: TGroupData;
begin
  Tree.BeginSynch;
  try
    Tree.BeginUpdate;
    try
      Tree.Clear;
      SelectedNode := nil;

      GroupIterator := DMUser.GetGroupIterator;
      while GroupIterator.Next(Group) do
      begin
        Node := Tree.AddChild(nil);
        Data := Tree.GetNodeData(Node);

        Initialize(Data^);
        Data^ := Group;
        Include(Node.States, vsInitialUserData);

        if Data^.GroupID = SelectID then
          SelectedNode := Node;
      end;

      SafeSelectNode(Tree, SelectedNode);
    finally
      Tree.EndUpdate;
    end;
  finally
    Tree.EndSynch;
  end;
end;


end.
