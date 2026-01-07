---
sidebar: home_sidebar
title: Update firmware on lexus
folder: fw_update
permalink: /devices/lexus/fw_update/
device: lexus
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
