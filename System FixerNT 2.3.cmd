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



REM =====================================
REM	== OPTION 2 ==========================
REM =====================================
:Opt2_Menu
cls
echo ╔══════════════════════════════════════════╗
echo ║    [2] DISM - Servicing and Management   ║
echo ╠══════════════════════════════════════════╣
echo ║ [A] Repair Image (RestoreHealth)         ║
echo ║ [B] Check Image Health (without Repair)  ║
echo ║ [C] Scan Image for Corruption            ║
echo ║ [D] Windows Component Store Cleanup      ║
echo ║ [N] Previous Menu                        ║
echo ╠══════════════════════════════════════════╣
CHOICE /N /C:ABCDN /M "║ Enter your choice:"%1
echo ╚══════════════════════════════════════════╝

:: Handle user input
IF ERRORLEVEL ==5 GOTO homWel
IF ERRORLEVEL ==4 GOTO Opt2d
IF ERRORLEVEL ==3 GOTO Opt2c
IF ERRORLEVEL ==2 GOTO Opt2b
IF ERRORLEVEL ==1 GOTO Opt2a
goto Opt2_Menu


REM =====================================
REM	== OPTION 2A =========================
:Opt2a
cls
echo.
DISM /Online /Cleanup-Image /RestoreHealth

:sfcChoice2
echo.
CHOICE /N /C:YN /M "After repairing, RUN SFC? [Y/N]:"%1
IF ERRORLEVEL ==2 GOTO Opt2_Menu
IF ERRORLEVEL ==1 GOTO sfcChoiceDO
goto sfcChoice2

:sfcChoiceDO
sfc /scannow

::IF RestoreHealth DONE, THEN!
pause
goto Opt2_Menu


REM =====================================
REM	== OPTION 2B =========================
:Opt2b
cls
echo.
DISM /Online /Cleanup-Image /CheckHealth

::IF CheckHealth DONE, THEN!
pause
goto Opt2_Menu


REM =====================================
REM	== OPTION 2C =========================
:Opt2c
cls
echo.
DISM /Online /Cleanup-Image /ScanHealth

::IF ScanHealth DONE, THEN!
pause
goto Opt2_Menu


REM =====================================
REM	== OPTION 2D =========================
:Opt2d
cls
echo.
DISM /Online /Cleanup-Image /StartComponentCleanup

::IF StartComponentCleanup DONE, THEN!
pause
goto Opt2_Menu



REM =====================================
REM	== OPTION 3 ==========================
REM =====================================
:Opt3_Menu
cls
echo ╔══════════════════════════════════════════╗
echo ║    [3] CHKDSK [Check Disk] for Storage   ║
echo ╠══════════════════════════════════════════╣
echo ║ [A] Scan only (Read-Only Mode)           ║
echo ║ [B] Scan and Fix Errors (/f)             ║
echo ║ [C] Scan, Fix, ^& Check Bad Sectors (/r)  ║
echo ║ [D] Schedule CHKDSK on Next Boot         ║
echo ║ [N] Previous Menu                        ║
echo ╠══════════════════════════════════════════╣
CHOICE /N /C:ABCDN /M "║ Enter your choice:"%1
echo ╚══════════════════════════════════════════╝

:: Handle user input
IF ERRORLEVEL ==5 GOTO homWel
IF ERRORLEVEL ==4 GOTO Opt3d
IF ERRORLEVEL ==3 GOTO Opt3c
IF ERRORLEVEL ==2 GOTO Opt3b
IF ERRORLEVEL ==1 GOTO Opt3a
goto Opt3_Menu


REM =====================================
REM	== OPTION 3A =========================
:Opt3a
cls
echo.
set /p drive=Enter drive letter to scan (Example: C):
echo Scanning drive %drive%: in Read-Only mode...
chkdsk %drive%:

::IF chkdsk DONE, THEN!
pause
goto Opt3_Menu


REM =====================================
REM	== OPTION 3B =========================
:Opt3b
cls
echo.
set /p drive=Enter drive letter to scan (Example: C):
echo Fixing %drive%: Errors
chkdsk %drive%: /F

::IF chkdskF DONE, THEN!
pause
goto Opt3_Menu


REM =====================================
REM	== OPTION 3C =========================
:Opt3c
cls
echo.
set /p drive=Enter drive letter to scan (Example: C):
echo Scan and Fix %drive%: (this may take time)...
chkdsk %drive% /r

::IF chkdskR DONE, THEN!
pause
goto Opt3_Menu


REM =====================================
REM	== OPTION 3D =========================
:Opt3d
cls
echo.
set /p drive=Enter drive letter to scan (Example: C):
echo Scheduling CHKDSK on next boot for %drive%:...
echo Restart your computer to begin the scan.
chkdsk %drive% /f /r /x

:Restart1
echo.
CHOICE /N /C:YN /M "Would you like to Restart NOW? [Y/N]:"%1
IF ERRORLEVEL ==2 GOTO Opt3_Menu
IF ERRORLEVEL ==1 GOTO RestartDO
goto Restart1

:RestartDO
shutdown /r

::IF chkdskX DONE, THEN!
pause
goto Opt3_Menu

