(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Created             12.02.2010
  * Description         Класс работы с шаблонами
  * Author(s)           Matvienko Sergei  matv84@mail.ru
  *
  * History
  * NickR 15.02.2010    Код переформатирован
  *
  ****************************************************************************** *)

unit unit_Templater;

interface

uses
  dm_Collection,
  FictionBook_21,
  unit_Database,
  unit_Globals;

const
  COL_MASK_ELEMENTS = 11;

type
  TErrorType = (ErFine, ErTemplate, ErBlocks, ErElements);
  TTemplateType = (TpFile, TpPath, TpText);

  TElement = record
    name: string;
    BegBlock, EndBlock: Integer;
  end;

  TTemplater = class
  private
    FTemplate: string;
    FBlocksMap: array of TElement;

  public
    constructor Create;

    function ValidateTemplate(const Template: string; TemplType: TTemplateType): TErrorType;
    function SetTemplate(Template: string; TemplType: TTemplateType): TErrorType;
    function ParseString(R: TBookRecord; TemplType: TTemplateType): string;
  end;

implementation

uses
  SysUtils,
  unit_Consts,
  dm_user;

constructor TTemplater.Create;
begin
  inherited;
  FTemplate := '';
end;

function TTemplater.ValidateTemplate(const Template: string; TemplType: TTemplateType): TErrorType;
const
  { DONE : совпадает с названием константы }
  MASK_ELEMENTS: array [1 .. COL_MASK_ELEMENTS] of string = ('f', 'fa', 't', 's', 'n', 'id', 'g', 'ga', 'ff', 'fl', 'rg');
var
  stack: array of TElement;
  h, k, i, j, StackPos, ElementPos, ColElements, last_char, last_col_elements: Integer;
  bol, TemplEnd: boolean;
  TemplatePart: string;
begin
  if Template = '' then
  begin
    Result := ErTemplate;
    Exit;
  end;

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
    while (not(Template[k] = '\')) and (k <= Length(Template)) do
    begin
      TemplatePart := TemplatePart + Template[k];
      Inc(k);
    end;
    Inc(k);
    // Если больше нет элементов пути, то итеррация крайняя
    if k > Length(Template) then
      TemplEnd := True;

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
        if stack[StackPos].name = '' then
        begin
          Result := ErElements;
          Exit;
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
        bol := false;
        for j := 1 to High(MASK_ELEMENTS) do
          if UpperCase(FBlocksMap[h].name) = UpperCase(MASK_ELEMENTS[j]) then
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

  // Если проверяем шаблон имени файла, то бэкслэш не допустим
  if TemplType = TpFile then
    for i := 1 to Length(Template) do
      if Template[i] = '\' then
      begin
        Result := ErTemplate;
        Exit;
      end;

  // Если замечаний нет, то шаблон валиден
  Result := ErFine;
end;

function TTemplater.SetTemplate(Template: String; TemplType: TTemplateType): TErrorType;
begin
  Result := ValidateTemplate(Template, TemplType);

  // Спецсимволы чистим только для имени файла или пути к файлу
  if TemplType in [TpFile, TpPath] then
    Template := CheckSymbols(Template);

  if Result = ErFine then
    FTemplate := Trim(Template);
end;

function TTemplater.ParseString(R: TBookRecord; TemplType: TTemplateType): string;
type
  TMaskElement = record
    templ, value: string;
  end;

  TMaskElements = array [1 .. COL_MASK_ELEMENTS] of TMaskElement;
var
  AuthorName, Firstname, MiddleName, Lastname, s: string;
  i, j: Integer;
  MaskElements: TMaskElements;
begin
  Result := FTemplate;

  // Формирование массива значений элементов маски
  MaskElements[1].templ := 'ga';
  for i := Low(R.Genres) to High(R.Genres) do
  begin
    MaskElements[1].value := MaskElements[1].value + R.Genres[i].Alias;
    if i < High(R.Genres) then
      MaskElements[1].value := MaskElements[1].value + ', ';
  end;

  MaskElements[2].templ := 'rg';
  MaskElements[2].value := Trim(R.RootGenre.Alias);

  MaskElements[3].templ := 'g';
  if R.GenreCount > 0 then
    MaskElements[3].value := Trim(R.Genres[0].Alias)
  else
    MaskElements[3].value := '';

  MaskElements[4].templ := 'ff';
  if R.AuthorCount > 0 then
  begin
    s:= Trim(R.Authors[Low(R.Authors)].FLastName);
    MaskElements[4].value := s[1];
  end
  else
    MaskElements[4].value := '';

  MaskElements[6].templ := 'fl';
  MaskElements[6].value := MaskElements[4].value;

  MaskElements[5].templ := 'fa';
  AuthorName := '';
  if R.AuthorCount > 0 then
    for i := Low(R.Authors) to High(R.Authors) do
    begin
      Lastname := R.Authors[i].FLastName;
      if R.Authors[i].FFirstName <> '' then
        Firstname := ' ' + R.Authors[i].FFirstName[1] + '.';
      if R.Authors[i].FMiddleName <> '' then
        MiddleName := ' ' + R.Authors[i].FMiddleName[1] + '.';
      AuthorName := AuthorName + Lastname + Firstname + MiddleName;
      if i < High(R.Authors) then
        AuthorName := AuthorName + ', ';
    end;
  MaskElements[5].value := AuthorName;

  MaskElements[7].templ := 'f';
  if R.AuthorCount > 0 then
    MaskElements[7].value := Trim(R.Authors[0].GetFullName)
  else
    MaskElements[7].value := '';

  MaskElements[8].templ := 's';
  if R.Serie <> NO_SERIES_TITLE then
    MaskElements[8].value := Trim(R.Serie)
  else
    MaskElements[8].value := '';

  MaskElements[9].templ := 'n';
  if R.SeqNumber <> 0 then
    MaskElements[9].value := IntToStr(R.SeqNumber)
  else
    MaskElements[9].value := '';

  MaskElements[10].templ := 't';
  MaskElements[10].value := Trim(R.Title);

  MaskElements[11].templ := 'id';
  MaskElements[11].value := IntToStr(R.LibID);

  // Цикл удаления "пустых" блоков
  for i := Low(MaskElements) to High(MaskElements) do
    for j := Low(FBlocksMap) to High(FBlocksMap) do
      if (MaskElements[i].templ = FBlocksMap[j].name) and (MaskElements[i].value = '') then
        if (FBlocksMap[j].BegBlock <> 0) and (FBlocksMap[j].EndBlock <> 0) then
        begin
          Delete(Result, FBlocksMap[j].BegBlock, FBlocksMap[j].EndBlock - FBlocksMap[j].BegBlock + 1);
          // Здесь ещё продумаю вариант удаления записей о вложенных элементах без валидации
          ValidateTemplate(Result, TemplType);
        end;

  // Цикл удаления квадратных скобок
  for i := Length(Result) downto 1 do
    if CharInSet(Result[i], ['[', ']']) then
      Delete(Result, i, 1);

  // Цикл замены элементов шаблона их значениями
  for i := 1 to COL_MASK_ELEMENTS do
  begin
    StrReplace('%' + UpperCase(MaskElements[i].templ), Transliterate(MaskElements[i].value), Result);
    StrReplace('%' + MaskElements[i].templ, MaskElements[i].value, Result);
  end;
end;

end.
