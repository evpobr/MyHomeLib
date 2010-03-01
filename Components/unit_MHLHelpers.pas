(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
  *
  ****************************************************************************** *)

unit unit_MHLHelpers;

interface

uses
  SysUtils,
  ZipForge;

//
// String helpers
//
function DecodeBase64(const CinLine: AnsiString): AnsiString;

//
// ZIP helpers
//
function GetFileNameZip(Zip: TZipForge; No: Integer): string;

function GetFormattedSize(sizeInBytes: Integer; showBytes: Boolean = False): string;

implementation

function DecodeBase64(const CinLine: AnsiString): AnsiString;
const
  RESULT_ERROR = -2;
var
  inLineIndex: Integer;
  c: AnsiChar;
  x: SmallInt;
  c4: Word;
  StoredC4: array [0 .. 3] of SmallInt;
  InLineLength: Integer;
begin
  Result := '';
  inLineIndex := 1;
  c4 := 0;
  InLineLength := Length(CinLine);

  while inLineIndex <= InLineLength do
  begin
    while (inLineIndex <= InLineLength) and (c4 < 4) do
    begin
      c := CinLine[inLineIndex];
      case c of
        '+':        x := 62;
        '/':        x := 63;
        '0' .. '9': x := Ord(c) - (Ord('0') - 52);
        '=':        x := -1;
        'A' .. 'Z': x := Ord(c) - Ord('A');
        'a' .. 'z': x := Ord(c) - (Ord('a') - 26);
      else
        x := RESULT_ERROR;
      end;
      if x <> RESULT_ERROR then
      begin
        StoredC4[c4] := x;
        Inc(c4);
      end;
      Inc(inLineIndex);
    end;

    if c4 = 4 then
    begin
      c4 := 0;
      Result := Result + AnsiChar((StoredC4[0] shl 2) or (StoredC4[1] shr 4));
      if StoredC4[2] = -1 then
        Exit;
      Result := Result + AnsiChar((StoredC4[1] shl 4) or (StoredC4[2] shr 2));
      if StoredC4[3] = -1 then
        Exit;
      Result := Result + AnsiChar((StoredC4[2] shl 6) or (StoredC4[3]));
    end;
  end;
end;

function GetFileNameZip(Zip: TZipForge; No: Integer): string;
var
  i: Integer;
  ArchItem: TZFArchiveItem;
begin
  i := 0;
  if (Zip.FindFirst('*.*', ArchItem, faAnyFile - faDirectory)) then
    while i <> No do
    begin
      Zip.FindNext(ArchItem);   { TODO : стоит проверять результат этого вызова }
      Inc(i);
    end;
  Result := ArchItem.FileName;
end;

function GetFormattedSize(sizeInBytes: Integer; showBytes: Boolean = False): string;
const
  KILOBYTE = 1024;
  MEGABYTE = KILOBYTE * KILOBYTE;
  GIGABYTE = MEGABYTE * KILOBYTE;

  strSizes: array [0 .. 3] of string = ('GB', 'MB', 'KB', 'Bytes');
var
  c1: Integer;
  c2: Integer;
  nIndex: Integer;
  strSz: string;
begin
  c1 := 0;
  c2 := 0;
  nIndex := -1;

  if (sizeInBytes div GIGABYTE) <> 0 then
  begin
    c1 := sizeInBytes div GIGABYTE;
    c2 := (sizeInBytes mod GIGABYTE * 10) div GIGABYTE;
    nIndex := 0;
  end
  else if (sizeInBytes div MEGABYTE) <> 0 then
  begin
    c1 := sizeInBytes div MEGABYTE;
    c2 := (sizeInBytes mod MEGABYTE * 10) div MEGABYTE;
    nIndex := 1;
  end
  else if (sizeInBytes div KILOBYTE) <> 0 then
  begin
    c1 := sizeInBytes div KILOBYTE;
    c2 := (sizeInBytes mod KILOBYTE * 10) div KILOBYTE;
    nIndex := 2;
  end
  else
  begin
    c1 := sizeInBytes;
    c2 := 0;
    nIndex := 3;
  end;

  // ASSERT(-1 != nIndex && (size_t)nIndex < NR_ELEMENTS(strSizes));

  if c2 = 0 then
    strSz := Format('%u', [c1])
  else
    strSz := Format('%u.%u', [c1, c2]);

  if (nIndex < 3) and showBytes then
    Result := Format('%s %s (%u Bytes)', [strSz, strSizes[nIndex], sizeInBytes])  { TODO : форматировать байты с разделением на группы }
  else
    Result := Format('%s %s', [strSz, strSizes[nIndex]]);
end;

end.
