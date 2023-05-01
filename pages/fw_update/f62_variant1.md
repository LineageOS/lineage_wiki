---
sidebar: home_sidebar
title: Update firmware on f62
folder: fw_update
permalink: /devices/f62/fw_update/variant1
device: f62_variant1
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
