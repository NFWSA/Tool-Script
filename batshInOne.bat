#!/usr/bin/bash
goto :bat || clear
echo posix bash
# content begin
echo $1
echo $*
# content end
echo click enter to exit
read
exit
:bat
@echo off & cls
echo windows batch
rem content begin
echo %1
echo %*
pause
rem content end
echo click enter to exit
pause >nul 2>nul
goto :EOF