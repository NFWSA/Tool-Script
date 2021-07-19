@echo off
rem from filename replace specific string with target string.
SETLOCAL ENABLEDELAYEDEXPANSION
set /p T=Types:
set /p str=Replaced String:
set /p tar=Target String:
for %%a in (%T%) do (
    set type=!type! "*%str%*.%%a"
)
for /f "delims=" %%a in ('dir /b !type!') do (
    set "name=%%~na"
    echo "%%~a" =^> "!name:%str%=%tar%!%%~xa"
    rename "%%~a" "!name:%str%=%tar%!%%~xa"
)
pause