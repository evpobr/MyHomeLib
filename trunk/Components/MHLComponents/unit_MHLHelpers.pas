(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Authors Aleksey Penkov   alex.penkov@gmail.com
  *         Nick Rymanov     nrymanov@gmail.com
  *
  * History
  * NickR 07.05.2010         Добавил функцию определения формата стрима. Пока она не определяет ZIP.
  *
  ****************************************************************************** *)

unit unit_MHLHelpers;

interface

uses
  Classes,
  SysUtils,
  ZipForge;

//
// String helpers
//
function DecodeBase64(const CinLine: AnsiString): AnsiString;

//
// Stream helpers
//
type
  TStreamFormat = (
    sfUnknown,
    sfText,
    sfRichText,
    sfBitmap,
    sfGif,
    sfJPEGImage,
    sfTiff,
    sfPngImage,
    sfMetafile,
    sfPDF,
    sfHTML,
    fsIcon
  );

function DetectStreamFormat(Stream: TStream): TStreamFormat;

//
// ZIP helpers
//
function GetFileNameZip(Zip: TZipForge; No: Integer): string;

function GetFormattedSize(sizeInBytes: Integer; showBytes: Boolean = False): string;

implementation

uses
  Windows,
  ActiveX,
  UrlMon,
  Graphics;

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

function DetectStreamFormat(Stream: TStream): TStreamFormat;
  function TestICO: Boolean;
  const
    RC3_STOCKICON = 0;
    RC3_ICON = 1;
  var
    Header: TCursorOrIcon;
  begin
    Stream.Seek(0, soFromBeginning);
    Result :=
      (Stream.Read(Header, SizeOf(Header)) = SizeOf(Header)) and
      (Header.wType in [RC3_STOCKICON, RC3_ICON]);
  end;

var
  Buffer: array[0..255] of Byte;
  sz: Longint;
  pwszMIME: PWideChar;
  strMIME: string;
begin
  Assert(Assigned(Stream));

  Result := sfUnknown;
  sz := Stream.Read(Buffer, SizeOf(Buffer));
  try
    if NOERROR = FindMimeFromData(nil, nil, @Buffer, sz, nil, 0, pwszMIME, 0) then
    try
      strMIME := pwszMIME;

      if (strMIME = CFSTR_MIME_TEXT) then
        Result := sfText
      else if (strMIME = CFSTR_MIME_RICHTEXT) then
        Result := sfRichText
      else if (strMIME = CFSTR_MIME_X_BITMAP) or (strMIME = CFSTR_MIME_BMP) then
        Result := sfBitmap
      else if (strMIME = CFSTR_MIME_GIF) then
        Result := sfGif
      else if (strMIME = CFSTR_MIME_PJPEG) or (strMIME = CFSTR_MIME_JPEG) then
        Result := sfJPEGImage
      else if (strMIME = CFSTR_MIME_TIFF) then
        Result := sfTiff
      else if (strMIME = CFSTR_MIME_X_PNG) then
        Result := sfPngImage
      else if (strMIME = CFSTR_MIME_X_EMF) or (strMIME = CFSTR_MIME_X_WMF) then
        Result := sfMetafile
      else if (strMIME = CFSTR_MIME_PDF) then
        Result := sfPDF
      else if (strMIME = CFSTR_MIME_HTML) then
        Result := sfHTML
      else if TestICO then
        Result := fsIcon;
    finally
      CoTaskMemFree(pwszMIME);
    end;
  finally
    Stream.Seek(0, soFromBeginning);
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
  c1: Extended;
  c2: Integer;
  nIndex: Integer;
  strSz: string;
  eSize: Extended;
begin
  if (sizeInBytes div GIGABYTE) <> 0 then
  begin
    c1 := sizeInBytes / GIGABYTE;
    c2 := (sizeInBytes mod GIGABYTE * 10) div GIGABYTE;
    nIndex := 0;
  end
  else if (sizeInBytes div MEGABYTE) <> 0 then
  begin
    c1 := sizeInBytes / MEGABYTE;
    c2 := (sizeInBytes mod MEGABYTE * 10) div MEGABYTE;
    nIndex := 1;
  end
  else if (sizeInBytes div KILOBYTE) <> 0 then
  begin
    c1 := sizeInBytes / KILOBYTE;
    c2 := (sizeInBytes mod KILOBYTE * 10) div KILOBYTE;
    nIndex := 2;
  end
  else
  begin
    c1 := sizeInBytes;
    c2 := 0;
    nIndex := 3;
  end;

  Assert((Low(strSizes) <= nIndex) and (nIndex <= High(strSizes)));

  if c2 = 0 then
    strSz := Format('%.0n', [c1])
  else
    strSz := Format('%.1n', [c1]);

  if (nIndex < 3) and showBytes then
  begin
    eSize := sizeInBytes;
    Result := Format('%s %s (%.0n Bytes)', [strSz, strSizes[nIndex], eSize])
  end
  else
    Result := Format('%s %s', [strSz, strSizes[nIndex]]);
end;

end.
