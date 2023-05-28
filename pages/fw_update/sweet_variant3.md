---
sidebar: home_sidebar
title: Update firmware on sweet
folder: fw_update
permalink: /devices/sweet/fw_update/variant3
device: sweet_variant3
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
