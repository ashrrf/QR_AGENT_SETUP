@echo off
setlocal enabledelayedexpansion
 
REM Set the target port number
set "targetPort=8116"
 
REM Find the process ID (PID) based on the port number
for /f "tokens=5" %%a in ('netstat -ano ^| find "LISTENING" ^| find "%targetPort%"') do (
    set "processId=%%a"
)
 
REM Check if a process ID was found
if not defined processId (
    echo No process found using port %targetPort%
) else (
    echo Terminating process with ID %processId% using port %targetPort%
    taskkill /pid %processId% /f
)
 
endlocal