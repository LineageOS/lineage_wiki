---
sidebar: home_sidebar
title: Update firmware on lemonadep
folder: fw_update
permalink: /devices/lemonadep/fw_update
device: lemonadep
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
