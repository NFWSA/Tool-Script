@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set /p pre=Input:
for /f "delims=" %%a in ('dir /b *.mp3') do (
    set "name=%%a"
    echo "!pre!x!name!"
    rename "!name!" "!pre!-!name!"
)
pause
exit /b

:strlen
set a=%1
set b=0
for /l %%c in (1, 0, 2) do (
    
)