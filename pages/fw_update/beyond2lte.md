---
sidebar: home_sidebar
title: Update firmware on beyond2lte
folder: fw_update
permalink: /devices/beyond2lte/fw_update
device: beyond2lte
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
