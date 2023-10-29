---
sidebar: home_sidebar
title: Update firmware on perseus
folder: fw_update
permalink: /devices/perseus/fw_update
device: perseus
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
