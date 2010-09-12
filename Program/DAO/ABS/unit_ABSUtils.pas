unit unit_ABSUtils;

interface

uses
  ABSMain;

type
  //
  // Вспомогательные классы для облегчения работы и устранения ошибок.
  //
  TABSQueryEx = class(TABSQuery)
  public
    constructor Create(ADatabase: TABSDatabase; const AQueryText: string);
  end;

  TABSTableEx = class(TABSTable)
  public
    constructor Create(ADatabase: TABSDatabase; const ATableName: string);
  end;


implementation

{ TABSTableEx }

constructor TABSTableEx.Create(ADatabase: TABSDatabase; const ATableName: string);
begin
  inherited Create(ADatabase);
  Assert(Assigned(ADatabase));
  SessionName := ADatabase.SessionName;
  DatabaseName := ADatabase.DatabaseName;
  TableName := ATableName;
end;

{ TABSQueryEx }

constructor TABSQueryEx.Create(ADatabase: TABSDatabase; const AQueryText: string);
begin
  inherited Create(ADatabase);
  Assert(Assigned(ADatabase));
  SessionName := ADatabase.SessionName;
  DatabaseName := ADatabase.DatabaseName;
  SQL.Text := AQueryText;
end;

end.
