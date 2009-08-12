REM @ECHO OFF

IF .%1. == .. GOTO usage

SETLOCAL
SET CDIR=%~dp0
SET PATH=%CDIR%;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem

REM Get rid of non-fb2 files
FOR /R %1 %%a IN (??????-??????.zip) DO 7za.exe d %%a *.* -x!*.fb2

ENDLOCAL
GOTO fin

:usage
echo Need path to local LIBRUSEQ archives, for example: clean_nonfb2.cmd c:\librusec\local

:fin

