@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set /p chr=Delimiter:
set /p field=Field Index (default 2):
set /p filetype=Types:
for %%a in (%filetype%) do (
    set type=!type! "*%chr%*.%%a"
)
for /f "tokens=1,2* delims=%chr%" %%a in ('dir /b *.%filetype%') do (
    set "name=%%a%chr%%%b"
    set "newname=%%a.%filetype%"
    echo "!newname!"
    rename "!name!" "!newname!"
)
pause