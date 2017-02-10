## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Make sure your computer has working [fastboot and adb](adb_fastboot_guide.html).
2. Enable [USB debugging](adb_fastboot_guide.html#setting-up-adb) on your device.
3. Get the current status of your bootloader:

    Open a terminal on the PC and boot the device to fastboot mode by typing:

        adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}

    Once the device is in fastboot mode, verify your PC finds it by typing:

        fastboot devices

   If you see `no permissions fastboot` or `<waiting for device>`, try running `fastboot` as root/Administrator.

   From the same terminal, type the following command to get the bootloader status:

        fastboot oem device-info

4. Follow the instructions at [Motorola Support](http://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-a) to unlock your bootloader.

{% include templates/recovery_install_fastboot_generic.md %}
