@echo off
REM This script initializes the git repository and prepares for GitHub push
REM Run this AFTER installing Git from https://git-scm.com/download/win

echo.
echo ============================================
echo GP2040-CE Mayflash S5 - Git Setup Script
echo ============================================
echo.

REM Check if git is available
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Git is not installed!
    echo Please install Git from: https://git-scm.com/download/win
    echo Then run this script again.
    pause
    exit /b 1
)

echo Git found! Proceeding with setup...
echo.

REM Get to the script directory
cd /d "%~dp0"

echo Current directory: %cd%
echo.

REM Check if we're in the right directory
if not exist "CMakeLists.txt" (
    echo ERROR: This script must be run from the GP2040-CE-Mayflash-S5 directory!
    echo Please make sure CMakeLists.txt exists in the current directory.
    pause
    exit /b 1
)

echo Initializing Git repository...
git init

echo.
echo Configuring Git user...
setlocal enabledelayedexpansion
set /p gitname="Enter your name (for Git commits): "
set /p gitemail="Enter your email (for Git commits): "

git config user.email "%gitemail%"
git config user.name "%gitname%"

echo.
echo Adding all files...
git add .

echo.
echo Creating initial commit...
git commit -m "Initial commit: GP2040-CE with Mayflash S5 PS5 Passthrough modifications"

echo.
echo.
echo ============================================
echo ✓ Git repository initialized successfully!
echo ============================================
echo.
echo Next steps:
echo 1. Go to https://github.com/new
echo 2. Create a repository named "GP2040-CE-Mayflash-S5"
echo 3. Copy the repository URL (e.g., https://github.com/YOUR-USERNAME/GP2040-CE-Mayflash-S5.git)
echo 4. Run these commands:
echo.
echo    git remote add origin [PASTE YOUR URL HERE]
echo    git branch -M main
echo    git push -u origin main
echo.
echo 5. Then go to GitHub Actions and run the Build Firmware workflow!
echo.
pause
