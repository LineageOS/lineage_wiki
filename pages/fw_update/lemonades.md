---
sidebar: home_sidebar
title: Update firmware on lemonades
folder: fw_update
permalink: /devices/lemonades/fw_update
device: lemonades
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
