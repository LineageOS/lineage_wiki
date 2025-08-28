---
sidebar: home_sidebar
title: Update firmware on instantnoodle
folder: fw_update
permalink: /devices/instantnoodle/fw_update/variant1/
device: instantnoodle_variant1
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
