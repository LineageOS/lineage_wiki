## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

{% unless site.data.devices[page.device].no_oem_unlock_switch %}
1. Enable OEM unlock in the Developer options under device Settings, if present.
2. Accept the terms that you understand that you're voiding your warranty by choosing to unlock your bootloader.
3. Login with your Lenovo account (if you already have one) or create a new one.
4. A 14 days countdown timer will start. This is specific per device.
5. After the waiting period, go back to OEM unlocking so that the Lenovo servers can toggle the bootloader unlock switch.
{% endunless %}
6. Connect the device to your PC via USB.
7. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
8. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
    {% include tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
9. Now type the following command to unlock the bootloader:

{% if site.data.devices[page.device].custom_unlock_cmd %}
    ```
{{ site.data.devices[page.device].custom_unlock_cmd }}
    ```
{% else %}
    ```
fastboot oem unlock
    ```
{% endif %}

10. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
11. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include templates/recovery_install_fastboot_generic.md %}
