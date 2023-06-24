@echo off
rem Make a full backup of the current user's home directory.
rem Creates a new backup each month.
rem See https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy
rem Copyright 2023 Thomas M. Parks <tmparks@yahoo.com>

set here=%~dp0 & rem drive, path for this file
set label=%DATE:~0,2% & rem MM of MM/DD/YYYY
set source=%USERPROFILE%
set destination=%here%\backup-%label%
set copy_options=/z /mir /mt
set logging_options=/log+:log-%label%.txt

robocopy %source% %destination% %copy_options% %logging_options%
