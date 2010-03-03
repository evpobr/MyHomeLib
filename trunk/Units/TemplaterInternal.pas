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

unit TemplaterInternal;

{$IFOPT D+}
{.$DEFINE SUPPORT_DUMP}
{$ENDIF}

interface

uses
  Classes,
  SysUtils,
{$IFDEF SUPPORT_DUMP}
  ComCtrls,
{$ENDIF}
  Generics.Collections;

type
  // --------------------------------------------------------------------------
  ETemplateError = class(Exception)
  public
    FErrorPosition: Integer;
  end;

resourcestring
  EInvalidTemplate = 'Неверный шаблон, позиция %d';
  EInvalidParam = 'Нераспознанный параметр "%s"';
  EUnopenedBracket = 'Неоткрытая скобка, позиция %d';
  EUnclosedBracket = 'Незакрытая скобка, позиция %d';

type
  // --------------------------------------------------------------------------
  TCheckParamFunc<T> = reference to function(const paramName: string): Boolean;
  TGetValueFunc<T> = reference to function(const params: T; const paramName: string): string;

  IParamsParser<T> = interface
    function CheckParam(const paramName: string): Boolean;
    function GetValue(const params: T; const paramName: string): string;
  end;

  TBaseParamsParser<T> = class(TInterfacedObject, IParamsParser<T>)
  strict private
    FCheckParam: TCheckParamFunc<T>;
    FGetValue: TGetValueFunc<T>;

  public
    constructor Create(const checkParam: TCheckParamFunc<T>; const getValue: TGetValueFunc<T>);

    function CheckParam(const paramName: string): Boolean;
    function GetValue(const params: T; const paramName: string): string;
  end;

  // --------------------------------------------------------------------------
  TTemplateElement<T> = class
  protected
    function MinWeight: Integer; virtual; abstract;
    function GetValue(const params: T; out strValue: string): Integer; virtual; abstract;

    procedure RaiseTemplateError(const Msg: string; nPos: Integer = -1);
{$IFDEF SUPPORT_DUMP}
  public
    procedure Dump(tv: TTreeView; Parent: TTreeNode); virtual; abstract;
{$ENDIF}
  end;

  TLiteralTemplateElement<T> = class(TTemplateElement<T>)
  strict private
    FValue: string;

  protected
    constructor Create(const Value: string);

    function MinWeight: Integer; override;
    function GetValue(const params: T; out strValue: string): Integer; override;
{$IFDEF SUPPORT_DUMP}
  public
    function ToString: string; override;
    procedure Dump(tv: TTreeView; Parent: TTreeNode); override;
{$ENDIF}
  end;

  TParamTemplateElement<T> = class(TTemplateElement<T>)
  strict private
    FParamParser: IParamsParser<T>;
    FParamName: string;

    procedure RaiseTemplateError(const paramName: string);

  protected
    constructor Create(paramParser: IParamsParser<T>; const paramName: string);

    function MinWeight: Integer; override;
    function GetValue(const params: T; out strValue: string): Integer; override;
{$IFDEF SUPPORT_DUMP}
  public
    function ToString: string; override;
    procedure Dump(tv: TTreeView; Parent: TTreeNode); override;
{$ENDIF}
  end;

  TBlockTemplateElement<T> = class(TTemplateElement<T>)
  strict private
    FParamParser: IParamsParser<T>;
    FTopLevel: Boolean;
    FElements: TObjectList < TTemplateElement < T >> ;

    procedure AddLiteral(const Value: string);
    procedure AddParam(const Value: string);

    procedure ParseParamOrLitral(const strTemplate: string; startPos: Integer; out endPos: Integer);
    procedure ParseBlock(const strTemplate: string; startPos: Integer; out endPos: Integer);
    procedure Parse(const strTemplate: string; startPos: Integer; out endPos: Integer);

  protected
    function MinWeight: Integer; override;
    function GetValue(const params: T; out strValue: string): Integer; override;

  public
    constructor Create(paramParser: IParamsParser<T>);
    destructor Destroy; override;

    procedure SetTemplate(const strTemplate: string);

    function Value(const params: T): string;
{$IFDEF SUPPORT_DUMP}
  public
    function ToString: string; override;
    procedure Dump(tv: TTreeView; Parent: TTreeNode); override;
{$ENDIF}
  end;

implementation

uses
  Character;

{ TBaseParamsParser }

constructor TBaseParamsParser<T>.Create(const checkParam: TCheckParamFunc<T>; const getValue: TGetValueFunc<T>);
begin
  inherited Create;
  FCheckParam := checkParam;
  FGetValue := getValue;
end;

function TBaseParamsParser<T>.CheckParam(const paramName: string): Boolean;
begin
  Result := FCheckParam(paramName);
end;

function TBaseParamsParser<T>.GetValue(const params: T; const paramName: string): string;
begin
  Result := FGetValue(params, paramName);
end;

{ TTemplateElement }
procedure TTemplateElement<T>.RaiseTemplateError(const Msg: string; nPos: Integer = -1);
var
  Error: ETemplateError;
begin
  if nPos = -1 then
    Error := ETemplateError.Create(Msg)
  else
    Error := ETemplateError.CreateFmt(Msg, [nPos]);
  Error.FErrorPosition := nPos;

  raise Error;
end;

{ TLiteralTemplateElement }

constructor TLiteralTemplateElement<T>.Create(const Value: string);
begin
  inherited Create;
  FValue := Value;
end;

function TLiteralTemplateElement<T>.MinWeight: Integer;
begin
  Result := 0;
end;

function TLiteralTemplateElement<T>.GetValue(const params: T; out strValue: string): Integer;
begin
  strValue := FValue;
  Result := 0;
end;

{ TParamTemplateElement }

constructor TParamTemplateElement<T>.Create(paramParser: IParamsParser<T>; const paramName: string);
begin
  inherited Create;
  FParamParser := paramParser;
  if not FParamParser.CheckParam(paramName) then
    RaiseTemplateError(paramName);
  FParamName := paramName;
end;

procedure TParamTemplateElement<T>.RaiseTemplateError(const paramName: string);
begin
  raise ETemplateError.CreateFmt(EInvalidParam, [paramName]);
end;

function TParamTemplateElement<T>.MinWeight: Integer;
begin
  Result := 1;
end;

function TParamTemplateElement<T>.GetValue(const params: T; out strValue: string): Integer;
begin
  strValue := Trim(FParamParser.GetValue(params, FParamName));
  if strValue = '' then
    Result := 0
  else
    Result := 1;
end;

{ TBlockTemplateElement }

constructor TBlockTemplateElement<T>.Create(paramParser: IParamsParser<T>);
begin
  inherited Create;
  FParamParser := paramParser;
  FTopLevel := True;
  FElements := TObjectList < TTemplateElement < T >> .Create;
  FElements.OwnsObjects := True;
end;

destructor TBlockTemplateElement<T>.Destroy;
begin
  FElements.Free;
  inherited;
end;

procedure TBlockTemplateElement<T>.AddLiteral(const Value: string);
begin
  FElements.Add(TLiteralTemplateElement<T>.Create(Value));
end;

procedure TBlockTemplateElement<T>.AddParam(const Value: string);
begin
  FElements.Add(TParamTemplateElement<T>.Create(FParamParser, Value));
end;

procedure TBlockTemplateElement<T>.Parse(const strTemplate: string; startPos: Integer; out endPos: Integer);
var
  nPos: Integer;
  nLen: Integer;
  ch: Char;
  strLiteral: string;
begin
  nPos := startPos;
  nLen := Length(strTemplate);

  while nPos <= nLen do
  begin
    ch := strTemplate[nPos];

    if ch = '[' then
    begin
      if strLiteral <> '' then
      begin
        AddLiteral(strLiteral);
        strLiteral := '';
      end;
      ParseBlock(strTemplate, nPos + 1, nPos);
      Continue;
    end
    else if ch = ']' then
    begin
      if strLiteral <> '' then
      begin
        AddLiteral(strLiteral);
        strLiteral := '';
      end;

      if FTopLevel then
        RaiseTemplateError(EUnopenedBracket, nPos);

      // + проверки на пустоту ??? уже забыл зачем

      endPos := nPos + 1;
      Exit;
    end
    else if ch = '%' then
    begin
      if strLiteral <> '' then
      begin
        AddLiteral(strLiteral);
        strLiteral := '';
      end;
      ParseParamOrLitral(strTemplate, nPos + 1, nPos);
      Continue;
    end;

    strLiteral := strLiteral + ch;
    Inc(nPos);
  end;

  if not FTopLevel then
    RaiseTemplateError(EUnclosedBracket, startPos - 1);

  if strLiteral <> '' then
  begin
    AddLiteral(strLiteral);
    strLiteral := '';
  end;
end;

procedure TBlockTemplateElement<T>.ParseBlock(const strTemplate: string; startPos: Integer; out endPos: Integer);
var
  blockElement: TBlockTemplateElement<T>;
begin
  blockElement := TBlockTemplateElement<T>.Create(FParamParser);
  try
    blockElement.FTopLevel := False;
    blockElement.Parse(strTemplate, startPos, endPos);
    FElements.Add(blockElement);
  except
    blockElement.Free;
    raise ;
  end;
end;

procedure TBlockTemplateElement<T>.ParseParamOrLitral(const strTemplate: string; startPos: Integer; out endPos: Integer);
var
  nPos: Integer;
  nLen: Integer;
  ch: Char;
  strLiteral: string;

begin
  nPos := startPos;
  nLen := Length(strTemplate);

  if nPos > nLen then
    RaiseTemplateError(EInvalidTemplate, startPos - 1);

  ch := strTemplate[nPos];

  if CharInSet(ch, ['%', '[', ']']) then
  begin
    AddLiteral(ch);
    endPos := nPos + 1;
    Exit;
  end;

  while nPos <= nLen do
  begin
    ch := strTemplate[nPos];
    if not IsLetter(ch) then
      Break;

    strLiteral := strLiteral + ch;
    Inc(nPos);
  end;

  if strLiteral = '' then
    RaiseTemplateError(EInvalidTemplate, startPos - 1);

  AddParam(strLiteral);
  endPos := nPos;
end;

procedure TBlockTemplateElement<T>.SetTemplate(const strTemplate: string);
var
  endPos: Integer;
begin
  FElements.Clear;

  try
    Parse(strTemplate, 1, endPos);
  except
    FElements.Clear;
    raise ;
  end;
end;

function TBlockTemplateElement<T>.MinWeight: Integer;
begin
  Result := 0;
end;

function TBlockTemplateElement<T>.GetValue(const params: T; out strValue: string): Integer;
var
  e: TTemplateElement<T>;
  strElementValue: string;
  eWeight: Integer;
  nWeight: Integer;
begin
  strValue := '';
  Result := 0;

  nWeight := 0;

  for e in FElements do
  begin
    eWeight := e.GetValue(params, strElementValue);
    if (eWeight < e.MinWeight) and not FTopLevel then
      Exit;

    if eWeight > 0 then
      Inc(nWeight);
    strValue := strValue + strElementValue;
  end;

  if (nWeight = 0) and not FTopLevel then
  begin
    strValue := '';
    Result := 0;
  end
  else
  begin
    Result := 1;
  end;
end;

function TBlockTemplateElement<T>.Value(const params: T): string;
begin
  GetValue(params, Result);
end;

{$IFDEF SUPPORT_DUMP}

function TParamTemplateElement<T>.ToString: string;
begin
  Result := '%' + FParamName;
end;

procedure TParamTemplateElement<T>.Dump(tv: TTreeView; Parent: TTreeNode);
begin
  tv.Items.AddChild(Parent, 'Param = |' + ToString + '|, Weight = ' + IntToStr(MinWeight));
end;

function TLiteralTemplateElement<T>.ToString: string;
begin
  Result := FValue;
end;

procedure TLiteralTemplateElement<T>.Dump(tv: TTreeView; Parent: TTreeNode);
begin
  tv.Items.AddChild(Parent, 'Literal = |' + ToString + '|, Weight = ' + IntToStr(MinWeight));
end;

function TBlockTemplateElement<T>.ToString: string;
var
  el: TTemplateElement<T>;
begin
  Result := '';
  for el in FElements do
    Result := Result + el.ToString;

  if not FTopLevel then
    Result := '[' + Result + ']';
end;

procedure TBlockTemplateElement<T>.Dump(tv: TTreeView; Parent: TTreeNode);
var
  s: string;
  Node: TTreeNode;
  el: TTemplateElement<T>;
begin
  if FTopLevel then
    s := 'Template = |' + ToString + '|'
  else
    s := 'Block = |' + ToString + '|';

  Node := tv.Items.AddChild(Parent, s + ', Weight = ' + IntToStr(MinWeight));

  for el in FElements do
    el.Dump(tv, Node);

  Node.Expand(True);
end;

{$ENDIF}

end.
