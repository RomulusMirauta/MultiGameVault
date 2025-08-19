@echo off

rem Force-kill all "League of Legends" related processes

taskkill /f /im "LeagueClient.exe" >nul 2>&1
taskkill /f /im "League of Legends.exe" >nul 2>&1
taskkill /f /im "RiotClientServices.exe" >nul 2>&1
rem taskkill /f /im "RiotClientUx.exe" >nul 2>&1
rem taskkill /f /im "RiotClientCrashHandler.exe" >nul 2>&1

rem pause

rem Search all drives for RiotClientServices.exe and start the first one found

set "foundRiotClient=false"
for /f "tokens=1" %%d in ('wmic logicaldisk get name ^| find ":"') do (
    for /f "delims=" %%i in ('dir /b /s %%d\RiotClientServices.exe 2^>nul') do (
        rem timeout /t 5 /nobreak >nul
        start "" "%%i" --launch-product=league_of_legends --launch-patchline=pbe
        set "foundRiotClient=true"
        goto :found
    )
)
:found

if "%foundRiotClient%"=="false" (
    echo ERROR! RiotClientServices.exe was not found on any drive.
    echo.
    pause
)

rem >nul 2>&1 - all output is suppressed => the window will remain blank
rem %%d is the drive letter
rem %%i is the full path to the RiotClientServices.exe file
rem wmic logicaldisk get name - retrieves all drive letters
rem dir /b /s %%d\RiotClientServices.exe - searches for RiotClientServices.exe in the current drive, /b for bare format (no heading information or summary), /s for recursive search
rem 2^>nul suppresses error messages if the file is not found
rem timeout /t 5 /nobreak >nul - waits for 5 seconds before starting the RiotClientServices.exe
rem start "" "%%i" - starts the RiotClientServices.exe found, with parameters
rem goto :found - jumps to the label :found to avoid searching further once the file is found


rem pause