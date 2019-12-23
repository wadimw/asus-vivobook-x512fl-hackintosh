# 18-12-2019
This time following mainly https://fewtarius.gitbook.io/laptopguide/.

Will be installing Mojave on a ASUS VivoBook 15 X512FL i5-8265/20GB/512 MX250 (R512FL-BQ083); 15.6" 1080p display, Intel Core i5-8265U (1.6GHz to 3.9GHz); 20GB RAM DDR4 single-stick (there might be some problems here as it's non-standard, I may need RAM mapping https://hackintosher.com/forums/thread/mapping-ram-and-dimm-slots-on-a-hackintosh-with-clover-smbios.365/); 512GB SSD M2 PCIe; iGPU Intel UHD 620, dGPU Nvidia GeForce MX250 (will disable); not replacing internal WiFi/BT so will most likely use USB dongle; there is no Ethernet port so will need NullEthernet kext.

For SMBIOS I probably should start with MacBookPro15,2 because it has 2.3-3.8 GHz Core i5 (I5-8259U), but MacBookPro15,4 has 1.4-3.9 GHz Core i5 (I5-8257U) which matches speeds better. There are also MacBookAir8,1 and MacBookAir8,2 with 1.6-3.6 GHz Core i5 (I5-8210Y) but this is Amber Lake so don't think it fits.

As base use RehabMan's config_UHD630.plist.

# 21-12-2019
Will start with SMBIOS 15,4. Installed default kexts:
* AppleALC.kext
* Lilu.kext
* NoTouchID.kext
* USBInjectAll.kext
* VirtualSMC.kext
* VoodooPS2Controller.kext
* WhateverGreen.kext
used drivers:
* VirtualSmc.efi
* HFSPlus.efi
* AptioMemoryFix.efi
* ApfsDriverLoader.efi
Added ACPI patch to get past apfs_module_start:1393. With this I am able to boot into installer.
To prevent issues with App Store I will also add NullEthernet before installation.

# 22-12-2019
After many back and forth I was able to complete the install changing SMBIOS to 15,2 and removing AptioMemoryFix.efi and using 
* OsxAptioFixDrv.efi
* EmuVariableUefi.efi - this one partially helped for reboot issues.

# 23-12-2019
I've had many problems with such config including: non-working graphics acceleration, terrible performance, freezes at random moments at boot logo (after verbose log), graphics freezes when windows appear (halfway through), inability to shut down, reboot etc. I have also found out that there is no way to enable XHCI Handoff in this laptop's BIOS so idk if it is enabled.

With this complete EFI https://www.tonymacx86.com/threads/mojave-10-14-6-on-asus-vivobook-s532fa.284231/post-2011381 I was able to boot into Mojave with apparently working graphics acceleration and good performance. I will now try to transfer these settings onto a new config piece by piece.

PROGRESS: to successfully boot into GPU-enabled gui I need
* VoodooTSCSync.kext