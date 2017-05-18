## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
This also includes your DRM keys, which are stored in the Trim Area partition (also called TA).
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent.
If you wish to backup the TA partition first, you can find tutorials related to your device on the internet." %}

1. Dial `*#*#7378423#*#*` (`*#*#SERVICE#*#*`) to launch the service menu.
2. Go to `service info` > `configuration` and check "rooting status" - you can only continue if it says `Bootloader unlock allowed: Yes`.
3. Get the current status of your bootloader:

    Open a terminal on the PC and boot the device to fastboot mode by typing:

        adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}

    Once the device is in fastboot mode, verify your PC detects it by typing:

        fastboot devices

    If you see `no permissions fastboot` or `<waiting for device>`, try running `fastboot` as root/Administrator.

4. Follow the instructions on [developer.sonymobile.com](http://developer.sonymobile.com/unlockbootloader/unlock-yourboot-loader/) to unlock your bootloader.

{% include templates/recovery_install_fastboot_generic.md %}
