## Installing a custom recovery for {{ site.data.devices[page.device].codename }}

1. Make sure your computer has working [fastboot and adb]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Root your device by following [this](http://forum.xda-developers.com/lg-g3/general/guide-root-lg-firmwares-kitkat-lollipop-t3056951) guide.
3. Download a custom recovery - you can download [TWRP](https://twrp.me/Devices/), simply search for your device on that page and download the corresponding
   recovery file, named something like `twrp-3.0.0-{{ site.data.devices[page.device].codename }}.img`.
4. Place the recovery image file on the root of /sdcard:
   * Using adb: `adb push twrp-3.0.0-{{ site.data.devices[page.device].codename }}.img /sdcard/twrp-vs985.img`
    {% include tip.html content="The file may not be named identically to what's in this command. Adjust accordingly." %}
   * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing USB debugging is enabled.
5. Now, open a command prompt window or terminal window and open an `adb shell`. In that shell, type the following commands:
   * `su`
   * `dd if=/sdcard/twrp-vs985.img of=/dev/block/platform/msm_sdcc.1/by-name/recovery`

Now, you should be able to reboot your device into TWRP! (Ignore the screen asking about a factory reset. If you have done everything correctly here, accepting a factory reset will not actually reset your device.)
