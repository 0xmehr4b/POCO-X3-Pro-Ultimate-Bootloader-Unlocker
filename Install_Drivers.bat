@echo off
REM Copyright (c) 2026 Mohammad Mehrab Hossain (0xmehr4b). All rights reserved.
REM https://github.com/0xmehr4b
chcp 65001 >nul 2>nul
title POCO X3 Pro Qualcomm 9008 ^& Fastboot Driver Installer - 0xmehr4b
color 0B
cd /d "%~dp0"

echo.
echo  ╔════════════════════════════════════════════════════════════════════════════╗
echo  ║     Qualcomm HS-USB QDLoader 9008 ^& Fastboot WinUSB Driver Installer      ║
echo  ║        Mohammad Mehrab Hossain (0xmehr4b)  ·  github.com/0xmehr4b          ║
echo  ╚════════════════════════════════════════════════════════════════════════════╝
echo.

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo   [*] Requesting Administrator privileges to install signed drivers...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b 0
)

echo   [*] Installing Qualcomm HS-USB QDLoader 9008 driver (qcser.inf)...
pnputil /add-driver "%~dp0drivers\Qualcomm_9008\qcser.inf" /install
echo.
echo   [*] Installing Android Fastboot WinUSB driver (android_winusb.inf)...
pnputil /add-driver "%~dp0drivers\Fastboot_WinUSB\android_winusb.inf" /install
echo.
color 0A
echo   [+] Signed Qualcomm 9008 and Fastboot WinUSB drivers installed.
echo.
pause
