---
sidebar: home_sidebar
title: Update firmware on vayu
folder: fw_update
permalink: /devices/vayu/fw_update
device: vayu
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
