---
sidebar: home_sidebar
title: Update firmware on avicii
folder: fw_update
permalink: /devices/avicii/fw_update
device: avicii
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
