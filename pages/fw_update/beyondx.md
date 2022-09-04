---
sidebar: home_sidebar
title: Update firmware on beyondx
folder: fw_update
permalink: /devices/beyondx/fw_update
device: beyondx
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
