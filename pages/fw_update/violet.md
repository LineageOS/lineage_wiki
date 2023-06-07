---
sidebar: home_sidebar
title: Update firmware on violet
folder: fw_update
permalink: /devices/violet/fw_update
device: violet
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
