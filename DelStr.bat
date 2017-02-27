@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set /p T=Input file type:
set /p str=Input the string:
for %%a in (%T%) do (
    set type=!type! *.%%a
)
for /f "delims=" %%a in ('dir /b !type!') do (
    set "name=%%a"
    echo "!name:%str%=!"
    rename "!name!" "!name:%str%=!"
)
pause