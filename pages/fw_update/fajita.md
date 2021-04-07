---
sidebar: home_sidebar
title: Update firmware on fajita
folder: fw_update
permalink: /devices/fajita/fw_update
device: fajita
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
