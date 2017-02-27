@echo off
>fin.txt cd.
for %%a in ("%cd%") do set "name=%%~nxa"
echo]%name%.txt
for /f "delims=" %%a in ('dir /b /a-d /on *.txt') do (
    <nul set /p=%%a	
    >nul copy /a fin.txt + %%a fin.txt
)
ren fin.txt "%name%.txt"
pause