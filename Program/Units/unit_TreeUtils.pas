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
  unit_Globals,
  SysUtils;

type
  TSelectionList = array of PVirtualNode;

function FindParentInTree(Tree: TVirtualStringTree; const Folder: string): PVirtualNode;
function FindSeriesInTree(Tree: TBookTree; Parent: PVirtualNode; SerieID: Integer): PVirtualNode;
procedure SelectBookById(Tree: TBookTree; ID: Integer);
procedure GetSelections(Tree: TBookTree; out List: TSelectionList);

procedure FillAuthorTree(Tree: TVirtualStringTree);
procedure FillSeriesTree(Tree: TVirtualStringTree);
procedure FillGenresTree(Tree: TVirtualStringTree; FillFB2: Boolean = False);
procedure FillGroupsList(Tree: TVirtualStringTree);

implementation

uses
  dm_user,
  dm_collection,
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

function FindSeriesInTree(Tree: TBookTree; Parent: PVirtualNode; SerieID: Integer): PVirtualNode;
var
  Node: PVirtualNode;
  Data: PBookData;
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
    if (Data^.nodeType = ntSeriesInfo) and (Data.SerieID = SerieID) then
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
  Data: PBookData;
begin
  Node := Tree.GetFirst;
  while Assigned(Node) do
  begin
    Data := Tree.GetNodeData(Node);
    Assert(Assigned(Data));
    if Data.BookID = ID then
    begin
      Tree.Selected[Node] := True;
      Break;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

// ============================================================================
procedure FillAuthorTree(Tree: TVirtualStringTree);
var
  Node: PVirtualNode;
  Data: PAuthorData;
begin
  Tree.NodeDataSize := SizeOf(TAuthorData);

  Tree.BeginUpdate;
  try
    Tree.Clear;

    DMCollection.Authors.DisableControls;
    try
      DMCollection.Authors.First;

      while not DMCollection.Authors.Eof do
      begin
        Node := Tree.AddChild(nil);
        Data := Tree.GetNodeData(Node);

        Initialize(Data^);
        Data^.AuthorID := DMCollection.AuthorsID.Value;
        Data^.FirstName := DMCollection.AuthorsName.Value;
        Data^.LastName := DMCollection.AuthorsFamily.Value;
        Data^.MiddleName := DMCollection.AuthorsMiddle.Value;
        Include(Node.States, vsInitialUserData);

        DMCollection.Authors.Next;
      end;

      Tree.Selected[Tree.GetFirst] := True;
    finally
      DMCollection.Authors.EnableControls;
    end;
  finally
    Tree.EndUpdate;
  end;
end;

procedure FillSeriesTree(Tree: TVirtualStringTree);
var
  Node: PVirtualNode;
  Data: PSerieData;
begin
  Tree.NodeDataSize := SizeOf(TSerieData);

  Tree.BeginUpdate;
  try
    Tree.Clear;

    DMCollection.Series.DisableControls;
    try
      DMCollection.Series.First;

      while not DMCollection.Series.Eof do
      begin
        Node := Tree.AddChild(nil);
        Data := Tree.GetNodeData(Node);

        Initialize(Data^);
        Data^.SerieID := DMCollection.SeriesSerieID.AsInteger;
        Data^.SerieTitle := DMCollection.SeriesTitle.AsString;
        Include(Node.States, vsInitialUserData);

        DMCollection.Series.Next;
      end;
    finally
      DMCollection.Series.EnableControls;
    end;
  finally
    Tree.EndUpdate;
  end;
end;

procedure FillGenresTree(Tree: TVirtualStringTree; FillFB2: Boolean);
var
  genreNode: PVirtualNode;
  Data: PGenreData;
  Nodes: TDictionary<string, PVirtualNode>;
  strParentCode: string;
  nParentIndex: Integer;
  ParentNode: PVirtualNode;
begin
  Tree.NodeDataSize := SizeOf(TGenreData);

  Nodes := TDictionary<string, PVirtualNode>.Create;
  try
    Tree.BeginUpdate;
    try
      Tree.Clear;

      DMCollection.Genres.DisableControls;
      try
        DMCollection.Genres.First;
        while not DMCollection.Genres.Eof do
        begin
          strParentCode := DMCollection.GenresParentCode.Value;

          ParentNode := nil;
          if (strParentCode <> '0') and Nodes.ContainsKey(strParentCode) then
            ParentNode := Nodes[strParentCode];

          genreNode := Tree.AddChild(ParentNode);
          Data := Tree.GetNodeData(genreNode);

          Initialize(Data^);
          Data^.GenreAlias := DMCollection.GenresGenreAlias.Value;
          Data^.GenreCode := DMCollection.GenresGenreCode.Value;
          Data^.ParentCode := strParentCode;
          if FillFB2 then
            Data^.FB2GenreCode := DMCollection.GenresFB2Code.Value;
          Include(genreNode.States, vsInitialUserData);

          Nodes.AddOrSetValue(Data^.GenreCode, genreNode);

          DMCollection.Genres.Next;
        end;
      finally
        DMCollection.Genres.EnableControls;
      end;
    finally
      Tree.EndUpdate;
    end;
  finally
    Nodes.Free;
  end;
end;

procedure FillGroupsList(Tree: TVirtualStringTree);
var
  Node: PVirtualNode;
  Data: PGroupData;
begin
  Tree.BeginUpdate;
  try
    Tree.Clear;

    DMUser.Groups.First;
    while not DMUser.Groups.Eof do
    begin
      Node := Tree.AddChild(nil);
      Data := Tree.GetNodeData(Node);

      Initialize(Data^);
      Data^.Text := DMUser.GroupsGroupName.Value;
      Data^.GroupID := DMUser.GroupsGroupID.Value;
      Data^.CanDelete := DMUser.GroupsAllowDelete.Value;
      Include(Node.States, vsInitialUserData);

      DMUser.Groups.Next;
    end;

    // активируем последнюю группу в списке
    Tree.Selected[Tree.GetLast] := True;
  finally
    Tree.EndUpdate;
  end;
end;


end.
