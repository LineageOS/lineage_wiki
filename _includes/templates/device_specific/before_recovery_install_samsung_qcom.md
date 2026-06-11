## Pre-Install Instructions

{% include alerts/warning.html content="The following instructions will unlock the bootloader and wipe all userdata on the device." %}

{% unless device.no_oem_unlock_switch %}
1. Connect the device to a Wi-Fi network.
2. Enable Developer Options by pressing the "Build Number" option at least 7 times, in the "Settings" app within the "About" menu
    * From within the Developer options menu, enable OEM unlock.
{% endunless %}
3. Download `vbmeta.img` from [here](https://download.lineageos.org/devices/{{ device.codename }}).
4. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the onscreen instructions correlate to "Device unlock mode" and/or "Unlock Bootloader".
    * Device will restart, repeat steps 1 and 2 to enable the Developer Options menu again.
    * Verify that "OEM Unlock" is still enabled
5. Power off the device, and again boot it into download mode:
    * {{ device.download_boot }}
6. Download and extract the appropriate version of the samloader-rs for your machine's OS from [here](https://github.com/topjohnwu/samloader-rs/releases/latest).
7. On your machine, open a Command Prompt or PowerShell (Windows) window, or Terminal (Linux or macOS) window, and type:
```
samloader flash --partition VBMETA vbmeta.img
```
8. Your device will reboot, you may now unplug the USB cable from your device.
9. The device will demand you factory reset, please follow the onscreen instructions to do so.
{%- unless device.no_oem_unlock_switch %}
10. Run through Android Setup skipping everything you can, then connect the device to a Wi-Fi network.
11. Re-enable Development settings by clicking the "Build Number" option 10 times, in the "Settings" app within the "About" menu, and verify that "OEM Unlock" is still enabled in the "Developer options" menu.
{%- endunless %}
