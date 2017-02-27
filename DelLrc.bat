@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "delims=" %%a in ('dir /b *.lrc') do (
    set "name=%%~na"
    echo !name!
    if not exist "!name!.mp3" (
        if not exist "!name!.wma" (
            if not exist "!name!.ape" (
                if not exist "!name!.wav" del /q "!name!.lrc"
            )
        )
    )
)
pause