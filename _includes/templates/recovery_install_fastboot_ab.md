{% if site.data.devices[page.device].custom_twrp_codename %}
{% assign twrp_codename = site.data.devices[page.device].custom_twrp_codename %}
{% else %}
{% assign twrp_codename = site.data.devices[page.device].codename %}
{% endif %}

## Temporarily booting a custom recovery using `fastboot`

{% if site.data.devices[page.device].custom_twrp_link %}
1. Download a custom recovery - you can download [TWRP]({{ site.data.devices[page.device].custom_twrp_link }}).
{% else %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ twrp_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ twrp_codename }}.img`.
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
{% if device.no_fastboot_boot %}
5. Temporarily flash a recovery on your device by typing:
```
fastboot flash boot twrp-x.x.x-x-{{ twrp_codename }}.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
6. {{ device.recovery_boot }}
{% else %}
5. Temporarily boot a recovery on your device by typing:
```
fastboot boot twrp-x.x.x-x-{{ twrp_codename }}.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
{% endif %}
