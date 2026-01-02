---
sidebar: home_sidebar
title: Update firmware on giuliac
folder: fw_update
permalink: /devices/giuliac/fw_update/
device: giuliac
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
