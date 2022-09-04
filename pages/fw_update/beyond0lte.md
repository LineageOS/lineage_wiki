---
sidebar: home_sidebar
title: Update firmware on beyond0lte
folder: fw_update
permalink: /devices/beyond0lte/fw_update
device: beyond0lte
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
