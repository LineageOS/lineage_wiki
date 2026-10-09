---
sidebar: home_sidebar
title: Update firmware on iceland
folder: fw_update
permalink: /devices/iceland/fw_update/variant2/
device: iceland_variant2
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
