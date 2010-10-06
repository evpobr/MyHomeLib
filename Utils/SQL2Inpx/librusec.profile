[DATA]
Script=ADD name %USER%ADD password %PASS%POST %URL%b/%LIBID%/getGET %RESURL%CHECK
Tables=libgenrelist.sql.gzlibbook.sql.gzlibavtoraliase.sql.gzlibavtorname.sql.gzlibavtor.sql.gzlibgenre.sql.gzlibseq.sql.gzlibseqname.sql.gzlib.librate.sql.gz
SQLUtrl=http://lib.rus.ec/sql/
URL=http://lib.rus.ec/
INPxName=librusec
UpdateName=librusec_update
ExtraName=extra_update
ExtraInfo=last_extra.info
StartID=216641
Code=65536
Descr=Архивы сайта lib.rus.ec [fb2]
Title=Локальная коллекция Lib.rus.ec
Short=librusec
DBName=librusec
Info name=last_librusec.info
Fb2Only=1
MaxCompress=0
Folder=F:\Books\Lib.Rus.Ec + MyHomeLib[FB2]\lib.rus.ec
FileMask=fb2-*.zip
oldFormat=0
Post-Query=ALTER ignore TABLE `libbook` CHANGE `bid` `BookId` int(10);ALTER ignore TABLE `libavtor` CHANGE `bid` `BookId` int(10);ALTER ignore TABLE `libavtor` CHANGE `aid` `AvtorId` int(10);ALTER ignore TABLE `libavtorname` CHANGE `aid` `AvtorId` int(10);ALTER ignore TABLE `libgenre` CHANGE `bid` `BookId` int(10);ALTER ignore TABLE `libgenre` CHANGE `gid` `GenreId` int(10);ALTER ignore TABLE `libgenrelist` CHANGE `gid` `GenreId` int(10);ALTER ignore TABLE `libgenrelist` CHANGE `code` `GenreCode` varchar(45);ALTER ignore TABLE `libseq` CHANGE `bid` `BookId` int(10);ALTER ignore TABLE `libseq` CHANGE `sid` `SeqId` int(10);ALTER ignore TABLE `libseq` CHANGE `sn` `SeqNumb` int(10);ALTER ignore TABLE `libseqname` CHANGE `sid` `SeqId` int(10);
UseRole=1

