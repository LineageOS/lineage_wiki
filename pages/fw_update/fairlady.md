---
sidebar: home_sidebar
title: Update firmware on fairlady
folder: fw_update
permalink: /devices/fairlady/fw_update/
device: fairlady
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
