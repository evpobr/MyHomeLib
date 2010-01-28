REM @ECHO OFF

IF .%1. == .. GOTO usage

REM Get rid of non-fb2 files
FOR /R %1 %%a IN (??????-??????.zip) DO 7za.exe d %%a *.* -x!*.fb2

GOTO fin

:usage
echo Need path to local LIBRUSEQ archives, for example: clean_nonfb2.cmd c:\librusec\local

:fin

