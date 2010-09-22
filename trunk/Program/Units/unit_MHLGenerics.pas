unit unit_MHLGenerics;

interface

uses
  Windows,
  Generics.Collections;

type
  TInterfaceCache<TKeyType; T: IInterface> = class
  private type
    TInterfaceAdapter = class
    public
      constructor Create(const Value: T);

    private
      FValue: T;
    end;

  private
    FMap: TObjectDictionary<TKeyType, TInterfaceAdapter>;
    FLock: TRTLCriticalSection;

  public
    constructor Create;
    destructor Destroy; override;

    procedure LockMap; inline;
    procedure UnlockMap; inline;

    function ContainsKey(const key: TKeyType): Boolean;
    procedure Add(const key: TKeyType; const Value: T);
    function Get(const key: TKeyType): T;
    procedure Remove(const key: TKeyType);
  end;

  TConversion<T> = reference to function(const items: T): string;
  TValueSetter<T> = reference to procedure(var Item: T; const Value: string);

  TArrayUtils = class
  public
    class function Join(
      const Values: array of string;
      const itemDelimeter: string
    ): string; overload;

    class function Join<T>(
      const Values: array of T;
      const itemDelimeter: string;
      const Converter: TConversion<T>
    ): string; overload;

    class function Join<T>(
      const Values: TEnumerable<T>;
      const itemDelimeter: string;
      const Converter: TConversion<T>
    ): string; overload;

    class procedure Split(
      const Value: string;
      const itemDelimeter: string;
      var AItems: array of string
    ); overload;

    class procedure Split<T>(
      const Value: string;
      const itemDelimeter: string;
      var AItems: array of T;
      const Setter: TValueSetter<T>
    ); overload;
  end;

implementation

uses
  StrUtils;

{ TInterfaceCache<TKeyType, T>.TInterfaceAdapter }

constructor TInterfaceCache<TKeyType, T>.TInterfaceAdapter.Create(const Value: T);
begin
  inherited Create;
  FValue := Value;
end;

{ TInterfaceCache<TKeyType, T> }

constructor TInterfaceCache<TKeyType, T>.Create;
begin
  inherited Create;
  InitializeCriticalSection(FLock);
  FMap := TObjectDictionary<TKeyType, TInterfaceAdapter>.Create([doOwnsValues]);
end;

destructor TInterfaceCache<TKeyType, T>.Destroy;
begin
  LockMap;    // Make sure nobody else is inside the list.
  try
    FMap.Free;
    inherited Destroy;
  finally
    UnlockMap;
    DeleteCriticalSection(FLock);
  end;
end;

procedure TInterfaceCache<TKeyType, T>.LockMap;
begin
  EnterCriticalSection(FLock);
end;

procedure TInterfaceCache<TKeyType, T>.UnlockMap;
begin
  LeaveCriticalSection(FLock);
end;

function TInterfaceCache<TKeyType, T>.ContainsKey(const key: TKeyType): Boolean;
begin
  LockMap;
  try
    Result := FMap.ContainsKey(key);
  finally
    UnlockMap;
  end;
end;

procedure TInterfaceCache<TKeyType, T>.Add(const key: TKeyType; const Value: T);
begin
  LockMap;
  try
    FMap.Add(key, TInterfaceAdapter.Create(Value));
  finally
    UnlockMap;
  end;
end;

function TInterfaceCache<TKeyType, T>.Get(const key: TKeyType): T;
begin
  LockMap;
  try
    Result := FMap[key].FValue;
  finally
    UnlockMap;
  end;
end;

procedure TInterfaceCache<TKeyType, T>.Remove(const key: TKeyType);
begin
  LockMap;
  try
    FMap.Remove(key);
  finally
    UnlockMap;
  end;
end;

{ TArrayUtils }

class function TArrayUtils.Join(const Values: array of string; const itemDelimeter: string): string;
var
  L, R: Integer;
begin
  if Length(Values) = 0 then
    Exit;

  L := Low(Values);
  R := High(Values);

  Result := Values[L];
  Inc(L);

  while L <= R do
  begin
    Result := Result + itemDelimeter + Values[L];
    Inc(L);
  end;
end;

class function TArrayUtils.Join<T>(const Values: array of T; const itemDelimeter: string; const Converter: TConversion<T>): string;
var
  i, L, R: Integer;
begin
  if Length(Values) = 0 then
    Exit;

  L := Low(Values);
  R := High(Values);

  Result := Converter(Values[L]);
  Inc(L);

  while L <= R do
  begin
    Result := Result + itemDelimeter + Converter(Values[L]);
    Inc(L);
  end;
end;

class function TArrayUtils.Join<T>(
  const Values: TEnumerable<T>;
  const itemDelimeter: string;
  const Converter: TConversion<T>
  ): string;
var
  Enum: TEnumerator<T>;
begin
  Enum := Values.GetEnumerator();
  try
    if Enum.MoveNext then
    begin
      Result := Converter(Enum.Current);
      while Enum.MoveNext do
        Result := Result + itemDelimeter + Converter(Enum.Current);
    end;
  finally
    Enum.Free;
  end;
end;

class procedure TArrayUtils.Split(
  const Value: string;
  const itemDelimeter: string;
  var AItems: array of string
);
var
  ValueLen: Integer;
  SeparatorLen: Integer;
  StartPos: Integer;
  SeparatorPos: Integer;

  ItemsLen: Integer;

  s: string;
begin
  ValueLen := Length(Value);
  SeparatorLen := Length(itemDelimeter);
  StartPos := 1;
  ItemsLen := Length(AItems);

  SeparatorPos := PosEx(itemDelimeter, Value, StartPos);
  while SeparatorPos <> 0 do
  begin
    s := Copy(Value, StartPos, SeparatorPos - StartPos);
    StartPos := SeparatorPos + SeparatorLen;
    SeparatorPos := PosEx(itemDelimeter, Value, StartPos);

    //SetLength(AItems, ItemsLen + 1);
    AItems[ItemsLen] := s;
    Inc(ItemsLen);
  end;

  if StartPos < ValueLen then
  begin
    s := Copy(Value, StartPos, ValueLen);
    //SetLength(Items, ItemsLen + 1);
    AItems[ItemsLen] := s;
  end;
end;

class procedure TArrayUtils.Split<T>(
  const Value: string;
  const itemDelimeter: string;
  var AItems: array of T;
  const Setter: TValueSetter<T>
);
var
  ValueLen: Integer;
  SeparatorLen: Integer;
  StartPos: Integer;
  SeparatorPos: Integer;

  ItemsLen: Integer;

  s: string;
begin
  ValueLen := Length(Value);
  SeparatorLen := Length(itemDelimeter);
  StartPos := 1;
  ItemsLen := Length(AItems);

  SeparatorPos := PosEx(itemDelimeter, Value, StartPos);
  while SeparatorPos <> 0 do
  begin
    s := Copy(Value, StartPos, SeparatorPos - StartPos);
    StartPos := SeparatorPos + SeparatorLen;
    SeparatorPos := PosEx(itemDelimeter, Value, StartPos);
    //SetLength(AItems, ItemsLen + 1);
    Setter(AItems[ItemsLen], s);
    Inc(ItemsLen);
  end;

  if StartPos < ValueLen then
  begin
    s := Copy(Value, StartPos, ValueLen);
    //SetLength(AItems, ItemsLen + 1);
    Setter(AItems[ItemsLen], s);
  end;
end;

end.
