---
sidebar: home_sidebar
title: Update firmware on m52xq
folder: fw_update
permalink: /devices/m52xq/fw_update
device: m52xq
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}