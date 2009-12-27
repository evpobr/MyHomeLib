{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit frame_NCWOperation;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  frame_InteriorPageBase,
  StdCtrls,
  ExtCtrls,
  unit_StaticTip,
  unit_NCWParams;

type
  TframeNCWOperation = class(TInteriorPageBase)
    Panel1: TPanel;
    rbNew: TRadioButton;
    rbExisting: TRadioButton;
    pageHint: TMHLStaticTip;
    rbInpx: TRadioButton;
    procedure OnSetCollectionType(Sender: TObject);
  private

  public
    function Activate(LoadData: Boolean): Boolean; override;
    function Deactivate(CheckData: Boolean): Boolean; override;
  end;

var
  frameNCWOperation: TframeNCWOperation;

resourcestring

  CREATENEW = '�������� ���� ����� ��� �������� ��������� lib.rus.ec, ��������� �� ������ ������ inpx ��� ������ ���������';
  ADDEXISTS = '���������� ����� ��������� ���������. ��������� ���� ��������� *.hlc';
  INPXBASED = '������� ��������� �� ���������� ����� inpx (��������� lib.rus.ec, flibusta, Traum)';

implementation

uses dm_user;

{$R *.dfm}

procedure TframeNCWOperation.OnSetCollectionType(Sender: TObject);
begin
  if Sender = rbNew then
    pageHint.Caption := CREATENEW
  else if Sender = rbExisting then
    pageHint.Caption := ADDEXISTS
  else if Sender = rbINPX then
    pageHint.Caption := INPXBASED
end;

function TframeNCWOperation.Activate(LoadData: Boolean): Boolean;
var
  rb: TRadioButton;
begin
  if LoadData then
  begin
    case FPParams^.Operation of
      otNew: rb := rbNew;
      otExisting: rb := rbExisting;
      otInpx: rb := rbInpx;
    else
      Assert(False);
      Result := False;
      Exit;
    end;

    Assert(Assigned(rb));

    rb.Checked := True;
    OnSetCollectionType(rb);
  end;

  Result := True;
end;

function TframeNCWOperation.Deactivate(CheckData: Boolean): Boolean;
begin
  if rbNew.Checked then
  begin
    FPParams^.Operation := otNew;
    FPParams^.CollectionType := ltEmpty;
  end
  else if rbExisting.Checked then
    FPParams^.Operation := otExisting
      else FPParams^.Operation := otInpx;

  Result := True;
end;

end.

