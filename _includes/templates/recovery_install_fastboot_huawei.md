## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Visit [Huawei's official unlocking website](http://emui.huawei.com/en/plugin/unlock/index), you'll be asked to login first.
2. Follow the instructions and get your unlock password.
3. Connect your device to your PC via USB.
4. Open a command prompt or terminal window on the PC and boot the device to fastboot mode by typing:

        adb reboot bootloader

    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
5. Once the device is in fastboot mode, verify your PC finds it by typing:

        fastboot devices

    If you see `no permissions fastboot` or `<waiting for device>`, try running `fastboot` as root/Administrator.
6. Now type:

        fastboot oem unlock ****************

    Where * refers to the 16-digit unlock password, e.g. `fastboot oem unlock 1234567812345678`.
7. When prompted, enter the unlock password and your device should then restart. If it is entered correctly, the device will be restored to its factory settings, after which will restart and enter standby mode.
  This completes the unlocking of the device’s bootloader. If an incorrect password is entered, a message will be displayed and the device will also enter standby mode.
8. To check the bootloader lock status reboot the device to fastboot mode (repeating steps 3 and 4) and type:

        fastboot oem get-bootinfo

    A message `Bootloader Lock State: LOCKED` indicates that the bootloader is still locked. Perform the unlocking procedure again and check that the password was entered correctly.
    On the other hand, a message `Bootloader Lock State: UNLOCKED` indicates that the bootloader has been unlocked. You can now install third-party firmware.

{% include tip.html content="It is highly recommended to have the latest official EMUI package installed on the device, before proceeding with unlock." %}

{% include templates/recovery_install_fastboot_generic.md %}
