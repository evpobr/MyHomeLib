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
function GetFileNameZip(Zip: TZipForge; No: integer): string;

implementation

function DecodeBase64(const CinLine: ansistring): ansistring;
const
  RESULT_ERROR = -2;
var
  inLineIndex: Integer;
  c: AnsiChar;
  x: SmallInt;
  c4: Word;
  StoredC4: array[0..3] of SmallInt;
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
        '+': x := 62;
        '/': x := 63;
        '0'..'9': x := Ord(c) - (Ord('0') - 52);
        '=': x := -1;
        'A'..'Z': x := Ord(c) - Ord('A');
        'a'..'z': x := Ord(c) - (Ord('a') - 26);
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

function GetFileNameZip(Zip: TZipForge; No: integer): string;
var
  i: integer;
  ArchItem: TZFArchiveItem;
begin
  i := 0;
  if (Zip.FindFirst('*.*', ArchItem, faAnyFile - faDirectory)) then
  while i <> No do
  begin
    Zip.FindNext(ArchItem);
    Inc(i);
  end;
  Result := ArchItem.FileName;
end;



end.
