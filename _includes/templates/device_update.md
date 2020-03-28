{% assign device = site.data.devices[page.device] %}

## Updating your device

{% include alerts/note.html content="LineageOS strongly recommends using our builtin Updater app. Alternative methods are supported, however."%}

{% if device.is_ab_device %}
{% include alerts/note.html content="addon.d-v2/backuptool_ab, the systems responsible for backing up addons such as GApps/SU do NOT run in recovery on A/B partition scheme (seamless update) devices. Addons are only backed up if you update via the built-in LineageOS Updater app or the push-update script detailed below." %}
{% endif %}

## Using the LineageOS Updater app

1. Open Settings, navigate to "System", then "Updater".
2. Click the Refresh Icon in the top right corner.
3. Choose which update you'd like and press "Download".
{%- if device.is_ab_device %}
4. When the download completes, click "Install". Once the update process has finished, the device will display a "Reboot" button, which will reboot you into the updated system.
{%- else %}
4. When the download completes, click "Install". Your device will reboot to recovery and install the update, then reboot to the updated installation.
{%- endif %}

## From your PC via the push_update script (Linux/macOS only)
1. Make sure your computer has working `adb`. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
3. Open Settings, navigate to "System", then "Developer Options", then click the "Root access" panel, and select "ADB only", read the warning, and click "OK" when prompted.
4. Run `adb root`
5. Run `wget https://raw.githubusercontent.com/LineageOS/android_packages_apps_Updater/lineage-16.0/push-update.sh && chmod +x push-update.sh`
6. Run: `./push-update.sh /path/to/zip`
{%- if device.is_ab_device %}
7. Open Settings, navigate to "System", then "Updater". Then proceed to click "Install" on the newly pushed update to commence installation. Once the update process has finished, the device will display a "Reboot" button, which will reboot you into the updated system.
{%- else %}
7. Open Settings, navigate to "System", then "Updater". Then proceed to click "Install" on the newly pushed update to commence installation. Your device will reboot to recovery and install the update, then reboot to the updated installation.
{% endif %}

{% unless device.is_ab_device%}
## Sideloading from Recovery

1. Make sure your computer has working `adb`. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
5. Run: `adb reboot sideload`
6. Run: `adb sideload /path/to/zip`
7. Run: `adb reboot`
{% endunless %}