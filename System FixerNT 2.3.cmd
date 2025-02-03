@echo off
cls

:: Default Variable
Set "autName=Sagar Mondal"
Set "proName=System FixerNT"
Set "proVer=2.3"

title %proName% %proVer%

:: Check if script is run as Administrator
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This program must be run as Administrator!
    pause
    exit
)