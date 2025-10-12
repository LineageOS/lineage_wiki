---
sidebar: home_sidebar
title: Update firmware on caihong
folder: fw_update
permalink: /devices/caihong/fw_update/variant2/
device: caihong_variant2
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
