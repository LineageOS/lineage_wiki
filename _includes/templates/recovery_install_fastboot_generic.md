## Installing a custom recovery using `fastboot`

1. Download a custom recovery - you can download [TWRP](https://twrp.me/Devices/). Simply search for your device on that page
   and download the latest recovery file, named something like `twrp-x.x.x-x-{{ site.data.devices[page.device].codename }}.img`.
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

        fastboot flash recovery twrp-x.x.x-x-{{ site.data.devices[page.device].codename }}.img

        {% include tip.html content="The file may not be named identically to what's in this command, so adjust accordingly." %}

6. Now reboot into recovery to verify the installation:
    * {{ site.data.devices[page.device].recovery_boot }}
