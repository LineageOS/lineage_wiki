---
sidebar: home_sidebar
title: Update firmware on beryllium
folder: fw_update
permalink: /devices/beryllium/fw_update
device: beryllium
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
