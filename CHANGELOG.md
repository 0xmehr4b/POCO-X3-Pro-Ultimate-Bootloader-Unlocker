# Changelog

## v1.0.0

First public release. Unlocks any POCO X3 Pro (`vayu` / `bhima`, `SM8150`) with
`secure: no` directly over Qualcomm EDL `9008`, bypassing Xiaomi account
binding (`20091`) and token verification (`20031`).

### Why Mi Unlock fails after a board repair or CPU swap

POCO X3 Pro boards commonly undergo CPU/RAM reballing or receive a replacement
`SM8150` SoC. Replacement chips ship unfused (`secure: no` in `fastboot getvar
all`) and lack the factory-provisioned FID key inside Qualcomm TEE (`cardapp`).

When you tap *Add account and device* in Developer Options, `Settings.apk`
(`CloudDeviceStatus.bindAccountWithDevice`) asks `cardapp` to sign the bind
nonce. `cardapp` returns `status = -1003` (`Error 41`), Xiaomi's server replies
`code 10012 (No available key on server)`, and `Settings.apk` maps every failure
to `error_code = 20091`. In Fastboot, `fastboot oem unlock` checks the
server-signed token against `oem_misc1` and rejects unsigned attempts.

### Why EDL 9008 works without an authorized Xiaomi account

Disassembly of the stock `vayu` Firehose programmer
(`prog_ufs_firehose_sm7150_ddr.elf` at `0x14839868 -> 0x1483d904`) shows that
Xiaomi's `<sig>` authentication gate calls `boot_is_auth_enabled()`. On an
unfused `SM8150` (`secure: no`), that check returns `0` and skips signature
enforcement entirely.

At boot, `abl.elf` (`ReadWriteDeviceInfo` at `0x2b4e4`) reads the 4096-byte
`devinfo` partition from UFS LUN `0` sector `12288`. When `IsSecureBootEnabled`
is `0`, `abl.elf` trusts `devinfo` directly without checking `oem_misc1`:

- `0x00..0x0C` — `"ANDROID-BOOT!"` (13-byte magic)
- `0x0D` — `is_unlocked = 0x01`
- `0x0E` — `is_unlock_critical = 0x01`
- `0x0F` — `is_tampered = 0x00`
- `0x90` — `charger_screen_enabled = 0x01`
- `0x8A0` — `0x01` (stock `vayu` board flag)

### Added

- **6-stage automated Sahara + Firehose pipeline.** Detects `VID_05C6&PID_9008`
  in `<1 ms` via `HKLM\HARDWARE\DEVICEMAP\SERIALCOMM`, uploads
  `prog_ufs_firehose_sm7150_ddr.elf`, reads and backs up the live `devinfo`
  partition to `backups/`, patches only the unlock flags so board/panel bytes
  stay untouched, writes the patched image back to UFS LUN `0`, reads it back
  for a byte-for-byte comparison, and sends Firehose `<power value="reset"/>`.
- **Built-in 64-bit Win32 Sahara v2 fallback.** If `QSaharaServer.exe` fails a
  port handoff, the internal `ctypes` Sahara state machine (`c_void_p` `HANDLE`
  safe) streams the ELF loader directly over `\\.\COMx`.
- **Live UFS LUN 0 GPT fallback.** If a custom partition table moved `devinfo`
  away from sector `12288`, the tool reads the primary GPT (`read_gpt0.xml`),
  locates `devinfo` by UTF-16LE name, and updates the Firehose XMLs on the fly.
- **One-click `.bat` and dark-mode Tkinter GUI.** `One_Click_Unlock_POCO_X3_Pro.bat`
  verifies or installs the signed Qualcomm `9008` and Fastboot WinUSB drivers
  and launches the GUI already armed in `--auto-start` mode.
- **Illustrated 4-page PDF hardware guide.** Documents the exact two gold EDL
  test points on `vayu`, why the wide `MB` sub-board ribbon must stay plugged
  in while bridging them, first-boot `Wipe All Data` handling, and Xiaomi
  Account email 2FA rate-limit recovery.
