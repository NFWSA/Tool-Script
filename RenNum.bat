@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set /p filetype=Input:
set i=1000
for /f "delims=" %%a in ('dir /b *.%filetype%') do (
    echo %%~nxa  !i:~1!%%~xa
    rename "%%~nxa" "!i:~1!%%~xa"
    set /a i+=1
)
pause