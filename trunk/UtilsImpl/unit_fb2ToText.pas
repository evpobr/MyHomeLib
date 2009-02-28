unit unit_fb2ToText;
interface

uses
  Classes,
  Windows,
  SysUtils;

type

   TFb2ToText = class
   private
     FEncoding : (enUnknown, en1251,enUTF8, enUnicode);
     FS: string;
     FLinesIn : TStringList;
     FLinesOut : TStringList;
     procedure ProceedString(TagStart,TagEnd:string);
     procedure ClearString;
     procedure GetEncoding( S: string);
  public
    constructor Create;
    destructor Destroy;
    procedure Convert(FileIn: string);
    property Output:TStringList read FLinesOut;
  end;

implementation

{ TFb2ToText }

uses
  StrUtils;

procedure TFb2ToText.ClearString;
begin
  FS := ReplaceStr(FS,'<strong>','');
  FS := ReplaceStr(FS,'</strong>','');
  FS := ReplaceStr(FS,'<i>','');
  FS := ReplaceStr(FS,'</i>','');
  FS := ReplaceStr(FS,'<emphasis>','');
  FS := ReplaceStr(FS,'</emphasis>','');

end;

procedure TFb2ToText.Convert(FileIn: string);
var
  i: integer;
begin
  FLinesOut.Clear;
  FLinesIn.LoadFromFile(FileIn);


  GetEncoding(FLinesIn[0]);

  i := 0;
  while pos('<body',FLinesIn[i]) = 0 do
      inc(i);

  for i := i to FLinesIn.Count - 1 do
  begin
    FS := FLinesIn[i];

    if (pos('</section>',FS) <> 0)  or
       (pos('</title>',FS)   <> 0)  or
       (pos('<empty-line',FS)<> 0)   or
       (pos('<subtitle>',FS) <> 0)
      then
        FLinesOut.Add('');
    ClearString;
    ProceedString('<subtitle>','</subtitle>');
    ProceedString('<p>','</p>');
  end;
end;

constructor TFb2ToText.Create;
begin
  inherited;
  FLinesIn := TStringList.Create;
  FLinesOut := TStringList.Create;
end;

destructor TFb2ToText.Destroy;
begin
  FLinesIn.Free;
  FLinesOut.Free;
  inherited Destroy;
end;

procedure TFb2ToText.GetEncoding(S: string);
begin
  FEncoding := enUnknown;
  if pos('windows-1251',AnsiLowerCase(s)) <> 0 then FEncoding := en1251;
  if pos('utf-8',AnsiLowerCase(s)) <> 0 then FEncoding := enUTF8;
  if pos('unicode',AnsiLowerCase(s)) <> 0 then FEncoding := enUnicode;

end;

procedure TFb2ToText.ProceedString(TagStart,TagEnd: string);
var
 p1,p2: integer;
 L : integer;
 US: UTF8String;

begin
  L := Length(TagStart);
  p1 := pos(TagStart, FS);

  if FEncoding = en1251 then
      US := AnsiToUTF8(FS)
  else
    US := FS;
 
  while p1 <> 0 do
  begin
    p2 := pos(TagEnd, US);
    FLinesOut.Add(copy(US,p1 + L, p2 - p1 - L));
    Delete(US,1,p2 + 3);
    p1 := pos(TagStart,US);
  end;

end;

end.
