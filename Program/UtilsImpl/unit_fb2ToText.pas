(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2011 Aleksey Penkov
  *
  * Author Aleksey Penkov   alex.penkov@gmail.com
  *
  ****************************************************************************** *)
unit unit_fb2ToText;

interface

uses
  Classes,
  Windows,
  SysUtils,
  unit_globals;

type

   TFb2ToText = class
   private
     FSourceEncoding : TTXTEncoding;
     FResEncoding : TTXTEncoding;

     FIn, FOut: Text;

     procedure ProceedString(const FS: string; const TagStart: string; const TagEnd: string);
     procedure ClearString(var FS:String);
     procedure GetEncoding(const S: string);

  public
    procedure Convert(const FileIn: string; const FileOut: string; ResEncoding: TTXTEncoding);
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
  FS := ReplaceStr(FS,'<stanza>','');
  FS := ReplaceStr(FS,'</stanza>','');
  FS := ReplaceStr(FS,'<poem>','');
  FS := ReplaceStr(FS,'</poem>','');
  FS := ReplaceStr(FS,'<v>','');
  FS := ReplaceStr(FS,'</v>','');
end;

procedure TFb2ToText.Convert(const FileIn: string; const FileOut: string; ResEncoding: TTXTEncoding);
var
  SA: AnsiString;
  US:  UTF8String;
  S: string;
begin
  FResEncoding := ResEncoding;

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
      case FSourceEncoding of
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

procedure TFb2ToText.GetEncoding(const S: string);
begin
  FSourceEncoding := enUnknown;

  if Pos('windows-1251', AnsiLowerCase(S)) <> 0 then
    FSourceEncoding := en1251
  else if Pos('utf-8', AnsiLowerCase(S)) <> 0 then
    FSourceEncoding := enUTF8
  else if Pos('unicode', AnsiLowerCase(S)) <> 0 then
    FSourceEncoding := enUnicode;
end;

procedure TFb2ToText.ProceedString(const FS: string; const TagStart: string; const TagEnd: string);
var
 p1, p2: Integer;
 L: Integer;
 US: string;
 OS: string;
begin
  L := Length(TagStart);
  p1 := Pos(TagStart, FS);

  US := FS;

  while p1 <> 0 do
  begin
    p2 := Pos(TagEnd, US);
    OS := Copy(US,p1 + L, p2 - p1 - L);
    case FResEncoding of
      en1251:    Writeln(FOut, UTF8toAnsi(UTF8Encode(OS)));
      enUTF8:    Writeln(FOut, UTF8Encode(OS));
      enUnicode: Writeln(FOut, OS);
    end;
    Delete(US, 1, p2 + 3);
    p1 := Pos(TagStart, US);
  end;
end;


end.
