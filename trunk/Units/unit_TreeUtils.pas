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
  unit_Globals,
  SysUtils;

type
  TSelectionList = array of PVirtualNode;

function FindParentInTree(Tree: TVirtualStringTree; Folder: string): PVirtualNode;
function FindSeriesInTree(Tree: TVirtualStringTree; Parent: PVirtualNode; SerID: Integer): PVirtualNode;
procedure SortChild(Tree: TVirtualStringTree; Parent: PVirtualNode);
// procedure SortAuthors(Tree:TVirtualStringTree);
function GetSelectedBookData(Tree: TVirtualStringTree): PBookData;
procedure SortSeries(Tree: TVirtualStringTree; Parent: PVirtualNode);
procedure SelectBookById(Tree: TVirtualStringTree; ID: Integer);
procedure GetSeelections(Tree: TVirtualStringTree; out List: TSelectionList);

implementation

procedure GetSeelections(Tree: TVirtualStringTree; out List: TSelectionList);
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

function FindParentInTree(Tree: TVirtualStringTree; Folder: string): PVirtualNode;
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

function FindSeriesInTree(Tree: TVirtualStringTree; Parent: PVirtualNode; SerID: Integer): PVirtualNode;
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
    if (Data.nodeType = ntSeriesInfo) and (Data.SeriesID = SerID) then
    begin
      Result := Node;
      Break;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

procedure SortAuthors(Tree: TVirtualStringTree);

  function FindNext(A: PVirtualNode): PVirtualNode;
  var
    Data: PBookData;
  begin
    A := Tree.GetNextSibling(A);
    while A <> nil do
    begin
      Data := Tree.GetNodeData(A);
      if Data.nodeType = ntAuthorInfo then
        Break;
      A := Tree.GetNextSibling(A);
    end;
    Result := A;
  end;

var
  A, B: PVirtualNode;
  DataA, DataB: PBookData;
begin
  A := Tree.GetFirst;
  if A = nil then
    Exit;

  B := FindNext(A);
  while (B <> nil) do
  begin
    DataA := Tree.GetNodeData(A);
    DataB := Tree.GetNodeData(B);
    if CompareStr(DataB.FullName, DataA.FullName) < 0 then
    begin
      Tree.MoveTo(B, A, amInsertBefore, false);
      A := Tree.GetFirst;
      B := FindNext(A);
    end
    else
    begin
      A := B;
      B := FindNext(B);
    end;
  end;
end;

procedure SortSeries(Tree: TVirtualStringTree; Parent: PVirtualNode);
var
  A, B: PVirtualNode;
  DataA, DataB: PBookData;
begin
  A := Parent.FirstChild;
  while (A <> Parent.LastChild) and (A <> nil) do
  begin
    DataA := Tree.GetNodeData(A);
    B := Tree.GetNext(A);
    DataB := Tree.GetNodeData(B);
    if DataB.nodeType = ntBookInfo then
      Break;
    if DataB <> nil then
      if DataB.Series < DataA.Series then
      begin
        Tree.MoveTo(B, A, amInsertBefore, false);
        A := Parent.FirstChild;
      end
      else
        A := B;
    B := Tree.GetNext(B);
  end;
end;

procedure SortChild(Tree: TVirtualStringTree; Parent: PVirtualNode);
var
  A, B: PVirtualNode;
  DataA, DataB: PBookData;
begin
  A := Parent.FirstChild;
  while (A <> Parent.LastChild) and (A <> nil) do
  begin
    DataA := Tree.GetNodeData(A);
    B := Tree.GetNext(A);
    DataB := Tree.GetNodeData(B);
    if DataB <> nil then
      if DataB.No < DataA.No then
      begin
        Tree.MoveTo(B, A, amInsertBefore, false);
        A := Parent.FirstChild;
      end
      else
        A := B;
    B := Tree.GetNext(B);
  end;
end;

function GetSelectedBookData(Tree: TVirtualStringTree): PBookData;
begin
  Result := Tree.GetNodeData(Tree.GetFirstSelected);
  if Result = nil then
  begin
    New(Result);
    Result.ID := -1;
  end;
end;

procedure SelectBookById(Tree: TVirtualStringTree; ID: Integer);
var
  Node: PVirtualNode;
  Data: PBookData;
begin
  Node := Tree.GetFirst;
  while Node <> nil do
  begin
    Data := Tree.GetNodeData(Node);
    if Data.ID = ID then
    begin
      Tree.Selected[Node] := True;
      Break;
    end;
    Node := Tree.GetNext(Node);
  end;
end;

end.
