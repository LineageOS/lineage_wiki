## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Connect the device to your PC via USB.
2. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
3. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
    {% include tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
4. Now type the following command to get the bootloader status:
```
fastboot oem device-info
```
5. Follow the instructions at [Motorola Support](http://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-a) to unlock your bootloader.

    {% include note.html content="If your device is not supported by the Motorola Bootloader Unlock website, you will need to use an alternative bootloader unlock method like [SunShine](http://theroot.ninja/)." %}

6. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include templates/recovery_install_fastboot_generic.md %}
