@echo off
rem Make a full backup of the current user's home directory.
rem Create a new backup each month.
rem Place a copy of this file on your external storage device and run from there.
rem You can stop execution at any time. Run again to pick up where you left off.
rem See https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy
rem Copyright 2023 Thomas M. Parks <tmparks@yahoo.com>

rem drive, path for this file
set here=%~dp0

rem MM of MM/DD/YYYY
set label=%DATE:~0,2%

set source=%USERPROFILE%
set destination=%here%backup-%label%%source:~2%

rem avoid the /mt option, which can cause slower performance for a HDD with rotating media
set copy_options=/z /mir
set retry_options=/r:0
set logging_options=/np /ndl /tee /log+:log-%label%.txt

rem copy most recently modified files first
for %%a in (1 7 30 90 365) do (
        echo Copying files modified in the last %%a days
        robocopy %source% %destination% /maxage:%%a %copy_options% %retry_options% %logging_options%
)
echo Copying all remaining files
robocopy %source% %destination% %copy_options% %retry_options% %logging_options%

pause