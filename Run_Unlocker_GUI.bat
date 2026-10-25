@echo off
REM Copyright (c) 2026 Mohammad Mehrab Hossain (0xmehr4b). All rights reserved.
REM https://github.com/0xmehr4b
chcp 65001 >nul 2>nul
title POCO X3 Pro (vayu / bhima) EDL Bootloader Unlocker GUI - 0xmehr4b
color 0B
cd /d "%~dp0"

echo.
echo  ╔════════════════════════════════════════════════════════════════════════════╗
echo  ║       POCO X3 Pro (vayu / bhima) EDL 9008 Bootloader Unlocker v1.0.0       ║
echo  ║        Mohammad Mehrab Hossain (0xmehr4b)  ·  github.com/0xmehr4b          ║
echo  ╚════════════════════════════════════════════════════════════════════════════╝
echo.

if exist "%~dp0runtime\python\pythonw.exe" (
    start "" "%~dp0runtime\python\pythonw.exe" "%~dp0POCO_X3_Pro_Unlocker_GUI.py"
    exit /b 0
)

python -c "import tkinter" >nul 2>nul
if %errorlevel% equ 0 (
    start "" pythonw "%~dp0POCO_X3_Pro_Unlocker_GUI.py"
    exit /b 0
)

py -3 -c "import tkinter" >nul 2>nul
if %errorlevel% equ 0 (
    start "" pyw -3 "%~dp0POCO_X3_Pro_Unlocker_GUI.py"
    exit /b 0
)

where uv >nul 2>nul
if %errorlevel% equ 0 (
    start "" uv run pythonw "%~dp0POCO_X3_Pro_Unlocker_GUI.py"
    exit /b 0
)

where winget >nul 2>nul
if %errorlevel% equ 0 (
    echo   [*] Python 3 not found. Installing Python 3.12 automatically via winget...
    winget install -e --id Python.Python.3.12 --scope user --accept-package-agreements --accept-source-agreements
    if exist "%LOCALAPPDATA%\Programs\Python\Python312\pythonw.exe" (
        start "" "%LOCALAPPDATA%\Programs\Python\Python312\pythonw.exe" "%~dp0POCO_X3_Pro_Unlocker_GUI.py"
        exit /b 0
    )
)

color 0C
echo   [!] ERROR: Python 3 (with Tkinter) is not installed or not in PATH.
echo   [i] Install Python 3.12 from https://www.python.org/downloads/ and run again.
echo.
pause
