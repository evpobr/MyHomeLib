{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 1.4                                                                  }
{                                                                              }
{ Copyright (c) 2009 Aleksey Penkov  alex.penkov@gmail.com                     }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit unit_Lib_Updates;

interface

uses
  Windows,
  Classes,
  SysUtils,
  IdHTTP;

type

  TUpdateInfo = class(TCollectionItem)
  private

    FName: string;
    FVersionFile: string;
    FUpdateFile:  string;

    FVersion: integer;
    FCode: Integer;

    FCollectionID: integer;

    FFull: boolean;
    FAvailable: boolean;

  public

    function CheckCodes (t, id: integer): boolean;
    function CheckVersion(Version: integer): boolean;

    property Version: integer read FVersion write FVersion;
    property Code: Integer read FCode write FCode;
    property FileName:string read FUpdateFile;
    property Full:boolean read FFull write FFull;
    property Name:string read FName;
    property CollectionID: integer read FCollectionID;
    property Available: boolean read FAvailable;

  end;

  TUpdateInfoList = class(TCollection)
  private

    FURL: string;
    FPath: string;

    function GetUpdate(Index: Integer): TUpdateInfo;
    procedure SetUpdate(Index: Integer; const Value: TUpdateInfo);

    procedure SetURL(Value: string);

    function AddUpdate: TUpdateInfo;

  public
    constructor Create;

    procedure Add(const Name: string;
                  const VerFile: string;
                  const UpdateFile: string;
                  const Full: boolean;
                  const Code: Integer);

    procedure CheckVersions;

    function DownloadUpdate(Index: integer; HTTP: TidHTTP):boolean;

    property Items[Index: Integer]: TUpdateInfo read GetUpdate write SetUpdate; default;

    property URL: string write SetURL;

    property Path: string write FPath;

  end;



implementation

uses  unit_Globals;

{ TUpdateInfoList }

procedure TUpdateInfoList.Add(const Name: string;
                  const VerFile: string;
                  const UpdateFile: string;
                  const Full: boolean;
                  const Code: Integer);

var
  Update: TUpdateInfo;
begin
  BeginUpdate;
  try
    UPdate := AddUpdate;
    try
      Update.FName := Name;
      Update.FVersionFile := VerFile;
      Update.FUpdateFile := UpdateFile;
      Update.FCode := Code;
    except
      Update.Free;
      raise;
    end;
  finally
    EndUpdate;
  end;
end;

function TUpdateInfoList.AddUpdate: TUpdateInfo;
begin
  Result := TUpdateInfo(inherited Add);
end;

procedure TUpdateInfoList.CheckVersions;
var
  HTTP: TIdHTTP;
  LF: TMemoryStream;
  SL: TStringList;
  i : integer;
  URL: string;
begin
  LF := TMemoryStream.Create;
  HTTP := TidHTTP.Create(nil);
  try
    SetProxySettings(HTTP);
    for I := 0 to Count - 1 do
    begin
      URL := FURL + Items[i].FVersionFile;
      try
        LF.Clear;
        HTTP.Get(URL, LF);
        SL := TStringList.Create;
        try
          LF.Seek(0, soFromBeginning);
          SL.LoadFromStream(LF);
          if SL.Count > 0 then
            Items[i].FVersion := StrToInt(SL[0]);
        finally
          SL.Free;
        end;
      except
      end;
    end; // for
  finally
    LF.Free;
    HTTP.Free;
  end;
end;

constructor TUpdateInfoList.Create;
begin
  inherited Create(TUpdateInfo);
end;

function TUpdateInfoList.DownloadUpdate(Index: integer; HTTP: TidHTTP): boolean;
var
  MS: TMemoryStream;
  URL: string;
  FileName: string;

begin
  Result := False;

  URL := FURL + Items[Index].FUpdateFile;
  FileName := FPath + Items[Index].FUpdateFile;

  MS := TMemoryStream.Create;
  try
    try
        //
        // Возможно, файл уже был скачан. Если нет - скачать.
        //
        if not FileExists(FileName) then
        begin
          HTTP.Get(URL, MS);
          MS.SaveToFile(FileName);
        end;
        Result := True;
      except
      end;
  finally
    MS.Free;
  end;
end;

function TUpdateInfoList.GetUpdate(Index: Integer): TUpdateInfo;
begin
  Result := TUpdateInfo(inherited Items[Index]);
end;

procedure TUpdateInfoList.SetUpdate(Index: Integer; const Value: TUpdateInfo);
begin
  inherited Items[Index] := Value;
end;

procedure TUpdateInfoList.SetURL(Value: string);
begin
  FURL := InclideUrlSlash(Value);
end;

{ TUpdateInfo }

function TUpdateInfo.CheckCodes(t, id: integer): boolean;
begin
  Result := (t = FCode);
  if Result then FCollectionID := Id;
end;


function TUpdateInfo.CheckVersion(Version: integer): boolean;
begin
  Result := (FVersion > Version);
  FAvailable := Result;
end;

end.
