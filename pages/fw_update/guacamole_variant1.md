---
sidebar: home_sidebar
title: Update firmware on guacamole
folder: fw_update
permalink: /devices/guacamole/fw_update/variant1/
device: guacamole_variant1
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
