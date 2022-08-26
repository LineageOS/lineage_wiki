## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

1. Download the bootloader unlock app for your device:
    * Navigate to [Realme's forum](https://c.realme.com).
    * Go to your device's page by clicking **Product** option, followed by the device's name.
    * Click **Unlock Bootloader Tutorial for Name_of_the_device**.
    * Download and install **the unlock tool apk** on your phone.
    * Open the unlock tool app and click **Start Applying**.
    * Please read the disclaimer in detail, select the checkbox, and submit your application.
    * The application will be processed in Realme servers and within an hour, the unlock tool app will show the status of the unlock request. Once it shows the unlocking is successful, please proceed to the next step.
    * Click **Start the in-depth test** in the unlock tool app. The device will reboot.
    * `fast boot_unlock_verify ok` string will be displayed.
2. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window and change to the location where the unzipped fastboot and adb binaries reside.
3. Connect the device to your PC via USB cable.
4. Reboot to bootloader by typing:
```
adb reboot bootloader
```
5. Unlock the device by typing:
```
fastboot flashing unlock
```
    * On your phone, press the Volume Up key to select `Unlock`.
6. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
7. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include snippets/before_recovery_install.md %}

{% if device.is_ab_device and device.has_recovery_partition != true %}
{% include templates/recovery_install_fastboot_ab.md %}
{% else %}
{% include templates/recovery_install_fastboot_generic.md %}
{% endif %}
