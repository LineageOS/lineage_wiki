## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

{% unless site.data.devices[page.device].no_oem_unlock_switch %}
1. Enable OEM unlock in the Developer options under device Settings, if present.
{% endunless %}
2. Connect the device to your PC via USB.
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
    {% include tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
5. Now type the following command to obtain your bootloader unlock token:
```
fastboot oem get_identifier_token
```
6. Visit the [HTCDev Bootloader Unlock](http://www.htcdev.com/bootloader/) website and follow the instructions there to obtain your unlock key and unlock your bootloader. If your device does not appear in the drop-down list, select **All Other Supported Models**.

    {% include note.html content="If your device is not supported by the HTCDev Bootloader Unlock website, you will need to use an alternative bootloader unlock method like [SunShine](http://theroot.ninja/)." %}

7. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
8. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include templates/recovery_install_fastboot_generic.md %}