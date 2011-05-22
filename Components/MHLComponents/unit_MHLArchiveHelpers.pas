(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2011 Aleksey Penkov
  *
  * Author(s)           Aleksey Penkov
  * Created             20.05.2011
  * Description
  *
  *
  * History
  *
  ****************************************************************************** *)

unit unit_MHLArchiveHelpers;

interface

uses
  Classes,
  ZipForge;
type

  TStreamSource = record
    Name: string;
    Stream: TStream;
  end;

  TMHLZip = class(TZipForge)
    private
      FLast: TZFArchiveItem;

      function GetLastName: string;
      function GetLastSize: integer;
    public
      constructor Create(AFileName: string);
      function GetFileNameById(No: integer): string;
      procedure ExtractToStream(No: integer; Stream: TStream); overload;
      function GetIdxByExt(Ext: string): integer;
      function Find(FN: string):boolean;  overload;
      function Find(No: integer): boolean; overload;
      function FindNext: boolean; overload;
      function ExtractToString(FileName: string):string;

      property LastName: string read GetLastName;
      property LastSize: integer read GetLastSize;
  end;

  // Supported archive formats (only ones that work for both input and output)
  TArchiveFormat = (
    afZip
  );

function IsArchiveExt(const FileName: string): Boolean;

const
  ZIP_EXTENSION = '.zip';

implementation

uses
  SysUtils,
  StrUtils,
  WideStrUtils,
  IOUtils;

function IsArchiveExt(const FileName: string): Boolean;
var
  ext: string;
begin
  ext := AnsiLowercase(ExtractFileExt(FileName));
  Result := (ext = ZIP_EXTENSION);
end;

{ TMHLZip }

procedure TMHLZip.ExtractToStream(No: integer; Stream: TStream);
begin
  GetFileNameByID(No);
  ExtractToStream(FLast.FileName, Stream);
end;

function TMHLZip.ExtractToString(FileName: string): string;
var
  binStream: TMemoryStream;
  strStream: TStringStream;
  S: String;
begin
  try
    binStream := TMemoryStream.Create;
    ExtractToStream(FileName, binStream);
    strStream := TStringStream.Create;
    try
      binStream.SaveToStream(strStream);
      S := strStream.DataString;
      if HasUTF8BOM(strStream.DataString) then
      begin
        Delete(S, 1, 3);
        Result := UTF8Decode(S);
      end
      else Result := S;
    finally
      FreeAndNil(strStream);
    end;
  finally
    FreeAndNil(binStream);
  end;
end;

function TMHLZip.Find(FN: string):boolean;
begin
  Result := FindFirst(FN, FLast, faAnyFile - faDirectory)
end;

function TMHLZip.Find(No: integer): boolean;
var
  i: integer;
begin
  i := 0;
  if (FindFirst('*.*', FLast, faAnyFile - faDirectory)) then
  while i <> No do
  begin
    FindNext(FLast);
    Inc(i);
  end;
  Result := True;
end;

function TMHLZip.FindNext: boolean;
begin
  Result := FindNext(FLast);
end;

function TMHLZip.GetFileNameById(No: integer): string;
var
  i: integer;
begin
  i := 0;
  if (FindFirst('*.*', FLast, faAnyFile - faDirectory)) then
  while i <> No do
  begin
    FindNext(FLast);
    Inc(i);
  end;
  Result := FLast.FileName;
end;

function TMHLZip.GetIdxByExt(Ext: string): integer;
var
  i: integer;
begin
  Result := -1;
  i := 0;
  if (FindFirst('*.*', FLast, faAnyFile - faDirectory)) then
  repeat
    if AnsiEndsStr(Ext, Flast.FileName) then
    begin
      Result := i;
      Break;
    end;
    inc(i);
  until FindNext(FLast);
end;

function TMHLZip.GetLastName: string;
begin
  Result := Flast.FileName;
end;

function TMHLZip.GetLastSize: integer;
begin
  Result := Flast.UncompressedSize;
end;

constructor TMHLZip.Create(AFileName: string);
begin
  Inherited Create(Nil);
  ExtractCorruptedFiles := False;
  CompressionLevel := clMax;
  CompressionMode := 9;
  SpanningMode := smNone;
  InMemory := False;
  Zip64Mode := zmAlways;
  UnicodeFilenames := True;
  EncryptionMethod := caPkzipClassic;

  FileName := AFileName;
  OpenArchive;
  FindFirst('*.*', FLast, faAnyFile - faDirectory);
end;

end.
