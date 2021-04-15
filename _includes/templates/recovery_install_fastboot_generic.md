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
{% if device.uses_twrp %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{% else %}
1. Download a custom recovery - you can download [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
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
{% if device.needs_fastboot_boot %}
5. Temorarily boot recovery on your device:
```
fastboot boot <recovery_filename>.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
    {% include alerts/tip.html content="Some devices have buggy USB support while in bootloader mode, if you see `fastboot` hanging with no output when using commands such as `fastboot getvar .. `, `fastboot boot ...`, `fastboot flash ...` you may want to try a different USB port (preferably a USB Type-A 2.0 one) or a USB hub." %}
{% else %}
5. Flash recovery onto your device:
```
fastboot flash recovery <recovery_filename>.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
    {% include alerts/tip.html content="Some devices have buggy USB support while in bootloader mode, if you see `fastboot` hanging with no output when using commands such as `fastboot getvar .. `, `fastboot boot ...`, `fastboot flash ...` you may want to try a different USB port (preferably a USB Type-A 2.0 one) or a USB hub." %}    
6. Now reboot into recovery to verify the installation:
    * {{ device.recovery_boot }}
{% endif %}