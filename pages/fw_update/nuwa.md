---
sidebar: home_sidebar
title: Update firmware on nuwa
folder: fw_update
permalink: /devices/nuwa/fw_update/
device: nuwa
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
