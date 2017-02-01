## Unlocking the bootloader with fastboot

{% include note.html content="The steps below only need to be run once per device. However, unlocking your device
involves wiping all data on your device!" %}

1. Make sure your computer has working [fastboot and adb](adb_fastboot_guide.html).
2. Enable [USB debugging](adb_fastboot_guide.html#setting-up-adb) on your device.
{% unless site.data.devices[page.device].no_oem_unlock_switch %}
3. Enable OEM unlock in the Developer options settings on the device, if present.
{% endunless %}
4. Connect the device to a computer through USB.
5. From a terminal on a computer, type the following to boot the device into fastboot mode:

        adb reboot bootloader

6. Once the device is in fastboot mode, verify your PC sees it by typing `fastboot devices`.
    * If you see `no permissions fastboot` or `<waiting for device>`, try running fastboot as root/Administratior.
7. From the same terminal, type the following command to unlock the bootloader:

        fastboot oem unlock

8. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
9. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include templates/recovery_install_fastboot_generic.md %}
