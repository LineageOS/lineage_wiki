---
sidebar: home_sidebar
title: Update firmware on ebba
folder: fw_update
permalink: /devices/ebba/fw_update/
device: ebba
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
