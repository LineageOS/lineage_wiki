---
sidebar: home_sidebar
title: Update firmware on garnet
folder: fw_update
permalink: /devices/garnet/fw_update/variant1/
device: garnet_variant1
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
