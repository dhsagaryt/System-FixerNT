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


:MoreOpt
cls
echo.
echo                                   ╔════════════════════════════╗
echo             / \__                 ║    System FixerNT [2.3]    ║
echo            (    @\___             ╠════════════════════════════╣
echo            /         O            ║  [5] Memory Diagnostic     ║
echo           /   (_____/             ║  [6] Open Troubleshoot     ║
echo          /_____/   U              ║  [7] System-Reset          ║
echo             ^|^|                    ║  [8] Rstrui.exe [Restore]  ║
echo                                   ║  ^|N^| Previous Options      ║
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
echo         \\ \ \ \^|    System FixerNT 2.3    ^|/ / / //
echo          `'-\_\_\      by Sagar Mondal     /_/_/-'`
echo                 '--------------------------'
echo.

:: Prompt for user input
CHOICE /N /C:5678N /M "Choose an option (5-8):"%1

:: Handle user input
IF ERRORLEVEL ==5 GOTO homWel
IF ERRORLEVEL ==4 GOTO Opt8_Menu
IF ERRORLEVEL ==3 GOTO Opt7_Menu
IF ERRORLEVEL ==2 GOTO Opt6_Menu
IF ERRORLEVEL ==1 GOTO Opt5_Menu
goto MoreOpt



REM =====================================
REM	== OPTION 1 ==========================
REM =====================================
:Opt1_Menu
cls
echo ╔══════════════════════════════════════════╗
echo ║    [1] System File Checker               ║
echo ╠══════════════════════════════════════════╣
echo ║ [A] Scan and Repair All System Files     ║
echo ║ [B] Just Scan Without Repairing          ║
echo ║ [C] Specific System File Repair          ║
echo ║ [D] Specific System File Scan Only       ║
echo ║ [E] Repair System Files from a Backup    ║
echo ║ [F] Log Results of SFC Scan              ║
echo ║ [N] Previous Menu                        ║
echo ╠══════════════════════════════════════════╣
CHOICE /N /C:ABCDEFN /M "║ Enter your choice:"%1
echo ╚══════════════════════════════════════════╝

:: Handle user input
IF ERRORLEVEL ==7 GOTO homWel
IF ERRORLEVEL ==6 GOTO Opt1f
IF ERRORLEVEL ==5 GOTO Opt1e
IF ERRORLEVEL ==4 GOTO Opt1d
IF ERRORLEVEL ==3 GOTO Opt1c
IF ERRORLEVEL ==2 GOTO Opt1b
IF ERRORLEVEL ==1 GOTO Opt1a
goto Opt1_Menu

REM =====================================
REM	== OPTION 1A =========================
:Opt1a
cls
echo.
sfc /scannow

::Check Solve OR Not?
if %errorLevel% NEQ 0 (
    echo SFC detected issues but couldn't fix them. Try DISM.
	:dismChoice
	echo.
    CHOICE /N /C:YN /M "Would you like to Use DISM? [Y/N]:"%1
	IF ERRORLEVEL ==2 GOTO Opt1_Menu
	IF ERRORLEVEL ==1 GOTO dismChoiceDO
    goto dismChoice
	
	:dismChoiceDO
	DISM /Online /Cleanup-Image /RestoreHealth
	
	:sfcChoice
	echo.
    CHOICE /N /C:YN /M "Would you like to Try Again SFC? [Y/N]:"%1
	IF ERRORLEVEL ==2 GOTO Opt1_Menu
	IF ERRORLEVEL ==1 GOTO Opt1a
    goto sfcChoice
)

::IF SFC DONE, THEN!
pause
goto Opt1_Menu


REM =====================================
REM	== OPTION 1B =========================
:Opt1b
cls
echo.
sfc /verifyonly

::IF verifyonly DONE, THEN!
pause
goto Opt1_Menu


REM =====================================
REM	== OPTION 1C =========================
:Opt1c
cls
echo.
echo Example: C:\Windows\System32\example.dll
echo.
set /p filepath=Enter full file path: 
sfc /scanfile=%filepath%

::IF scanfile DONE, THEN!
pause
goto Opt1_Menu


REM =====================================
REM	== OPTION 1D =========================
:Opt1d
cls
echo.
echo Example: C:\Windows\System32\example.dll
echo.
set /p filepath=Enter full file path: 
sfc /verifyfile=%filepath%

::IF verifyfile DONE, THEN!
pause
goto Opt1_Menu


REM =====================================
REM	== OPTION 1E =========================
:Opt1e
cls
echo.
echo Currently this Option Not Available for Your System

::IF NOT DONE, THEN!
pause
goto Opt1_Menu


REM =====================================
REM	== OPTION 1F =========================
:Opt1f
cls
echo.
echo Displaying SFC Logs...
findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log > "%userprofile%\Desktop\SFC_Log.txt"
echo Logs saved to Desktop as SFC_Log.txt
notepad "%userprofile%\Desktop\SFC_Log.txt"

::IF LogsFile DONE, THEN!
pause
goto Opt1_Menu
