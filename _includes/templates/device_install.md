{% assign device = site.data.devices[page.device] %}

{% if device.before_install %}
{% capture path %}templates/device_specific/{{ device.before_install }}.md{% endcapture %}
{% include {{ path }} %}
{% endif %}

## Basic requirements

{% include alerts/important.html content="Please read through the instructions at least once completely before actually following them to avoid any problems because you missed something!" %}

1. Make sure your computer has working `adb`{% unless device.install_method == 'heimdall' or device.install_method == 'dd' %} and `fastboot`{% endunless %}. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.

{% if device.required_bootloader %}
## Special requirements

{% capture bootloader %}
Your device must be on bootloader version {% for el in device.required_bootloader %} {% if forloop.last %} `{{ el }}` {% else %} `{{ el }}` / {% endif %} {% endfor %}, otherwise the instructions found in this page will not work.
The current bootloader version can be checked by running the command `getprop ro.bootloader` in a terminal app or an `adb shell` from a command prompt (on Windows) or terminal (on Linux or macOS) window.
{% endcapture %}
{% include alerts/warning.html content=bootloader %}
{% endif %}

{% if device.install_method %}
{% capture recovery_install_method %}templates/recovery_install_{{ device.install_method }}.md{% endcapture %}
{% include {{ recovery_install_method }} %}
{% else %}
## Unlocking the bootloader / Installing a custom recovery

There are no recovery install instructions for this discontinued device.
{% endif %}

## Installing LineageOS from recovery

{%- capture userspace_architecture -%}
{%- if device.architecture.userspace -%}
{{ device.architecture.userspace }}
{%- else -%}
{{ device.architecture }}
{%- endif -%}
{%- endcapture -%}

{% if device.maintainers != empty %}
1. Download the [LineageOS install package](https://download.lineageos.org/{{ device.codename }}) that you'd like to install or [build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) the package yourself.
{% else %}
1. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS install package.
{% endif %}
    * Optionally, download additional application packages such as [Google Apps]({{ "gapps.html" | relative_url }}) (use the `{{ userspace_architecture }}` architecture).
2. If you aren't already in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
3. _(Optional, but recommended)_: Tap the **Backup** button to create a backup. Make sure {% if device.sdcard != blank %}the backup is created in the external sdcard or copy it{% else %}the backup is copied{% endif %} onto your computer as the internal storage will be formatted later in this process.
4. Go back to return to main menu, then tap **Wipe**.
5. Now tap **Format Data** and continue with the formatting process. This will remove encryption as well as delete all files stored on the internal storage.
6. Return to the previous menu and tap **Advanced Wipe**.
{% if device.is_ab_device %}
7. Select the *System* partition to be wiped and then **Swipe to Wipe**.
{% else %}
7. Select the *Cache* and *System* partitions to be wiped and then **Swipe to Wipe**.
{% endif %}
8. Sideload the LineageOS `.zip` package:
    * On the device, select "Advanced", "ADB Sideload", then swipe to begin sideload.
    * On the host machine, sideload the package using: `adb sideload filename.zip`
{% if device.is_ab_device %}
9. _(Optional)_: Reboot to recovery and install any additional packages by choosing "Apply Update", then "Apply from ADB", and then sideloading the packages like you did above. The reboot is necessary on devices with A/B (seamless) system updates.
{% else %}
9. _(Optional)_: Install any additional packages using the same method.
{% endif %}
    {% include alerts/note.html content="If you want Google Apps on your device, you must follow this step **before** the first boot into Android!" %}
10. _(Optional)_: Root the device by installing the [LineageOS SU Addon](https://download.lineageos.org/extras) (use the `{{ userspace_architecture }}` package) or using any other method you prefer.
{% if device.is_ab_device %}
11. Once installation has finished, return to the main menu, tap **Reboot**.
{% else %}
11. Once installation has finished, return to the main menu, tap **Reboot**, and then **System**.
{% endif %}

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
