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
  Classes,
  Controls,
  Forms,
  ComCtrls,
  StdCtrls,
  unit_Interfaces;

type
  TfrmStat = class(TForm)
    btnClose: TButton;
    lvInfo: TListView;

  public
    procedure LoadCollectionInfo(const Collection: IBookCollection);
  end;

var
  frmStat: TfrmStat;

implementation

uses
  SysUtils,
  unit_Consts,
  unit_Helpers,
  unit_SystemDatabase;

resourcestring
  rstrUnknown = 'unknown';

{$R *.dfm}

procedure TfrmStat.LoadCollectionInfo(const Collection: IBookCollection);
var
  Version: string;
  AuthorsCount: Integer;
  BooksCount: Integer;
  SeriesCount: Integer;
  SystemData: ISystemData;
begin
  Assert(Assigned(Collection));

  SystemData := GetSystemData;
  if SystemData.GetActiveCollectionInfo.Version = UNVERSIONED_COLLECTION then
    Version := rstrUnknown
  else
    Version := IntToStr(SystemData.GetActiveCollectionInfo.Version);
  Collection.GetStatistics(AuthorsCount, BooksCount, SeriesCount);

  //
  // Заполним данные
  //
  lvInfo.Items[0].SubItems[0] := SystemData.GetActiveCollectionInfo.Name;
  lvInfo.Items[1].SubItems[0] := DateToStr(SystemData.GetActiveCollectionInfo.CreationDate);
  lvInfo.Items[2].SubItems[0] := Version;
  lvInfo.Items[3].SubItems[0] := SystemData.GetActiveCollectionInfo.Notes;

  lvInfo.Items[4].SubItems[0] := IntToStr(AuthorsCount);
  lvInfo.Items[5].SubItems[0] := IntToStr(BooksCount);
  lvInfo.Items[6].SubItems[0] := IntToStr(SeriesCount);

  lvInfo.AutosizeColumn(0);
  lvInfo.AutosizeColumn(1);
end;

end.
