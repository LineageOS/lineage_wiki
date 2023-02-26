---
sidebar: home_sidebar
title: Update firmware on surya
folder: fw_update
permalink: /devices/surya/fw_update
device: surya
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
