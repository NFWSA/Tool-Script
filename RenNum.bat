@echo off
rem replace filename with counted number.
SETLOCAL ENABLEDELAYEDEXPANSION
set /p fileType=Types:
set /p beg=Begin Number (default 0):
set /p width=Number Width (default 3):

if "%beg%" == "" set beg=0
if "%width%" == "" set width=3
for %%a in (%fileType%) do (
    set t=!t! "*.%%a"
)
set "fileType=%t%"
set i=1
for /l %%a in (%width% -1 1) do set i=!i!0
set /a i+=%beg%

for /f "delims=" %%a in ('dir /b %fileType%') do (
    echo "%%~nxa" =^> "!i:~1!%%~xa"
    rename "%%~nxa" "!i:~1!%%~xa"
    set /a i+=1
)
pause