@echo off
REM Copyright (c) 2026 Mohammad Mehrab Hossain (0xmehr4b). All rights reserved.
REM https://github.com/0xmehr4b
chcp 65001 >nul 2>nul
title POCO X3 Pro (vayu / bhima) EDL CLI Auto-Unlocker - 0xmehr4b
color 0B
cd /d "%~dp0"

echo.
echo  ╔════════════════════════════════════════════════════════════════════════════╗
echo  ║     POCO X3 Pro (vayu / bhima) EDL 9008 CLI Bootloader Unlocker v1.0.0     ║
echo  ║        Mohammad Mehrab Hossain (0xmehr4b)  ·  github.com/0xmehr4b          ║
echo  ╚════════════════════════════════════════════════════════════════════════════╝
echo.

if exist "%~dp0runtime\python\python.exe" (
    "%~dp0runtime\python\python.exe" "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --cli --wait
    pause
    exit /b %errorlevel%
)

where python >nul 2>nul
if %errorlevel% equ 0 (
    python "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --cli --wait
    pause
    exit /b %errorlevel%
)

where py >nul 2>nul
if %errorlevel% equ 0 (
    py -3 "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --cli --wait
    pause
    exit /b %errorlevel%
)

where uv >nul 2>nul
if %errorlevel% equ 0 (
    uv run python "%~dp0POCO_X3_Pro_Unlocker_GUI.py" --cli --wait
    pause
    exit /b %errorlevel%
)

color 0C
echo   [!] ERROR: Python 3 is not installed or not in PATH.
pause
