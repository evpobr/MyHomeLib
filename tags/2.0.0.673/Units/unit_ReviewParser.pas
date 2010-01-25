{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 1.5                                   }
{                                03.08.2009                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                       author:  eg  (http://forum.home-lib.net)               }
{                                                                              }
{                     A parser for Lib.rus.ec book reviews                     }
{                                                                              }
{******************************************************************************}

unit unit_ReviewParser;

interface
uses
  Classes,
  StrUtils,
  IdHTTP;

type
  TReviewParser=class
    FidHTTP : TIdHTTP;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Parse(const url : String; targetList : TStringList);

  private
    function GetPage(const url : String): String;
    function Extract(const page : String; const idxReviewBlockStart : Integer;
                     const before : String; const after : String) : String;
   end;

implementation

uses
  unit_Globals;

constructor TReviewParser.Create;
begin
  inherited Create();
  FidHTTP := TidHTTP.Create;

  SetProxySettings(FidHTTP);

end;

destructor TReviewParser.Destroy();
begin
  // do not close the idHTTP, as it was not created by the ctor
  FidHTTP.Free;
  inherited Destroy();
end;

// Get an HTML page and extract all available book reviews
//  url - the book's URL
//  targetList - an initialised list to be populated with reviews
procedure TReviewParser.Parse(const url : String; targetList : TStringList);
const
  BLOCK_PREFIX = '/polka/show/';
  END_ALL = '<div id=''newann''';
  NAME_REVIEW_DELIM = ':';
var
  page : String;
  idxReviewBlockStart : Integer;
  idxEndAllBookReviews : Integer;
  name : String;
  review : String;
begin
  Assert(Assigned(targetList));
  page := GetPage(url);

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
//  url - the URL of the page to GET
function TReviewParser.GetPage(const url: String) : String;
var
  outputStream: TMemoryStream;
  responseList: TStringList;
begin
  Result := '';

  responseList := TStringList.Create();
  try
    outputStream := TMemoryStream.Create();
    FidHTTP.Get(url, outputStream);

    outputStream.Position := 0;
    responseList.LoadFromStream(outputStream);

    if responseList.Count > 0 then
    begin
      Result := UTF8ToString(responseList.GetText());
    end;
  finally
    responseList.Free();
    outputStream.Free();
  end;
end;

// Extract part of the text and clean it up
//  page - html page to search in
//  idxReviewBlockStart - index pointing to the start of the current review block
//  before - the string located before the text we want to extract
//  after - the string located after the text we want to extract
function TReviewParser.Extract(const page : String; const idxReviewBlockStart : Integer;
const before : String; const after : String) : String;
var
  idxNameStart : Integer;
  idxNameEnd : Integer;
  lenName : Integer;
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