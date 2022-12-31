{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

## Rooting your device

{% include alerts/important.html content="The device must be rooted before proceeding any further." %}

{% case device.root_method[0] %}
{% when 'custom' %}
1. Root your device by following [this]({{ device.root_method[1] }}) guide.
{% when 'kingroot' %}
1. Download KingRoot from [here](https://kingroot.net/).
   1. Install and run the apk to achieve root. Ensure you have a working Internet connection.
{% when 'towelroot' %}
1. Download TowelRoot from [here](https://towelroot.com/).
   1. Click the large lambda symbol to download the apk.
   2. Install and run the apk to achieve root.
{% endcase %}

{% include snippets/before_recovery_install.md %}

## Installing a custom recovery using `dd`

{%- if device.custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}).
{%- elsif device.uses_twrp %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{%- else %}
1. Download [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch | precision: 1 }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
{%- endif %}
2. Place the recovery image file on the root of `/sdcard`:
   * Using adb: `adb push <recovery_filename>.img /sdcard/<recovery_filename>.img`
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
   * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing USB debugging is enabled.
3. Now, open an `adb shell` from a command prompt (on Windows) or terminal (on Linux or macOS) window. In that shell, type the following commands:
```
su
dd if=/sdcard/<recovery_filename>.img of={{ device.recovery_partition }}
```
4. Reboot into recovery.
    * From the same shell, type the following command:
```
reboot recovery
```
