## Important Information: **Potential DATA LOSS**

HTC improved the security of their full disk encryption in their Nougat release.
Because of their improved encryption, it no longer possible for a source built
ROM to decrypt a userdata partition encrypted with HTC's Nougat (or later) software.

### Terminology

- **userdata** : The disk partition that contains `/data` and also contains `/sdcard`
- **wipe data** or **factory reset** : Erases the contents of `/data` but not `/sdcard`
- **format userdata** : Formats `userdata`, including all content in `/scard`

### What you need to know

- If you are installing from MM (6.0) HTC stock firmware, everything should work normally.
- If you are installing from N (7.x) HTC stock firmware, you will have to **format userdata**.
  If you want to backup your stock install, you must backup to your external SD because
  any backup storage in the default location (on `/sdcard`) will be lost in the format.
- If you didn't read these instructions and try to install LineageOS on top of N userdata
  after only performing a factory reset then:
  - On boot it will ask you for your password to decrypt data but your password will not
    decrypt it.
  - If you reboot to TWRP, TWRP will not be able to mount `/data` or `/sdcard` and will
    also prompt for your password to decrypt it and, again, your password will not work.
  - To recover from this you will either need to **format userdata** or you will need to
     restore your stock backup.  After restoring your stock backup, reboot to TWRP and
     it should now be able to mount `/data` and `/sdcard`.

### Installing on Sprint or Verizon devices

Sprint and Verizon do not ship with an unlockable bootloader.  Even if you do unlock it,
something in its firmware is still not compatible with LineageOS.  People have had
success flashing modified US Unlocked firmware and then RUU'ing back to their proper
firmware before installing LineageOS.  Please use Google and/or XDA to read more about
what has worked for others.