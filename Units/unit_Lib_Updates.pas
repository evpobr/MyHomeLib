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
    FURL : string;
    FVersionFile: string;
    FUpdateFile:  string;

    FVersion: integer;
    FCode: Integer;

    FCollectionID: integer;

    FFull: boolean;
    FAvailable: boolean;
    FLocal: boolean;

  public

    function CheckCodes (Name: string; t, id: integer): boolean;
    function CheckVersion(Path: string; Version: integer): boolean;

    property Version: integer read FVersion write FVersion;
    property Code: Integer read FCode write FCode;
    property FileName:string read FUpdateFile;
    property Full:boolean read FFull write FFull;
    property Name:string read FName;
    property CollectionID: integer read FCollectionID;
    property Available: boolean read FAvailable;
    property Local: boolean read FLocal;
    property URL: string read FURL;

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
                  const URL : string;
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
                  const URL : string;
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
      UPdate.FURL := FURL;
      Update.FVersionFile := VerFile;
      Update.FUpdateFile := UpdateFile;
      Update.FCode := Code;
      Update.FFull := Full;
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
      if Items[i].FVersionFile = '' then Continue;

      if Items[i].URL = '' then
          URL := FURL + Items[i].FVersionFile
        else
          URL := Items[i].URL + Items[i].FVersionFile;

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
  if Items[Index].URL = '' then
      URL := FURL + Items[Index].FUpdateFile
    else
      URL := Items[Index].URL + Items[Index].FUpdateFile;
  FileName := FPath + Items[Index].FUpdateFile;
  MS := TMemoryStream.Create;
  try
    try
      HTTP.Get(URL, MS);
      MS.SaveToFile(FileName);
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

function TUpdateInfo.CheckCodes(Name: string; t, id: integer): boolean;
begin
  Result := (t = FCode) and (Name = FName);
  if Result then FCollectionID := Id;
end;

function TUpdateInfo.CheckVersion(Path: string; Version: integer): boolean;
begin
  FLocal := FileExists(Path + FileName);
  if FLocal then
    Result := True
  else
    Result := (FVersion > Version);
  FAvailable := Result;
end;

end.
