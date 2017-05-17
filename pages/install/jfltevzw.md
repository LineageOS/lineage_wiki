---
sidebar: home_sidebar
title: Install LineageOS on jfltevzw
folder: info
# name of the page (/{{permalink}}.html)
redirect_from: jfltevzw_install.html
permalink: /devices/jfltevzw/install
device: jfltevzw
---
## Important note

{% include warning.html content="Your device must be on bootloader version `I545VRUAMDK` or this will not work. In fact, if you try to use this method on a newer version, you will almost certainly brick your device. Seriously don't try it. Downgrading won't work either. If you've updated, rollback has been incremented higher than `VRUFMDK`, and due to the higher increment, downgrade attempts will result in a brick. You can check what bootloader your device is on by running the command `getprop ro.bootloader` in `adb shell` or a terminal app." %}

## Preparing for installation

Samsung devices come with a unique boot mode called "Download mode", which is very similar to "Fastboot mode" on some devices with unlocked bootloaders.
[Heimdall](http://www.glassechidna.com.au/products/heimdall/) is a cross-platform, open-source tool for interfacing with Download mode on Samsung devices.
The preferred method of installing a custom recovery is through this boot mode -- rooting the stock firmware is neither necessary nor required.

1. Make sure your computer has working [fastboot and adb]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Download and install the [Heimdall suite](http://glassechidna.com.au/heimdall/#downloads)
    * **Windows**: Extract the Heimdall suite and take note of the directory holding `heimdall.exe`. You can verify Heimdall is working by opening a command
    prompt in that directory and typing `heimdall version`. If you receive an error, make sure you have the 
    [Microsoft Visual C++ 2012 Redistributable Package (x86)](https://www.microsoft.com/en-us/download/details.aspx?id=30679) installed on your computer.
    * **Linux**: Pick the appropriate package to install for your distribution. The `-frontend` packages aren't needed for this guide. After installation,
    verify Heimdall is installed by running `heimdall version` in the terminal.
    * **macOS**: Install the dmg package. After installation, Heimdall should be available from the terminal - type `heimdall version` to double-check.

## Install alternate kernel

In order to root your device you must first install this kernel via Heimdall.

1. Download the [kernel](https://www.androidfilehost.com/?fid=22979706399755780)
    {% include tip.html content="If the file is wrapped in a zip or tar file, extract the file first, because heimdall isn't going to do it for you." %}
2. Power off the {{ site.data.devices[page.device].name }} and connect the USB adapter to the computer (but not to the {{ site.data.devices[page.device].name }}, yet).
3. Boot the {{ site.data.devices[page.device].name }} into download mode: {{ site.data.devices[page.device].download_boot }}. Accept the disclaimer, then insert the USB cable into the device.
4. **Windows Only**: install the drivers. A more complete set of instructions can be found in the [ZAdiag user guide](https://github.com/pbatard/libwdi/wiki/Zadig)
    1. Run `zadiag.exe` from the **Drivers** folder of the Heimdall suite.
    2. Choose **Options** &raquo; **List all devices** from the menu.
    3. Select **Samsung USB Composite Device** or **MSM8x60** or **Gadget Serial** or **Device Name** from the drop down menu. (If nothing relevant appears, try uninstalling any Samsung related Windows software, like Samsung Windows drivers and/or Kies).
    4. Click **Replace Driver** (having to select "Install Driver" from the drop down list built into the button)
    5. If you are prompted with a warning that the installer is unable to verify the publisher of the driver, select **Install this driver anyway**. You may receive two more prompts about security. Select the options that allow you to carry on.
5. On the computer, open a terminal (or Command Prompt on Windows) in the directory the kernel image is located, and type `heimdall flash --BOOT boot.img`.
    {% include tip.html content="The file may not be named identically to what's in this command. If the file is wrapped in a zip or tar file, extract the file first, because heimdall isn't going to do it for you." %}
6. A blue transfer bar will appear on the device showing the kernel being transferred, then your device will reboot.
7. Allow it to boot and proceed with the rooting steps.

## Root your {{ site.data.devices[page.device].name }}

1. Download [motochopper](https://www.androidfilehost.com/?fid=24052804347757453) (credit to djrbliss).
   * md5: a2a361dc1a1122b9034d4be4ba355a46
2. Extract all files in the zip.
   * **Windows**: install the latest Samsung USB drivers.
3. Enable USB debugging on the device and connect device to PC.
   * **Windows**: run the run.bat file.
   * **Linux/macOS**: run the run.sh file.
4. You now have root, proceed to next section.

{% include templates/device_install.md %}
