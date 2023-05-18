---
sidebar: home_sidebar
title: Update firmware on davinci
folder: fw_update
permalink: /devices/davinci/fw_update/variant3
device: davinci_variant3
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
