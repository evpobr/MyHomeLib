(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Класс работы с шаблонами
  *
  * Version 1.0
  * 31.01.2010
  * Copyright (c) Aleksey Penkov  alex.penkov@gmail.com
  * Author        Matvienko Sergei  matv84@mail.ru
  *
  ****************************************************************************** *)

unit unit_Templater;

interface

uses dm_Collection;

type
  TErrorType = (ErFine, ErTemplate, ErBlocks, ErElements);

  TElement = record
    name: string;
    BegBlock, EndBlock: integer;
  end;

  TTemplater = class
  private
    FTemplate: string;
    FParsedString: string;
    FBlocksMap: array of TElement;
  public
    constructor Create;
    function ValidateTemplate(Template: string): TErrorType;
    function SetTemplate(Template: string): TErrorType;
    procedure ParseTemplate(ACollection: TDMCollection);
    function GetParsedString: string;
  end;

implementation

uses
  SysUtils, unit_Globals, unit_Consts;

constructor TTemplater.Create;
begin
  inherited;
  FParsedString := '';
  FTemplate := '';
end;

function TTemplater.ValidateTemplate(Template: string): TErrorType;
const
  mask_elements: array [1 .. 8] of string = ('f', 't', 's', 'n', 'id', 'g', 'fl', 'rg');
var
  stack: array of TElement;
  h, k, i, j, StackPos, ElementPos, ColElements, last_char, last_col_elements: integer;
  bol, TemplEnd: boolean;
  TemplatePart: string;
begin
  // Поправка на количество частей пути в карту элементов и блоков (используется при разборе путей)
  last_col_elements := 0;
  last_char := 0;

  // Определение количества элементов в шаблоне
  ColElements := 0;
  for i := 1 to Length(Template) do
    if Template[i] = '%' then
      Inc(ColElements);

  // Установка необходимой размерности и инициализация массивов
  SetLength(stack, ColElements);
  SetLength(FBlocksMap, ColElements);
  for i := 0 to ColElements - 1 do
  begin
    stack[i].name := '';
    FBlocksMap[i].name := '';
  end;

  TemplEnd := false;
  k := 1;
  while not(TemplEnd) do
  begin
    i := 1;
    TemplatePart := '';

    // Разбор пути к файлу на составляющие
    while (not(Template[k] in ['/', '\'])) and (k <= Length(Template)) do
    begin
      TemplatePart := TemplatePart + Template[k];
      Inc(k);
    end;
    Inc(k);
    // Если больше нет элементов пути, то итеррация крайняя
    if k > Length(Template) then
      TemplEnd := true;

    // Инициализация счётчика глубины стека и элементов шаблона
    StackPos := 0;
    ElementPos := 0;
    while i <= Length(TemplatePart) do
    begin
      // Поиск открывающей скобки блока элемента
      if TemplatePart[i] = '[' then
      begin
        Inc(StackPos);
        stack[StackPos].BegBlock := i;
        stack[StackPos].name := '';
      end;

      // Поиск элемента шаблона
      if TemplatePart[i] = '%' then
      begin
        // Если внутри блока имеется более одного элемента, то шаблон неправильный
        if (stack[StackPos].name <> '') and (StackPos > 0) then
        begin
          Result := ErTemplate; // В блоке не может быть более одного элемента
          Exit;
        end;

        // Выделяем название элемента
        Inc(i);
        stack[StackPos].name := '';
        while CharInSet(TemplatePart[i], ['a' .. 'z', 'A' .. 'Z']) do
        begin
          stack[StackPos].name := stack[StackPos].name + TemplatePart[i];
          Inc(i);
        end;
        Dec(i);

        // Добавляем элемент в общий список элементов
        if StackPos = 0 then
        begin
          FBlocksMap[ElementPos + last_col_elements].name := stack[StackPos].name;
          FBlocksMap[ElementPos + last_col_elements].BegBlock := 0;
          FBlocksMap[ElementPos + last_col_elements].EndBlock := 0;
          Inc(ElementPos);
        end;
      end;

      // Поиск окончания блока элемента
      if TemplatePart[i] = ']' then
      begin
        // Если на текущем уровне стека нет элемента или элемент на 0-м уровне
        // то шаблон неправильный
        if (stack[StackPos].name = '') or (StackPos <= 0) then
        begin
          Result := ErBlocks; // Проверьте соответствие открывающих и закрывающих скобок блоков элементов
          Exit;
        end;
        stack[StackPos].EndBlock := i;

        // Добавляем элемент в общий список элементов
        FBlocksMap[ElementPos + last_col_elements].name := stack[StackPos].name;
        FBlocksMap[ElementPos + last_col_elements].BegBlock := stack[StackPos].BegBlock + last_char;
        FBlocksMap[ElementPos + last_col_elements].EndBlock := stack[StackPos].EndBlock + last_char;
        Inc(ElementPos);

        Dec(StackPos);
      end;

      // Переход к очередному символу в шаблоне
      Inc(i);
    end;

    // Имеются незакрытые скобки блоков
    if StackPos > 0 then
    begin
      Result := ErBlocks; // Проверьте соответствие открывающих и закрывающих скобок блоков элементов
      Exit;
    end;

    // Проверка всех элементов на правильность написания
    for h := Low(FBlocksMap) to High(FBlocksMap) do
    begin
      if FBlocksMap[h].name <> '' then
      begin
        bol := False;
        for j := 1 to High(mask_elements) do
          if FBlocksMap[h].name = mask_elements[j] then
          begin
            bol := True;
            Break;
          end;

        if not(bol) then
          Break;
      end;
    end;

    // Имеются неверние элементы шаблона
    if not(bol) then
    begin
      Result := ErElements; // Неверные элементы шаблона
      Exit;
    end;

    Inc(last_col_elements, ElementPos);

    // Поправка на количество символов с начала строки шаблона в
    // карту элементов и блоков (используется при разборе путей)
    last_char := last_char + k - 1;

    // Переход к очередному символу в шаблоне с целью обработки следующей части пути к файлу
    Inc(i);
  end;

  // Если замечаний нет, то шаблон валиден
  Result := ErFine;
end;

function TTemplater.SetTemplate(Template: String): TErrorType;
begin
  Result := ValidateTemplate(Template);
  if Result = ErFine then
    FTemplate := Template;
end;

procedure TTemplater.ParseTemplate(ACollection: TDMCollection);
const
  mask_elements = 8;
type
  TMaskElement = record
    templ, value: string;
  end;
var
  AuthorName, FirstName, MiddleName, LastName: string;
  MaskElements: array [1 .. mask_elements] of TMaskElement;
  i, j: integer;
  R: TBookRecord;
begin
  FParsedString := FTemplate;

  // Получение текущей книги
  ACollection.GetCurrentBook(R);

  // Формирование массива значений элементов маски
  MaskElements[1].templ := 's';
  if R.Series <> NO_SERIES_TITLE then
    MaskElements[1].value := R.Series
  else
    MaskElements[1].value := '';

  MaskElements[2].templ := 'n';
  if R.SeqNumber <> 0 then
    MaskElements[2].value := IntToStr(R.SeqNumber)
  else
    MaskElements[2].value := '';

  MaskElements[3].templ := 't';
  MaskElements[3].value := R.Title;

  MaskElements[4].templ := 'f';
  AuthorName := '';
  for i := Low(R.Authors) to High(R.Authors) do
  begin
    LastName := R.Authors[i].FLastName;
    if R.Authors[i].FFirstName <> '' then
      FirstName := ' ' + R.Authors[i].FFirstName[1] + '.';
    if R.Authors[i].FMiddleName <> '' then
      MiddleName := ' ' + R.Authors[i].FMiddleName[1] + '.';
    AuthorName := AuthorName + LastName + FirstName + MiddleName;
    if i < High(R.Authors) then
      AuthorName := AuthorName + ', ';
  end;
  MaskElements[4].value := AuthorName;

  MaskElements[5].templ := 'id';
  MaskElements[5].value := IntToStr(R.LibID);

  MaskElements[6].templ := 'g';
  for i := Low(R.Genres) to High(R.Genres) do
  begin
    MaskElements[6].value := MaskElements[6].value + R.Genres[i].Alias;
    if i < High(R.Genres) then
      MaskElements[6].value := MaskElements[6].value + ', ';
  end;

  MaskElements[7].templ := 'fl';
  MaskElements[7].value := R.Authors[Low(R.Authors)].FLastName[1];

  MaskElements[8].templ := 'rg';
  MaskElements[8].value := ACollection.GetRootGenre(R.LibID);

  // Цикл удаления "пустых" блоков
  for i := Low(MaskElements) to High(MaskElements) do
    for j := Low(FBlocksMap) to High(FBlocksMap) do
      if (MaskElements[i].templ = FBlocksMap[j].name) and (MaskElements[i].value = '') then
        if (FBlocksMap[j].BegBlock <> 0) and (FBlocksMap[j].EndBlock <> 0) then
        begin
          Delete(FParsedString, FBlocksMap[j].BegBlock, FBlocksMap[j].EndBlock - FBlocksMap[j].BegBlock + 1);
          // Здесь ещё продумаю вариант удаления записей о вложенных элементах без валидации
          ValidateTemplate(FParsedString);
        end;

  // Цикл удаления квадратных скобок
  for i := Length(FParsedString) downto 1 do
    if CharInSet(FParsedString[i], ['[', ']']) then
      Delete(FParsedString, i, 1);

  // Цикл замены элементов шаблона их значениями
  for i := 1 to mask_elements do
    StrReplace('%' + MaskElements[i].templ, MaskElements[i].value, FParsedString);
end;

function TTemplater.GetParsedString: string;
begin
  Result := FParsedString;
end;

end.
