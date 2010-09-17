(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           Nick Rymanov (nrymanov@gmail.com)
  * Created             08.09.2010
  * Description
  *
  * $Id$
  *
  * History
  *
  ****************************************************************************** *)

(*

Достаточка простая progress engine.

Назначение:
  - установка хинтов прогресса в зависимости от возможности показать точный прогресс
  - генерация сообщений о ходе прогресса только в случае реального изменения прогресса

TODO:
  - названия методов не очень удачные
  - плохо обрабатывается Total = 0
  - нет поддержки подопераций
  - необходимо иметь возможность менять сообщение вместе с основным прогрессом

*)

unit unit_ProgressEngine;

interface

uses
  ComCtrls;

type
  TProgressEvent = procedure (Percent: Integer) of object;
  TSetCommentEvent = procedure (const Msg: string) of object;
  TProgressHintEvent = procedure (Style: TProgressBarStyle; State: TProgressBarState) of object;

  TProgressEngine = class
  private const
    DefaultThreshold = 500;

  private
    FTotal: Integer;
    FCurrent: Integer;
    FPercent: Integer;
    FThreshold: Integer;
    FShortCommentFormat: string;
    FLongCommentFormat: string;

    FSetProgress: TProgressEvent;
    FSetComment: TSetCommentEvent;
    FProgressHint: TProgressHintEvent;

  public
    constructor Create;
    //destructor Done; override;

    procedure BeginOperation(const Total: Integer; const ShortCommentFormat: string; const LongCommentFormat: string);
    procedure EndOperation;
    procedure AddProgress(const Value: Integer = 1);
    function GetProgress: Integer;
    function GetComment: string;

    property OnSetProgress: TProgressEvent read FSetProgress write FSetProgress;
    property OnSetComment: TSetCommentEvent read FSetComment write FSetComment;
    property OnProgressHint: TProgressHintEvent read FProgressHint write FProgressHint;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  Math;

{ TProgressInfo }

constructor TProgressEngine.Create;
begin
  inherited Create;
end;

procedure TProgressEngine.BeginOperation(const Total: Integer; const ShortCommentFormat, LongCommentFormat: string);
begin
  FTotal := Total;
  FCurrent := 0;
  FPercent := 0;

  FThreshold := 0;
  if FTotal > 0 then
  begin
    FThreshold := Min(FTotal div 20, DefaultThreshold);
    if FThreshold = 0 then
      FThreshold := 1;
  end;
  if FThreshold = 0 then
    FThreshold := 1;

  FShortCommentFormat := ShortCommentFormat;
  FLongCommentFormat := LongCommentFormat;

  if Assigned(FProgressHint) then
  begin
    if FTotal > 0 then
      FProgressHint(pbstNormal, pbsNormal)
    else
      FProgressHint(pbstMarquee, pbsNormal);
  end;

  if Assigned(FSetProgress) then
    FSetProgress(GetProgress);

  if Assigned(FSetComment) then
    FSetComment(GetComment);
end;

procedure TProgressEngine.EndOperation;
begin
  if Assigned(FProgressHint) then
    FProgressHint(pbstNormal, pbsNormal);

  if Assigned(FSetProgress) then
    FSetProgress(100);

  if Assigned(FSetComment) then
    FSetComment(GetComment);
end;

procedure TProgressEngine.AddProgress(const Value: Integer);
var
  Percent: Integer;
begin
  Inc(FCurrent, Value);
  if FTotal > 0 then
  begin
    Percent := Min(FCurrent * 100 div FTotal, 100);
    if FPercent <> Percent then
    begin
      FPercent := Percent;
      if Assigned(FSetProgress) then
        FSetProgress(GetProgress);
    end;
    if ((FCurrent mod FThreshold) = 0) then
    begin
      if Assigned(FSetComment) then
        FSetComment(GetComment);
    end;
  end
  else
  begin
    if ((FCurrent mod FThreshold) = 0) then
    begin
      if Assigned(FSetComment) then
        FSetComment(GetComment);
    end;
    if (FThreshold < 100) and (FCurrent >= (FThreshold * 10)) then
      FThreshold := Min(FCurrent div 5, DefaultThreshold);
  end;
end;

function TProgressEngine.GetProgress: Integer;
begin
  Result := Min(IfThen(FTotal > 0, FPercent, FCurrent), 100);
end;

function TProgressEngine.GetComment: string;
begin
  Result := Format(IfThen(FTotal > 0, FLongCommentFormat, FShortCommentFormat), [FCurrent, FTotal]);
end;


end.
