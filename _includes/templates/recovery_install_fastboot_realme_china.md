{%- assign device = site.data.devices[page.device] %}

## Getting permission to unlock bootloader

{% include alerts/important.html content="This step only applies to Chinese Realme devices **purchased with Chinese Region Stock ROM pre-installed**." %}
{% include alerts/warning.html content="The bootloader unlock process **must be performed on the shipped Realme UI version** (the original factory ROM). If your device is not running the shipped Realme UI version, you will need to downgrade before proceeding. [Refer to the official downgrade guide](https://www.realme.com/cn/support/kw/doc/2026397)." %}

Unlike global devices, Chinese devices can be unlocked using the standard "Deep Testing" method.

As of Q4-2024, the following restrictions apply to the unlock process:

* For the GT series, 300 bootloader unlock slots will be released one month after the launch event. Starting the following month **until maintenance ends**, 200 slots will be released at midnight on the 1st of each month Chinese Standard Time (GMT+8).

* For other series, 200 slots will be released for the first time one month after the launch event. Starting the following month **until maintenance ends**, 200 slots will be released at midnight on the 1st of each month Chinese Standard Time (GMT+8).

Please note that once you have been granted unlock access, you **must** follow the instructions below and unlock your device within 7 days. Each application is valid for a single device only and cannot be transferred to any other device. If your application is declined for any reason, you can resubmit until it is accepted.

LineageOS is not affiliated with Realme, nor will you find any support with filling out these applications in our community. Only proceed once you have followed all required steps to unlock the bootloader.

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

1. Create an HeyTap account on [HeyTap's website](https://id.heytap.com/v3/auth/register).
2. Enable Developer Options by pressing the "Build Number" option at least 7 times, in the "Settings" app within the "About" menu
    * From within the Developer options menu, enable "OEM unlock".
3. Download and install the bootloader unlock app from [here](https://r11.realme.net/CN/thread-attachment/888043131025080903.zip) by extracting the zip file, then running:
```
adb -d install DeepTesting-encrypt-realme-09051708.apk
```
5. Open the app and sign in with your HeyTap account.
6. Tap "Start Application", carefully read the disclaimer, and check the box to agree.
7. Tap "Submit Application" and return to the application screen. You can use "Query Review Status" to check if your application has been approved.
8. Once approved, tap "Start Deep Testing". Your device will reboot into fastboot mode.
9. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
  If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable and port!
9. Now type the following command to unlock the bootloader:
```
fastboot flashing unlock
```
    {% include alerts/note.html content="At this point, the device may display on-screen prompts which will require interaction to continue the process of unlocking the bootloader. Please take whatever actions the device asks you to in order to proceed." %}

10. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
11. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include snippets/before_recovery_install.md %}

{% include templates/recovery_install_fastboot_generic.md %}
