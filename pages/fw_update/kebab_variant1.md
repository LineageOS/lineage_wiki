---
sidebar: home_sidebar
title: Update firmware on kebab
folder: fw_update
permalink: /devices/kebab/fw_update/variant1/
device: kebab_variant1
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
