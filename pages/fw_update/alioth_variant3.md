---
sidebar: home_sidebar
title: Update firmware on alioth
folder: fw_update
permalink: /devices/alioth/fw_update/variant3
device: alioth_variant3
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
