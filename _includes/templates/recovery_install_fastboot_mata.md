{%- assign device = site.data.devices[page.device] -%}

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

1. In Settings, search for `oem`, and click `OEM unlocking`. Toggle it from off to on. (Note: if you do not find this option, you probably haven't enabled developer options. Please return to "Basic Requirements" above and follow the link to enable USB debugging.)
2. Connect the device to your PC via USB.
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
5. Now type the following command to unlock the bootloader:

{% if device.custom_unlock_cmd %}
    ```
{{ device.custom_unlock_cmd }}
    ```
{% else %}
    ```
fastboot oem unlock
    ```
{% endif %}

6. Use the volume keys to select `yes` and the power key to execute. The phone will reboot.
7. Since the device resets completely, you will need to re-enable USB debugging to continue (see Basic requirements above.)

{% if device.is_ab_device %}
{% include templates/recovery_install_fastboot_ab.md %}
{% else %}
{% include templates/recovery_install_fastboot_generic.md %}
{% endif %}
