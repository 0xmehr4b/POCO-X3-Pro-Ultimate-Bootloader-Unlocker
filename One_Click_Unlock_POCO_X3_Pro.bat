@echo off
REM Copyright (c) 2026 Mohammad Mehrab Hossain (0xmehr4b). All rights reserved.
REM https://github.com/0xmehr4b
chcp 65001 >nul 2>nul
title POCO X3 Pro (vayu / bhima) EDL Bootloader Unlocker - 0xmehr4b
color 0B
cd /d "%~dp0"

echo.
echo  ╔════════════════════════════════════════════════════════════════════════════╗
echo  ║       POCO X3 Pro (vayu / bhima) EDL 9008 Bootloader Unlocker v1.0.0       ║
echo  ║       Zero-Auth UFS devinfo Unlocker  ·  Fixes Mi Unlock 20091 / 20031     ║
echo  ║        Mohammad Mehrab Hossain (0xmehr4b)  ·  github.com/0xmehr4b          ║
echo  ╚════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [*] Step 1/2: Verifying Qualcomm HS-USB QDLoader 9008 ^& Fastboot drivers...
echo   [*] Step 2/2: Launching GUI in 1-Click Auto-Unlock mode (--auto-start)...
echo.

if exist "%~dp0runtime\python\python.exe" (
    "%~dp0runtime\python\python.exe" "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-drivers
    echo   [+] Launching Unlocker Engine [0xmehr4b]...
    start "" "%~dp0runtime\python\pythonw.exe" "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-start
    exit /b 0
)

python -c "import tkinter" >nul 2>nul
if %errorlevel% equ 0 (
    python "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-drivers
    echo   [+] Launching Unlocker Engine [0xmehr4b]...
    start "" pythonw "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-start
    exit /b 0
)

py -3 -c "import tkinter" >nul 2>nul
if %errorlevel% equ 0 (
    py -3 "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-drivers
    echo   [+] Launching Unlocker Engine [0xmehr4b]...
    start "" pyw -3 "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-start
    exit /b 0
)

where uv >nul 2>nul
if %errorlevel% equ 0 (
    uv run python "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-drivers
    echo   [+] Launching Unlocker Engine [0xmehr4b]...
    start "" uv run pythonw "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-start
    exit /b 0
)

where winget >nul 2>nul
if %errorlevel% equ 0 (
    echo   [*] Python 3 not found. Installing Python 3.12 automatically via winget...
    winget install -e --id Python.Python.3.12 --scope user --accept-package-agreements --accept-source-agreements
    if exist "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" (
        "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-drivers
        start "" "%LOCALAPPDATA%\Programs\Python\Python312\pythonw.exe" "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --auto-start
        exit /b 0
    )
)

color 0C
echo   [!] ERROR: Python 3 (with Tkinter) is not installed or not in PATH.
echo   [i] Install Python 3.12 from https://www.python.org/downloads/ and run again.
echo.
pause
