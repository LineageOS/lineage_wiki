## Pre-Install Instructions

{% include alerts/warning.html content="The following instructions have the potential to brick your device, there is no warranty implied or provided on any of the following software. Run this at your own risk" %}
{% include alerts/warning.html content="The following instructions will unlock the bootloader and wipe all userdata on the device." %}
{% include alerts/note.html content="The following instructions require a Windows host." %}

1. Download TowelRoot from [here](https://towelroot.com/).
    * Click the large lambda symbol to download the `.apk` file.
    * Install and run the `.apk` file to achieve root access.
2. If you're on Linux, proceed to step 3, if you're on Windows, you'll need to Install the NVidia APX drivers:
    {% include alerts/note.html content="The APX driver is not signed by an authority recognized by Microsoft, so we will first need to temporarily disable driver signature enforcement. These instructions are for Windows 10, if you're on any other version you'll need to adapt these to your version." %}
    * Download the newest NVidia APX drivers [here](https://download.ods.ninja/Android/drivers/apxdriver.zip)
    * Hold the "Shift" key on the host machine and click the Windows Start Button, then click "Restart"
    * If you're on Windows 10, choose "Troubleshoot", "Advanced options", "Startup Settings", then click "Restart"
    * Next, push the "7" key on your keyboard, your PC will now boot like normal
    * Extract `apxdriver.zip`, right clisk "NvidiaUsb.inf" and choose "Install" from the context menu. It may prompt you to authenticate with Administrator credentials, please do so now.
3. Download [this](https://download.ods.ninja/Android/firmware/yellowstone/yellowstone_pie_psci.zip) firmware package.
4. Extract `yellowstone_pie_psci.zip` in your Downloads directory.
5. Now, prepare to run the flash script:
    * If you're on Windows, open a PowerShell and run `cd %HOMEPATH%\Downloads\yellowstone_pie_psci\yellowstone_pie_psci`
    * If you're on Linux, open a Terminal and run `cd ~/Downloads/yellowstone_pie_psci`
6. Run `adb shell su -c dd if=/dev/block/platform/sdhci-tegra.3/by-name/PES of=/sdcard/persist.img` 
    {% include alerts/note.html content="This will take roughly one minute and will show no progress, please ensure the USB connection with the device is not disrupted." %}
7. Run `adb shell su -c dd if=/dev/block/platform/sdhci-tegra.3/by-name/PEK of=/sdcard/persistbk.img`
    {% include alerts/note.html content="This will take roughly one minute and will show no progress, please ensure the USB connection with the device is not disrupted." %}
8. Run `adb pull /sdcard/persist.img`.
9. Run `adb pull /sdcard/persistbk.img`.
10. Run `adb reboot bootloader`.
11. Use the volumte buttons to highlight "Forced Recovery", and then click the power button to select it.
12. Now, run the flash script:
     * If you're on Windows, right-click `flash.bat`, and in the context menu, choose "Run as Administrator"
     * If you're on Linux, run `./flash.sh`
         {% include alerts/note.html content="This process will take several minutes, go get a coffee, and ensure the USB connection with the device is not disrupted." %}
         {% include alerts/note.html content="The device will reboot to a mostly functional LineageOS 16.0, but to attain full functionallity, please proceed with the instructions." %}
13. Please follow the instructions found in step 2 [here](https://wiki.oddsolutions.us/adb_fastboot_guide.html#setting-up-adb) to re-enable ADB on the new installation before proceeding.
