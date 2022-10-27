---
sidebar: home_sidebar
title: Update firmware on ursa
folder: fw_update
permalink: /devices/ursa/fw_update
device: ursa
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
