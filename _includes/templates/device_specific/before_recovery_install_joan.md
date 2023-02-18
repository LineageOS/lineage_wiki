## Enable OEM unlock

1. Open the `Settings` app
1. Under the `General` section, open the `About` menu
1. Enable Developer Options by pressing the "Build Number" option
 * From within the Developer options menu, enable OEM unlock.

## Downgrading to Oreo firmware using LG UP

{% include alerts/warning.html content="The following instructions will unlock the bootloader and wipe all userdata on the device." %}

{% include alerts/warning.html content="This guide ONLY SUPPORTS the H930, H930DS and US998 models! Following this guide on any other device can BRICK YOUR DEVICE!" %}

{% include alerts/note.html content="The following instructions **require** a machine running Windows 10 build 17063 or newer." %}

1. Download the corresponding KDZ file for your device:
    * H930, European H930DS: https://androidfilehost.com/?fid=7161016148664845011
    * India H930DS: https://www.androidfilehost.com/?fid=5862345805528044789
    * US998: https://androidfilehost.com/?fid=7161016148664845121
1. Download the [LG Mobile Drivers](https://androidfilehost.com/?fid=1899786940962596466)
1. Download [LG UP](https://sourceforge.net/projects/jacoas-v30-files/files/KDZs/LGUP/LGUP_DualMode.zip)
1. Install LG Mobile Drivers from the downloaded `.exe` file
1. Extract the LG UP `.zip` file
1. Open the newly extracted folder and install LG UP using the `.msi` file
    * Select appropriate options to install
1. Right-click on the `SetDev.bat` file, and select `Run as Administrator`
1. Connect your device to your PC via USB
1. On your device, hold the Power button and the Volume Down button at the same time
1. Immediately after your display turns black, let go of both buttons and hold the Volume Up button
1. After a moment, a `Firmware Update` screen should show on your device
    * If it boots into the operating system, re-try booting into Download mode
1. On your computer, open the installed `LGUP.exe` from your Start menu
1. Select the `PARTITION DL` option
    {%- include alerts/warning.html content="DO NOT EVER touch the ChipErase option! Doing so will BRICK YOUR DEVICE!" %}
1. Under `File Path`, select the 3-dot menu
1. In the dialog that opens up, select your downloaded `.kdz` file
1. Open a Command Prompt, and navigate to the path where you extracted the downloaded `.zip` file
1. Press Start
1. In the `Partition List` dialog, select all partitions
1. If prompted select YES to continue
1. After the process is complete, your device will reboot into the Oreo operating system
1. Set up your device *without* setting up Wi-Fi if possible, then redo the "Enable OEM Unlock" steps again

## Unlocking your bootloader
1. On your device, hold the Power button and the Volume Down button at the same time
1. Immediately after your display turns black, let go of the power button, but keep the Volume Down button held
1. After a moment, fastboot mode should appear on your display
    * If it boots to the operating system, try rebooting to fastboot mode again
1. From the same Command Prompt window, enter the following command:
```
fastboot flash unlock new_unlock.bin
```
1. If this command succeeded, your bootloader is now unlocked.
1. On your device, navigate to the "Reboot" option using your volume buttons, then press the Power button to reboot your device
