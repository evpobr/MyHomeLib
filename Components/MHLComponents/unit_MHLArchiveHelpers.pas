(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           eg
  * Created             28.09.2010
  * Description
  *
  * $Id$
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

// Utilities
//
function GetIdxIgnoringFoldersInZip(const ZipFileName: string; const No: Integer): Integer;
function GetIdxByExtInZip(const ZipFileName: string; const Ext: string; const IdxStart: Integer = 0): Integer;
function GetIdxByFileNameInZip(const ZipFileName: string; const FileName: string): Integer;
function GetIdxFileInZip(const ZipFileName: string; const IdxStart: Integer = 0): Integer;
function GetFileNameInZip(const ZipFileName: string; const No: Integer): string;
function GetFileSizeInZip(const ZipFileName: string; const No: Integer): Integer;
function GetNumFilesInZip(const ZipFileName: string): Integer;

// Zip
//
procedure ZipFiles(const FileNames: array of string; const ZipFileName: string);
procedure ZipStreams(const Sources: array of TStreamSource; const ZipFileName: string);
procedure ZipReplaceFile(const FileName: string; const ZipFileName: string);
procedure ZipRenameAll(const NewFileName: string; const ZipFileName: string);

// Unzip
//
function UnzipToStream(const ZipFileName: string; const No: Integer): TMemoryStream;
function UnzipToString(const ZipFileName: string; const No: Integer): String;

// Test
//
function TestZip(const ZipFileName: string): Boolean;

implementation

uses
  SysUtils,
  StrUtils,
  IOUtils,
  sevenzip;

// Get real index in the zip, skipping directories
// Returns -1 if not found
function GetIdxIgnoringFoldersInZip(const ZipFileName: string; const No: Integer): Integer;
var
  i: Integer;
  idxFile: Integer;
  zipIn: I7zInArchive;
begin
  Assert(No >= 0);

  zipIn := CreateInArchive(CLSID_CFormatZip);
  zipIn.OpenFile(ZipFileName);

  idxFile := 0;
  Result := -1;
  for i := 0 to ZipIn.NumberOfItems - 1 do
  begin
    if not zipIn.ItemIsFolder[i] then
    begin
      if idxFile = No then
      begin
        Result := idxFile;
        break;
      end;
      Inc(IdxFile);
    end;
  end;
end;

// Get index of the next file with specified extenstion in a zip
// By default starts search from 0
// Returns -1 if not found
function GetIdxByExtInZip(const ZipFileName: string; const Ext: string; const IdxStart: Integer = 0): Integer;
var
  i: Integer;
  zipIn: I7zInArchive;
begin
  zipIn := CreateInArchive(CLSID_CFormatZip);
  zipIn.OpenFile(ZipFileName);

  Result := -1;
  for i := IdxStart to ZipIn.NumberOfItems - 1 do
  begin
    if (not zipIn.ItemIsFolder[i]) and AnsiEndsStr(Ext, zipIn.ItemPath[i]) then
    begin
      Result := i;
      break;
    end;
  end;
end;

function GetIdxByFileNameInZip(const ZipFileName: string; const FileName: string): Integer;
var
  i: Integer;
  zipIn: I7zInArchive;
begin
  zipIn := CreateInArchive(CLSID_CFormatZip);
  zipIn.OpenFile(ZipFileName);

  Result := -1;
  for i := 0 to ZipIn.NumberOfItems - 1 do
  begin
    if (not zipIn.ItemIsFolder[i]) and (FileName = zipIn.ItemPath[i]) then
    begin
      Result := i;
      break;
    end;
  end;
end;

// Get an index of a first file (non a folder) >= IdxStart
// Returns -1 if not found
function GetIdxFileInZip(const ZipFileName: string; const IdxStart: Integer = 0): Integer;
var
  i: Integer;
  zipIn: I7zInArchive;
begin
  Assert(IdxStart >= 0);

  zipIn := CreateInArchive(CLSID_CFormatZip);
  zipIn.OpenFile(ZipFileName);

  Result := -1;
  for i := IdxStart to ZipIn.NumberOfItems - 1 do
  begin
    if (not zipIn.ItemIsFolder[i]) then
    begin
      Result := i;
      break;
    end;
  end;
end;

// Get the name of the file under provided index (not counting folders)
function GetFileNameInZip(const ZipFileName: string; const No: Integer): string;
var
  idxFile: Integer;
  ZipIn: I7zInArchive;
begin
  idxFile := GetIdxIgnoringFoldersInZip(ZipFileName, No);
  Assert(idxFile >= 0);

  ZipIn := CreateInArchive(CLSID_CFormatZip);
  ZipIn.OpenFile(ZipFileName);
  Result := ZipIn.ItemPath[idxFile];
end;

// Get the size of the file under provided index (not counting folders)
function GetFileSizeInZip(const ZipFileName: string; const No: Integer): Integer;
var
  idxFile: Integer;
  ZipIn: I7zInArchive;
begin
  idxFile := GetIdxIgnoringFoldersInZip(ZipFileName, No);
  Assert(idxFile >= 0);

  ZipIn := CreateInArchive(CLSID_CFormatZip);
  ZipIn.OpenFile(ZipFileName);
  Result := ZipIn.ItemSize[idxFile];
end;

// Count number of files in a zip ignoring folders
function GetNumFilesInZip(const ZipFileName: string): Integer;
var
  i: Integer;
  zipIn: I7zInArchive;
begin
  Result := 0;

  zipIn := CreateInArchive(CLSID_CFormatZip);
  zipIn.OpenFile(ZipFileName);

  for i := 0 to ZipIn.NumberOfItems - 1 do
  begin
    if not zipIn.ItemIsFolder[i] then
      Inc(Result);
  end;
end;

procedure ZipFiles(const FileNames: array of string; const ZipFileName: string);
var
  zipOut: I7zOutArchive;
  fileName: string;
  stream: TMemoryStream;
begin
  zipOut := CreateOutArchive(CLSID_CFormatZip);

  for fileName in FileNames do
  begin
    stream := TMemoryStream.Create;
    try
      stream.LoadFromFile(fileName);
      // use soOwned - zipOut will be responsible for freeing the stream
      zipOut.AddStream(stream, soOwned, faArchive, CurrentFileTime, CurrentFileTime,
        TPath.GetFileName(fileName), false, false);
    except
      FreeAndNil(stream);
      raise;
    end;
  end;

  zipOut.SaveToFile(ZipFileName);
end;

// Zip provided sources using Name property as file name and Stream property as data source
procedure ZipStreams(const Sources: array of TStreamSource; const ZipFileName: string);
var
  zipOut: I7zOutArchive;
  source: TStreamSource;
begin
  zipOut := CreateOutArchive(CLSID_CFormatZip);

  for source in Sources do
    zipOut.AddStream(source.Stream, soReference, faArchive, CurrentFileTime, CurrentFileTime, source.Name, false, false);

  zipOut.SaveToFile(ZipFileName);
end;

// Replace the file in an existing zip
procedure ZipReplaceFile(const FileName: string; const ZipFileName: string);
var
  i: Integer;
  zipIn: I7zInArchive;
  zipOut: I7zOutArchive;
  stream: TMemoryStream;
  pureFileName: string;
begin
  zipOut := CreateOutArchive(CLSID_CFormatZip);

  zipIn := CreateInArchive(CLSID_CFormatZip);
  zipIn.OpenFile(ZipFileName);

  pureFileName := TPath.GetFileName(FileName);

  for i := 0 to zipIn.NumberOfItems - 1 do
  begin
    if (not zipIn.ItemIsFolder[i]) and (pureFileName <> zipIn.ItemPath[i]) then
    begin
      stream := TMemoryStream.Create;
      try
        zipIn.ExtractItem(i, stream, false);
        // use soOwned - zipOut will be responsible for freeing the stream
        zipOut.AddStream(stream, soOwned, faArchive, CurrentFileTime, CurrentFileTime,
          zipIn.ItemPath[i], false, false);
      except
        FreeAndNil(stream);
        raise;
      end;
    end;
  end;
  zipIn := nil;

  stream := TMemoryStream.Create;
  try
    stream.LoadFromFile(FileName);
    // use soOwned - zipOut will be responsible for freeing the stream
    zipOut.AddStream(stream, soOwned, faArchive, CurrentFileTime, CurrentFileTime,
      pureFileName, false, false);
  except
    FreeAndNil(stream);
    raise;
  end;

  zipOut.SaveToFile(ZipFileName);
end;

// Rename all files in a zip (keeping only their extensions)
// Expects NewFileName without extension and path
procedure ZipRenameAll(const NewFileName: string; const ZipFileName: string);
var
  i: Integer;
  zipIn: I7zInArchive;
  zipOut: I7zOutArchive;
  stream: TStream;
  ext: string;
begin
  zipOut := CreateOutArchive(CLSID_CFormatZip);

  zipIn := CreateInArchive(CLSID_CFormatZip);
  zipIn.OpenFile(ZipFileName);

  for i := 0 to zipIn.NumberOfItems - 1 do
  begin
    if (not zipIn.ItemIsFolder[i]) then
    begin
      stream := TMemoryStream.Create;
      try
        zipIn.ExtractItem(i, stream, false);
        ext := ExtractFileExt(zipIn.ItemPath[i]);
        // use soOwned - zipOut will be responsible for freeing the stream
        zipOut.AddStream(stream, soOwned, faArchive, CurrentFileTime, CurrentFileTime,
          NewFileName + ext, false, false);
      except
        FreeAndNil(stream);
        raise;
      end;
    end;
  end;
  zipIn := nil;

  zipOut.SaveToFile(ZipFileName);
end;

// Unzip file with index No (not counting folders)
function UnzipToStream(const ZipFileName: string; const No: Integer): TMemoryStream;
var
  zipIn: I7zInArchive;
  idxFile: Integer;
begin
  Assert(No >= 0);

  idxFile := GetIdxIgnoringFoldersInZip(ZipFileName, No);
  Assert(idxFile >= 0);

  zipIn := CreateInArchive(CLSID_CFormatZip);
  zipIn.OpenFile(ZipFileName);

  Result := TMemoryStream.Create;
  try
    zipIn.ExtractItem(idxFile, Result, False);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// Unzip file with index No (not counting folders) and convert it to a string
function UnzipToString(const ZipFileName: string; const No: Integer): String;
var
  binStream: TMemoryStream;
  strStream: TStringStream;
begin
  Assert(No >= 0);

  binStream := UnzipToStream(ZipFileName, No);
  try
    strStream := TStringStream.Create;
    try
      binStream.SaveToStream(strStream);
      Result:= strStream.DataString;
    finally
      FreeAndNil(strStream);
    end;
  finally
    FreeAndNil(binStream);
  end;
end;

// Test the zip and return the number of files in it
function TestZip(const ZipFileName: string): Boolean;
var
  zipIn: I7zInArchive;
  stream: TStream;
  i: Integer;
begin
  zipIn := CreateInArchive(CLSID_CFormatZip);
  zipIn.OpenFile(ZipFileName);

  try
    for i := 0 to ZipIn.NumberOfItems - 1 do
    begin
      if (not zipIn.ItemIsFolder[i]) then
      begin
        stream := TMemoryStream.Create;
        try
          zipIn.ExtractItem(i, stream, true); // test item i
        finally
          FreeAndNil(stream);
        end;
      end;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

end.
