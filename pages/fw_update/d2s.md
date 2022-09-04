---
sidebar: home_sidebar
title: Update firmware on d2s
folder: fw_update
permalink: /devices/d2s/fw_update
device: d2s
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
