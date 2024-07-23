---
sidebar: home_sidebar
title: Update firmware on d1x
folder: fw_update
permalink: /devices/d1x/fw_update/
device: d1x
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
