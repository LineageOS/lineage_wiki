---
sidebar: home_sidebar
title: Update firmware on aston
folder: fw_update
permalink: /devices/aston/fw_update/variant2/
device: aston_variant2
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
