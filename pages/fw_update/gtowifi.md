---
sidebar: home_sidebar
title: Update firmware on gtowifi
folder: fw_update
permalink: /devices/gtowifi/fw_update
device: gtowifi
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
