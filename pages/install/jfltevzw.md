---
sidebar: home_sidebar
title: Install Lineage on jfltevzw
folder: info
# name of the page (/{{permalink}}.html)
redirect_from: jfltevzw_install.html
permalink: /devices/jfltevzw/install
device: jfltevzw
---
## Important note

{% include warning.html content="Your device must be on bootloader version `I545VRUAMDK` or this will not work. In fact, if you try to use this method on a newer version, you will almost certainly brick your device. Seriously don't try it. Downgrading won't work either. If you've updated, a qfuse is already tripped and any attempt to downgrade will also result in a brick. You can check what bootloader your device is on by running the command `getprop ro.bootloader` in `adb shell` or a terminal app." %}

{% include templates/device_install.md %}
