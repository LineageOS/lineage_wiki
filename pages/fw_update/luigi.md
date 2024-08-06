---
sidebar: home_sidebar
title: Update firmware on luigi
folder: fw_update
permalink: /devices/luigi/fw_update/
device: luigi
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
