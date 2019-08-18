{% if site.data.devices[page.device].custom_recovery_codename %}
{% assign custom_recovery_codename = site.data.devices[page.device].custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = site.data.devices[page.device].codename %}
{% endif %}

## Temporarily booting a custom recovery using `fastboot`

{% if site.data.devices[page.device].custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ site.data.devices[page.device].custom_recovery_link }}).
{% else %}
{% if device.uses_lineage_recovery %}
1. Download a custom recovery - you can download [Lineage Recovery](https://ftp.acc.umu.se/mirror/lineageos/recovery/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
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

5. Temporarily flash a recovery on your device by typing:
```
fastboot flash boot <recovery_filename>.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
6. {{ device.recovery_boot }}

{% unless site.data.devices[page.device].no_fastboot_boot %}
{% unless site.data.devices[page.device].uses_lineage_recovery %}
    Alternatively, on some devices and recoveries you can use fastboot to boot directly into the freshly flashed or any other desired recovery:
```
fastboot boot <recovery_filename>.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
{% endunless %}
{% endunless %}
