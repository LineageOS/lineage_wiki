{% assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

## Installing a custom recovery using `fastboot`

{%- if device.custom_recovery_link %}
{%- assign is_lineage_recovery = device.custom_lineage_recovery %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}). Simply download the recovery file and rename it to `{{ device.recovery_partition_name }}.img`.
{%- elsif device.uses_twrp %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img` and rename it to `{{ device.recovery_partition_name }}.img`.
{%- elsif device.maintainers != empty %}
{%- assign is_lineage_recovery = true %}
1. Download [Lineage Recovery](https://download.lineageos.org/devices/{{ custom_recovery_codename }}). Simply download the latest recovery file, named `{{ device.recovery_partition_name }}.img`.
{%- else %}
{%- assign is_lineage_recovery = true %}
1. [Build]({{ device | device_link: "/build" | relative_url }}) a LineageOS installation package. The recovery will be built as part of it!
{%- endif %}
    {% include alerts/important.html content="Other recoveries may not work for installation or updates. We strongly recommend to use the one linked above!" %}
{%- if device.maintainers != empty and device.is_retrofit_dynamic_partitions and device.is_ab_device != true %}
2. Download [super_empty.img](https://download.lineageos.org/devices/{{ device.codename }}) since your device uses retrofitted dynamic partitions.
{%- endif %}
3. Connect your device to your PC via USB if it isn't already.
4. If your device isn't already in fastboot mode, on the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb -d reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
5. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
   If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable (preferably use a USB Type-A 2.0 one or a USB hub) and port!

   {% include alerts/tip.html content="Some devices have buggy USB support while in bootloader mode, if you see `fastboot` hanging with no output when using commands such as `fastboot getvar ...`, `fastboot boot ...`, `fastboot flash ...` you may want to try a different USB port (preferably a USB Type-A 2.0 one) or a USB hub." %}
{%- if device.is_retrofit_dynamic_partitions and device.is_ab_device != true %}
6. Flash empty super image:
```
fastboot wipe-super super_empty.img
```
    {% include alerts/specific/note_retrofit_fastboot_wipe_super_failed.html %}
{%- endif %}
{% if device.needs_fastboot_boot %}
7. Temporarily boot recovery on your device:
```
fastboot boot {{ device.recovery_partition_name }}.img
```
{% else %}
7. Flash recovery onto your device:
```
fastboot flash {{ device.recovery_partition_name }} {{ device.recovery_partition_name }}.img
```
8. Now reboot into recovery to verify the installation.
    {%- if device.recovery_reboot %}
    * {% include snippets/recovery_reboot.md %}
    {%- else %}
    Do **not** reboot into the existing OS, since it will overwrite the recovery you just installed!
    * {{ device.recovery_boot }}

      {% include alerts/note.html content="If you can't power down the device, try long-pressing the key-combination (if any was used in the instructions above) until the device reboots and follow the instructions above" %}
    {%- endif %}
{%- include snippets/recovery_logo_note.md %}
{% endif %}
