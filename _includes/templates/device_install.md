## Setting up `adb`
To use `adb` with your device, you'll need to enable developer options and USB debugging:

1. On your device, open Settings, and select "About".
2. Tap on "Build number" seven times.
3. Go back, and select "Developer options".
4. Scroll down, and check the "Android debugging" entry under "Debugging".
5. Plug your device into your computer.
6. On the computer, open up a terminal/command prompt and type `adb devices`.
7. A dialog should show on your device, asking you to allow usb debugging. Check "always allow", and choose "OK".

{% if site.data.devices[page.device].install_method != "" %}
{% capture recovery_install_method %}templates/recovery_install_{{site.data.devices[page.device].install_method}}.md{% endcapture %}
{% include {{ recovery_install_method }} %}
{% endif %}

## Installing LineageOS from recovery

{% if site.data.devices[page.device].channels %}
1. Download the [LineageOS install package](https://download.lineageos.org/{{ site.data.devices[page.device].codename }}) that you'd like to install or [build]({{ "devices/" | append: site.data.devices[page.device].codename | append: "/build" | relative_url }}) the package yourself.
{% else %}
1. [Build]({{ "devices/" | append: site.data.devices[page.device].codename | append: "/build" | relative_url }}) a LineageOS install package.
{% endif %}
    * Optionally, download 3rd party application packages like [Google Apps]({{ "gapps.html" | relative_url }})
2. Make sure your computer has working `adb`. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
3. Place the LineageOS `.zip` package, as well as any other .zip packages on the root of `/sdcard`:
    * Using adb: `adb push filename.zip /sdcard/`
    * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing
        USB debugging is enabled.
4. If you aren't already in recovery, boot into recovery:
    * {{ site.data.devices[page.device].recovery_boot }}
5. _(Optional, but recommended)_: Select the **Backup** button to create a backup.
6. Select **Wipe** and then **Advanced Wipe**.
7. Select *Cache*, *System* and *Data* partitions to be wiped and then **Swipe to Wipe**.
8. Go back to return to main menu, then select **Install**.
9. Navigate to `/sdcard`, and select the LineageOS `.zip` package.
10. Follow the on-screen prompts to install the package.
11. _(Optional)_: Install any additional packages using the same method.
12. _(Optional)_: Root the device by installing the [LineageOS su add-on](https://download.lineageos.org/extras) or using any other method you prefer.
13. Once installation has finished, return to the main menu, select **Reboot**, and then **System**.

## Get assistance

If you have any questions, or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS), or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
