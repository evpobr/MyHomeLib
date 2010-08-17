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
    class function GetBookFormat(const BookRecord: TBookRecord): TBookFormat; overload;
    class function GetBookFormat(const CollectionRoot: string; const BookRecord: TBookRecord): TBookFormat; overload;
    class function GetBookFormat(const BookData: PBookData): TBookFormat; overload;
    class function GetBookFormat(const BookID: Integer; const DatabaseID: Integer): TBookFormat; overload;

    class function GetExpandedBookFileName(const BookRecord: TBookRecord): string; overload;
    class function GetExpandedBookFileName(const CollectionRoot: string; const BookRecord: TBookRecord): string; overload;
    class function GetExpandedBookFileName(const BookData: PBookData): string; overload;
    class function GetExpandedBookFileName(const BookID: Integer; const DatabaseID: Integer): string; overload;

  private
    class function GetBookFormatInternal(const CollectionRoot: string; const Folder: string; const PureFileName: string; const FileExt: string) : TBookFormat;
    class function GetExpandedBookFileNameInternal(const CollectionRoot: string; const Folder: string; const PureFileName: string; const FileExt: string): string;
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
  Result := GetBookFormatInternal(DMUser.ActiveCollection.RootFolder, BookRecord.Folder, BookRecord.FileName, BookRecord.FileExt);
end;

class function TBookFormatUtils.GetBookFormat(const CollectionRoot: string; const BookRecord: TBookRecord): TBookFormat;
begin
  Result := GetBookFormatInternal(CollectionRoot, BookRecord.Folder, BookRecord.FileName, BookRecord.FileExt);
end;

class function TBookFormatUtils.GetBookFormat(const BookData: PBookData): TBookFormat;
var
  Folder, FileName, FileExt: string;
  No: Integer;
begin
  DMCollection.GetBookFileName(BookData^.BookID, BookData^.DatabaseID, Folder, FileName, FileExt, No);
  Result := GetBookFormatInternal(DMUser.ActiveCollection.RootFolder, Folder, FileName, FileExt);
end;

class function TBookFormatUtils.GetBookFormat(const BookID: Integer; const DatabaseID: Integer): TBookFormat;
var
  Folder, FileName, FileExt: string;
  No: Integer;
begin
  DMCollection.GetBookFileName(BookID, DatabaseID, Folder, FileName, FileExt, No);
  Result := GetBookFormatInternal(DMUser.ActiveCollection.RootFolder, Folder, FileName, FileExt);
end;

class function TBookFormatUtils.GetExpandedBookFileName(const BookRecord: TBookRecord): string;
begin
  Result := GetExpandedBookFileNameInternal(DMUser.ActiveCollection.RootFolder, BookRecord.Folder, BookRecord.FileName, BookRecord.FileExt);
end;

class function TBookFormatUtils.GetExpandedBookFileName(const CollectionRoot: string; const BookRecord: TBookRecord): string;
begin
  Result := GetExpandedBookFileNameInternal(CollectionRoot, BookRecord.Folder, BookRecord.FileName, BookRecord.FileExt);
end;

class function TBookFormatUtils.GetExpandedBookFileName(const BookData: PBookData): string;
var
  Folder, FileName, FileExt: string;
  No: Integer;
begin
  DMCollection.GetBookFileName(BookData^.BookID, BookData^.DatabaseID, Folder, FileName, FileExt, No);
  Result := GetExpandedBookFileNameInternal(DMUser.ActiveCollection.RootFolder, Folder, FileName, FileExt);
end;

class function TBookFormatUtils.GetExpandedBookFileName(const BookID: Integer; const DatabaseID: Integer): string;
var
  Folder, FileName, FileExt: string;
  No: Integer;
begin
  DMCollection.GetBookFileName(BookID, DatabaseID, Folder, FileName, FileExt, No);
  Result := GetExpandedBookFileNameInternal(DMUser.ActiveCollection.RootFolder, Folder, FileName, FileExt);
end;

///////////////////////////////////////////////////////////////////////////////
//
// Private methods
//
///////////////////////////////////////////////////////////////////////////////

// The code was extracted from multiple occurencies in TfrmMain
// PureFileName is assumed to be without extension
class function TBookFormatUtils.GetBookFormatInternal(const CollectionRoot: string; const Folder: string; const PureFileName: string; const FileExt: string) : TBookFormat;
var
  BookContainer: string;
  PathLen: Integer;
  LongFileName: string;
begin
  Result := bfRaw; // default
  BookContainer := TPath.Combine(CollectionRoot, Folder);
  PathLen := Length(BookContainer);

  if
    (PathLen = 0) or
    (BookContainer[PathLen] = TPath.DirectorySeparatorChar) or
    (BookContainer[PathLen] = TPath.AltDirectorySeparatorChar) then
  begin
    //BookContainer is either empty or a path
    LongFileName := TPath.Combine(BookContainer, PureFileName);

    if ExtractFileExt(LongFileName) = ZIP_EXTENSION then
      Result := bfFbd
    else if FileExt = FB2_EXTENSION then
      Result := bfFb2
  end
  else
  begin
    if ExtractFileExt(BookContainer) = ZIP_EXTENSION then
      Result := bfFb2Zip;
  end;

  if (Result = bfRaw) and (FileExt = FB2_EXTENSION) then
    Result := bfFb2
end;

// Get an expanded book file name, also extracted from TfrmMain
// PureFileName is assumed to be without extension
class function TBookFormatUtils.GetExpandedBookFileNameInternal(const CollectionRoot: string; const Folder: string; const PureFileName: string; const FileExt: string): string;
var
  BookFormat: TBookFormat;
  BookContainer: string;
begin
  BookContainer := TPath.Combine(CollectionRoot, Folder);

  BookFormat := GetBookFormatInternal(CollectionRoot, Folder, PureFileName, FileExt);
  if BookFormat = bfFBD then
    Result := TPath.Combine(BookContainer, PureFileName)
  else if BookFormat = bfFb2Zip then
    Result := BookContainer
  else // bfFb2 or bfRaw
    Result := TPath.Combine(BookContainer, PureFileName) + FileExt;
end;

end.
