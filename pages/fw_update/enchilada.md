---
sidebar: home_sidebar
title: Update firmware on enchilada
folder: fw_update
permalink: /devices/enchilada/fw_update
device: enchilada
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
