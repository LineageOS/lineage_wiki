{% assign device = site.data.devices[page.device] %}
{% if device.install_method != "" %}
{% capture recovery_install_method %}templates/recovery_install_{{ device.install_method }}.md{% endcapture %}
{% include {{ recovery_install_method }} %}
{% endif %}

## Installing LineageOS from recovery

{% include important.html content="Please read through the instructions at least once completely before actually following them to avoid any problems because you missed something!" %}

1. Make sure your computer has working `adb`. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
{% if device.maintainers %}
2. Download the [LineageOS install package](https://download.lineageos.org/{{ device.codename }}) that you'd like to install or [build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) the package yourself.
{% else %}
2. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS install package.
{% endif %}
    * Optionally, download 3rd party application packages like [Google Apps]({{ "gapps.html" | relative_url }})
3. Place the LineageOS `.zip` package, as well as any other .zip packages on the root of `/sdcard`:
    * Using adb: `adb push filename.zip /sdcard/`
    * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing
        USB debugging is enabled.
4. If you aren't already in recovery, boot into recovery:
    * {{ device.recovery_boot }}
5. _(Optional, but recommended)_: Select the **Backup** button to create a backup.
6. Select **Wipe** and then **Advanced Wipe**.
7. Select *Cache*, *System* and *Data* partitions to be wiped and then **Swipe to Wipe**.
8. Go back to return to main menu, then select **Install**.
9. Navigate to `/sdcard`, and select the LineageOS `.zip` package.
10. Follow the on-screen prompts to install the package.
11. _(Optional)_: Install any additional packages using the same method.
12. _(Optional)_: Root the device by installing the [LineageOS su add-on](https://download.lineageos.org/extras){% if device.architecture %} (use the `{{ device.architecture }}` package){% endif %} or using any other method you prefer.
13. Once installation has finished, return to the main menu, select **Reboot**, and then **System**.

{% include note.html content="If you want any Google apps on your device, you have to do follow step 11 **before** the first reboot!" %}

## Get assistance

If you have any questions, or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS), or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
