---
sidebar: home_sidebar
title: Update firmware on gta4l
folder: fw_update
permalink: /devices/gta4l/fw_update
device: gta4l
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
