{%- assign device = site.data.devices[page.device] -%}

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

{% unless device.no_oem_unlock_switch %}
1. Enable OEM unlock in the Developer options under device Settings, if present.
{% endunless %}
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
  If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable and port!
5. Now type the following command to obtain your bootloader unlock token:
```
fastboot oem get_identifier_token
```
6. Visit the [HTCDev Bootloader Unlock](http://www.htcdev.com/bootloader/) website and follow the instructions there to obtain your unlock key and unlock your bootloader. If your device does not appear in the drop-down list, select **All Other Supported Models**.

    {% include alerts/note.html content="If your device is not supported by the HTCDev Bootloader Unlock website, you may be able to use an alternative bootloader unlock method like [SunShine](http://theroot.ninja/), though they only support some devices/firmwares." %}

7. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
8. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include snippets/before_recovery_install.md %}

{% include templates/recovery_install_fastboot_generic.md %}
