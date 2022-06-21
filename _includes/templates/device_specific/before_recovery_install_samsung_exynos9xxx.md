## Pre-Install Instructions

{% include alerts/warning.html content="The following instructions will unlock the bootloader and wipe all userdata on the device." %}

1. Connect the device to a Wi-Fi network.
2. Enable Developer Options by pressing the "Build Number" option in the "Settings" app within the "About" menu
 * From within the Developer options menu, enable OEM unlock.
3. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the onscreen instructions correlate to "Continue" and/or "Unlock Bootloader".
4. Your device will reboot, you may now unplug the USB cable from your device.
5. The device will demand you format userdata, please follow the onscreen instructions to do so.
6. Run through Android Setup skipping everything you can, then connect the device to a Wi-Fi network.
7. Re-enable Development settings by clicking the "Build Number" option 10 times, in the "Settings" app within the "About" menu, and verify that "OEM Unlock" is still enabled in the "Developer options" menu.
