## Updating your device

{% include alerts/note.html content="LineageOS strongly reccomends using our builtin Updater app. Alternative methods are supported, however."%}

{% if device.is_ab_device %}
{% include alerts/note.html content="addon.d-v2/backuptool_ab, the systems responsible for backing up addons such as GApps/SU does NOT run in recovery on A/B partition scheme (seamless update) devices. Addons are only backed up if you update via the built-in LineageOS Updater app or the push-update script detailed below.
{% endif %}


# Using the LineageOS Updater app

1. Open Settings, navigate to "System", then "Updater".
2. Click the Refresh Icon in the top right corner.
3. Choose which update you'd like and press "Download".
{% if device.is_ab_device %}
4. When the download completes, click "Install". Your device will begin to "Prepare for first boot", work through "Finalizing installation",then display a "Reboot" button, which will reboot you into the updated slot's installation.
{%- else -%}
4. When the download completes, click "Install". Your device will reboot to recovery and install the update, then reboot to the updated installation.
{%- endif -%}

{% if device.is_ab_device %}
# From your PC via the push_update script
{% include alerts/note.html content="Note: git is required to follow these instructions."%}
{%- else -%}
# Sideloading from Recovery
{%- endif -%}

1. Make sure your computer has working `adb`. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
3. Run `adb root`
{% if device.is_ab_device %}
4. Run `git clone https://github.com/LineageOS/android_packages_apps_Updater.git && cd android_packages_apps_Updater`
5. Run: `./push-update.sh /path/to/zip`
6. 1. Open Settings, navigate to "System", then "Updater". Then proceed to click "Install" on the newly pushed update to commence installation. Your device will begin to "Prepare for first boot", work through "Finalizing installation",then display a "Reboot" button, which will reboot you into the updated slot's installation.
{%- else -%}
4. Run: `adb reboot sideload'
5. Run: `adb sideload /path/to/zip'
6. Run: `adb reboot`
{%- endif -%}


