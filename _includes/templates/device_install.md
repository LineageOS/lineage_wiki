{% assign device = site.data.devices[page.device] %}

{% if device.before_install %}
{% capture path %}templates/device_specific/{{ device.before_install }}.md{% endcapture %}
{% include {{ path }} %}
{% endif %}

## Basic requirements

{% include important.html content="Please read through the instructions at least once completely before actually following them to avoid any problems because you missed something!" %}

1. Make sure your computer has working `adb`{% unless device.install_method == 'heimdall' or device.install_method == 'dd' %} and `fastboot`{% endunless %}. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.

{% if device.required_bootloader %}
## Special requirements

{% capture bootloader %}
Your device must be on bootloader version {% for el in device.required_bootloader %} {% if forloop.last %} `{{ el }}` {% else %} `{{ el }}` / {% endif %} {% endfor %}, otherwise the instructions found in this page will not work.
The current bootloader version can be checked by running the command `getprop ro.bootloader` in a terminal app or an `adb shell` from a command prompt (on Windows) or terminal (on Linux or macOS) window.
{% endcapture %}
{% include warning.html content=bootloader %}
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
    * Optionally, download 3rd party application packages such as [Google Apps]({{ "gapps.html" | relative_url }}) (use the `{{ userspace_architecture }}` architecture)
2. If you aren't already in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
3. _(Optional, but recommended)_: Tap the **Backup** button to create a backup. Make sure {% if device.sdcard != blank %}the backup is created in the external sdcard or copy it{% else %}the backup is copied{% endif %} onto your computer as the internal storage will be formatted.
4. Go back to return to main menu, then tap **Wipe**.
5. Now tap **Format Data** and continue with the formatting process. This will remove encryption as well as delete all files stored on the internal storage.
6. Return to the previous menu and tap **Advanced Wipe**.
{% if device.is_ab_device %}
7. Select the *System* partition to be wiped and then **Swipe to Wipe**.
{% else %}
7. Select the *Cache* and *System* partitions to be wiped and then **Swipe to Wipe**.
{% endif %}
8. Place the LineageOS `.zip` package, as well as any other .zip packages on the root of `/sdcard`:
    * Using adb: `adb push filename.zip /sdcard/`
    * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing
        USB debugging is enabled.
9. Go back to return to main menu, then tap **Install**.
10. Navigate to `/sdcard`, and select the LineageOS `.zip` package.
11. Follow the on-screen prompts to install the package.
{% if device.is_ab_device %}
12. _(Optional)_: Reboot to recovery and install any additional packages using the same method. The reboot is necessary on devices with A/B (seamless) system updates.
{% else %}
13. _(Optional)_: Install any additional packages using the same method.
{% endif %}
    {% include note.html content="If you want any Google Apps on your device, you must follow this step **before** the first boot into Android!" %}
14. _(Optional)_: Root the device by installing the [LineageOS su add-on](https://download.lineageos.org/extras) (use the `{{ userspace_architecture }}` package) or using any other method you prefer.
15. Once installation has finished, return to the main menu, tap **Reboot**, and then **System**.

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
