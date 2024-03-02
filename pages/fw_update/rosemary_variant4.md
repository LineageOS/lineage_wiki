---
sidebar: home_sidebar
title: Update firmware on rosemary
folder: fw_update
permalink: /devices/rosemary/fw_update/variant4/
device: rosemary_variant4
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
