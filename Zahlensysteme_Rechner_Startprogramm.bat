@echo off
setlocal

REM --- Define locations ---
set "DOWNLOADS=%USERPROFILE%\Downloads\Zahlensysteme_Rechner.jar"
set "HOMEFILE=%USERPROFILE%\Zahlensysteme_Rechner.jar"

echo --- Searching for Zahlensysteme_Rechner.jar ---

REM --- 1st: Check Downloads folder ---
if exist "%DOWNLOADS%" (
    echo Found file in Downloads.
    
    REM Copy to home directory if missing
    if not exist "%HOMEFILE%" (
        echo Copying to home directory...
        copy "%DOWNLOADS%" "%HOMEFILE%" >nul
    ) else (
        echo File already exists in home directory.
    )
    
    goto run
)

REM --- 2nd: Check Home directory as fallback ---
if exist "%HOMEFILE%" (
    echo File not found in Downloads, but found in home directory.
    goto run
)

REM --- If not found anywhere ---
echo ERROR: Could not find Zahlensysteme_Rechner.jar in Downloads or Home directory!
pause
exit /b

:run
echo Starting Zahlensysteme_Rechner.jar ...
cd "%USERPROFILE%"
java -jar "Zahlensysteme_Rechner.jar"
endlocal
exit /b
