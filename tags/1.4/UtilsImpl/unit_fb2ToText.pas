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

     FIn,FOut: Text;

     procedure ProceedString(FS,TagStart,TagEnd:UTF8String);
     procedure ClearString(var FS:UTF8String);
     procedure GetEncoding( S: string);
  public
    procedure Convert(FileIn, FileOut: string);
  end;

implementation

{ TFb2ToText }

uses
  StrUtils;

procedure TFb2ToText.ClearString(var FS:UTF8String);
begin
  FS := ReplaceStr(FS,'<strong>','');
  FS := ReplaceStr(FS,'</strong>','');
  FS := ReplaceStr(FS,'<i>','');
  FS := ReplaceStr(FS,'</i>','');
  FS := ReplaceStr(FS,'<emphasis>','');
  FS := ReplaceStr(FS,'</emphasis>','');
end;

procedure TFb2ToText.Convert(FileIn, FileOut: string);
var
  i: integer;

  SA: AnsiString;
  S:  UTF8String;
begin

  AssignFile(FIn, FileIn);
  Reset(FIn);

  AssignFile(FOut, FileOut);
  Rewrite(FOut);

  try
    Readln(FIn,S);
    GetEncoding(S);
    i := 1;

    while (pos('<body',S) = 0) and not Eof(FIn) do
    begin
      Readln(FIn,S);
      inc(i);
    end;



    while  not Eof(FIn) do
    begin
      case FEncoding of
        en1251, enUnknown:
                begin
                  Readln(FIn,SA);
                  S := AnsiToUTF8(SA);
                end;
        enUTF8: Readln(FIn,S);
      end;

      if (pos('</section>',S) <> 0)  or
         (pos('</title>',S)   <> 0)  or
         (pos('<empty-line',S)<> 0)   or
         (pos('<subtitle>',S) <> 0)
      then
        Writeln(FOut,'');
      ClearString(S);
      ProceedString(S,'<subtitle>','</subtitle>');
      ProceedString(S,'<p>','</p>');
    end;
  finally
    CloseFile(FIn);
    CloseFile(FOut);
  end;
end;

procedure TFb2ToText.GetEncoding(S: string);
begin
  FEncoding := enUnknown;
  if pos('windows-1251',AnsiLowerCase(s)) <> 0 then FEncoding := en1251;
  if pos('utf-8',AnsiLowerCase(s)) <> 0 then FEncoding := enUTF8;
  if pos('unicode',AnsiLowerCase(s)) <> 0 then FEncoding := enUnicode;

end;

procedure TFb2ToText.ProceedString(FS,TagStart, TagEnd: UTF8String);
var
 p1,p2: integer;
 L : integer;
 US: UTF8String;
 OS: UTF8String;
begin
  L := Length(TagStart);
  p1 := pos(TagStart, FS);

  US := FS;

  while p1 <> 0 do
  begin
    p2 := pos(TagEnd, US);
    OS := copy(US,p1 + L, p2 - p1 - L);
    writeln(FOut,OS);
    Delete(US,1,p2 + 3);
    p1 := pos(TagStart,US);
  end;
end;


end.
