## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

{% if site.data.devices[page.device].project_spectrum_recovery %}
1. Download [Project Spectrum recovery]({{ site.data.devices[page.device].project_spectrum_recovery }}).
{% endif %}
{% if site.data.devices[page.device].project_spectrum %}
2. Download [Project Spectrum]({{ site.data.devices[page.device].project_spectrum }}).
{% endif %}
{% if site.data.devices[page.device].required_bootloader_link %}
3. Download unlockable bootloader obtained from [here]({{ site.data.devices[page.device].required_bootloader_link }}).
{% endif %}
4. Place the downloaded .zip packages on the root of `/sdcard`:
    * Using adb: `adb push filename.zip /sdcard/`
    * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing
        USB debugging is enabled.
5. If you aren't already in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
{% if site.data.devices[page.device].project_spectrum_recovery %}
6. Flash Project Spectrum recovery zip and reboot to recovery again:
    * {{ device.recovery_boot }}
{% endif %}
{% if site.data.devices[page.device].project_spectrum %}
7. Flash Project Spectrum zip.
{% endif %}
{% if site.data.devices[page.device].required_bootloader_link %}
8. Flash unlockable bootloader zip.
{% endif %}
9. Reboot to android.

{% unless site.data.devices[page.device].no_oem_unlock_switch %}
10. Enable OEM unlock in the Developer options under device Settings, if present.
{% endunless %}
11. Connect the device to your PC via USB.
12. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
13. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
    {% include tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
14. Now type the following command to unlock the bootloader:

{% if site.data.devices[page.device].custom_unlock_cmd %}
    ```
{{ site.data.devices[page.device].custom_unlock_cmd }}
    ```
{% else %}
    ```
fastboot oem unlock
    ```
{% endif %}

15. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
16. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include templates/recovery_install_fastboot_generic.md %}
