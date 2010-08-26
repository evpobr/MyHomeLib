(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             12.02.2010
  * Description
  * Author(s)           Aleksey Penkov  alex.penkov@gmail.com
  *
  * $Id$
  *
  * History
  * NickR 15.02.2010     од переформатирован
  *
  ****************************************************************************** *)

unit unit_SearchUtils;

interface

procedure AddToFilter(const Field: string; Value: string; UP: Boolean; var FilterString: string);
function PrepareQuery(S: string; UP: Boolean; ConverToFull: Boolean = True): string;

implementation

uses
  StrUtils,
  SysUtils,
  unit_Globals,
  unit_Consts;

procedure AddToFilter(const Field: string; Value: string; UP: Boolean; var FilterString: string);
begin
  if Value = '' then
    Exit;

  StrReplace(LF, ' ', Value);
  StrReplace(CRLF, ' ', Value);
  StrReplace('NOT LIKE', 'NOT#LIKE', Value);
  StrReplace(' LIKE', ' ' + Field + '#LIKE', Value);
  StrReplace(' =', ' ' + Field + #7 + '=', Value);
  StrReplace(' <>', ' ' + Field + #7 + '<>', Value);
  StrReplace(' <', ' ' + Field + #7 + '<', Value);
  StrReplace(' >', ' ' + Field + #7 + '>', Value);
  StrReplace(#7, ' ', Value);

  if UP then
  begin
    StrReplace(Field, '()', Value);
    StrReplace('()', 'UPPER(' + Field + ')', Value);
  end;

  if UP then
  begin
    if FilterString <> '' then
      FilterString := FilterString + ' AND (UPPER(' + Field + ') ' + Value + ')'
    else
      FilterString := '(UPPER(' + Field + ') ' + Value + ')';
  end
  else if FilterString <> '' then
    FilterString := FilterString + ' AND (' + Field + ' ' + Value + ')'
  else
    FilterString := '(' + Field + ' ' + Value + ')';
end;

function Clear(const S: string): string; inline;
begin
  Result := S;
  StrReplace(CRLF, ' ', Result);
  Trim(Result);
end;

// провер€ем запрос, если нативный - преобразовывам в SQL
function PrepareQuery(S: string; UP: Boolean; ConverToFull: Boolean = True): string;
begin
  if UP then
    S := Trim(AnsiUpperCase(S));

  if S = '' then
  begin
    Result := '';
    Exit;
  end;

  if ConverToFull and (Pos('%', S) = 0) and (Pos('=', S) = 0) and (Pos('"', S) = 0) and (Pos('LIKE', S) = 0) then
    S := Format('%%%s%%', [S]);

  if (Pos('=', S) = 0) and (Pos('LIKE', S) = 0) and (Pos('"', S) = 0) then
  begin
    if Pos('%', S) = 0 then
      S := '="' + S + '"'
    else
      S := 'LIKE "' + S + '"';
  end;

  Result := Clear(S);
end;

end.
