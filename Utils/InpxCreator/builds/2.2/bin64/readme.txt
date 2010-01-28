Command line генератор списков для MyHomeLib версии 1.5.

Я пока старался повторить оригинальный алгоритм из LibFileList, без каких либо
извращений с SQL.

Основные возможности (и отличия от уже имеющегося LibFileList):

1. Работает из командной строки
2. Не надо ничего устанавливать, никаких WAMP, LAMP и т.д. Используется
   embedded MySQL.
3. Результатом работы сразу является INPX файл – не надо ничего переупаковывать
4. Имена полученных INPX файлов могут включать в себя версию (дату) – ту же,
   что и внутри version.info в INPX, так что можно хранить рядом сколько угодно
   копий
5. По умолчанию версия (дата) автоматически берется из дампов Либрусек базы
6. Умеет производить на свет INPX как при наличии off-line архивов Либрусека,
   так и просто из базы данных Либрусека, без архивов. Вариант без архивов
   может беть использован для on-line работы с Либрусек.
7. Не лазит в интернет – в комплект входит командный файл, который умеет
   закачивать как дампы Либрусека, так и ежедневные архивы обновлений.
8. Работает достаточно быстро – полная обработка всех локальных архивов
   Либрусека и дампа сегодняшней базы данных на моем комьютере занимает
   1 минуту.
9. Имеются 32 и 64 битные версии

Для запуска наберите lib2inpx.exe в командном окне:

Import file (INPX) preparation tool for MyHomeLib 1.5
Version 2.2 (MYSQL 5.1.36)

Usage: lib2inpx.exe [options] <path to SQL dump files>

options:
  --help                Print help message
  --ignore-dump-date    Ignore date in the dump files, use current UTC date
                        instead
  --clean-when-done     Remove MYSQL database after processing
  --process arg         What to process - "fb2", "usr", "all" (default: fb2)
  --strict arg          What to put in INPX as file type - "ext", "db",
                        "ignore" (default: ext). ext - use real file extension.
                        db - use file type from database. ignore - ignore files
                        with file extension not equal to file type
  --no-import           Do not import dumps, just check dump time and use
                        existing database
  --archives arg        Path to off-line archives (if not present - entire
                        database in converted for online LibRusEc usage)
  --inpx arg            Full name of output file (default: <dbname>.inpx)

Предположим, что сегодняшние дампы Либрусека лежат в уже распакованном
виде в директории d:\librusec\sql (программа подберет все файлы с расширением
.sql), a локальные архивы Либрусека лежат в директории d:\librusec\local
(программа подберет все файлы с расширением .zip). Тогда выдача следующей
команды: “lib2inpx.exe --process fb2 –archives d:\librusec\local d:\librusec\sql”
приведет к тому, что в поддиректории data (в той же директории, откуда запущена
программа) появится файл librusec_20090804.inpx. На экране при этом вы увидите
что-то вроде:

Creating MYSQL database "librusec_20090804"

Importing - "lib.libavtor.sql"        - done in 00:00:01
Importing - "lib.libavtoraliase.sql"  - done in 00:00:00
Importing - "lib.libavtorname.sql"    - done in 00:00:01
Importing - "lib.libbook.sql"         - done in 00:00:09
Importing - "lib.libfilename.sql"     - done in 00:00:00
Importing - "lib.libgenre.sql"        - done in 00:00:01
Importing - "lib.libgenrelist.sql"    - done in 00:00:00
Importing - "lib.libseq.sql"          - done in 00:00:01
Importing - "lib.libseqname.sql"      - done in 00:00:00

Beginning archives processing - 31 file(s)

Processing - "158326-158457.zip"       - done in 00:00:00
Processing - "158458-158561.zip"       - done in 00:00:00
Processing - "158562-158636.zip"       - done in 00:00:00
Processing - "158637-158693.zip"       - done in 00:00:00
Processing - "158694-158827.zip"       - done in 00:00:00
Processing - "158828-158968.zip"       - done in 00:00:00
Processing - "158969-159071.zip"       - done in 00:00:00
Processing - "159072-159199.zip"       - done in 00:00:00
Processing - "159200-159345.zip"       - done in 00:00:00
Processing - "159346-159470.zip"       - done in 00:00:00
Processing - "159471-159604.zip"       - done in 00:00:00
Processing - "159605-159706.zip"       - done in 00:00:00
Processing - "159707-159834.zip"       - done in 00:00:00
Processing - "159835-159925.zip"       - done in 00:00:01
Processing - "159926-160034.zip"       - done in 00:00:00
Processing - "160035-160256.zip"       - done in 00:00:00
Processing - "160257-160336.zip"       - done in 00:00:00
Processing - "160337-160442.zip"       - done in 00:00:00
Processing - "160443-160588.zip"       - done in 00:00:00
Processing - "fb2-000024-030559.zip"   - done in 00:00:09
Processing - "fb2-030560-060423.zip"   - done in 00:00:10
Processing - "fb2-060424-074391.zip"   - done in 00:00:04
Processing - "fb2-074392-091839.zip"   - done in 00:00:03
Processing - "fb2-091841-104214.zip"   - done in 00:00:03
Processing - "fb2-104215-113436.zip"   - done in 00:00:03
Processing - "fb2-113437-119690.zip"   - done in 00:00:02
Processing - "fb2-119691-132107.zip"   - done in 00:00:03
Processing - "fb2-132108-141328.zip"   - done in 00:00:03
Processing - "fb2-141329-147517.zip"   - done in 00:00:02
Processing - "fb2-147519-153549.zip"   - done in 00:00:02
Processing - "fb2-153556-158325.zip"   - done in 00:00:01

Complete processing took 00:00:59

Выдача “lib2inpx.exe --process usr –archives d:\librusec\local d:\librusec\sql”
произведет на свет librusec_usr_20090804.inpx, в котором соответственно будет
информация по всем файлам, кроме FB2.

Если вы увидели

"Processing - "160443-160588.zip"       - done in 00:00:00 ==> Not in database!"

значит ни одного файла из этого архива не было найдено в процессируемой базe
Либрусека (база старше архивов) или внутри нет ни одного файла подходящего типа
(например FB2 - или не FB2, если вы задавали --process=usr).

Обратите пожалуйста внимание на то, что некоторые архивы Либрусека в настоящий момент
находятся в странном состоянии. Не FB2 книги внутри них могут находиться в
архивированном состоянии (архивы в архивах). Причем использованны могут быть
разные архиваторы - я встретил RAR и ZIP. По умолчанию (или когда использована
опция --strict=ext) программа положит в INPX реальное расширение имени файла и
проигнорирует поле FileType из базы данных. Если задать --strict=db, то в INPX
будет использваться поле FileType из базы данных. И, наконец, если использовано
--strict=ignore, тогда lib2inpx не будет включать в INP файлы, для которых
file extension не совпадает с database file type.

При выдаче следующей комманды:
”lib2inpx.exe d:\librusec\sql” архивы процессироваться не будут и появившийся
на свет librusec_20090804.inpx будет просто содержать все записи из базы
Либрусека (Такой вариант без архивов может быть использован для on-line
работы с Либрусек):

Creating MYSQL database "librusec_20090804"

Importing - "lib.libavtor.sql"        - done in 00:00:01
Importing - "lib.libavtoraliase.sql"  - done in 00:00:00
Importing - "lib.libavtorname.sql"    - done in 00:00:01
Importing - "lib.libbook.sql"         - done in 00:00:09
Importing - "lib.libfilename.sql"     - done in 00:00:01
Importing - "lib.libgenre.sql"        - done in 00:00:01
Importing - "lib.libgenrelist.sql"    - done in 00:00:00
Importing - "lib.libseq.sql"          - done in 00:00:00
Importing - "lib.libseqname.sql"      - done in 00:00:00

Database processing
............................................
132933 records done in 00:00:40

Оставшиеся ключи программы не особенно важны: ”clean-when-done” удалит созданную
при работе MYSQL  базу данных, “ignore-dump-date” проигнорирует дату в дамп
файлах и использует сегодняшнее число (UTC), а ”inpx” позволит указать имя и
путь желаемого INPX файла. Если нужно запускать программу из batch файла много
раз на одном и том же наборе MYSQL дампов можно воспользоваться ключом
--no-import и создавать базу данных один раз.

В предлагаемые архивы входит 2 коммандных файла sync_script_fb2.cmd и sync_script_usr.cmd,
которыe принимают параметр – путь к локальным архивам librusec:
“sync_script.cmd d:\librusec\local”.  При выполнении каждый скрипт для своего типа обработки
(FB2 и USR соответственно)

1. Загрузит недостающие дневные обновления с Либрусека
2. Загрузит сегодняшние дампы базы Либрусека (поддиректория librisec) и распакует их
3. Запустит lib2inpx с обработкой архивов – полученный INPX будет лежать в поддиректории data
4. Запустит lib2inpx для всей базы – полученный INPX будет лежать там же, дде и закачанные с
   Либрусека MYSQL dumps

Если указать в командой строке еше один параметр:
“sync_script.cmd d:\librusec\local skip” то шаги 1 и 2 будут пропущены.

Вы сможете посмотреть логи закачек в файлах wget_archives.log и wget_sql.log
в директории, откуда запущен скрипт.

Осталось создать новую коллекцию в MyHomeLib 1.5 – а можно подменить
librusec.inpx в директории myhomelib и запустить "myhomelib.exe /clean",
чтобы начать все заново :)
