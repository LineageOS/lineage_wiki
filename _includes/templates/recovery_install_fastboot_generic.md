{% assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

## Installing a custom recovery using `fastboot`

{% if device.custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}).
{% else %}
{% if device.uses_lineage_recovery %}
1. Download a custom recovery - you can download [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
{% else %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{% endif %}
{% endif %}
2. Connect your device to your PC via USB.
3. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
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
    {% include alerts/tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
5. Flash recovery onto your device:
```
fastboot flash recovery <recovery_filename>.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}

6. Now reboot into recovery to verify the installation:
    * {{ device.recovery_boot }}
    {% unless device.no_fastboot_boot %}
    {% unless device.uses_lineage_recovery %}

    Alternatively, on some devices and recoveries you can use fastboot to boot directly into the freshly flashed or any other desired recovery:
```
fastboot boot <recovery_filename>.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
    {% endunless %}
    {% endunless %}
