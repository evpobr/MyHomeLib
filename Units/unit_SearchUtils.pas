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
  * History
  * NickR 15.02.2010     од переформатирован
  *
  ****************************************************************************** *)

unit unit_SearchUtils;

interface

procedure AddToFilter(Field, Value: string; UP: Boolean; var FilterString: string);
procedure AddSeriesToFilter(Value: string; var SeriesFilter: string);

function Clear(S: string): string;
function PrepareQuery(S: string; UP: Boolean; ConverToFull: Boolean = True): string;

implementation

uses
  StrUtils,
  SysUtils,
  unit_Globals;

procedure AddToFilter(Field, Value: String; UP: Boolean; var FilterString: string);
begin
  if Value = '' then
    Exit;

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
      FilterString := FilterString + ' and (UPPER(' + Field + ') ' + Value + ')'
    else
      FilterString := '(UPPER(' + Field + ') ' + Value + ')';
  end
  else if FilterString <> '' then
    FilterString := FilterString + ' and (' + Field + ' ' + Value + ')'
  else
    FilterString := '(' + Field + ' ' + Value + ')';
end;

procedure AddSeriesToFilter(Value: string; var SeriesFilter: string);
begin
  if SeriesFilter <> '' then
    SeriesFilter := SeriesFilter + ' or (`SerID` ="' + Value + '")'
  else
    SeriesFilter := '(`SerID` ="' + Value + '")';
end;

function Clear(S: string): string; inline;
begin
  Result := S;
  StrReplace(#13#10, ' ', Result);
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
