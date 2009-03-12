
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}


unit frm_statistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLabel, ExtCtrls, RzPanel;

type
  TfrmStat = class(TForm)
    RzBitBtn1: TButton;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    lblName: TRzLabel;
    lblDate: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    lblAuthors: TRzLabel;
    RzLabel3: TRzLabel;
    lblBooks: TRzLabel;
    RzLabel4: TRzLabel;
    lblSeries: TRzLabel;
    RzLabel6: TRzLabel;
    lblVer: TRzLabel;

  public
    procedure ShowInfo;
  end;

var
  frmStat: TfrmStat;

implementation

uses dm_user, unit_Settings, unit_Consts, dm_main;

{$R *.dfm}

procedure TfrmStat.ShowInfo;
var
  AuthorsCount: Integer;
  BooksCount: Integer;
  SeriesCount: Integer;
begin
  lblName.Caption := DMUser.ActiveCollection.Name;

  if DMUser.ActiveCollection.Version = UNVERSIONED_COLLECTION then
    lblVer.Caption := 'unknown'
  else
    lblVer.Caption := IntToStr(DMUser.ActiveCollection.Version);
  lblDate.Caption := DateToStr(DMUser.ActiveCollection.CreationDate);

  DMMain.GetStatistics(AuthorsCount, BooksCount, SeriesCount);
  lblAuthors.Caption := IntToStr(AuthorsCount);
  lblBooks.Caption := IntToStr(BooksCount);
  lblSeries.Caption := IntToStr(SeriesCount);
end;

end.
