---
sidebar: home_sidebar
title: Update firmware on thyme
folder: fw_update
permalink: /devices/thyme/fw_update/
device: thyme
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
