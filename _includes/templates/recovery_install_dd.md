## Installing a custom recovery using `dd`

1. Make sure your computer has working [fastboot and adb]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Download a custom recovery - you can download [TWRP](https://twrp.me/Devices/), simply search for your device on that page and download the corresponding
   recovery file, named something like `twrp-3.0.0-{{ site.data.devices[page.device].codename }}.img`.
3. Place the recovery image file on the root of `/sdcard`:
   * Using adb: `adb push twrp-3.0.0-{{ site.data.devices[page.device].codename }}.img /sdcard/twrp-{{ site.data.devices[page.device].codename }}.img`
    {% include tip.html content="The file may not be named identically to what's in this command. Adjust accordingly." %}
   * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing USB debugging is enabled.
4. Now, open an `adb shell` from a command prompt or terminal window. In that shell, type the following commands:

        su
        dd if=/sdcard/twrp-{{ site.data.devices[page.device].codename }}.img of={{ site.data.devices[page.device].recovery_partition }}

You should now be able to reboot your device into TWRP!

{% if site.data.devices[page.device].vendor == "LG" %}
{% include note.html content="Ignore the screen asking about a factory reset. If you have done everything correctly, accepting a factory reset will not actually reset your device." %}
{% endif %}
