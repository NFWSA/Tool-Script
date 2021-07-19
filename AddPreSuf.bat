@echo off
rem add prefix string and suffix string to filename of specific type files
SETLOCAL ENABLEDELAYEDEXPANSION
set /p pre=Prefix:
set /p suf=Suffix:
set /p fileType=Types:
for %%a in (%fileType%) do (
    set t=!t! *.%%a
)
set "fileType=%t%"

for /f "delims=" %%a in ('dir /b %fileType%') do (
    set "name=%%~na"
    set "xname=%%~xa"
    echo "!name!!xname!" =^> "!pre!!name!!suf!!xname!"
    rename "!name!!xname!" "!pre!!name!!suf!!xname!"
)
pause