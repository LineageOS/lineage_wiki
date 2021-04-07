---
sidebar: home_sidebar
title: Update firmware on instantnoodlep
folder: fw_update
permalink: /devices/instantnoodlep/fw_update
device: instantnoodlep
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
