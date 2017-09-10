## Installing a custom recovery using `fastboot`

1. Download a custom recovery - you can download [TWRP](https://twrp.me/Devices/). Simply search for your device on that page
   and download the latest recovery file, named something like `twrp-x.x.x-x-{{ site.data.devices[page.device].codename }}.img`.
2. Connect your device to your PC via USB.
3. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:

        adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
4. Once the device is in fastboot mode, verify your PC finds it by typing:

        fastboot devices

    {% include tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
5. Flash recovery onto your device:

        fastboot flash recovery twrp-x.x.x-x-{{ site.data.devices[page.device].codename }}.img

    {% include tip.html content="The file may not be named identically to what's in this command, so adjust accordingly." %}

6. Now reboot into recovery to verify the installation:
    * {{ site.data.devices[page.device].recovery_boot }}

    {% include warning.html content="From flashing recovery you should reboot straight into recovery (do not boot into the ROM) Certain ROMs may rewrite recovery when booted. If this happens you would need to redo the process of flashing twrp" %}
