---
sidebar: home_sidebar
title: Update firmware on r8q
folder: fw_update
permalink: /devices/r8q/fw_update/variant2/
device: r8q_variant2
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
