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
6. Re-enable Developer Options by clicking the "Build Number" option 7 times, in the "Settings" app within the "About" menu, and verify that "OEM Unlock" is enabled and greyed out in the "Developer options" menu.
7. Download [this](https://drive.google.com/file/d/10BgHR3DERyggWkLsno8xHhinZHLItZ_x/view) VBMeta image `.tar` file.
8. Download and install the necessary drivers:
    * Download the newest Samsung drivers from [here](https://developer.samsung.com/mobile/android-usb-driver.html).
    * Install `SAMSUNG_USB_Driver_for_Mobile_Phones.exe`.
9. Download [this](https://androidfilehost.com/?fid=4349826312261712202) version of Odin.
10. Extract "Odin_3.13.1.zip".
11. Run `Odin3 v3.13.1` found in the newly  extracted "Odin_3.13.1" folder.
12. Check the box labeled next to the button labeled "AP", and then click the "AP" button.
    * In the menu that pops up, select the newly downloaded custom VBMeta `.tar` file.
13. Check in the top left of the Odin window that you see a valid device, it will show up as something like `COM0`.
    {% include alerts/tip.html content="The `COM` port, or the number succeeding `COM`, may be any valid number." %}
14. Click "Start". A blue transfer bar will appear on the device showing the VBMeta image being flashed.
15. Your device will reboot, you may now unplug the USB cable from your device.
16. The device may demand you format userdata, please follow the onscreen instructions to do so.
