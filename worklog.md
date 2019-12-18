# 18-12-2019
This time following mainly https://fewtarius.gitbook.io/laptopguide/.

Will be installing Mojave on a ASUS VivoBook 15 R512FL i5-8265/20GB/512 MX250 (R512FL-BQ083); 15.6" 1080p display, Intel Core i5-8265U (1.6GHz to 3.9GHz); 20GB RAM DDR4 single-stick (there might be some problems here as it's non-standard, I may need RAM mapping https://hackintosher.com/forums/thread/mapping-ram-and-dimm-slots-on-a-hackintosh-with-clover-smbios.365/); 512GB SSD M2 PCIe; iGPU Intel UHD 620, dGPU Nvidia GeForce MX250 (will disable); not replacing internal WiFi/BT so will most likely use USB dongle; there is no Ethernet port so will need NullEthernet kext.

For SMBIOS I probably should start with MacBookPro15,2 because it has 2.3-3.8 GHz Core i5 (I5-8259U), but MacBookPro15,4 has 1.4-3.9 GHz Core i5 (I5-8257U) which matches speeds better. There are also MacBookAir8,1 and MacBookAir8,2 with 1.6-3.6 GHz Core i5 (I5-8210Y) but this is Amber Lake so don't think it fits.

As base use RehabMan's config_UHD630.plist.