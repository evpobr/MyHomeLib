unit unit_SearchUtils;

interface

procedure AddToFilter(Field,Value:String;  UP: boolean ; var FilterString: string);
procedure AddSeriesToFilter(Value:string; var SeriesFilter: string);

function Query(S: string):string;
function Clear(S: string):string;
function PrepareQuery(S: string):string;

implementation

uses
  StrUtils,
  SysUtils,
  unit_Globals;


procedure AddToFilter(Field,Value:String;  UP: boolean; var FilterString: string);
begin
  if Value = '' then Exit;

  StrReplace('NOT LIKE', 'NOT#LIKE',Value);
  StrReplace(' LIKE', ' ' + Field + '#LIKE',Value);
  StrReplace(' =', ' ' + Field + '#=',Value);
  StrReplace(' <>', ' ' + Field + '#<>',Value);
  StrReplace(' <', ' ' + Field + '#<',Value);
  StrReplace(' >', ' ' + Field + '#>',Value);

  StrReplace('#',' ',Value);

  if UP then
  begin
    StrReplace(Field,'()',Value);
    StrReplace('()','UPPER(' + Field + ')',Value);
  end;

  if UP then
  begin
    if FilterString <> '' then
      FilterString := FilterString + ' and (UPPER(' + Field + ') ' + Value + ')'
    else
      FilterString := '(UPPER(' + Field + ') ' + Value + ')';
  end
  else
    if FilterString <> '' then
      FilterString := FilterString + ' and (' + Field + ' ' + Value + ')'
    else
      FilterString := '(' + Field + ' ' + Value + ')';

end;

procedure AddSeriesToFilter(Value:string; var SeriesFilter: string);
begin
  if SeriesFilter <> '' then
      SeriesFilter := SeriesFilter + ' or (`SerID` ="' + Value + '")'
    else
      SeriesFilter := '(`SerID` ="' +  Value + '")';
end;

function Clear(S: string):string;
begin
  Result := S;
  StrReplace(#13#10,' ', Result);
  Trim(Result);
end;

function Query(S: string):string;
begin
  S := trim(AnsiUpperCase(S));
  S := PrepareQuery(S);
  Result := Clear(S);
end;

// проверяем запрос, если нативный - преобразовывам в SQL
function PrepareQuery(S: string):string;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;

  if (pos('%',S) = 0) and
     (pos('=',S) = 0) and
     (pos('"',S) = 0) and
     (pos('LIKE',S) = 0)
  then
    S := Format('%%%s%%',[S]);

  if (pos('=',S) = 0) and
     (pos('LIKE',S) = 0) and
     (pos('"',S) = 0)
  then
  begin
    if pos('%',S)=0 then
      Result := '="' + S + '"'
    else
      Result := 'LIKE "' + S + '"';
  end
  else
    Result := S;
end;

end.
