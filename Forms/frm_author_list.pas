(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Version 0.9
  * 20.08.2008
  * Copyright (c) Aleksey Penkov  alex.penkov@gmail.com
  *               Nick Rymanov    nrymanov@gmail.com
  ****************************************************************************** *)

unit frm_author_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualTrees, ExtCtrls, StdCtrls;

type
  TfrmAuthorList = class(TForm)
    tvAuthorList: TVirtualStringTree;
    pnButtons: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure tvAuthorListGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType; var CellText: string);
    procedure tvAuthorListGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
  private

  public

  end;

var
  frmAuthorList: TfrmAuthorList;

implementation

uses
  unit_Globals;

  {$R *.dfm}

procedure TfrmAuthorList.tvAuthorListGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := Sizeof(TAuthorData);
end;

procedure TfrmAuthorList.tvAuthorListGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType; var CellText: string);
var
  Data: PAuthorData;
begin
  Data := tvAuthorList.GetNodeData(Node);
  CellText := Data.Text;
end;

end.
