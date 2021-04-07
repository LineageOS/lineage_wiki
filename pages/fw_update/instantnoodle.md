---
sidebar: home_sidebar
title: Update firmware on instantnoodle
folder: fw_update
permalink: /devices/instantnoodle/fw_update
device: instantnoodle
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
