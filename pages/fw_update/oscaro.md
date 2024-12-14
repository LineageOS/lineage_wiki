---
sidebar: home_sidebar
title: Update firmware on oscaro
folder: fw_update
permalink: /devices/oscaro/fw_update/
device: oscaro
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
