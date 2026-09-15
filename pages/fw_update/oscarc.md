---
sidebar: home_sidebar
title: Update firmware on oscarc
folder: fw_update
permalink: /devices/oscarc/fw_update/
device: oscarc
---
{% assign device = site.data.devices[page.device] %}
{% capture path %}templates/device_specific/{{ device.firmware_update }}.md{% endcapture %}
{% include {{ path }} %}
