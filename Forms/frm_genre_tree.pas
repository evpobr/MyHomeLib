(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Version 0.9
  * 20.08.2008
  * Copyright (c) Aleksey Penkov  alex.penkov@gmail.com
  *               Nick Rymanov    nrymanov@gmail.com
  ****************************************************************************** *)

unit frm_genre_tree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualTrees, ExtCtrls, unit_globals, StdCtrls;

type
  TfrmGenreTree = class(TForm)
    tvGenresTree: TVirtualStringTree;
    pnButtons: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure tvGenresTreeGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure tvGenresTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType; var CellText: String);
  private

  public
    procedure GetSelectedGenres(var R: TBookRecord);
    procedure SelectGenres(const Code: string);
  end;

var
  frmGenreTree: TfrmGenreTree;

implementation

uses
  unit_Consts;

{$R *.dfm}

procedure TfrmGenreTree.SelectGenres(const Code: string);
var
  Node: PVirtualNode;
  Data: PGenreData;
begin
  Node := tvGenresTree.GetFirst;
  while Node <> nil do
  begin
    Data := tvGenresTree.GetNodeData(Node);
    if Data.Code = Code then
    begin
      tvGenresTree.Selected[Node] := True;
      tvGenresTree.Expanded[Node.Parent] := True;
    end;
    Node := tvGenresTree.GetNext(Node);
  end;
end;

procedure TfrmGenreTree.GetSelectedGenres(var R: TBookRecord);
var
  Data: PGenreData;
  Node: PVirtualNode;
begin
  Node := tvGenresTree.GetFirstSelected;

  R.ClearGenres;
  while Assigned(Node) do
  begin
    Data := frmGenreTree.tvGenresTree.GetNodeData(Node);
    R.AddGenreFB2(Data.Code, Data.FB2Code, '');
    Node := tvGenresTree.GetNextSelected(Node);
  end;

  if R.GenreCount = 0 then
    R.AddGenreFB2(UNKNOWN_GENRE_CODE, '', '');
end;

procedure TfrmGenreTree.tvGenresTreeGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := Sizeof(TGenreData);
end;

procedure TfrmGenreTree.tvGenresTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType; var CellText: String);
var
  Data: PGenreData;
begin
  Data := tvGenresTree.GetNodeData(Node);
  CellText := Data.Text;
end;

end.
