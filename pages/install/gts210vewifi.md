---
sidebar: home_sidebar
title: Install LineageOS on gts210vewifi
folder: info
# name of the page (/{{permalink}}.html)
redirect_from: gts210vewifi_install.html
permalink: /devices/gts210vewifi/install
device: gts210vewifi
---
## Important note

{% include warning.html content="Your device must be on bootloader version `T813XXU2BQD1` or this will not work. In fact, if you try to use this method on an older version, you will almost certainly brick your device. Seriously don't try it. You can check what bootloader your device is on by running the command `getprop ro.bootloader` in `adb shell` or a terminal app." %}

{% include templates/device_install.md %}
