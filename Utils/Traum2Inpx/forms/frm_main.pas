unit frm_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, ZipForge, ExtCtrls;

type
  TfrmMain = class(TForm)
    Zip: TZipForge;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    FFileList: TStringList;
    FInputDir: string;
    FDBDir: string;
    FAppPath: string;
    FInpPath: string;
    FOutPath: string;
    procedure Pack;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses dm_main;

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  dmTraum.ImportData(FInputDir);
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  dmTraum.PrepareINP(FInpPath);
  Pack;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FAppPath := ExtractFilePath(Application.ExeName);

  FInputDir := FAppPath + '\Input\';
  FDBDir := FAppPath + 'DB\';
  FInpPath := FAppPath + 'INP\';
  FOutPath := FAppPath + 'ARCH\';

  dmTraum.Progress := ProgressBar1;
  dmTraum.Info := Label1;
  dmTraum.Connect;
end;

procedure TfrmMain.Pack;
const
  Structure = 'AUTHOR;TITLE;SERIES;SERNO;GENRE;LIBID;INSNO;FILE;FOLDER;EXT;SIZE;LANG;DATE;';
  CommentFB2 = 'Traum [FB2]' + #13#10 + 'traum_local_fb2' + #13#10 + '0' + #13#10 + 'Библиотека Траума. FB2';
  CommentNonFB2 = 'Traum [NonFB2]' + #13#10 + 'traum_local_fb2' + #13#10 + '1' + #13#10 + 'Библиотека Траума. Не-FB2';
  CommentALL = 'Traum [ALLBOOKS]' + #13#10 + 'traum_local_fb2' + #13#10 + '1' + #13#10 + 'Библиотека Траума. Все книги';

  FileList = 'structure.info' + #13#10 + 'collection.info' + #13#10 + 'version.info';

var

  SL: TStringList;
  Year, Month, Day: Word;


  procedure MakeZip(FN, Comment: string);
  var
    i: Integer;
  begin
    if FileExists(FOutPath + FN) then DeleteFile(FOutPath + FN);
      Zip.CompressionLevel := clMax;

    Zip.FileName := FOutPath + FN;
    Zip.OpenArchive(fmCreate);
    Zip.BaseDir := FInpPath;
    for i := 0 to FFileList.Count - 1 do
      Zip.AddFiles(FFileList[i]);


    Zip.Comment := String(Comment);
    Zip.CloseArchive;
  end;


begin
  FFileList := TStringList.Create;
  Label1.Caption := 'Упаковка ...'; Label1.Repaint;
  // общая часть
  SL := TStringList.Create;
  try
    SL.Text := Structure;
    SL.SaveToFile(FInpPath + 'structure.info', TEncoding.UTF8);
    FFileList.Add('structure.info');


    DecodeDate(Now, Year, Month, Day);
    SL.Text := Format('%d%.2d%.2d', [Year, Month, Day]);
    SL.SaveToFile(FInpPath + 'version.info');
    FFileList.Add('version.info');

    // fb2

    FFileList.text := FileList;

    SL.Text := CommentFB2;
    SL.SaveToFile(FInpPath + 'collection.info', TEncoding.UTF8);
    FFileList.Add('collection.info');

    FFileList.Add('books_fb2_ru.inp');
    FFileList.Add('books_fb2_en.inp');

    MakeZip('traum_local_fb2.inpx', CommentFB2);

    // all
    FFileList.text := FileList;

    SL.Text := CommentAll;
    SL.SaveToFile(FInpPath + 'collection.info', TEncoding.UTF8);
    FFileList.Add('collection.info');

    FFileList.Add('books_fb2_ru.inp');
    FFileList.Add('books_fb2_en.inp');
    FFileList.Add('books_nonfb2_ru.inp');
    FFileList.Add('books_nonfb2_en.inp');

    MakeZip('traum_local_all.inpx', CommentALL);


    // non-fb2
    FFileList.text := FileList;

    SL.Text := CommentAll;
    SL.SaveToFile(FInpPath + 'collection.info', TEncoding.UTF8);
    FFileList.Add('collection.info');

    FFileList.Add('books_nonfb2_ru.inp');
    FFileList.Add('books_nonfb2_en.inp');

    MakeZip('traum_local_nonfb2.inpx', CommentNonFB2);

  finally
    SL.Free;
    FFileList.Free;
    Label1.Caption := 'Готово';
    ProgressBar1.Position := 0;
  end;
end;


end.
