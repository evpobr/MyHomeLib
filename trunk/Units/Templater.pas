(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             12.02.2010
  * Description
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  *
  ****************************************************************************** *)

unit Templater;

interface

uses
  Classes,
  TemplaterInternal;

type
  TStringsTemplater = class(TBlockTemplateElement<TStrings>)
  private type
    TParamsParser = class(TBaseParamsParser<TStrings>)
    private
      constructor Create;
    end;

  public
    constructor Create;
  end;

  TTestRecord = record
    AField1: Integer;
    AField2: string;
    AField3: Boolean;
  end;

  TBookTemplater = class(TBlockTemplateElement<TTestRecord>)
  private type
    TParamsParser = class(TBaseParamsParser<TTestRecord>)
    strict private
      class function GetParam(const params: TTestRecord; const paramName: string): string; static;
    private
      constructor Create;
    end;

  public
    constructor Create;
  end;

implementation

uses
  SysUtils;

{ TStringsTemplater }

constructor TStringsTemplater.Create;
begin
  inherited Create(TParamsParser.Create);
end;

{ TStringsTemplater.TStringsParamsParser }

constructor TStringsTemplater.TParamsParser.Create;
begin
  inherited Create(
    function (const ParamName: string): Boolean
    begin
      Result := True;
    end
    ,
    function (const Params: TStrings; const ParamName: string): string
    begin
      Result := Params.Values[ParamName];
    end
  );
end;

{ TBookTemplater }

constructor TBookTemplater.Create;
begin
  inherited Create(TParamsParser.Create);
end;

{ TBookTemplater.TParamsParser }

constructor TBookTemplater.TParamsParser.Create;
begin
  inherited Create(
    function (const ParamName: string): Boolean
    begin
      Result := (ParamName = 'a') or(ParamName = 'b') or (ParamName = 'c');
    end
    ,
    GetParam
  );
end;

class function TBookTemplater.TParamsParser.GetParam(const Params: TTestRecord; const ParamName: string): string;
begin
  if ParamName = 'a' then
    Result := IntToStr(Params.AField1)
  else if ParamName = 'b' then
    Result := Params.AField2
  else if ParamName = 'c' then
  begin
    if Params.AField3 then
      Result := 'True'
    else
      Result := 'False';
  end
  else
    Result := 'NO VALUE';
end;

end.
