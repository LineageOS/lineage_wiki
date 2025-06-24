---
sidebar: home_sidebar
title: Update firmware on fuxi
folder: fw_update
permalink: /devices/fuxi/fw_update/
device: fuxi
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
