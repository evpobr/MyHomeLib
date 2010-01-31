{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 1                                                                    }
{ 31.01.2010                                                                   }
{ Copyright (c) Matvienko Sergei  matv84@mail.ru                               }
{                                                                              }
{   Класс работы с шаблонами                                                   }
{******************************************************************************}

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
    Template: string;
    ParsedString: string;
    BlocksMap: array of TElement;
  public
    constructor Create;
    function ValidateTemplate(Template: string): TErrorType;
    function SetTemplate(Template: String): TErrorType;
    procedure ParseTemplate(ACollection: TDMCollection);
    function GetParsedString: string;
  end;

implementation
uses SysUtils, unit_Globals, unit_Consts;

constructor TTemplater.Create;
begin
  inherited;
  ParsedString:= '';
  Template:= '';
end;

function TTemplater.ValidateTemplate(Template: string): TErrorType;
const mask_elements: array[1..8] of string = ('f', 't', 's', 'n', 'id', 'g', 'fl', 'rg');
var stack: array of TElement;
    h, k, i, j, StackPos, ElementPos, ColElements, last_char, last_col_elements: integer;
    bol, TemplEnd: boolean;
    TemplatePart: string;
begin
  // Поправка на количество частей пути в карту элементов и блоков (используется при разборе путей)
  last_col_elements:= 0;
  last_char:= 0;
  // Определение количества элементов в шаблоне
  ColElements:= 0;
  for i := 1 to Length(Template) do
    if Template[i] = '%' then
      inc(ColElements);
  // Установка необходимой размерности и инициализация массивов
  SetLength(stack, ColElements);
  SetLength(BlocksMap, ColElements);
  for i := 0 to ColElements - 1 do
  begin
    stack[i].name:= '';
    BlocksMap[i].name:= '';
  end;
  TemplEnd:= false;
  k:= 1;
  while not(TemplEnd) do
  begin
    i:= 1;
    TemplatePart:= '';

    // Разбор пути к файлу на составляющие
    while (not(Template[k] in ['/', '\'])) and (k <= Length(Template)) do
    begin
      TemplatePart:= TemplatePart + Template[k];
      inc(k);
    end;
    inc(k);
    // Если больше нет элементов пути, то итеррация крайняя
    if k > Length(Template) then TemplEnd:= true;

    // Инициализация счётчика глубины стека и элементов шаблона
    StackPos:= 0;
    ElementPos:= 0;
    while i <= Length(TemplatePart) do
    begin
      // Поиск открывающей скобки блока элемента
      if TemplatePart[i] = '[' then
      begin
        inc(StackPos);
        Stack[StackPos].BegBlock:= i;
        Stack[StackPos].name:= '';
      end;

      // Поиск элемента шаблона
      if TemplatePart[i] = '%' then
      begin
        // Если внутри блока имеется более одного элемента, то шаблон неправильный
        if (Stack[StackPos].name <> '') and (StackPos > 0) then
        begin
          Result:= ErTemplate;  //  В блоке не может быть более одного элемента
          exit;
        end;

        // Выделяем название элемента
        inc(i);
        Stack[StackPos].name:= '';
        while CharInSet(TemplatePart[i], ['a'..'z', 'A'..'Z']) do
        begin
          Stack[StackPos].name:= Stack[StackPos].name + TemplatePart[i];
          inc(i);
        end;
        dec(i);

        // Добавляем элемент в общий список элементов
        if StackPos = 0 then
        begin
          BlocksMap[ElementPos + last_col_elements].name:= Stack[StackPos].name;
          BlocksMap[ElementPos + last_col_elements].BegBlock:= 0;
          BlocksMap[ElementPos + last_col_elements].EndBlock:= 0;
          inc(ElementPos);
        end;

      end;

      // Поиск окончания блока элемента
      if TemplatePart[i]=']' then
      begin
        // Если на текущем уровне стека нет элемента или элемент на 0-м уровне
        // то шаблон неправильный
        if (Stack[StackPos].name = '') or (StackPos <= 0) then
        begin
          Result:= ErBlocks; // Проверьте соответствие открывающих и закрывающих скобок блоков элементов
          exit;
        end;
        Stack[StackPos].EndBlock:= i;

        // Добавляем элемент в общий список элементов
        BlocksMap[ElementPos + last_col_elements].name:= Stack[StackPos].name;
        BlocksMap[ElementPos + last_col_elements].BegBlock:= Stack[StackPos].BegBlock + last_char;
        BlocksMap[ElementPos + last_col_elements].EndBlock:= Stack[StackPos].EndBlock + last_char;
        inc(ElementPos);

        dec(StackPos);
      end;

      // Переход к очередному символу в шаблоне
      inc(i);
    end;

    // Проверка всех элементов на правильность написания
    for h := Low(BlocksMap) to High(BlocksMap) do
    begin
      if BlocksMap[h].name <> '' then
      begin
        bol:= false;
        for j := 1 to High(mask_elements) do
          if BlocksMap[h].name = mask_elements[j]
            then bol:= true;

        if not(bol) then
          break;
      end;
    end;

    // Имеются незакрытые скобки блоков
    if StackPos > 0 then
    begin
      Result:= ErBlocks; // Проверьте соответствие открывающих и закрывающих скобок блоков элементов
      exit;
    end;
    // Имеются неверние элементы шаблона
    if not(bol) then
    begin
      Result:= ErElements;   // Неверные элементы шаблона
      exit;
    end;

    inc(last_col_elements, ElementPos);

    // Поправка на количество символов с начала строки шаблона в
    // карту элементов и блоков (используется при разборе путей)
    last_char := last_char + k - 1;

    // Переход к очередному символу в шаблоне с целью обработки следующей части пути к файлу
    inc(i);
  end;

  // Если замечаний нет, то шаблон валиден
  Result:= ErFine;
end;

function TTemplater.SetTemplate(Template: String): TErrorType;
begin
  Result:= ValidateTemplate(Template);
  if Result = ErFine then
    Self.Template:= Template;
end;

procedure TTemplater.ParseTemplate(ACollection: TDMCollection);
const mask_elements = 8;
type TMaskElement = record
       templ, value: string;
     end;
var AuthorName, FirstName, MiddleName, LastName: string;
    MaskElements: array [1..mask_elements] of TMaskElement;
    i, j: integer;
    R: TBookRecord;
begin
  ParsedString:= Self.Template;

  // Получение текущей книги
  ACollection.GetCurrentBook(R);

  // Формирование массива значений элементов маски
  MaskElements[1].templ:= 's';
  if R.Series <> NO_SERIES_TITLE then
    MaskElements[1].value:= R.Series
  else MaskElements[1].value:= '';

  MaskElements[2].templ:= 'n';
  if R.SeqNumber <> 0 then
    MaskElements[2].value:= IntToStr(R.SeqNumber)
  else MaskElements[2].value:= '';

  MaskElements[3].templ:= 't';
  MaskElements[3].value:= R.Title;

  MaskElements[4].templ:= 'f';
  AuthorName:= '';
  for i:= low(R.Authors) to high(R.Authors) do
  begin
    LastName:= R.Authors[i].FLastName;
    if R.Authors[i].FFirstName <> '' then
      FirstName:= ' ' + R.Authors[i].FFirstName[1] + '.';
    if R.Authors[i].FMiddleName <> '' then
      MiddleName:= ' ' + R.Authors[i].FMiddleName[1] + '.';
    AuthorName := AuthorName + LastName + FirstName + MiddleName;
    if i < high(R.Authors) then AuthorName:= AuthorName + ', ';
  end;
  MaskElements[4].value:= AuthorName;

  MaskElements[5].templ:= 'id';
  MaskElements[5].value:= IntToStr(R.LibID);

  MaskElements[6].templ:= 'g';
  for i := Low(R.Genres) to High(R.Genres) do
  begin
    MaskElements[6].value:= MaskElements[6].value + R.Genres[i].Alias;
    if i < High(R.Genres) then
      MaskElements[6].value:= MaskElements[6].value + ', ';
  end;


  MaskElements[7].templ:= 'fl';
  MaskElements[7].value:= R.Authors[low(R.Authors)].FLastName[1];

  MaskElements[8].templ:= 'rg';
  MaskElements[8].value:= ACollection.GetRootGenre(R.LibID);

  // Цикл удаления "пустых" блоков
  for i := 1 to High(MaskElements) do
    for j := 1 to High(BlocksMap) do
      if (MaskElements[i].templ = BlocksMap[j].name) and
         (MaskElements[i].value = '') then
        if (BlocksMap[j].BegBlock <> 0) and (BlocksMap[j].EndBlock <> 0) then
        begin
          Delete(ParsedString, BlocksMap[j].BegBlock,
                               BlocksMap[j].EndBlock - BlocksMap[j].BegBlock + 1);
          // Здесь ещё продумаю вариант удаления записей о вложенных элементах без валидации
          ValidateTemplate(ParsedString);
        end;

  // Цикл удаления квадратных скобок
  for i := Length(ParsedString) downto 1 do
    if CharInSet(ParsedString[i], ['[', ']']) then
      delete(ParsedString, i, 1);

  // Цикл замены элементов шаблона их значениями
  for i := 1 to mask_elements do
    StrReplace('%'+MaskElements[i].templ, MaskElements[i].value, ParsedString);
end;

function TTemplater.GetParsedString: string;
begin
  Result:= ParsedString;
end;

end.
