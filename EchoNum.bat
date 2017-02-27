@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set /p left=Left:
set /p right=Right:
set /p size=Size:
for /l %%a in (0 1 %size%) do (
    echo %left%%%a%right%
)
pause