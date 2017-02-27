@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set /p filetype=Input:
set /p chr=Input:
for /f "tokens=1,2* delims=%chr%" %%a in ('dir /b *.%filetype%') do (
    set "name=%%a%chr%%%b"
    set "newname=%%a.%filetype%"
    echo "!newname!"
    rename "!name!" "!newname!"
)
pause