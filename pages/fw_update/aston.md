---
sidebar: home_sidebar
title: Update firmware on aston
folder: fw_update
permalink: /devices/aston/fw_update/
device: aston
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
