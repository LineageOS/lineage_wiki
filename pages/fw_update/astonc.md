---
sidebar: home_sidebar
title: Update firmware on astonc
folder: fw_update
permalink: /devices/astonc/fw_update/
device: astonc
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
