---
sidebar: home_sidebar
title: Update firmware on gta4xl
folder: fw_update
permalink: /devices/gta4xl/fw_update
device: gta4xl
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
