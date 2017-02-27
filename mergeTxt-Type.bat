@echo off
>fin.txt cd.
for %%a in ("%cd%") do set "name=%%~nxa"
echo]%name%.txt
>fin.txt cd.
for /f "delims=" %%a in ('dir /b /a-d /on *.txt') do (
    <nul set /p=%%a	
    >>fin.txt type %%a
)
ren fin.txt "%name%.txt"
pause