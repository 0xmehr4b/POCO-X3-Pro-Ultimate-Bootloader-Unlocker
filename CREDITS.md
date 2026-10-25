# Credits

POCO X3 Pro EDL Bootloader Unlocker is reverse-engineered, written and
maintained by **Mohammad Mehrab Hossain** ([`0xmehr4b`](https://github.com/0xmehr4b)).

## Acknowledgements

| | |
|:--|:--|
| **Qualcomm Technologies** | Sahara and Firehose (`QSaharaServer.exe`, `fh_loader.exe`) protocol tooling and WHQL `qcusbser` 9008 serial drivers |
| **Android Open Source Project** | Platform Tools (`adb.exe`, `fastboot.exe`), WinUSB fastboot drivers, and the Linux Kernel / LittleKernel `devinfo` partition structure |
| **bkerler** | EDL / Sahara protocol research across Qualcomm `SM8150` targets |

## Tested on

POCO X3 Pro (`vayu` / `bhima`) · Snapdragon 860 (`SM8150`) · MIUI 12.5 / 13 /
14 & HyperOS ports (`V13.0.4.0.SJUMIXM` firmware baseline) · Reballed and
replacement unfused `SM8150` boards reporting `secure: no` · Windows 10 & 11
64-bit

## Bundled binaries

The release bundles standalone copies of `QSaharaServer.exe`, `fh_loader.exe`,
`lsusb.exe`, `adb.exe`, `fastboot.exe`, `prog_ufs_firehose_sm7150_ddr.elf`, and
signed Qualcomm 9008 / Fastboot WinUSB `.inf` driver packages so a single
checkout works offline without an external QPST or Android SDK install.
