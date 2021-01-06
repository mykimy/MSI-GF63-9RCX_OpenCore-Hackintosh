# GF63 Thin 9RCX Hackintosh with OpenCore bootloader

Vanilla macOS Catalina installation on GF63 Thin 9RCX.

## Configuration

| Specifications | Detail |
| ------------------- | ------------------------------------------- |
| Computer model      | GF63 Thin 9RCX 15.6' (GTX 1050 TI)      |
| Processor           | Intel Core i7-9750H Processor     |
| Memory              | 8 Go DDR4 2666 Mhz             |
| Hard Disk           | Samsung NVMe SSD Controller PM981    |
| Integrated Graphics | Intel UHD Graphics 630                     |
| Monitor             | IPS FHD 1920x1080 (15.6 inch) |
| Sound Card          | Realtek Audio ALC269VC         |
| Wireless Card       | Intel Wireless 8265                   |
| USB                 | 1x USB type C port and 3x USB 3.2 gen 1 ports  |

## What Works
- Native Power Management
- Intel UHD 630 Graphics Acceleration
- HDMI Video/Audio Out
- Brightness control
- Sleep/Wake (with hibernate mode 3)
- Realtek 229VC Audio
- Integrated Camera
- Trackpad with multi-touch gestures
- Battery status
- Integrated Bluetooth
- All USB Ports
- Function Key

## What Doesn't Work
- Discrete graphic card is not working, since macOS doesn't support Optimus technology
- Integrated Intel Wifi card
- PM981 NMVe (NMVe port is enabled by default. You can replace original NVMe with a supported one or disable port by enable SSDT-DNVME in config.plist)

## Installation

### First-time Installation Steps
- Change BIOS settings
    - Turn off Secure Boot
    - Turn off CFG Lock
    - Disable Fast Boot
    - Select UEFI mode without CSM
- Create install media
    - Follow Windows, macOS or Linux [guide](https://khronokernel-2.gitbook.io/opencore-vanilla-desktop-guide/opencore-efi#setting-up-the-efi)
    - Copy the provided `EFI` folder into the USB drive EFI partition of the newly created install media
    - Change ROM configuration of OpenCore, follow this [guide](https://khronokernel-2.gitbook.io/opencore-vanilla-desktop-guide/post-install/post-install/iservices#fixing-rom)
- Install macOS (do not install on NVMe hard drive as it is unstable, you can use a secondary SSD with the SATA port of the laptop)
- Copy the `EFI` folder from the USB installation media to the `EFI` partition of the installed macOS drive, follow this [guide](https://khronokernel-2.gitbook.io/opencore-vanilla-desktop-guide/post-install/post-install/oc2hdd)

### Upgrade

- Replace the `EFI` folder of your macOS install.
- Restore your ROM configuration in OpenCore `config.plist`.