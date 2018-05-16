## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Visit [Huawei's official unlocking website](http://emui.huawei.com/en/plugin/unlock/index), you'll be asked to login first.
2. Follow the instructions and get your unlock password.
3. Connect your device to your PC via USB.
4. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if site.data.devices[page.device].download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ site.data.devices[page.device].download_boot }}
    {% endif %}
5. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
    {% include tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
6. Now type the following command to unlock the bootloader:
```
fastboot oem unlock ****************
```
    Replace **************** with the 16-digit unique unlock password that was obtained in step 2.
7. Wait for the bootloader unlocking process to complete. Once finished, your device will reboot to system and will be restored to factory settings.
    If an incorrect password is entered, a message will be displayed and your device will also reboot to system.
8. Since the device resets completely, you will need to re-enable USB debugging to continue.
9. To check the bootloader lock status, reboot the device to fastboot mode (repeating steps 3 and 4) and type:
```
fastboot oem get-bootinfo
```
    The message `Bootloader Lock State: LOCKED` indicates that the bootloader is still locked. Perform the unlocking procedure again and check that the password was entered correctly.
    On the other hand, the message `Bootloader Lock State: UNLOCKED` indicates that the bootloader has been unlocked. You can now install third-party firmware.

{% include tip.html content="It is highly recommended to have the latest official EMUI package installed on the device, before proceeding with unlock." %}

{% include templates/recovery_install_fastboot_generic.md %}
