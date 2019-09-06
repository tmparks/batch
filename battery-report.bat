@echo off
rem Generate a battery health report.
rem Copyright 2019 Thomas M. Parks <tmparks@yahoo.com>

set output=C:\Users\Public\Documents\battery-report-%date:-=%.html
C:\Windows\System32\powercfg.exe /batteryreport /duration 14 /output %output%
