@ECHO OFF
SETLOCAL

IF .%1. == .. GOTO usage

SET SITE=http://lib.rus.ec
SET CDIR=%~dp0
SET PATH=%CDIR%;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem
SET WDIR=%~dp0librusec

IF NOT .%2. == .. GOTO skip

IF EXIST %WDIR%_old RD /Q /S %WDIR%_old
IF EXIST %WDIR%     MOVE %WDIR% %WDIR%_old
MD %WDIR%

REM Download latest daily archives
wget --user-agent=Mozilla/5.0 --append-output=%CDIR%\wget_archives.log --recursive --no-directories --no-parent --no-remove-listing --accept=*.zip --directory-prefix=%1 --no-clobber %SITE%/all/daily

REM Download latest database
FOR %%t IN (libgenrelist libbook libavtoraliase libavtorname libavtor libgenre libseq libseqname libfilename) DO wget --user-agent=Mozilla/5.0 --append-output=%CDIR%\wget_sql.log --directory-prefix=%WDIR% %SITE%/sql/lib.%%t.sql.gz & gzip -d %WDIR%/lib.%%t.sql.gz

:skip

REM Create INPX file for FB2
%CDIR%\lib2inpx.exe --process=fb2 --archives=%1 %WDIR%
IF %ERRORLEVEL% GTR 0 GOTO fin

REM Create INPX file for FB2 (complete database, online usage)
%CDIR%\lib2inpx.exe --process=fb2 --no-import --inpx=%WDIR%\librusec.inpx %WDIR%
IF %ERRORLEVEL% GTR 0 GOTO fin

REM Create INPX file for non-FB2
%CDIR%\lib2inpx.exe --process=usr --archives=%1 --no-import --clean-when-done %WDIR%

GOTO fin

:usage
echo Need path to local LIBRUSEQ archives, for example: "sync_script.cmd c:\librusec\local"
echo If there is second parameter - daily archives would not be downloaded and cleaned from
echo non-FB2 files, for example "sync_script.cmd c:\librusec\local skip"

:fin
ENDLOCAL

