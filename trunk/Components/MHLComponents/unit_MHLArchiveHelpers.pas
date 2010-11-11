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

  IArchiver = interface
    ['{7F586616-2B7C-4DD3-8097-B3AF77A42A01}']

    // Utilities
    //
    function GetIdxIgnoringFolders(const No: Integer): Integer;
    function GetIdxByExt(const Ext: string; const IdxStart: Integer = 0): Integer;
    function GetIdxByFileName(const FileName: string): Integer;
    function GetNextFileIdx(const IdxStart: Integer = 0): Integer;
    function GetFileName(const No: Integer): string;
    function GetFileSize(const No: Integer): Integer;
    function GetNumFiles: Integer;

    // Archive
    //
    procedure ArchiveFiles(const FileNames: array of string);
    procedure ArchiveStreams(const Sources: array of TStreamSource);
    procedure ArchiveReplaceFile(const FileName: string);
    procedure ArchiveRenameAll(const NewFileName: string);

    // Unarchive
    //
    function UnarchiveToStream(const No: Integer): TMemoryStream;
    function UnarchiveToString(const No: Integer): String;

    // Test
    //
    function Test: Boolean;
  end;

  // Supported archive formats (only ones that work for both input and output)
  TArchiveFormat = (
    afZip,
    af7Z
  );

  TArchiver = class(TInterfacedObject, IArchiver)
  public
    // Utilities
    //
    function GetIdxIgnoringFolders(const No: Integer): Integer;
    function GetIdxByExt(const Ext: string; const IdxStart: Integer = 0): Integer;
    function GetIdxByFileName(const FileName: string): Integer;
    function GetNextFileIdx(const IdxStart: Integer = 0): Integer;
    function GetFileName(const No: Integer): string;
    function GetFileSize(const No: Integer): Integer;
    function GetNumFiles: Integer;

    // Archive
    //
    procedure ArchiveFiles(const FileNames: array of string);
    procedure ArchiveStreams(const Sources: array of TStreamSource);
    procedure ArchiveReplaceFile(const FileName: string);
    procedure ArchiveRenameAll(const NewFileName: string);

    // Unarchive
    //
    function UnarchiveToStream(const No: Integer): TMemoryStream;
    function UnarchiveToString(const No: Integer): String;

    // Test
    //
    function Test: Boolean;

  public
    constructor Create(const ArchiveFileName: string; const ArchiveFormat: TArchiveFormat); overload;
    constructor Create(const ArchiveFileName: string); overload;

  private
    FArchiveFileName: string;
    FArchiveFormatGUID: TGUID; // one of the values defined in the sevenzip unit
  end;

  function IsArchiveExt(const FileName: string): Boolean;

implementation

uses
  SysUtils,
  StrUtils,
  WideStrUtils,
  IOUtils,
  sevenzip;

const
  ZIP_EXTENSION = '.zip';
  SEVENZIP_EXTENSION = '.7z';

constructor TArchiver.Create(const ArchiveFileName: string; const ArchiveFormat: TArchiveFormat);
begin
  FArchiveFileName := ArchiveFileName;

  case ArchiveFormat of
    afZip:
      FArchiveFormatGUID := CLSID_CFormatZip;

    af7Z:
      FArchiveFormatGUID := CLSID_CFormat7z;

    else
      Assert(False, 'Not supported');
  end;
end;

constructor TArchiver.Create(const ArchiveFileName: string);
var
  ext: string;
begin
  FArchiveFileName := ArchiveFileName;

  ext := AnsiLowerCase(TPath.GetExtension(ArchiveFileName));
  if ext = ZIP_EXTENSION then
    FArchiveFormatGUID := CLSID_CFormatZip
  else if ext = SEVENZIP_EXTENSION then
    FArchiveFormatGUID := CLSID_CFormat7z
  else // should haved used a constructor with an explicit format instead
    raise Exception.CreateFmt('Unrecognized archive format: "%s"', [ext]);

end;

// Get real index in the zip, skipping directories
// Returns -1 if not found
function TArchiver.GetIdxIgnoringFolders(const No: Integer): Integer;
var
  i: Integer;
  idxFile: Integer;
  archiveIn: I7zInArchive;
begin
  Assert(No >= 0);

  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);

  idxFile := 0;
  Result := -1;
  for i := 0 to archiveIn.NumberOfItems - 1 do
  begin
    if not archiveIn.ItemIsFolder[i] then
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
function TArchiver.GetIdxByExt(const Ext: string; const IdxStart: Integer = 0): Integer;
var
  i: Integer;
  archiveIn: I7zInArchive;
begin
  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);

  Result := -1;
  for i := IdxStart to archiveIn.NumberOfItems - 1 do
  begin
    if (not archiveIn.ItemIsFolder[i]) and AnsiEndsStr(Ext, archiveIn.ItemPath[i]) then
    begin
      Result := i;
      break;
    end;
  end;
end;

function TArchiver.GetIdxByFileName(const FileName: string): Integer;
var
  i: Integer;
  archiveIn: I7zInArchive;
begin
  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);

  Result := -1;
  for i := 0 to archiveIn.NumberOfItems - 1 do
  begin
    if (not archiveIn.ItemIsFolder[i]) and (FileName = archiveIn.ItemPath[i]) then
    begin
      Result := i;
      break;
    end;
  end;
end;

// Get an index of a first file (non a folder) >= IdxStart
// Returns -1 if not found
function TArchiver.GetNextFileIdx(const IdxStart: Integer = 0): Integer;
var
  i: Integer;
  archiveIn: I7zInArchive;
begin
  Assert(IdxStart >= 0);

  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);

  Result := -1;
  for i := IdxStart to archiveIn.NumberOfItems - 1 do
  begin
    if (not archiveIn.ItemIsFolder[i]) then
    begin
      Result := i;
      break;
    end;
  end;
end;

// Get the name of the file under provided index (not counting folders)
function TArchiver.GetFileName(const No: Integer): string;
var
  idxFile: Integer;
  archiveIn: I7zInArchive;
begin
  idxFile := GetIdxIgnoringFolders(No);
  Assert(idxFile >= 0);

  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);
  Result := archiveIn.ItemPath[idxFile];
end;

// Get the size of the file under provided index (not counting folders)
function TArchiver.GetFileSize(const No: Integer): Integer;
var
  idxFile: Integer;
  ZipIn: I7zInArchive;
begin
  idxFile := GetIdxIgnoringFolders(No);
  Assert(idxFile >= 0);

  ZipIn := CreateInArchive(FArchiveFormatGUID);
  ZipIn.OpenFile(FArchiveFileName);
  Result := ZipIn.ItemSize[idxFile];
end;

// Count number of files in a zip ignoring folders
function TArchiver.GetNumFiles: Integer;
var
  i: Integer;
  archiveIn: I7zInArchive;
begin
  Result := 0;

  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);

  for i := 0 to archiveIn.NumberOfItems - 1 do
  begin
    if not archiveIn.ItemIsFolder[i] then
      Inc(Result);
  end;
end;

procedure TArchiver.ArchiveFiles(const FileNames: array of string);
var
  archiveOut: I7zOutArchive;
  fileName: string;
  stream: TMemoryStream;
begin
  archiveOut := CreateOutArchive(FArchiveFormatGUID);

  for fileName in FileNames do
  begin
    stream := TMemoryStream.Create;
    try
      stream.LoadFromFile(fileName);
      // use soOwned - zipOut will be responsible for freeing the stream
      archiveOut.AddStream(stream, soOwned, faArchive, CurrentFileTime, CurrentFileTime,
        TPath.GetFileName(fileName), false, false);
    except
      FreeAndNil(stream);
      raise;
    end;
  end;

  archiveOut.SaveToFile(FArchiveFileName);
end;

// Zip provided sources using Name property as file name and Stream property as data source
procedure TArchiver.ArchiveStreams(const Sources: array of TStreamSource);
var
  archiveOut: I7zOutArchive;
  source: TStreamSource;
begin
  archiveOut := CreateOutArchive(FArchiveFormatGUID);

  for source in Sources do
    archiveOut.AddStream(source.Stream, soReference, faArchive, CurrentFileTime, CurrentFileTime, source.Name, false, false);

  archiveOut.SaveToFile(FArchiveFileName);
end;

// Replace the file in an existing zip
procedure TArchiver.ArchiveReplaceFile(const FileName: string);
var
  i: Integer;
  archiveIn: I7zInArchive;
  archiveOut: I7zOutArchive;
  stream: TMemoryStream;
  pureFileName: string;
begin
  archiveOut := CreateOutArchive(FArchiveFormatGUID);

  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);

  pureFileName := TPath.GetFileName(FileName);

  for i := 0 to archiveIn.NumberOfItems - 1 do
  begin
    if (not archiveIn.ItemIsFolder[i]) and (pureFileName <> archiveIn.ItemPath[i]) then
    begin
      stream := TMemoryStream.Create;
      try
        archiveIn.ExtractItem(i, stream, false);
        // use soOwned - zipOut will be responsible for freeing the stream
        archiveOut.AddStream(stream, soOwned, faArchive, CurrentFileTime, CurrentFileTime,
          archiveIn.ItemPath[i], false, false);
      except
        FreeAndNil(stream);
        raise;
      end;
    end;
  end;
  archiveIn := nil;

  stream := TMemoryStream.Create;
  try
    stream.LoadFromFile(FileName);
    // use soOwned - zipOut will be responsible for freeing the stream
    archiveOut.AddStream(stream, soOwned, faArchive, CurrentFileTime, CurrentFileTime,
      pureFileName, false, false);
  except
    FreeAndNil(stream);
    raise;
  end;

  archiveOut.SaveToFile(FArchiveFileName);
end;

// Rename all files in a zip (keeping only their extensions)
// Expects NewFileName without extension and path
procedure TArchiver.ArchiveRenameAll(const NewFileName: string);
var
  i: Integer;
  archiveIn: I7zInArchive;
  archiveOut: I7zOutArchive;
  stream: TStream;
  ext: string;
begin
  archiveOut := CreateOutArchive(FArchiveFormatGUID);

  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);

  for i := 0 to archiveIn.NumberOfItems - 1 do
  begin
    if (not archiveIn.ItemIsFolder[i]) then
    begin
      stream := TMemoryStream.Create;
      try
        archiveIn.ExtractItem(i, stream, false);
        ext := ExtractFileExt(archiveIn.ItemPath[i]);
        // use soOwned - zipOut will be responsible for freeing the stream
        archiveOut.AddStream(stream, soOwned, faArchive, CurrentFileTime, CurrentFileTime,
          NewFileName + ext, false, false);
      except
        FreeAndNil(stream);
        raise;
      end;
    end;
  end;
  archiveIn := nil;

  archiveOut.SaveToFile(FArchiveFileName);
end;

// Unzip file with index No (not counting folders)
function TArchiver.UnarchiveToStream(const No: Integer): TMemoryStream;
var
  archiveIn: I7zInArchive;
  idxFile: Integer;
begin
  Assert(No >= 0);

  idxFile := GetIdxIgnoringFolders(No);
  Assert(idxFile >= 0);

  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);

  Result := TMemoryStream.Create;
  try
    archiveIn.ExtractItem(idxFile, Result, False);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

// Unzip file with index No (not counting folders) and convert it to a string
function TArchiver.UnarchiveToString(const No: Integer): String;
var
  binStream: TMemoryStream;
  strStream: TStringStream;
  S: String;
begin
  Assert(No >= 0);

  binStream := UnarchiveToStream(No);
  try
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

// Test the zip and return the number of files in it
function TArchiver.Test: Boolean;
var
  archiveIn: I7zInArchive;
  stream: TStream;
  i: Integer;
begin
  archiveIn := CreateInArchive(FArchiveFormatGUID);
  archiveIn.OpenFile(FArchiveFileName);

  try
    for i := 0 to archiveIn.NumberOfItems - 1 do
    begin
      if (not archiveIn.ItemIsFolder[i]) then
      begin
        stream := TMemoryStream.Create;
        try
          archiveIn.ExtractItem(i, stream, true); // test item i
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

function IsArchiveExt(const FileName: string): Boolean;
var
  ext: string;
begin
  ext := AnsiLowercase(ExtractFileExt(FileName));
  Result := (ext = ZIP_EXTENSION) or (ext = SEVENZIP_EXTENSION);
end;

end.
