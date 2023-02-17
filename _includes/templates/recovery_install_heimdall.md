{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

{% include snippets/before_recovery_install.md %}

## Preparing for installation

Samsung devices come with a unique boot mode called "Download mode", which is very similar to "Fastboot mode" on some devices with unlocked bootloaders.
Heimdall is a cross-platform, open-source tool for interfacing with Download mode on Samsung devices.
The preferred method of installing a custom recovery is through Download Mode{% unless custom_root_instructions %} -- rooting the stock firmware is neither necessary nor required{% endunless %}.

{% unless device.no_oem_unlock_switch %}
1. Enable Developer Options by pressing the "Build Number" option in the "Settings" app within the "About" menu
 * From within the Developer options menu, enable OEM unlock.
{% endunless %}
2. Download and install the appropriate version of the [Heimdall suite](https://www.androidfilehost.com/?w=files&flid=304516) for your machine's OS
    * **Windows**: Extract the Heimdall suite zip and take note of the new directory containing `heimdall.exe`. You can verify Heimdall is functioning by opening a Command Prompt or PowerShell in that directory and running `heimdall version`.
      * If you receive an error, install the [Microsoft Visual C++ 2015-2019 Redistributable Package (x86)](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads) on your computer.
    * **Linux**: Extract the Heimdall suite zip and take note of the new directory containing `heimdall`. Now copy `heimdall` into a directory in $PATH, a common one on most distros will be /usr/local/bin. For example `cp heimdall /usr/local/bin`. You can verify Heimdall is functioning by opening a Terminal and running `heimdall version`.
    * **macOS**: Mount the Heimdall suite DMG. Now drag `heimdall` down into the `/usr/local/bin` symlink provided in the DMG. You can verify Heimdall is functioning by opening a Terminal and running `heimdall version`.
    {% include alerts/note.html content="These Heimdall suite distributions were built by LineageOS Developers Nolen Johnson (npjohnson) and Jan Altensen (Stricted), as the Heimdall suite executables distributed on the official Heimdall website were outdated and the repo mostly abandoned. Modifications were made to make it build and function on modern OSes." %}
4. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the on screen instructions correlate to "Continue", and insert the USB cable into the device.
5. **For Windows users only**: install the necessary drivers. A more complete set of instructions can be found in the [Zadig user guide](https://github.com/pbatard/libwdi/wiki/Zadig).
    1. If nothing relevant appears, try uninstalling any Samsung related Windows software, like Samsung Windows drivers and/or Samsung Kies.
    2. Run `zadig.exe` found in your extracted Heimdall directory.
        {% include alerts/note.html content="For the interested, source and documentation for zadig.exe can be found [here](https://github.com/pbatard/libwdi/releases)." %}
    3. Choose **Options** &raquo; **List all devices** from the menu.
    4. Select **Samsung USB Composite Device** or **MSM8x60** or **Gadget Serial** or **Device Name** from the drop down menu.
    5. Click **Replace Driver**, then selecting **Install Driver** from the drop down list built into the button.
    6. If you are prompted with a warning that the installer is unable to verify the publisher of the driver, select **Install this driver anyway**. You may receive two more prompts about security. Select the options that accept the warnings and allow you to carry on.
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

{%- if device.custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}).
{%- elsif device.uses_twrp %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
    {% include alerts/tip.html content="Ensure you download the `.img` file and not the `.tar` or `.tar.md5` versions." %}
{%- elsif device.maintainers != empty %}
{%- assign is_lineage_recovery = True %}
1. Download [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch | precision: 1 }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
{%- else %}
{%- assign is_lineage_recovery = True %}
1. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS installation package. The recovery will be built as part of it!
{%- endif %}
    {% include alerts/important.html content="Other recoveries may not work for installation or updates. We strongly recommend to use the one linked above!" %}
2. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the on screen instructions correlate to "Continue", and insert the USB cable into the device.
3. On your machine, open a Command Prompt or PowerShell (Windows) window, or Terminal (Linux or macOS) window, and type:
```
heimdall flash --RECOVERY <recovery_filename>.img --no-reboot
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly. If the file is wrapped in a zip or tar file, extract the file first, because Heimdall is not going to do it for you." %}
4. A blue transfer bar will appear on the device showing the recovery image being flashed.
    {% include alerts/note.html content="The device will continue to display `Downloading... Do not turn off target!!` even after the process is complete. When the status message in the top left of the device's display reports that the process is complete, you may proceed." %}
5. Unplug the USB cable from your device.
6. Manually reboot into recovery, this may require pulling the device's battery out and putting it back in, or if you have a non-removable battery, press the Volume Down + Power buttons for 8~10 seconds until the screen turns black & release the buttons *immediately* when it does, then boot to recovery:
    * {{ device.recovery_boot }}
    {% include alerts/note.html content="Be sure to reboot into recovery immediately after installing the custom recovery. If you don't the stock ROM will overwrite the custom recovery with the stock recovery, and you'll need to flash it again." %}
{%- if is_lineage_recovery == True %}
{%- capture content %}
If your recovery does **not** show the LineageOS logo <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 24" style="height: 1rem; vertical-align: middle;">
          <path d="M40,12a4,4,0,0,0-3,1.33l-.23-.09A29.62,29.62,0,0,0,32,11.81h0a8,8,0,0,0-16,0l-.22,0a29.53,29.53,0,0,0-4.6,1.39l-.23.09a4,4,0,1,0,.93,1.78h0a27.62,27.62,0,0,1,4.29-1.29,8,8,0,0,0,15.57,0,27.55,27.55,0,0,1,4.29,1.28h0A4,4,0,1,0,40,12ZM8,18a2,2,0,1,1,2-2A2,2,0,0,1,8,18Zm16,0a6,6,0,1,1,6-6A6,6,0,0,1,24,18Zm16,0a2,2,0,1,1,2-2A2,2,0,0,1,40,18ZM27,12a3,3,0,1,1-3-3A3,3,0,0,1,27,12Z"></path>
        </svg>
   , you accidentially booted into the wrong recovery. Please start at the top of this section!
{%- endcapture %}
    {% include alerts/note.html content=content %}
{%- endif %}
