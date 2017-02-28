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
  Classes;
type

  TStreamSource = record
    Name: string;
    Stream: TStream;
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

end.
