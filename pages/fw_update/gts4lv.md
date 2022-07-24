---
sidebar: home_sidebar
title: Update firmware on gts4lv
folder: fw_update
permalink: /devices/gts4lv/fw_update
device: gts4lv
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
