{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

## Preparing for installation

Samsung devices come with a unique boot mode called "Download mode", which is very similar to "Fastboot mode" on some devices with unlocked bootloaders.
Heimdall is a cross-platform, open-source tool for interfacing with Download mode on Samsung devices.
The preferred method of installing a custom recovery is through Download Mode{% unless custom_root_instructions %} -- rooting the stock firmware is neither necessary nor required{% endunless %}.

{% unless device.no_oem_unlock_switch %}
1. Enable OEM unlock in the Developer options under device Settings.
{% endunless %}
2. Download and install the appropriate version of the [Heimdall suite](https://www.androidfilehost.com/?w=files&flid=304516) for your machine's OS
    * **Windows**: Extract the Heimdall suite zip and take note of the new directory containing `heimdall.exe`. You can verify Heimdall is functioning by opening a Command Prompt or PowerShell in that directory and running `heimdall version`.
     * If you receive an error, install the [Microsoft Visual C++ 2015-2019 Redistributable Package (x86)](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads) on your computer.
    * **Linux**: Extract the Heimdall suite zip and take note of the new directory containing `heimdall`. Now copy `heimdall` into a directory n $PATH, a common one on most distros wiil be /usr/local/bin. For example `cp heimdall /usr/local/bin`. You can verify Heimdall is functioning by opening a Terminal and running `heimdall version`.
    * **macOS**: Mount the Heimdall suite DMG. Now dran `heimdall` down into the `/usr/local/bin` symlink provided in the DMG. You can verify Heimdall is functioning by opening a Terminaland running `heimdall version`.
    {% include alerts/note.html content="These Heimdall suite distributions were built by LineageOS Developers Nolen Johnson (npjohnson) and Jan Altensen (Stricted), as the Heimdall suite executables distributed on the official Heimdall website were outdated and the repo mostly abaonded. Modifications were made to make it build and function on modern OSes." %}
4. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the onscren instructions coorelate to "Continue", and insert the USB cable into the device.
5. **For Windows user only**: install the necessary drivers. A more complete set of instructions can be found in the [ZAdiag user guide](https://github.com/pbatard/libwdi/wiki/Zadig).
    1. If nothing relevant appears, try uninstalling any Samsung related Windows software, like Samsung Windows drivers and/or Samsung Kies.
    1. Download the newest zadig.exe from [here](https://github.com/pbatard/libwdi/releases).
    2. Run `zadiag.exe`.
    2. Choose **Options** &raquo; **List all devices** from the menu.
    3. Select **Samsung USB Composite Device** or **MSM8x60** or **Gadget Serial** or **Device Name** from the drop down menu.
    4. Click **Replace Driver**, then selecting **Install Driver** from the drop down list built into the button.
    5. If you are prompted with a warning that the installer is unable to verify the publisher of the driver, select **Install this driver anyway**. You may receive two more prompts about security. Select the options that accept the warnings and allow you to carry on.
6. On your machine, open a Command Prompt or PowerShell (Windows) window, or Terminal (Linux or macOS) window, and type:
```
heimdall print-pit
```
7. If the device reboots that indicates that Heimdall is installed and working properly. If it does not, please refollow these instructions to verify steps weren't missed, try a different USB cable, and a different USB port.

{% if custom_downgrade_instructions %}
{{ custom_downgrade_instructions }}
{% endif %}

{% if custom_root_instructions %}
{{ custom_root_instructions }}
{% endif %}

## Installing a custom recovery using `heimdall`

{% if device.custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}).
{% else %}
{% if device.uses_lineage_recovery %}
1. Download a custom recovery - you can download [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
{% else %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{% include alerts/tip.html content="Ensure you download the `.img` file and not the `.tar` or `.tar.md5` versions." %}
{% endif %}
{% endif %}
2. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the onscren instructions coorelate to "Continue", and insert the USB cable into the device.
6. On your machine, open a Command Prompt or PowerShell (Windows) window, or Terminal (Linux or macOS) window, and type:
```
heimdall flash --RECOVERY <recovery_filename>.img --no-reboot
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly. If the file is wrapped in a zip or tar file, extract the file first, because Heimdall is not going to do it for you." %}
5. A blue transfer bar will appear on the device showing the recovery image being flashed.
6. Unplug the USB cable from your device.
7. Manually reboot into recovery, this may require pulling your battery, or holding the below keycombo until the device reboots:
    * {{ device.recovery_boot }}

    {% include alerts/note.html content="Be sure to reboot into recovery immediately after installing the custom recovery. If you don't the custom recovery will be overwritten on boot." %}
