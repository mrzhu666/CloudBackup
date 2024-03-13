@echo off
setlocal

set "input="
set /p input=Enter a string: 

if "%input%"=="" (
    set "input=Default string value"
)

echo The final string is: %input%

endlocal

pause