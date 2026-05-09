# Quick Start: Push to GitHub and Build

## Prerequisites
- GitHub account (free at github.com)
- Git installed on your computer (git-scm.com)

## Step 1: Create a GitHub Repository

1. Go to **https://github.com/new**
2. Fill in:
   - **Repository name:** `GP2040-CE-Mayflash-S5`
   - **Description:** `Custom GP2040-CE build for Mayflash Magicboots S5 PS5 passthrough`
   - **Public** (recommended so GitHub Actions can build for free)
   - **Do NOT** initialize with README (we already have one)
3. Click **Create repository**

## Step 2: Connect Local Repo to GitHub

Copy and run these commands in PowerShell:

```powershell
cd C:\GP2040-CE-Mayflash-S5

# Configure git
git config --global user.email "your-email@example.com"
git config --global user.name "Your Name"

# Initialize and push
git init
git add .
git commit -m "Initial commit: GP2040-CE with Mayflash S5 modifications"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/GP2040-CE-Mayflash-S5.git
git push -u origin main
```

**Replace `YOUR-USERNAME` with your actual GitHub username**

## Step 3: Trigger GitHub Actions Build

1. Go to your new repository on GitHub
2. Click **Actions** tab
3. Click **Build Firmware** workflow (on the left)
4. Click **Run workflow** dropdown
5. Keep defaults, click **Run workflow**
6. Wait 5-10 minutes (watch the progress in the logs)
7. When complete, scroll down to **Artifacts**
8. Download the `.uf2` file

## Step 4: Flash to Your Board

1. **Hold BOOTSEL** button on Pico board
2. **Connect USB** to computer
3. Board appears as `RPI-RP2` drive
4. **Drag the `.uf2` file** onto the drive
5. Board reboots automatically ✅

## Troubleshooting

**Git not found?**
- Install from https://git-scm.com/download/win
- Restart PowerShell after install

**GitHub Actions not building?**
- Make sure repository is **public**
- Check the Actions tab for error messages
- Verify `BoardConfig.h` exists in `configs/RP2040AdvancedBreakoutBoardUSBPassthrough/`

**Board not appearing as RPI-RP2?**
- Try different USB cable
- Try different USB port
- Hold BOOTSEL longer before plugging in

## Need Help?

See full documentation in `MAYFLASH_S5_MODIFICATIONS.md`
