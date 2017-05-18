## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Get the current status of your bootloader:

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

2. Follow the instructions at [Motorola Support](http://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-a) to unlock your bootloader.

    {% include note.html content="If your device is not supported by the Motorola Bootloader Unlock website, you will need to use an alternative bootloader unlock method like [SunShine](http://theroot.ninja/)." %}

{% include templates/recovery_install_fastboot_generic.md %}
