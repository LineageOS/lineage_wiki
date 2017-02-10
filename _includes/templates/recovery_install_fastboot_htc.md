## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device. Most of the recent (2013+) HTC devices' bootloader can be unlocked through the HTCDev Bootloader Unlock website. Devices from Verizon (with the only exception being the HTC One Max, which can be unlocked using HTCDev Bootloader Unlock) do not have this option as Verizon does not allow the unlocking of bootloaders on their devices. Therefore you will need to use an alternative bootloader unlock method like [SunShine](http://theroot.ninja/) to unlock it. %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Make sure your computer has working [fastboot and adb](adb_fastboot_guide.html).
2. Enable [USB debugging](adb_fastboot_guide.html#setting-up-adb) on your device.
{% unless site.data.devices[page.device].no_oem_unlock_switch %}
3. Enable OEM unlock in the Developer options settings on the device, if present.
{% endunless %}
4. Connect the device to your PC via USB.
5. Open a terminal on the PC and boot the device to fastboot mode by typing:

    adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
6. Once the device is in fastboot mode, verify your PC finds it by typing:

        fastboot devices

   If you see `no permissions fastboot` or `<waiting for device>`, try running `fastboot` as root/Administrator.
7. From the same terminal, type the following command to obtain your bootloader unlock token:

        fastboot oem get_identifier_token

8. Visit the [HTCDev Bootloader Unlock](http://www.htcdev.com/bootloader/) website and follow the instructions there to obtain your unlock key and unlock your bootloader. If your device does not appear in the drop-down list, select **All Other Supported Models**.
9. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
10. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include templates/recovery_install_fastboot_generic.md %}