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

:: Program File Check!!
IF NOT "%~n0"=="%proName% %proVer%" (
    ECHO Incorrect Namespace! This program made by %autName%".
    ECHO Exiting...
    pause
    exit
)

:: Check if VirtualTerminalLevel is already enabled
REM reg query HKCU\Console /v VirtualTerminalLevel >nul 2>&1
REM if %errorlevel% neq 0 (
    :: Enable VirtualTerminalLevel silently
REM     reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1
REM )


rem echo Continuing with the script...
rem pause
:homWel
cls
echo.
echo                                   ╔════════════════════════════╗
echo             / \__                 ║    %proName% [%proVer%]    ║
echo            (    @\___             ╠════════════════════════════╣
echo            /         O            ║  [1] System File Checker   ║
echo           /   (_____/             ║  [2] DISM Cleanup-Image    ║
echo          /_____/   U              ║  [3] CHKDSK [Check Disk]   ║
echo             ^|^|                    ║  [4] Bootrec.exe [BCD]     ║
echo                                   ║  ^|M^| More Options          ║
echo                                   ╚════════════════════════════╝
echo.
echo.
echo     .-"^`\                                        /`^"-.
echo   .'   ___\                                      /___   `.
echo  /    /.---.                                    .---.\    \
echo ^|    //     '-.  ___________________________ .-'     \\    ^|
echo ^|   ;^|         \/--------------------------//         ^|;   ^|
echo \   ^|^|       ^|\_)        Ocean Web         (_/^|       ^|^|   /
echo  \  ^| \  . \ ;  ^|    Solution @dhsagaryt   ^|^| ; / .  / ^|  /
echo   '\_\ \\ \ \ \ ^|                          ^|^|/ / / // /_/'
echo         \\ \ \ \^|    %proName% %proVer%    ^|/ / / //
echo          `'-\_\_\      by %autName%     /_/_/-'`
echo                 '--------------------------'
echo.

:: Prompt for user input
CHOICE /N /C:1234M /M "Choose an option (1-4):"%1

:: Handle user input
IF ERRORLEVEL ==5 GOTO MoreOpt
IF ERRORLEVEL ==4 GOTO Opt4_Menu
IF ERRORLEVEL ==3 GOTO Opt3_Menu
IF ERRORLEVEL ==2 GOTO Opt2_Menu
IF ERRORLEVEL ==1 GOTO Opt1_Menu
goto homWel

