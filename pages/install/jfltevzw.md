---
sidebar: home_sidebar
title: Install LineageOS on jfltevzw
folder: info
# name of the page (/{{permalink}}.html)
redirect_from: jfltevzw_install.html
permalink: /devices/jfltevzw/install
device: jfltevzw
---

{% capture custom_downgrade_instructions %}
## Install alternate kernel

In order to root your device you must first install this kernel via Heimdall.

1. Download the [kernel](https://www.androidfilehost.com/?fid=745425885120732538)
    {% include tip.html content="If the file is wrapped in a zip or tar file, extract the file first, because Heimdall isn't going to do it for you." %}
2. Power off the your device and connect the USB adapter to the computer (but not to the device, yet).
3. Boot into download mode:

    * {{ site.data.devices[page.device].download_boot }}

    Accept the disclaimer, then insert the USB cable into the device.
4. **Windows only**: install the drivers. A more complete set of instructions can be found in the [ZAdiag user guide](https://github.com/pbatard/libwdi/wiki/Zadig).
    1. Run `zadiag.exe` from the **Drivers** folder of the Heimdall suite.
    2. Choose **Options** &raquo; **List all devices** from the menu.
    3. Select **Samsung USB Composite Device** or **MSM8x60** or **Gadget Serial** or **Device Name** from the drop down menu. (If nothing relevant appears, try uninstalling any Samsung related Windows software, like Samsung Windows drivers and/or Kies).
    4. Click **Replace Driver** (having to select **Install Driver** from the drop down list built into the button).
    5. If you are prompted with a warning that the installer is unable to verify the publisher of the driver, select **Install this driver anyway**. You may receive two more prompts about security. Select the options that allow you to carry on.
5. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window in the directory the recovery image is located, and type:

        heimdall flash --BOOT boot.img

    {% include tip.html content="The file may not be named identically to what's in this command. If the file is wrapped in a zip or tar file, extract the file first, because Heimdall isn't going to do it for you." %}
6. A blue transfer bar will appear on the device showing the kernel being transferred, then your device will reboot.
7. Allow it to boot and proceed with the rooting steps.
{% endcapture %}

{% capture custom_root_instructions %}
## Root your device

1. Download [motochopper](https://www.androidfilehost.com/?fid=24052804347757453) (credit to djrbliss).
   * md5: a2a361dc1a1122b9034d4be4ba355a46
2. Extract all files in the zip.
   * **Windows**: install the latest Samsung USB drivers.
3. Enable USB debugging on the device and connect device to PC.
   * **Windows**: run the run.bat file.
   * **Linux/macOS**: run the run.sh file.
4. You now have root, proceed to next section.
{% endcapture %}

{% include templates/device_install.md %}
