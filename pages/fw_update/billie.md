---
sidebar: home_sidebar
title: Update firmware on billie
folder: fw_update
permalink: /devices/billie/fw_update/
device: billie
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
