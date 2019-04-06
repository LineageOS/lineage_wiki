---
title: Upgrading LineageOS
sidebar: home_sidebar
permalink: upgrading.html
tags:
---

{% include alerts/important.html content="Please read through the instructions at least once completely before actually following them to avoid any problems because you missed something!" %}

{% capture upgrade_only %}These instructions only apply to version upgrades. If you wish to downgrade to an earlier version of LineageOS, follow your [device's]({{ "devices/" | relative_url }}) instructions for installing LineageOS the first time.{% endcapture %}
{% include alerts/warning.html content=upgrade_only %}

## Manually upgrading LineageOS

The updater app does not support upgrades from one version of LineageOS to another, and will block installation to any update for a different version. Upgrading manually requires similar steps to installing LineageOS for the first time.

1. Make sure your computer has working `adb`{% unless device.install_method == 'heimdall' or device.install_method == 'dd' %} and `fastboot`{% endunless %}. Setup instructions can be found [here]({
{ "adb_fastboot_guide.html" | relative_url }}).
2. On the host machine, download the [LineageOS install package](https://download.lineageos.org/) that you'd like to install or [build]({{ "devices/" | relative_url }}) the package yourself.
    * Also download updated versions of any 3rd party application packages such as [Google Apps]({{ "gapps.html" | relative_url }}).
3. Run `adb reboot sideload`.
4. Run `adb sideload /path/to/zip` (inserting the path to your LineageOS package).
5. Run `adb reboot sideload` once more.
8. _(Optional)_: Install any additional packages using the same method.
    {% include alerts/note.html content="If you previously had any Google Apps package installed on your device, you must install an updated package **before** the first boot of Android! If you did not have Google Apps installed, you must wipe the **Data** partition (or perform a factory reset) to install them." %}
9. _(Optional)_: Root the device by installing the [LineageOS su add-on](https://download.lineageos.org/extras) or using any other method you prefer.
10. Once all installations are finished, run 'adb reboot'..

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
