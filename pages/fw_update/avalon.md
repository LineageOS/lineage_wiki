---
sidebar: home_sidebar
title: Update firmware on avalon
folder: fw_update
permalink: /devices/avalon/fw_update/
device: avalon
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
