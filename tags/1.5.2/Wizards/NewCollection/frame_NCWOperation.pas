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
    procedure OnSetCollectionType(Sender: TObject);
  private

  public
    function Activate(LoadData: Boolean): Boolean; override;
    function Deactivate(CheckData: Boolean): Boolean; override;
  end;

var
  frameNCWOperation: TframeNCWOperation;

resourcestring

  CREATENEW = 'Выберите этот пункт для создания коллекций lib.rus.ec, коллекций на основе файлов inpx или пустых коллекций';
  ADDEXISTS = 'Подключить ранее созданную коллекцию. Необходим файл коллекции *.hlc';

implementation

uses dm_user;

{$R *.dfm}

procedure TframeNCWOperation.OnSetCollectionType(Sender: TObject);
begin
  if Sender = rbNew then
    pageHint.Caption := CREATENEW
  else if Sender = rbExisting then
    pageHint.Caption := ADDEXISTS
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
    FPParams^.Operation := otNew
  else {if rbExisting.Checked then}
    FPParams^.Operation := otExisting;

  Result := True;
end;

end.

