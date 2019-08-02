{% if site.data.devices[page.device].custom_custom_recovery_codename %}
{% assign custom_recovery_codename = site.data.devices[page.device].custom_custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = site.data.devices[page.device].codename %}
{% endif %}

## Installing a custom recovery using `fastboot`

{% if site.data.devices[page.device].custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ site.data.devices[page.device].custom_recovery_link }}).
{% else %}
{% if device.uses_lineage_recovery %}
1. Download a custom recovery - you can download [Lineage Recovery](https://ftp.acc.umu.se/mirror/lineageos/recovery/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-x.yy-yyyymmdd-$
{% else %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{% endif %}
{% endif %}
2. Connect your device to your PC via USB.
3. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
4. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
    {% include alerts/tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
5. Flash recovery onto your device:
{% if device.uses_lineage_recovery %}
```
fastboot flash recovery lineage-xx.y-yyyymmdd-recovery-{{ custom_recovery_codename }}.img
```
{% else %}
```
fastboot flash recovery twrp-x.x.x-x-{{ custom_recovery_codename }}.img
```
{% endif %}
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}


6. Now reboot into recovery to verify the installation:
    * {{ site.data.devices[page.device].recovery_boot }}
    {% unless site.data.devices[page.device].no_fastboot_boot %}
    　  
    Alternatively, on some devices you can use fastboot to boot directly into the freshly flashed or any other desired recovery:
{% if device.uses_lineage_recovery %}
```
fastboot boot lineage-xx.y-yyyymmdd-recovery-{{ custom_recovery_codename }}.img
```
{% else %}
```
fastboot boot twrp-x.x.x-x-{{ custom_recovery_codename }}.img
```
{% endif %}
    {% endunless %}
