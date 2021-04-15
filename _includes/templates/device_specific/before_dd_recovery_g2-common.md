## Downgrading bootloader
In order to be able to boot a custom recovery and LineageOS you need to downgrade your bootloader.

1. Download the relevant files for your device variant from [here](https://androidfilehost.com/?w=files&flid=298128).
2. Place `aboot.bin` and `laf.bin` on the root of `/sdcard`:
   * Using adb:
```
adb push aboot.bin /sdcard/aboot.bin
adb push laf.bin /sdcard/laf.bin
```
3. Now, open an `adb shell` from a command prompt (on Windows) or terminal (on Linux or macOS) window. In that shell, type the following commands:
```
su
dd if=/sdcard/aboot.bin of=/dev/block/platform/msm_sdcc.1/by-name/aboot
dd if=/sdcard/laf.bin of=/dev/block/platform/msm_sdcc.1/by-name/laf
exit
exit
```
{% include alerts/important.html content="Do NOT shut down or reboot your device now, because you will not be able to boot again until you finish these instructions!" %}
