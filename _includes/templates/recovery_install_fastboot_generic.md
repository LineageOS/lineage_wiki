## Installing a custom recovery using `fastboot`

1. Download recovery - visit [twrp.me](https://twrp.me/Devices/) to obtain the latest version of Team Win Recovery Project for your device.
2. Connect your device to your PC via USB.
3. Open a terminal on the PC and boot the device to fastboot mode by typing:

        adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:
    
    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
4. Once the device is in fastboot mode, verify your PC finds it by typing:

        fastboot devices

    If you see `no permissions fastboot` or `<waiting for device>`, try running `fastboot` as root/Administrator.
5. Flash recovery onto your device:

        fastboot flash recovery your_recovery_img.img

6. Now reboot into recovery to verify the installation:
    * {{ site.data.devices[page.device].recovery_boot }}
