(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
  * Created                  20.08.2008
  * Description              
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

unit frm_statistic;

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
  ComCtrls,
  StdCtrls,
  ExtCtrls;

type
  TfrmStat = class(TForm)
    btnClose: TButton;
    lvInfo: TListView;

  public
    procedure LoadCollectionInfo;
  end;

var
  frmStat: TfrmStat;

implementation

uses
  dm_user,
  unit_Consts,
  CommCtrl,
  unit_Database;

resourcestring
  rstrUnknown = 'unknown';

{$R *.dfm}

procedure TfrmStat.LoadCollectionInfo;
var
  Version: string;
  AuthorsCount: Integer;
  BooksCount: Integer;
  SeriesCount: Integer;
begin
  if DMUser.ActiveCollectionInfo.Version = UNVERSIONED_COLLECTION then
    Version := rstrUnknown
  else
    Version := IntToStr(DMUser.ActiveCollectionInfo.Version);
  GetActiveBookCollection.GetStatistics(AuthorsCount, BooksCount, SeriesCount);

  lvInfo.Items[0].SubItems[0] := DMUser.ActiveCollectionInfo.Name;
  lvInfo.Items[1].SubItems[0] := DateToStr(DMUser.ActiveCollectionInfo.CreationDate);
  lvInfo.Items[2].SubItems[0] := Version;
  lvInfo.Items[3].SubItems[0] := DMUser.ActiveCollectionInfo.Notes;

  lvInfo.Items[4].SubItems[0] := IntToStr(AuthorsCount);
  lvInfo.Items[5].SubItems[0] := IntToStr(BooksCount);
  lvInfo.Items[6].SubItems[0] := IntToStr(SeriesCount);

  { TODO -oNickR -cCore : создать функцию в helpers }
  ListView_SetColumnWidth(lvInfo.Handle, 0, LVSCW_AUTOSIZE);
  ListView_SetColumnWidth(lvInfo.Handle, 1, LVSCW_AUTOSIZE);
end;

end.
