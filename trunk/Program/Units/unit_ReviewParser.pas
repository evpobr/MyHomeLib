(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           eg (http://forum.home-lib.net)
  * Created             12.02.2010
  * Description         A parser for Lib.rus.ec / Flibusta book reviews
  *
  * $Id$
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_ReviewParser;

interface

uses
  Classes,
  StrUtils,
  IdHTTP;

type
  TReviewParser = class
  strict private
    FidHTTP: TIdHTTP;

    function GetPage(const url: string): string;
    function Extract(const page: string; const idxReviewBlockStart: Integer; const before: string; const after: string): string;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Parse(const url: string; targetList: TStringList);
  end;

implementation

uses
  SysUtils,
  unit_Globals;

constructor TReviewParser.Create;
begin
  inherited Create;

  FidHTTP := TIdHTTP.Create;
  SetProxySettings(FidHTTP);
end;

destructor TReviewParser.Destroy;
begin
  // do not close the idHTTP, as it was not created by the ctor
  FidHTTP.Free;
  inherited Destroy;
end;

// Get an HTML page and extract all available book reviews
// url - the book's URL
// targetList - an initialised list to be populated with reviews
procedure TReviewParser.Parse(const url: string; targetList: TStringList);
const
  NAME_REVIEW_DELIM = ':';
var
  page: string;
  idxReviewBlockStart: Integer;
  idxEndAllBookReviews: Integer;
  name: string;
  review: string;
  BEG_PREFIX, BLOCK_PREFIX, END_ALL: string;
begin
  Assert(Assigned(targetList));
  page := GetPage(url);

  if pos('lib.rus.ec', URL) <> 0 then
  begin
    BEG_PREFIX := 'Впечатления о книге:';
    BLOCK_PREFIX := '/polka/show/';
    END_ALL := '<p><a href=/stat/r/';
    idxReviewBlockStart := Pos(BEG_PREFIX, page);
    Delete(page, 1 , idxReviewBlockStart);
  end
  else begin
    BLOCK_PREFIX := '/polka/show/';
    END_ALL := '<div id=''newann''';
  end;

  idxReviewBlockStart := Pos(BLOCK_PREFIX, page);
  idxEndAllBookReviews := Pos(END_ALL, page);
  while ((idxReviewBlockStart <> 0) and (idxReviewBlockStart < idxEndAllBookReviews)) do
  begin
    name := Extract(page, idxReviewBlockStart, '>', '<');
    review := Extract(page, idxReviewBlockStart, '<br>', '<hr>');
    targetList.Add(name + NAME_REVIEW_DELIM);
    targetList.Add(review);
    targetList.Add('');
    idxReviewBlockStart := PosEx(BLOCK_PREFIX, page, idxReviewBlockStart + 1);
  end;
end;

// Do a GET request and return result as a String
// url - the URL of the page to GET
function TReviewParser.GetPage(const url: string): string;
var
  outputStream: TMemoryStream;
  responseList: TStringList;
begin
  Result := '';

  responseList := TStringList.Create;
  try
    outputStream := TMemoryStream.Create;
    try
      FidHTTP.Get(url, outputStream);

      outputStream.Position := 0;
      responseList.LoadFromStream(outputStream, TEncoding.UTF8);

      if responseList.Count > 0 then
        Result := responseList.Text;
    finally
      outputStream.Free;
    end;
  finally
    responseList.Free;
  end;
end;

// Extract part of the text and clean it up
// page - html page to search in
// idxReviewBlockStart - index pointing to the start of the current review block
// before - the string located before the text we want to extract
// after - the string located after the text we want to extract
function TReviewParser.Extract(const page: string; const idxReviewBlockStart: Integer; const before: string; const after: string): string;
var
  idxNameStart: Integer;
  idxNameEnd: Integer;
  lenName: Integer;
begin
  Assert(idxReviewBlockStart > 0);
  Result := '';

  idxNameStart := PosEx(before, page, idxReviewBlockStart + 1);
  if (idxNameStart <> 0) then
  begin
    idxNameStart := idxNameStart + Length(before);
    idxNameEnd := PosEx(after, page, idxNameStart);
    if (idxNameEnd <> 0) then
    begin
      lenName := idxNameEnd - idxNameStart;
      Result := Copy(page, idxNameStart, lenName);
      Result := ReplaceStr(Result, '<br>', ''); // clean up the junk
    end;
  end;
end;

end.
