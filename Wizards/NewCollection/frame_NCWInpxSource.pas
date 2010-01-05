{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit frame_NCWInpxSource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frame_InteriorPageBase, StdCtrls, ExtCtrls, unit_StaticTip, unit_NCWParams,
  Mask, RzEdit, RzBtnEdt, ComCtrls;

type

  TCollectionDesc = record
    Group: integer;
    Title: string;
    Desc: string;
    INPX: string;
  end;

  TframeNCWInpxSource = class(TInteriorPageBase)
    Panel1: TPanel;
    pageHint: TMHLStaticTip;
    rbLocal: TRadioButton;
    edINPXPath: TRzButtonEdit;
    rbDownload: TRadioButton;
    lvCollections: TListView;
    procedure OnSetCollectionType(Sender: TObject);
    procedure edINPXPathButtonClick(Sender: TObject);
    procedure lvCollectionsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    FCollections: array of TCollectionDesc;
    FGroups : array of string;

    procedure LoadDescriptions;
  public
    function Activate(LoadData: Boolean): Boolean; override;
    function Deactivate(CheckData: Boolean): Boolean; override;
    procedure FillList;
  end;

var
  frameNCWInpxSource: TframeNCWInpxSource;

resourcestring
  SERVERDOWNLOAD = 'Выбранный файл INPX будет скачан с сервера.';
  LOCAL = 'Коллекция на основе файла *.inpx. Укажите путь к файлу.';

implementation

uses
  dm_user,
  unit_settings,
  unit_Globals,
  unit_Helpers,
  ZipForge,
  IniFiles;

{$R *.dfm}

const

  INPX_SECTION = 'INPX';
  INPX_GROUP_SECTION = 'GROUPS';
  INPX_KEY_PREFIX = 'Inpx';
  INPX_GROUP_KEY_PREFIX = 'Group';

  URL = 'http://home-lib.net/download/inpx/test/';

  DefaultGroups : array [0..2] of string = ('Библиотека Lib.rus.ec','Библиотека flibusta.net','Библиотека Траума');

  DefaultCollections : array [0 .. 8] of TCollectionDesc = (
    (Group: 0; Title: 'Lib.rus.ec [FB2]'; Desc: 'Архивы FB2 (fb2-xxxxxx-xxxxxx.zip)'; INPX: 'librusec.inpx'),
    (Group: 0; Title: 'Lib.rus.ec [USR]'; Desc: 'Архивы USR (usr-xxxxxx-xxxxxx.zip)'; INPX: 'librusec_usr.inpx'),
    (Group: 0; Title: 'Lib.rus.ec [ALLBOOKS]'; Desc: 'Все архивы (fb2-xxxxxx-xxxxxx.zip и usr-xxxxxx-xxxxxx.zip)'; INPX: 'librusec_allbooks.inpx'),
    (Group: 0; Title: 'Lib.rus.ec Online [FB2]'; Desc: 'Книги скачиваются по запросу с серввера lib.rus.ec (необходима регистрация)'; INPX: 'librusec_online.inpx'),
    (Group: 1; Title: 'Flibusta OnLine [FB2]'; Desc: 'Книги скачиваются по запросу с сервера flibusta.net'; INPX: 'flibusta_online.inpx'),
    (Group: 2; Title: 'Traum 2.11 [FB2]'; Desc: 'Библиотека Траума 2.11'; INPX: 'Traum_2-11.inpx'),
    (Group: 2; Title: 'Traum 2.12 [FB2]'; Desc: 'Библиотека Траума 2.12'; INPX: 'Traum_2-12.inpx'),
    (Group: 2; Title: 'Traum 2.13 [FB2]'; Desc: 'Библиотека Траума 2.13 (только FB2)'; INPX: 'Traum_2-13_fb2.inpx'),
    (Group: 2; Title: 'Traum 2.13 [ALLBOOKS]'; Desc: 'Библиотека Траума 2.13 (Полная)'; INPX: 'Traum_2-13_full.inpx')
    );

function TframeNCWInpxSource.Activate(LoadData: Boolean): Boolean;
begin
  if LoadData then
  begin
    FillList;
    rbLocal.Checked := True;
    OnSetCollectionType(rbLocal);
  end;
  Result := True;
end;

function TframeNCWInpxSource.Deactivate(CheckData: Boolean): Boolean;
begin
  if rbLocal.Checked then
  begin
    FPParams^.INPXFile := edINPXPath.Text;
  end
  else
    FPParams^.Operation := otDownload;

  Result := True;
end;

procedure TframeNCWInpxSource.edINPXPathButtonClick(Sender: TObject);
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
  end;
end;



procedure TframeNCWInpxSource.FillList;
var
  I: Integer;
  G : TListGroup;
  Item: TListItem;
begin
  LoadDescriptions;
  lvCollections.Groups.Clear;
  lvCollections.Items.Clear;
  for I := 0 to High(FGroups) do
  begin
    G := lvCollections.Groups.Add;
    G.Header := FGroups[i];
  end;

  for I := 0 to High(FCollections) do
  begin
    Item := lvCollections.Items.Add;
    Item.Caption := FCollections[i].Title;
    Item.GroupID := FCollections[i].Group;
  end;

end;

procedure TframeNCWInpxSource.LoadDescriptions;
var
  i: Integer;
  sl: TStringList;
  slHelper: TStringList;
  INIFile: TMemIniFile;
begin
  try
    INIFile := TMemIniFile.Create(Settings.WorkPath + 'collections.ini');
    INIFile.Encoding := TEncoding.UTF8;

    sl := TStringList.Create;

    iniFile.ReadSection(INPX_GROUP_SECTION, sl);
    //     обрабатываем файл
    if sl.Count > 0 then
    begin
      SetLength(FGroups, sl.Count);
      for i := 0 to sl.Count - 1 do
        if Pos(INPX_GROUP_KEY_PREFIX, sl[i]) = 1 then
            FGroups[i] := iniFile.ReadString(INPX_GROUP_SECTION, sl[i], '');

    end // if
    else
    begin
      //     Добавим группы по умолчанию
    end;


    iniFile.ReadSection(INPX_SECTION, sl);
    //     обрабатываем файл
    if sl.Count > 0 then
    begin
      SetLength(FCollections, sl.Count);
      slHelper := TStringList.Create;
      try
        slHelper.QuoteChar := '"';
        slHelper.Delimiter := ';';
        slHelper.StrictDelimiter := True;
        for i := 0 to sl.Count - 1 do
        begin
          if Pos(INPX_KEY_PREFIX, sl[i]) = 1 then
          begin
            slHelper.DelimitedText := iniFile.ReadString(INPX_SECTION, sl[i], '');
            if slHelper.Count > 4 then
            begin
              FCollections[i].Group := StrToInt(slHelper[0]);
              FCollections[i].Title := slHelper[1];
              FCollections[i].Desc  := slHelper[2];
              FCollections[i].Inpx  := slHelper[3];
            end;
          end;
        end;
      finally
        slHelper.Free;
      end;
    end // if
    else
    begin
      //     Добавим inpx по умолчанию
//      SetLength(FCollections, 9);
//      FCollections := DefaultCollections;
    end;
  finally
    sl.Free;
    IniFile.Free;
  end;
end;

procedure TframeNCWInpxSource.lvCollectionsChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  pageHint.Caption := FCollections[Item.Index].Desc;
  FPParams^.INPXFile := Settings.WorkPath + FCollections[Item.Index].INPX;
  FPPArams^.INPXUrl := URL + FCollections[Item.Index].INPX;
end;

procedure TframeNCWInpxSource.OnSetCollectionType(Sender: TObject);
begin
  if Sender = rbLocal then
    pageHint.Caption := LOCAL
  else pageHint.Caption := SERVERDOWNLOAD;

  edINPXPath.Enabled := rbLocal.Checked;
  lvCollections.Enabled := rbDownload.Checked;
end;

end.

