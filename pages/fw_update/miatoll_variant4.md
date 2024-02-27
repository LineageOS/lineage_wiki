---
sidebar: home_sidebar
title: Update firmware on miatoll
folder: fw_update
permalink: /devices/miatoll/fw_update/varian4/
device: miatoll_variant4
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
