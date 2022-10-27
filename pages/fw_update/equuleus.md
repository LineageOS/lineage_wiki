---
sidebar: home_sidebar
title: Update firmware on equuleus
folder: fw_update
permalink: /devices/equuleus/fw_update
device: equuleus
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
