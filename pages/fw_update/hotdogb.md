---
sidebar: home_sidebar
title: Update firmware on hotdogb
folder: fw_update
permalink: /devices/hotdogb/fw_update
device: hotdogb
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
