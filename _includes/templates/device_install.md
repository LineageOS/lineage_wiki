{% if site.data.devices[page.device].install_method != "" %}
{% capture recovery_install_method %}templates/recovery_install_{{site.data.devices[page.device].install_method}}.md{% endcapture %}
{% include {{ recovery_install_method }} %}
{% endif %}

## Installing LineageOS from recovery

1. Make sure your computer has working [adb](https://developer.android.com/studio/command-line/adb.html).
2. Download the [LineageOS install package](https://download.lineageos.org/{{ site.data.devices[page.device].codename }}) that you'd like to install.
    * Optionally, download 3rd party application packages like [Google Apps](/gapps.html)
3. Place the LineageOS `.zip` package, as well as any other .zip packages on the root of `/sdcard`:
    * Using adb: `adb push filename.zip /sdcard/`
    * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing
        USB debugging is enabled.
4. If you aren't already in recovery, boot into recovery:
    * {{ site.data.devices[page.device].recovery_boot }}
5. _(Optional, but recommended)_: Select the **Backup** button to create a backup.
6. Select **Wipe** and then **Factory Reset**.
7. Select **Install**.
8. Navigate to `/sdcard`, and select the LineageOS `.zip` package.
9. Follow the on-screen prompts to install the package.
10. _(Optional)_: Install any additional packages using the same method.
11. Once installation has finished, return to the main menu, select **Reboot**, and then **System**.

## Get assistance

If you have any questions, or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS), or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
