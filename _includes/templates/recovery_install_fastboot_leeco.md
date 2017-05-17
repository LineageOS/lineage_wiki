## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Make sure your computer has working [fastboot and adb]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
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
7. From the same terminal, type the following command to unlock the bootloader:

        fastboot oem unlock-go

8. From the same terminal, type the following command to unlock the bootloader:

		fastboot boot twrp.img

9. Once TWRP has started, run the following command to push the image to the internal storage:

		adb push twrp.img /sdcard/

10. In TWRP, choose 'Install' and then 'Install Image'. Select 'twrp.img'
11. Select partition 'Recovery', and confirm flash
12. Reboot into recovery
