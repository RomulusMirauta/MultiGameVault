@echo off

rem Force-kill all "League of Legends" related processes

taskkill /f /im "LeagueClient.exe"
taskkill /f /im "League of Legends.exe"
taskkill /f /im "RiotClientServices.exe"
rem taskkill /f /im "RiotClientUx.exe"
rem taskkill /f /im "RiotClientCrashHandler.exe"

rem taskkill is a command-line utility that allows you to terminate tasks by process name, process ID, memory usage and other criteria
rem /f = force (parameter that forces the command to be executed)
rem /im = image name (the name of the process to be terminated)

rem pause