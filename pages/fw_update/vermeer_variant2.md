---
sidebar: home_sidebar
title: Update firmware on vermeer
folder: fw_update
permalink: /devices/vermeer/fw_update/variant2/
device: vermeer_variant2
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
