@echo off
rem delete prefix string and suffix string from filename of specific type files
SETLOCAL ENABLEDELAYEDEXPANSION
set /p pre=Prefix:
set /p suf=Suffix:
set /p fileType=Types:
for %%a in (%fileType%) do (
    set t=!t! "!pre!*!suf!.%%a"
)
set "fileType=%t%"
call :strlen "!pre!" pre
call :strlen "!suf!" suf

for /f "delims=" %%a in ('dir /b %fileType%') do (
    set "name=%%~na"
    set "nname=%%~na"
    set "xname=%%~xa"
    if %pre% neq 0 set "nname=!nname:~%pre%!"
    if %suf% neq 0 set "nname=!nname:~0,-%suf%!"
    echo "!name!!xname!" =^> "!nname!!xname!"
    rename "!name!!xname!" "!nname!!xname!"
)
pause
goto :EOF

:strlen
rem %1 is str, %2 is return size
setlocal enabledelayedexpansion
set "$=%~1#"
set len=0&for %%a in (1024 512 256 128 64 32 16 8 4 2 1)do if !$:~%%a^,1!. NEQ . set/a len+=%%a&set $=!$:~%%a!
endlocal & set /a %2=%len%
goto :EOF