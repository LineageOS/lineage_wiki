---
sidebar: home_sidebar
title: Update firmware on oscar
folder: fw_update
permalink: /devices/oscar/fw_update/variant1/
device: oscar_variant1
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
