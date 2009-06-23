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


     procedure ProceedString(FS,TagStart,TagEnd:String);
     procedure ClearString(var FS:String);
     procedure GetEncoding( S: string);
  public
    procedure Convert(FileIn, FileOut: string);
  end;

implementation

{ TFb2ToText }

uses
  StrUtils;

procedure TFb2ToText.ClearString(var FS:String);
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
  SA: AnsiString;
  US:  UTF8String;
  S: string;
begin

  AssignFile(FIn, FileIn);
  Reset(FIn);

  AssignFile(FOut, FileOut);
  Rewrite(FOut);

  try
    Readln(FIn,S);
    GetEncoding(S);

    while (pos('<body',S) = 0) and not Eof(FIn) do
      Readln(FIn,S);

    while  not Eof(FIn) do
    begin
      case FEncoding of
        en1251, enUnknown:
                begin
                  Readln(FIn,SA);
                  US := AnsiToUTF8(SA);
                end;
        enUTF8: Readln(FIn,US);
      end;

      S := UTF8ToString(US);

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

procedure TFb2ToText.ProceedString(FS,TagStart, TagEnd: String);
var
 p1,p2: integer;
 L : integer;
 US: String;
 OS: String;
begin
  L := Length(TagStart);
  p1 := pos(TagStart, FS);

  US := FS;

  while p1 <> 0 do
  begin
    p2 := pos(TagEnd, US);
    OS := copy(US,p1 + L, p2 - p1 - L);
    writeln(FOut,UTF8Encode(OS));
    Delete(US,1,p2 + 3);
    p1 := pos(TagStart,US);
  end;
end;


end.
