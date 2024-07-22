---
sidebar: home_sidebar
title: Update firmware on {codename}
folder: fw_update
permalink: /devices/{codename}/fw_update/
device: {codename}
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
