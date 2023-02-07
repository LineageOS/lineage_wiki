---
sidebar: home_sidebar
title: Update firmware on alioth
folder: fw_update
permalink: /devices/alioth/variant1/fw_update
device: alioth_variant1
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
