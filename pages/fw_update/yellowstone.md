---
sidebar: home_sidebar
title: Update firmware on yellowstone
folder: fw_update
permalink: /devices/yellowstone/fw_update
device: yellowstone
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
