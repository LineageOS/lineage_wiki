---
sidebar: home_sidebar
title: Update firmware on xueing
folder: fw_update
permalink: /devices/xueying/fw_update/
device: xueying
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
