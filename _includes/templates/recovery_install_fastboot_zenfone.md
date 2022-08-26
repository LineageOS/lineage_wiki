## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}

1. Download the bootloader unlock app for your device:
{% if page.device == "Z00L" %}
    {% include alerts/note.html content="ZE550KL doesn't have its own unlock app. If you have ZE550KL then use the unlock app for ZE551KL." %}
{% endif %}
    * Navigate to [ASUS' support site](https://www.asus.com/support) and go to your device's page by entering its model number.
    * Click **Driver & Tools**.
    * Select **Android** from the drop-down menu.
    * Open the **Utilities** section.
    * Download the **Unlock Device App**.
    * If the downloaded file is packaged in a `.zip` archive, extract it.
2. Connect the device to your PC via USB.
3. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window and change to the location where the Unlock Device App `.apk` resides.
4. Install the `.apk` by typing:
```
adb install Name_of_unlock_app.apk
```
    * For example, on the ZE551ML device, it would be `adb install UnlockApp_ze551ml_20150723.apk`.

5. Run the application **Unlock Device Tool** from the device and agree to the terms.

    {% include alerts/note.html content="After you agree to the terms, the ASUS unlock app might ask you to login with your Google account. If your password does not work, then you need to enable temporary access for less secure apps [here](https://www.google.com/settings/security/lesssecureapps). If you have two-factor authentication enabled on your Google account, you will have to generate an individual app password on the Google accounts settings website, as the unlock app does not natively support two-factor." %}

6. Press the button to unlock your device.
7. The device should automatically reboot into bootloader mode and the message `unlock successfully...reboot after 5 seconds` should be displayed. The device will then reboot and load Android.

{% include snippets/before_recovery_install.md %}

{% if device.is_ab_device and device.has_recovery_partition != true %}
{% include templates/recovery_install_fastboot_ab.md %}
{% else %}
{% include templates/recovery_install_fastboot_generic.md %}
{% endif %}
