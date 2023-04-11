{%- assign device = site.data.devices[page.device] -%}

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

{% if device.project_spectrum_recovery %}
1. Download [Project Spectrum recovery]({{ device.project_spectrum_recovery }}).
{% endif %}
{% if device.project_spectrum %}
2. Download [Project Spectrum]({{ device.project_spectrum }}).
{% endif %}
{% if device.required_bootloader_link %}
3. Download unlockable bootloader obtained from [here]({{ device.required_bootloader_link }}).
{% endif %}
4. Place the downloaded .zip packages on the root of `/sdcard`:
    * Using adb: `adb push filename.zip /sdcard/`
    * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing
        USB debugging is enabled.
5. If you aren't already in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
{% if device.project_spectrum_recovery %}
6. Flash Project Spectrum recovery zip and reboot to recovery again:
    * {{ device.recovery_boot }}
{% endif %}
{% if device.project_spectrum %}
7. Flash Project Spectrum zip.
{% endif %}
{% if device.required_bootloader_link %}
8. Flash unlockable bootloader zip.
{% endif %}
9. Reboot to android.

{% unless device.no_oem_unlock_switch %}
10. Enable OEM unlock in the Developer options under device Settings, if present.
{%- endunless %}
11. Connect the device to your PC via USB.
12. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
13. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
  If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable and port!
14. Now type the following command to unlock the bootloader:

{% if device.custom_unlock_cmd %}
    ```
{{ device.custom_unlock_cmd }}
    ```
{% else %}
    ```
fastboot oem unlock
    ```
{% endif %}
    {% include alerts/note.html content="At this point the device may display on-screen prompts which will require interaction to continue the process of unlocking the bootloader. Please take whatever actions the device asks you to to proceed." %}

15. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
16. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include snippets/before_recovery_install.md %}

{% include templates/recovery_install_fastboot_generic.md %}
