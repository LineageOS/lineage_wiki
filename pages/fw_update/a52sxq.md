---
sidebar: home_sidebar
title: Update firmware on a52sxq
folder: fw_update
permalink: /devices/a52sxq/fw_update
device: a52sxq
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}