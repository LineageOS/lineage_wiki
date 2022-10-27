---
sidebar: home_sidebar
title: Update firmware on dipper
folder: fw_update
permalink: /devices/dipper/fw_update
device: dipper
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
