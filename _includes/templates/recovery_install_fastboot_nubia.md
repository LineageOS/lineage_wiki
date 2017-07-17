## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

{% unless site.data.devices[page.device].no_oem_unlock_switch %}
1. Enable OEM unlock in the Developer options settings on the device, if present.
{% endunless %}
2. Connect the device to your PC via USB.
3. Open a terminal on the PC and boot the device to fastboot mode by typing:

        adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
4. Once the device is in fastboot mode, verify your PC finds it by typing:

        fastboot -i 0x19d2 devices

    If you see `no permissions fastboot` or `<waiting for device>`, try running `fastboot` as root/Administrator.
5. From the same terminal, type the following command to unlock the bootloader:

{% if site.data.devices[page.device].custom_unlock_cmd %}
        {{ site.data.devices[page.device].custom_unlock_cmd }}
{% else %}
        fastboot -i 0x19d2 oem unlock
{% endif %}

6. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
7. Since the device resets completely, you will need to re-enable USB debugging to continue.

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

        fastboot -i 0x19d2 devices

    If you see `no permissions fastboot` or `<waiting for device>`, try running `fastboot` as root/Administrator.
5. Flash recovery onto your device:

        fastboot -i 0x19d2 flash recovery twrp-x.x.x-x-{{ site.data.devices[page.device].codename }}.img

    {% include tip.html content="The file may not be named identically to what's in this command, so adjust accordingly." %}

6. Now reboot into recovery to verify the installation:
    * {{ site.data.devices[page.device].recovery_boot }}
