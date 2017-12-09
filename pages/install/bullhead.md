---
sidebar: home_sidebar
title: Install LineageOS on bullhead
folder: info
# name of the page (/{{permalink}}.html)
redirect_from: bullhead_install.html
permalink: /devices/bullhead/install
device: bullhead
---
## Device specific requirements

{% capture stock_version %}
After the final reboot, if your device hangs at the very first screen,
where just "Google" is displayed, this can be fixed by installing the
[latest major.minor version of stock
android](https://developers.google.com/android/images) that your version
of LineageOS is based on and then installing LineageOS again.
{% endcapture %}
{% include warning.html content=stock_version %}

{% include templates/device_install.md %}
