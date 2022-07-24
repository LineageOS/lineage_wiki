---
sidebar: home_sidebar
title: Update firmware on gts4lvwifi
folder: fw_update
permalink: /devices/gts4lvwifi/fw_update
device: gts4lvwifi
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
