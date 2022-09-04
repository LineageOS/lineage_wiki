---
sidebar: home_sidebar
title: Update firmware on d2x
folder: fw_update
permalink: /devices/d2x/fw_update
device: d2x
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
