@echo off
chcp 65001 > nul
title Gemini CLI (Flash Lite) - H S Garden Maintenance

set PROMPT_ORIGIN=CLI
set GEMINI_MODEL=gemini-3.5-flash-lite

cd /d "%~dp0"

if exist ".env" (
    for /f "usebackq tokens=1,* delims==" %%a in (".env") do (
        if "%%a"=="GEMINI_API_KEY" set "GEMINI_API_KEY=%%b"
    )
)
if "%GEMINI_API_KEY%"=="" if exist "C:\Users\TotalBiz\Documents\LoveFilm\config\.env" (
    for /f "usebackq tokens=1,* delims==" %%a in ("C:\Users\TotalBiz\Documents\LoveFilm\config\.env") do (
        if "%%a"=="GEMINI_API_KEY" set "GEMINI_API_KEY=%%b"
    )
)

echo --------------------------------------------------
echo [Git Sync] Syncing latest changes with GitHub...
if exist ".git" (
    git pull --rebase --autostash 2>nul
)

if not exist "C:\Users\TotalBiz\Documents\AI_Usage_Audit" mkdir "C:\Users\TotalBiz\Documents\AI_Usage_Audit"

if exist "C:\Users\TotalBiz\Documents\AI_Usage_Audit\log_session_start.ps1" (
    powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Users\TotalBiz\Documents\AI_Usage_Audit\log_session_start.ps1" -ProjectName "HSGardenMaintenance_CLI"
)

echo.
echo [Gemini CLI] Launching Flash Lite Model (Unlimited RPD Tier)...
echo [Active Project] H S Garden Maintenance (Grounds Care & Paddock Mowing)
echo [API Key Status] Active (Loaded from .env)
echo [Global Audit]   C:\Users\TotalBiz\Documents\AI_Usage_Audit\global_usage_audit.csv
echo --------------------------------------------------
echo.

gemini --model gemini-3.5-flash-lite --skip-trust --yolo
