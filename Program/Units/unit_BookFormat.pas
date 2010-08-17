(* ***************************************************************************
 *
 * MyHomeLib
 *
 * Copyright (C) 2008-2010 Aleksey Penkov
 *
 * Author(s)           eg
 * Created             16.08.2010
 * Description         Utilities that handle book format-related logic.
 *
 * $Id$
 *
 * History
 *
 **************************************************************************** *)
unit unit_BookFormat;

interface

uses
  unit_Globals;

type
  TBookFormat = (
    bfFb2,    // A pure FB2 file
    bfFb2Zip, // An FB2 packed in a ZIP
    bfFbd,    // An (FBD + a raw book file) packed together in a zip
    bfRaw     // A raw file = any other book format
  );

  TBookFormatUtils = class
  public
    class function GetBookFormat(const CollectionRoot: string; const BookRecord: TBookRecord): TBookFormat; overload;
    class function GetBookFileName(const CollectionRoot: string; const BookRecord: TBookRecord): string; overload;
  end;

implementation

uses
  ZipForge,
  IOUtils,
  SysUtils,
  dm_collection,
  dm_user,
  unit_Consts;

class function TBookFormatUtils.GetBookFormat(const CollectionRoot: string; const BookRecord: TBookRecord): TBookFormat;
var
  BookContainer: string;
  PathLen: Integer;
  LongFileName: string;
begin
  Result := bfRaw; // default
  BookContainer := TPath.Combine(CollectionRoot, BookRecord.Folder);
  PathLen := Length(BookContainer);

  if
    (PathLen = 0) or
    (BookContainer[PathLen] = TPath.DirectorySeparatorChar) or
    (BookContainer[PathLen] = TPath.AltDirectorySeparatorChar) then
  begin
    //BookContainer is either empty or a path
    LongFileName := TPath.Combine(BookContainer, BookRecord.FileName);

    if ExtractFileExt(LongFileName) = ZIP_EXTENSION then
      Result := bfFbd
    else if BookRecord.FileExt = FB2_EXTENSION then
      Result := bfFb2
  end
  else
  begin
    if ExtractFileExt(BookContainer) = ZIP_EXTENSION then
      Result := bfFb2Zip;
  end;

  if (Result = bfRaw) and (BookRecord.FileExt = FB2_EXTENSION) then
    Result := bfFb2
end;

class function TBookFormatUtils.GetBookFileName(const CollectionRoot: string; const BookRecord: TBookRecord): string;
var
  BookFormat: TBookFormat;
  BookContainer: string;
begin
  BookContainer := TPath.Combine(CollectionRoot, BookRecord.Folder);

  BookFormat := GetBookFormat(CollectionRoot, BookRecord);
  if BookFormat = bfFBD then
    Result := TPath.Combine(BookContainer, BookRecord.FileName)
  else if BookFormat = bfFb2Zip then
    Result := BookContainer
  else // bfFb2 or bfRaw
    Result := TPath.Combine(BookContainer, BookRecord.FileName) + BookRecord.FileExt;
end;

end.
