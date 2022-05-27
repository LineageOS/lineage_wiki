---
sidebar: home_sidebar
title: Update firmware on dre
folder: fw_update
permalink: /devices/dre/fw_update
device: dre
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
