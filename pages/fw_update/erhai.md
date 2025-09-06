---
sidebar: home_sidebar
title: Update firmware on erhai
folder: fw_update
permalink: /devices/erhai/fw_update/
device: erhai
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
