---
sidebar: home_sidebar
title: Update firmware on munch
folder: fw_update
permalink: /devices/munch/fw_update/variant2/
device: munch_variant2
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
