---
sidebar: home_sidebar
title: Update firmware on ovaltine
folder: fw_update
permalink: /devices/ovaltine/fw_update/variant4/
device: ovaltine_variant4
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
