{% unless site.data.devices[page.device].no_oem_unlock_switch %}
## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Visit [Huawei's official unlocking website](http://emui.huawei.com/en/plugin/unlock/index), you'll be asked to login first.
2. Follow the instructions and get your unlock password.
3. Connect your device to your PC via USB.
4. Open a terminal on the PC and boot the device to fastboot mode by typing:

        adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:
    
    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
5. Once the device is in fastboot mode, verify your PC finds it by typing:

        fastboot devices

    If you see `no permissions fastboot` or `<waiting for device>`, try running `fastboot` as root/Administrator.
6. In the command prompt, enter “fastboot oem unlock \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*”, where * refers to the 16-digit unlock password, e.g. fastboot oem unlock 1234567812345678”.
7. Enter the unlock password. Your device should then restart. If the password is entered correctly, the device will be restored to its factory settings, after which the device will restart and enter standby mode. This completes the unlocking of the device’s bootloader. If an incorrect password is entered, a message will be displayed and the device will enter standby mode.
8. Repeat steps 3 and 4. In the computer’s command prompt, enter “fastboot oem get-bootinfo”. Your device's bootloader will be displayed. “Bootloader Lock State: LOCKED” indicates that the bootloader is still locked. Perform the unlocking procedure again and check that the password was entered correctly. “Bootloader Lock State: UNLOCKED” indicates that your device’s bootloader has been unlocked. You can now install third-party firmware.

{% include tip.html content="It is highly recommended to have the latest official EMUI package installed on the device, before proceeding with unlock." %}
{% endunless %}

{% include templates/recovery_install_fastboot_generic.md %}
{% if site.data.devices[page.device].no_oem_unlock_switch %}
{% include tip.html content="It is highly recommended to have the latest official EMUI package installed on the device, before installing a custom recovery." %}
{% endif %}
