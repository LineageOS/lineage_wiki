## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}

1. Make sure your computer has working [fastboot and adb]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
3. Download the bootloader unlock app for your device:
{% if page.device == "Z00L" %}
    {% include note.html content="ZE550KL doesn't have its own unlock app. If you have ZE550KL then use the unlock app for ZE551KL." %}
{% endif %}
    * Navigate to [Asus' support site](https://www.asus.com/support) and go to your device's page by entering its model number.
    * Click **Driver & Tools**.
    * Select **Android** from the drop-down menu.
    * Open the **Utilities** section.
    * Download the **Unlock Device App**.
    * If the downloaded file is packaged in a `.zip` archive, extract it.
4. Open a command prompt or terminal and change to the location where the Unlock Device App `.apk` resides.
5. Install the apk by running:

        adb install Name_of_unlock_app.apk
    
    * For example, on the ZE551ML device, it would be `adb install UnlockApp_ze551ml_20150723.apk`.

6. Run the application **Unlock Device Tool** from the device and agree to the terms.

    {% include note.html content="After you agree with the terms, the Asus unlock app might ask you to login with your Google account. If your password does not work, then you need to enable temporary access for less secure apps [here](https://www.google.com/settings/security/lesssecureapps). If you have two-factor authentication enabled on your Google account, you will have to generate an individual app password on the Google accounts settings website, as the ASUS unlock app does not natively support two-factor." %}

7. Press the button to unlock your device.
8. The device should automatically reboot into bootloader mode and the message `unlock successfully...reboot after 5 seconds` should be displayed. The device will then reboot and load Android.

{% include templates/recovery_install_fastboot_generic.md %}
