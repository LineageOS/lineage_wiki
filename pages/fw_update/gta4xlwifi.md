---
sidebar: home_sidebar
title: Update firmware on gta4xlwifi
folder: fw_update
permalink: /devices/gta4xlwifi/fw_update
device: gta4xlwifi
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
