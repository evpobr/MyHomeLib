
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}


unit frm_genre_tree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualTrees, RzButton, ExtCtrls, RzPanel, unit_globals;

type
  TfrmGenreTree = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    tvGenresTree: TVirtualStringTree;
    RzBitBtn1: TRzBitBtn;
    RzButton1: TRzButton;
    procedure tvGenresTreeGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure tvGenresTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
  private


    { Private declarations }
  public
    { Public declarations }
    procedure GetSelectedGenres(var R: TBookRecord);
    procedure SelectGenres(Code:String);
  end;

var
  frmGenreTree: TfrmGenreTree;

implementation

uses unit_Consts;

{$R *.dfm}

procedure TfrmGenreTree.SelectGenres(Code:String);
var
  Node:PVirtualNode;
  Data:PGenreData;
begin
  Node:=tvGenresTree.GetFirst;
  while Node<>nil do
  begin
    Data:=tvGenresTree.GetNodeData(Node);
    if Data.Code=Code then
    begin
      tvGenresTree.Selected[Node]:=True;
      tvGenresTree.Expanded[Node.Parent]:=True;
    end;
    Node:=tvGenresTree.GetNext(Node);
  end;  
end;



procedure TfrmGenreTree.GetSelectedGenres(var R:TBookRecord);
var
  Data:PGenreData;
  Node:PvirtualNode;
begin
  Node:=tvGenresTree.GetFirstSelected;

  R.ClearGenres;
  while Assigned(Node) do
  begin
    Data:=frmGenreTree.tvGenresTree.GetNodeData(Node);
    R.AddGenreFB2(Data.Code, '', '');
    Node:=tvGenresTree.GetNextSelected(Node);
  end;

  if R.GenreCount = 0 then
    R.AddGenreFB2(UNKNOWN_GENRE_CODE, '', '');
end;

procedure TfrmGenreTree.tvGenresTreeGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize:=Sizeof(TGenreData);
end;


procedure TfrmGenreTree.tvGenresTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: String);
var
  Data:PGenreData;
begin
  Data:=tvGenresTree.GetNodeData(Node);
  CellText:=Data.Text;
end;

end.
