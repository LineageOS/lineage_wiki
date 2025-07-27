---
sidebar: home_sidebar
title: Update firmware on Pong
folder: fw_update
permalink: /devices/Pong/fw_update/
device: Pong
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
