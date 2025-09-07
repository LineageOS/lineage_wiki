---
sidebar: home_sidebar
title: Update firmware on waffle
folder: fw_update
permalink: /devices/waffle/fw_update/
device: waffle
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
