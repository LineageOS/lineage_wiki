## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}

1. Download the bootloader unlock app for your device:
    * Navigate to [Realme's forum site](https://c.realme.com)
    * Go to your device's page by clicking **Product** option, followed by the device's name.
    * Click **Unlock Bootloader Tutorial for Name_of_the_device**.
    * Download and install **the unlock tool apk** on your phone.
    * Open the unlock tool app and click **Start Applying**.
    * Please read the disclaimer in detail, select the checkbox, and submit your application.
    * The application will be processed in Realme servers and within an hour, the unlock tool apk will show the status of the unlock request. Once it shows the unlocking is successful, please proceed to the next step.
    * Click **Start the in-depth test** in the unlock tool app. The device will reboot.
    * `fast boot_unlock_verify ok` string will be displayed.
2. Download the latest SDK Platform-Tools for your PC from [here](https://developer.android.com/studio/releases/platform-tools) amd keep it unzipped.
3. Download vbmeta image from [here](https://sourceforge.net/projects/rmx1851/files/fastboot_files/vbmeta.img/download) and copy the file to the root of unzipped platform-tools folder where the fastboot and adb binaries reside.
4. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window and change to the location where the unzipped fastboot and adb binaries reside.
5. Enable USB debugging from developer settings in the phone and connect the device to your PC via USB.
6. Reboot to bootloader by typing:
```
adb reboot bootloader
```
7. Unlock the by typing:
```
fastboot flashing unlock
```
    * On your phone, press the Volume Up key to select **Unlock**.
8. Flash vb meta image by typing:
```
fastboot flash vbmeta vbmeta.img
```

{% if device.is_ab_device %}
{% include templates/recovery_install_fastboot_ab.md %}
{% else %}
{% include templates/recovery_install_fastboot_generic.md %}
{% endif %}
