# ASUS VivoBook 15 X512FL Hackintosh

## General info
This was done on a tight schedule, but most stuff is ironed out. You may wish to add CPUFriend, fix HDMI and Fn keys, check iPhone charging, replace WiFi card and add fixes for it.

Everything is done on hotpatches and C/k/O injection so You can enable SIP if You wish. For installation use external mouse bc touchpad doesn't work. 

Remember to regenerate SMBIOS (serial etc.) with Clover Configurator or anything (just don't break everything else, best way is to do it on a copy and then paste just SMBIOS section back to original file), download all latest kexts from their devs and recompile dsls into amls.

If You want to go Catalina, it will probably suffice to add fake EC (or rename EC0 to EC, but idk if it won't break anything).

I gave back this laptop so I probably won't be doing anything else here.

## Hardware
Model: ASUS VivoBook 15 X512FL (R512FL-BQ083), BIOS v303  
OS: macOS 10.14.6 Mojave

CPU: Intel Core i5-8265U (Whiskey Lake, 1.6-3.9 GHz)  
iGPU: Intel UHD Graphics 620  
dGPU: NVIDIA GeForce MX250 (disabled)  
Screen: 1080p  
Disk: M2 PCIe SSD  
Wifi/BT: Intel, unpatched so no WiFi (BT works)  
RAM: 20GB DDR4 single-stick  
Audio: Realtek ALC256 with ComboJack

## Not working
* HDMI (didn't have time to do it, probably patching connectors will suffice)
* SS USB on USB-C port via Samsung S9+ OTG adapter (HS works though)
* Card Reader obviously
* Fn keys - due to lack of time and [not yet supported layout](https://github.com/hieplpvip/AsusSMC/issues/13) for Whiskey Lake ASUSes I've decided to remap with Karabiner instead; keyboard backlight in general works though (with better granularity than on Windows)
* iPhone charging maybe, I don't have iPhone to check
* Battery life seems to be ~3h (but that's Activity Monitor's calculation at 85%) so that's probably less than on Windows
* Sensors most likely, didn't check
* Touchpad won't work in Recovery, so You need external mouse for installation

## BIOS
Version: 303
Settings:
* SATA - AHCI
* Secure Boot - Off
* DVMT Prealloc - 64 MB

## Bootloader
Clover r5101 from Dids  
RC Scripts installed  
Drivers:
* ApfsDriverLoader.efi
* AptioMemoryFix.efi
* EmuVariableUefi.efi - without it no shutdown apparently
* HFSPlus.efi
* VirtualSmc.efi

## Kexts
* AppleALC.kext
* AsusSMC.kext - For keyboard backlight mostly, pair with SSDT-ALS0.aml and SSDT-KBKL.aml
* Lilu.kext
* NoTouchID.kext - Bc using TouchID SMBIOS
* NullEthernet.kext - For App Store to work, pair with SSDT-RMNE.aml
* SMCBatteryManager.kext
* SMCProcessor.kext
* USBInjectAll.kext - pair with SSDT-UIAC.aml
* VirtualSMC.kext
* VoodooI2C.kext
* VoodooI2CHID.kext - pair with SSDT-ELAN.aml
* VoodooInput.kext - for Acidanthera's VoodooPS2Controller
* VoodooPS2Controller.kext
* VoodooTSCSync.kext - apparently needed to use this CPU (Whiskey Lake)
* WhateverGreen.kext

## SSDTs
* SSDT-ALS0.aml - fake ambient light sensor for AsusSMC.kext
* SSDT-ELAN.aml - VoodooI2C touchpad, use with two DSDT hotpatches
* SSDT-KBKL.aml - keyboard backlight, use with DSDT hotpatch
* SSDT-PNLFCFL.aml - CoffeeLake+ display backlight, with standard one after disabling dGPU max backlight was very low
* SSDT-RMNE.aml - Null Ethernet for App Store
* SSDT-UIAC.aml - USB config
* SSDT-XOSI.aml

## Post-install
Standard:
```
sudo pmset -a hibernatemode 0
sudo rm /var/vm/sleepimage
sudo mkdir /var/vm/sleepimage
sudo pmset -a standby 0
sudo pmset -a autopoweroff 0
sudo pmset -a powernap 0
```
In Energy Saver disable Power Nap, optionally disable Put hard disks to sleep, Wake for network access.

If You don't want Catalina, best do it before connecting to internet:
```
sudo softwareupdate --ignore "macOS Catalina"
```
