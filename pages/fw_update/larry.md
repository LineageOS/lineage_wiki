---
sidebar: home_sidebar
title: Update firmware on larry
folder: fw_update
permalink: /devices/larry/fw_update/
device: larry
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
