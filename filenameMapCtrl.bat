@echo off
setlocal enabledelayedexpansion

rem ---- user config start
rem ori : use origin filename as filename
rem rec : use record filename as filename
set nameMode=ori
rem use space split file type
set fileType=png
rem ---- user config end

set srcLines=0
for /f "tokens=1,2* delims=:" %%a in ('findstr /n ".*" "%~dpnx0"') do (
	set /a srcLines+=1
	if "%%b" == "END-FILE-MARK" goto :lineFin
)
:lineFin

for %%a in (%fileType%) do (
    set t=!t! *.%%a
)
set "fileType=%t%"
for /f "tokens=1,2* delims=^|" %%a in ('more /e "%~dpnx0" +%srcLines%') do (
    set "name[%%a]=%%b"
    set "tar[%%b]=%%a"
)
echo/
echo            Warning: name cannot include / \ : ? " < > |
echo    a. add filename map[rename file if needed]
echo    c. change filename with record
echo    r. recover filename
choice /c acr /n /m "a, c, r ?"
if %errorlevel% equ 1 goto :addMap
if %errorlevel% equ 2 goto :chanName
if %errorlevel% equ 3 goto :recovName
echo Error!
pause
goto :EOF

rem add filename map part
:addMap
cls
for /f "delims=" %%a in ('dir /b %fileType%') do (
    if "%nameMode%"=="ori" (
        if "!name[%%~na]!"=="" (
            set /p tarName=%%~nxa :  
            if not "!tarName!"=="" (
                >> "%~dpnx0" echo/%%~na^|!tarName!
                echo file "%%~nxa" recorded.
            ) else (
                echo Null filename, so skip the file.
            )
        )
    )
    if "%nameMode%"=="rec" (
        if "!tar[%%~na]!"=="" (
            set /p tarName=%%~nxa :  
            if not "!tarName!"=="" (
                >> "%~dpnx0" echo/%%~na^|!tarName!
                echo/"%%~nxa" = "!tarName!%%~xa"
                rename "%%~nxa" "!tarName!%%~xa"
            ) else (
                echo Null filename, so skip the file.
            )
        )
    )
)
pause
goto :EOF

rem change filename to record name
:chanName
cls
for /f "delims=" %%a in ('dir /b %fileType%') do (
    if not "!name[%%~na]!"=="" (
        echo/"%%~nxa" = "!name[%%~na]!%%~xa"
        rename "%%~nxa" "!name[%%~na]!%%~xa"
    )
)
pause
goto :EOF

rem recover filename to origin name
:recovName
cls
for /f "delims=" %%a in ('dir /b %fileType%') do (
    if not "!tar[%%~na]!"=="" (
        echo/"%%~nxa" = "!tar[%%~na]!%%~xa"
        rename "%%~nxa" "!tar[%%~na]!%%~xa"
    )
)
pause
goto :EOF

END-FILE-MARK
