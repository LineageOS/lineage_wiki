## Updating your device

{% include alerts/note.html content="LineageOS strongly reccomends using our builtin Updater app. Alternative methods are supported, however."%}

{% include alerts/note.html content="Note: git is required to follow these instructions."%}


# Using the LineageOS Updater app

1. Make sure your computer has working `adb`{% unless device.install_method == 'heimdall' or device.install_method == 'dd' %} and `fastboot`{% endunless %}. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
{% if device.is_ab_device %}
# From your PC via the push_update script
3. Run: `push-update.sh /path/to/zip`
4. Open the Update app from Settings, System, Updater. Then proceed to click "Install" on the newly pushed update to commence installation. From here proceed as normal.
{%- else -%}
# Sideloading from Recovery
3. Run: `adb reboot sideload'
4. Run: `adb sideload /path/to/zip'
{%- endif -%}


