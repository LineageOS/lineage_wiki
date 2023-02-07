---
sidebar: home_sidebar
title: Update firmware on alioth
folder: fw_update
permalink: /devices/alioth/variant3/fw_update
device: alioth_variant3
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
