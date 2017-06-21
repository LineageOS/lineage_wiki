## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

{% if site.data.devices[page.device].project_spectrum %}
1. Flash Project Spectrum as outlined [here]({{ site.data.devices[page.device].project_spectrum }}).
{% endif %}
{% if site.data.devices[page.device].required_bootloader_link %}
2. Flash unlockable bootloader obtained from [here]({{ site.data.devices[page.device].required_bootloader_link }}) via stock recovery.
{% endif %}

{% unless site.data.devices[page.device].no_oem_unlock_switch %}
3. Enable OEM unlock in the Developer options settings on the device, if present.
{% endunless %}
4. Connect the device to your PC via USB.
5. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:

        adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
6. Once the device is in fastboot mode, verify your PC finds it by typing:

        fastboot devices

    {% include tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
7. Now type the following command to unlock the bootloader:

{% if site.data.devices[page.device].custom_unlock_cmd %}
        {{ site.data.devices[page.device].custom_unlock_cmd }}
{% else %}
        fastboot oem unlock
{% endif %}

8. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
9. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include templates/recovery_install_fastboot_generic.md %}
