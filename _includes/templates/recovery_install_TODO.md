### Unlocking the bootloader

**WARNING:**
Unlocking the bootloader will automatically wipe all device data.

* Make sure your computer has working fastboot and adb.
* Enable USB debugging on the device.
* Enable OEM unlock in the Developer options settings on the device. (Note: Not all devices have this setting, so continue with next step if yours does not.)
* Connect the device to the computer through USB.
* From a terminal on a computer, type `adb reboot bootloader` to boot the device into fastboot mode:
* Once the device is in fastboot mode, verify your PC sees the device by typing fastboot devices
* If you don't see your device serial number, and instead see `<waiting for device>`, fastboot is not configured properly on your machine. See fastboot documentation for more info.
* If you see `no permissions fastboot`, try running fastboot as root.
* From the same terminal, type `fastboot oem get_unlock_data` to obtain your bootloader unlock code:
* Visit the bootloader unlock website for your manufacturer and follow the instructions there to obtain your unlock key and unlock your bootloader.
* If the device doesn't automatically reboot, reboot it from the menu. It should now be unlocked.
* Since the device resets completely, you will need to re-enable USB debugging on the device to continue.

### Installing a custom recovery using fastboot

**See All About Recovery Images for more information about custom recoveries and their capabilities.**

* Make sure your computer has working fastboot and adb.
* Download recovery -- you can visit twrp.me to obtain the latest version of Team Win Recovery Project for your device.
* Make sure the fastboot binary is in your PATH or that you place the recovery image in the same directory as fastboot.
* Open a terminal on your PC and reboot the device into fastboot mode by typing `adb reboot bootloader` or by using the hardware key combination for your device while it is powered off.
* Once the device is in fastboot mode, verify your PC sees the device by typing `fastboot devices`
* If you don't see your device serial number, and instead see `<waiting for device>`, fastboot is not configured properly on your machine. See fastboot documentation for more info.
* If you see `no permissions	fastboot`, make sure your UDEV rules are setup correctly.
* Flash recovery onto your device by entering the following command: `fastboot flash recovery your_recovery_image.img` where the latter part is the filename of the recovery image.
* Once the flash completes successfully, reboot the device into recovery to verify the installation.

*Note:* Some ROMs overwrite recovery at boot time so if you do not plan to immediately boot into recovery to install LineageOS, please be aware that this may overwrite your custom recovery with the stock one.

