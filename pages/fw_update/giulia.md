---
sidebar: home_sidebar
title: Update firmware on giulia
folder: fw_update
permalink: /devices/giulia/fw_update/
device: giulia
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
