@echo off
chcp 65001 >nul
title Lab1 JupyterLab
cd /d "%~dp0"

set PYEXE=C:\Users\wang\.workbuddy\binaries\python\envs\default\Scripts\python.exe
set LABDIR=%~dp0

if not exist "%PYEXE%" (
  echo [ERROR] Python not found: %PYEXE%
  pause
  exit /b 1
)

echo Starting JupyterLab for lab01 ...
echo Notebook dir: %LABDIR%
echo.
echo A browser tab will open automatically.
echo When finished, come back to this window and press Ctrl+C, then close it.
echo.

"%PYEXE%" -m jupyter lab --notebook-dir="%~dp0."

echo.
echo JupyterLab stopped.
pause
