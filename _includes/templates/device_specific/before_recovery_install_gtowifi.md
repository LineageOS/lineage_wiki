## Pre-Install Instructions

{% include alerts/warning.html content="The following instructions will unlock the bootloader and wipe all userdata on the device." %}

{% unless device.no_oem_unlock_switch %}
1. Connect the device to a Wi-Fi network.
1. Enable Developer Options by pressing the "Build Number" option at least 7 times, in the "Settings" app within the "About" menu
    * From within the Developer options menu, enable OEM unlock.
{% endunless %}
1. Download [this](https://sourceforge.net/projects/lifehackerhansol-android/files/gto-unlock/1-unlocked-aboot.tar) package.
   {% include alerts/warning.html content="If you skip this step, you will not be able to unlock your bootloader!" %}
1. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the onscreen instructions correlate to "Device unlock mode" and/or "Unlock Bootloader".
    * Device will restart, repeat steps 1 and 2 to enable the Developer Options menu again.
    * Verify that "OEM Unlock" is still enabled and continue to step 5
1. Download and install the necessary drivers.
    * Download the newest Samsung drivers from [here](https://developer.samsung.com/mobile/android-usb-driver.html).
    * Install `SAMSUNG_USB_Driver_for_Mobile_Phones.exe`.
1. Download [this](https://androidfilehost.com/?fid=4349826312261712202) version of Odin.
1. Extract "Odin_3.13.1.zip".
1. Run `Odin3 v3.13.1` found in the newly extracted "Odin_3.13.1" folder.
1. Check the box labeled next to the button labeled "BL", and then click the "BL" button.
    * In the menu that pops up, select the previously downloaded package `.tar` file.
1. Power off the device, and again boot it into download mode:
    * {{ device.download_boot }}
1. Check in the top left of the Odin window that you see a valid device, it will show up as something like `COM0`.
    {% include alerts/tip.html content="The `COM` port, or the number succeeding `COM`, may be any valid number." %}
1. Click "Start". A transfer bar will appear on the device showing the package being flashed.
1. Your device will reboot, you may now unplug the USB cable from your device.
    * After this step, your bootloader version will display as `T290XXS3ATF1`. This is a part of the bootloader unlock process.
{%- capture warning_restore_stock %}
If, on this step, your device is stuck on a black screen, your device's bootloader is not unlockable and you cannot continue with these instructions. To return to the stock ROM, boot to Download mode and flash the BL package [here](https://github.com/lifehackerhansol/gto-fw/releases).
{%- endcapture %}
    {% include alerts/warning.html content=warning_restore_stock %}
1. The device will demand you format userdata, please follow the onscreen instructions to do so.
{%- unless device.no_oem_unlock_switch %}
1. Run through Android Setup skipping everything you can, then connect the device to a Wi-Fi network.
1. Re-enable Development settings by clicking the "Build Number" option 10 times, in the "Settings" app within the "About" menu, and verify that "OEM Unlock" is still enabled in the "Developer options" menu.
{%- endunless %}
