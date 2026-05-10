# GP2040-CE Mayflash S5 - Git Setup Script (PowerShell)
# This script initializes the git repository and prepares for GitHub push
# Run this AFTER installing Git from https://git-scm.com/download/win

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "GP2040-CE Mayflash S5 - Git Setup Script" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is available
$gitPath = "C:\Program Files\Git\bin\git.exe"
if (-not (Test-Path $gitPath)) {
    Write-Host "ERROR: Git not found at expected location!" -ForegroundColor Red
    Write-Host "Please reinstall Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "Or check if Git is installed in a different location." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host "✓ Git found!" -ForegroundColor Green

Write-Host ""

# Get to the script directory
Set-Location -Path $PSScriptRoot

Write-Host "Current directory: $((Get-Location).Path)" -ForegroundColor Cyan
Write-Host ""

# Check if we're in the right directory
if (-not (Test-Path "CMakeLists.txt")) {
    Write-Host "ERROR: This script must be run from the GP2040-CE-Mayflash-S5 directory!" -ForegroundColor Red
    Write-Host "Please make sure CMakeLists.txt exists in the current directory." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Initializing Git repository..." -ForegroundColor Yellow
& $gitPath init

Write-Host ""
Write-Host "Configuring Git user..." -ForegroundColor Yellow
$gitname = Read-Host "Enter your name (for Git commits)"
$gitemail = Read-Host "Enter your email (for Git commits)"

& $gitPath config user.email $gitemail
& $gitPath config user.name $gitname

Write-Host ""
Write-Host "Adding all files..." -ForegroundColor Yellow
& $gitPath add .

Write-Host ""
Write-Host "Creating initial commit..." -ForegroundColor Yellow
& $gitPath commit -m "Initial commit: GP2040-CE with Mayflash S5 PS5 Passthrough modifications"

Write-Host ""
Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "✓ Git repository initialized successfully!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Go to https://github.com/new" -ForegroundColor White
Write-Host "2. Create a repository named 'GP2040-CE-Mayflash-S5'" -ForegroundColor White
Write-Host "3. Copy the repository URL (e.g., https://github.com/YOUR-USERNAME/GP2040-CE-Mayflash-S5.git)" -ForegroundColor White
Write-Host "4. Run these commands:" -ForegroundColor White
Write-Host ""
Write-Host "   git remote add origin [PASTE YOUR URL HERE]" -ForegroundColor Yellow
Write-Host "   git branch -M main" -ForegroundColor Yellow
Write-Host "   git push -u origin main" -ForegroundColor Yellow
Write-Host ""
Write-Host "5. Then go to GitHub Actions and run the Build Firmware workflow!" -ForegroundColor White
Write-Host ""

Read-Host "Press Enter to exit"
