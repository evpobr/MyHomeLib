(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             12.02.2010
  * Description
  * Author(s)           Aleksey Penkov  alex.penkov@gmail.com
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

implementation

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

end.
