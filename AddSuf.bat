@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set /p suf=Input:
set /p type=Type:
for /f "delims=" %%a in ('dir /b *.%Type%') do (
    set "name=%%~na"
    set "xname=%%~xa"
    echo "!name!!suf!"
    rename "!name!!xname!" "!name!!suf!!xname!"
)
pause