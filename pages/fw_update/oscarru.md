---
sidebar: home_sidebar
title: Update firmware on oscarru
folder: fw_update
permalink: /devices/oscarru/fw_update/
device: oscarru
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
