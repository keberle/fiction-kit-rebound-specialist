@echo off
REM Compile Episode Helper Script
REM This batch file makes it easier to run the PowerShell compilation script

if "%1"=="" (
    echo Usage: compile-episode.cmd ^<episode-number^>
    echo Example: compile-episode.cmd 1
    exit /b 1
)

powershell -ExecutionPolicy Bypass -File "%~dp0compile-episode.ps1" %1
