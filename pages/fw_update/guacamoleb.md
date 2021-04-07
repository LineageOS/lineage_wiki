---
sidebar: home_sidebar
title: Update firmware on guacamoleb
folder: fw_update
permalink: /devices/guacamoleb/fw_update
device: guacamoleb
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
