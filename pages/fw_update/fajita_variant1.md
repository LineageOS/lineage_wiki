---
sidebar: home_sidebar
title: Update firmware on fajita
folder: fw_update
permalink: /devices/fajita/fw_update/variant1/
device: fajita_variant1
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
