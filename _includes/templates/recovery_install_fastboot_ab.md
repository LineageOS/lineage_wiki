{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}
{% if device.recovery_partition_name %}
{% assign recovery_partition_name = device.recovery_partition_name %}
{% else %}
{% assign recovery_partition_name = "boot" %}
{% endif %}

{%- if device.custom_recovery_link %}
## Booting a custom recovery using `fastboot`
{%- assign is_lineage_recovery = device.custom_lineage_recovery %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}). {{ device.custom_recovery_link_instructions }}
{%- elsif device.uses_twrp %}
## Temporarily booting a custom recovery using `fastboot`
{% include alerts/note.html content="This is temporary because the recovery is part of the OS and will be replaced once you install LineageOS. It is not optional, though!" %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{%- elsif device.maintainers != empty %}
## Booting a custom recovery using `fastboot`
{%- assign is_lineage_recovery = true %}
1. Download [Lineage Recovery](https://download.lineageos.org/devices/{{ custom_recovery_codename }}). Simply download the latest recovery file, named `{{ recovery_partition_name }}.img`.
{%- else %}
## Booting a custom recovery using `fastboot`
{%- assign is_lineage_recovery = true %}
1. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS installation package. The recovery will be built as part of it!
{%- endif %}
    {% include alerts/important.html content="Other recoveries may not work for installation or updates. We strongly recommend to use the one linked above!" %}
2. Connect your device to your PC via USB if it isn't already.
3. If your device isn't already in fastboot mode, on the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
4. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
  If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable (preferably use a USB Type-A 2.0 one or a USB hub) and port!

    {% include alerts/tip.html content="Some devices have buggy USB support while in bootloader mode, if you see `fastboot` hanging with no output when using commands such as `fastboot getvar ...`, `fastboot boot ...`, `fastboot flash ...` you may want to try a different USB port (preferably a USB Type-A 2.0 one) or a USB hub." %}

5. Flash a recovery on your device by typing (replace `<recovery_filename>` with the actual filename!):
```
fastboot flash {{ recovery_partition_name }} <recovery_filename>.img
```
    {% include alerts/note.html content="Outdated fastboot releases dropped legacy A/B support, so it might attempt to flash to `boot__a` / `boot__b` rather than `boot_a` / `boot_b` if you try to flash `boot`. In this case, you must update `fastboot` to a release newer than or equal to `31.0.2`. Alternatively, you can manually specify which slot to flash to based on what slot fastboot failed to flash to. For example, if fastboot fails to flash to `boot__a`, you must flash to `boot_a`." %}
6. Now reboot into recovery to verify the installation.
    {%- if device.recovery_reboot %}
    * {% include snippets/recovery_reboot.md %}
    {%- else %}
    * {{ device.recovery_boot }}
    {%- endif %}
{%- include snippets/recovery_logo_note.md %}
