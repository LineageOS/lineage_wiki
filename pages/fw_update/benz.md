---
sidebar: home_sidebar
title: Update firmware on benz
folder: fw_update
permalink: /devices/benz/fw_update/
device: benz
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
