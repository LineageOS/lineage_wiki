## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent.
On all Sony devices unlocking bootloader will erase your DRM keys, stored into TA partition. You can find multiples tutorials, on internet, to backup your TA partition." %}

1. Dial `*#*#7378423#*#*` (`*#*#SERVICE#*#*`) to launch the service menu.
2. Go to `service info` > `configuration` and check "rooting status" - you can only continue if it says `Bootloader unlock allowed: Yes`.
3. Make sure your computer has working [fastboot and adb]({{ "adb_fastboot_guide.html" | relative_url }}).
4. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
5. Get the current status of your bootloader:

    Open a terminal on the PC and boot the device to fastboot mode by typing:

        adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}

    Once the device is in fastboot mode, verify your PC detects it by typing:

        fastboot devices

   If you see `no permissions fastboot` or `<waiting for device>`, try running `fastboot` as root/Administrator.

6. Follow the instructions on [developer.sonymobile.com](http://developer.sonymobile.com/unlockbootloader/unlock-yourboot-loader/) to unlock your bootloader.

{% include templates/recovery_install_fastboot_generic.md %}
