@echo off
setlocal enabledelayedexpansion

rem ---- user config start
rem ori : use filename as origin filename
rem rec : use filename as record filename
set nameMode=rec
rem use space split file type
set fileType=png bat
goto :main
rem after get filename, before record it, user-defined function
rem input arg: filename, the filename not include extension name
rem input arg: extname, the extension name include "."
rem output arg: filename, the filename will record to file
rem output arg: inName, the filename will record to file that another part of complete record
:afterGet

goto :EOF
rem ---- user config end

:main
for %%a in (%fileType%) do (
    set t=!t! *.%%a
)
set "fileType=%t%"

for /f "delims=" %%a in ('dir /b %fileType%') do (
    set "filename=%%~na"
    set "extname=%%~xa"
    set "inName="
    call :afterGet
    if "%nameMode%"=="ori" (
        >> "%~dpnx0" echo/!filename!^|!inName!
    )
    if "%nameMode%"=="rec" (
        >> "%~dpnx0" echo/!inName!^|!filename!
    )
)
pause
goto :EOF

