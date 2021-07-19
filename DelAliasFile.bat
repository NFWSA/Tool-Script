@echo off
rem for specific file x.typei£¬if there not exist x.type1¡¢x.type2..x.typen,
rem then delete file x.typei
SETLOCAL ENABLEDELAYEDEXPANSION
set /p typei=Type(Only one):
set /p types=Needs Types:

for /f "delims=" %%a in ('dir /b /a-d *.%typei%') do (
	call :chk-file "%%~na" "%%~xa"
)
pause
goto :EOF

:chk-file
rem %1 is filename, %2 is suffix name
for %%x in (%types%) do (
	if exist "%~1.%%x" goto :chk-file-exist
)
:chk-file-not-exist
echo/%~1
del /q "%~1%~2"
:chk-file-exist
goto :EOF
