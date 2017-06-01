---
title: Upgrading LineageOS
sidebar: home_sidebar
permalink: upgrading.html
tags:
---

{% include important.html content="Please read through the instructions at least once completely before actually following them to avoid any problems because you missed something!" %}

{% capture upgrade_only %}These instructions only apply to version upgrades. If you wish to downgrade to an earlier version of LineageOS, follow your [device's]({{ "devices/" | relative_url }}) instructions for installing LineageOS the first time.{% endcapture %}
{% include warning.html content=upgrade_only %}

## Manually upgrading LineageOS

The updater app does not support upgrades from one version of LineageOS to another, and will block installation to any update for a different version. Upgrading manually requires similar steps to installing LineageOS for the first time.

1. Download the [LineageOS install package](https://download.lineageos.org/) that you'd like to install or [build]({{ "devices/" | relative_url }}) the package yourself.
    * Also download updated versions of any 3rd party application packages such as [Google Apps]({{ "gapps.html" | relative_url }}).
2. Place the LineageOS `.zip` package, as well as any other .zip packages on the root of `/sdcard`:
    * Using adb: `adb push filename.zip /sdcard/`
    * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, provided USB debugging is enabled.
3. If you aren't already in recovery, reboot into recovery.
4. _(Optional, but recommended)_: Select the **Backup** button to create a backup.
5. Return to the main menu, then select **Install**.
6. Navigate to `/sdcard`, and select the LineageOS `.zip` package.
7. Follow the on-screen prompts to install the package.
8. _(Optional)_: Install any additional packages using the same method.
    {% include note.html content="If you previously had any Google Apps package installed on your device, you must install an updated package **before** the first reboot! If you did not have Google Apps installed, you must wipe the **Data** partition (or perform a factory reset) to install them now." %}
9. _(Optional)_: Root the device by installing the [LineageOS su add-on](https://download.lineageos.org/extras) or using any other method you prefer.
10. Once installation has finished, return to the main menu, select **Reboot**, and then **System**.

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
