---
sidebar: home_sidebar
title: Update firmware on hotdog
folder: fw_update
permalink: /devices/hotdog/fw_update
device: hotdog
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
