---
sidebar: home_sidebar
title: Update firmware on sweet
folder: fw_update
permalink: /devices/sweet/fw_update/variant2
device: sweet_variant2
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
