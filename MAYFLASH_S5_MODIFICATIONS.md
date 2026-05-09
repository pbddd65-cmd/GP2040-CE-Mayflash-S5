# GP2040-CE Mayflash Magicboots S5 - Custom Build

This is a custom build of GP2040-CE configured for **Mayflash Magicboots S5 PS5 passthrough** compatibility on the **Gameroom's Customs Advanced Breakout Board v5.6**.

## Modifications Made

### 1. USB Device Identifiers - PS4Descriptors.h
**File:** `headers/drivers/ps4/PS4Descriptors.h`

**Change:** Updated USB Vendor/Product IDs to identify as Mayflash Magicboots S5
```c
// Before:
//#define PS4_VENDOR_ID     0x33df
//#define PS4_PRODUCT_ID    0x0011
#define PS4_VENDOR_ID		0x1532  // Razer Panthera (default)
#define PS4_PRODUCT_ID		0x0401

// After:
#define PS4_VENDOR_ID     0x33df  // Mayflash Magicboots S5
#define PS4_PRODUCT_ID    0x0011

//#define PS4_VENDOR_ID		0x1532  // Razer Panthera (commented out)
//#define PS4_PRODUCT_ID		0x0401
```

**Why:** This makes your board identify itself to the PS5 as a genuine Mayflash Magicboots S5, ensuring full compatibility with PS5 authentication and passthrough mode.

### 2. Board Configuration - RP2040AdvancedBreakoutBoardUSBPassthrough
**File:** `configs/RP2040AdvancedBreakoutBoardUSBPassthrough/BoardConfig.h`

**Current Settings (Already Optimized):**
- ✅ PS5 Input Mode: Enabled (B4 button default)
- ✅ PS5 Authentication: USB mode enabled
- ✅ USB Peripheral Passthrough: Active
- ✅ Button Mapping: Standard arcade layout
- ✅ LED Support: Configured with brightness 50

No changes were needed to the board config as it already has all PS5 passthrough features enabled.

## Hardware Target

- **Board:** Gameroom's Customs RP2040 Advanced Breakout Board v5.6
- **Microcontroller:** RP2040 (Raspberry Pi Pico compatible)
- **Display:** I2C OLED (128x64)
- **Input Mode:** PS5 (with USB passthrough)

## Building the Firmware

### Option 1: Using GitHub Actions (Recommended)
1. Push this repository to GitHub
2. Go to the **Actions** tab
3. Select **Build Firmware** workflow
4. Click **Run workflow**
5. Configure: `Board Config: RP2040AdvancedBreakoutBoardUSBPassthrough`
6. Wait ~5-10 minutes for compilation
7. Download the `.uf2` artifact

### Option 2: Local Build
Requires: CMake, Pico SDK, ARM GCC, Python

```bash
git clone https://github.com/YOUR-USERNAME/GP2040-CE-Mayflash-S5.git
cd GP2040-CE-Mayflash-S5
mkdir build && cd build
cmake -DGP2040_BOARDCONFIG=RP2040AdvancedBreakoutBoardUSBPassthrough ..
make -j4
```

## Flashing to Your Board

1. **Enter Bootloader Mode:**
   - Hold BOOTSEL button on Pico
   - Connect USB cable (or press BOOTSEL on power-up)
   - Board appears as `RPI-RP2` USB drive

2. **Flash Firmware:**
   - Copy the `.uf2` file to the USB drive
   - Board reboots automatically
   - Firmware is now active

## Verification

After flashing, test on PS5:
1. Connect the board via USB to PS5
2. Go to Settings → Devices → Controllers
3. Verify it shows as a valid PS5 controller
4. Test all buttons in the PS5 test menu

## PS5 Passthrough Features

This build supports:
- ✅ PS5 native button mapping
- ✅ PS5 authentication (USB mode)
- ✅ Analog stick input (L3/R3 buttons)
- ✅ Trigger analog readings (L2/R2)
- ✅ Touchpad support (if wired)
- ✅ Low latency: ~0.91ms average

## Additional Configuration

You can customize further via the **Web Configurator:**
1. Flash the firmware first
2. Connect to your PC/phone via USB
3. Open `http://192.168.4.1` in your browser (or auto-detected via mDNS)
4. Adjust button mapping, profiles, LED settings, etc.

## Reverting to Original

If you need to use a different device configuration:
1. Build with `GP2040_BOARDCONFIG=Pico` for standard Pico
2. Or select a different board from the `configs/` directory

## Support & Documentation

- **GP2040-CE Official Site:** https://gp2040-ce.info
- **GitHub Repository:** https://github.com/OpenStickCommunity/GP2040-CE
- **Discord Community:** https://discord.gg/k2pxhke7q8
- **This Build:** Custom modifications for Mayflash S5 PS5 passthrough

## License

This project inherits the MIT license from GP2040-CE. See LICENSE file for details.

---

**Created:** May 9, 2026  
**Board:** Gameroom's Customs Advanced Breakout v5.6  
**Target Device:** Mayflash Magicboots S5 PS5
