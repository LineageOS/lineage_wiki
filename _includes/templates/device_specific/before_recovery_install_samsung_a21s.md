## Pre-Install Instructions

{% include alerts/warning.html content="The following instructions will unlock the bootloader and wipe all userdata on the device." %}

1. Connect the device to a Wi-Fi network.
2. Enable Developer Options by pressing the "Build Number" option at least 7 times, in the "Settings" app within the "About" menu
3. Within the "Settings" app go to "Date and Time" and change the date to be 2 years in the past
4. Reboot the device
5. Go to the Developer Options menu in the "Settings" app and enable OEM unlock
6. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the onscreen instructions correlate to "Continue" and/or "Unlock Bootloader".
7. Your device will reboot and format all user data, you may now unplug the USB cable from your device.
8. Run through Android Setup, it is crucial that you connect to a Wi-Fi network when setting up the device
9. Re-enable Development settings by clicking the "Build Number" option 7 times, in the "Settings" app within the "About" menu, and verify that "OEM Unlock" is still enabled in the "Developer options" menu.
