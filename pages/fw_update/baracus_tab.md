---
sidebar: home_sidebar
title: Update firmware on baracus_tab
folder: fw_update
permalink: /devices/baracus_tab/fw_update/
device: baracus_tab
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
