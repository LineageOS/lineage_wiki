---
sidebar: home_sidebar
title: Update firmware on polaris
folder: fw_update
permalink: /devices/polaris/fw_update
device: polaris
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
