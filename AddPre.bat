@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set /p pre=Input:
for /f "delims=" %%a in ('dir /b *.lrc *.mp3 *.wma *.ape *.wav') do (
    set "name=%%a"
    echo "!pre!-!name!"
    rename "!name!" "!pre!-!name!"
)
pause