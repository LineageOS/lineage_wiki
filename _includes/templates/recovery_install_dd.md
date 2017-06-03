## Rooting your device

{% include important.html content="The device must be rooted before proceeding any further." %}

{% case site.data.devices[page.device].root_method[0] %}
{% when 'custom' %}
1. Root your device by following [this]({{ site.data.devices[page.device].root_method[1] }}) guide.
{% when 'kingroot' %}
1. Download KingRoot from [here](https://kingroot.net/).
   1. Install and run the apk to achieve root. Ensure you have a working Internet connection.
{% when 'towelroot' %}
1. Download TowelRoot from [here](https://towelroot.com/).
   1. Click the large lambda symbol to download the apk.
   2. Install and run the apk to achieve root.
{% endcase %}

## Installing a custom recovery using `dd`

1. Download a custom recovery - you can download [TWRP](https://twrp.me/Devices/), simply search for your device on that page and download the corresponding
   recovery file, named something like `twrp-3.1.1-{{ site.data.devices[page.device].codename }}.img`.
2. Place the recovery image file on the root of `/sdcard`:
   * Using adb: `adb push twrp-3.1.1-{{ site.data.devices[page.device].codename }}.img /sdcard/twrp-{{ site.data.devices[page.device].codename }}.img`
    {% include tip.html content="The file may not be named identically to what's in this command. Adjust accordingly." %}
   * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing USB debugging is enabled.
3. Now, open an `adb shell` from a command prompt or terminal window. In that shell, type the following commands:

        su
        dd if=/sdcard/twrp-{{ site.data.devices[page.device].codename }}.img of={{ site.data.devices[page.device].recovery_partition }}

4. Manually reboot into recovery:
    * {{ site.data.devices[page.device].recovery_boot }}

{% if site.data.devices[page.device].vendor == "LG" %}
{% include note.html content="Ignore the screen asking about a factory reset. If you have done everything correctly, accepting a factory reset will not actually reset your device." %}
{% endif %}
