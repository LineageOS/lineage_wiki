---
sidebar: home_sidebar
title: Install LineageOS on FP2
folder: install
permalink: /devices/FP2/install
device: FP2
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
