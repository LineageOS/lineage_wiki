---
sidebar: home_sidebar
title: Update firmware on baracus
folder: fw_update
permalink: /devices/baracus/fw_update/
device: baracus
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
