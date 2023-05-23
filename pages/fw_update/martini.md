---
sidebar: home_sidebar
title: Update firmware on martini
folder: fw_update
permalink: /devices/martini/fw_update
device: martini
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
