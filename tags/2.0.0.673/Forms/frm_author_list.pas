unit frm_author_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualTrees, RzButton, ExtCtrls, RzPanel;

type
  TfrmAuthorList = class(TForm)
    RzPanel2: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzButton1: TRzButton;
    tvAuthorList: TVirtualStringTree;
    procedure tvAuthorListGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure tvAuthorListGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuthorList: TfrmAuthorList;

implementation

uses
  unit_Globals;

{$R *.dfm}

procedure TfrmAuthorList.tvAuthorListGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := Sizeof(TAuthorData);
end;

procedure TfrmAuthorList.tvAuthorListGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Data:PAuthorData;
begin
  Data := tvAuthorList.GetNodeData(Node);
  CellText := Data.Text;
end;

end.
