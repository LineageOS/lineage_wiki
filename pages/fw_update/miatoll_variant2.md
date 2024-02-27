---
sidebar: home_sidebar
title: Update firmware on miatoll
folder: fw_update
permalink: /devices/miatoll/fw_update/variant2/
device: miatoll_variant2
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
