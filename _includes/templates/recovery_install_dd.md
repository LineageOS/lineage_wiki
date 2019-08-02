{% if site.data.devices[page.device].custom_recovery_codename %}
{% assign custom_recovery_codename = site.data.devices[page.device].custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = site.data.devices[page.device].codename %}
{% endif %}

## Rooting your device

{% include alerts/important.html content="The device must be rooted before proceeding any further." %}

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

{% if site.data.devices[page.device].custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ site.data.devices[page.device].custom_recovery_link }}).
{% else %}
{% if device.uses_lineage_recovery %}
1. Download a custom recovery - you can download [Lineage Recovery](https://ftp.acc.umu.se/mirror/lineageos/recovery/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-x.yy-yyyymmdd-$
{% else %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{% endif %}
{% endif %}
2. Place the recovery image file on the root of `/sdcard`:
   * Using adb: `adb push twrp-x.x.x-x-{{ custom_recovery_codename }}.img /sdcard/twrp-{{ custom_recovery_codename }}.img`
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
   * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing USB debugging is enabled.
3. Now, open an `adb shell` from a command prompt (on Windows) or terminal (on Linux or macOS) window. In that shell, type the following commands:
```
su
dd if=/sdcard/twrp-{{ custom_recovery_codename }}.img of={{ site.data.devices[page.device].recovery_partition }}
```
4. Manually reboot into recovery:
    * {{ site.data.devices[page.device].recovery_boot }}

{% if site.data.devices[page.device].vendor == "LG" %}
{% include alerts/note.html content="Accept the factory reset prompt using the hardware buttons. If you have done everything correctly, this will not actually reset your device but instead will install the custom recovery." %}
{% endif %}
