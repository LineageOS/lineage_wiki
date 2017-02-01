## Installing a custom recovery using fastboot

1. Make sure your computer has working [fastboot and adb](adb_fastboot_guide.html).
2. Download recovery - visit [twrp.me](https://twrp.me/Devices/) to obtain the latest version of Team Win Recovery Project for your device.
3. Connect your device to your PC via USB.
4. Open a terminal on the PC and boot the device to fastboot mode by typing

        adb reboot bootloader

    * You can also boot into fastboot mode via a key combination: {{ site.data.devices[page.device].download_boot }}
5. Once the device is in fastboot mode, verify your PC sees it by typing `fastboot devices`.
    * If you see `no permissions fastboot` or `<waiting for device>`, try running fastboot as root/Administratior.
6. Flash recovery onto your device:

        fastboot flash recovery your_recovery_img.img

7. Now reboot into recovery to verify the installation: {{ site.data.devices[page.device].recovery_boot }}
