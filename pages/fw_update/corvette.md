---
sidebar: home_sidebar
title: Update firmware on corvette
folder: fw_update
permalink: /devices/corvette/fw_update/
device: corvette
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
