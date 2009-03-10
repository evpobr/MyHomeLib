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

unit frame_NCWCollectionType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frame_InteriorPageBase, StdCtrls, ExtCtrls, unit_StaticTip, unit_NCWParams,
  Mask, RzEdit, RzBtnEdt;

type
  TframeNCWCollectionType = class(TInteriorPageBase)
    Panel1: TPanel;
    rbLocal: TRadioButton;
    rbOnline: TRadioButton;
    rbGenesis: TRadioButton;
    pageHint: TMHLStaticTip;
    rbEmpty: TRadioButton;
    rbThirdParty: TRadioButton;
    edINPXPath: TRzButtonEdit;
    procedure OnSetCollectionType(Sender: TObject);
    procedure edINPXPathButtonClick(Sender: TObject);
    procedure GetCollectionDataFromINPX;
  private
    FColTitle : string;
    FColFile:   string;
  public
    function Activate(LoadData: Boolean): Boolean; override;
    function Deactivate(CheckData: Boolean): Boolean; override;
  end;

var
  frameNCWCollectionType: TframeNCWCollectionType;

resourcestring
  EMPTYCOLLECTION = 'Пустая коллекция';
  PRIVATECOLLECTION = 'Частная коллекция';
  LISTBASED = 'Создание коллекции на основе списков книг';
  SELECTTYPE = 'Укажите тип поключаемой коллекции';

  FROMDIFFERNTSOURCES = 'Создавайте такую коллекцию для хранения книг, полученных из различных источников.';
  FROMLIBRUSECARCH = 'Создавайте такую коллекцию если вы уже скачали архивы lib.rus.ec.';
  LIBRUSECDOWNLOAD = 'Книги будут скачиваться с сервера lib.rus.ec по мере необходимости.';
  SERVERDOWNLOAD = 'Книги будут скачиваться с сервера по мере необходимости.';
  THIRDPARTY = 'Коллекция на основе файла *.inpx. Укажите путь к файлу.';

implementation

uses dm_user,unit_settings, unit_globals, unit_Helpers, ZipForge;

{$R *.dfm}

function TframeNCWCollectionType.Activate(LoadData: Boolean): Boolean;
var
  rb: TRadioButton;
begin
  if LoadData then
  begin
    if FPParams^.Operation = otNew then
    begin
        rbEmpty.Caption := EMPTYCOLLECTION;
        SubTitle :=  LISTBASED
    end
    else
    begin
      SubTitle := PRIVATECOLLECTION;
      rbEmpty.Caption := SELECTTYPE;
    end;

    case FPParams^.CollectionType of
      ltEmpty: rb := rbEmpty;
      ltLRELocal: rb := rbLocal;
      ltLREOnline: rb := rbOnline;
      ltGenesis: rb := rbGenesis;
      ltThirdParty: rb := rbThirdParty;
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

function TframeNCWCollectionType.Deactivate(CheckData: Boolean): Boolean;
begin
  if rbEmpty.Checked then
    FPParams^.CollectionType := ltEmpty
  else if rbLocal.Checked then
    FPParams^.CollectionType := ltLRELocal
  else if rbOnline.Checked then
    FPParams^.CollectionType := ltLREOnline
  else if rbGenesis.Checked then
    FPParams^.CollectionType := ltGenesis
  else if rbThirdParty.Checked then
  begin
    FPParams^.CollectionType := ltThirdParty;
    FPParams^.DisplayName := FColTitle;
    FPParams^.UseDefaultName := False;
    FPParams^.CollectionFile := FColFile;
    FPParams^.UseDefaultLocation := False;
    FPParams^.INPXFile := edINPXPath.Text;
  end;
  Result := True;
end;

procedure TframeNCWCollectionType.edINPXPathButtonClick(Sender: TObject);
var
  key: TMHLFileName;
  AFileName: string;
begin
  key := fnOpenINPX;
  if FPParams^.Operation = otExisting then
    key := fnOpenCollection;

  if GetFileName(key, AFileName) then
  begin
    edINPXPath.Text := AFileName;
    GetCollectionDataFromINPX;
  end;
end;

procedure TframeNCWCollectionType.GetCollectionDataFromINPX;
var
  Zip: TZipForge;
  S  : ansistring;
  p: integer;
begin
  Zip := TZipForge.Create(self);
  try
    Zip.FileName := edINPXPath.Text;
    Zip.OpenArchive;
    S := Zip.Comment;
    Zip.CloseArchive;
  finally
    Zip.Free;
  end;
  p := pos(#13#10,S);
  FColTitle := copy(S,1,p - 1);
  delete(S,1,p + 1);
  FColFile := S;
end;

procedure TframeNCWCollectionType.OnSetCollectionType(Sender: TObject);
begin
  if Sender = rbEmpty then
    pageHint.Caption := FROMDIFFERNTSOURCES
  else if Sender = rbLocal then
    pageHint.Caption := FROMLIBRUSECARCH
  else if Sender = rbOnline then
    pageHint.Caption := LIBRUSECDOWNLOAD
  else if Sender = rbGenesis then
    pageHint.Caption := SERVERDOWNLOAD
  else if Sender = rbThirdParty then
  begin
    pageHint.Caption := THIRDPARTY;
  end;

  edINPXPath.Visible := (Sender = rbThirdParty );

end;

end.

