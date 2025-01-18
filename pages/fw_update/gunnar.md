---
sidebar: home_sidebar
title: Update firmware on gunnar
folder: fw_update
permalink: /devices/gunnar/fw_update/
device: gunnar
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
