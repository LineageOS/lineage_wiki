## Pre-Install Instructions

{% include alerts/warning.html content="The following instructions will unlock the bootloader and wipe all userdata on the device." %}

1. Connect the device to a Wi-Fi network.
2. Enable Developer Options by pressing the "Build Number" option in the "Settings" app within the "About" menu
 * From within the Developer options menu, enable OEM unlock.
3. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, hold down the "Volume Up" button until you see the "Unlock bootloader" screen.
    * Then press the "Volume Up" button once to unlock the bootloader.
4. Your device will reboot twice and erase your data, you may now unplug the USB cable from your device.
5. Run through Android Setup skipping everything you can, then connect the device to a Wi-Fi network.
6. Re-enable Development settings by clicking the "Build Number" option 7 times, in the "Settings" app within the "About" menu, and verify that "OEM Unlock" is enabled and greyed out in the "Developer options" menu.
