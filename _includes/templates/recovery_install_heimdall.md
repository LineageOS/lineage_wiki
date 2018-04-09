{% if site.data.devices[page.device].custom_twrp_codename %}
{% assign twrp_codename = site.data.devices[page.device].custom_twrp_codename %}
{% else %}
{% assign twrp_codename = site.data.devices[page.device].codename %}
{% endif %}

## Preparing for installation

Samsung devices come with a unique boot mode called "Download mode", which is very similar to "Fastboot mode" on some devices with unlocked bootloaders.
[Heimdall](http://www.glassechidna.com.au/products/heimdall/) is a cross-platform, open-source tool for interfacing with Download mode on Samsung devices.
The preferred method of installing a custom recovery is through this boot mode{% unless custom_root_instructions %} -- rooting the stock firmware is neither necessary nor required{% endunless %}.

{% unless site.data.devices[page.device].no_oem_unlock_switch %}
1. Enable OEM unlock in the Developer options under device Settings.
{% endunless %}
2. Download and install the [Heimdall suite](http://glassechidna.com.au/heimdall/#downloads):
    * **Windows**: Extract the Heimdall suite and take note of the directory containing `heimdall.exe`. You can verify Heimdall is working by opening a command
    prompt in that directory and typing `heimdall version`. If you receive an error, make sure you have the 
    [Microsoft Visual C++ 2012 Redistributable Package (x86)](https://www.microsoft.com/en-us/download/details.aspx?id=30679) installed on your computer.
    * **Linux**: Pick the appropriate package to install for your distribution. The `-frontend` packages aren't needed for this guide. After installation,
    verify Heimdall is installed by running `heimdall version` in the terminal.
    * **macOS**: Install the `dmg` package. After installation, Heimdall should be available from the terminal - type `heimdall version` to double-check.
3. Power off the device and connect the USB adapter to the computer (but not to the device, yet).
4. Boot into download mode:

    * {{ site.data.devices[page.device].download_boot }}

    Accept the disclaimer, then insert the USB cable into the device.
5. **Windows only**: install the drivers. A more complete set of instructions can be found in the [ZAdiag user guide](https://github.com/pbatard/libwdi/wiki/Zadig).
    1. Run `zadiag.exe` from the **Drivers** folder of the Heimdall suite.
    2. Choose **Options** &raquo; **List all devices** from the menu.
    3. Select **Samsung USB Composite Device** or **MSM8x60** or **Gadget Serial** or **Device Name** from the drop down menu. (If nothing relevant appears, try uninstalling any Samsung related Windows software, like Samsung Windows drivers and/or Kies).
    4. Click **Replace Driver** (having to select **Install Driver** from the drop down list built into the button).
    5. If you are prompted with a warning that the installer is unable to verify the publisher of the driver, select **Install this driver anyway**. You may receive two more prompts about security. Select the options that allow you to carry on.
6. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
heimdall print-pit
```
7. If the device reboots, Heimdall is installed and working properly.

{% if custom_downgrade_instructions %}
{{ custom_downgrade_instructions }}
{% endif %}

{% if custom_root_instructions %}
{{ custom_root_instructions }}
{% endif %}

## Installing a custom recovery using `heimdall`

{% if site.data.devices[page.device].custom_twrp_link %}
1. Download a custom recovery - you can download [TWRP]({{ site.data.devices[page.device].custom_twrp_link }}).
{% else %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ twrp_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ twrp_codename }}.img`.
{% endif %}
2. Power off the your device and connect the USB adapter to the computer (but not to the device, yet).
3. Boot into download mode:

    * {{ site.data.devices[page.device].download_boot }}

    Accept the disclaimer, then insert the USB cable into the device.
4. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window in the directory the recovery image is located, and type:
```
heimdall flash --RECOVERY twrp-x.x.x-x-{{ twrp_codename }}.img --no-reboot
```
    {% include tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly. If the file is wrapped in a zip or tar file, extract the file first, because Heimdall is not going to do it for you." %}
5. A blue transfer bar will appear on the device showing the recovery being transferred.
6. Unplug the USB cable from your device.
7. Manually reboot into recovery:
    * {{ site.data.devices[page.device].recovery_boot }}

    {% include note.html content="Be sure to reboot into recovery immediately after having installed the custom recovery. Otherwise the custom recovery will be overwritten and the device will reboot (appearing as though your custom recovery failed to install)." %}
