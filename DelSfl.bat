@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set /p filetype=Input:
for /f "delims=" %%a in ('dir /b *.%filetype%') do (
    echo %%a.%filetype%
    del /q "%%a.%filetype%"
)
pause