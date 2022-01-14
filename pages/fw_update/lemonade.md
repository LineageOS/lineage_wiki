---
sidebar: home_sidebar
title: Update firmware on lemonade
folder: fw_update
permalink: /devices/lemonade/fw_update
device: lemonade
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
