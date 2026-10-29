---
sidebar: home_sidebar
title: Update firmware on gts7fewifi
folder: fw_update
permalink: /devices/gts7fewifi/fw_update/
device: gts7fewifi
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
