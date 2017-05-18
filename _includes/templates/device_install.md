{% assign device = site.data.devices[page.device] %}
## Basic requirements

{% include important.html content="Please read through the instructions at least once completely before actually following them to avoid any problems because you missed something!" %}

1. Make sure your computer has working `adb`{% if device.install_method != 'heimdall' %} and `fastboot`{% endif %}. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
2. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.

{% if device.install_method != "" %}
{% capture recovery_install_method %}templates/recovery_install_{{ device.install_method }}.md{% endcapture %}
{% include {{ recovery_install_method }} %}
{% endif %}

## Installing LineageOS from recovery

{% if device.maintainers %}
1. Download the [LineageOS install package](https://download.lineageos.org/{{ device.codename }}) that you'd like to install or [build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) the package yourself.
{% else %}
1. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS install package.
{% endif %}
    * Optionally, download 3rd party application packages like [Google Apps]({{ "gapps.html" | relative_url }})
2. Place the LineageOS `.zip` package, as well as any other .zip packages on the root of `/sdcard`:
    * Using adb: `adb push filename.zip /sdcard/`
    * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing
        USB debugging is enabled.
3. If you aren't already in recovery, boot into recovery:
    * {{ device.recovery_boot }}
4. _(Optional, but recommended)_: Select the **Backup** button to create a backup.
5. Select **Wipe** and then **Advanced Wipe**.
6. Select *Cache*, *System* and *Data* partitions to be wiped and then **Swipe to Wipe**.
7. Go back to return to main menu, then select **Install**.
8. Navigate to `/sdcard`, and select the LineageOS `.zip` package.
9. Follow the on-screen prompts to install the package.
10. _(Optional)_: Install any additional packages using the same method.
    {% include note.html content="If you want any Google Apps on your device, you must follow this step **before** the first reboot!" %}
11. _(Optional)_: Root the device by installing the [LineageOS su add-on](https://download.lineageos.org/extras){% if device.architecture %} (use the `{{ device.architecture }}` package){% endif %} or using any other method you prefer.
12. Once installation has finished, return to the main menu, select **Reboot**, and then **System**.

## Get assistance

If you have any questions, or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS), or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
