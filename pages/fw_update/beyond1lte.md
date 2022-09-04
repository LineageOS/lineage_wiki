---
sidebar: home_sidebar
title: Update firmware on beyond1lte
folder: fw_update
permalink: /devices/beyond1lte/fw_update
device: beyond1lte
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
