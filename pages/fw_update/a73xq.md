---
sidebar: home_sidebar
title: Update firmware on a73xq
folder: fw_update
permalink: /devices/a73xq/fw_update
device: a73xq
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
