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
    bfFB2,    // A pure FB2 file
    bfFB2ZIP, // An FB2 packed in a ZIP
    bfFBD,    // An (FBD + a raw book file) packed together in a zip
    bfRaw
  );   // A raw file = any other book format

  TBookFormatUtils = class
  public
    class function GetBookFormat(const BookRecord: TBookRecord): TBookFormat; overload;
    class function GetBookFormat(const BookData: PBookData): TBookFormat; overload;

    class function GetExpandedBookFileName(const BookRecord: TBookRecord): string; overload;
    class function GetExpandedBookFileName(const BookData: PBookData): string; overload;

  private
    class function GetBookFormat(const Folder: string; const PureFileName: string; const FileExt: string) : TBookFormat; overload;
    class function GetExpandedBookFileName(const Folder: string; const PureFileName: string; const FileExt: string): string; overload;
  end;

implementation

uses
  ZipForge,
  IOUtils,
  SysUtils,
  dm_collection,
  dm_user,
  unit_Consts;

class function TBookFormatUtils.GetBookFormat(const BookRecord: TBookRecord): TBookFormat;
begin
  Result := GetBookFormat(BookRecord.Folder, BookRecord.FileName, BookRecord.FileExt);
end;

class function TBookFormatUtils.GetBookFormat(const BookData: PBookData): TBookFormat;
var
  Folder: string;
  FileName: string;
  FileExt: string;
  No: Integer;
begin
  DMCollection.GetBookFileName(BookData^.BookID, BookData^.DatabaseID, Folder, FileName, FileExt, No);
  Result := GetBookFormat(Folder, FileName, FileExt);
end;

class function TBookFormatUtils.GetExpandedBookFileName(const BookRecord: TBookRecord): string;
begin
  Result := GetExpandedBookFileName(BookRecord.Folder, BookRecord.FileName, BookRecord.FileExt);
end;

class function TBookFormatUtils.GetExpandedBookFileName(const BookData: PBookData): string;
var
  Folder: string;
  FileName: string;
  FileExt: string;
  No: Integer;
begin
  DMCollection.GetBookFileName(BookData^.BookID, BookData^.DatabaseID, Folder, FileName, FileExt, No);
  Result := GetExpandedBookFileName(Folder, FileName, FileExt);
end;

///////////////////////////////////////////////////////////////////////////////
//
// Private methods
//
///////////////////////////////////////////////////////////////////////////////

// The code was extracted from multiple occurencies in TfrmMain
class function TBookFormatUtils.GetBookFormat(const Folder: string; const PureFileName: string; const FileExt: string) : TBookFormat;
var
  BookContainer: string;
  PathLen: Integer;
  LongFileName: string;
begin
  Result := bfRaw; // default
  BookContainer := TPath.Combine(DMUser.ActiveCollection.RootFolder, Folder);
  PathLen := Length(BookContainer);

  if
    (PathLen = 0) or
    (BookContainer[PathLen] = TPath.DirectorySeparatorChar) or
    (BookContainer[PathLen] = TPath.AltDirectorySeparatorChar) then
  begin
    //BookContainer is either empty or a path
    LongFileName := TPath.Combine(BookContainer, PureFileName);

    if ExtractFileExt(LongFileName) = ZIP_EXTENSION then
      Result := bfFBD
    else if FileExt = FB2_EXTENSION then
      Result := bfFB2
  end
  else
  begin
    if ExtractFileExt(BookContainer) = ZIP_EXTENSION then
      Result := bfFB2Zip;
  end;

  if (Result = bfRaw) and (FileExt = FB2_EXTENSION) then
    Result := bfFB2
end;

// Get an expanded book file name, also extracted from TfrmMain
class function TBookFormatUtils.GetExpandedBookFileName(const Folder: string; const PureFileName: string; const FileExt: string): string;
var
  BookFormat: TBookFormat;
  BookContainer: string;
begin
  BookContainer := TPath.Combine(DMUser.ActiveCollection.RootFolder, Folder);

  BookFormat := GetBookFormat(Folder, PureFileName, FileExt);
  if BookFormat = bfFBD then
    Result := TPath.Combine(BookContainer, PureFileName)
  else if BookFormat = bfFB2ZIP then
    Result := BookContainer
  else // bfFB2 or bfRaw
    Result := TPath.Combine(BookContainer, PureFileName) + FileExt;
end;

end.
